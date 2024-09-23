@implementation CNContactListStyleProvider

+ (id)contactListStyleWithContactStyle:(id)a3
{
  id v3;
  CNContactListStyleWrapperProvider *v4;

  v3 = a3;
  v4 = -[CNContactListStyleWrapperProvider initWithContactStyle:]([CNContactListStyleWrapperProvider alloc], "initWithContactStyle:", v3);

  return v4;
}

+ (id)contactListStyle
{
  return objc_alloc_init(CNContactListStyleDefaultProvider);
}

@end
