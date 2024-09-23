@implementation CPLLibraryShareScopeChange

- (NSArray)exitingUserIdentifiers
{
  void *v3;
  void *v4;

  if (-[NSSet count](self->_exitingUserIdentifiers, "count"))
  {
    -[NSSet allObjects](self->_exitingUserIdentifiers, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setExitingUserIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *exitingUserIdentifiers;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = v4;
  }
  else
  {
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = 0;
  }

}

- (BOOL)isCurrentUserExiting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CPLScopeChange share](self, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUserParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "userIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "userIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CPLLibraryShareScopeChange isUserWithIdentifierExiting:](self, "isUserWithIdentifierExiting:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isUserWithIdentifierExiting:(id)a3
{
  return -[NSSet containsObject:](self->_exitingUserIdentifiers, "containsObject:", a3);
}

- (BOOL)areSomeUsersExiting
{
  return -[NSSet count](self->_exitingUserIdentifiers, "count") != 0;
}

- (int64_t)exitState
{
  void *v3;
  void *v5;
  uint64_t v6;

  -[CPLScopeChange stagingScopeIdentifier](self, "stagingScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  if (!-[CPLLibraryShareScopeChange isCurrentUserExiting](self, "isCurrentUserExiting"))
    return 0;
  if (-[CPLScopeChange scopeType](self, "scopeType") != 4)
    return 1;
  -[CPLLibraryShareScopeChange exitingUserIdentifiers](self, "exitingUserIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    return 2;
  else
    return 1;
}

- (void)addExitingUserIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  NSSet *exitingUserIdentifiers;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CPLScopeChange share](self, "share", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "userIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && objc_msgSend(v4, "containsObject:", v12))
            objc_msgSend(v5, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (-[NSSet count](self->_exitingUserIdentifiers, "count"))
    {
      -[NSSet setByAddingObjectsFromSet:](self->_exitingUserIdentifiers, "setByAddingObjectsFromSet:", v5);
      v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (NSSet *)objc_msgSend(v5, "copy");
    }
    exitingUserIdentifiers = self->_exitingUserIdentifiers;
    self->_exitingUserIdentifiers = v13;

  }
}

- (void)removePendingParticipantIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CPLScopeChange share](self, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "count");
    if (v7 >= objc_msgSend(v6, "count"))
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count") - objc_msgSend(v4, "count"));
    v9 = v8;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "participantID", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16 || (objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
    -[CPLScopeChange share](self, "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setParticipants:", v17);

  }
}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  char v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPLLibraryShareScopeChange;
  -[CPLScopeChange updateScopeFromScopeChange:direction:didHaveChanges:](&v19, sel_updateScopeFromScopeChange_direction_didHaveChanges_, v8, a4, a5);
  if (a4 != 1)
    goto LABEL_14;
  objc_msgSend(v8, "userDefinedRules");
  v9 = objc_claimAutoreleasedReturnValue();
  -[CPLLibraryShareScopeChange userDefinedRules](self, "userDefinedRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)v10;
  if (!v9 || !v10)
  {

    if (!(v9 | v11))
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = objc_msgSend((id)v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v8, "userDefinedRules");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLLibraryShareScopeChange setUserDefinedRules:](self, "setUserDefinedRules:", v13);

    *a5 = 1;
  }
