@implementation AAUIContactsProvider

- (AAUIContactsProvider)init
{
  AAUIContactsProvider *v2;
  uint64_t v3;
  AAContactsManager *contactsManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIContactsProvider;
  v2 = -[AAContactsProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (AAContactsManager *)v3;

  }
  return v2;
}

- (void)fetchSuggestedCustodiansWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  AAUIContactsProvider *v7;
  id v8;
  double v9;

  v6[1] = 3221225472;
  v6[2] = __79__AAUIContactsProvider_fetchSuggestedCustodiansWithImagesOfSize_andCompletion___block_invoke;
  v6[3] = &unk_1EA2DD278;
  v9 = a3;
  v7 = self;
  v8 = a4;
  v5.receiver = v7;
  v5.super_class = (Class)AAUIContactsProvider;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v8;
  -[AAContactsProvider fetchSuggestedCustodians:](&v5, sel_fetchSuggestedCustodians_, v6);

}

uint64_t __79__AAUIContactsProvider_fetchSuggestedCustodiansWithImagesOfSize_andCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchImagesForContacts:ofSize:completion:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)fetchSuggestedBeneficiariesWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  AAUIContactsProvider *v7;
  id v8;
  double v9;

  v6[1] = 3221225472;
  v6[2] = __82__AAUIContactsProvider_fetchSuggestedBeneficiariesWithImagesOfSize_andCompletion___block_invoke;
  v6[3] = &unk_1EA2DD278;
  v9 = a3;
  v7 = self;
  v8 = a4;
  v5.receiver = v7;
  v5.super_class = (Class)AAUIContactsProvider;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v8;
  -[AAContactsProvider fetchSuggestedBeneficiaries:](&v5, sel_fetchSuggestedBeneficiaries_, v6);

}

uint64_t __82__AAUIContactsProvider_fetchSuggestedBeneficiariesWithImagesOfSize_andCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchImagesForContacts:ofSize:completion:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_fetchImagesForContacts:(id)a3 ofSize:(double)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[5];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = a5;
  v9 = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "imageData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          dispatch_group_enter(v9);
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke;
          v24[3] = &unk_1EA2DD2A0;
          v24[4] = v15;
          v25 = v9;
          -[AAUIContactsProvider _fetchImageDataForLocalContact:ofSize:withCompletion:](self, "_fetchImageDataForLocalContact:ofSize:withCompletion:", v15, v24, a4);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  dispatch_get_global_queue(25, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke_2;
  block[3] = &unk_1EA2DB110;
  v22 = v10;
  v23 = v20;
  v18 = v10;
  v19 = v20;
  dispatch_group_notify(v9, v17, block);

}

void __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setImageData:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_fetchImageDataForLocalContact:(id)a3 ofSize:(double)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  AAContactsManager *contactsManager;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, void *);
  double v19;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  contactsManager = self->_contactsManager;
  objc_msgSend(v8, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAContactsManager contactForHandle:](contactsManager, "contactForHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "thumbnailImageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "thumbnailImageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v14);

  }
  else
  {
    objc_msgSend(v8, "familyDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__AAUIContactsProvider__fetchImageDataForLocalContact_ofSize_withCompletion___block_invoke;
    v16[3] = &unk_1EA2DD2C8;
    v17 = v8;
    v19 = a4;
    v18 = v9;
    -[AAUIContactsProvider _fetchServerImageDataFor:WithCompletion:](self, "_fetchServerImageDataFor:WithCompletion:", v15, v16);

  }
}

void __77__AAUIContactsProvider__fetchImageDataForLocalContact_ofSize_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getFAProfilePictureStoreClass_softClass;
  v13 = getFAProfilePictureStoreClass_softClass;
  if (!getFAProfilePictureStoreClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getFAProfilePictureStoreClass_block_invoke;
    v9[3] = &unk_1EA2DB6E8;
    v9[4] = &v10;
    __getFAProfilePictureStoreClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(*(id *)(a1 + 32), "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profilePictureForContact:serverImageData:firstName:lastName:diameter:", 0, v3, v6, v7, *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchServerImageDataFor:(id)a3 WithCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20EC0]), "initWithFamilyMemberDSID:size:localFallback:", v5, 1, 1);
    objc_msgSend(v8, "setUseMonogramAsLastResort:", 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__AAUIContactsProvider__fetchServerImageDataFor_WithCompletion___block_invoke;
    v9[3] = &unk_1EA2DD2F0;
    v10 = v7;
    objc_msgSend(v8, "startRequestWithCompletionHandler:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __64__AAUIContactsProvider__fetchServerImageDataFor_WithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end
