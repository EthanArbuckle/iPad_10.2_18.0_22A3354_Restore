@implementation PHShareParticipant

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHShareParticipant)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHShareParticipant *v9;
  uint64_t v10;
  NSString *emailAddress;
  uint64_t v12;
  NSPersonNameComponents *nameComponents;
  uint64_t v14;
  NSString *phoneNumber;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *participantID;
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHShareParticipant;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v24, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("emailAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    emailAddress = v9->_emailAddress;
    v9->_emailAddress = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nameComponents"));
    v12 = objc_claimAutoreleasedReturnValue();
    nameComponents = v9->_nameComponents;
    v9->_nameComponents = (NSPersonNameComponents *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v9->_phoneNumber;
    v9->_phoneNumber = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("role"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_role = objc_msgSend(v16, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("permission"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_permission = objc_msgSend(v17, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("acceptanceStatus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_acceptanceStatus = objc_msgSend(v18, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("exitState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_exitState = objc_msgSend(v19, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isCurrentUser"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isCurrentUser = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participantID"));
    v21 = objc_claimAutoreleasedReturnValue();
    participantID = v9->_participantID;
    v9->_participantID = (NSString *)v21;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PHShareParticipant *v4;
  PHShareParticipant *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char IsEqual;

  v4 = (PHShareParticipant *)a3;
  if (self == v4)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHShareParticipant role](v5, "role");
      if (v6 == -[PHShareParticipant role](self, "role"))
      {
        -[PHShareParticipant phoneNumber](v5, "phoneNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHShareParticipant phoneNumber](self, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (PLObjectIsEqual())
        {
          -[PHShareParticipant nameComponents](v5, "nameComponents");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHShareParticipant nameComponents](self, "nameComponents");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (PLObjectIsEqual())
          {
            -[PHShareParticipant emailAddress](v5, "emailAddress");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHShareParticipant emailAddress](self, "emailAddress");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            IsEqual = PLObjectIsEqual();

          }
          else
          {
            IsEqual = 0;
          }

        }
        else
        {
          IsEqual = 0;
        }

      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[PHShareParticipant role](self, "role");
  -[PHShareParticipant phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PHShareParticipant emailAddress](self, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[PHShareParticipant nameComponents](self, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (unsigned)role
{
  return self->_role;
}

- (signed)permission
{
  return self->_permission;
}

- (signed)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (signed)exitState
{
  return self->_exitState;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_30480 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_30480, &__block_literal_global_30481);
  return (id)propertiesToFetchWithHint__array_30482;
}

+ (id)managedEntityName
{
  return CFSTR("ShareParticipant");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHShareParticipant");
  return CFSTR("PHShareParticipant");
}

+ (id)identifierCode
{
  return CFSTR("150");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_30473;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PHShareParticipant_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_30467 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_30467, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_30468, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/L0/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchParticipantsInShare:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForShareParticipantsInShare:options:](PHQuery, "queryForShareParticipantsInShare:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PHShareParticipant_fetchParticipantsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchContributorsForAsset:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchContributorsForAssets:options:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fetchContributorsForAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "photoLibrary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(v11, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__PHShareParticipant_fetchContributorsForAssets_options___block_invoke;
  v27[3] = &unk_1E35DFAF8;
  v18 = v7;
  v28 = v18;
  v19 = v11;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  objc_msgSend(v17, "performBlockAndWait:", v27);

  if ((objc_msgSend(v6, "hasAnySortDescriptors") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isCurrentUser"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSortDescriptors:", v22);
  }
  objc_msgSend(v20, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForShareParticipantsWithLocalIdentifiers:options:](PHQuery, "queryForShareParticipantsWithLocalIdentifiers:options:", v23, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "executeQuery");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)queryParticipantsWithEmails:(id)a3 phoneNumbers:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "assetsdClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudInternalClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__PHShareParticipant_queryParticipantsWithEmails_phoneNumbers_photoLibrary_completionHandler___block_invoke;
  v15[3] = &unk_1E35DC480;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v13, "queryParticipantsWithEmails:phoneNumbers:completionHandler:", v11, v10, v15);

}

+ (id)fetchShareParticipantForPerson:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForShareParticipantWithPerson:options:](PHQuery, "queryForShareParticipantWithPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __94__PHShareParticipant_queryParticipantsWithEmails_phoneNumbers_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PHShareParticipant_fetchContributorsForAssets_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D71880];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsWithUUIDs:options:inLibrary:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v6), "libraryScopeContributors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(a1 + 48);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "uuid");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHShareParticipant localIdentifierWithUUID:](PHShareParticipant, "localIdentifierWithUUID:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v14);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }

}

id __68__PHShareParticipant_fetchParticipantsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForShareParticipantsWithLocalIdentifiers:options:](PHQuery, "queryForShareParticipantsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __58__PHShareParticipant_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("emailAddress");
  v4[2] = CFSTR("nameComponents");
  v4[3] = CFSTR("phoneNumber");
  v4[4] = CFSTR("role");
  v4[5] = CFSTR("permission");
  v4[6] = CFSTR("acceptanceStatus");
  v4[7] = CFSTR("exitState");
  v4[8] = CFSTR("isCurrentUser");
  v4[9] = CFSTR("participantID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_30468;
  transformValueExpression_forKeyPath___passThroughSet_30468 = v2;

}

void __34__PHShareParticipant_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PHEntityKeyMap *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v12 = [PHEntityKeyMap alloc];
  v23 = CFSTR("uuid");
  v24[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("emailAddress");
  v22 = CFSTR("emailAddress");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v0;
  v24[2] = CFSTR("nameComponents");
  v21 = CFSTR("nameComponents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v1;
  v24[3] = CFSTR("phoneNumber");
  v20 = CFSTR("phoneNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v2;
  v24[4] = CFSTR("role");
  v19 = CFSTR("role");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v3;
  v24[5] = CFSTR("permission");
  v18 = CFSTR("permission");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v4;
  v24[6] = CFSTR("acceptanceStatus");
  v17 = CFSTR("acceptanceStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("exitState");
  v16 = CFSTR("exitState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  v24[8] = CFSTR("isCurrentUser");
  v15 = CFSTR("isCurrentUser");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v7;
  v24[9] = CFSTR("participantID");
  v14 = CFSTR("participantID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v12, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_30473;
  entityKeyMap_pl_once_object_15_30473 = v10;

}

void __48__PHShareParticipant_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("uuid");
  v3[2] = CFSTR("emailAddress");
  v3[3] = CFSTR("nameComponents");
  v3[4] = CFSTR("phoneNumber");
  v3[5] = CFSTR("role");
  v3[6] = CFSTR("permission");
  v3[7] = CFSTR("acceptanceStatus");
  v3[8] = CFSTR("exitState");
  v3[9] = CFSTR("isCurrentUser");
  v3[10] = CFSTR("participantID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array_30482;
  propertiesToFetchWithHint__array_30482 = v1;

}

@end
