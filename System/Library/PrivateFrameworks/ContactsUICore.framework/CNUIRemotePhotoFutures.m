@implementation CNUIRemotePhotoFutures

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (id)photoForContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D13BE8];
  v5 = a3;
  objc_msgSend(v4, "standardPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "photoForContact:userDefaults:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D13A68];
  +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 402);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithError:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)photoForContact:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    objc_msgSend(v6, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    {
      v10 = (void *)MEMORY[0x1E0D13A68];
      +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 402);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "futureWithError:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "localPhotoForEmailAddresses:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "userHasOptedInToPreference:", CFSTR("com.apple.private.contacts.directory-services-images"));
      v17 = MEMORY[0x1E0C809B0];
      if (v16)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_2;
        v27[3] = &unk_1EA604250;
        v29 = a1;
        v28 = v9;
        objc_msgSend(v11, "recover:", v27);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v18;
      }
      if ((objc_msgSend(v7, "userHasOptedInToPreference:", CFSTR("com.apple.private.contacts.gravatar-images")) & 1) != 0
        || objc_msgSend(v7, "userHasOptedInToPreference:", CFSTR("ABUseGravatarImages")))
      {
        v21 = v17;
        v22 = 3221225472;
        v23 = __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_3;
        v24 = &unk_1EA604250;
        v26 = a1;
        v25 = v9;
        objc_msgSend(v11, "recover:", &v21);
        v19 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v19;
      }
      objc_msgSend(v11, "recover:", &__block_literal_global_9, v21, v22, v23, v24);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v12;

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D13A68];
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 402);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (id)localPhotoForEmailAddresses:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D13A68];
  +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 402);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "directoryServicesPhotoForEmailAddresses:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "gravatarPhotoForEmailAddresses:", *(_QWORD *)(a1 + 32));
}

+ (id)directoryServicesPhotoForEmailAddresses:(id)a3
{
  return +[_CNUIDirectoryServicesPhotoFuture photoForEmailAddresses:](_CNUIDirectoryServicesPhotoFuture, "photoForEmailAddresses:", a3);
}

+ (id)gravatarPhotoForEmailAddresses:(id)a3
{
  return +[_CNUIGravatarPhotoFuture photoForEmailAddresses:](_CNUIGravatarPhotoFuture, "photoForEmailAddresses:", a3);
}

@end
