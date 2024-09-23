@implementation ICNote

- (BOOL)shouldReleaseDocumentWhenTurningIntoFault
{
  void *v4;
  char v5;

  if (!self->_document || -[ICNote preventReleasingTextStorage](self, "preventReleasingTextStorage"))
    return 0;
  -[ICNote noteData](self, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsToBeSaved");

  return v5 ^ 1;
}

- (id)textDataDecryptedIfNecessary
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  if ((-[ICNote isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
  {
    if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated")
      && !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported"))
    {
      -[ICNote decryptedData](self, "decryptedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "decrypt");

      }
      -[ICNote decryptedData](self, "decryptedData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote setDecryptedData:](self, "setDecryptedData:", 0);
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    -[ICNote noteData](self, "noteData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)willRefresh:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  -[ICNote willRefresh:](&v8, sel_willRefresh_);
  if (self->_document)
  {
    -[ICNote noteData](self, "noteData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote noteData](self, "noteData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v7, v3);

  }
}

- (BOOL)preventReleasingTextStorage
{
  return self->preventReleasingTextStorage;
}

- (BOOL)needsInitialDerivedAttributesUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ICNote hasChecklist](self, "hasChecklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICNote hasChecklistInProgress](self, "hasChecklistInProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ICNote hasSystemTextAttachments](self, "hasSystemTextAttachments");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[ICNote hasEmphasis](self, "hasEmphasis");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)contentInfoText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;

  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    +[ICNote snippetForPasswordProtectedNote:](ICNote, "snippetForPasswordProtectedNote:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_class();
    -[ICNote snippet](self, "snippet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNote attachmentContentInfoType](self, "attachmentContentInfoType");
    v7 = -[ICNote attachmentContentInfoCount](self, "attachmentContentInfoCount");
    -[ICNote account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentInfoTextWithSnippet:attachmentContentInfoType:attachmentContentInfoCount:account:", v5, v6, v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

+ (id)contentInfoTextWithSnippet:(id)a3 attachmentContentInfoType:(signed __int16)a4 attachmentContentInfoCount:(int64_t)a5 account:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "ic_containsHashtagPrefix");
  if (v10 && v11)
  {
    objc_msgSend(v9, "ic_withoutHashtagPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICHashtag hashtagWithStandardizedContent:account:](ICHashtag, "hashtagWithStandardizedContent:account:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v15, "ic_withHashtagPrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }

  }
  if (objc_msgSend(v9, "length"))
  {
    v17 = v9;
  }
  else
  {
    -[objc_class contentInfoTextWithAttachmentCount:](+[ICAttachmentModel modelClassForAttachmentType:](ICAttachmentModel, "modelClassForAttachmentType:", v8), "contentInfoTextWithAttachmentCount:", a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v17;
LABEL_10:

  return v16;
}

- (BOOL)hasUnreadChanges
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  ICTTMergeableStringVersionedDocument *document;
  void *v11;
  int v12;

  -[ICCloudSyncingObject serverRecord](self, "serverRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModifiedUserRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C94730]);

  -[ICCloudSyncingObject modificationDate](self, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote lastViewedModificationDate](self, "lastViewedModificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "ic_isLaterThanDate:", v8);

  document = self->_document;
  if (document)
  {
    -[ICTTMergeableStringVersionedDocument mergeableString](document, "mergeableString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasLocalChanges") ^ 1;

  }
  else
  {
    LOBYTE(v12) = 1;
  }
  return v9 & ~v6 & v12;
}

- (id)attachmentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICNote attachments](self, "attachments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v4, v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaIDToUserID, 0);
  objc_storeStrong((id *)&self->updateLinksSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_outlineState, 0);
  objc_storeStrong((id *)&self->_recentUpdatesFirstSeenDate, 0);
  objc_storeStrong((id *)&self->_recentUpdatesGenerationDate, 0);
  objc_storeStrong(&self->_reservedForTextContentStorage, 0);
  objc_storeStrong(&self->_reservedForCollaborationColorManager, 0);
  objc_storeStrong((id *)&self->_lastViewedTimestamp, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTimestamp, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->decryptedData, 0);
  objc_storeStrong((id *)&self->archivedTimestamp, 0);
  objc_storeStrong((id *)&self->_noteDidSaveBlocks, 0);
  objc_destroyWeak(&self->_noteDidSaveObserver);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __27__ICNote_hasThumbnailImage__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isVisible"))
  {
    objc_msgSend(v7, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showThumbnailInNoteList");

    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (BOOL)isVisible
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  if (!-[ICCloudSyncingObject isVisible](&v6, sel_isVisible))
    return 0;
  -[ICNote folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "folderType") != 1;

  return v4;
}

- (void)willTurnIntoFault
{
  ICTTMergeableStringVersionedDocument *document;
  ICTTVectorMultiTimestamp *lastNotifiedTimestamp;
  ICTTVectorMultiTimestamp *lastViewedTimestamp;
  ICMergeableDictionary *replicaIDToUserID;
  ICOutlineState *outlineState;
  objc_super v8;

  if ((-[ICNote ic_isTransitioning](self, "ic_isTransitioning") & 1) == 0
    && (-[ICNote isFault](self, "isFault") & 1) == 0)
  {
    -[ICNote setWasAuthenticatedBeforeTurningIntoFault:](self, "setWasAuthenticatedBeforeTurningIntoFault:", -[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"));
  }
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  -[ICNote willTurnIntoFault](&v8, sel_willTurnIntoFault);
  if (self->_document)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((-[ICNote shouldReleaseTextStorageWhenTurningIntoFault](self, "shouldReleaseTextStorageWhenTurningIntoFault") & 1) == 0)
        goto LABEL_12;
    }
    else if (!-[ICNote shouldReleaseDocumentWhenTurningIntoFault](self, "shouldReleaseDocumentWhenTurningIntoFault"))
    {
      goto LABEL_12;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICNote noteWillReleaseTextStorage](self, "noteWillReleaseTextStorage");
    document = self->_document;
    self->_document = 0;

  }
LABEL_12:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote noteWillTurnIntoFault](self, "noteWillTurnIntoFault");
  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  self->_lastNotifiedTimestamp = 0;

  lastViewedTimestamp = self->_lastViewedTimestamp;
  self->_lastViewedTimestamp = 0;

  replicaIDToUserID = self->_replicaIDToUserID;
  self->_replicaIDToUserID = 0;

  outlineState = self->_outlineState;
  self->_outlineState = 0;

}

void __35__ICNote_attachmentContentInfoType__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  int v7;
  unsigned __int16 v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(v9, "shouldShowInContentInfoText");
  v6 = v9;
  if (v5)
  {
    if (!objc_msgSend(v9, "attachmentType") || objc_msgSend(v9, "attachmentType") == 1)
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
LABEL_5:
      v6 = v9;
      goto LABEL_6;
    }
    v7 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = objc_msgSend(v9, "attachmentType");
    if (!v7)
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      goto LABEL_5;
    }
    v6 = v9;
    if (v7 != v8)
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
LABEL_6:

}

- (int64_t)attachmentContentInfoCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ICNote attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldShowInContentInfoText"))
        {
          objc_msgSend(v10, "attachmentModel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isIncludedInGenericAttachmentCount");

          v6 += v12;
          objc_msgSend(v10, "attachmentModel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_class();

          if (v14 == objc_opt_class())
            ++v7;
          else
            objc_msgSend(v18, "addObject:", v14);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  if (objc_msgSend(v18, "count") == 1 && v7 == 0)
  {
    objc_msgSend(v18, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v18, "countForObject:", v16);

  }
  return v6;
}

- (void)setWasAuthenticatedBeforeTurningIntoFault:(BOOL)a3
{
  self->wasAuthenticatedBeforeTurningIntoFault = a3;
}

- (BOOL)isDeletedOrInTrash
{
  void *v4;
  char v5;

  if ((-[ICNote markedForDeletion](self, "markedForDeletion") & 1) != 0)
    return 1;
  -[ICNote folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTrashFolder");

  return v5;
}

- (id)reservedForTextContentStorage
{
  return self->_reservedForTextContentStorage;
}

- (ICTTMergeableStringVersionedDocument)documentWithoutCreating
{
  return self->_document;
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if ((-[ICNote isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
    return 0;
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    -[ICNote folder](self, "folder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSharedViaICloud");

    if (!v5)
      return 0;
  }
  -[ICNote mergeableString](self, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICNote mergeableString](self, "mergeableString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)mergeableString
{
  void *v2;
  void *v3;

  -[ICNote document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTTMergeableStringVersionedDocument)document
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICTTMergeableStringVersionedDocument *v7;
  void *v8;
  ICTTMergeableStringVersionedDocument *v9;
  ICTTMergeableStringVersionedDocument *document;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_document)
    {
      -[ICNote textDataDecryptedIfNecessary](self, "textDataDecryptedIfNecessary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[ICNote isPasswordProtected](self, "isPasswordProtected")
        || (-[ICNote noteData](self, "noteData"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "data"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v6,
            v5,
            v4)
        || !v6)
      {
        v7 = [ICTTMergeableStringVersionedDocument alloc];
        -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[ICTTVersionedDocument initWithData:replicaID:](v7, "initWithData:replicaID:", v4, v8);
        document = self->_document;
        self->_document = v9;

        -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDelegate:", self);

        -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote setArchivedTimestamp:](self, "setArchivedTimestamp:", v13);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ICNote noteDidReplaceDocument](self, "noteDidReplaceDocument");
        -[ICCloudSyncingObject mergeUnappliedEncryptedRecord](self, "mergeUnappliedEncryptedRecord");
      }

    }
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Trying to access the text storage on a note that has no managed object context: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  return self->_document;
}

- (id)cloudAccount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICNote account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICNote folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setArchivedTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setReservedForTextContentStorage:(id)a3
{
  objc_storeStrong(&self->_reservedForTextContentStorage, a3);
}

+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 accountID:(id)a5 context:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E0CB37A0];
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithString:", CFSTR("identifier ==[c] %@"));
  v15 = v14;
  if (!a4)
    objc_msgSend(v14, "appendString:", CFSTR(" AND markedForDeletion = NO"));
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v17 = (void *)MEMORY[0x1E0CB3880];
  v18 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v17, "predicateWithFormat:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(a1, "predicateForNotesInAccountWithIdentifier:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notesMatchingPredicate:context:", v23, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNote *)v25;
}

+ (id)notesMatchingPredicate:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D64230];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (ICNote)noteWithIdentifier:(id)a3 context:(id)a4
{
  return (ICNote *)objc_msgSend(a1, "noteWithIdentifier:includeDeleted:context:", a3, 1, a4);
}

+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5
{
  return (ICNote *)objc_msgSend(a1, "noteWithIdentifier:includeDeleted:accountID:context:", a3, a4, 0, a5);
}

- (int64_t)currentStatus
{
  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
      return 2;
    else
      return 1;
  }
  else if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud")
         && !-[ICNote isSharedViaICloudFolder](self, "isSharedViaICloudFolder"))
  {
    return 3;
  }
  else if (-[ICNote isSharedViaICloudFolder](self, "isSharedViaICloudFolder"))
  {
    return 4;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSharedViaICloudFolder
{
  _BOOL4 v3;

  v3 = -[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud");
  if (v3)
    LOBYTE(v3) = !-[ICCloudSyncingObject isSharedRootObject](self, "isSharedRootObject");
  return v3;
}

- (BOOL)hasThumbnailImage
{
  void *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if ((-[ICNote isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
  {
    -[ICNote attachments](self, "attachments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__ICNote_hasThumbnailImage__block_invoke;
    v6[3] = &unk_1E76C7FD0;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (signed)attachmentContentInfoType
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __int16 v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[ICNote attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__ICNote_attachmentContentInfoType__block_invoke;
  v4[3] = &unk_1E76C7FD0;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOWORD(v2) = *((_WORD *)v6 + 12);
  _Block_object_dispose(&v5, 8);
  return (__int16)v2;
}

- (NSString)folderName
{
  void *v2;
  void *v3;

  -[ICNote folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)ICNote;
  -[ICNote dealloc](&v3, sel_dealloc);
}

+ (unint64_t)countOfNotesMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  objc_msgSend(v8, "setPredicate:", v7);

  v9 = objc_msgSend(v6, "countForFetchRequest:error:", v8, 0);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;

  return v9;
}

+ (id)newFetchRequestForNotes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ICNote"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v3);

  return v2;
}

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  -[ICCloudSyncingObject awakeFromFetch](&v6, sel_awakeFromFetch);
  if (self->_document)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICNote documentMergeController](self, "documentMergeController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __24__ICNote_awakeFromFetch__block_invoke;
      v5[3] = &unk_1E76C73F8;
      v5[4] = self;
      objc_msgSend(v3, "requestMergeWithBlock:", v5);

    }
    else
    {
      -[ICNote mergeNotePrimitiveData](self, "mergeNotePrimitiveData");
    }
    if (-[ICNote wasAuthenticatedBeforeTurningIntoFault](self, "wasAuthenticatedBeforeTurningIntoFault"))
    {
      if (-[ICCloudSyncingObject isPasswordProtectedAndLocked](self, "isPasswordProtectedAndLocked"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNoteDidDeauthenticateAfterMergeNotification"), self);

      }
    }
  }
}

+ (id)predicateForPinnedNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPinned == YES"));
}

- (void)didRefresh:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICNote;
  -[ICNote didRefresh:](&v13, sel_didRefresh_, a3);
  if (self->_document)
  {
    v4 = (void *)MEMORY[0x1E0CB3880];
    -[ICNote noteData](self, "noteData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("self == %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNoteData ic_objectsMatchingPredicate:context:](ICNoteData, "ic_objectsMatchingPredicate:context:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICNote didRefresh:].cold.3(self, v9);

    }
    -[ICNote identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.notes", "CoreData");
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        -[ICNote didRefresh:].cold.2(self);
    }
    else if (v12)
    {
      -[ICNote didRefresh:].cold.1(self);
    }

  }
}

uint64_t __48__ICNote_enumerateAttachmentsInOrderUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __27__ICNote_didChangeNoteText__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "mergeableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasLocalChanges"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mergeableString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "archivedTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compareTo:", v5);

    if ((v6 & 4) == 0)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isEmpty"));
  objc_msgSend(*(id *)(a1 + 32), "noteData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "needsToBeSaved");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "willChangeValueForKey:", CFSTR("data"));

    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsToBeSaved:", 1);

    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didChangeValueForKey:", CFSTR("data"));

  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isEmpty"));
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailAttachmentIdentifier:", 0);
}

- (BOOL)prefersLightBackground
{
  return -[ICNote preferredBackgroundType](self, "preferredBackgroundType") == 2;
}

- (id)childCloudObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICNote attachments](self, "attachments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v9);
        objc_msgSend(v9, "media");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "media");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[ICNote inlineAttachments](self, "inlineAttachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (BOOL)canBeSharedViaICloud
{
  void *v3;
  int v4;
  objc_super v6;

  if (!-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    -[ICNote folder](self, "folder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "folderType");

    if (v4 == 1)
      return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  return -[ICCloudSyncingObject canBeSharedViaICloud](&v6, sel_canBeSharedViaICloud);
}

- (BOOL)showsCollaboratorCursors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote showsCollaboratorCursorsUserDefaultsKey](self, "showsCollaboratorCursorsUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v5);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote showsCollaboratorCursorsUserDefaultsKey](self, "showsCollaboratorCursorsUserDefaultsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "BOOLForKey:", v7);

  return (char)self;
}

- (id)showsCollaboratorCursorsUserDefaultsKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICNote identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), v3, CFSTR("ICNoteShouldShowCollaboratorCursors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)regenerateTitleAndSnippetIfNecessaryForEdit:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  NSRange v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;

  if ((a3 & 2) == 0)
    return 0;
  length = a4.length;
  location = a4.location;
  v9 = -[ICNote rangeForTitle:](self, "rangeForTitle:", 0, a4.location, a4.length, a5);
  v11.length = v10 + v9 + 1;
  if (location < v11.length)
    return -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
  v12 = v9;
  v13 = v10;
  v17.location = location;
  v17.length = length;
  v11.location = 0;
  if (NSIntersectionRange(v17, v11).length)
    return -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
  v14 = -[ICNote rangeForSnippetWithTitleRange:](self, "rangeForSnippetWithTitleRange:", v12, v13);
  v16.length = v15 + v14 + 1;
  if (location < v16.length)
    return -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
  v18.location = location;
  v18.length = length;
  v16.location = 0;
  return NSIntersectionRange(v18, v16).length
      && -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
}

- (BOOL)needsRefresh
{
  return self->needsRefresh;
}

- (BOOL)isSharedAndEmpty
{
  _BOOL4 v3;

  v3 = -[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud");
  if (v3)
    LOBYTE(v3) = -[ICNote isEmpty](self, "isEmpty");
  return v3;
}

- (BOOL)isSharable
{
  _BOOL4 v3;

  if (!-[ICNote isPasswordProtected](self, "isPasswordProtected")
    || (v3 = -[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated")))
  {
    if (-[ICNote isDeletedOrInTrash](self, "isDeletedOrInTrash") || -[ICNote isEmpty](self, "isEmpty"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
  }
  return v3;
}

- (BOOL)isNewNoteWithHashtagsInsertedIntoBody
{
  return self->_isNewNoteWithHashtagsInsertedIntoBody;
}

- (BOOL)isEditable
{
  void *v3;
  int v4;

  -[ICNote folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsEditingNotes");

  if (v4 && !-[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly"))
    return !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
  else
    return 0;
}

- (BOOL)hasVisibleInlineAttachments
{
  void *v2;
  void *v3;
  char v4;

  -[ICNote inlineAttachments](self, "inlineAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "ic_containsObjectMatchingPredicate:", v3);

  return v4;
}

- (void)enumerateAttachmentsInOrderUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote uiAttributedString](self, "uiAttributedString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ICNote_enumerateAttachmentsInOrderUsingBlock___block_invoke;
  v9[3] = &unk_1E76C7FA8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "ic_enumerateAttachmentsInContext:usingBlock:", v7, v9);

}

- (void)didChangeNoteText
{
  void *v3;
  _QWORD v4[5];

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__ICNote_didChangeNoteText__block_invoke;
  v4[3] = &unk_1E76C73F8;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (id)attributedString
{
  void *v2;
  void *v3;

  -[ICNote mergeableString](self, "mergeableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTTVectorMultiTimestamp)archivedTimestamp
{
  return self->archivedTimestamp;
}

+ (id)keyPathsForValuesAffectingPrefersLightBackground
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("preferredBackgroundType"));
}

- (void)mergeNotePrimitiveData
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not decrypting %@ for merging note primitive data because we are not authenticated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)prepareForDeletion
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error removing paper coherence file: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __24__ICNote_awakeFromFetch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeNotePrimitiveData");
}

- (void)willSave
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[ICNote changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded](self, "updateDeviceReplicaIDsToUserIDIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  -[ICCloudSyncingObject willSave](&v6, sel_willSave);
}

- (void)didSave
{
  id WeakRetained;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)ICNote;
  -[ICNote didSave](&v14, sel_didSave);
  WeakRetained = objc_loadWeakRetained(&self->_noteDidSaveObserver);

  if (!WeakRetained)
  {
    -[ICNote ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICNoteDidSaveNotification"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&self->_noteDidSaveObserver, v4);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_noteDidSaveBlocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_noteDidSaveBlocks, "removeAllObjects", (_QWORD)v10);
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  int64_t result;
  void *v6;
  char v7;
  void *v8;
  char v9;
  int64_t v10;
  objc_super v11;

  if (-[ICCloudSyncingObject isUnsupported](self, "isUnsupported")
    || -[ICCloudSyncingObject needsInitialFetchFromCloudCheckingParent](self, "needsInitialFetchFromCloudCheckingParent"))
  {
    return -[ICNote minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  }
  -[ICNote hasEmphasis](self, "hasEmphasis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0
    || (-[ICNote hasSystemTextAttachments](self, "hasSystemTextAttachments"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 14;
  }
  else if (-[ICNote hasVisibleInlineAttachments](self, "hasVisibleInlineAttachments"))
  {
    if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
      v10 = 13;
    else
      v10 = 6;
  }
  else
  {
    v10 = -[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly");
  }
  v11.receiver = self;
  v11.super_class = (Class)ICNote;
  result = -[ICCloudSyncingObject intrinsicNotesVersionForScenario:](&v11, sel_intrinsicNotesVersionForScenario_, a3);
  if (v10 > result)
    return v10;
  return result;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

- (void)setAttachmentViewType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  if (-[ICNote attachmentViewType](self, "attachmentViewType") != a3)
  {
    NSStringFromSelector(sel_attachmentViewType);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", v7);
    performBlockOnMainThread();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, v7);

    v6 = (id)-[ICNote ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidChangePreferredSizeNotification"));
    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", v7);

  }
}

void __32__ICNote_setAttachmentViewType___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("ICAttachmentWillChangePreferredSizeNotification"), 0);

}

- (void)updateAttachmentViewTypeAndPropagateToAttachments:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[ICNote attachmentViewType](self, "attachmentViewType") != a3)
    goto LABEL_4;
  -[ICNote distinctAttachmentViewTypes](self, "distinctAttachmentViewTypes");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {

LABEL_4:
    if (-[ICNote attachmentViewType](self, "attachmentViewType") != (_DWORD)v3)
    {
      -[ICNote setAttachmentViewType:](self, "setAttachmentViewType:", v3);
      -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("User chose a new attachmentViewType"));
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICNote visibleTopLevelAttachments](self, "visibleTopLevelAttachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "resetPreferredViewSizeIfNecessary");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICNote noteDidApplyAttachmentViewTypeToAllAttachments](self, "noteDidApplyAttachmentViewTypeToAllAttachments");
    return;
  }
  if (objc_msgSend(v12, "count") != 1)
  {

    return;
  }
  objc_msgSend(v12, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 != (int)v3)
    goto LABEL_4;
}

- (NSSet)distinctAttachmentViewTypes
{
  void *v2;
  void *v3;

  -[ICNote visibleTopLevelAttachments](self, "visibleTopLevelAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_map:", &__block_literal_global_96);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __37__ICNote_distinctAttachmentViewTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(a2, "preferredViewSize"));
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:](&v6, sel_objectWasFetchedFromCloudWithRecord_accountID_, a3, a4);
  if (!-[ICNote wantsUserSpecificRecord](self, "wantsUserSpecificRecord")
    || (-[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[ICNote clearRecentUpdatesGenerationDateIfNeeded](self, "clearRecentUpdatesGenerationDateIfNeeded");
  }
}

- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  ICUserSpecificRecordIDParser *v9;
  void *v10;
  void *v11;
  ICUserSpecificRecordIDParser *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICNote;
  -[ICCloudSyncingObject didFetchUserSpecificRecord:accountID:force:](&v16, sel_didFetchUserSpecificRecord_accountID_force_, v8, a4, v5);
  if (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v9 = [ICUserSpecificRecordIDParser alloc];
    objc_msgSend(v8, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICUserSpecificRecordIDParser initWithRecordName:](v9, "initWithRecordName:", v11);

    -[ICUserSpecificRecordIDParser sharedRecordType](v12, "sharedRecordType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isEqual:", CFSTR("PasswordProtectedNote"));

    if ((_DWORD)v11)
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Deriving that placeholder note is password-protected from user-specific record {noteID: %@}", buf, 0xCu);

      }
      -[ICNote setIsPasswordProtected:](self, "setIsPasswordProtected:", 1);
    }

  }
  else
  {
    -[ICNote clearRecentUpdatesGenerationDateIfNeeded](self, "clearRecentUpdatesGenerationDateIfNeeded");
  }

}

+ (unint64_t)maxNoteTextLength
{
  return 15728640;
}

+ (unint64_t)maxNoteAttachments
{
  void *v2;
  unint64_t v3;

  +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxAttachmentsPerNote");

  return v3;
}

- (id)uuid
{
  NSUUID *uuid;
  id v4;
  void *v5;
  NSUUID *v6;
  NSUUID *v7;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[ICNote identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSUUID *)objc_msgSend(v4, "initWithUUIDString:", v5);
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)noteAsPlainText
{
  void *v2;
  void *v3;

  -[ICNote attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)quotedTitle
{
  void *v2;
  void *v3;

  -[ICNote title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_quotedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)noteAsPlainTextWithoutTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICNote searchableString](self, "searchableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D64238];
  -[ICNote title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByRemovingTitle:fromString:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)updateTimestampWithUnserializedChanges
{
  id v2;

  -[ICNote mergeableString](self, "mergeableString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateIdsForLocalChanges");

}

- (BOOL)updateLastViewedTimestampWithCurrentTimestamp
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  const __CFString *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  if (!-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
    return 0;
  -[ICNote mergeableString](self, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasLocalChanges"))
  {
    v4 = -[ICNote needsToSaveLastViewedTimestamp](self, "needsToSaveLastViewedTimestamp");

    if (!v4)
    {
      v5 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[ICNote updateLastViewedTimestampWithCurrentTimestamp].cold.3(self);

      -[ICNote setNeedsToSaveLastViewedTimestamp:](self, "setNeedsToSaveLastViewedTimestamp:", 1);
      v6 = CFSTR("Need to save last viewed timestamp on next save");
      goto LABEL_15;
    }
  }
  else
  {

  }
  -[ICNote lastViewedTimestamp](self, "lastViewedTimestamp");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ICNote timestamp](self, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote lastViewedTimestamp](self, "lastViewedTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compareTo:", v11);

    if ((v12 & 4) == 0)
    {
      v7 = 0;
      goto LABEL_16;
    }
  }
  v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ICNote updateLastViewedTimestampWithCurrentTimestamp].cold.2();

  -[ICNote timestamp](self, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote setLastViewedTimestamp:](self, "setLastViewedTimestamp:", v14);

  v6 = CFSTR("Setting last viewed timestamp");
LABEL_15:
  -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", v6);
  v7 = 1;
LABEL_16:
  if (-[ICNote hasUnreadChanges](self, "hasUnreadChanges"))
  {
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setLastViewedModificationDate:](self, "setLastViewedModificationDate:", v15);

    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Updated last viewed modification date"));
    v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ICNote updateLastViewedTimestampWithCurrentTimestamp].cold.1();

    return 1;
  }
  return v7;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  if (-[ICNote regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:](self, "regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:", a3, a4.location, a4.length, a5))
  {
    if (!-[ICCloudSyncingObject isMergingRecord](self, "isMergingRecord"))
    {
      -[ICCloudSyncingObject markShareDirtyIfNeededWithReason:](self, "markShareDirtyIfNeededWithReason:", CFSTR("Updated title after edit"));
      -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Updated title after edit"));
    }
  }
}

- (BOOL)wantsUndoCommands
{
  return 0;
}

+ (id)keyPathsForValuesAffectingIsEditable
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("folder"), CFSTR("isSharedReadOnly"), 0);
}

+ (id)keyPathsForValuesAffectingIsDeletable
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("folder.isSharedReadonly"));
}

- (BOOL)isDeletable
{
  void *v2;
  char v3;

  -[ICNote folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedReadOnly") ^ 1;

  return v3;
}

+ (BOOL)containsUndeletableNotes:(id)a3
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_129);
}

uint64_t __35__ICNote_containsUndeletableNotes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDeletable") ^ 1;
}

- (BOOL)isDuplicatable
{
  if (-[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly")
    || (-[ICNote isPasswordProtected](self, "isPasswordProtected") & 1) != 0
    || -[ICNote isDeletedOrInTrash](self, "isDeletedOrInTrash"))
  {
    return 0;
  }
  else
  {
    return !-[ICNote isEmpty](self, "isEmpty");
  }
}

+ (BOOL)containsUnduplicatableNotes:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_130);
  else
    v4 = 0;

  return v4;
}

uint64_t __38__ICNote_containsUnduplicatableNotes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDuplicatable") ^ 1;
}

- (BOOL)isLockable
{
  if (-[ICNote isDeletedOrInTrash](self, "isDeletedOrInTrash") || -[ICNote isEmpty](self, "isEmpty"))
    return 0;
  else
    return !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
}

- (BOOL)isMovable
{
  void *v3;
  _BOOL4 v4;

  -[ICNote folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isSharedReadOnly") & 1) != 0 || -[ICNote isEmpty](self, "isEmpty"))
    LOBYTE(v4) = 0;
  else
    v4 = !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");

  return v4;
}

- (BOOL)isPinnable
{
  if (-[ICNote isDeletedOrInTrash](self, "isDeletedOrInTrash") || -[ICNote isEmpty](self, "isEmpty"))
    return 0;
  else
    return !-[ICCloudSyncingObject isUnsupported](self, "isUnsupported");
}

+ (BOOL)containsUnmovableNotes:(id)a3
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_131);
}

uint64_t __33__ICNote_containsUnmovableNotes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMovable") ^ 1;
}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  return a3 < 0xF00000;
}

