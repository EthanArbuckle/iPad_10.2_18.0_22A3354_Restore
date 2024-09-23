@implementation CNUIFamilyMemberDowntimeContactSection

- (CNUIFamilyMemberDowntimeContactSection)initWithContactItems:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  CNUIFamilyMemberDowntimeContactSection *v9;
  CNUIFamilyMemberDowntimeContactSection *v10;
  uint64_t v11;
  NSString *title;
  CNUIFamilyMemberDowntimeContactSection *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUIFamilyMemberDowntimeContactSection;
  v9 = -[CNUIFamilyMemberDowntimeContactSection init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactItems, a3);
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contactItems, 0);
}

@end
