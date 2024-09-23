@implementation EKParticipantForSorting

+ (id)_cache
{
  if (_cache_onceToken != -1)
    dispatch_once(&_cache_onceToken, &__block_literal_global_16);
  return (id)_cache_s_participantCache;
}

void __33__EKParticipantForSorting__cache__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_opt_new();
  v1 = (void *)_cache_s_participantCache;
  _cache_s_participantCache = v0;

  objc_msgSend((id)_cache_s_participantCache, "setCountLimit:", 1000);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C96870], 0, 0, &__block_literal_global_4);

}

uint64_t __33__EKParticipantForSorting__cache__block_invoke_2()
{
  return objc_msgSend((id)_cache_s_participantCache, "removeAllObjects");
}

+ (id)participantForSortingWithEKParticipant:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "participantsForSortingWithEKParticipants:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)participantsForSortingWithEKParticipants:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  EKParticipantForSorting *v37;
  id *p_isa;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  id v55;
  void *v56;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  _BYTE v68[128];
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __68__EKParticipantForSorting_participantsForSortingWithEKParticipants___block_invoke;
  v63[3] = &unk_1E4785668;
  v55 = a1;
  v67 = a1;
  v57 = v7;
  v64 = v57;
  v9 = v8;
  v65 = v9;
  v10 = v6;
  v66 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v63);
  v11 = (void *)objc_msgSend(v5, "mutableCopy");

  v53 = v9;
  objc_msgSend(v11, "removeObjectsAtIndexes:", v9);
  v52 = v11;
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v10;
  objc_msgSend(v10, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v14;
  objc_msgSend(v15, "unifiedContactsDictionaryForHandleStrings:keysToFetch:", v16, v14);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v58, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v56, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v24 = 0;
        }
        objc_msgSend(v21, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "cal_isPhoneNumber");

        if (!v24 && (v26 & 1) == 0)
        {
          v24 = (void *)objc_opt_new();
          v27 = (void *)MEMORY[0x1E0D0C360];
          objc_msgSend(v21, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "personNameComponentsFromString:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "nickname");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v24, "setNickname:", v30);
          objc_msgSend(v29, "familyName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
            objc_msgSend(v24, "setFamilyName:", v31);
          objc_msgSend(v29, "givenName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            objc_msgSend(v24, "setGivenName:", v32);
          objc_msgSend(v29, "namePrefix");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v24, "setNamePrefix:", v33);
          objc_msgSend(v29, "nameSuffix");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
            objc_msgSend(v24, "setNameSuffix:", v34);
          objc_msgSend(v29, "middleName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            objc_msgSend(v24, "setMiddleName:", v35);

        }
        if (v24)
          objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v24, 0);
        else
          objc_msgSend(v21, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_alloc_init(EKParticipantForSorting);
        p_isa = (id *)&v37->super.isa;
        if (v36)
        {
          -[EKParticipantForSorting setCachedDisplayName:](v37, "setCachedDisplayName:", v36);
          if ((v26 & 1) != 0)
            goto LABEL_41;
        }
        else
        {
          objc_msgSend(v21, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v21, "name");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_isa, "setCachedDisplayName:", v40);

            if ((v26 & 1) != 0)
              goto LABEL_41;
          }
          else
          {
            objc_msgSend(v21, "emailAddress");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              objc_msgSend(v21, "emailAddress");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(p_isa, "setCachedDisplayName:", v42);

              objc_msgSend(p_isa, "setIsEmail:", 1);
              if ((v26 & 1) != 0)
                goto LABEL_41;
            }
            else
            {
              objc_msgSend(v21, "phoneNumber");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(p_isa, "setCachedDisplayName:", v43);

              objc_msgSend(p_isa, "setIsPhone:", 1);
              if ((v26 & 1) != 0)
                goto LABEL_41;
            }
          }
        }
        objc_msgSend(v24, "givenName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(v24, "givenName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_isa, "setFirstName:", v45);

        }
        objc_msgSend(v24, "familyName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v24, "familyName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_isa, "setLastName:", v47);

        }
LABEL_41:
        objc_storeWeak(p_isa + 1, v21);
        objc_msgSend(v57, "addObject:", p_isa);
        if (v22)
        {
          objc_msgSend(v55, "_cache");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKey:", p_isa, v22);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v18);
  }

  v49 = v57;
  return v49;
}