- (BOOL)requiresLegacyTombstoneAfterDeletion
{
  void *v3;
  void *v4;
  char v5;

  -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[ICNote account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsLegacyTombstones");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasChecklistOnlyInProgress:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ICNote attributedString](self, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__ICNote_hasChecklistOnlyInProgress___block_invoke;
  v9[3] = &unk_1E76C7D10;
  v10 = a3;
  v9[4] = &v11;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", ICTTAttributeNameParagraphStyle, 0, v6, 0, v9);

  LOBYTE(v6) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37__ICNote_hasChecklistOnlyInProgress___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "style") == 103)
  {
    if (!*(_BYTE *)(a1 + 40)
      || (objc_msgSend(v10, "todo"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "done"),
          v8,
          (v9 & 1) == 0))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

- (void)markForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  if ((-[ICNote markedForDeletion](self, "markedForDeletion") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICNoteWillBeDeletedNotification"), self);

    }
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setModificationDate:](self, "setModificationDate:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)ICNote;
  -[ICCloudSyncingObject markForDeletion](&v5, sel_markForDeletion);
}

- (void)unmarkForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[ICNote markedForDeletion](self, "markedForDeletion"))
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICNoteWillBeUndeletedNotification"), self);

    }
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setModificationDate:](self, "setModificationDate:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)ICNote;
  -[ICCloudSyncingObject unmarkForDeletion](&v5, sel_unmarkForDeletion);
}

- (void)updateChangeCountWithReason:(id)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  -[ICCloudSyncingObject updateChangeCountWithReason:](&v6, sel_updateChangeCountWithReason_, a3);
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    -[ICNote managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__ICNote_updateChangeCountWithReason___block_invoke;
    v5[3] = &unk_1E76C73F8;
    v5[4] = self;
    objc_msgSend(v4, "performBlockAndWait:", v5);

  }
}

void __38__ICNote_updateChangeCountWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("folder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("folderModificationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOwnedByCurrentUser");

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "updateUserSpecificChangeCountWithReason:", CFSTR("Side effect of changing folder or folderModificationDate"));
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "changedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastActivitySummaryViewedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_9:

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "updateUserSpecificChangeCountWithReason:", CFSTR("Side effect of changing activity timestamps"));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "changedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastActivityRecentUpdatesViewedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "changedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lastAttributionsViewedDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_10;
}

- (BOOL)attachmentCountExceeded
{
  unint64_t v2;

  v2 = -[ICNote visibleTopLevelAttachmentsCount](self, "visibleTopLevelAttachmentsCount");
  return v2 > +[ICNote maxNoteAttachments](ICNote, "maxNoteAttachments");
}

- (BOOL)canAddAttachment
{
  return -[ICNote canAddAttachments:](self, "canAddAttachments:", 1);
}

- (BOOL)canAddAttachments:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[ICNote visibleTopLevelAttachmentsCount](self, "visibleTopLevelAttachmentsCount");
  v5 = objc_msgSend((id)objc_opt_class(), "maxNoteAttachments");
  if (v4 + a3 > v5)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend((id)objc_opt_class(), "maxNoteAttachments");
      +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218752;
      v11 = a3;
      v12 = 2048;
      v13 = v4;
      v14 = 2048;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Can't add attachments %lu %lu %lu %p", (uint8_t *)&v10, 0x2Au);

    }
  }
  return v4 + a3 <= v5;
}

- (BOOL)attachmentExceedsMaxSizeAllowed:(unint64_t)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;

  v3 = a3 != 0;
  if (a3)
  {
    +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumAttachmentSizeMB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue") << 20;

    if (v7 >= a3)
      return 0;
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICNote attachmentExceedsMaxSizeAllowed:].cold.1();

  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICNote attachmentExceedsMaxSizeAllowed:].cold.2();
  }

  return v3;
}

- (BOOL)containsAttachmentsUnsupportedInPasswordProtection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ICNote attributedString](self, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote attributedString](self, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke;
  v7[3] = &unk_1E76C7D88;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v5, 0, v7);

  LOBYTE(v3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

void __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  __int128 v20;
  _BYTE *v21;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v18 = v7;
    v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EF53E378);
    v8 = v18;
    if (v9)
    {
      v10 = v18;
      objc_msgSend(v10, "attachmentUTI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:](ICAttachment, "isTypeUTISupportedForPasswordProtectedNotes:", v11))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a5 = 1;
      }
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v10, "attachmentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachmentWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "isUnsupported"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a5 = 1;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.notes.table")))
      {
        objc_opt_class();
        objc_msgSend(v14, "attachmentModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "table");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_2;
          v19[3] = &unk_1E76C7D60;
          v21 = a5;
          v20 = *(_OWORD *)(a1 + 32);
          objc_msgSend(v17, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v19);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a5 = 1;
        }

      }
      v8 = v18;
    }
  }

}

uint64_t __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  objc_msgSend(a2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_3;
  v6[3] = &unk_1E76C7D38;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v4, 0, v6);

  return 0;
}

void __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "attachmentUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && !+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:](ICAttachment, "isTypeUTISupportedForPasswordProtectedNotes:", v3))
  {
    v4 = (_BYTE *)a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *v4 = 1;
  }
  v5 = (void *)a1[4];
  objc_msgSend(v9, "attachmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isUnsupported"))
  {
    v8 = (_BYTE *)a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *v8 = 1;
  }

}

- (id)visibleAttachments
{
  void *v2;
  void *v3;

  -[ICNote attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_212);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __28__ICNote_visibleAttachments__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVisible");
}

- (id)visibleInlineAttachments
{
  void *v2;
  void *v3;

  -[ICNote inlineAttachments](self, "inlineAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_214);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __34__ICNote_visibleInlineAttachments__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVisible");
}

- (BOOL)textStorageHasAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote uiAttributedString](self, "uiAttributedString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = objc_msgSend(v5, "ic_range");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__ICNote_textStorageHasAttribute___block_invoke;
  v11[3] = &unk_1E76C7E30;
  v11[4] = &v12;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v7, v8, 0, v11);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __34__ICNote_textStorageHasAttribute___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)containsPlaceholderBlockOrInlineAttachments
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ICNote documentWithoutCreating](self, "documentWithoutCreating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!*((_BYTE *)v14 + 24))
    {
      v4 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke;
      v12[3] = &unk_1E76C7E58;
      v12[4] = &v13;
      -[ICNote enumerateAttachmentsInOrderUsingBlock:](self, "enumerateAttachmentsInOrderUsingBlock:", v12);
      if (!*((_BYTE *)v14 + 24))
      {
        v11[0] = v4;
        v11[1] = 3221225472;
        v11[2] = __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_2;
        v11[3] = &unk_1E76C7E80;
        v11[4] = &v13;
        -[ICNote enumerateInlineAttachmentsInOrderUsingBlock:](self, "enumerateInlineAttachmentsInOrderUsingBlock:", v11);
      }
    }
  }
  else if (!*((_BYTE *)v14 + 24))
  {
    -[ICNote attachments](self, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "ic_containsObjectPassingTest:", &__block_literal_global_220);
    *((_BYTE *)v14 + 24) = v6;

    if (!*((_BYTE *)v14 + 24))
    {
      -[ICNote inlineAttachments](self, "inlineAttachments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ic_containsObjectPassingTest:", &__block_literal_global_221);
      *((_BYTE *)v14 + 24) = v8;

    }
  }
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  char v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "needsInitialFetchFromCloud"))
    v7 = objc_msgSend(v8, "markedForDeletion") ^ 1;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v7;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  char v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "needsInitialFetchFromCloud"))
    v7 = objc_msgSend(v8, "markedForDeletion") ^ 1;
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v7;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

uint64_t __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "needsInitialFetchFromCloud"))
    v3 = objc_msgSend(v2, "markedForDeletion") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "needsInitialFetchFromCloud"))
    v3 = objc_msgSend(v2, "markedForDeletion") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)visibleTopLevelAttachmentsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note == %@ AND parentAttachment == nil"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v3;
  +[ICCloudSyncingObject predicateForVisibleObjects](ICCloudSyncingObject, "predicateForVisibleObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ICAttachment countOfAttachmentsMatchingPredicate:context:](ICAttachment, "countOfAttachmentsMatchingPredicate:context:", v7, v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICNote visibleTopLevelAttachments](self, "visibleTopLevelAttachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "count");

    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICNote visibleTopLevelAttachmentsCount].cold.1();

  }
  return v9;
}

- (id)visibleTopLevelAttachments
{
  void *v2;
  void *v3;

  -[ICNote visibleAttachments](self, "visibleAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_227);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __36__ICNote_visibleTopLevelAttachments__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "parentAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)allAttachmentsIncludingSubAttachments
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICNote attachments](self, "attachments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v9);
        objc_msgSend(v9, "recursivelyAddSubAttachments:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)allNoteTextAttachmentsIncludingSubAttachments:(BOOL)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  BOOL v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__ICNote_allNoteTextAttachmentsIncludingSubAttachments___block_invoke;
  v12 = &unk_1E76C7F08;
  v13 = v5;
  v14 = a3;
  v6 = v5;
  -[ICNote enumerateAttachmentsInOrderUsingBlock:](self, "enumerateAttachmentsInOrderUsingBlock:", &v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __56__ICNote_allNoteTextAttachmentsIncludingSubAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v3, "recursivelyAddSubAttachments:", *(_QWORD *)(a1 + 32));

}

- (id)allNoteTextInlineAttachments
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ICNote_allNoteTextInlineAttachments__block_invoke;
  v7[3] = &unk_1E76C7F30;
  v8 = v3;
  v4 = v3;
  -[ICNote enumerateInlineAttachmentsInOrderUsingBlock:](self, "enumerateInlineAttachmentsInOrderUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __38__ICNote_allNoteTextInlineAttachments__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)attachmentsInOrder
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__ICNote_attachmentsInOrder__block_invoke;
  v6[3] = &unk_1E76C7F58;
  v4 = v3;
  v7 = v4;
  -[ICNote enumerateAttachmentsInOrderUsingBlock:](self, "enumerateAttachmentsInOrderUsingBlock:", v6);

  return v4;
}

uint64_t __28__ICNote_attachmentsInOrder__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)enumerateAbstractAttachmentsInOrderUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote uiAttributedString](self, "uiAttributedString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "ic_range");
  v10 = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__ICNote_enumerateAbstractAttachmentsInOrderUsingBlock___block_invoke;
  v12[3] = &unk_1E76C7F80;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v5, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v7, v8, v10, 0, v12);

}

uint64_t __56__ICNote_enumerateAbstractAttachmentsInOrderUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateInlineAttachmentsInOrderUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[ICNote attributedString](self, "attributedString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote uiAttributedString](self, "uiAttributedString");
    v5 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v5;
  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "ic_range");
  objc_msgSend(v9, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v6, v7, v8, 0, v4);

}

- (_NSRange)rangeForAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICNote *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  _BYTE v28[24];
  uint64_t v29;
  _NSRange result;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3010000000;
  v26 = &unk_1BDC8BD37;
  v27 = xmmword_1BDC15B20;
  if (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[ICCloudSyncingObject ic_loggingIdentifier](self, "ic_loggingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote rangeForAttachment:].cold.1(v6, (uint64_t)v28, v5);
    }
LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "markedForDeletion") & 1) != 0
    || (objc_msgSend(v4, "note"),
        v7 = (ICNote *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == self,
        v7,
        !v8))
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "shortLoggingDescription");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      objc_claimAutoreleasedReturnValue();
      -[ICNote rangeForAttachment:].cold.2();
    }
    goto LABEL_8;
  }
  -[ICNote attributedString](self, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote uiAttributedString](self, "uiAttributedString");
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "ic_range");
  v19 = v18;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __29__ICNote_rangeForAttachment___block_invoke;
  v20[3] = &unk_1E76C7FF8;
  v21 = v4;
  v22 = &v23;
  objc_msgSend(v10, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v16, v17, v19, 0, v20);

  v5 = v21;
LABEL_9:

  v11 = v24[4];
  v12 = v24[5];
  _Block_object_dispose(&v23, 8);

  v13 = v11;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __29__ICNote_rangeForAttachment___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (id)allDrawings
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__ICNote_allDrawings__block_invoke;
  v7[3] = &unk_1E76C7F58;
  v8 = v3;
  v4 = v3;
  -[ICNote enumerateAttachmentsInOrderUsingBlock:](self, "enumerateAttachmentsInOrderUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __21__ICNote_allDrawings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handwritingRecognitionDrawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v3, "attachmentModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "newDrawingFromMergeableData");

    }
    objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v7);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v3, "attachmentType") == 13)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[ICSystemPaperDrawingsHelper drawingsForAttachment:](ICSystemPaperDrawingsHelper, "drawingsForAttachment:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v13, "setRecognitionEnabled:", 1);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (id)visibleAttachmentsWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  signed __int16 v8;

  -[ICNote visibleAttachments](self, "visibleAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICNote_visibleAttachmentsWithType___block_invoke;
  v7[3] = &__block_descriptor_34_e26_B24__0__ICAttachment_8_B16l;
  v8 = a3;
  objc_msgSend(v4, "objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __37__ICNote_visibleAttachmentsWithType___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int16 *)(a1 + 32) == (unsigned __int16)objc_msgSend(a2, "attachmentType");
}

- (id)attachmentsWithUTType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __32__ICNote_attachmentsWithUTType___block_invoke;
  v13 = &unk_1E76C8040;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  -[ICNote enumerateAttachmentsInOrderUsingBlock:](self, "enumerateAttachmentsInOrderUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

void __32__ICNote_attachmentsWithUTType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICNote attachmentsInOrder](self, "attachmentsInOrder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "noteWillMoveToRecentlyDeletedFolder");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)refreshNoteTextFromDataStore
{
  if (self->_document)
    -[ICNote didChangeNoteText](self, "didChangeNoteText");
}

- (unint64_t)mergeWithNoteData:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  ICNote *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__ICNote_mergeWithNoteData___block_invoke;
  v8[3] = &unk_1E76C7B30;
  v9 = v4;
  v10 = self;
  v5 = v4;
  v6 = -[ICNote performMerge:](self, "performMerge:", v8);

  return v6;
}

uint64_t __28__ICNote_mergeWithNoteData___block_invoke(uint64_t a1)
{
  ICTTMergeableStringVersionedDocument *v2;
  uint64_t v3;
  void *v4;
  ICTTMergeableStringVersionedDocument *v5;
  void *v6;
  uint64_t v7;

  v2 = [ICTTMergeableStringVersionedDocument alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICTTVersionedDocument initWithData:replicaID:](v2, "initWithData:replicaID:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mergeWithStringVersionedDocument:", v5);

  return v7;
}

- (unint64_t)performMerge:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICNoteWillPerformMergeNotification"), self);

  -[ICNote setIsPerformingMerge:](self, "setIsPerformingMerge:", 1);
  -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEmpty"));
  -[ICNote mergeableString](self, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateIdsForLocalChanges");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote noteWillMergeDocumentWithUserInfo:](self, "noteWillMergeDocumentWithUserInfo:", v7);
  v8 = v4[2](v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote noteDidMergeNoteDocumentWithUserInfo:](self, "noteDidMergeNoteDocumentWithUserInfo:", v7);
  if (v8 == 2 && (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) == 0)
    -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
  -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEmpty"));
  -[ICNote setIsPerformingMerge:](self, "setIsPerformingMerge:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("MergeResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ICNoteDidPerformMergeNotification"), self, v11);

  return v8;
}

- (void)replaceWithDocument:(id)a3
{
  ICTTMergeableStringVersionedDocument *v4;
  ICTTMergeableStringVersionedDocument *document;
  ICTTMergeableStringVersionedDocument *v6;

  v4 = (ICTTMergeableStringVersionedDocument *)a3;
  -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEmpty"));
  document = self->_document;
  self->_document = v4;
  v6 = v4;

  LOBYTE(document) = objc_opt_respondsToSelector();
  if ((document & 1) != 0)
    -[ICNote noteDidReplaceDocument](self, "noteDidReplaceDocument");
  -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);
  -[ICCloudSyncingObject markShareDirtyIfNeededWithReason:](self, "markShareDirtyIfNeededWithReason:", CFSTR("Reset document"));
  -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEmpty"));
}

- (BOOL)saveNoteData
{
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_class *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_document)
  {
    v4 = os_log_create("com.apple.notes", "Topotext");
    v5 = os_signpost_id_generate(v4);
    -[ICTTVersionedDocument serialize](self->_document, "serialize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v29;
      v33 = 2112;
      v34 = (uint64_t)v30;
      v35 = 2048;
      v36 = objc_msgSend(v6, "hash");
      _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "%@ %@ %lu", (uint8_t *)&v31, 0x20u);

    }
    if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
    {
      if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
      {
        v8 = v4;
        v9 = v8;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BD918000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Serialize Encrypted NoteData", ", (uint8_t *)&v31, 2u);
        }

        -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "writeEncryptedNoteData:", v6);

        v12 = v9;
        v13 = v12;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
        {
          -[ICCloudSyncingObject ic_loggingIdentifier](self, "ic_loggingIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "length");
          -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138412802;
          v32 = v14;
          v33 = 2048;
          v34 = v15;
          v35 = 2112;
          v36 = (uint64_t)v18;
          _os_signpost_emit_with_name_impl(&dword_1BD918000, v13, OS_SIGNPOST_INTERVAL_END, v5, "Serialize Encrypted NoteData", "Note ID: %@, Size: %lu, Strategy: %@", (uint8_t *)&v31, 0x20u);

        }
        goto LABEL_28;
      }
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ICNote saveNoteData].cold.1(self, v13);
    }
    else
    {
      if (v6)
      {
        v19 = v4;
        v20 = v19;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BD918000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Serialize NoteData", ", (uint8_t *)&v31, 2u);
        }

        v21 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[ICNote saveNoteData].cold.2();

        -[ICNote noteData](self, "noteData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setData:", v6);

        -[ICNote setCryptoTag:](self, "setCryptoTag:", 0);
        -[ICNote setCryptoInitializationVector:](self, "setCryptoInitializationVector:", 0);
        -[ICNote updateArchivedAndLastViewedTimeStampsAfterSavingNoteData](self, "updateArchivedAndLastViewedTimeStampsAfterSavingNoteData");
        v23 = v20;
        v13 = v23;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          -[ICCloudSyncingObject ic_loggingIdentifier](self, "ic_loggingIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v6, "length");
          v31 = 138412546;
          v32 = v24;
          v33 = 2048;
          v34 = v25;
          _os_signpost_emit_with_name_impl(&dword_1BD918000, v13, OS_SIGNPOST_INTERVAL_END, v5, "Serialize NoteData", "Note ID: %@, Size: %lu", (uint8_t *)&v31, 0x16u);

        }
        v11 = 1;
        goto LABEL_28;
      }
      v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[ICCloudSyncingObject ic_loggingIdentifier](self, "ic_loggingIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v26;
        _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Trying to save note data for %@, but we don't have any data", (uint8_t *)&v31, 0xCu);

      }
    }

    v11 = 0;
