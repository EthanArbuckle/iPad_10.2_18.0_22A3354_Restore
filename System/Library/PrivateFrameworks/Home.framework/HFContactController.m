@implementation HFContactController

- (HFContactController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithKeyDescriptors_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFContactController.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFContactController init]",
    v5);

  return 0;
}

- (HFContactController)initWithKeyDescriptors:(id)a3
{
  id v5;
  HFContactController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *recipientAvailabilities;
  NSMutableDictionary *v9;
  NSMutableDictionary *recipientToRestrictedGuestIDSCapability;
  NSMutableArray *v11;
  NSMutableArray *familyMemberCallbacks;
  _QWORD v14[4];
  HFContactController *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFContactController;
  v6 = -[HFContactController init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recipientAvailabilities = v6->_recipientAvailabilities;
    v6->_recipientAvailabilities = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recipientToRestrictedGuestIDSCapability = v6->_recipientToRestrictedGuestIDSCapability;
    v6->_recipientToRestrictedGuestIDSCapability = v9;

    objc_storeStrong((id *)&v6->_descriptors, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    familyMemberCallbacks = v6->_familyMemberCallbacks;
    v6->_familyMemberCallbacks = v11;

    v6->_familyMembersState = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__HFContactController_initWithKeyDescriptors___block_invoke;
    v14[3] = &unk_1EA727DD8;
    v15 = v6;
    -[HFContactController _loadFamilyMembersWithCompletion:](v15, "_loadFamilyMembersWithCompletion:", v14);

  }
  return v6;
}

void __46__HFContactController_initWithKeyDescriptors___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setFamilyMembersState:", 1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "familyMemberCallbacks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "fetchFamilyMembersWithCompletion:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "familyMemberCallbacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

+ (id)stringForRecipientStatus:(unint64_t)a3
{
  if (a3 < 5)
    return off_1EA730628[a3];
  NSLog(CFSTR("Unknown recipient status %lu"), a2, a3);
  return CFSTR("Unknown");
}

+ (id)contactForAppleID:(id)a3 keyDescriptors:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "hf_isPhoneNumber");
  v8 = (void *)objc_opt_class();
  if (v7)
    objc_msgSend(v8, "contactForPhoneNumber:keyDescriptors:", v6, v5);
  else
    objc_msgSend(v8, "contactForEmailAddress:keyDescriptors:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contactForEmailAddress:(id)a3 keyDescriptors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[HFContactStore defaultStore](HFContactStore, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactForEmailAddress:withKeys:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)contactForPhoneNumber:(id)a3 keyDescriptors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[HFContactStore defaultStore](HFContactStore, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactForPhoneNumber:withKeys:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)pendingDestinations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFContactController recipientAvailabilities](self, "recipientAvailabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HFContactController_pendingDestinations__block_invoke;
  v9[3] = &unk_1EA730590;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void __42__HFContactController_pendingDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqualToNumber:", &unk_1EA7CBF80))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)entriesUpdated:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__HFContactController_entriesUpdated___block_invoke;
  v3[3] = &unk_1EA730590;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __38__HFContactController_entriesUpdated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v6 >= 3)
    v7 = 0;
  else
    v7 = v6 + 2;
  objc_msgSend(*(id *)(a1 + 32), "recipientAvailabilities");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v5);

}

- (void)restrictedGuestIDSCapabilityUpdated:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HFContactController_restrictedGuestIDSCapabilityUpdated___block_invoke;
  v3[3] = &unk_1EA730590;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __59__HFContactController_restrictedGuestIDSCapabilityUpdated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "recipientToRestrictedGuestIDSCapability");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v7, "numberWithUnsignedInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v6);

}

