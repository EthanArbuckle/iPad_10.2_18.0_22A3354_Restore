@implementation ICParticipantsFilterTypeSelection

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4
{
  id v7;
  id v8;
  ICParticipantsFilterTypeSelection *v9;
  ICParticipantsFilterTypeSelection *v10;
  uint64_t v11;
  NSSet *participantUserIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICParticipantsFilterTypeSelection;
  v9 = -[ICParticipantsFilterTypeSelection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ICFilterTypeSelection setAccountObjectID:](v9, "setAccountObjectID:", v8);
    objc_storeStrong((id *)&v10->_managedObjectContext, a3);
    v10->_selectionType = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    participantUserIDs = v10->_participantUserIDs;
    v10->_participantUserIDs = (NSSet *)v11;

  }
  return v10;
}

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5
{
  id v9;
  id v10;
  ICParticipantsFilterTypeSelection *v11;
  ICParticipantsFilterTypeSelection *v12;
  uint64_t v13;
  NSSet *participantUserIDs;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICParticipantsFilterTypeSelection;
  v11 = -[ICParticipantsFilterTypeSelection init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ICFilterTypeSelection setAccountObjectID:](v11, "setAccountObjectID:", v10);
    objc_storeStrong((id *)&v12->_managedObjectContext, a3);
    v12->_selectionType = a5;
    if (a5 == 2)
      v12->_joinOperator = 1;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    participantUserIDs = v12->_participantUserIDs;
    v12->_participantUserIDs = (NSSet *)v13;

  }
  return v12;
}

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5 joinOperator:(unint64_t)a6
{
  id v11;
  id v12;
  ICParticipantsFilterTypeSelection *v13;
  ICParticipantsFilterTypeSelection *v14;
  uint64_t v15;
  NSSet *participantUserIDs;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICParticipantsFilterTypeSelection;
  v13 = -[ICParticipantsFilterTypeSelection init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ICFilterTypeSelection setAccountObjectID:](v13, "setAccountObjectID:", v12);
    objc_storeStrong((id *)&v14->_managedObjectContext, a3);
    v14->_selectionType = a5;
    v14->_joinOperator = a6;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    participantUserIDs = v14->_participantUserIDs;
    v14->_participantUserIDs = (NSSet *)v15;

  }
  return v14;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType") - 1;
  if (v4 > 2)
    v5 = CFSTR("me");
  else
    v5 = off_1E76CF068[v4];
  v6 = -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator");
  v7 = CFSTR("unknown");
  if (v6 == 1)
    v7 = CFSTR("all");
  if (v6 == 2)
    v7 = CFSTR("any");
  v8 = v7;
  -[ICParticipantsFilterTypeSelection participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("selectionType: %@\noperator: %@\nparticipants: %@"), v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
  if (a3 == 2 && !-[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"))
    -[ICParticipantsFilterTypeSelection setJoinOperator:](self, "setJoinOperator:", 1);
}

- (NSString)summary
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType");
  if (v4 < 2 || v4 == 3)
  {
    ICLocalizedStringFromICParticipantsFilterSelectionType((void *)-[ICParticipantsFilterTypeSelection selectionType](self, "selectionType"));
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[ICParticipantsFilterTypeSelection participants](self, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v12, "ic_participantName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ic_addNonNilObject:", v13);

          objc_msgSend(v12, "ic_shortParticipantName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ic_addNonNilObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[ICParticipantsFilterTypeSelection unresolvedParticipants](self, "unresolvedParticipants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v20, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ic_addNonNilObject:", v21);

          objc_msgSend(v20, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ic_addNonNilObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v17);
    }

    -[ICParticipantsFilterTypeSelection participants](self, "participants");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[ICParticipantsFilterTypeSelection unresolvedParticipants](self, "unresolvedParticipants");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") + v24;

    if (v26 == 2)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0CB3738]);
      objc_msgSend(v30, "stringFromItems:", v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v26 - 1;
      if (v26 == 1)
      {
        objc_msgSend(v5, "firstObject");
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("0 selected"), CFSTR("0 selected"), 0, 1);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        v2 = (void *)v28;
LABEL_28:

        return (NSString *)v2;
      }
      objc_msgSend(v6, "firstObject");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("PARTICIPANTS_%@_AND_%lu_OTHERS"), CFSTR("PARTICIPANTS_%@_AND_%lu_OTHERS"), 0, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringWithFormat:", v32, v30, v27);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_28;
  }
  return (NSString *)v2;
}

