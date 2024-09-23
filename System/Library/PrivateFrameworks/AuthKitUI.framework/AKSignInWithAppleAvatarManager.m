@implementation AKSignInWithAppleAvatarManager

+ (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4
{
  id v5;
  objc_class *ASAccountSharingGroupMemberDataManagerClass;
  id v7;
  void *v8;

  v5 = a3;
  ASAccountSharingGroupMemberDataManagerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAccountSharingGroupMemberDataManagerClass)
    ASAccountSharingGroupMemberDataManagerClass = (objc_class *)get_ASAccountSharingGroupMemberDataManagerClass();
  v7 = objc_alloc_init(ASAccountSharingGroupMemberDataManagerClass);
  objc_msgSend(v7, "avatarImageForUserHandle:diameter:", v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3
{
  objc_class *ASAccountSharingGroupMemberDataManagerClass;
  id v5;
  void *v6;

  ASAccountSharingGroupMemberDataManagerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAccountSharingGroupMemberDataManagerClass)
    ASAccountSharingGroupMemberDataManagerClass = (objc_class *)get_ASAccountSharingGroupMemberDataManagerClass();
  v5 = objc_alloc_init(ASAccountSharingGroupMemberDataManagerClass);
  objc_msgSend(v5, "avatarImageForPrimaryAccountOwnerWithDiameter:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