LABEL_28:

    return v11;
  }
  return 0;
}

- (void)updateArchivedAndLastViewedTimeStampsAfterSavingNoteData
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "timestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Saving last viewed timestamp for %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)hasLoadedDocument
{
  return self->_document != 0;
}

+ (id)keyPathsForValuesAffectingHasUnreadChanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("modificationDate"), CFSTR("serverRecord"), CFSTR("lastViewedModificationDate"), 0);
}

- (void)changePinStatusIfPossible
{
  if (-[ICNote isPinnable](self, "isPinnable"))
  {
    -[ICNote setIsPinned:](self, "setIsPinned:", -[ICNote isPinned](self, "isPinned") ^ 1);
    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Changed pin state"));
  }
}

- (void)setIsPinned:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[ICNote isPinned](self, "isPinned") != a3)
  {
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isPinned"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isPinned"));

    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isPinned"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICNotePinnedStatusChangedNotification"), self);

    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Set isPinned"));
  }
}

- (void)markAsSystemPaperIfNeeded:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (a3)
  {
    -[ICNote markAsMathNoteIfNeeded:](self, "markAsMathNoteIfNeeded:", 0);
    -[ICNote markAsCallNoteIfNeeded:](self, "markAsCallNoteIfNeeded:", 0);
  }
  if (-[ICNote isSystemPaper](self, "isSystemPaper") != v3)
  {
    -[ICNote setIsSystemPaper:](self, "setIsSystemPaper:", v3);
    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Set isSystemPaper"));
    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set isSystemPaper"));
  }
}

- (BOOL)isMathNote
{
  void *v3;
  char v4;
  void *v5;

  -[ICNote hostApplicationIdentifier](self, "hostApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.greyparrot")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICNote hostApplicationIdentifier](self, "hostApplicationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", CFSTR("com.apple.calculator"));

  }
  return v4;
}

- (void)markAsMathNoteIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;

  v3 = a3;
  if (a3)
  {
    -[ICNote markAsSystemPaperIfNeeded:](self, "markAsSystemPaperIfNeeded:", 0);
    -[ICNote markAsCallNoteIfNeeded:](self, "markAsCallNoteIfNeeded:", 0);
  }
  if (-[ICNote isMathNote](self, "isMathNote") != v3)
  {
    if (v3)
      v5 = CFSTR("com.apple.calculator");
    else
      v5 = 0;
    -[ICNote setHostApplicationIdentifier:](self, "setHostApplicationIdentifier:", v5);
    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Set isMathNote"));
    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set isMathNote"));
  }
}

- (BOOL)isCallNote
{
  void *v2;
  char v3;

  -[ICNote hostApplicationIdentifier](self, "hostApplicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.mobilephone"));

  return v3;
}

- (void)markAsCallNoteIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;

  v3 = a3;
  if (a3)
  {
    -[ICNote markAsSystemPaperIfNeeded:](self, "markAsSystemPaperIfNeeded:", 0);
    -[ICNote markAsMathNoteIfNeeded:](self, "markAsMathNoteIfNeeded:", 0);
  }
  if (-[ICNote isCallNote](self, "isCallNote") != v3)
  {
    if (v3)
      v5 = CFSTR("com.apple.mobilephone");
    else
      v5 = 0;
    -[ICNote setHostApplicationIdentifier:](self, "setHostApplicationIdentifier:", v5);
    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Set isCallNote"));
    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set isCallNote"));
  }
}

- (void)markAsCallNoteIfAttachmentIsCallRecording
{
  void *v3;
  int v4;

  if (!-[ICNote isCallNote](self, "isCallNote"))
  {
    -[ICNote attachments](self, "attachments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_267);

    if (v4)
      -[ICNote markAsCallNoteIfNeeded:](self, "markAsCallNoteIfNeeded:", 1);
  }
}

uint64_t __51__ICNote_markAsCallNoteIfAttachmentIsCallRecording__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "audioModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCallRecording");

  return v4;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ICNote hostApplicationIdentifier](self, "hostApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_18:

    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

LABEL_15:
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICNote setHostApplicationIdentifier:].cold.1();

    NSStringFromSelector(sel_hostApplicationIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", v15);

    NSStringFromSelector(sel_hostApplicationIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, v16);

    NSStringFromSelector(sel_hostApplicationIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", v5);
    goto LABEL_18;
  }
  v13 = objc_msgSend((id)v8, "isEqual:", v10);

  if ((v13 & 1) == 0)
    goto LABEL_15;
LABEL_19:

}

- (void)markActivitySummaryViewed
{
  void *v3;
  _QWORD v4[5];

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__ICNote_markActivitySummaryViewed__block_invoke;
  v4[3] = &unk_1E76C73F8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __35__ICNote_markActivitySummaryViewed__block_invoke(uint64_t a1)
{
  id *v1;
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud");
  v3 = os_log_create("com.apple.notes", "ActivityStream");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
      __35__ICNote_markActivitySummaryViewed__block_invoke_cold_1((uint64_t)v1);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "setLastActivitySummaryViewedDate:", v5);

    objc_msgSend(*v1, "updateUserSpecificChangeCountWithReason:", CFSTR("Marked activity summary viewed"));
    objc_msgSend(*v1, "managedObjectContext");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject ic_save](v3, "ic_save");
  }
  else
  {
    if (v4)
      __35__ICNote_markActivitySummaryViewed__block_invoke_cold_2((uint64_t)v1);

  }
}

- (void)markLastActivityRecentUpdatesViewed
{
  void *v3;
  _QWORD v4[5];

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke;
  v4[3] = &unk_1E76C73F8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke(uint64_t a1)
{
  id *v1;
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud");
  v3 = os_log_create("com.apple.notes", "ActivityStream");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
      __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_1((uint64_t)v1);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "setLastActivityRecentUpdatesViewedDate:", v5);

    objc_msgSend(*v1, "updateUserSpecificChangeCountWithReason:", CFSTR("Marked recent updates viewed"));
    objc_msgSend(*v1, "managedObjectContext");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject ic_save](v3, "ic_save");
  }
  else
  {
    if (v4)
      __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_2((uint64_t)v1);

  }
}

- (BOOL)containsAttachmentWithDeepLink
{
  void *v2;
  char v3;

  -[ICNote attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_276);

  return v3;
}

uint64_t __40__ICNote_containsAttachmentWithDeepLink__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSynapseLink");
}

- (NSArray)allDocumentMergeControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote documentMergeController](self, "documentMergeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  -[ICNote attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_compactMap:", &__block_literal_global_278);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v7;
}

uint64_t __37__ICNote_allDocumentMergeControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "documentMergeController");
}

- (void)setShowsCollaboratorCursors:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote showsCollaboratorCursorsUserDefaultsKey](self, "showsCollaboratorCursorsUserDefaultsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICNoteShowsCollaboratorCursorsDidChangeNotification"), self);

}

- (void)addInlineAttachmentsObject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICNote inlineAttachments](self, "inlineAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  -[ICNote managedObjectOriginal_addInlineAttachmentsObject:](self, "managedObjectOriginal_addInlineAttachmentsObject:", v4);
  if ((v6 & 1) == 0)
    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
}

- (void)removeInlineAttachmentsObject:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[ICNote inlineAttachments](self, "inlineAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  -[ICNote managedObjectOriginal_removeInlineAttachmentsObject:](self, "managedObjectOriginal_removeInlineAttachmentsObject:", v4);
  if (v6)
    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
}

- (void)addInlineAttachments:(id)a3
{
  -[ICNote managedObjectOriginal_addInlineAttachments:](self, "managedObjectOriginal_addInlineAttachments:", a3);
  -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
}

- (void)removeInlineAttachments:(id)a3
{
  -[ICNote managedObjectOriginal_removeInlineAttachments:](self, "managedObjectOriginal_removeInlineAttachments:", a3);
  -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
}

- (id)cryptoStrategyProtocol
{
  return &unk_1EF5237D0;
}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "note cannot have crypto strategy, but is asked to decrypt and merge text from record: %@", (uint8_t *)&v11, 0xCu);

    }
    -[ICCloudSyncingObject setUnappliedEncryptedRecord:](self, "setUnappliedEncryptedRecord:", v4);
    v7 = 0;
  }

  return v7;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mergeEncryptedDataFromRecord:", v4);

  return v6;
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mergeEncryptedData:mergeConflict:", v7, v6);

}

- (void)setCryptoInitializationVector:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  v4 = a3;
  -[ICCloudSyncingObject setCryptoInitializationVector:](&v6, sel_setCryptoInitializationVector_, v4);
  -[ICNote noteData](self, "noteData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCryptoInitializationVector:", v4);

}

- (void)setCryptoTag:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  v4 = a3;
  -[ICCloudSyncingObject setCryptoTag:](&v6, sel_setCryptoTag_, v4);
  -[ICNote noteData](self, "noteData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCryptoTag:", v4);

}

- (void)persistPendingChanges
{
  void *v3;
  objc_super v4;

  -[ICNote didChangeNoteText](self, "didChangeNoteText");
  -[ICNote noteData](self, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveNoteDataIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  -[ICCloudSyncingObject persistPendingChanges](&v4, sel_persistPendingChanges);
}

- (void)clearDecryptedData
{
  ICTTMergeableStringVersionedDocument *document;
  objc_super v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote noteWillReleaseTextStorage](self, "noteWillReleaseTextStorage");
  document = self->_document;
  self->_document = 0;

  -[ICNote setDecryptedData:](self, "setDecryptedData:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote noteDidClearDecryptedData](self, "noteDidClearDecryptedData");
  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  -[ICCloudSyncingObject clearDecryptedData](&v4, sel_clearDecryptedData);
}

- (void)inlineAssetsForRecord:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  v3 = a3;
  -[ICCloudSyncingObject inlineAssetsForRecord:](&v4, sel_inlineAssetsForRecord_, v3);
  objc_msgSend(v3, "ic_inlineEncryptedDataAssetForKeyPrefix:", CFSTR("TextData"), v4.receiver, v4.super_class);

}

+ (id)defaultTitleForEmptyNote
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Note"), CFSTR("New Note"), 0, 1);
}

- (_NSRange)rangeForSnippetWithTitleRange:(_NSRange)a3
{
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = a3.location + a3.length;
  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") - v4;

  if ((v6 & (unint64_t)~(v6 >> 63)) >= 0xFF)
    v7 = 255;
  else
    v7 = v6 & ~(v6 >> 63);
  -[ICNote noteAsPlainText](self, "noteAsPlainText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", v4, v7);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)rangeForTitle:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v4 = (void *)MEMORY[0x1E0D64238];
  -[ICNote attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeForTitleInContent:truncated:", v6, a3);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)widgetSnippetByEnumeratingAttachments
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICNote widgetSnippet](self, "widgetSnippet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = os_log_create("com.apple.notes", "Widget");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICNote widgetSnippetByEnumeratingAttachments].cold.1(self, v5);

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNote widgetSnippetByEnumeratingAttachments]", 1, 1, CFSTR("Non-empty widget snippet set on a locked note"));
    }
    return 0;
  }
  else
  {
    -[ICNote attributedString](self, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (objc_msgSend(v8, "length") && (objc_opt_respondsToSelector() & 1) != 0)
      -[ICNote formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:](self, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v8, 0, 255, 0, 1);
    -[ICNote managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "ic_range");
    v12 = v11;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__ICNote_widgetSnippetByEnumeratingAttachments__block_invoke;
    v17[3] = &unk_1E76C80E8;
    v18 = v8;
    v13 = v8;
    objc_msgSend(v13, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v9, v10, v12, 0, v17);

    v14 = (void *)MEMORY[0x1E0D64238];
    objc_msgSend(v13, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widgetSnippetForContent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
}

void __47__ICNote_widgetSnippetByEnumeratingAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "altText");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E76DB108;
    objc_msgSend(v9, "replaceCharactersInRange:withString:", a3, a4, v12);
  }
  else
  {
    objc_msgSend(v14, "attachmentModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "providesTextContentInNote")
      || (objc_msgSend(v13, "textContentInNote"), (v11 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v11 = &stru_1E76DB108;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v11);

  }
}

- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4
{
  return -[ICNote regenerateTitle:snippet:isNewNote:](self, "regenerateTitle:snippet:isNewNote:", a3, a4, 0);
}

- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4 isNewNote:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  BOOL v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v40;
  ICNote *v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t *v48;
  _QWORD v49[3];
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  BOOL v76;
  _QWORD v77[2];

  v5 = a5;
  v77[1] = *MEMORY[0x1E0C80C00];
  if (-[ICNote containsPlaceholderBlockOrInlineAttachments](self, "containsPlaceholderBlockOrInlineAttachments")
    || -[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICNote regenerateTitle:snippet:isNewNote:].cold.1(self);

    return 0;
  }
  else
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = a3;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = a4;
    if (-[ICNote markedForDeletion](self, "markedForDeletion"))
    {
      *((_BYTE *)v74 + 24) = 0;
      *((_BYTE *)v70 + 24) = 0;
    }
    else if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
    {
      *((_BYTE *)v70 + 24) = 0;
      if (!-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
        *((_BYTE *)v74 + 24) = 0;
      -[ICNote setWidgetSnippet:](self, "setWidgetSnippet:", 0);
    }
    if (*((_BYTE *)v74 + 24) || *((_BYTE *)v70 + 24))
    {
      -[ICNote attributedString](self, "attributedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__4;
      v67 = __Block_byref_object_dispose__4;
      v68 = 0;
      v57 = 0;
      v58 = (id *)&v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__4;
      v61 = __Block_byref_object_dispose__4;
      v62 = 0;
      v51 = 0;
      v52 = &v51;
      v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__4;
      v55 = __Block_byref_object_dispose__4;
      v56 = 0;
      if (*((_BYTE *)v70 + 24))
      {
        -[ICNote widgetSnippetByEnumeratingAttachments](self, "widgetSnippetByEnumeratingAttachments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote setWidgetSnippet:](self, "setWidgetSnippet:", v13);

      }
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v50 = 0;
      v14 = objc_msgSend(v12, "length");
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke;
      v40 = &unk_1E76C8138;
      v41 = self;
      v43 = &v63;
      v44 = &v73;
      v45 = &v69;
      v15 = v12;
      v42 = v15;
      v46 = v49;
      v47 = &v51;
      v48 = &v57;
      objc_msgSend(v15, "ic_enumerateParagraphsInRange:usingBlock:", 0, v14, &v37);
      if (*((_BYTE *)v74 + 24))
      {
        v16 = (void *)v64[5];
        if (!v16 || !objc_msgSend(v16, "length", v37, v38, v39, v40, v41))
        {
          objc_msgSend((id)objc_opt_class(), "defaultTitleForEmptyNote");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v64[5];
          v64[5] = v17;

        }
        -[ICNote title](self, "title", v37, v38, v39, v40, v41);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (__CFString *)v19;
        else
          v21 = &stru_1E76DB108;
        v22 = v21;

        v23 = objc_msgSend((id)v64[5], "isEqualToString:", v22);
        if ((v23 & 1) != 0)
        {
          v24 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D64278], "userActivityPersistentIdentifierForNote:", self);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25)
          {
            v27 = (void *)MEMORY[0x1E0CA5920];
            v77[0] = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "deleteSavedUserActivitiesWithPersistentIdentifiers:completionHandler:", v28, &__block_literal_global_403);

          }
          -[ICNote setTitle:](self, "setTitle:", v64[5]);

          v24 = !v5;
        }

        v10 = v23 ^ 1;
      }
      else
      {
        v10 = 0;
        v24 = 0;
      }
      if (*((_BYTE *)v70 + 24))
      {
        -[ICNote snippet](self, "snippet");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          v31 = (__CFString *)v29;
        else
          v31 = &stru_1E76DB108;
        v32 = v31;

        if (v58[5])
          v33 = (__CFString *)v58[5];
        else
          v33 = &stru_1E76DB108;
        objc_storeStrong(v58 + 5, v33);
        if ((objc_msgSend(v58[5], "isEqual:", v32) & 1) == 0)
        {
          -[ICNote setSnippet:](self, "setSnippet:", v58[5]);
          v10 = 1;
        }

      }
      if (v24)
        -[ICNote updateLinksWhenPossible](self, "updateLinksWhenPossible");
      -[ICNote titleSourceAttachment](self, "titleSourceAttachment", v37, v38, v39, v40, v41);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == (void *)v52[5];

      if (!v35)
        -[ICNote setTitleSourceAttachment:](self, "setTitleSourceAttachment:", v52[5]);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(&v51, 8);

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v63, 8);

    }
    else
    {
      v10 = 0;
    }
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v73, 8);
  }
  return v10;
}

void __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;

  v8 = a4 - a2;
  objc_msgSend(*(id *)(a1 + 32), "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedSubstringFromRange:", a2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!objc_msgSend(v11, "length"))
    goto LABEL_15;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(void **)(a1 + 32);
    v13 = objc_msgSend(v11, "ic_range");
    objc_msgSend(v12, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v11, v13, v14, a2, 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "ic_range");
  v18 = v17;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke_2;
  v43[3] = &unk_1E76C8110;
  v47 = *(_QWORD *)(a1 + 48);
  v19 = v11;
  v44 = v19;
  v48 = *(_OWORD *)(a1 + 56);
  v20 = *(id *)(a1 + 40);
  v49 = *(_OWORD *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 32);
  v45 = v20;
  v46 = v21;
  objc_msgSend(v19, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v15, v16, v18, 0, v43);

  v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v22 && objc_msgSend(v22, "length"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "length")
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x1E0D64238];
    objc_msgSend(v19, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "snippetForContent:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    objc_msgSend(v19, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0D64238], "titleForContent:truncated:", v24, &v42);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0D64238], "stringByRemovingTitle:fromString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v24);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

      objc_msgSend(MEMORY[0x1E0D64238], "snippetForContent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v36 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v34;

    }
    if (v42)
    {
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("…"), CFSTR("…"), 0, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringByAppendingString:", v38);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v39;

    }
  }

LABEL_14:
LABEL_15:
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length")
    && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
     || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length")
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "length")
     || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
     || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
  {
    *a5 = 1;
  }

}

void __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v28;
    objc_msgSend(v8, "attachmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length")
      || !objc_msgSend(v9, "providesStandaloneTitleForNote"))
    {
LABEL_23:
      if (!objc_msgSend(v9, "providesTextContentInNote")
        || (objc_msgSend(v9, "textContentInNote"), (v18 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v18 = &stru_1E76DB108;
      }
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v18);

LABEL_27:
      goto LABEL_28;
    }
    if (!a3)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invertedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v11, 0, 0, a3);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_31:
      if (objc_msgSend(v8, "needsInitialFetchFromCloud"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        goto LABEL_21;
      }
      if (objc_msgSend(v8, "attachmentType") == 11)
      {
        objc_msgSend(v8, "userTitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {

        }
        else if ((objc_msgSend(*(id *)(a1 + 40), "ic_containsNonWhitespaceAndAttachmentCharacters") & 1) != 0)
        {
          goto LABEL_21;
        }
      }
      objc_msgSend(v9, "standaloneTitleForNote");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
LABEL_21:
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a2);
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v28;
    objc_msgSend(v14, "altText");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &stru_1E76DB108;
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

    if (objc_msgSend(v14, "isLinkAttachment"))
    {
      objc_msgSend(v14, "tokenContentIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICAppURLUtilities noteIdentifierFromNotesAppURL:](ICAppURLUtilities, "noteIdentifierFromNotesAppURL:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "caseInsensitiveCompare:", v21);

      if (!v23)
      {

        v18 = &stru_1E76DB108;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v18);
    goto LABEL_27;
  }
LABEL_28:

}

- (void)updateLinksWhenPossible
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[ICNote updateLinksSelectorDelayer](self, "updateLinksSelectorDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel__updateLinksOnMainThreadSelectorDelayer, 1, 1, 0.2);
    -[ICNote setUpdateLinksSelectorDelayer:](self, "setUpdateLinksSelectorDelayer:", v4);

  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "concurrencyType");

  if (v6 == 2)
  {
    -[ICNote updateLinksSelectorDelayer](self, "updateLinksSelectorDelayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestFire");

  }
}

- (void)_updateLinksOnMainThreadSelectorDelayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  ICNote *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "concurrencyType");

  if (v4 == 2)
  {
    -[ICNote titleForLinking](self, "titleForLinking");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      -[ICNote managedObjectContext](self, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__ICNote__updateLinksOnMainThreadSelectorDelayer__block_invoke;
      v8[3] = &unk_1E76C8180;
      v9 = v5;
      v10 = self;
      v11 = &v12;
      +[ICInlineAttachment enumerateLinksToNote:batchSize:visibleOnly:saveAfterBatch:context:usingBlock:](ICInlineAttachment, "enumerateLinksToNote:batchSize:visibleOnly:saveAfterBatch:context:usingBlock:", self, 100, 1, 0, v6, v8);

      if (*((_BYTE *)v13 + 24))
      {
        -[ICNote managedObjectContext](self, "managedObjectContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ic_saveWithLogDescription:", CFSTR("Saving updated linked note titles"));

      }
      _Block_object_dispose(&v12, 8);
    }

  }
}

void __49__ICNote__updateLinksOnMainThreadSelectorDelayer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "altText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "length");
      objc_msgSend(v3, "ic_loggingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ic_loggingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Updating altText (length=%lu) for link (%@) to note (%@)", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(v3, "setAltText:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Updated alt text from note title"));
    v7 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICInlineAttachmentDataChangedNotification"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (NSString)widgetInfoText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0D64238];
  -[ICNote title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote widgetSnippet](self, "widgetSnippet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingTitle:fromString:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ic_trimmedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    +[ICNote snippetForPasswordProtectedNote:](ICNote, "snippetForPasswordProtectedNote:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_class();
    v10 = -[ICNote attachmentContentInfoType](self, "attachmentContentInfoType");
    v11 = -[ICNote attachmentContentInfoCount](self, "attachmentContentInfoCount");
    -[ICNote account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInfoTextWithSnippet:attachmentContentInfoType:attachmentContentInfoCount:account:", v7, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") != a3)
  {
    -[ICNote folder](self, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("visibleNotes"));

    -[ICNote account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willChangeValueForKey:", CFSTR("visibleNotes"));

    v9.receiver = self;
    v9.super_class = (Class)ICNote;
    -[ICCloudSyncingObject setNeedsInitialFetchFromCloud:](&v9, sel_setNeedsInitialFetchFromCloud_, v3);
    -[ICNote folder](self, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didChangeValueForKey:", CFSTR("visibleNotes"));

    -[ICNote account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didChangeValueForKey:", CFSTR("visibleNotes"));

  }
}

- (void)setAccount:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICNote account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v8);

  if ((v5 & 1) == 0)
  {
    -[ICNote attachments](self, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_accountWillChangeToAccount_, v8);

  }
  -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("account"));
  -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("account"));
  -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("account"));

}

