@implementation AAOBModelHelper

+ (id)contactInfoForHandle:(id)a3
{
  id v3;
  AAContactsManager *v4;
  void *v5;
  AALocalContactInfo *v6;

  v3 = a3;
  v4 = objc_alloc_init(AAContactsManager);
  -[AAContactsManager contactForHandle:](v4, "contactForHandle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AALocalContactInfo initWithHandle:contact:]([AALocalContactInfo alloc], "initWithHandle:contact:", v3, v5);

  return v6;
}

+ (id)firstNameForLocalContactInfo:(id)a3
{
  return (id)objc_msgSend(a3, "firstNameOrHandleForDisplay");
}

@end
