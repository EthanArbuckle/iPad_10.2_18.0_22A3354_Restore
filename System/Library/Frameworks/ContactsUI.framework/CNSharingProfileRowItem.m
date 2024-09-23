@implementation CNSharingProfileRowItem

- (CNSharingProfileRowItem)initWithLabel:(id)a3 accessoryView:(id)a4
{
  id v7;
  id v8;
  CNSharingProfileRowItem *v9;
  CNSharingProfileRowItem *v10;
  CNSharingProfileRowItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfileRowItem;
  v9 = -[CNSharingProfileRowItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_accessoryView, a4);
    v11 = v10;
  }

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
