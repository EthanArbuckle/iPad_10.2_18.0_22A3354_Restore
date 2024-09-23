@implementation MFQuickReplyAnimationContext

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFQuickReplyAnimationContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (OS_os_log *)(id)log_log_10;
}

void __35__MFQuickReplyAnimationContext_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

- (MFQuickReplyAnimationContext)initWithInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4 compositionSnapshot:(id)a5 buttonsSnapshot:(id)a6 backgroundSnapshot:(id)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v16;
  id v17;
  id v18;
  MFQuickReplyAnimationContext *v19;
  MFQuickReplyAnimationContext *v20;
  objc_super v22;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MFQuickReplyAnimationContext;
  v19 = -[MFQuickReplyAnimationContext init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_insets.top = top;
    v19->_insets.left = left;
    v19->_insets.bottom = bottom;
    v19->_insets.right = right;
    v19->_cornerRadius = a4;
    objc_storeStrong((id *)&v19->_compositionSnapshot, a5);
    objc_storeStrong((id *)&v20->_buttonsSnapshot, a6);
    objc_storeStrong((id *)&v20->_backgroundSnapshot, a7);
  }

  return v20;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIView)compositionSnapshot
{
  return self->_compositionSnapshot;
}

- (void)setCompositionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_compositionSnapshot, a3);
}

- (UIView)buttonsSnapshot
{
  return self->_buttonsSnapshot;
}

- (void)setButtonsSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsSnapshot, a3);
}

- (UIView)backgroundSnapshot
{
  return self->_backgroundSnapshot;
}

- (void)setBackgroundSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSnapshot, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundSnapshot, 0);
  objc_storeStrong((id *)&self->_buttonsSnapshot, 0);
  objc_storeStrong((id *)&self->_compositionSnapshot, 0);
}

@end