- (void)setFolder:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  -[ICNote folder](self, "folder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICNote setFolder:].cold.3(v4, self, v6);

    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("folder"));
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parentCloudObject"));
    -[ICNote setPrimitiveFolder:](self, "setPrimitiveFolder:", v4);
    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("folder"));
    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parentCloudObject"));
    if (!v4)
    {
      v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ICNote setFolder:].cold.2(self, v7);

    }
    objc_msgSend(v4, "account");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v4, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        v12 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[ICNote setFolder:].cold.1(v4, self, v12);

        objc_msgSend(v4, "account");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote setAccount:](self, "setAccount:", v13);

      }
    }
    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
    objc_msgSend(v5, "markShareDirtyIfNeededWithReason:", CFSTR("Updated note's folder"));
    objc_msgSend(v4, "markShareDirtyIfNeededWithReason:", CFSTR("Updated note's folder"));
  }

}

- (void)setMarkedForDeletion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[ICNote folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willChangeValueForKey:", CFSTR("visibleNotesCount"));
  objc_msgSend(v5, "willChangeValueForKey:", CFSTR("children"));
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  -[ICCloudSyncingObject setMarkedForDeletion:](&v6, sel_setMarkedForDeletion_, v3);
  objc_msgSend(v5, "didChangeValueForKey:", CFSTR("children"));
  objc_msgSend(v5, "didChangeValueForKey:", CFSTR("visibleNotesCount"));

}

- (void)setLegacyManagedObjectID:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "URIRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote setLegacyManagedObjectIDURIRepresentation:](self, "setLegacyManagedObjectIDURIRepresentation:", v4);

}

- (ICTTVectorMultiTimestamp)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  -[ICNote document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTVectorMultiTimestamp *)v4;
}

- (ICTTVectorMultiTimestamp)lastNotifiedTimestamp
{
  ICTTVectorMultiTimestamp *lastNotifiedTimestamp;
  void *v4;
  ICTTVectorMultiTimestamp *v5;
  ICTTVectorMultiTimestamp *v6;

  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  if (!lastNotifiedTimestamp)
  {
    -[ICNote lastNotifiedTimestampData](self, "lastNotifiedTimestampData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[ICTTVectorMultiTimestamp initWithData:andCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithData:andCapacity:", v4, 2);
      v6 = self->_lastNotifiedTimestamp;
      self->_lastNotifiedTimestamp = v5;

    }
    lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  }
  return lastNotifiedTimestamp;
}

- (void)setLastNotifiedTimestamp:(id)a3
{
  void *v4;
  ICTTVectorMultiTimestamp *lastNotifiedTimestamp;

  objc_msgSend(a3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote setLastNotifiedTimestampData:](self, "setLastNotifiedTimestampData:", v4);

  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  self->_lastNotifiedTimestamp = 0;

}

- (ICTTVectorMultiTimestamp)lastViewedTimestamp
{
  ICTTVectorMultiTimestamp *lastViewedTimestamp;
  void *v4;
  ICTTVectorMultiTimestamp *v5;
  ICTTVectorMultiTimestamp *v6;

  lastViewedTimestamp = self->_lastViewedTimestamp;
  if (!lastViewedTimestamp)
  {
    -[ICNote lastViewedTimestampData](self, "lastViewedTimestampData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[ICTTVectorMultiTimestamp initWithData:andCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithData:andCapacity:", v4, 2);
      v6 = self->_lastViewedTimestamp;
      self->_lastViewedTimestamp = v5;

    }
    lastViewedTimestamp = self->_lastViewedTimestamp;
  }
  return lastViewedTimestamp;
}

- (void)setLastViewedTimestamp:(id)a3
{
  void *v4;
  ICTTVectorMultiTimestamp *lastViewedTimestamp;

  objc_msgSend(a3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote setLastViewedTimestampData:](self, "setLastViewedTimestampData:", v4);

  lastViewedTimestamp = self->_lastViewedTimestamp;
  self->_lastViewedTimestamp = 0;

}

- (void)setLastActivityRecentUpdatesViewedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *recentUpdatesGenerationDate;

  v4 = a3;
  -[ICNote recentUpdatesFirstSeenDate](self, "recentUpdatesFirstSeenDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setRecentUpdatesFirstSeenDate:](self, "setRecentUpdatesFirstSeenDate:", v6);

  }
  if (!self->_recentUpdatesGenerationDate)
  {
    -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    recentUpdatesGenerationDate = self->_recentUpdatesGenerationDate;
    self->_recentUpdatesGenerationDate = v7;

  }
  -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastActivityRecentUpdatesViewedDate"));
  -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("lastActivityRecentUpdatesViewedDate"));

  -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastActivityRecentUpdatesViewedDate"));
}

+ (id)keyPathsForValuesAffectingRecentUpdatesGenerationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E771AA70);
}

- (NSDate)recentUpdatesGenerationDate
{
  void *v3;
  void *v4;
  int v5;
  NSDate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  if (-[ICCloudSyncingObject isInCloud](self, "isInCloud")
    && (-[ICCloudSyncingObject userSpecificServerRecord](self, "userSpecificServerRecord"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v6 = 0;
  }
  else if (self->_recentUpdatesGenerationDate
         && (-[ICNote recentUpdatesFirstSeenDate](self, "recentUpdatesFirstSeenDate"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v5 = objc_msgSend(v4, "ic_isLaterThanUnitsAgo:value:", 64, 10),
             v4,
             v5))
  {
    v6 = self->_recentUpdatesGenerationDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "ic_isLaterThanDate:", v9);

    if ((_DWORD)v8)
    {
      -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICCloudSyncingObject shareTimestamp](self, "shareTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11 || (v12 = objc_msgSend(v9, "ic_isLaterThanDate:", v11), v13 = v9, (v12 & 1) == 0))
        v13 = v11;
      v6 = v13;

    }
  }
  return v6;
}

- (void)clearRecentUpdatesGenerationDateIfNeeded
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  ICNote *v7;

  if (-[ICNote hasRecentExternalEdits](self, "hasRecentExternalEdits"))
  {
    -[ICCloudSyncingObject viewContext](self, "viewContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__ICNote_clearRecentUpdatesGenerationDateIfNeeded__block_invoke;
    v5[3] = &unk_1E76C73B0;
    v6 = v3;
    v7 = self;
    v4 = v3;
    objc_msgSend(v4, "performBlockAndWait:", v5);

  }
}

void __50__ICNote_clearRecentUpdatesGenerationDateIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_existingObjectWithID:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastActivityRecentUpdatesViewedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecentUpdatesGenerationDate:", v3);

  objc_msgSend(v4, "setRecentUpdatesFirstSeenDate:", 0);
}

- (id)ic_loggingValues
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  objc_super v16;

  -[ICNote noteData](self, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsToBeSaved");

  -[ICNote noteData](self, "noteData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsToBeSaved:", 0);

  v16.receiver = self;
  v16.super_class = (Class)ICNote;
  -[ICCloudSyncingObject ic_loggingValues](&v16, sel_ic_loggingValues);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[ICNote noteData](self, "noteData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsToBeSaved:", v4);

  -[ICNote managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __26__ICNote_ic_loggingValues__block_invoke;
  v14[3] = &unk_1E76C73B0;
  v14[4] = self;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

uint64_t __26__ICNote_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "documentWithoutCreating");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "documentWithoutCreating");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergeableString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("length"));

  }
  objc_msgSend(*(id *)(a1 + 32), "folder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, CFSTR("folder"));

  objc_msgSend(*(id *)(a1 + 32), "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, CFSTR("account"));

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, CFSTR("creationDate"));

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v20, CFSTR("modificationDate"));

  objc_msgSend(*(id *)(a1 + 32), "folderModificationDate");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, CFSTR("folderModificationDate"));

  if (objc_msgSend(*(id *)(a1 + 32), "isPinned"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("pinned"));
  if (objc_msgSend(*(id *)(a1 + 32), "prefersLightBackground"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("prefersLightBackground"));
  objc_msgSend(*(id *)(a1 + 32), "titleSourceAttachment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "titleSourceAttachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, CFSTR("titleSourceAttachmentID"));

  }
  objc_msgSend(*(id *)(a1 + 32), "attachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", CFSTR("recordName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v31, CFSTR("attachments"));

  }
  objc_msgSend(*(id *)(a1 + 32), "inlineAttachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    objc_msgSend(*(id *)(a1 + 32), "inlineAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "valueForKey:", CFSTR("recordName"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v36, CFSTR("inlineAttachments"));

  }
  objc_msgSend(*(id *)(a1 + 32), "legacyContentHashAtImport");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyContentHashAtImport");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v38, CFSTR("legacyContentHashAtImport"));

  }
  objc_msgSend(*(id *)(a1 + 32), "legacyImportDeviceIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyImportDeviceIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v40, CFSTR("legacyImportDeviceIdentifier"));

  }
  objc_msgSend(*(id *)(a1 + 32), "legacyModificationDateAtImport");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyModificationDateAtImport");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v42, CFSTR("legacyModificationDateAtImport"));

  }
  objc_msgSend(*(id *)(a1 + 32), "lastNotifiedDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastNotifiedDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v44, CFSTR("lastNotifiedDate"));

  }
  result = objc_msgSend(*(id *)(a1 + 32), "isSystemPaper");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isSystemPaper"));
  return result;
}

+ (BOOL)supportsActivityEvents
{
  return 1;
}

- (ICMergeableDictionary)replicaIDToUserID
{
  ICMergeableDictionary *replicaIDToUserID;
  ICMergeableDictionary *v4;
  void *v5;
  ICMergeableDictionary *v6;
  void *v7;
  ICMergeableDictionary *v8;
  ICMergeableDictionary *v9;

  replicaIDToUserID = self->_replicaIDToUserID;
  if (replicaIDToUserID)
  {
    v4 = replicaIDToUserID;
    v5 = self->_replicaIDToUserID;
    self->_replicaIDToUserID = v4;
  }
  else
  {
    v6 = [ICMergeableDictionary alloc];
    -[ICNote replicaIDToUserIDDictData](self, "replicaIDToUserIDDictData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICMergeableDictionary initWithData:replicaID:](v6, "initWithData:replicaID:", v5, v7);
    v9 = self->_replicaIDToUserID;
    self->_replicaIDToUserID = v8;

  }
  return self->_replicaIDToUserID;
}

- (BOOL)addUserID:(id)a3 forReplicaID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

    -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setReplicaIDToUserIDDictData:](self, "setReplicaIDToUserIDDictData:", v14);

  }
  return v10 == 0;
}

- (unint64_t)mergeReplicaIDToUserID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  ICMergeableDictionary *replicaIDToUserID;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[ICNote replicaIDToUserIDDictData](self, "replicaIDToUserIDDictData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
  {
    -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "mergeWithDictionary:", v4);

    if (v13 != 2)
      goto LABEL_5;
    -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setReplicaIDToUserIDDictData:](self, "setReplicaIDToUserIDDictData:", v17);

  }
  else
  {
LABEL_3:
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("replicaIDToUserID"));
    objc_msgSend(v4, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setReplicaIDToUserIDDictData:](self, "setReplicaIDToUserIDDictData:", v11);

    replicaIDToUserID = self->_replicaIDToUserID;
    self->_replicaIDToUserID = 0;

    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("replicaIDToUserID"));
  }
  v13 = 2;
LABEL_5:

  return v13;
}

- (ICOutlineState)outlineState
{
  ICOutlineState *outlineState;
  ICOutlineState *v4;
  void *v5;
  ICOutlineState *v6;
  ICOutlineState *v7;

  outlineState = self->_outlineState;
  if (!outlineState)
  {
    v4 = [ICOutlineState alloc];
    -[ICNote outlineStateData](self, "outlineStateData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICOutlineState initWithData:](v4, "initWithData:", v5);
    v7 = self->_outlineState;
    self->_outlineState = v6;

    outlineState = self->_outlineState;
  }
  return outlineState;
}

- (void)setOutlineStateData:(id)a3
{
  id v4;
  ICOutlineState *outlineState;
  id v6;

  v4 = a3;
  NSStringFromSelector(sel_outlineStateData);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", v6);
  -[ICNote setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, v6);

  -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  outlineState = self->_outlineState;
  self->_outlineState = 0;

}

- (BOOL)updateDeviceReplicaIDsToUserIDIfNeeded
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((-[ICNote isDeleted](self, "isDeleted") & 1) == 0
    && !-[ICNote markedForDeletion](self, "markedForDeletion"))
  {
    -[ICNote cloudAccount](self, "cloudAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICNotesAppBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replicaIDForBundleIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded].cold.2(self);
      LOBYTE(v4) = 0;
      v3 = v9;
      goto LABEL_18;
    }
    -[ICNote cloudAccount](self, "cloudAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userRecordName");
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"))
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs", 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = v11;
          v4 = 0;
          v13 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v9);
              v4 |= -[ICNote addUserID:forReplicaID:](self, "addUserID:forReplicaID:", v3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v12);
          goto LABEL_18;
        }
LABEL_17:
        LOBYTE(v4) = 0;
LABEL_18:

        goto LABEL_19;
      }
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded].cold.4(self);
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded].cold.3(self);
    }

    goto LABEL_17;
  }
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded].cold.1(self);
  LOBYTE(v4) = 0;
  v5 = v3;
LABEL_19:

  return v4 & 1;
}

- (id)userIDForReplicaID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    -[ICNote account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userRecordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unknown");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)participantForReplicaID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICNote userIDForReplicaID:](self, "userIDForReplicaID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unknown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[ICCloudSyncingObject participantForUserID:](self, "participantForUserID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)updateDerivedAttributesIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  -[ICNote noteData](self, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = v3;
    if ((-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) == 0)
    {
      if (self->_document)
      {

      }
      else
      {
        v4 = -[ICNote needsInitialDerivedAttributesUpdate](self, "needsInitialDerivedAttributesUpdate");

        if (!v4)
          return;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote hasChecklistOnlyInProgress:](self, "hasChecklistOnlyInProgress:", 0));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[ICNote hasChecklist](self, "hasChecklist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToNumber:", v16);

      if ((v6 & 1) == 0)
        -[ICNote setHasChecklist:](self, "setHasChecklist:", v16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote hasChecklistOnlyInProgress:](self, "hasChecklistOnlyInProgress:", 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote hasChecklistInProgress](self, "hasChecklistInProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToNumber:", v7);

      if ((v9 & 1) == 0)
        -[ICNote setHasChecklistInProgress:](self, "setHasChecklistInProgress:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote textStorageHasAttribute:](self, "textStorageHasAttribute:", *MEMORY[0x1E0DC10F0]));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote hasSystemTextAttachments](self, "hasSystemTextAttachments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToNumber:", v10);

      if ((v12 & 1) == 0)
        -[ICNote setHasSystemTextAttachments:](self, "setHasSystemTextAttachments:", v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote textStorageHasAttribute:](self, "textStorageHasAttribute:", ICTTAttributeNameEmphasis));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote hasEmphasis](self, "hasEmphasis");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToNumber:", v13);

      if ((v15 & 1) == 0)
        -[ICNote setHasEmphasis:](self, "setHasEmphasis:", v13);

    }
    v3 = v16;
  }

}

+ (BOOL)supportsNotesVersionTracking
{
  return 1;
}

- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          -[ICNote document](self, "document");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mergeableString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeTimestampsForReplicaID:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (id)notesVersionForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICNote replicaIDToUserID](self, "replicaIDToUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        -[ICNote userIDForReplicaID:](self, "userIDForReplicaID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          -[ICCloudSyncingObject notesVersionForReplicaID:](self, "notesVersionForReplicaID:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

            goto LABEL_16;
          }
          v16 = v15;
          if (!v9 || (v17 = objc_msgSend(v15, "integerValue"), v17 < objc_msgSend(v9, "integerValue")))
          {
            v18 = v16;

            v9 = v18;
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
LABEL_16:
    v9 = 0;
  }

  return v9;
}

- (id)notesVersionForParticipant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRecordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote notesVersionForUserID:](self, "notesVersionForUserID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)minimumNotesVersionForUserIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        -[ICNote notesVersionForUserID:](self, "notesVersionForUserID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {

          goto LABEL_14;
        }
        v11 = v10;
        if (!v7 || (v12 = objc_msgSend(v10, "integerValue"), v12 < objc_msgSend(v7, "integerValue")))
        {
          v13 = v11;

          v7 = v13;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
LABEL_14:
    v7 = 0;
  }

  return v7;
}

- (id)minimumNotesVersionForAllParticipants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "participants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_map:", &__block_literal_global_474);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNote minimumNotesVersionForUserIDs:](self, "minimumNotesVersionForUserIDs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_opt_class(), "currentNotesVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

id __47__ICNote_minimumNotesVersionForAllParticipants__block_invoke(uint64_t a1, void *a2)
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

- (NSData)decryptedData
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDecryptedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->needsRefresh = a3;
}

- (BOOL)needsToSaveLastViewedTimestamp
{
  return self->needsToSaveLastViewedTimestamp;
}

- (void)setNeedsToSaveLastViewedTimestamp:(BOOL)a3
{
  self->needsToSaveLastViewedTimestamp = a3;
}

- (void)setPreventReleasingTextStorage:(BOOL)a3
{
  self->preventReleasingTextStorage = a3;
}

- (id)reservedForCollaborationColorManager
{
  return self->_reservedForCollaborationColorManager;
}

- (void)setReservedForCollaborationColorManager:(id)a3
{
  objc_storeStrong(&self->_reservedForCollaborationColorManager, a3);
}

- (BOOL)shouldAddMediaAsynchronously
{
  return self->shouldAddMediaAsynchronously;
}

- (void)setShouldAddMediaAsynchronously:(BOOL)a3
{
  self->shouldAddMediaAsynchronously = a3;
}

- (BOOL)isRecoveringCryptoWrappedKey
{
  return self->isRecoveringCryptoWrappedKey;
}

- (void)setIsRecoveringCryptoWrappedKey:(BOOL)a3
{
  self->isRecoveringCryptoWrappedKey = a3;
}

- (BOOL)isPerformingMerge
{
  return self->_isPerformingMerge;
}

- (void)setIsPerformingMerge:(BOOL)a3
{
  self->_isPerformingMerge = a3;
}

- (void)setRecentUpdatesGenerationDate:(id)a3
{
  objc_storeStrong((id *)&self->_recentUpdatesGenerationDate, a3);
}

- (NSDate)recentUpdatesFirstSeenDate
{
  return self->_recentUpdatesFirstSeenDate;
}

- (void)setRecentUpdatesFirstSeenDate:(id)a3
{
  objc_storeStrong((id *)&self->_recentUpdatesFirstSeenDate, a3);
}

- (void)setIsNewNoteWithHashtagsInsertedIntoBody:(BOOL)a3
{
  self->_isNewNoteWithHashtagsInsertedIntoBody = a3;
}

- (BOOL)wasAuthenticatedBeforeTurningIntoFault
{
  return self->wasAuthenticatedBeforeTurningIntoFault;
}

- (void)setOutlineState:(id)a3
{
  objc_storeStrong((id *)&self->_outlineState, a3);
}

- (ICSelectorDelayer)updateLinksSelectorDelayer
{
  return self->updateLinksSelectorDelayer;
}

- (void)setUpdateLinksSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->updateLinksSelectorDelayer, a3);
}

+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C97998]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ICNote(Management) newObjectWithIdentifier:context:].cold.1();
    v15 = 0;
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___ICNote;
    v15 = objc_msgSendSuper2(&v17, sel_newObjectWithIdentifier_context_, v6, v7);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICNoteData"), v7);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNoteData:", v14);
      -[NSObject setNote:](v14, "setNote:", v15);
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[ICNote(Management) newObjectWithIdentifier:context:].cold.2();
    }
  }

  return v15;
}

+ (id)newEmptyNoteInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v5);

  return v8;
}

+ (id)newNoteWithoutIdentifierInAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "defaultFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:folder:", 0, v4);

  return v5;
}

+ (id)newObjectWithIdentifier:(id)a3 folder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentStoreCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistentStores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C97998]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      v16 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[ICNote(Management) newObjectWithIdentifier:context:].cold.1();
      v17 = 0;
    }
    else
    {
      v27.receiver = a1;
      v27.super_class = (Class)&OBJC_METACLASS___ICNote;
      v17 = objc_msgSendSuper2(&v27, sel_newObjectWithIdentifier_context_, v6, v9);
      objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICNoteData"), v9);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "persistentStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "assignToPersistentStore:", v21);

      objc_msgSend(v8, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "persistentStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "assignObject:toPersistentStore:", v16, v24);

      objc_msgSend(v17, "setNoteData:", v16);
      -[NSObject setNote:](v16, "setNote:", v17);
      objc_msgSend(v17, "setFolder:", v8);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFolderModificationDate:", v25);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D641A0];
    NSStringFromClass((Class)a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "folder", "+[ICNote(Management) newObjectWithIdentifier:folder:]", 1, 0, CFSTR("Trying to create a %@ with no folder"), v19);

    v17 = 0;
  }

  return v17;
}

+ (id)newNoteWithoutIdentifierInFolder:(id)a3
{
  return (id)objc_msgSend(a1, "newObjectWithIdentifier:folder:", 0, a3);
}

+ (id)newEmptyNoteInFolder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1, "newEmptyNoteWithUUID:folder:", v6, v5);

  return v7;
}

+ (id)newEmptyNoteWithIdentifier:(id)a3 folder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICInternalSettingsGetBundleBoolSettingValue())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 255830400.0);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:folder:", v6, v7);
  objc_msgSend(v10, "setCreationDate:", v8);
  objc_msgSend(v10, "setModificationDate:", v8);
  objc_msgSend(v10, "noteData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setData:", 0);

  objc_msgSend(v10, "regenerateTitle:snippet:isNewNote:", 1, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastAttributionsViewedDate:", v12);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 16, -7, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastActivityRecentUpdatesViewedDate:", v15);

  objc_msgSend(v10, "lastActivityRecentUpdatesViewedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastActivitySummaryViewedDate:", v16);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = (id)objc_msgSend(v10, "persistCreateActivityEventForObject:inParentObject:", v10, v7);

  return v10;
}

+ (id)newEmptyNoteWithUUID:(id)a3 folder:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newEmptyNoteWithIdentifier:folder:", v7, v6);

  return v8;
}

+ (void)deleteEmptyNote:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "note.isEmpty", "+[ICNote(Management) deleteEmptyNote:]", 1, 0, CFSTR("Note is not empty for deletion"));
  if (objc_msgSend(v4, "isEmpty"))
  {
    v5 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) deleteEmptyNote:].cold.1(v4);

    objc_msgSend(v4, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trashFolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFolder:", v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFolderModificationDate:", v8);

    objc_msgSend(a1, "deleteNote:", v4);
  }

}

+ (void)deleteNote:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContextOptions:", 64);

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ICNote(Management) deleteNote:].cold.1();

  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v3, "attachments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "inlineAttachments", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          +[ICBaseAttachment deleteAttachment:](ICInlineAttachment, "deleteAttachment:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    v19 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) deleteNote:].cold.2(v3);

    objc_msgSend(v3, "markForDeletion");
    if (objc_msgSend(v3, "requiresLegacyTombstoneAfterDeletion"))
      +[ICLegacyTombstone addLegacyTombstoneForNote:](ICLegacyTombstone, "addLegacyTombstoneForNote:", v3);
  }

}

+ (void)purgeNote:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContextOptions:", 64);

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ICNote(Management) purgeNote:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICNoteWillBeDeletedNotification"), v3);

    objc_msgSend(v3, "managedObjectContext");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject deleteObject:](v6, "deleteObject:", v3);
  }

}

