@implementation NoteObject

- (void)setContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NoteObject body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setContent:", v5);
  else
    NSLog(CFSTR("The body object is of an unexpected type - %@ %@"), self, v4);

}

- (id)defaultTitleForEmptyNote
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NEW_NOTE"), CFSTR("New Note"), 0, 1);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NoteObject title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0D64278];
    ICCheckedProtocolCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userActivityPersistentIdentifierForNote:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CA5920];
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteSavedUserActivitiesWithPersistentIdentifiers:completionHandler:", v11, &__block_literal_global_1);

    }
  }
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "length"),
        v13,
        v12,
        !v14))
  {
    -[NoteObject defaultTitleForEmptyNote](self, "defaultTitleForEmptyNote");
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v15;
  }
  -[NoteObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("title"));
  -[NoteObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("title"));
  -[NoteObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("title"));

}

- (NSString)content
{
  void *v2;
  void *v3;

  -[NoteObject body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)contentAsPlainText
{
  void *v2;
  void *v3;

  -[NoteObject body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentAsPlainText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)contentAsPlainTextPreservingNewlines
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[NoteObject isPlainText](self, "isPlainText");
  -[NoteObject body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "content");
  else
    objc_msgSend(v4, "contentAsPlainTextPreservingNewlines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setIsPlainText:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteObject setContentType:](self, "setContentType:", v4);

}

- (BOOL)isPlainText
{
  void *v2;
  BOOL v3;

  -[NoteObject contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 1;

  return v3;
}

- (void)markForDeletion
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteObject setDeletedFlag:](self, "setDeletedFlag:", v3);

}

- (BOOL)isMarkedForDeletion
{
  void *v2;
  char v3;

  -[NoteObject deletedFlag](self, "deletedFlag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isBeingMarkedForDeletion
{
  void *v3;
  void *v4;
  int v5;

  if (-[NoteObject isMarkedForDeletion](self, "isMarkedForDeletion"))
  {
    -[NoteObject committedValuesForKeys:](self, "committedValuesForKeys:", &unk_1E81F0240);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deletedFlag"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSURL)noteId
{
  void *v2;
  void *v3;

  -[NoteObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setFlags:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteObject setExternalFlags:](self, "setExternalFlags:", v4);

}

- (unint64_t)flags
{
  void *v2;
  unint64_t v3;

  -[NoteObject externalFlags](self, "externalFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (void)setServerIntId:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteObject setExternalServerIntId:](self, "setExternalServerIntId:", v4);

}

- (int64_t)serverIntId
{
  void *v2;
  int64_t v3;

  -[NoteObject externalServerIntId](self, "externalServerIntId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (BOOL)hasValidServerIntId
{
  void *v2;
  uint64_t v3;

  -[NoteObject externalServerIntId](self, "externalServerIntId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return (unint64_t)(v3 + 0xFFFFFFFFLL) < 0x1FFFFFFFFLL;
}

- (NSData)externalRepresentation
{
  void *v2;
  void *v3;

  -[NoteObject body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setExternalRepresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NoteObject body](self, "body");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalRepresentation:", v4);

}

- (NSString)externalContentRef
{
  void *v2;
  void *v3;

  -[NoteObject body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalContentRef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setExternalContentRef:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NoteObject body](self, "body");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalContentRef:", v4);

}

- (BOOL)containsAttachments
{
  void *v2;
  BOOL v3;

  -[NoteObject attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteObject setExternalSequenceNumber:](self, "setExternalSequenceNumber:", v4);

}

- (unint64_t)sequenceNumber
{
  void *v2;
  unint64_t v3;

  -[NoteObject externalSequenceNumber](self, "externalSequenceNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (BOOL)belongsToCollection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[NoteObject store](self, "store"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NoteObject store](self, "store");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isEqual:", v4);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isSearchIndexableNote
{
  return 1;
}

- (BOOL)isPasswordProtected
{
  return 0;
}

- (BOOL)isModernNote
{
  return 0;
}

- (BOOL)isSharedViaICloud
{
  return 0;
}

- (BOOL)isSharedViaICloudFolder
{
  return 0;
}

- (BOOL)isSharedReadOnly
{
  return 0;
}

- (BOOL)isUnsupported
{
  return 0;
}

- (BOOL)isMovable
{
  return 1;
}

- (BOOL)isPinnable
{
  return 0;
}

- (BOOL)isDeletable
{
  return 1;
}

- (NSString)trimmedTitle
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[NoteObject title](self, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &stru_1E81EB410;
  if (v2)
    v4 = (__CFString *)v2;
  v5 = v4;

  if (-[__CFString length](v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "ic_whitespaceAndNewlineCoalescedString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)folderName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NoteObject store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteObject store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NoteObject store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (NSString)folderManagedIdentifier
{
  void *v2;
  void *v3;

  -[NoteObject store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)accountName
{
  void *v2;
  void *v3;
  void *v4;

  -[NoteObject store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
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
  return 1;
}

- (unint64_t)searchResultType
{
  return 0;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 1;
}

- (BOOL)isHiddenFromIndexing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[NoteObject store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  if ((-[NoteObject isDeleted](self, "isDeleted") & 1) != 0)
    return 1;
  if (-[NoteObject isMarkedForDeletion](self, "isMarkedForDeletion"))
    return 1;
  -[NoteObject store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "didChooseToMigrate");

  if ((v7 & 1) != 0)
    return 1;
  v9 = (void *)MEMORY[0x1E0D641A8];
  -[NoteObject store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "isAccountReindexedForMigration:", v12);

  return (char)v9;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSSet)noteCellKeyPaths
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("modificationDate"), CFSTR("body.content"), 0);
}

- (NSString)noteAsPlainTextWithoutTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D64238];
  -[NoteObject title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteObject contentAsPlainTextPreservingNewlines](self, "contentAsPlainTextPreservingNewlines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingTitle:fromString:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)contentInfoText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0D64238];
  -[NoteObject noteAsPlainTextWithoutTitle](self, "noteAsPlainTextWithoutTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snippetForContent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteObject attachments](self, "attachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (NSString)widgetInfoText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0D64238];
  -[NoteObject noteAsPlainTextWithoutTitle](self, "noteAsPlainTextWithoutTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetSnippetForContent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteObject attachments](self, "attachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NoteObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)currentStatus
{
  return 0;
}

- (BOOL)hasUnreadChanges
{
  return 0;
}

- (BOOL)isPinned
{
  return 0;
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
  void *v10;
  void *v11;

  +[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NoteObject store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v8;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
  -[NoteObject creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentCreationDate:", v4);

  -[NoteObject modificationDate](self, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentModificationDate:", v5);

  -[NoteObject title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v6);

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  -[NoteObject userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D64238];
  -[NoteObject noteAsPlainTextWithoutTitle](self, "noteAsPlainTextWithoutTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetForContent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentDescription:", v6);

  -[NoteObject noteAsPlainTextWithoutTitle](self, "noteAsPlainTextWithoutTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextContent:", v7);

  objc_msgSend(v3, "setIc_searchResultType:", 0);
  -[NoteObject store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "preventMovingNotesToOtherAccounts"))
    v10 = &unk_1E81F0318;
  else
    v10 = &unk_1E81F0330;
  objc_msgSend(v3, "setDataOwnerType:", v10);

  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NoteObject searchableItemViewAttributeSet](self, "searchableItemViewAttributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAttributesFromAttributeSet:", v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NoteObject associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v16[2] = CFSTR("com.apple.notes.htmlnoteitemprovider");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProviderDataTypes:", v14);

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemViewAttributeSet
{
  void *v3;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D64E98], "makeNoteSearchResultViewWithNote:attachmentURL:", self, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NoteObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[NoteObject managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke;
  v9[3] = &unk_1E81EADB0;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentAsPlainText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = v4;
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    return;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.notes.htmlnoteitemprovider")))
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke_cold_1(v10);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __57__NoteObject_SearchIndexableNote__dataForTypeIdentifier___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C88D8000, log, OS_LOG_TYPE_ERROR, "The NoteObjectItemProviderUTI should never be requested", v1, 2u);
}

@end
