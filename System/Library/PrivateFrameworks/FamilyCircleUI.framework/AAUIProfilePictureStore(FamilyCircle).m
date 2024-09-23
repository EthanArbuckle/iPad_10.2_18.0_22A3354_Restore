@implementation AAUIProfilePictureStore(FamilyCircle)

- (id)fa_profilePictureForFamilyMember:()FamilyCircle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFirstName:", v6);

  objc_msgSend(v4, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastName:", v7);

  objc_msgSend(v4, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonID:", v8);

  objc_msgSend(v4, "appleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAppleID:", v9);
  objc_msgSend(a1, "profilePictureForFamilyMember:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