+ (id)refreshAllOfNoteWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  objc_msgSend(v8, "setPredicate:", v7);
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", &unk_1E771AA88);
  v9 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.8();

  objc_msgSend(v6, "executeFetchRequest:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "needsRefresh"))
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.7(v11);

    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.6(v11);

    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v11, 1);
    objc_msgSend(v11, "noteData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v14, 1);

    objc_msgSend(v11, "folder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v15, 1);

    v16 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.5(v11);

    v17 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.4(v11);

    v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.3(v11);

    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.2(v11);

    objc_msgSend(v11, "textDataDecryptedIfNecessary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.1(v20);

    v22 = objc_msgSend(v11, "mergeWithNoteData:", v20);
    objc_msgSend(v11, "setNeedsRefresh:", 0);
    if (v22 == 2)
    {
      +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "save");

    }
  }

  return v11;
}

+ (ICNote)noteWithUUID:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "noteWithIdentifier:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNote *)v8;
}

+ (ICNote)noteWithIdentifier:(id)a3 accountID:(id)a4 context:(id)a5
{
  return (ICNote *)objc_msgSend(a1, "noteWithIdentifier:includeDeleted:accountID:context:", a3, 1, a4, a5);
}

+ (id)visibleNoteWithIdentifier:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "noteWithIdentifier:includeDeleted:context:", a3, 0, a4);
}

+ (ICNote)noteWithLegacyManagedObjectID:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(a3, "URIRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("legacyManagedObjectIDURIRepresentation"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "notesMatchingPredicate:context:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNote *)v12;
}

+ (id)allNotesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "notesMatchingPredicate:context:", 0, a3);
}

+ (unint64_t)countOfAllNotesInContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  v6 = objc_msgSend(v4, "countForFetchRequest:error:", v5, 0);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

+ (id)visibleNotesInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "predicateForVisibleNotesInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notesMatchingPredicate:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)countOfVisibleNotesInContext:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "predicateForVisibleNotesInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "countOfNotesMatchingPredicate:context:", v5, v4);

  return v6;
}

+ (void)enumerateNotesInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a6;
  v9 = a5;
  v15 = a3;
  v12 = a7;
  if (v9)
  {
    objc_msgSend(a1, "predicateForVisibleNotesInContext:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v13, v14, 0, v15, a4, v8, v12);

}

+ (id)noteIdentifiersMatchingPredicate:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1C3B7AC74]();
  +[ICNote fetchRequest](ICNote, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v5);
  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPropertiesToFetch:", &unk_1E771AAA0);
  v14 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICNote(Management) noteIdentifiersMatchingPredicate:context:].cold.1();
  }
  else
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_7:

  objc_autoreleasePoolPop(v7);
  return v12;
}

+ (BOOL)notes:(id)a3 containSharedNotesNotSharedViaFolder:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICNote_Management__notes_containSharedNotesNotSharedViaFolder___block_invoke;
  v8[3] = &unk_1E76C81E8;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "ic_containsObjectPassingTest:", v8);

  return (char)a3;
}

uint64_t __65__ICNote_Management__notes_containSharedNotesNotSharedViaFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "isSharedRootObject");
  objc_msgSend(v3, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSharedViaICloud");

  if (v6 && objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud"))
  {
    +[ICFolder rootSharingFolderForNote:](ICFolder, "rootSharingFolderForNote:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfFolder:", v7);

  }
  else
  {
    v10 = 0;
  }
  if ((v4 & 1) != 0)
    v11 = 1;
  else
    v11 = v6 & (v10 ^ 1u);

  return v11;
}

+ (id)notesContainingHashtagWithStandarizedContent:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  _QWORD v46[6];

  v46[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[ICInlineAttachment predicateForTypeUTI:](ICInlineAttachment, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachment predicateForTokenContentIdentifier:](ICInlineAttachment, "predicateForTokenContentIdentifier:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleAttachmentsInContext:](ICInlineAttachment, "predicateForVisibleAttachmentsInContext:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v46[0] = v7;
  v46[1] = v8;
  v32 = (void *)v9;
  v33 = (void *)v8;
  v46[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICInlineAttachment fetchRequest](ICInlineAttachment, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v12);
  objc_msgSend(v13, "setResultType:", 2);
  objc_msgSend(v13, "setPropertiesToFetch:", &unk_1E771AAB8);
  v38 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v13, &v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v38;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNote(Management) notesContainingHashtagWithStandarizedContent:context:]", 1, 0, CFSTR("Failed to fetch objects for predicate=%@: %@"), v12, v15);
  }
  else if (v14)
  {
    v29 = v7;
    v30 = v6;
    v31 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v14;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "objectForKeyedSubscript:", CFSTR("note"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v19);
    }

    v6 = v30;
    v5 = v31;
    v14 = v28;
    v7 = v29;
  }
  else
  {
    v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v41 = v24;
      v42 = 2112;
      v43 = v12;
      v44 = 2112;
      v45 = v6;
      v25 = v24;
      _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_INFO, "Nil objects array fetching %@ (predicate=%@ context=%@)", buf, 0x20u);

    }
  }
  v26 = (void *)objc_msgSend(v16, "copy");

  return v26;
}

+ (id)systemPaperNotesFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a1, "newFetchRequestForNotes");
  objc_msgSend(a1, "predicateForSystemPaperNotesNotInTrash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  return v3;
}

+ (id)predicateForNote:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), a3);
}

+ (id)predicateForVisibleNotesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", 0, 1, 1, 1, a3);
}

+ (id)predicateForSearchableNotesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForVisibleNotesIncludingTrash:includingSystemPaper:includingMathNotes:includingCallNotes:inContext:", 1, 1, 1, 1, a3);
}

+ (id)predicateForNotesWithChecklists
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hasChecklist == YES"));
}

+ (id)predicateForSystemPaperNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isSystemPaper == YES"));
}

+ (id)predicateForSystemPaperNotesNotInTrash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.folderType != %d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("markedForDeletion == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForSystemPaperNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v3;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForVisibleNotesIncludingTrash:(BOOL)a3 includingSystemPaper:(BOOL)a4 includingMathNotes:(BOOL)a5 includingCallNotes:(BOOL)a6 inContext:(id)a7
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicateForVisibleObjects", a3, a4, a5, a6, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.folderType != %d"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isSystemPaper == NO"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  if (!a5)
  {
    v16 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hostApplicationIdentifier = NIL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v19 = (void *)MEMORY[0x1E0CB3880];
    v38[0] = CFSTR("com.apple.greyparrot");
    v38[1] = CFSTR("com.apple.calculator");
    v39[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("hostApplicationIdentifier IN %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notPredicateWithSubpredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addObject:", v24);
  }
  if (!a6)
  {
    v25 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hostApplicationIdentifier = NIL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3528];
    v28 = (void *)MEMORY[0x1E0CB3880];
    v36 = CFSTR("com.apple.mobilephone");
    v37[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:", CFSTR("hostApplicationIdentifier IN %@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "notPredicateWithSubpredicate:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "orPredicateWithSubpredicates:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addObject:", v33);
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)predicateForNotesInAccountWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account.identifier == %@"), a3);
}

- (NSURL)paperCoherenceContextURL
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICEditorExtensionBundleIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__ICNote_Management__paperCoherenceContextURL__block_invoke;
  v10[3] = &unk_1E76C8210;
  v11 = v6;
  v10[4] = self;
  v10[5] = &v12;
  objc_msgSend(v7, "performBlockAndWait:", v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSURL *)v8;
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      || (objc_msgSend(*(id *)(a1 + 32), "folder"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "account"),
          v3 = objc_claimAutoreleasedReturnValue(),
          v4,
          v3))
    {
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URLsForDirectory:inDomains:", 9, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D63EE8], 1);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        -[NSObject identifier](v3, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v14, 1);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
      else
      {
        -[NSObject accountFilesDirectoryURLInApplicationDataContainer](v3, "accountFilesDirectoryURLInApplicationDataContainer");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "URLByAppendingPathComponent:isDirectory:", CFSTR("CoherenceContexts"), 1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", v24, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    else
    {
      v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_2();
    }
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_1();
  }

}

- (id)primaryEncryptedData
{
  void *v2;
  void *v3;

  -[ICNote noteData](self, "noteData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primitiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNote noteData](self, "noteData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v4);

}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextData"));
}

+ (id)snippetForPasswordProtectedNote:(id)a3
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "note.isPasswordProtected", "+[ICNote(Management) snippetForPasswordProtectedNote:]", 1, 0, CFSTR("Trying to get a password snippet for a non password protected note"));
  if (objc_msgSend(v3, "isAuthenticated"))
  {
    v4 = CFSTR("NOTE_SNIPPET_UNLOCKED");
    v5 = CFSTR("Unlocked");
  }
  else
  {
    v4 = CFSTR("NOTE_SNIPPET_LOCKED");
    v5 = CFSTR("Locked");
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allPasswordProtectedNoteIdentifiersInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ICCloudSyncingObject predicateForPasswordProtectedObjects](ICCloudSyncingObject, "predicateForPasswordProtectedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "noteIdentifiersMatchingPredicate:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)countOfPasswordProtectedNotesInContext:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  +[ICCloudSyncingObject predicateForPasswordProtectedObjects](ICCloudSyncingObject, "predicateForPasswordProtectedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "countOfNotesMatchingPredicate:context:", v5, v4);

  return v6;
}

+ (unint64_t)countOfVisiblePasswordProtectedNotesInAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("account == %@ && isPasswordProtected == YES"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleNotesInContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(a1, "countOfNotesMatchingPredicate:context:", v11, v12);
  return v13;
}

+ (id)passwordProtectedNoteIdentifiersForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("account == %@ && isPasswordProtected == YES"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "noteIdentifiersMatchingPredicate:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)accountIdentifiersOfNotes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        ICDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "account", v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "ic_addNonNilObject:", v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (id)childCloudObjectsForMinimumSupportedVersionPropagation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICNote attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[ICNote inlineAttachments](self, "inlineAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v6, "count") + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNote attachments](self, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_objectsPassingTest:", &__block_literal_global_902);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v10);

  -[ICNote inlineAttachments](self, "inlineAttachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v12);

  v13 = (void *)objc_msgSend(v7, "copy");
  return v13;
}

BOOL __76__ICNote_Management__childCloudObjectsForMinimumSupportedVersionPropagation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "parentAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICNote;
  objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingCanBeSharedViaICloud);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("folder.folderType"));
  return v3;
}

- (BOOL)canBeRootShareObject
{
  return 1;
}

- (id)shareType
{
  return CFSTR("com.apple.notes.note");
}

- (BOOL)needsToDeleteShare
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  if (-[ICCloudSyncingObject needsToDeleteShare](&v8, sel_needsToDeleteShare))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[ICCloudSyncingObject serverShare](self, "serverShare");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[ICNote folder](self, "folder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTrashFolder");

      if (v6)
        LOBYTE(v3) = -[ICCloudSyncingObject shareMatchesRecord](self, "shareMatchesRecord");
      else
        LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)didAcceptShare:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)ICNote;
  -[ICCloudSyncingObject didAcceptShare:](&v17, sel_didAcceptShare_, a3);
  -[ICNote folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTrashFolder");

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultFolder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Moving shared note %@ out of the trash to folder %@ in account %@", buf, 0x20u);

    }
    -[ICNote account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultFolder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setFolder:](self, "setFolder:", v14);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setFolderModificationDate:](self, "setFolderModificationDate:", v15);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setModificationDate:](self, "setModificationDate:", v16);

    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Accepted share"));
  }
}

- (unint64_t)textOffsetAtSearchIndex:(unint64_t)a3 inSearchableString:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ICNote_Management__textOffsetAtSearchIndex_inSearchableString___block_invoke;
  v10[3] = &unk_1E76C8278;
  v10[4] = &v11;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("ICAttachmentSearchable"), 0, v7, 0, v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __65__ICNote_Management__textOffsetAtSearchIndex_inSearchableString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4
                                                                    + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 24)
                                                                    - 1;
  return result;
}

- (_NSRange)textRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4
{
  NSUInteger length;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  length = a3.length;
  v5 = a3.location
     - -[ICNote textOffsetAtSearchIndex:inSearchableString:](self, "textOffsetAtSearchIndex:inSearchableString:", a3.location, a4);
  v6 = length;
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)addAttachmentWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[ICBaseAttachment newAttachmentWithIdentifier:note:](ICAttachment, "newAttachmentWithIdentifier:note:", v5, self);

  objc_msgSend(v7, "setCreationDate:", v6);
  objc_msgSend(v7, "setModificationDate:", v6);
  -[ICNote addAttachmentsObject:](self, "addAttachmentsObject:", v7);
  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    objc_msgSend(v7, "setIsPasswordProtected:", 1);
    objc_msgSend(v7, "initializeCryptoProperties");
  }

  return v7;
}

- (id)addAttachmentWithData:(id)a3 filename:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CEC3F8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeWithFilenameExtension:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNote addAttachmentWithUTI:data:filename:](self, "addAttachmentWithUTI:data:filename:", v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)addAttachmentWithFileURL:(id)a3
{
  return -[ICNote addAttachmentWithFileURL:updateFileBasedAttributes:analytics:](self, "addAttachmentWithFileURL:updateFileBasedAttributes:analytics:", a3, 1, 1);
}

- (id)addAttachmentWithFileURL:(id)a3 updateFileBasedAttributes:(BOOL)a4 analytics:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v25 = 0;
  v9 = *MEMORY[0x1E0C999D0];
  v24 = 0;
  v10 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v25, v9, &v24);
  v11 = v25;
  v12 = v24;
  if (v10)
  {
    v13 = objc_msgSend(v11, "BOOLValue");
    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = v15;
    }
    objc_msgSend(v8, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v8, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) != 0)
        objc_msgSend(v18, "typeWithFilenameExtension:conformingToType:", v19, *MEMORY[0x1E0CEC4B8]);
      else
        objc_msgSend(v18, "typeWithFilenameExtension:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = v22;
    }
    -[ICNote addAttachmentWithUTI:withURL:updateFileBasedAttributes:analytics:](self, "addAttachmentWithUTI:withURL:updateFileBasedAttributes:analytics:", v14, v8, v6, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICNote(AttachmentManagement) addAttachmentWithFileURL:updateFileBasedAttributes:analytics:].cold.1();
    v20 = 0;
  }

  return v20;
}

- (id)addAttachmentWithFileWrapper:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "isDirectory");
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  +[ICNoteContext filenameFromFileWrapper:](ICNoteContext, "filenameFromFileWrapper:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v8, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0)
      objc_msgSend(v11, "typeWithFilenameExtension:conformingToType:", v12, *MEMORY[0x1E0CEC4B8]);
    else
      objc_msgSend(v11, "typeWithFilenameExtension:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v14;
  }
  -[ICNote addAttachmentWithUTI:](self, "addAttachmentWithUTI:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke;
  v19[3] = &unk_1E76C82C8;
  v20 = v4;
  v17 = v4;
  -[ICNote addMediaToAttachment:withBlock:](self, "addMediaToAttachment:withBlock:", v15, v19);

  return v15;
}

void __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "addMediaWithFileWrapper:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "audioModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "audioModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transformNewlyAddedMediaAttachment");

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke_2;
  v8[3] = &unk_1E76C82A0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v7, "updatePlaceInLocationIfNeededHandler:", v8);

}

void __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke_2(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_save");

  }
}

- (id)addAttachmentWithRemoteFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeWithFilenameExtension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[ICNote addAttachmentWithUTI:](self, "addAttachmentWithUTI:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  objc_msgSend(v10, "setRemoteFileURL:", v4);
  return v10;
}

- (id)addAttachmentWithUTI:(id)a3
{
  return -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", a3, 0, 0, 1);
}

- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6
{
  return -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:](self, "addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:", a3, a4, a5, a6, 1);
}

- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6 regulatoryLogging:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  const char *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v7 = a7;
  v8 = a6;
  v33[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICWillAddAttachmentForNoteNotification"), self);

    -[ICNote addAttachmentWithIdentifier:](self, "addAttachmentWithIdentifier:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("ICDidAddAttachmentForNoteNotification"), self);

  }
  else
  {
    -[ICNote addAttachment](self, "addAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setTypeUTI:", v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCreationDate:", v18);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setModificationDate:", v19);

  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v12, "isEqualToString:", v20);

  if (v21)
  {
    objc_msgSend(v16, "setUrlString:", v14);
    if (v14)
      goto LABEL_10;
    v22 = (void *)MEMORY[0x1E0D641A0];
    v23 = "urlString != ((void *)0)";
    v24 = CFSTR("Expected a valid URL for a URL attachment. Call addURLAttachmentWithURL:");
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    v22 = (void *)MEMORY[0x1E0D641A0];
    v23 = "urlString == ((void *)0)";
    v24 = CFSTR("Expected no URL for a non-URL attachment.");
  }
  objc_msgSend(v22, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", v23, "-[ICNote(AttachmentManagement) addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:]", 1, 0, v24);
LABEL_10:
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("ICNoteAnalyticsAddAttachmentNotificationAttachmentKey");
    v33[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("ICNoteAnalyticsAddAttachmentNotification"), 0, v26);

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("ICRegulatoryLoggerAttachmentKey");
    v31 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("ICRegulatoryLoggerAttachmentAddedNotification"), 0, v28);

  }
  return v16;
}

- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "ic_isURLAnInternetLocator")
    && (objc_msgSend(MEMORY[0x1E0C99E98], "ic_urlFromWeblocFileAtURL:", v7),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    -[ICNote addURLAttachmentWithURL:](self, "addURLAttachmentWithURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICNote addAttachmentWithUTI:withURL:updateFileBasedAttributes:analytics:](self, "addAttachmentWithUTI:withURL:updateFileBasedAttributes:analytics:", v6, v7, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4 updateFileBasedAttributes:(BOOL)a5 analytics:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v6 = a6;
  v10 = a4;
  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", a3, 0, 0, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke;
  v14[3] = &unk_1E76C82F0;
  v15 = v10;
  v16 = a5;
  v12 = v10;
  -[ICNote addMediaToAttachment:withBlock:](self, "addMediaToAttachment:withBlock:", v11, v14);

  return v11;
}

void __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "addMediaWithURL:updateFileBasedAttributes:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke_2;
  v6[3] = &unk_1E76C82A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "updatePlaceInLocationIfNeededHandler:", v6);

}

void __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke_2(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_save");

  }
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filenameExtension:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICNote title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[ICNote title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_sanitizedFilenameString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      if (!objc_msgSend(v10, "length"))
      {
        +[ICAttachment filenameExtensionForUTI:](ICAttachment, "filenameExtensionForUTI:", v8);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v15;
      }
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(v14, "stringByAppendingPathExtension:", v10);
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v16;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  if (!objc_msgSend(v14, "length"))
  {
    +[ICAttachment filenameFromUTI:](ICAttachment, "filenameFromUTI:", v8);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  -[ICNote addAttachmentWithUTI:data:filename:](self, "addAttachmentWithUTI:data:filename:", v8, v9, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)addURLAttachmentWithURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (void *)*MEMORY[0x1E0CEC618];
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", v6, 0, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
    {
      objc_msgSend(v8, "modificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote setModificationDate:](self, "setModificationDate:", v13);

    }
  }
  return v8;
}

- (id)addSynapseLinkAttachmentWithContentItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  ICNote *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke;
  v13 = &unk_1E76C8358;
  v16 = &v17;
  v14 = self;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "performBlockAndWait:", &v10);

  v7 = (void *)v18[5];
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((attachment) != nil)", "-[ICNote(AttachmentManagement) addSynapseLinkAttachmentWithContentItem:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "attachment", v10, v11, v12, v13, v14);
    v7 = (void *)v18[5];
  }
  v8 = v7;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAttachmentWithUTI:identifier:urlString:analytics:", v3, 0, v5, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "updatePlaceInLocationIfNeededHandler:", &__block_literal_global_995);
  v9 = *(void **)(a1 + 40);
  v18 = 0;
  objc_msgSend(v9, "dataRepresentationWithError:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNote(AttachmentManagement) addSynapseLinkAttachmentWithContentItem:]_block_invoke", 1, 0, CFSTR("Couldn't serialize SYContentItem to NSData. Error: %@"), v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "linkPreviewMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "loadLinkPreviewForSynapseItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSynapseData:", v10);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "modificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "modificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "compare:", v15);

    if (v16 == -1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "modificationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setModificationDate:", v17);

    }
  }

}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2_cold_1();

  }
}

- (id)addGalleryAttachmentWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", CFSTR("com.apple.notes.gallery"), a3, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment defaultTitleForAttachmentType:](ICAttachment, "defaultTitleForAttachmentType:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  return v3;
}

- (id)addTableAttachment
{
  ICTableVersionedDocument *v3;
  void *v4;
  ICTableVersionedDocument *v5;
  void *v6;
  void *v7;

  v3 = [ICTableVersionedDocument alloc];
  -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICTableVersionedDocument initWithColumnCount:rowCount:replicaID:](v3, "initWithColumnCount:rowCount:replicaID:", 2, 2, v4);

  -[ICTTVersionedDocument serialize](v5, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote addTableAttachmentWithTableData:](self, "addTableAttachmentWithTableData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addAudioAttachmentWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = a3;
  -[ICNote visibleTopLevelAttachments](self, "visibleTopLevelAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_compactMap:", &__block_literal_global_1005);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Recording"), CFSTR("New Recording"), 0, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (objc_msgSend(v5, "containsObject:", v6))
  {
    v8 = 2;
    v9 = v6;
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Recording %ld"), CFSTR("New Recording %ld"), 0, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      ++v8;
      v9 = v7;
    }
    while ((objc_msgSend(v5, "containsObject:", v7) & 1) != 0);
  }
  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:](self, "addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:", *MEMORY[0x1E0C8A2A8], v14, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v7);

  return v12;
}

id __65__ICNote_AttachmentManagement__addAudioAttachmentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "attachmentType") == 4)
  {
    objc_msgSend(v2, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v2, "title");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)addSystemPaperAttachmentWithIdentifier:(id)a3
{
  return -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", CFSTR("com.apple.paper"), a3, 0, 1);
}

- (id)addPaperDocumentAttachmentWithIdentifier:(id)a3 subtype:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = CFSTR("com.apple.paper.doc.pdf");
  v15[1] = CFSTR("com.apple.paper.doc.scan");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[allowedSubtypes containsObject:subtype]", "-[ICNote(AttachmentManagement) addPaperDocumentAttachmentWithIdentifier:subtype:]", 1, 0, CFSTR("unexpected subtype: %@ is not one of %@; assuming PDF"),
      v7,
      v10);
  if ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
  {
    v11 = CFSTR("com.apple.paper.doc.pdf");

    v7 = v11;
  }
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICInternalSettingsIsPDFsInNotesEnabled()", "-[ICNote(AttachmentManagement) addPaperDocumentAttachmentWithIdentifier:subtype:]", 1, 0, CFSTR("PDFsInNotes must be enabled"));
  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", v7, v6, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.paper.doc.scan")))
  {
    +[ICAttachment defaultTitleForAttachmentType:](ICAttachment, "defaultTitleForAttachmentType:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

  }
  return v12;
}

