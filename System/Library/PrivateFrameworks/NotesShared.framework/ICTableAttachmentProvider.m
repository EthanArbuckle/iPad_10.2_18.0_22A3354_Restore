@implementation ICTableAttachmentProvider

+ (NSMapTable)providerMapping
{
  if (providerMapping_onceToken != -1)
    dispatch_once(&providerMapping_onceToken, &__block_literal_global);
  return (NSMapTable *)(id)providerMapping_providerMapping;
}

void __44__ICTableAttachmentProvider_providerMapping__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)providerMapping_providerMapping;
  providerMapping_providerMapping = v0;

}

+ (NSMapTable)mergeNotificationRegister
{
  if (mergeNotificationRegister_onceToken != -1)
    dispatch_once(&mergeNotificationRegister_onceToken, &__block_literal_global_10);
  return (NSMapTable *)(id)mergeNotificationRegister_mergeNotificationRegisterMapping;
}

void __54__ICTableAttachmentProvider_mergeNotificationRegister__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mergeNotificationRegister_mergeNotificationRegisterMapping;
  mergeNotificationRegister_mergeNotificationRegisterMapping = v0;

}

+ (id)sharedProviderForAttachment:(id)a3
{
  id v3;
  void *v4;
  ICTableAttachmentProvider *v5;
  void *v6;

  v3 = a3;
  +[ICTableAttachmentProvider providerMapping](ICTableAttachmentProvider, "providerMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (ICTableAttachmentProvider *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(ICTableAttachmentProvider);
    -[ICTableAttachmentProvider setAttachment:](v5, "setAttachment:", v3);
    +[ICTableAttachmentProvider providerMapping](ICTableAttachmentProvider, "providerMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v3);

  }
  return v5;
}

+ (void)notifyProviderForRefreshToAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  +[ICTableAttachmentProvider providerMapping](ICTableAttachmentProvider, "providerMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "backgroundAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __66__ICTableAttachmentProvider_notifyProviderForRefreshToAttachment___block_invoke;
    v15 = &unk_1E76C73B0;
    v16 = v6;
    v17 = v7;
    v8 = v7;
    v9 = v6;
    objc_msgSend(v8, "performBlock:", &v12);

  }
  +[ICTableAttachmentProvider mergeNotificationRegister](ICTableAttachmentProvider, "mergeNotificationRegister", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "didRefreshBackgroundTableAttachment:", v3);

}

uint64_t __66__ICTableAttachmentProvider_notifyProviderForRefreshToAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "hasChanges");
  else
    v2 = 1;
  return objc_msgSend(*(id *)(a1 + 40), "ic_refreshObject:mergeChanges:", *(_QWORD *)(a1 + 32), v2);
}

+ (void)saveAttachmentOnMainThread:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[ICTableAttachmentProvider providerMapping](ICTableAttachmentProvider, "providerMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableAttachmentSaveOnMainThread");

}

- (void)setOverriddenBackgroundMOC:(id)a3
{
  objc_storeWeak((id *)&self->_overriddenBackgroundMOC, a3);
  -[ICTableAttachmentProvider refreshBackgroundAttachment](self, "refreshBackgroundAttachment");
}

- (id)backgroundManagedObjectContext
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_overriddenBackgroundMOC);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    +[ICTableAttachmentProvider defaultBackgroundManagedObjectContext](ICTableAttachmentProvider, "defaultBackgroundManagedObjectContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)defaultBackgroundManagedObjectContext
{
  if (defaultBackgroundManagedObjectContext_once != -1)
    dispatch_once(&defaultBackgroundManagedObjectContext_once, &__block_literal_global_12);
  return (id)defaultBackgroundManagedObjectContext_backgroundContext;
}

void __66__ICTableAttachmentProvider_defaultBackgroundManagedObjectContext__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workerManagedObjectContext");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultBackgroundManagedObjectContext_backgroundContext;
  defaultBackgroundManagedObjectContext_backgroundContext = v0;

}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_attachment, v5);
  objc_msgSend(v5, "ic_obtainPermanentObjectIDIfNecessary");
  if (objc_msgSend(v5, "hasChanges"))
  {
    objc_msgSend(v5, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_save");

  }
  -[ICTableAttachmentProvider refreshBackgroundAttachment](self, "refreshBackgroundAttachment");

}

- (void)refreshBackgroundAttachment
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[ICTableAttachmentProvider backgroundManagedObjectContext](self, "backgroundManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ICTableAttachmentProvider_refreshBackgroundAttachment__block_invoke;
  v5[3] = &unk_1E76C73B0;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __56__ICTableAttachmentProvider_refreshBackgroundAttachment__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment ic_existingObjectWithID:context:](ICAttachment, "ic_existingObjectWithID:context:", v3, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[ICTableAttachmentProvider mergeNotificationRegister](ICTableAttachmentProvider, "mergeNotificationRegister");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), v5);

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundAttachment:", v5);
}