- (BOOL)hasRestrictedGuestIDSCapabilityForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFContactController recipientToRestrictedGuestIDSCapability](self, "recipientToRestrictedGuestIDSCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

- (void)markDestinationsPending:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[HFContactController recipientAvailabilities](self, "recipientAvailabilities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", &unk_1EA7CBF80, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (unint64_t)statusForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[HFContactController recipientAvailabilities](self, "recipientAvailabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (void)fetchFamilyMembersWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v7 = v4;
    if (-[HFContactController familyMembersState](self, "familyMembersState"))
    {
      -[HFContactController familyMembers](self, "familyMembers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v5);
    }
    else
    {
      -[HFContactController familyMemberCallbacks](self, "familyMemberCallbacks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v5, "addObject:", v6);

    }
    v4 = v7;
  }

}

- (id)contactForFamilyMemberWithDsid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFContactController familyMemberDsidToContact](self, "familyMemberDsidToContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)_contactForFamilyMember:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  objc_msgSend(v3, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  objc_msgSend(v3, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_isEmail");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v3, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labeledValueWithLabel:value:", 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmailAddresses:", v12);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v3, "appleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hf_isPhoneNumber");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C97338];
    v16 = objc_alloc(MEMORY[0x1E0C97398]);
    objc_msgSend(v3, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v16, "initWithStringValue:", v10);
    objc_msgSend(v15, "labeledValueWithLabel:value:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhoneNumbers:", v17);

    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (void)_loadFamilyMembersWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D20EA8]);
  objc_msgSend(v5, "setCachePolicy:", 2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke;
  v7[3] = &unk_1EA7305E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startRequestWithCompletionHandler:", v7);

}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_2;
  v10[3] = &unk_1EA72C268;
  v11 = v6;
  v12 = v5;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    HFLogForCategory(0x27uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Error loading family members: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "members");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_31;
    v17 = &unk_1EA7305B8;
    v9 = v4;
    v18 = v9;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v19 = v10;
    v20 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v14);

    if (objc_msgSend(v9, "count", v14, v15, v16, v17))
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("appleID"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sortUsingDescriptors:", v13);

      objc_msgSend(*(id *)(a1 + 48), "setFamilyMembers:", v9);
      objc_msgSend(*(id *)(a1 + 48), "setFamilyMemberDsidToContact:", v10);
      objc_msgSend(*(id *)(a1 + 48), "_downloadFamilyMemberPhotos");
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isMe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 48), "_contactForFamilyMember:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v6, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

- (void)_downloadFamilyMemberPhotos
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HFContactController familyMembers](self, "familyMembers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0D20EB8]);
        objc_msgSend(v8, "dsid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithFamilyMemberDSID:size:localFallback:", v10, 1, 1);

        objc_msgSend(v11, "setUseMonogramAsLastResort:", 0);
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __50__HFContactController__downloadFamilyMemberPhotos__block_invoke;
        v13[3] = &unk_1EA730608;
        v13[4] = self;
        v13[5] = v8;
        objc_msgSend(v11, "startRequestWithCompletionHandler:", v13);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __50__HFContactController__downloadFamilyMemberPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD block[4];
  __int128 v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HFContactController__downloadFamilyMemberPhotos__block_invoke_2;
    block[3] = &unk_1EA7270A0;
    v6 = *(_OWORD *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __50__HFContactController__downloadFamilyMemberPhotos__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "familyMemberDsidToContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImageData:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactController:didFinishDownloadingFamilyMemberAvatar:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (HFContactControllerDelegate)delegate
{
  return (HFContactControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)recipientAvailabilities
{
  return self->_recipientAvailabilities;
}

- (void)setRecipientAvailabilities:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAvailabilities, a3);
}

- (NSMutableDictionary)recipientToRestrictedGuestIDSCapability
{
  return self->_recipientToRestrictedGuestIDSCapability;
}

- (void)setRecipientToRestrictedGuestIDSCapability:(id)a3
{
  objc_storeStrong((id *)&self->_recipientToRestrictedGuestIDSCapability, a3);
}

- (unint64_t)familyMembersState
{
  return self->_familyMembersState;
}

- (void)setFamilyMembersState:(unint64_t)a3
{
  self->_familyMembersState = a3;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)familyMemberDsidToContact
{
  return self->_familyMemberDsidToContact;
}

- (void)setFamilyMemberDsidToContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)familyMemberCallbacks
{
  return self->_familyMemberCallbacks;
}

- (void)setFamilyMemberCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCallbacks, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_familyMemberDsidToContact, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_recipientToRestrictedGuestIDSCapability, 0);
  objc_storeStrong((id *)&self->_recipientAvailabilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