- (id)addTableAttachmentWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachmentTableModel tableFromAttributedString:managedObjectContext:replicaID:](ICAttachmentTableModel, "tableFromAttributedString:managedObjectContext:replicaID:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "columnCount");

  if (v9 <= 1)
  {
    do
    {
      objc_msgSend(v7, "table");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "insertColumnAtIndex:", objc_msgSend(v11, "columnCount"));

      objc_msgSend(v7, "table");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "columnCount");

    }
    while (v14 < 2);
  }
  objc_msgSend(v7, "serialize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote addTableAttachmentWithTableData:](self, "addTableAttachmentWithTableData:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)addTableAttachmentWithTableData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICNote addAttachmentWithUTI:](self, "addAttachmentWithUTI:", CFSTR("com.apple.notes.table"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded");
  objc_msgSend(v5, "setMergeableData:", v4);

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_save");

  return v5;
}

- (id)addInlineDrawingAttachmentWithAnalytics:(BOOL)a3
{
  void *v3;
  void *v4;

  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:](self, "addAttachmentWithUTI:identifier:urlString:analytics:", CFSTR("com.apple.drawing.2"), 0, 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment defaultTitleForAttachmentType:](ICAttachment, "defaultTitleForAttachmentType:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  return v3;
}

- (id)addAttachment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICWillAddAttachmentForNoteNotification"), self);

  -[ICNote addAttachmentWithIdentifier:](self, "addAttachmentWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICDidAddAttachmentForNoteNotification"), self);

  return v6;
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5
{
  return -[ICNote addAttachmentWithUTI:data:filename:updateFileBasedAttributes:analytics:regulatoryLogging:](self, "addAttachmentWithUTI:data:filename:updateFileBasedAttributes:analytics:regulatoryLogging:", a3, a4, a5, 1, 1, 1);
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5 updateFileBasedAttributes:(BOOL)a6 analytics:(BOOL)a7 regulatoryLogging:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;

  v8 = a8;
  v9 = a7;
  v14 = a4;
  v15 = a5;
  -[ICNote addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:](self, "addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:", a3, 0, 0, v9, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke;
  v20[3] = &unk_1E76C83C0;
  v21 = v14;
  v22 = v15;
  v23 = a6;
  v17 = v15;
  v18 = v14;
  -[ICNote addMediaToAttachment:withBlock:](self, "addMediaToAttachment:withBlock:", v16, v20);

  return v16;
}

void __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "addMediaWithData:filename:updateFileBasedAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke_2;
  v6[3] = &unk_1E76C82A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "updatePlaceInLocationIfNeededHandler:", v6);

}

void __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke_2(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_save");

  }
}

- (void)addMediaToAttachment:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSMutableArray *v17;
  NSMutableArray *noteDidSaveBlocks;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  ICNote *v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = a4;
  if (-[ICNote shouldAddMediaAsynchronously](self, "shouldAddMediaAsynchronously"))
  {
    if (addMediaToAttachment_withBlock__onceToken != -1)
      dispatch_once(&addMediaToAttachment_withBlock__onceToken, &__block_literal_global_1016);
    objc_msgSend(v6, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICNote(AttachmentManagement) addMediaToAttachment:withBlock:].cold.2();

    v10 = objc_msgSend(v6, "isInserted");
    objc_msgSend(v6, "ic_permanentObjectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019;
    aBlock[3] = &unk_1E76C8408;
    v13 = v8;
    v29 = v13;
    v30 = self;
    v14 = v11;
    v31 = v14;
    v32 = v7;
    v15 = _Block_copy(aBlock);
    if (v10)
    {
      v16 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ICNote(AttachmentManagement) addMediaToAttachment:withBlock:].cold.1();

      if (!self->_noteDidSaveBlocks)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        noteDidSaveBlocks = self->_noteDidSaveBlocks;
        self->_noteDidSaveBlocks = v17;

      }
      v22 = v12;
      v23 = 3221225472;
      v24 = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1021;
      v25 = &unk_1E76C8430;
      v26 = v13;
      v27 = v15;
      v19 = _Block_copy(&v22);
      v20 = self->_noteDidSaveBlocks;
      v21 = _Block_copy(v19);
      -[NSMutableArray addObject:](v20, "addObject:", v21, v22, v23, v24, v25);

    }
    else
    {
      dispatch_async((dispatch_queue_t)addMediaToAttachment_withBlock__addMediaToAttachmentQueue, v15);
    }

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.notes.addMediaToAttachment", attr);
  v2 = (void *)addMediaToAttachment_withBlock__addMediaToAttachmentQueue;
  addMediaToAttachment_withBlock__addMediaToAttachmentQueue = (uint64_t)v1;

}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019_cold_2((uint64_t)a1, v2, v3);

  objc_msgSend(a1[5], "workerManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1020;
  v8[3] = &unk_1E76C7780;
  v9 = a1[6];
  v5 = v4;
  v10 = v5;
  v11 = a1[7];
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019_cold_1((uint64_t)a1, v6, v7);

}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1020(uint64_t a1)
{
  id v2;

  +[ICAttachment ic_existingObjectWithID:context:](ICAttachment, "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "ic_save");

}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1021(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1021_cold_1(a1, v2, v3);

  dispatch_async((dispatch_queue_t)addMediaToAttachment_withBlock__addMediaToAttachmentQueue, *(dispatch_block_t *)(a1 + 40));
}

- (id)addInlineAttachmentWithIdentifier:(id)a3
{
  id v4;

  v4 = +[ICBaseAttachment newAttachmentWithIdentifier:note:](ICInlineAttachment, "newAttachmentWithIdentifier:note:", a3, self);
  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
  {
    objc_msgSend(v4, "setIsPasswordProtected:", 1);
    objc_msgSend(v4, "initializeCryptoProperties");
  }
  -[ICNote addInlineAttachmentsObject:](self, "addInlineAttachmentsObject:", v4);
  return v4;
}

- (id)anyVisibleInstanceOfHashtag:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote visibleInlineAttachments](self, "visibleInlineAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICNote_AttachmentManagement__anyVisibleInstanceOfHashtag___block_invoke;
  v9[3] = &unk_1E76C8458;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__ICNote_AttachmentManagement__anyVisibleInstanceOfHashtag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  unsigned int v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "attachmentType");
  objc_msgSend(v3, "tokenContentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if (v4 == 1)
    return v6;
  else
    return 0;
}

- (id)inlineAttachmentWithICTTAttachment:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICNote inlineAttachments](self, "inlineAttachments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICInlineAttachment, "attachmentWithIdentifier:context:", v4, v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (void)turnAttachmentsIntoFaults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICNote attachments](self, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isFault") & 1) == 0)
        {
          -[ICNote managedObjectContext](self, "managedObjectContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ic_refreshObject:mergeChanges:", v8, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (void)createNoteForAirDropDocument:(id)a3 legacyContext:(id)a4 processAttributedString:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  uint64_t (**v11)(id, void *, id, void *, id);
  void (**v12)(id, id);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = (uint64_t (**)(id, void *, id, void *, id))a5;
  v12 = (void (**)(id, id))a6;
  if (v9)
  {
    v13 = objc_msgSend(v9, "document");
    v14 = v13;
    if ((*(_BYTE *)(v13 + 32) & 1) == 0)
    {
      v13 = objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "document.has_notedocument()", "+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]", 1, 0, CFSTR("AirDrop document does not have note document"));
      if ((*(_BYTE *)(v14 + 32) & 1) == 0)
        goto LABEL_12;
    }
    v15 = *(_QWORD *)(v14 + 40);
    if (!v15)
    {
      v13 = airdrop_document::Document::default_instance((airdrop_document::Document *)v13);
      v15 = *(_QWORD *)(v13 + 40);
    }
    if ((*(_BYTE *)(v15 + 32) & 1) == 0)
    {
      v13 = objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "noteDocument.has_version1_0()", "+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]", 1, 0, CFSTR("Failed to find any note document version"));
      if ((*(_BYTE *)(v15 + 32) & 1) == 0)
        goto LABEL_12;
    }
    v16 = *(_QWORD *)(v15 + 40);
    if (!v16)
    {
      v13 = airdrop_document::NoteDocument::default_instance((airdrop_document::NoteDocument *)v13);
      v16 = *(_QWORD *)(v13 + 40);
    }
    if ((*(_BYTE *)(v16 + 32) & 1) != 0
      || (v13 = objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "version1_0.has_attributedstring()", "+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]", 1, 0, CFSTR("No string found from version 1.0 data")), (*(_BYTE *)(v16 + 32) & 1) != 0))
    {
      v18 = *(_QWORD *)(v16 + 40);
      if (!v18)
        v18 = *(_QWORD *)(airdrop_document::NoteDocument1_0::default_instance((airdrop_document::NoteDocument1_0 *)v13)
                        + 40);
      v19 = *(uint64_t **)(v18 + 40);
      if (*((char *)v19 + 23) < 0)
      {
        v19 = (uint64_t *)*v19;
        v20 = *(_QWORD *)(*(_QWORD *)(v18 + 40) + 8);
      }
      else
      {
        v20 = *((unsigned __int8 *)v19 + 23);
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, v20, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "managedObjectContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICFolder defaultFolderInContext:](ICFolder, "defaultFolderInContext:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v17 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v23);
      }
      else
      {
        +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "managedObjectContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = +[ICNote newEmptyNoteInContext:](ICNote, "newEmptyNoteInContext:", v25);

      }
      if ((*(_BYTE *)(v16 + 32) & 2) != 0)
        v26 = *(_QWORD *)(v16 + 48);
      else
        v26 = 0;
      objc_msgSend(v17, "requireMinimumSupportedVersionAndPropagateToChildObjects:", v26);
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB3498], "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v31, 0, v17, &v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v32;
      v29 = v11[2](v11, v23, v17, v27, v28);

      if ((v29 & 1) == 0)
      {

        v17 = 0;
      }

      if (v12 && v17)
      {
        objc_msgSend(v17, "updateChangeCountWithReason:", CFSTR("Created note from AirDrop"));
        objc_msgSend(v17, "managedObjectContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ic_save");

        v12[2](v12, v17);
      }
    }
    else
    {
LABEL_12:
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "airDropDocument", "+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]", 1, 0, CFSTR("airDropDocument is nil"));
  }

}

- (id)newAirDropDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICAirDropDocument *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;

  if (!-[ICNote isSharable](self, "isSharable"))
    return 0;
  -[ICNote attributedString](self, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 3, 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(ICAirDropDocument);
    v8 = -[ICAirDropDocument document](v7, "document");
    *(_DWORD *)(v8 + 32) |= 1u;
    v9 = *(_QWORD *)(v8 + 40);
    if (!v9)
    {
      v9 = operator new();
      airdrop_document::NoteDocument::NoteDocument((airdrop_document::NoteDocument *)v9);
      *(_QWORD *)(v8 + 40) = v9;
    }
    *(_DWORD *)(v9 + 32) |= 1u;
    v10 = *(_QWORD *)(v9 + 40);
    if (!v10)
    {
      v10 = operator new();
      airdrop_document::NoteDocument1_0::NoteDocument1_0((airdrop_document::NoteDocument1_0 *)v10);
      *(_QWORD *)(v9 + 40) = v10;
    }
    v11 = -[ICNote intrinsicNotesVersionForScenario:](self, "intrinsicNotesVersionForScenario:", 1);
    v12 = *(_DWORD *)(v10 + 32);
    if (v11)
    {
      v12 |= 2u;
      *(_DWORD *)(v10 + 32) = v12;
      *(_QWORD *)(v10 + 48) = v11;
    }
    *(_DWORD *)(v10 + 32) = v12 | 1;
    v13 = *(_QWORD *)(v10 + 40);
    if (!v13)
    {
      v13 = operator new();
      airdrop_document::AttributedString::AttributedString((airdrop_document::AttributedString *)v13);
      *(_QWORD *)(v10 + 40) = v13;
    }
    v14 = objc_retainAutorelease(v6);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    *(_DWORD *)(v13 + 32) |= 1u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*(_QWORD *)(v13 + 40) == google::protobuf::internal::empty_string_)
    {
      v15 = (_QWORD *)operator new();
      *v15 = 0;
      v15[1] = 0;
      v15[2] = 0;
      *(_QWORD *)(v13 + 40) = v15;
    }
    MEMORY[0x1C3B7A7E8]();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (NSString)recordType
{
  if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
    return (NSString *)CFSTR("PasswordProtectedNote");
  else
    return (NSString *)CFSTR("Note");
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)ICNote;
  v8 = a3;
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](&v14, sel_objectWasFetchedFromCloudWithRecord_accountID_force_, v8, a4, v5);
  objc_msgSend(v8, "recordID", v14.receiver, v14.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCloudSyncingObject recordID](self, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "Duplicated note (%@) to (%@), clearing server record again", buf, 0x16u);
    }

    -[ICCloudSyncingObject clearServerRecords](self, "clearServerRecords");
    -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 0);
  }

}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[ICNote mergePolicyForRecord:](self, "mergePolicyForRecord:", v12);
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[ICNote mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:](self, "mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:", v12, v13, v15, a5, v10);
  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 account:(id)a4 approach:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LOBYTE(a5) = -[ICNote mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:](self, "mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:", v9, -[ICNote mergePolicyForRecord:](self, "mergePolicyForRecord:", v9), v8, a5, 0);

  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 mergePolicy:(int64_t)a4 account:(id)a5 approach:(int64_t)a6 mergeableFieldState:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int16 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int16 v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  ICMergeableDictionary *v69;
  void *v70;
  void *v71;
  ICMergeableDictionary *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  objc_super v96;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (a4 != 3)
  {
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v96.receiver = self;
    v96.super_class = (Class)ICNote;
    v16 = -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v96, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v12, v15, a6, v14);

    if (!v16)
      goto LABEL_31;
    objc_msgSend(v12, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setIdentifier:](self, "setIdentifier:", v18);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CreationDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject creationDate](self, "creationDate");
    v20 = objc_claimAutoreleasedReturnValue();
    v95 = v14;
    if (!v20)
      goto LABEL_9;
    v21 = (void *)v20;
    v93 = v13;
    -[ICCloudSyncingObject creationDate](self, "creationDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqual:", v23) & 1) == 0)
    {
      v91 = v19;
      -[ICCloudSyncingObject creationDate](self, "creationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEqual:", v25) & 1) == 0)
      {
        -[ICCloudSyncingObject creationDate](self, "creationDate");
        v88 = v24;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v54, "isEqual:", v55);

        v13 = v93;
        v14 = v95;
        v19 = v91;
        if ((v90 & 1) == 0)
        {
          -[ICCloudSyncingObject creationDate](self, "creationDate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "earlierDate:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICNote setCreationDate:](self, "setCreationDate:", v57);

LABEL_10:
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ModificationDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            -[ICCloudSyncingObject modificationDate](self, "modificationDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "laterDate:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICNote setModificationDate:](self, "setModificationDate:", v28);

          }
          -[ICNote mergeTextDataFromRecord:mergePolicy:mergeableFieldState:](self, "mergeTextDataFromRecord:mergePolicy:mergeableFieldState:", v12, a4, v14);
          if (a6)
            goto LABEL_56;
          -[ICNote folderReferenceFromRecord:](self, "folderReferenceFromRecord:", v12);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v29;
          if (v29)
          {
            v30 = objc_alloc(MEMORY[0x1E0C95048]);
            objc_msgSend(v29, "recordID");
            v31 = v19;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "initWithRecordType:recordID:", CFSTR("Folder"), v32);

            v19 = v31;
            v29 = (void *)v33;
          }
          v34 = objc_msgSend(v12, "ic_isOwnedByCurrentUser");
          v35 = objc_msgSend(v29, "ic_isOwnedByCurrentUser");
          v89 = v29;
          if ((v34 & 1) != 0
            || ((v36 = v35,
                 objc_msgSend(v12, "share"),
                 v37 = (void *)objc_claimAutoreleasedReturnValue(),
                 v37,
                 !v37)
              ? (v38 = 1)
              : (v38 = v36),
                v38 == 1))
          {
            -[ICNote mergeFoldersFromRecord:account:](self, "mergeFoldersFromRecord:account:", v12, v13);
          }
          else
          {
            -[ICNote folder](self, "folder");
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v84)
            {
              if (!v13)
              {
                -[ICNote managedObjectContext](self, "managedObjectContext");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                +[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v85);
                v13 = (id)objc_claimAutoreleasedReturnValue();

              }
              v86 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
                -[ICNote(CloudKit) mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:].cold.1(v13, v12, v86);

              objc_msgSend(v13, "defaultFolder");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNote setFolder:](self, "setFolder:", v87);

            }
          }
          objc_msgSend(v12, "recordType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICNote setIsPasswordProtected:](self, "setIsPasswordProtected:", objc_msgSend(v39, "isEqualToString:", CFSTR("PasswordProtectedNote")));

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AttachmentViewType"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = v19;
            objc_opt_class();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AttachmentViewType"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            ICCheckedDynamicCast();
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = objc_msgSend(v43, "intValue");
            if (-[ICNote attachmentViewType](self, "attachmentViewType") != v44)
              -[ICNote setAttachmentViewType:](self, "setAttachmentViewType:", v44);

            v19 = v41;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PaperStyleType"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            v46 = v19;
            objc_opt_class();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PaperStyleType"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            ICCheckedDynamicCast();
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = objc_msgSend(v48, "intValue");
            if (-[ICNote paperStyleType](self, "paperStyleType") != v49)
              -[ICNote setPaperStyleType:](self, "setPaperStyleType:", v49);

            v19 = v46;
          }
          objc_msgSend(v12, "encryptedValues");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("TitleEncrypted"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend(v51, "ic_stringValue");
            v52 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v58)
              goto LABEL_37;
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
            v52 = objc_claimAutoreleasedReturnValue();
          }
          v59 = (void *)v52;
          -[ICNote setTitle:](self, "setTitle:", v52);

LABEL_37:
          v94 = v13;
          objc_msgSend(v12, "encryptedValues");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("SnippetEncrypted"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            objc_msgSend(v61, "ic_stringValue");
            v62 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Snippet"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
              goto LABEL_42;
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Snippet"));
            v62 = objc_claimAutoreleasedReturnValue();
          }
          v64 = (void *)v62;
          -[ICNote setSnippet:](self, "setSnippet:", v62);

LABEL_42:
          objc_msgSend(v12, "encryptedValues");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ReplicaIDToUserIDEncrypted"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(v12, "encryptedValues");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("ReplicaIDToUserIDEncrypted"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = [ICMergeableDictionary alloc];
            -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
            v70 = v19;
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = -[ICMergeableDictionary initWithData:replicaID:](v69, "initWithData:replicaID:", v68, v71);

            v19 = v70;
            -[ICNote mergeReplicaIDToUserID:](self, "mergeReplicaIDToUserID:", v72);

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LegacyImportDeviceIdentifier"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v73)
            -[ICNote setLegacyImportDeviceIdentifier:](self, "setLegacyImportDeviceIdentifier:", v73);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LegacyModificationDateAtImport"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          if (v74)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LegacyModificationDateAtImport"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICNote setLegacyModificationDateAtImport:](self, "setLegacyModificationDateAtImport:", v75);

          }
          objc_msgSend(v12, "encryptedValues");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImportEncrypted"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            objc_msgSend(v77, "ic_stringValue");
            v78 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImport"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v79)
            {
LABEL_53:
              -[ICNote folder](self, "folder");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "unmarkForDeletionIncludingParentHierarchy");

              -[ICNote documentWithoutCreating](self, "documentWithoutCreating");
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              if (v82)
                -[ICNote regenerateTitle:snippet:](self, "regenerateTitle:snippet:", 1, 1);

              v13 = v94;
              v14 = v95;
LABEL_56:

              v53 = 1;
              goto LABEL_57;
            }
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImport"));
            v78 = objc_claimAutoreleasedReturnValue();
          }
          v80 = (void *)v78;
          -[ICNote setLegacyContentHashAtImport:](self, "setLegacyContentHashAtImport:", v78);

          goto LABEL_53;
        }
LABEL_9:
        -[ICNote setCreationDate:](self, "setCreationDate:", v19);
        goto LABEL_10;
      }

      v19 = v91;
    }

    v13 = v93;
    v14 = v95;
    goto LABEL_9;
  }
  -[ICNote deduplicateSelfAndCreateNewObjectFromRecord:](self, "deduplicateSelfAndCreateNewObjectFromRecord:", v12);
LABEL_31:
  v53 = 0;
LABEL_57:

  return v53;
}

- (void)mergeTextDataFromRecord:(id)a3 mergePolicy:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  ICTTMergeableStringVersionedDocument *v18;
  void *v19;
  ICTTMergeableStringVersionedDocument *v20;
  ICNote *v21;
  void *v22;
  void *v23;
  ICTTMergeableStringVersionedDocument *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  ICTTMergeableStringVersionedDocument *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ICTTMergeableAttributedString *v39;
  void *v40;
  ICTTMergeableAttributedString *v41;
  unint64_t v42;
  NSObject *v43;
  NSObject *v44;
  _BOOL4 v45;
  ICTTMergeableStringVersionedDocument *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  ICNote *v61;
  ICTTMergeableStringVersionedDocument *v62;
  _QWORD v63[5];
  ICTTMergeableStringVersionedDocument *v64;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextData"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextDeltaData"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!(v10 | v11))
  {
    v27 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.7(self);

    goto LABEL_29;
  }
  if (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud")
    && -[ICNote hasLoadedDocument](self, "hasLoadedDocument"))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.needsInitialFetchFromCloud || !self.hasLoadedDocument", "-[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:]", 1, 1, CFSTR("Note document was loaded before merging initial text data — this can lead to data loss, see rdar://97565017"));
  }
  -[ICNote noteData](self, "noteData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || -[ICNote hasLoadedDocument](self, "hasLoadedDocument"))
  {

    v14 = -[ICNote isPasswordProtected](self, "isPasswordProtected");
    if (v10 && v14)
    {
      if (-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
        v15 = -[ICNote mergeableString](self, "mergeableString");
      -[ICNote decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:](self, "decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:", v8);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = v16;
    }
    goto LABEL_12;
  }

  if (!v10)
  {
    -[ICNote isPasswordProtected](self, "isPasswordProtected");
LABEL_12:
    if (-[ICNote isPasswordProtected](self, "isPasswordProtected")
      && !-[ICCloudSyncingObject isAuthenticated](self, "isAuthenticated"))
    {
      goto LABEL_69;
    }
    -[ICNote document](self, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.1(v28);

      +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote folder](self, "folder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v29, "addNewNoteByCopyingNote:toFolder:", self, v30);

      v32 = [ICTTMergeableStringVersionedDocument alloc];
      -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[ICTTVersionedDocument initWithData:replicaID:](v32, "initWithData:replicaID:", v10, v33);

      -[ICNote replaceWithDocument:](self, "replaceWithDocument:", v24);
      objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 22);
LABEL_59:

      -[ICNote didChangeNoteText](self, "didChangeNoteText");
      -[ICCloudSyncingObject unappliedEncryptedRecord](self, "unappliedEncryptedRecord");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "recordHasChangedPassphrase:", v50);

        if (v52)
        {
          -[ICNote noteData](self, "noteData");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setNeedsToBeSaved:", 1);

        }
      }
      -[ICNote noteData](self, "noteData", v57, v58, v59, v60, v61);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "saveNoteDataIfNeeded"))
      {

      }
      else
      {
        -[ICNote noteData](self, "noteData");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "needsToBeSaved");

        if ((v56 & 1) != 0)
        {
LABEL_66:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[ICNote createMissingAttachmentsInTextStorage](self, "createMissingAttachmentsInTextStorage");
          -[ICNote writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, "writeCurrentTimestampToMergeableFieldStateIfNecessary:", v9);

          goto LABEL_69;
        }
      }
      -[ICCloudSyncingObject setUnappliedEncryptedRecord:](self, "setUnappliedEncryptedRecord:", 0);
      goto LABEL_66;
    }
    if (v10)
    {
      v18 = [ICTTMergeableStringVersionedDocument alloc];
      -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ICTTVersionedDocument initWithData:replicaID:](v18, "initWithData:replicaID:", v10, v19);

      v21 = self;
      if (a4 == 1 || (v21 = (ICNote *)v20, a4 == 2))
      {
        -[ICNote mergeableString](v21, "mergeableString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote mergeableString](v21, "mergeableString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deleteCharactersInRange:", 0, objc_msgSend(v23, "length"));

      }
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke;
      v63[3] = &unk_1E76C7B30;
      v63[4] = self;
      v24 = v20;
      v64 = v24;
      if (-[ICNote performMerge:](self, "performMerge:", v63))
        goto LABEL_57;
      v25 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.6(self);

      if (a4 == 1)
      {
        v26 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.3(self);

      }
      else
      {
        v44 = os_log_create("com.apple.notes", "Cloud");
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        if (a4 == 2)
        {
          if (v45)
            -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.4(self);

          goto LABEL_56;
        }
        if (v45)
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.5(self);

        +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote folder](self, "folder");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (id)objc_msgSend(v47, "addNewNoteByCopyingNote:toFolder:", self, v48);

        objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 7);
      }
      -[ICNote replaceWithDocument:](self, "replaceWithDocument:", v24);
