@implementation CRKMeCardUserProvider

- (CRKMeCardUserProvider)init
{
  void *v3;
  CRKMeCardUserProvider *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKMeCardUserProvider initWithContactsPrimitives:](self, "initWithContactsPrimitives:", v3);

  return v4;
}

- (CRKMeCardUserProvider)initWithContactsPrimitives:(id)a3
{
  id v5;
  CRKMeCardUserProvider *v6;
  CRKMeCardUserProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKMeCardUserProvider;
  v6 = -[CRKMeCardUserProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactsPrimitives, a3);
    -[CRKMeCardUserProvider beginObservingContacts](v7, "beginObservingContacts");
    -[CRKMeCardUserProvider rebuildUser](v7, "rebuildUser");
  }

  return v7;
}

- (void)beginObservingContacts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[CRKMeCardUserProvider contactsPrimitives](self, "contactsPrimitives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __47__CRKMeCardUserProvider_beginObservingContacts__block_invoke;
  v8 = &unk_24D9C7A60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "subscribeToContactsChanges:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKMeCardUserProvider setContactsSubscription:](self, "setContactsSubscription:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__CRKMeCardUserProvider_beginObservingContacts__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rebuildUserDebounced");

}

- (void)rebuildUserDebounced
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_rebuildUser, 0);
  -[CRKMeCardUserProvider performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_rebuildUser, 0, 0.200000003);
}

- (void)rebuildUser
{
  id v3;

  -[CRKMeCardUserProvider fetchCurrentUser](self, "fetchCurrentUser");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKMeCardUserProvider setUser:](self, "setUser:", v3);

}

- (id)fetchCurrentUser
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[16];

  _CRKLogGeneral_22();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Rebuilding MeCard user", buf, 2u);
  }

  -[CRKMeCardUserProvider contactsPrimitives](self, "contactsPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v4, "fetchMeCardContactWithError:", &v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v30;

  if (v5)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setUserIdentifier:", CFSTR("TEMPORARY_ME_CARD_IDENTIFIER"));
    objc_msgSend(v5, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v5, "nickname");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "givenName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(v5, "familyName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v5, "givenName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setGivenName:", v23);

          objc_msgSend(v5, "familyName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFamilyName:", v24);

          objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v11, 3, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setDisplayName:", v25);

          goto LABEL_7;
        }
      }
      else
      {

      }
      objc_msgSend(v5, "givenName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        objc_msgSend(v5, "givenName");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "familyName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        if (!v29)
          goto LABEL_8;
        objc_msgSend(v5, "familyName");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = (void *)v10;
    objc_msgSend(v7, "setDisplayName:", v10);
LABEL_7:

LABEL_8:
    objc_msgSend(v5, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGivenName:", v12);

    objc_msgSend(v5, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFamilyName:", v13);

    objc_msgSend(v5, "phoneticGivenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneticGivenName:", v14);

    objc_msgSend(v5, "phoneticFamilyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneticFamilyName:", v15);

    objc_msgSend(v7, "setUserSource:", CFSTR("MeCard"));
    objc_msgSend(v5, "thumbnailImageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserImageData:", v16);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject UUIDString](v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageIdentifier:", v18);

    goto LABEL_12;
  }
  _CRKLogGeneral_22();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CRKMeCardUserProvider fetchCurrentUser].cold.1((uint64_t)v6, v17);
  v7 = 0;
LABEL_12:

  return v7;
}

- (CRKContactsPrimitives)contactsPrimitives
{
  return self->_contactsPrimitives;
}

- (CRKCancelable)contactsSubscription
{
  return self->_contactsSubscription;
}

- (void)setContactsSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_contactsSubscription, a3);
}

- (CRKUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_contactsSubscription, 0);
  objc_storeStrong((id *)&self->_contactsPrimitives, 0);
}

- (void)fetchCurrentUser
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "No me contact found in the contact store: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
