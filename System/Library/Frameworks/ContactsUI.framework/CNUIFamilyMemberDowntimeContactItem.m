@implementation CNUIFamilyMemberDowntimeContactItem

- (CNUIFamilyMemberDowntimeContactItem)initWithContact:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  CNUIFamilyMemberDowntimeContactItem *v9;
  CNUIFamilyMemberDowntimeContactItem *v10;
  CNUIFamilyMemberDowntimeContactItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIFamilyMemberDowntimeContactItem;
  v9 = -[CNUIFamilyMemberDowntimeContactItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_label, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