LABEL_8:
  objc_msgSend(v8, "userViewedParticipantTrashNotificationDate");
  v14 = objc_claimAutoreleasedReturnValue();
  -[CPLLibraryShareScopeChange userViewedParticipantTrashNotificationDate](self, "userViewedParticipantTrashNotificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (unint64_t)v15;
  if (v14 && v15)
  {
    v17 = objc_msgSend((id)v14, "isEqual:", v15);

    if ((v17 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }

  if (v14 | v16)
  {
LABEL_13:
    objc_msgSend(v8, "userViewedParticipantTrashNotificationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLLibraryShareScopeChange setUserViewedParticipantTrashNotificationDate:](self, "setUserViewedParticipantTrashNotificationDate:", v18);

    *a5 = 1;
  }
LABEL_14:

}

- (id)_additionalDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (-[CPLLibraryShareScopeChange exitState](self, "exitState"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "descriptionForExitState:", -[CPLLibraryShareScopeChange exitState](self, "exitState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "descriptionForExitType:", -[CPLLibraryShareScopeChange exitType](self, "exitType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLLibraryManager descriptionForExitSource:](CPLLibraryManager, "descriptionForExitSource:", -[CPLLibraryShareScopeChange exitSource](self, "exitSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR(" - exitState: %@, exitType: %@, exitSource: %@"), v4, v5, v6);

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLLibraryShareScopeChange;
    -[CPLScopeChange _additionalDescription](&v9, sel__additionalDescription);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)exitType
{
  return self->_exitType;
}

- (void)setExitType:(int64_t)a3
{
  self->_exitType = a3;
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  self->_exitRetentionPolicy = a3;
}

- (int64_t)exitSource
{
  return self->_exitSource;
}

- (void)setExitSource:(int64_t)a3
{
  self->_exitSource = a3;
}

- (NSData)userDefinedRules
{
  return self->_userDefinedRules;
}

- (void)setUserDefinedRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSDate)userViewedParticipantTrashNotificationDate
{
  return self->_userViewedParticipantTrashNotificationDate;
}

- (void)setUserViewedParticipantTrashNotificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userViewedParticipantTrashNotificationDate, 0);
  objc_storeStrong((id *)&self->_userDefinedRules, 0);
  objc_storeStrong((id *)&self->_exitingUserIdentifiers, 0);
}

+ (id)mappingForExitState
{
  if (mappingForExitState_onceToken != -1)
    dispatch_once(&mappingForExitState_onceToken, &__block_literal_global_281);
  return (id)mappingForExitState_mapping;
}

+ (id)descriptionForExitState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "mappingForExitState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown exit state (%ld)"), a3);
  v8 = v7;

  return v8;
}

+ (id)mappingForExitType
{
  if (mappingForExitType_onceToken != -1)
    dispatch_once(&mappingForExitType_onceToken, &__block_literal_global_288);
  return (id)mappingForExitType_mapping;
}

+ (id)descriptionForExitType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "mappingForExitType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown exit type (%ld)"), a3);
  v8 = v7;

  return v8;
}

void __48__CPLLibraryShareScopeChange_mappingForExitType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6119EE0;
  v2[1] = &unk_1E6119F28;
  v3[0] = CFSTR("unknown");
  v3[1] = CFSTR("owner-dismantle");
  v2[2] = &unk_1E6119F10;
  v2[3] = &unk_1E6119EF8;
  v3[2] = CFSTR("removed");
  v3[3] = CFSTR("self-exit");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mappingForExitType_mapping;
  mappingForExitType_mapping = v0;

}

void __49__CPLLibraryShareScopeChange_mappingForExitState__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6119EE0;
  v2[1] = &unk_1E6119EF8;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("preparing");
  v2[2] = &unk_1E6119F10;
  v3[2] = CFSTR("exiting");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mappingForExitState_mapping;
  mappingForExitState_mapping = v0;

}

+ (BOOL)serverSupportsLibraryShareSettingsRecordSyncing
{
  return 1;
}

+ (BOOL)serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing
{
  return 1;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("exitingUserIdentifiers")))
  {
    if (cplAdditionalSecureClassesForProperty__onceToken_122 != -1)
      dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_122, &__block_literal_global_123);
    v5 = (id)cplAdditionalSecureClassesForProperty__classes;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CPLLibraryShareScopeChange;
    objc_msgSendSuper2(&v8, sel_cplAdditionalSecureClassesForProperty_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __81__CPLLibraryShareScopeChange_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  v1 = (void *)cplAdditionalSecureClassesForProperty__classes;
  cplAdditionalSecureClassesForProperty__classes = v0;

}

@end
