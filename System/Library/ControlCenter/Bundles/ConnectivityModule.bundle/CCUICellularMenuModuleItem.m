@implementation CCUICellularMenuModuleItem

- (id)indicatorView
{
  CCUICellularMenuModuleItemIndicatorView *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v3 = objc_alloc_init(CCUICellularMenuModuleItemIndicatorView);
  objc_msgSend_indicatorLabel(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortLabel(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(v6, v10, (uint64_t)v9);

  return v3;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (void)setShortLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLabel, 0);
}

@end
