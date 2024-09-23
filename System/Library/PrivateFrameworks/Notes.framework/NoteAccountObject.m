@implementation NoteAccountObject

- (void)didTurnIntoFault
{
  objc_super v3;

  -[NoteAccountObject setConstraints:](self, "setConstraints:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NoteAccountObject;
  -[NoteAccountObject didTurnIntoFault](&v3, sel_didTurnIntoFault);
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventMovingNotesToOtherAccounts, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

+ (BOOL)shouldDataAccessCreateAccountForACAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "parentAccount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  v8 = objc_msgSend(v7, "isEnabledForDataclass:", *MEMORY[0x1E0C8EED8]);
  if ((objc_msgSend(v7, "aa_isNotesMigrated") & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E98]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "BOOLValue") ^ 1;

  }
  return v8 & v9;
}

- (id)predicateForNotes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  -[NoteAccountObject stores](self, "stores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("(store IN %@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)collectionInfo
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", CFSTR("Account"), CFSTR("NoteCollectionType"));
  -[NoteAccountObject accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("NoteCollectionPrimaryIdentifier"));

  return v3;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NoteAccountObject;
  -[NoteAccountObject willSave](&v9, sel_willSave);
  if (-[NoteAccountObject isInserted](self, "isInserted"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteAccountObject accountIdentifier](self, "accountIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "displayAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E90]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if ((_DWORD)v8 != -[NoteAccountObject didChooseToMigrate](self, "didChooseToMigrate"))
        -[NoteAccountObject setDidChooseToMigrate:](self, "setDidChooseToMigrate:", v8);
    }

  }
}

- (id)storeForExternalId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v6 = (void *)MEMORY[0x1E0C97B20];
  -[NoteAccountObject managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityForName:inManagedObjectContext:", CFSTR("Store"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntity:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(account == %@) AND (externalIdentifier == %@)"), self, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v9);

  -[NoteAccountObject managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v5, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v12)
  {
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error getting store for external identifier %@: %@, %@"), v4, v12, v13);

  }
  objc_msgSend(v11, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setAccountType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteAccountObject setType:](self, "setType:", v4);

}

- (int64_t)accountType
{
  void *v2;
  int64_t v3;

  -[NoteAccountObject type](self, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)preventMovingNotesToOtherAccounts
{
  NSNumber *preventMovingNotesToOtherAccounts;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSNumber *v17;
  NSNumber *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  preventMovingNotesToOtherAccounts = self->_preventMovingNotesToOtherAccounts;
  if (!preventMovingNotesToOtherAccounts)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteAccountObject accountIdentifier](self, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "displayAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MFRestrictMessageTransfersToOtherAccounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "displayAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MCAccountIsManaged"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x2050000000;
        v14 = (void *)getMCProfileConnectionClass_softClass;
        v24 = getMCProfileConnectionClass_softClass;
        if (!getMCProfileConnectionClass_softClass)
        {
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __getMCProfileConnectionClass_block_invoke;
          v20[3] = &unk_1E81EACA0;
          v20[4] = &v21;
          __getMCProfileConnectionClass_block_invoke((uint64_t)v20);
          v14 = (void *)v22[3];
        }
        v15 = objc_retainAutorelease(v14);
        _Block_object_dispose(&v21, 8);
        objc_msgSend(v15, "sharedConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v16, "isOpenInRestrictionInEffect");

      }
      else
      {
        v10 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v18 = self->_preventMovingNotesToOtherAccounts;
    self->_preventMovingNotesToOtherAccounts = v17;

    preventMovingNotesToOtherAccounts = self->_preventMovingNotesToOtherAccounts;
  }
  return -[NSNumber BOOLValue](preventMovingNotesToOtherAccounts, "BOOLValue");
}

- (void)setPathToConstraintsPlist:(id)a3
{
  id v4;

  v4 = a3;
  -[NoteAccountObject setConstraints:](self, "setConstraints:", 0);
  -[NoteAccountObject setConstraintsPath:](self, "setConstraintsPath:", v4);

}

- (NSDictionary)constraints
{
  void *v3;
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *constraints;
  NSDictionary *v8;

  if (!self->_constraints)
  {
    -[NoteAccountObject constraintsPath](self, "constraintsPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0C99D80]);
      -[NoteAccountObject constraintsPath](self, "constraintsPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSDictionary *)objc_msgSend(v4, "initWithContentsOfFile:", v5);
      constraints = self->_constraints;
      self->_constraints = v6;

    }
    else
    {
      v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v5 = self->_constraints;
      self->_constraints = v8;
    }

  }
  return self->_constraints;
}

- (BOOL)shouldMarkNotesAsDeleted
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NoteAccountObject constraints](self, "constraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", 0x1E81EB7F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", 0x1E81EB810);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)validateDefaultStore:(id *)a3 error:(id *)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (!*a3)
    return 1;
  -[NoteAccountObject stores](self, "stores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *a3);

  if (a4 && (v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB28A8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Tried to use default store not from within account's stores."), CFSTR("reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1550, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return v7;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (BOOL)isICloudIMAPAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteAccountObject accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8F030]);
  return (char)v6;
}

- (NSString)searchDomainIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NoteAccountObject accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v6;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)titleForTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All %@"), CFSTR("All %@"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteAccountObject name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isMovable
{
  return 0;
}

- (int64_t)visibilityTestingType
{
  return 2;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Legacy");
}

- (unint64_t)searchResultsSection
{
  return 3;
}

- (unint64_t)searchResultType
{
  return 3;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NoteAccountObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  return (CSSearchableItemAttributeSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NoteAccountObject userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteAccountObject name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v4);

  -[NoteAccountObject name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextContent:", v5);

  objc_msgSend(v3, "setIc_searchResultType:", 3);
  if (-[NoteAccountObject preventMovingNotesToOtherAccounts](self, "preventMovingNotesToOtherAccounts"))
    v6 = &unk_1E81F0258;
  else
    v6 = &unk_1E81F0270;
  objc_msgSend(v3, "setDataOwnerType:", v6);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NoteAccountObject associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);
  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

@end
