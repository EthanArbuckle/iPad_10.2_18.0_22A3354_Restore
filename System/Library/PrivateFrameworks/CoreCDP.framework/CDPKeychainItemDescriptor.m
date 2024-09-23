@implementation CDPKeychainItemDescriptor

+ (id)recoveryKeyDescriptorForAltDSID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[CDPKeychainItemDescriptor recoveryKeyDescriptor](CDPKeychainItemDescriptor, "recoveryKeyDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccount:", v3);

  return v4;
}

+ (id)recoveryKeyDescriptor
{
  CDPKeychainItemDescriptor *v2;

  v2 = objc_alloc_init(CDPKeychainItemDescriptor);
  -[AAFKeychainItemDescriptor setItemClass:](v2, "setItemClass:", 1);
  -[AAFKeychainItemDescriptor setService:](v2, "setService:", CFSTR("com.apple.cdpd.rk.keychain_service"));
  -[AAFKeychainItemDescriptor setAccessGroup:](v2, "setAccessGroup:", CFSTR("com.apple.cdp.rk"));
  -[AAFKeychainItemDescriptor setItemAccessible:](v2, "setItemAccessible:", 1);
  -[AAFKeychainItemDescriptor setInvisible:](v2, "setInvisible:", 1);
  -[AAFKeychainItemDescriptor setSynchronizable:](v2, "setSynchronizable:", 1);
  -[AAFKeychainItemDescriptor setUseDataProtection:](v2, "setUseDataProtection:", 2);
  -[AAFKeychainItemDescriptor setSysBound:](v2, "setSysBound:", 2);
  return v2;
}

@end