- (void)setTableFromDocument:(id)a3
{
  ICTable *v5;
  ICTable *table;
  id v7;

  objc_storeStrong((id *)&self->_tableDoc, a3);
  v7 = a3;
  objc_msgSend(v7, "rootObject");
  v5 = (ICTable *)objc_claimAutoreleasedReturnValue();
  table = self->_table;
  self->_table = v5;

}

- (ICTable)table
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  if (!self->_table)
  {
    -[ICTableAttachmentProvider attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPasswordProtectedAndLocked");

    if ((v4 & 1) == 0)
    {
      -[ICTableAttachmentProvider attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentReplicaID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      -[ICTableAttachmentProvider backgroundAttachment](self, "backgroundAttachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __34__ICTableAttachmentProvider_table__block_invoke;
      v14[3] = &unk_1E76C73B0;
      v14[4] = self;
      v15 = v9;
      v12 = v9;
      objc_msgSend(v11, "performBlockAndWait:", v14);

    }
  }
  return self->_table;
}

void __34__ICTableAttachmentProvider_table__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "backgroundAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyIntoNewDocumentWithReplicaID:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "rootObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:", v11);

}

- (BOOL)isBeingEditedLocallyOnDevice
{
  void *v2;
  char v3;

  -[ICTableAttachmentProvider attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBeingEditedLocallyOnDevice");

  return v3;
}

- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICTableAttachmentProvider attachment](self, "attachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsBeingEditedLocallyOnDevice:", v3);

}

- (void)didRefreshBackgroundTableAttachment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTableAttachmentProvider setNeedsToUpdateTableFromBackgroundAttachment:](self, "setNeedsToUpdateTableFromBackgroundAttachment:", 1);
  -[ICTableAttachmentProvider updateTableFromMOC](self, "updateTableFromMOC");
  -[ICTableAttachmentProvider backgroundAttachment](self, "backgroundAttachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "attachment == self.backgroundAttachment", "-[ICTableAttachmentProvider didRefreshBackgroundTableAttachment:]", 1, 0, CFSTR("didRefreshBackgroundTableAttachment: sent to wrong table attachment provider."));
}

- (void)updateTableFromMOC
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[10];

  if (-[ICTableAttachmentProvider needsToUpdateTableFromBackgroundAttachment](self, "needsToUpdateTableFromBackgroundAttachment"))
  {
    v3 = MEMORY[0x1E0C809B0];
    v6[5] = MEMORY[0x1E0C809B0];
    v6[6] = 3221225472;
    v6[7] = __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke;
    v6[8] = &unk_1E76C73F8;
    v6[9] = self;
    performBlockOnMainThread();
    -[ICTableAttachmentProvider backgroundAttachment](self, "backgroundAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_2;
    v6[3] = &unk_1E76C73F8;
    v6[4] = self;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateTableAttachmentWillMerge");
}

void __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "backgroundAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasswordProtectedAndLocked");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archivedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v11 = *(_QWORD *)(a1 + 32);
    v9 = v8;
    performBlockOnMainThread();
    objc_msgSend(*(id *)(a1 + 32), "setNeedsToUpdateTableFromBackgroundAttachment:", 0, v10, 3221225472, __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_3, &unk_1E76C73B0, v11);

  }
}

uint64_t __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableDoc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeWithData:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateTableAttachmentDidMerge");
}

- (void)notifyDelegateTableAttachmentWillMerge
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICTableAttachmentProviderWillMergeTable"), self);

}

- (void)notifyDelegateTableAttachmentDidMerge
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICTableAttachmentProviderDidMergeTable"), self);

}

- (ICCRTTCompatibleDocument)tableDoc
{
  return self->_tableDoc;
}

- (ICTableAttachmentProviderDelegate)delegate
{
  return (ICTableAttachmentProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICAttachment)backgroundAttachment
{
  return self->_backgroundAttachment;
}

- (void)setBackgroundAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAttachment, a3);
}

- (BOOL)needsToUpdateTableFromBackgroundAttachment
{
  return self->_needsToUpdateTableFromBackgroundAttachment;
}

- (void)setNeedsToUpdateTableFromBackgroundAttachment:(BOOL)a3
{
  self->_needsToUpdateTableFromBackgroundAttachment = a3;
}

- (NSManagedObjectContext)overriddenBackgroundMOC
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->_overriddenBackgroundMOC);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overriddenBackgroundMOC);
  objc_storeStrong((id *)&self->_backgroundAttachment, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableDoc, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_destroyWeak((id *)&self->_attachment);
}

@end
