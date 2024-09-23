@implementation AAUIOBInheritanceInviteMessageViewModel

- (AAUIOBInheritanceInviteMessageViewModel)initWithBeneficiaryName:(id)a3
{
  AAUIOBInheritanceInviteMessageViewModel *v3;
  AAUIOBInheritanceInviteMessageViewModel *v4;
  AAUIMessageBubbleView *v5;
  void *v6;
  uint64_t v7;
  UIView *contentView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAUIOBInheritanceInviteMessageViewModel;
  v3 = -[AAOBInheritanceInviteMessageModel initWithBeneficiaryName:](&v10, sel_initWithBeneficiaryName_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_contentViewLayout = 2;
    v5 = [AAUIMessageBubbleView alloc];
    -[AAOBInheritanceInviteMessageModel bubbleText](v4, "bubbleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AAUIMessageBubbleView initWithText:](v5, "initWithText:", v6);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;

  }
  return v4;
}

- (AAUIOBInheritanceInviteMessageViewModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4
{
  AAUIOBInheritanceInviteMessageViewModel *v4;
  AAUIOBInheritanceInviteMessageViewModel *v5;
  AAUIMessageBubbleView *v6;
  void *v7;
  uint64_t v8;
  UIView *contentView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AAUIOBInheritanceInviteMessageViewModel;
  v4 = -[AAOBInheritanceInviteMessageModel initWithType:recipientHandle:](&v11, sel_initWithType_recipientHandle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_contentViewLayout = 2;
    v6 = [AAUIMessageBubbleView alloc];
    -[AAOBInheritanceInviteMessageModel bubbleText](v5, "bubbleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AAUIMessageBubbleView initWithText:](v6, "initWithText:", v7);
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v8;

  }
  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