void __68__EKParticipantForSorting_participantsForSortingWithEKParticipants___block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id obj;

  obj = a2;
  objc_msgSend(obj, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(obj, "emailAddress");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(obj, "phoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
    objc_msgSend(obj, "phoneNumber");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
  if (v6)
  {
    objc_msgSend(a1[7], "_cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    objc_msgSend(a1[7], "_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v8);
    v11 = (id *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_storeWeak(v11 + 1, obj);
      objc_sync_exit(v9);

      objc_msgSend(a1[4], "addObject:", v11);
      objc_msgSend(a1[5], "addIndex:", a3);
    }
    else
    {
      objc_sync_exit(v9);

      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v8, obj);
    }

  }
LABEL_10:

}

- (id)description
{
  void *v3;
  void *v4;
  NSString *cachedDisplayName;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)EKParticipantForSorting;
  -[EKParticipantForSorting description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  cachedDisplayName = self->_cachedDisplayName;
  CalBooleanAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] Display name: [%@], isEmail: [%@]"), v4, cachedDisplayName, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)participant
{
  void *v3;
  id WeakRetained;

  objc_msgSend((id)objc_opt_class(), "_cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  objc_sync_exit(v3);

  return WeakRetained;
}

- (BOOL)isEmail
{
  return self->_isEmail;
}

- (id)displayName
{
  return self->_cachedDisplayName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id WeakRetained;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  v6 = -[EKParticipantForSorting participantIsOptional:](self, "participantIsOptional:", WeakRetained);

  objc_msgSend(v4, "participant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKParticipantForSorting participantIsOptional:](self, "participantIsOptional:", v7);

  if (!v6 || v8)
  {
    if (v6 || !v8)
      v9 = -[EKParticipantForSorting compareByEmailThenByContactName:](self, "compareByEmailThenByContactName:", v4);
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)participantIsOptional:(id)a3
{
  return objc_msgSend(a3, "participantRole") == 2;
}

- (int64_t)compareByEmailThenByContactName:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_isEmail)
  {
    if (!objc_msgSend(v4, "isEmail"))
    {
      v6 = 1;
      goto LABEL_11;
    }
    if (self->_isEmail)
    {
LABEL_8:
      if (objc_msgSend(v5, "isEmail"))
      {
        -[EKParticipantForSorting displayName](self, "displayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v7, "compare:options:", v8, 1);

        goto LABEL_11;
      }
LABEL_10:
      v6 = -[EKParticipantForSorting compareByContactNames:](self, "compareByContactNames:", v5);
      goto LABEL_11;
    }
  }
  if ((objc_msgSend(v5, "isEmail") & 1) == 0)
  {
    if (!self->_isEmail)
      goto LABEL_10;
    goto LABEL_8;
  }
  v6 = -1;
LABEL_11:

  return v6;
}

- (int64_t)compareByContactNames:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v4 = (void *)MEMORY[0x1E0C972B8];
  v5 = a3;
  objc_msgSend(v4, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sortOrder");

  if (v7 == 2)
  {
    v8 = self->_firstName;
    v9 = self->_lastName;
    objc_msgSend(v5, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
  }
  else
  {
    v8 = self->_lastName;
    v9 = self->_firstName;
    objc_msgSend(v5, "lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstName");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && v10)
    goto LABEL_6;
  if (v8 && !v10)
    goto LABEL_9;
  if (!v8 || !v10 || (v12 = -[NSString compare:options:](v8, "compare:options:", v10, 1)) == NSOrderedSame)
  {
    if (!v9 && v11)
    {
LABEL_6:
      v12 = 1;
      goto LABEL_20;
    }
    if (v9 && !v11)
    {
LABEL_9:
      v12 = -1;
      goto LABEL_20;
    }
    v12 = 0;
    if (v9 && v11)
      v12 = -[NSString compare:options:](v9, "compare:options:", v11, 1);
  }
LABEL_20:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKParticipantForSorting *v4;

  v4 = -[EKParticipantForSorting init](+[EKParticipantForSorting allocWithZone:](EKParticipantForSorting, "allocWithZone:", a3), "init");
  -[EKParticipantForSorting setFirstName:](v4, "setFirstName:", self->_firstName);
  -[EKParticipantForSorting setLastName:](v4, "setLastName:", self->_lastName);
  -[EKParticipantForSorting setCachedDisplayName:](v4, "setCachedDisplayName:", self->_cachedDisplayName);
  -[EKParticipantForSorting setIsEmail:](v4, "setIsEmail:", self->_isEmail);
  -[EKParticipantForSorting setIsPhone:](v4, "setIsPhone:", self->_isPhone);
  return v4;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (void)setCachedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIsEmail:(BOOL)a3
{
  self->_isEmail = a3;
}

- (BOOL)isPhone
{
  return self->_isPhone;
}

- (void)setIsPhone:(BOOL)a3
{
  self->_isPhone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_destroyWeak((id *)&self->_participant);
}

@end
