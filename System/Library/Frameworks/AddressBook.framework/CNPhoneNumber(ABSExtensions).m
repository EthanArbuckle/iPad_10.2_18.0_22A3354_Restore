@implementation CNPhoneNumber(ABSExtensions)

+ (id)fullyQualifiedStringForStringValue:()ABSExtensions countryCode:
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191D0] + 16))())
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:countryCode:", v5, v6);
    objc_msgSend(v8, "unformattedInternationalStringValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
