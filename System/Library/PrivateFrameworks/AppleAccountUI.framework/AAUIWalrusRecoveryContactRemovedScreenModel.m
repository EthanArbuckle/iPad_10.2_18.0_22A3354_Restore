@implementation AAUIWalrusRecoveryContactRemovedScreenModel

- (AAUIWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  AAUIWalrusRecoveryContactRemovedScreenModel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIWalrusRecoveryContactRemovedScreenModel;
  result = -[AAWalrusRecoveryContactRemovedScreenModel initWithHasRecoveryContact:hasRecoveryKey:](&v5, sel_initWithHasRecoveryContact_hasRecoveryKey_, a3, a4);
  if (result)
    result->_contentViewLayout = 2;
  return result;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
