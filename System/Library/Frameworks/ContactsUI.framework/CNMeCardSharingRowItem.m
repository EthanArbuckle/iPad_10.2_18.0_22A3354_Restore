@implementation CNMeCardSharingRowItem

- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4
{
  return -[CNMeCardSharingRowItem initWithLabel:accessoryView:confirmationHandler:](self, "initWithLabel:accessoryView:confirmationHandler:", a3, a4, 0);
}

- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4 confirmationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNMeCardSharingRowItem *v12;
  CNMeCardSharingRowItem *v13;
  uint64_t v14;
  id confirmationHandler;
  CNMeCardSharingRowItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNMeCardSharingRowItem;
  v12 = -[CNMeCardSharingRowItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a3);
    objc_storeStrong((id *)&v13->_accessoryView, a4);
    v14 = objc_msgSend(v11, "copy");
    confirmationHandler = v13->_confirmationHandler;
    v13->_confirmationHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (NSString)label
{
  return self->_label;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (id)confirmationHandler
{
  return self->_confirmationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmationHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