LABEL_56:
      objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 18);
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:]", 1, 1, CFSTR("TopoText merge failure"));
LABEL_57:
      v46 = v64;
      goto LABEL_58;
    }
    if (v11)
    {
      v39 = [ICTTMergeableAttributedString alloc];
      -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[ICTTMergeableString initWithData:replicaID:fragment:](v39, "initWithData:replicaID:fragment:", v11, v40, 1);

      v57 = MEMORY[0x1E0C809B0];
      v58 = 3221225472;
      v59 = __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke_83;
      v60 = &unk_1E76C7B30;
      v61 = self;
      v24 = v41;
      v62 = v24;
      v42 = -[ICNote performMerge:](self, "performMerge:", &v57);
      if (v42 == 2)
      {
        v46 = v62;
LABEL_58:

        goto LABEL_59;
      }
      if (!v42)
      {
        v43 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.2(self);

        objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 19, v57, v58, v59, v60, v61);
      }

    }
LABEL_29:
    v10 = 0;
    goto LABEL_69;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoTag"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoTag"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setCryptoTag:](self, "setCryptoTag:", v35);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoInitializationVector"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CryptoInitializationVector"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setCryptoInitializationVector:](self, "setCryptoInitializationVector:", v37);

  }
  -[ICNote noteData](self, "noteData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setData:", v10);

  -[ICNote writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, "writeCurrentTimestampToMergeableFieldStateIfNecessary:", v9);
LABEL_69:

}

uint64_t __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mergeWithStringVersionedDocument:", *(_QWORD *)(a1 + 40));

  return v3;
}

uint64_t __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke_83(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "mergeableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mergeWithString:", *(_QWORD *)(a1 + 40));

  return v3;
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C95048], "ic_encryptedKeyForKeyPrefix:", CFSTR("TextData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote mergeableString](self, "mergeableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v4, "setObject:forKey:", v8, v5);
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICNote(CloudKit) writeCurrentTimestampToMergeableFieldStateIfNecessary:].cold.1(self);

    }
  }

}

- (id)folderReferenceFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Folder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Folders"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", v8) & 1) == 0)
      {
        v9 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[ICNote(CloudKit) folderReferenceFromRecord:].cold.2(self);

        v10 = v8;
        v5 = v10;
      }

    }
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICNote(CloudKit) folderReferenceFromRecord:].cold.1(self);

    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)mergeFoldersFromRecord:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[ICNote folderReferenceFromRecord:](self, "folderReferenceFromRecord:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FoldersModificationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (-[ICNote folderModificationDate](self, "folderModificationDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[ICNote folderModificationDate](self, "folderModificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "ic_isLaterThanDate:", v11);
  }
  else
  {
    -[ICNote folderModificationDate](self, "folderModificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;
  }

  v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote folderModificationDate](self, "folderModificationDate");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = CFSTR("N");
    *(_DWORD *)buf = 138413058;
    v44 = v23;
    if (v12)
      v26 = CFSTR("Y");
    v45 = 2112;
    v46 = v9;
    v47 = 2112;
    v48 = v24;
    v49 = 2112;
    v50 = v26;
    _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "%@: cloud folder modification date: %@, local folder modification date: %@, isCloudFoldersMoreRecentThanLocalFolders: %@", buf, 0x2Au);

  }
  -[ICNote folder](self, "folder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTrashFolder");

  if ((-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") | v12) == 1)
  {
    if (v8)
    {
      objc_msgSend(v8, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v6;
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote managedObjectContext](self, "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICFolder existingCloudObjectForRecordID:accountID:context:](ICFolder, "existingCloudObjectForRecordID:accountID:context:", v16, v17, v18);
      v19 = (os_log_t)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = os_log_create("com.apple.notes", "Cloud");
        v21 = v20;
        if (v42)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[ICNote(CloudKit) mergeFoldersFromRecord:account:].cold.3(v8, self, v21);

          objc_msgSend(v8, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "recordName");
          v21 = objc_claimAutoreleasedReturnValue();

          v19 = +[ICFolder newFolderWithIdentifier:account:](ICFolder, "newFolderWithIdentifier:account:", v21, v42);
          -[NSObject setNeedsInitialFetchFromCloud:](v19, "setNeedsInitialFetchFromCloud:", 1);
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "recordID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "recordName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v44 = v28;
            v45 = 2112;
            v46 = v29;
            v47 = 2112;
            v48 = (uint64_t)v30;
            v49 = 2112;
            v50 = v32;
            v51 = 2112;
            v52 = v33;
            _os_log_impl(&dword_1BD918000, v21, OS_LOG_TYPE_INFO, "Trying to set a %@ (%@) for %@, but we couldn't find the %@ due to a non-existent CloudKit account (%@). Folder will be nil.", buf, 0x34u);

          }
          v19 = 0;
        }

      }
      if (-[NSObject folderType](v19, "folderType") == 1)
        -[NSObject setMarkedForDeletion:](v19, "setMarkedForDeletion:", 0);
      -[ICNote setFolderModificationDate:](self, "setFolderModificationDate:", v9);
      -[ICNote setFolder:](self, "setFolder:", v19);
      v6 = v42;
    }
    else
    {
      v19 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ICNote(CloudKit) mergeFoldersFromRecord:account:].cold.2(self);

    }
  }
  if (-[ICNote markedForDeletion](self, "markedForDeletion"))
  {
    -[ICNote folder](self, "folder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isTrashFolder");

    if ((v35 & 1) == 0)
    {
      -[ICNote account](self, "account");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "trashFolder");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[ICNote(CloudKit) mergeFoldersFromRecord:account:].cold.1(self, (uint64_t)v37, v38);

      -[ICNote setFolder:](self, "setFolder:", v37);
      -[ICNote setFolderModificationDate:](self, "setFolderModificationDate:", v9);

    }
  }
  if ((v15 & 1) == 0)
  {
    -[ICNote folder](self, "folder");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isTrashFolder");

    if (v40)
      -[ICNote notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder](self, "notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder");
  }

}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)ICNote;
  v6 = a4;
  -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v56, sel_makeCloudKitRecordForApproach_mergeableFieldState_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote addNoteBodyToRecord:forApproach:mergeableFieldState:](self, "addNoteBodyToRecord:forApproach:mergeableFieldState:", v7, a3, v6, v56.receiver, v56.super_class);

  -[ICCloudSyncingObject modificationDate](self, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ModificationDate"));

  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("CreationDate"));

  if (!a3)
  {
    -[ICNote folder](self, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "zoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        v16 = objc_alloc(MEMORY[0x1E0C950C0]);
        v17 = (void *)objc_msgSend(v16, "initWithRecordID:action:", v11, *MEMORY[0x1E0C94A40]);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("Folder"));
        -[ICNote folderModificationDate](self, "folderModificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("FoldersModificationDate"));

        v57[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("Folders"));

      }
    }
    -[ICNote replicaIDToUserIDDictData](self, "replicaIDToUserIDDictData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[ICNote replicaIDToUserIDDictData](self, "replicaIDToUserIDDictData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encryptedValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("ReplicaIDToUserIDEncrypted"));

    }
    if (-[ICNote isPasswordProtected](self, "isPasswordProtected"))
    {
      -[ICNote cryptoInitializationVector](self, "cryptoInitializationVector");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("CryptoInitializationVector"));

      -[ICNote cryptoTag](self, "cryptoTag");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("CryptoTag"));

      -[ICNote cryptoWrappedKey](self, "cryptoWrappedKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("CryptoWrappedKey"));

    }
    -[ICNote title](self, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[ICNote title](self, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dataUsingEncoding:", 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encryptedValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("TitleEncrypted"));

    }
    -[ICNote snippet](self, "snippet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[ICNote snippet](self, "snippet");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dataUsingEncoding:", 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encryptedValues");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("SnippetEncrypted"));

    }
    -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("LegacyModificationDateAtImport"));

    }
    -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dataUsingEncoding:", 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encryptedValues");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("LegacyContentHashAtImportEncrypted"));

    }
    -[ICNote legacyImportDeviceIdentifier](self, "legacyImportDeviceIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[ICNote legacyImportDeviceIdentifier](self, "legacyImportDeviceIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, CFSTR("LegacyImportDeviceIdentifier"));

    }
    -[ICNote attachmentForWebThumbnail](self, "attachmentForWebThumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 2.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        objc_msgSend(v44, "previewImageURL");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v47, CFSTR("FirstAttachmentThumbnail"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v43, "orientation"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("FirstAttachmentThumbnailOrientation"));

        }
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("FirstAttachmentThumbnail"));
      }
      objc_msgSend(v43, "typeUTI");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v43, "typeUTI");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "dataUsingEncoding:", 4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, CFSTR("FirstAttachmentUTIEncrypted"));

      }
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("FirstAttachmentThumbnail"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("FirstAttachmentUTIEncrypted"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICNote attachmentViewType](self, "attachmentViewType"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v53, CFSTR("AttachmentViewType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICNote paperStyleType](self, "paperStyleType"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, CFSTR("PaperStyleType"));

  }
  return v7;
}

- (void)addNoteBodyToRecord:(id)a3 forApproach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;

  v8 = a3;
  v9 = a5;
  -[ICNote noteData](self, "noteData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "needsToBeSaved");

  if ((v11 & 1) == 0)
  {
    -[ICNote willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("data"));
    -[ICNote noteData](self, "noteData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsToBeSaved:", 1);

    -[ICNote didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("data"));
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C95048], "ic_encryptedKeyForKeyPrefix:", CFSTR("TextData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v9, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      +[ICTTMergeableString timestampFromData:](ICTTMergeableString, "timestampFromData:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[ICNote mergeableString](self, "mergeableString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "serializeDeltaSinceTimestamp:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "length"))
        {
          objc_msgSend(v8, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v19, CFSTR("TextDeltaData"), a4);
        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[ICNote(CloudKit) addNoteBodyToRecord:forApproach:mergeableFieldState:].cold.2(self);

        }
        goto LABEL_18;
      }
      v20 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ICNote(CloudKit) addNoteBodyToRecord:forApproach:mergeableFieldState:].cold.1(self);

    }
  }
  -[ICNote noteData](self, "noteData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v8, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v13, CFSTR("TextData"), a4);
LABEL_18:

  -[ICNote writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, "writeCurrentTimestampToMergeableFieldStateIfNecessary:", v9);
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote noteWithIdentifier:accountID:context:](ICNote, "noteWithIdentifier:accountID:context:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[ICNote newNoteWithoutIdentifierInAccount:](ICNote, "newNoteWithoutIdentifierInAccount:", v9);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModificationDate:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCreationDate:", v12);

  objc_msgSend(v8, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v14);

  objc_msgSend(v10, "setNeedsInitialFetchFromCloud:", 1);
  objc_msgSend(v10, "mergeCloudKitRecord:accountID:approach:", v8, v7, 0);

  objc_msgSend(v10, "setNeedsInitialFetchFromCloud:", 0);
  objc_msgSend(v10, "setServerRecord:", v8);
  objc_msgSend(v10, "setInCloud:", 1);
  objc_msgSend(v10, "clearChangeCountWithReason:", CFSTR("Created note"));
  objc_msgSend(v10, "updateParentReferenceIfNecessary");
  objc_msgSend(v8, "recordType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v15, "isEqualToString:", CFSTR("PasswordProtectedNote"));
  if ((_DWORD)v8)
    objc_msgSend(v10, "setIsPasswordProtected:", 1);

  return v10;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(a1, "newPlaceholderObjectForRecordName:account:", v8, v9);

  return v10;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ICNote;
  v10 = objc_msgSendSuper2(&v12, sel_newPlaceholderObjectForRecordName_accountID_context_, v7, v8, v9);

  objc_msgSend(v10, "setAccount:", v6);
  return v10;
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  return 1;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)ICNote;
  -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:](&v32, sel_makeUserSpecificCloudKitRecordForApproach_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote folder](self, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "ic_isOwnedByCurrentUser"))
  {
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ICNote identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEFAULT, "Creating user specific note record with no folder record ID: %@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  -[ICNote folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTrashFolder");

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICNote(CloudKit) makeUserSpecificCloudKitRecordForApproach:].cold.2(self);
LABEL_8:

    goto LABEL_9;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v7, 0);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("Folder"));
LABEL_9:

  -[ICCloudSyncingObject recordID](self, "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v12, 0);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Note"));
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[ICNote identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v14;
      _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "Creating user specific note record with no note record ID: %@", buf, 0xCu);

    }
  }

  -[ICNote lastViewedModificationDate](self, "lastViewedModificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICNote lastViewedModificationDate](self, "lastViewedModificationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("LastViewedModificationDate"));

  }
  -[ICNote lastViewedTimestampData](self, "lastViewedTimestampData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("LastViewedTimestamp"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote isPinned](self, "isPinned"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("IsPinned"));

  v19 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ICNote(CloudKit) makeUserSpecificCloudKitRecordForApproach:].cold.1(self, v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNote isSystemPaper](self, "isSystemPaper"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("IsSystemPaper"));

  -[ICNote hostApplicationIdentifier](self, "hostApplicationIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encryptedValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("HostApplicationIdentifierEncrypted"));

  -[ICNote lastActivitySummaryViewedDate](self, "lastActivitySummaryViewedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ICNote lastActivitySummaryViewedDate](self, "lastActivitySummaryViewedDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("LastActivitySummaryViewedDate"));

  }
  -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("LastActivityRecentUpdatesViewedDate"));

  }
  -[ICNote lastAttributionsViewedDate](self, "lastAttributionsViewedDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[ICNote lastAttributionsViewedDate](self, "lastAttributionsViewedDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("LastAttributionsViewedDate"));

  }
  -[ICNote outlineStateData](self, "outlineStateData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[ICNote outlineStateData](self, "outlineStateData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v30, CFSTR("OutlineState"), a3);

  }
  return v5;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  ICTTVectorMultiTimestamp *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  ICOutlineState *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)ICNote;
  LODWORD(v8) = -[ICCloudSyncingObject mergeDataFromUserSpecificRecord:accountID:](&v62, sel_mergeDataFromUserSpecificRecord_accountID_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Folder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && -[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
    {
      objc_msgSend(v9, "recordID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote managedObjectContext](self, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICFolder existingCloudObjectForRecordID:accountID:context:](ICFolder, "existingCloudObjectForRecordID:accountID:context:", v10, v7, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v9, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "recordName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote managedObjectContext](self, "managedObjectContext");
        v15 = v7;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[ICFolder newPlaceholderObjectForRecordName:accountID:context:](ICFolder, "newPlaceholderObjectForRecordName:accountID:context:", v14, v15, v16);

        v7 = v15;
      }
      v17 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote identifier](self, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v64 = v54;
        v65 = 2112;
        v66 = v7;
        v67 = 2112;
        v68 = v55;
        _os_log_debug_impl(&dword_1BD918000, v17, OS_LOG_TYPE_DEBUG, "Setting folder %@ in account %@ to note %@ from user specific record.", buf, 0x20u);

      }
      -[ICNote setFolder:](self, "setFolder:", v12);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LastViewedModificationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[ICNote lastViewedModificationDate](self, "lastViewedModificationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "ic_isEarlierThanDate:", v18);

      if (v20)
        -[ICNote setLastViewedModificationDate:](self, "setLastViewedModificationDate:", v18);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LastViewedTimestamp"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = -[ICTTVectorMultiTimestamp initWithData:andCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithData:andCapacity:", v21, 2);
      -[ICNote lastViewedTimestamp](self, "lastViewedTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23
        || (-[ICNote lastViewedTimestamp](self, "lastViewedTimestamp"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "compareTo:", v22),
            v24,
            (v25 & 1) != 0))
      {
        -[ICNote setLastViewedTimestamp:](self, "setLastViewedTimestamp:", v22);
      }

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IsPinned"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      -[ICNote setIsPinned:](self, "setIsPinned:", objc_msgSend(v26, "BOOLValue"));
    v58 = v27;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IsSystemPaper"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[ICNote(CloudKit) mergeDataFromUserSpecificRecord:accountID:].cold.1(self);

      -[ICNote setIsSystemPaper:](self, "setIsSystemPaper:", objc_msgSend(v28, "BOOLValue"));
    }
    v57 = v28;
    v59 = (void *)v21;
    v60 = (void *)v18;
    v61 = v9;
    objc_msgSend(v6, "encryptedValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("HostApplicationIdentifierEncrypted"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setHostApplicationIdentifier:](self, "setHostApplicationIdentifier:", v31);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LastActivitySummaryViewedDate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      -[ICNote lastActivitySummaryViewedDate](self, "lastActivitySummaryViewedDate");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33
        || (v34 = (void *)v33,
            -[ICNote lastActivitySummaryViewedDate](self, "lastActivitySummaryViewedDate"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = objc_msgSend(v32, "ic_isLaterThanDate:", v35),
            v35,
            v34,
            v36))
      {
        -[ICNote setLastActivitySummaryViewedDate:](self, "setLastActivitySummaryViewedDate:", v32);
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LastActivityRecentUpdatesViewedDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38
        || (v39 = (void *)v38,
            -[ICNote lastActivityRecentUpdatesViewedDate](self, "lastActivityRecentUpdatesViewedDate"),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            v41 = objc_msgSend(v37, "ic_isLaterThanDate:", v40),
            v40,
            v39,
            v41))
      {
        -[ICNote setLastActivityRecentUpdatesViewedDate:](self, "setLastActivityRecentUpdatesViewedDate:", v37);
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LastAttributionsViewedDate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      -[ICNote lastAttributionsViewedDate](self, "lastAttributionsViewedDate");
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43
        || (v44 = (void *)v43,
            -[ICNote lastAttributionsViewedDate](self, "lastAttributionsViewedDate"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            v46 = objc_msgSend(v42, "ic_isLaterThanDate:", v45),
            v45,
            v44,
            v46))
      {
        -[ICNote setLastAttributionsViewedDate:](self, "setLastAttributionsViewedDate:", v42);
      }
    }
    objc_msgSend(v6, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("OutlineState"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v56 = v8;
      v8 = (_BOOL8)v7;
      v48 = -[ICOutlineState initWithData:]([ICOutlineState alloc], "initWithData:", v47);
      -[ICNote outlineState](self, "outlineState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "mergeWithState:", v48);

      if (v50)
      {
        -[ICNote outlineState](self, "outlineState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "data");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote setOutlineStateData:](self, "setOutlineStateData:", v52);

      }
      v7 = (id)v8;
      LOBYTE(v8) = v56;
    }

  }
  return v8;
}

- (BOOL)isInICloudAccount
{
  ICNote *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ICNote_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __37__ICNote_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "folder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInICloudAccount");

}

- (void)fixBrokenReferences
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  _UNKNOWN **v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _UNKNOWN **v32;
  const char *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  uint64_t v56;
  ICNote *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v67 = v4;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for %@", buf, 0xCu);

  }
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote folder](self, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v6;
    v68 = 2112;
    v69 = v8;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Folder for %@: %@", buf, 0x16u);

  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[ICNote attachments](self, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  v57 = self;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v15 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "loggingDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = v16;
          v68 = 2112;
          v69 = v17;
          _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "Attachment for %@: %@", buf, 0x16u);

          self = v57;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v11);
  }

  if (-[ICNote markedForDeletion](self, "markedForDeletion"))
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[ICNote attachments](self, "attachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v59;
      v23 = "com.apple.notes";
      v24 = "Cloud";
      *(_QWORD *)&v20 = 138412546;
      v55 = v20;
      v25 = &off_1E76C5000;
      do
      {
        v26 = 0;
        v56 = v21;
        do
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(v18);
          v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v26);
          if ((objc_msgSend(v27, "markedForDeletion", v55) & 1) == 0)
          {
            v28 = os_log_create(v23, v24);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              -[ICNote identifier](self, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v30 = v22;
              v31 = v18;
              v32 = v25;
              v33 = v24;
              v34 = v23;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v55;
              v67 = v29;
              v68 = 2112;
              v69 = v35;
              _os_log_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEFAULT, "Found a deleted note (%@) with an undeleted attachment (%@)", buf, 0x16u);

              v23 = v34;
              v24 = v33;
              v25 = v32;
              v18 = v31;
              v22 = v30;
              v21 = v56;

              self = v57;
            }

            objc_msgSend(v25[309], "deleteAttachment:", v27);
          }
          ++v26;
        }
        while (v21 != v26);
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v21);
    }

  }
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud"))
  {
    if (-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser")
      || (-[ICNote markedForDeletion](self, "markedForDeletion") & 1) == 0)
    {
      if (!-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
        goto LABEL_36;
      -[ICCloudSyncingObject serverShare](self, "serverShare");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {

      }
      else
      {
        -[ICCloudSyncingObject serverRecord](self, "serverRecord");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "share");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          goto LABEL_36;
      }
      -[ICCloudSyncingObject setServerShare:](self, "setServerShare:", 0);
    }
    -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
  }
LABEL_36:
  -[ICNote folder](self, "folder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "markedForDeletion");

  if (v40)
  {
    -[ICNote folder](self, "folder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "unmarkForDeletion");

  }
  -[ICNote folder](self, "folder");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "needsInitialFetchFromCloud");

  if (v43)
  {
    v44 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      -[ICNote identifier](self, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote account](self, "account");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNote account](self, "account");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "trashFolder");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = v45;
      v68 = 2112;
      v69 = v47;
      v70 = 2112;
      v71 = v50;
      _os_log_impl(&dword_1BD918000, v44, OS_LOG_TYPE_DEFAULT, "Moving note %@ in account %@ to trash folder %@ since folder doesn't exist on server.", buf, 0x20u);

    }
    -[ICNote account](self, "account");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "trashFolder");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setFolder:](self, "setFolder:", v52);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNote setFolderModificationDate:](self, "setFolderModificationDate:", v53);

    -[ICNote updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));
  }
  else
  {
    -[ICNote folder](self, "folder");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));

  }
}

- (BOOL)hasAllMandatoryFields
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  if (!-[ICCloudSyncingObject hasAllMandatoryFields](&v8, sel_hasAllMandatoryFields))
    return 0;
  -[ICNote noteData](self, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICNote folder](self, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("account"));
}