- (NSString)summaryWithJoinOperatorMenu
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show notes shared with INLINE_MENU_PLEASE_READ_COMMENTS selected people."), CFSTR("Show notes shared with INLINE_MENU_PLEASE_READ_COMMENTS selected people."), 0, 1);
}

- (void)addParticipantUserID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICParticipantsFilterTypeSelection setParticipantUserIDs:](self, "setParticipantUserIDs:", v5);
}

- (void)removeParticipantUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[ICParticipantsFilterTypeSelection setParticipantUserIDs:](self, "setParticipantUserIDs:", v6);

}

- (NSArray)unresolvedParticipants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICParticipantsFilterTypeSelection participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_map:", &__block_literal_global_60);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v8);

  objc_msgSend(v5, "ic_map:", &__block_literal_global_36_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

id __59__ICParticipantsFilterTypeSelection_unresolvedParticipants__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

ICCKShareUnknownParticipant *__59__ICParticipantsFilterTypeSelection_unresolvedParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ICCKShareUnknownParticipant *v3;

  v2 = a2;
  v3 = -[ICCKShareUnknownParticipant initWithParticipantUserID:]([ICCKShareUnknownParticipant alloc], "initWithParticipantUserID:", v2);

  return v3;
}

- (NSArray)participants
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ICParticipantsFilterTypeSelection_participants__block_invoke;
  v6[3] = &unk_1E76C76B0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__ICParticipantsFilterTypeSelection_participants__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueUserParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__ICParticipantsFilterTypeSelection_participants__block_invoke_2;
  v10[3] = &unk_1E76CD0C8;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "ic_objectsPassingTest:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __49__ICParticipantsFilterTypeSelection_participants__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "participantUserIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userRecordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  return v8;
}

- (BOOL)isValid
{
  return !-[ICParticipantsFilterTypeSelection isEmpty](self, "isEmpty");
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;

  if (-[ICParticipantsFilterTypeSelection selectionType](self, "selectionType") != 2)
    return 0;
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICParticipantsFilterTypeSelection;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingIsValid);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObjectsFromArray:", &unk_1E771AC20);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)rawFilterValue
{
  unint64_t v2;

  v2 = -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType");
  if (v2 - 1 > 2)
    return CFSTR("me");
  else
    return off_1E76CF068[v2 - 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICParticipantsFilterTypeSelection *v5;
  void *v6;
  void *v7;
  ICParticipantsFilterTypeSelection *v8;
  void *v9;
  void *v10;

  v5 = +[ICParticipantsFilterTypeSelection allocWithZone:](ICParticipantsFilterTypeSelection, "allocWithZone:");
  -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFilterTypeSelection accountObjectID](self, "accountObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICParticipantsFilterTypeSelection initWithManagedObjectContext:accountObjectID:](v5, "initWithManagedObjectContext:accountObjectID:", v6, v7);

  -[ICParticipantsFilterTypeSelection setSelectionType:](v8, "setSelectionType:", -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType"));
  -[ICParticipantsFilterTypeSelection setJoinOperator:](v8, "setJoinOperator:", -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"));
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[ICParticipantsFilterTypeSelection setParticipantUserIDs:](v8, "setParticipantUserIDs:", v10);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ICParticipantsFilterTypeSelection *v4;
  ICParticipantsFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICParticipantsFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICParticipantsFilterTypeSelection isEqualToICParticipantsFilterTypeSelection:](self, "isEqualToICParticipantsFilterTypeSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  v15 = ICHashWithHashKeys(v4, v8, v9, v10, v11, v12, v13, v14, v6);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "hash");
        v15 += ICHashWithHashKeys(v21, v22, v23, v24, v25, v26, v27, v28, 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  return v15;
}

- (BOOL)isEqualToICParticipantsFilterTypeSelection:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType");
  if (v5 == objc_msgSend(v4, "selectionType")
    && (v6 = -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"),
        v6 == objc_msgSend(v4, "joinOperator")))
  {
    -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "participantUserIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToSet:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (unint64_t)joinOperator
{
  return self->_joinOperator;
}

- (void)setJoinOperator:(unint64_t)a3
{
  self->_joinOperator = a3;
}

- (NSSet)participantUserIDs
{
  return self->_participantUserIDs;
}

- (void)setParticipantUserIDs:(id)a3
{
  objc_storeStrong((id *)&self->_participantUserIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantUserIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
