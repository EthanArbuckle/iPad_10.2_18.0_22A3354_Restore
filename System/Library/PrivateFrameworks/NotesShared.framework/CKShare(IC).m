@implementation CKShare(IC)

+ (CKShareSystemFieldsTransformer)ic_systemFieldsValueTransformer
{
  uint64_t v0;

  v0 = objc_opt_class();
  if (v0 != objc_opt_class())
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self class] == [CKShare class]", "+[CKShare(IC) ic_systemFieldsValueTransformer]", 1, 0, CFSTR("-ic_systemFieldsValueTransformer must be overridden, and must not call super: %@"), objc_opt_class());
  return objc_alloc_init(CKShareSystemFieldsTransformer);
}

- (uint64_t)ic_nonOwnerInvitedParticipantsCount
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 1);
  return objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 2) + v2;
}

- (uint64_t)ic_nonOwnerAcceptedParticipantsCount
{
  return objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 2);
}

- (uint64_t)ic_nonOwnerPendingParticipantsCount
{
  return objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 1);
}

- (id)ic_nonCurrentUserParticipants
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C95130];
  objc_msgSend(a1, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_nonCurrentUserParticipants:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_acceptedParticipants
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "participants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_objectsPassingTest:", &__block_literal_global_45);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_nonCurrentUserAcceptedParticipants
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "participants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_objectsPassingTest:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)ic_isPublicShare
{
  return objc_msgSend(a1, "publicPermission") == 2 || objc_msgSend(a1, "publicPermission") == 3;
}

- (id)ic_participantWithUserRecordName:()IC
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "allParticipants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CKShare_IC__ic_participantWithUserRecordName___block_invoke;
    v8[3] = &unk_1E76CD0C8;
    v9 = v4;
    objc_msgSend(v5, "ic_objectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ic_participantWithHandle:()IC
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedHandleWithDestinationID:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "allParticipants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__CKShare_IC__ic_participantWithHandle___block_invoke;
    v6[3] = &unk_1E76CD0C8;
    v7 = v2;
    objc_msgSend(v3, "ic_objectPassingTest:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_nonCurrentUserParticipantsCountWithAcceptanceStatus:()IC
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "owner");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

        }
        else
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "acceptanceStatus");

          if (v14 == a3)
            ++v8;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()IC
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "owner");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

        }
        else
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "acceptanceStatus");

          if (v14 == a3)
            ++v8;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