- (BOOL)needsToBeDeletedFromCloud
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[ICNote isSharedViaICloudFolder](self, "isSharedViaICloudFolder"))
  {
    if (!-[ICCloudSyncingObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
    {
      if (-[ICCloudSyncingObject isInCloud](self, "isInCloud"))
      {
        if (-[ICNote markedForDeletion](self, "markedForDeletion"))
        {
          -[ICNote folder](self, "folder");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v3, "markedForDeletion");

          if ((v4 & 1) != 0)
            return 1;
        }
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  return -[ICCloudSyncingObject needsToBeDeletedFromCloud](&v6, sel_needsToBeDeletedFromCloud);
}

- (id)objectsToBeDeletedBeforeThisObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICNote;
  -[ICCloudSyncingObject objectsToBeDeletedBeforeThisObject](&v9, sel_objectsToBeDeletedBeforeThisObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICNote attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)deleteFromLocalDatabase
{
  +[ICNote purgeNote:](ICNote, "purgeNote:", self);
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (int64_t)mergePolicyForRecord:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  int v48;
  const char *v49;
  void *v50;
  _BOOL4 v51;
  const char *v52;
  void *v53;
  int v54;
  _BOOL4 v55;
  int v57;
  char v58;
  NSObject *v59;
  void *v60;
  int v61;
  uint64_t v62;
  char v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LegacyModificationDateAtImport"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
    v7 = objc_claimAutoreleasedReturnValue();

    if ((v6 != 0) != (v7 != 0))
    {
      v8 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v62 = v6;
        -[ICCloudSyncingObject recordID](self, "recordID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "recordName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encryptedValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImportEncrypted"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ic_stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImport"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v65 = v11;
        v66 = 2112;
        v67 = v12;
        v68 = 2112;
        v69 = v16;
        v70 = 2112;
        v71 = v17;
        v72 = 2112;
        v73 = v62;
        _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Duplicating a note received from the cloud because they're not both legacy notes: (%@)\n\tlegacyContentHashAtImport:\t\t%@\n\totherLegacyContentHashAtImport:\t%@\n\tlegacyModificationDateAtImport:\t%@\n\totherLegacyModificationDateAtImport:\t%@", buf, 0x34u);

        if (!v15)
        v5 = 3;
        v18 = v9;
        v6 = v62;
        v8 = v9;
        goto LABEL_66;
      }
      v5 = 3;
      goto LABEL_33;
    }
    -[ICCloudSyncingObject serverRecord](self, "serverRecord");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = v6 | v7;
      objc_msgSend(v4, "creationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject serverRecord](self, "serverRecord");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "creationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "isEqualToDate:", v24);

      if (v21)
      {
        v26 = v25 ^ 1;
LABEL_16:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LegacyImportDeviceIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote legacyImportDeviceIdentifier](self, "legacyImportDeviceIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v18);

        if (v28)
        {
          if (!v26)
          {
            v5 = 0;
LABEL_67:

            goto LABEL_68;
          }
          v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            -[ICNote identifier](self, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v30;
            _os_log_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEFAULT, "Found a legacy note (%@) in the cloud with a record whose creation date is not equal to our own cached version. Replacing our own version with the one in the cloud.", buf, 0xCu);

          }
          v5 = 1;
          v8 = v29;
          goto LABEL_65;
        }
        objc_msgSend(v4, "encryptedValues");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImportEncrypted"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "ic_stringValue");
        v33 = objc_claimAutoreleasedReturnValue();

        v60 = v18;
        if (v33)
          goto LABEL_24;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImport"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
          v63 = 0;
          v33 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LegacyContentHashAtImport"));
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
LABEL_24:
          -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v34, "isEqualToString:", v33);

        }
        else
        {
          v63 = 0;
        }
LABEL_25:
        -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v35, "isEqualToDate:", v6);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModificationDate"));
        v59 = objc_claimAutoreleasedReturnValue();
        v61 = -[NSObject isEqualToDate:](v59, "isEqualToDate:", v6);
        -[ICCloudSyncingObject modificationDate](self, "modificationDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v36, "isEqualToDate:", v37);

        v38 = (void *)MEMORY[0x1E0CB3940];
        -[ICCloudSyncingObject recordID](self, "recordID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "recordName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote legacyContentHashAtImport](self, "legacyContentHashAtImport");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("(%@)\n\tlegacyContentHashAtImport:\t\t%@\n\totherLegacyContentHashAtImport:\t%@\n\tlegacyModificationDateAtImport:\t%@\n\totherLegacyModificationDateAtImport:\t%@"), v40, v41, v33, v42, v6);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v63 & 1) != 0 || (v58 & 1) != 0)
        {
          v48 = v61 ^ 1;
          if (((v57 ^ 1) & 1) == 0 && (v48 & 1) == 0)
          {
            v47 = os_log_create("com.apple.notes", "Cloud");
            v18 = v60;
            v8 = v33;
            v29 = v59;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v43;
              v49 = "Replacing note content from cloud and no device has modified it: %@";
LABEL_53:
              _os_log_impl(&dword_1BD918000, v47, OS_LOG_TYPE_DEFAULT, v49, buf, 0xCu);
            }
LABEL_54:
            v5 = 1;
LABEL_64:

LABEL_65:
            goto LABEL_66;
          }
          v18 = v60;
          v8 = v33;
          v29 = v59;
          if (((v61 | v57 ^ 1) & 1) == 0)
          {
            v47 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v43;
              v49 = "Replacing note content from cloud and the other device has modified it: %@";
              goto LABEL_53;
            }
            goto LABEL_54;
          }
          if (((v57 | v48) & 1) != 0)
          {
            v47 = os_log_create("com.apple.notes", "Cloud");
            v51 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
            if (((v61 | v57) & 1) != 0)
            {
              if (v51)
              {
                *(_DWORD *)buf = 138412290;
                v65 = v43;
                v52 = "Duplicating a note received from the cloud because we failed to make a decision: %@";
LABEL_62:
                _os_log_impl(&dword_1BD918000, v47, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
                goto LABEL_63;
              }
            }
            else if (v51)
            {
              *(_DWORD *)buf = 138412290;
              v65 = v43;
              v52 = "Duplicating a note received from the cloud because both devices modified the note since import: %@";
              goto LABEL_62;
            }
            v5 = 3;
            goto LABEL_64;
          }
          v47 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v43;
            v52 = "Duplicating a note received from the cloud because this device modified the note since import: %@";
            goto LABEL_62;
          }
        }
        else
        {
          v44 = v43;
          -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "ic_isLaterThanDate:", v6) & v61;

          if (v46 == 1)
          {
            v47 = os_log_create("com.apple.notes", "Cloud");
            v18 = v60;
            v8 = v33;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v44;
              v65 = v44;
              _os_log_impl(&dword_1BD918000, v47, OS_LOG_TYPE_DEFAULT, "Fetched legacy note imported from an earlier legacy version than ours: %@", buf, 0xCu);
              v5 = 2;
              v29 = v59;
            }
            else
            {
              v5 = 2;
              v29 = v59;
              v43 = v44;
            }
            goto LABEL_64;
          }
          -[ICNote legacyModificationDateAtImport](self, "legacyModificationDateAtImport");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "ic_isEarlierThanDate:", v6) & v57;

          v47 = os_log_create("com.apple.notes", "Cloud");
          v55 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
          v18 = v60;
          v8 = v33;
          if (v54 == 1)
          {
            v29 = v59;
            v43 = v44;
            if (v55)
            {
              *(_DWORD *)buf = 138412290;
              v65 = v44;
              v49 = "Fetched legacy note imported from a later legacy version than ours: %@";
              goto LABEL_53;
            }
            goto LABEL_54;
          }
          v29 = v59;
          v43 = v44;
          if (v55)
          {
            *(_DWORD *)buf = 138412290;
            v65 = v44;
            v52 = "Duplicating a note received from the cloud because both devices didn't import the same legacy version: %@";
            goto LABEL_62;
          }
        }
LABEL_63:
        v5 = 3;
        goto LABEL_64;
      }
      if ((v25 & 1) == 0)
      {
        v8 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[ICNote(CloudKit) mergePolicyForRecord:].cold.1(self);
        v5 = 0;
LABEL_33:
        v18 = v8;
LABEL_66:

        goto LABEL_67;
      }
    }
    else if (v6 | v7)
    {
      v26 = 0;
      goto LABEL_16;
    }
    v5 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v5 = 0;
LABEL_69:

  return v5;
}

- (void)deduplicateSelfAndCreateNewObjectFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNote identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote setIdentifier:](self, "setIdentifier:", v7);

  -[ICNote setLegacyContentHashAtImport:](self, "setLegacyContentHashAtImport:", 0);
  -[ICNote setLegacyImportDeviceIdentifier:](self, "setLegacyImportDeviceIdentifier:", 0);
  -[ICNote setLegacyModificationDateAtImport:](self, "setLegacyModificationDateAtImport:", 0);
  -[ICCloudSyncingObject setInCloud:](self, "setInCloud:", 0);
  -[ICCloudSyncingObject clearServerRecords](self, "clearServerRecords");
  -[ICCloudSyncingObject unsafelyUpdateChangeCountWithReason:](self, "unsafelyUpdateChangeCountWithReason:", CFSTR("De-duplicated from record"));
  -[ICNote account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "newCloudObjectForRecord:accountID:context:", v4, v9, v11);

  v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[ICNote identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "De-duplicated note (%@) to new identifier (%@)", (uint8_t *)&v15, 0x16u);

  }
}

- (id)attachmentForWebThumbnail
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__35;
  v12 = __Block_byref_object_dispose__35;
  v13 = 0;
  -[ICNote attributedString](self, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ICNote_CloudKit__attachmentForWebThumbnail__block_invoke;
  v7[3] = &unk_1E76C7E58;
  v7[4] = &v8;
  objc_msgSend(v3, "ic_enumerateAttachmentsInContext:usingBlock:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __45__ICNote_CloudKit__attachmentForWebThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "attachmentModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showThumbnailInNoteList");

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }

}

+ (BOOL)didShowExceededStorageQuotaAlertForNoteWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", CFSTR("ICDidShowExceededStorageQuotaAlertForNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v4);
  return (char)v5;
}

+ (void)setDidShowExceededStorageQuotaAlert:(BOOL)a3 forNoteWithIdentifier:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", CFSTR("ICDidShowExceededStorageQuotaAlertForNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = objc_msgSend(v10, "containsObject:", v14);
  if (v4)
  {
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v14);
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("ICDidShowExceededStorageQuotaAlertForNote"));

    }
  }
  else if (v11)
  {
    objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(v10, "indexOfObject:", v14));
    goto LABEL_9;
  }

}

- (BOOL)isSearchIndexableNote
{
  return 1;
}

- (BOOL)isModernNote
{
  return 1;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 1;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Modern");
}

- (unint64_t)searchResultType
{
  return 0;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 1;
}

- (NSString)folderManagedIdentifier
{
  void *v2;
  void *v3;

  -[ICNote folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)folderNameForNoteList
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[ICNote folderName](self, "folderName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNote isSharedViaICloudFolder](self, "isSharedViaICloudFolder")
    && -[ICNote isDeletedOrInTrash](self, "isDeletedOrInTrash"))
  {
    -[ICNote folder](self, "folder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootSharingFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSString *)v3;
}

- (NSString)accountName
{
  void *v2;
  void *v3;
  void *v4;

  -[ICNote folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)trimmedTitle
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[ICNote title](self, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &stru_1E76DB108;
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

- (BOOL)isHiddenFromIndexing
{
  BOOL v3;
  void *v5;
  void *v6;

  if ((-[ICNote isDeleted](self, "isDeleted") & 1) != 0
    || (-[ICNote markedForDeletion](self, "markedForDeletion") & 1) != 0
    || -[ICCloudSyncingObject isUnsupported](self, "isUnsupported")
    || (-[ICNote needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
  {
    return 1;
  }
  -[ICNote folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 == 0;

  return v3;
}

- (NSArray)authorsExcludingCurrentUser
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isCurrentUser") & 1) == 0)
        {
          objc_msgSend(v10, "userIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "nameComponents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)searchableString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[ICNote uiAttributedString](self, "uiAttributedString"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[ICNote attributedString](self, "attributedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = objc_alloc_init(MEMORY[0x1E0CB3498]);
    v3 = v6;

  }
  -[ICNote managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_searchableStringInContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)noteCellKeyPaths
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("snippet"), CFSTR("modificationDate"), CFSTR("noteHasChanges"), CFSTR("isSharedViaICloud"), CFSTR("hasUnreadChanges"), CFSTR("folder"), CFSTR("serverShareData"), CFSTR("preferredBackgroundType"), CFSTR("isPinned"), CFSTR("attachmentViewType"), 0);
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICNote objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  void *v2;
  void *v3;

  -[ICNote account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentCreationDate:", v4);

  -[ICCloudSyncingObject modificationDate](self, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentModificationDate:", v5);

  -[ICNote title](self, "title");
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
  ICNote *v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __CFString *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  ICNote *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _QWORD v96[9];

  v96[7] = *MEMORY[0x1E0C80C00];
  -[ICNote userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataOwnerType:", &unk_1E771A840);
  v96[0] = CFSTR("com.apple.notes.richtext");
  objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v4;
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v5;
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v6;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v7;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v8;
  v96[6] = CFSTR("com.apple.notes.noteitemprovider");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProviderDataTypes:", v9);

  v10 = self;
  v11 = -[ICNote isPasswordProtected](self, "isPasswordProtected");
  v12 = 0x1E0C99000;
  v72 = v3;
  v73 = self;
  if ((v11 & 1) == 0)
  {
    -[ICNote searchableString](self, "searchableString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy");

    v16 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D64238], "titleForContent:truncated:", v15, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64238], "stringByRemovingTitle:fromString:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64238], "snippetForContent:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v69 = (void *)v18;
    objc_msgSend(v3, "setContentDescription:", v18);
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    -[ICNote attachments](v10, "attachments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v89 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "attachmentModel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "additionalIndexableTextContentInNote");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            objc_msgSend(v16, "appendString:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      }
      while (v21);
    }

    v71 = v16;
    objc_msgSend(v3, "setTextContent:", v16);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    -[ICNote attachments](v10, "attachments");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v85 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
          objc_msgSend(v32, "typeUTI");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = (void *)MEMORY[0x1E0CEC3F8];
            objc_msgSend(v32, "typeUTI");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "typeWithIdentifier:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "supertypes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "ic_map:", &__block_literal_global_71);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "unionSet:", v38);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "allObjects");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setAttachmentTypes:", v39);

    }
    v10 = v73;
    v12 = 0x1E0C99000uLL;
  }
  v40 = objc_alloc_init(*(Class *)(v12 + 3616));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[ICNote visibleInlineAttachments](v10, "visibleInlineAttachments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v81 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
        if (objc_msgSend(v46, "attachmentType") == 1)
        {
          objc_msgSend(v46, "displayText");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "ic_hashtagDisplayText");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICNote folder](v73, "folder");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "account");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICHashtag hashtagWithDisplayText:account:createIfNecessary:](ICHashtag, "hashtagWithDisplayText:account:createIfNecessary:", v48, v50, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
            objc_msgSend(v40, "ic_addNonNilObject:", v48);

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v40, "allObjects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setHashtags:", v52);

  }
  -[ICNote addShareParticipantsToAttributeSet:](v73, "addShareParticipantsToAttributeSet:", v72);
  -[ICCloudSyncingObject addEmailAddressesAndPhoneNumbersToAttributeSet:](v73, "addEmailAddressesAndPhoneNumbersToAttributeSet:", v72);
  objc_msgSend(v72, "setIc_searchResultType:", 0);
  objc_msgSend(v72, "ic_populateValuesForSpecializedFields");
  objc_msgSend(v72, "setIc_isLocked:", -[ICNote isPasswordProtected](v73, "isPasswordProtected"));
  objc_msgSend(v72, "setIc_isShared:", -[ICCloudSyncingObject isSharedViaICloud](v73, "isSharedViaICloud"));
  if (-[ICNote isPasswordProtected](v73, "isPasswordProtected"))
  {
    objc_msgSend(v72, "setIc_hasChecklists:", 0);
    objc_msgSend(v72, "setIc_hasTags:", 0);
    objc_msgSend(v72, "setIc_hasDrawings:", 0);
    objc_msgSend(v72, "setIc_hasScannedDocuments:", 0);
    objc_msgSend(v72, "setIc_hasAttachments:", 0);
  }
  else
  {
    -[ICNote attributedString](v73, "attributedString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "length");

    -[ICNote attributedString](v73, "attributedString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = ICTTAttributeNameParagraphStyle;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke_2;
    v78[3] = &unk_1E76CBF20;
    v57 = v72;
    v79 = v57;
    objc_msgSend(v55, "enumerateAttribute:inRange:options:usingBlock:", v56, 0, v54, 0, v78);

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[ICNote visibleAttachments](v73, "visibleAttachments");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v75;
LABEL_40:
      v62 = 0;
      while (1)
      {
        if (*(_QWORD *)v75 != v61)
          objc_enumerationMutation(v58);
        v63 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v62);
        if (objc_msgSend(v63, "attachmentType") == 10
          || objc_msgSend(v63, "attachmentType") == 9
          || objc_msgSend(v63, "attachmentType") == 13)
        {
          objc_msgSend(v57, "setIc_hasDrawings:", 1);
        }
        else
        {
          if (objc_msgSend(v63, "attachmentType") != 12
            && objc_msgSend(v63, "attachmentType")
            && objc_msgSend(v63, "attachmentType") != 1)
          {
            objc_msgSend(v57, "setIc_hasAttachments:", 1);
          }
          if (objc_msgSend(v63, "attachmentType") == 11
            || objc_msgSend(v63, "attachmentType") == 15)
          {
            objc_msgSend(v57, "setIc_hasScannedDocuments:", 1);
          }
        }
        if (objc_msgSend(v57, "ic_hasDrawings") && (objc_msgSend(v57, "ic_hasScannedDocuments") & 1) != 0)
          break;
        if (v60 == ++v62)
        {
          v64 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
          v60 = v64;
          if (v64)
            goto LABEL_40;
          break;
        }
      }
    }

    objc_msgSend(v57, "setIc_hasTags:", -[ICNote hasTags](v73, "hasTags"));
  }
  -[ICNote accountName](v73, "accountName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setIc_accountName:", v65);

  -[ICNote folderNameForNoteList](v73, "folderNameForNoteList");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setIc_folderName:", v66);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNote searchableItemViewAttributeSet](v73, "searchableItemViewAttributeSet");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addAttributesFromAttributeSet:", v67);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNote associateAppEntityWithSearchableItemAttributeSet:](v73, "associateAppEntityWithSearchableItemAttributeSet:", v72);

  return (CSSearchableItemAttributeSet *)v72;
}

uint64_t __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  id v8;

  v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "style") == 103)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIc_hasChecklists:", 1);
    *a5 = 1;
  }

}

- (void)addShareParticipantsToAttributeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudSyncingObject serverShareCheckingParent](self, "serverShareCheckingParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ICNote authorsExcludingCurrentUser](self, "authorsExcludingCurrentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      v11 = MEMORY[0x1E0C9AA60];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "ic_localizedNameWithDefaultFormattingStyle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B10]), "initWithDisplayName:handles:handleIdentifier:", v13, v11, &stru_1E76DB108);
            objc_msgSend(v6, "addObject:", v14);

          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v4 = v15;
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v15, "setAuthors:", v6);

  }
}

- (BOOL)hasTags
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICNote visibleInlineAttachments](self, "visibleInlineAttachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "isHashtagAttachment") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)additionalSearchIndexablesForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("needsInitialFetchFromCloud"), CFSTR("markedForDeletion"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "intersectsSet:", v6);

  if (v7)
  {
    -[ICNote attachments](self, "attachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v5, "ic_addObjectsFromNonNilArray:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("folder"), CFSTR("isSystemPaper"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "intersectsSet:", v10);

  if (v11)
  {
    -[ICNote attachments](self, "attachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_objectsPassingTest:", &__block_literal_global_53_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "unionSet:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unionSet:", v14);

    }
  }

  return v5;
}

uint64_t __72__ICNote_SearchIndexableNote__additionalSearchIndexablesForChangedKeys___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSynapseLink");
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4;
  ICNote *v5;

  v4 = a3;
  v5 = self;
  ICNote.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);

}

- (BOOL)objc_hasRecentExternalEdits
{
  ICNote *v2;
  _QWORD *v3;
  ICNote *v4;
  uint64_t v5;
  ICNote *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = self;
  v3 = ICCloudSyncingObject.editActivityEvents.getter();
  v4 = v2;
  v5 = sub_1BDB34138((uint64_t)v3, v4);
  swift_bridgeObjectRelease();

  v6 = v4;
  v7 = sub_1BDB344B4(v5, v6);
  swift_bridgeObjectRelease();

  v8 = *(_QWORD *)(v7 + 16);
  swift_bridgeObjectRelease();
  return v8 != 0;
}

- (void)didRefresh:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Unable to fault %@ after being refreshed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)didRefresh:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Faulted %@ after being refreshed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)didRefresh:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Failed to manually fetch note data after refreshing %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)updateLastViewedTimestampWithCurrentTimestamp
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Need to save last viewed timestamp on next save for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)attachmentExceedsMaxSizeAllowed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_17();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v5, "Attachment size (%@) is greater then our max (%@)", v6);

  OUTLINED_FUNCTION_2();
}

- (void)attachmentExceedsMaxSizeAllowed:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Adding a 0 byte attachment.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)visibleTopLevelAttachmentsCount
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error fetching count of visible top level attachments via fetch request. Falling back to fetch attachment objects for count (%lu)", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)rangeForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1BD918000, a3, (uint64_t)a3, "Cannot find attachment range because note is placeholder: %@", (uint8_t *)a2);

}

- (void)rangeForAttachment:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_6_0();
  *(_DWORD *)v2 = 138412546;
  *(_QWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(_QWORD *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Attachment not found in note %@, %@", v5, 0x16u);

}

- (void)saveNoteData
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "hash");
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Saving note data for %@: %lu", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)setHostApplicationIdentifier:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Setting host application identifier for note… {note: %@, identifier: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __35__ICNote_markActivitySummaryViewed__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking activity summary viewed for note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __35__ICNote_markActivitySummaryViewed__block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Tried marking activity summary viewed for unshared note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Marking last activity recent updates viewed for note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Tried marking last activity recent updates viewed for unshared note: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)widgetSnippetByEnumeratingAttachments
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Found a non-empty snippet on a locked note {note: %@}", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)regenerateTitle:(void *)a1 snippet:isNewNote:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Skipping title and snippet regeneration because this note is a placeholder or contains placeholder block/inline attachments: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setFolder:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138413058;
  v15 = v6;
  OUTLINED_FUNCTION_16_0();
  v16 = v8;
  v17 = v12;
  v18 = v9;
  v19 = v12;
  v20 = v13;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Setting folder (%@) account (%@) to note (%@) with previous account (%@)", (uint8_t *)&v14, 0x2Au);

}

- (void)setFolder:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v4;
  OUTLINED_FUNCTION_16_0();
  v12 = v6;
  v13 = v8;
  v14 = v9;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Setting nil folder on note (%@) with account (%@): %@", (uint8_t *)&v10, 0x20u);

}

- (void)setFolder:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isDeleted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 134219522;
  v15 = a1;
  OUTLINED_FUNCTION_16_0();
  v16 = v6;
  v17 = 2048;
  v18 = a2;
  v19 = v12;
  v20 = v7;
  v21 = 2048;
  v22 = v8;
  v23 = v12;
  v24 = v10;
  v25 = v12;
  v26 = v13;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Setting folder[%p] (%@) on note[%p] (%@) with current folder[%p] (%@), isDeleted = %@", (uint8_t *)&v14, 0x48u);

}

- (void)updateDeviceReplicaIDsToUserIDIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Object needs initial fetch — not updating replica ID to user ID {objectID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Note didn't have an identifier at this point, probably becuase it's already deleted. Not returning a paperCoherenceContextURL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Note didn't have an account at this point, probably becuase it's already deleted. Not returning a paperCoherenceContextURL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Failed to update location for Synapse link. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Finished adding media in background for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1019_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Adding media in background for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1021_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Save happened for adding media in background for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

@end
