@implementation CUIKInterface

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_30);
  return (id)shared_interface;
}

- (BOOL)usesLargeTextLayout
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  -[CUIKInterface preferredContentSizeCategoryOrOverride](self, "preferredContentSizeCategoryOrOverride");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (BOOL)interfaceIsLeftToRight
{
  return -[CUIKInterface layoutDirectionOrOverride](self, "layoutDirectionOrOverride") == 0;
}

- (id)preferredContentSizeCategoryOrOverride
{
  void *v3;
  SEL v4;
  NSString *v5;

  if (-[CUIKInterface isCurrentProcessAnApplicationExtension](self, "isCurrentProcessAnApplicationExtension"))
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0DC3470], "performSelector:", sel_sharedApplication);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(CFSTR("preferredContentSizeCategory"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    v5 = self->_overridePreferredContentSizeCategory;
    return v5;
  }
  ((void (*)(void *, SEL))objc_msgSend(v3, "methodForSelector:", v4))(v3, v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)layoutDirectionOrOverride
{
  void *v3;
  SEL v4;
  int64_t v5;

  if (!-[CUIKInterface isCurrentProcessAnApplicationExtension](self, "isCurrentProcessAnApplicationExtension"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "performSelector:", sel_sharedApplication);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = NSSelectorFromString(CFSTR("userInterfaceLayoutDirection"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = ((uint64_t (*)(void *, SEL))objc_msgSend(v3, "methodForSelector:", v4))(v3, v4);

      return v5;
    }

  }
  return self->_overrideLayoutDirection;
}

- (BOOL)isCurrentProcessAnApplicationExtension
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionInfoForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_opt_respondsToSelector();
  else
    v3 = 0;

  return v3 & 1;
}

void __23__CUIKInterface_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_interface;
  shared_interface = v0;

}

- (CUIKInterface)init
{
  CUIKInterface *v2;
  CUIKInterface *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIKInterface;
  v2 = -[CUIKInterface init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_overrideLayoutDirection = 0;
    objc_storeStrong((id *)&v2->_overridePreferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
  }
  return v3;
}

- (void)setLayoutDirectionOverride:(int64_t)a3
{
  self->_overrideLayoutDirection = a3;
}

- (void)setPreferredContentSizeCategoryOverride:(id)a3
{
  objc_storeStrong((id *)&self->_overridePreferredContentSizeCategory, a3);
}

- (int64_t)overrideLayoutDirection
{
  return self->_overrideLayoutDirection;
}

- (void)setOverrideLayoutDirection:(int64_t)a3
{
  self->_overrideLayoutDirection = a3;
}

- (NSString)overridePreferredContentSizeCategory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOverridePreferredContentSizeCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePreferredContentSizeCategory, 0);
}

@end
