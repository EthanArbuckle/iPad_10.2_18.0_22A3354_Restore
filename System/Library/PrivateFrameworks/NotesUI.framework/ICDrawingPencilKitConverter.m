@implementation ICDrawingPencilKitConverter

void __46__ICDrawingPencilKitConverter_sharedConverter__block_invoke()
{
  ICDrawingPencilKitConverter *v0;
  void *v1;

  v0 = objc_alloc_init(ICDrawingPencilKitConverter);
  v1 = (void *)sharedConverter;
  sharedConverter = (uint64_t)v0;

}

- (BOOL)shouldConvertAllDrawingsIfNeeded
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D64450]);

  return v3 ^ 1;
}

- (BOOL)shouldAutoConvertNote:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isSharedViaICloud") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEditable");

  return v4;
}

- (ICDrawingPencilKitConverter)init
{
  ICDrawingPencilKitConverter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *converterQueue;
  uint64_t v5;
  NSMapTable *lastOperationForAttachmentID;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *convertDispatchQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICDrawingPencilKitConverter;
  v2 = -[ICDrawingPencilKitConverter init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    converterQueue = v2->_converterQueue;
    v2->_converterQueue = v3;

    -[NSOperationQueue setName:](v2->_converterQueue, "setName:", CFSTR("Converter Queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_converterQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    lastOperationForAttachmentID = v2->_lastOperationForAttachmentID;
    v2->_lastOperationForAttachmentID = (NSMapTable *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.notes.drawing-converter", v7);
    convertDispatchQueue = v2->_convertDispatchQueue;
    v2->_convertDispatchQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (unint64_t)countOfDrawingsNeedingConversionInNote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3880];
  v13 = *MEMORY[0x1E0D63688];
  v26[0] = *MEMORY[0x1E0D63670];
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("self IN %@ AND typeUTI IN %@ AND markedForDeletion == NO"), v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ICAttachment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v15);
  objc_msgSend(v16, "setIncludesSubentities:", 0);
  v21 = 0;
  v17 = objc_msgSend(v11, "countForFetchRequest:error:", v16, &v21);
  v18 = v21;
  if (v18)
  {
    v19 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICDrawingPencilKitConverter countOfDrawingsNeedingConversionInNote:].cold.1((uint64_t)v18, v19);

  }
  return v17;
}

- (void)convertDrawingsInNoteIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (-[ICDrawingPencilKitConverter shouldAutoConvertNote:](self, "shouldAutoConvertNote:", v4)
    && -[ICDrawingPencilKitConverter shouldConvertAllDrawingsIfNeeded](self, "shouldConvertAllDrawingsIfNeeded")
    && -[ICDrawingPencilKitConverter countOfDrawingsNeedingConversionInNote:](self, "countOfDrawingsNeedingConversionInNote:", v4))
  {
    v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICDrawingPencilKitConverter convertDrawingsInNoteIfNeeded:].cold.1(v4, v5);

    objc_initWeak(&location, self);
    +[ICDrawingPencilKitConverter sharedConverter](ICDrawingPencilKitConverter, "sharedConverter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke;
    v8[3] = &unk_1E5C1DCE0;
    v9 = v4;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "canAutoUpdateDrawingsInAccount:completion:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

+ (id)sharedConverter
{
  if (sharedConverter_once != -1)
    dispatch_once(&sharedConverter_once, &__block_literal_global_1);
  return (id)sharedConverter;
}

+ (id)newThrowawayConverter
{
  ICDrawingPencilKitConverter *v2;

  v2 = objc_alloc_init(ICDrawingPencilKitConverter);
  -[ICDrawingPencilKitConverter setIsThrowaway:](v2, "setIsThrowaway:", 1);
  return v2;
}

+ (BOOL)canUpdateFullscreenSketchAttachment:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  BOOL v10;
  BOOL v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "attachmentType");
  objc_msgSend(v3, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if ((objc_msgSend(v3, "needsToBeFetchedFromCloud") & 1) != 0)
    LOBYTE(v7) = 0;
  else
    v7 = objc_msgSend(v3, "needsInitialFetchFromCloud") ^ 1;
  objc_msgSend(v3, "mergeableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 9)
    v9 = v6;
  else
    v9 = 0;
  if (v8)
    v10 = v7;
  else
    v10 = 0;
  v11 = v9 == 1 && v10;

  return v11;
}

+ (BOOL)canUpdateInlineDrawingAttachment:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  unsigned __int8 v8;
  int v9;
  void *v10;
  BOOL v11;
  BOOL v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "attachmentType");
  objc_msgSend(v3, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63688]);

  objc_msgSend(v3, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditable");

  if ((objc_msgSend(v3, "needsToBeFetchedFromCloud") & 1) != 0)
    LOBYTE(v9) = 0;
  else
    v9 = objc_msgSend(v3, "needsInitialFetchFromCloud") ^ 1;
  objc_msgSend(v3, "mergeableData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 10)
  {
    v11 = 0;
    if (((v6 ^ 1) & 1) == 0)
    {
      if (v10)
        v12 = v9;
      else
        v12 = 0;
      v11 = ((v8 ^ 1) & 1) == 0 && v12;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unint64_t)countOfUpdatableDrawingsInNote:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ICDrawingPencilKitConverter_countOfUpdatableDrawingsInNote___block_invoke;
  v7[3] = &unk_1E5C1DAA8;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateAttachmentsInOrderUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __62__ICDrawingPencilKitConverter_countOfUpdatableDrawingsInNote___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "canUpdateFullscreenSketchAttachment:", v3) & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "canUpdateInlineDrawingAttachment:", v3))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

- (void)canAutoUpdateDrawingsInAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "accountType");
  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D63A98], "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke;
    v9[3] = &unk_1E5C1DB10;
    v10 = v6;
    objc_msgSend(v8, "devicesForAccount:completionHandler:", v5, v9);

  }
  else if (v7 == 3 && v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(a2, "ic_allSatisfy:", &__block_literal_global_24);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

BOOL __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maximumNotesVersion") > 3;
}

- (NSMutableArray)mutableFailedSketches
{
  NSMutableArray *mutableFailedSketches;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mutableFailedSketches = self->_mutableFailedSketches;
  if (!mutableFailedSketches)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_mutableFailedSketches;
    self->_mutableFailedSketches = v4;

    mutableFailedSketches = self->_mutableFailedSketches;
  }
  return mutableFailedSketches;
}

- (NSArray)failedSketches
{
  void *v2;
  void *v3;

  -[ICDrawingPencilKitConverter mutableFailedSketches](self, "mutableFailedSketches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)convertAllSketchesWithProgress:(id)a3
{
  -[ICDrawingPencilKitConverter convertAllSketchesWithProgress:completion:](self, "convertAllSketchesWithProgress:completion:", a3, 0);
}

- (void)convertAllSketchesWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  ICDrawingPencilKitConverter *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workerManagedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke;
  v18[3] = &unk_1E5C1D7C0;
  v11 = v9;
  v19 = v11;
  v12 = v6;
  v20 = v12;
  v21 = self;
  objc_msgSend(v11, "performBlockAndWait:", v18);
  if (!-[ICDrawingPencilKitConverter isThrowaway](self, "isThrowaway"))
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_saveWithLogDescription:", CFSTR("saving main context after converting all sketch attachments"));

    +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "generatePreviewsIfNeeded");

  }
  if (v7)
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_36;
    v16[3] = &unk_1E5C1DB38;
    v17 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  double v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639C8], "allActiveAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "predicateForVisibleNotes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D63BB8], "ic_objectIDsMatchingPredicate:context:", v10, *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);
        v7 += objc_msgSend(v11, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v12 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 0);
  v13 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_2(v7, v13, v14);
  v29 = v4;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v15);
        v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v21);
        v23 = (void *)MEMORY[0x1AF445E78]();
        objc_msgSend(MEMORY[0x1E0D63BB8], "ic_existingObjectWithID:context:", v22, *(_QWORD *)(a1 + 32));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v18 += objc_msgSend(*(id *)(a1 + 48), "convertAllSketchesInNote:", v24);
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", ++v21 + v19);

        objc_autoreleasePoolPop(v23);
      }
      while (v17 != v21);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      v19 += v21;
    }
    while (v17);
    v12 = (id *)(a1 + 40);
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }

  v25 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v30, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134218496;
    v40 = v18;
    v41 = 2048;
    v42 = v19;
    v43 = 2048;
    v44 = -v28;
    _os_log_debug_impl(&dword_1AC7A1000, v25, OS_LOG_TYPE_DEBUG, "Finished converting %lu sketches in %lu notes in %f seconds", buf, 0x20u);
  }

  v26 = objc_msgSend(*v12, "completedUnitCount");
  if (v26 != objc_msgSend(*v12, "totalUnitCount"))
  {
    v27 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_1(v12, v27);

  }
}

uint64_t __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)convertAllSketchesInNote:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  int v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, uint64_t);
  void *v29;
  ICDrawingPencilKitConverter *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  _BYTE v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  if ((objc_msgSend(v4, "isSharedViaICloud") & 1) != 0
    || (objc_msgSend(v4, "isDeletedOrInTrash") & 1) != 0
    || (objc_msgSend(v4, "isPasswordProtected") & 1) != 0
    || !objc_msgSend(v4, "isEditable"))
  {
    v16 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "shortLoggingDescription");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isSharedViaICloud"))
        v20 = CFSTR("shared");
      else
        v20 = CFSTR("n");
      if (objc_msgSend(v4, "isDeletedOrInTrash"))
        v21 = CFSTR("deleted");
      else
        v21 = CFSTR("n");
      v22 = objc_msgSend(v4, "isPasswordProtected");
      v23 = objc_msgSend(v4, "isEditable");
      v24 = CFSTR("password-protected");
      *(_DWORD *)buf = 138413314;
      if (!v22)
        v24 = CFSTR("n");
      v38 = v19;
      v25 = CFSTR("not-editable");
      v39 = 2112;
      v40 = v20;
      v41 = 2112;
      if (v23)
        v25 = CFSTR("editable");
      v42 = v21;
      v43 = 2112;
      v44 = v24;
      v45 = 2112;
      v46 = v25;
      _os_log_debug_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_DEBUG, "not converting sketches in note %@ %@ %@ %@ %@", buf, 0x34u);

    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDrawingPencilKitConverter convertAllSketchesInNote:].cold.2(v6, (uint64_t)v47, v5);
    }

    objc_msgSend(v4, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __56__ICDrawingPencilKitConverter_convertAllSketchesInNote___block_invoke;
    v29 = &unk_1E5C1DB60;
    v30 = self;
    v11 = v4;
    v31 = v11;
    v32 = &v33;
    objc_msgSend(v7, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", v8, 0, v10, 2, &v26);

    v12 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = v34[3];
      objc_msgSend(v11, "shortLoggingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDrawingPencilKitConverter convertAllSketchesInNote:].cold.1(v14, (uint64_t)buf, v13, v12);
    }

    if (v34[3] && !-[ICDrawingPencilKitConverter isThrowaway](self, "isThrowaway"))
    {
      objc_msgSend(v11, "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ic_saveWithLogDescription:", CFSTR("saving note with %lu converted sketches"), v34[3], v26, v27, v28, v29, v30);

    }
  }
  v17 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __56__ICDrawingPencilKitConverter_convertAllSketchesInNote___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  if (objc_msgSend((id)objc_opt_class(), "canUpdateFullscreenSketchAttachment:", v9))
  {
    v7 = (void *)MEMORY[0x1AF445E78]();
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "convertSketchAttachment:toInlineDrawingAtRange:inNote:", v9, a3, a4, *(_QWORD *)(a1 + 40));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_autoreleasePoolPop(v7);
  }

}

- (id)convertSketchAttachment:(id)a3 toInlineDrawingAtRange:(_NSRange)a4 inNote:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  NSObject *v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  NSRange v78;

  length = a4.length;
  location = a4.location;
  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "drawingModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDrawingPencilKitConverter convertSketch:](self, "convertSketch:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serializeWithVersion:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    || -[ICDrawingPencilKitConverter compareDrawingAttachment:withConvertedDrawing:](self, "compareDrawingAttachment:withConvertedDrawing:", v9, v13))
  {
    -[ICDrawingPencilKitConverter mutableFailedSketches](self, "mutableFailedSketches");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  if (v14)
  {
    v17 = 0;
    if (!-[ICDrawingPencilKitConverter isThrowaway](self, "isThrowaway") && location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = objc_msgSend(v10, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v14, "length"));
      v19 = os_log_create("com.apple.notes", "PencilKit");
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "shortLoggingDescription");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ic_loggingDescription");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v72 = v60;
          v73 = 2112;
          v74 = v61;
          v75 = 2048;
          v76 = objc_msgSend(v14, "length");
          _os_log_error_impl(&dword_1AC7A1000, v20, OS_LOG_TYPE_ERROR, "over limit when converting: sketch %@ has pkDrawing %@ with size %lu", buf, 0x20u);

        }
        v17 = 0;
        v21 = v20;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "shortLoggingDescription");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "shortLoggingDescription");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v78.location = location;
          v78.length = length;
          NSStringFromRange(v78);
          v70 = location;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v72 = v62;
          v73 = 2112;
          v74 = v63;
          v75 = 2112;
          v76 = (uint64_t)v64;
          _os_log_debug_impl(&dword_1AC7A1000, v20, OS_LOG_TYPE_DEBUG, "converting sketch %@ in note %@ at range %@", buf, 0x20u);

          location = v70;
        }

        objc_msgSend(v10, "textStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "wantsUndoCommands");

        objc_msgSend(v10, "textStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWantsUndoCommands:", 0);

        objc_msgSend(v10, "addInlineDrawingAttachmentWithAnalytics:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v21 = os_log_create("com.apple.notes", "PencilKit");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[ICDrawingPencilKitConverter convertSketchAttachment:toInlineDrawingAtRange:inNote:].cold.1(v21, v41, v42, v43, v44, v45, v46, v47);
          v17 = 0;
          goto LABEL_28;
        }
        v17 = v25;
        v66 = v23;
        objc_msgSend(v25, "setMergeableData:", v14);
        objc_msgSend(v17, "metadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (!v26)
          v26 = (void *)MEMORY[0x1E0C9AA70];
        v28 = objc_msgSend(v26, "mutableCopy");

        -[NSObject setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D63620]);
        v67 = v28;
        objc_msgSend(v17, "setMetadata:", v28);
        objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
        objc_msgSend(v9, "attachmentPreviewImageWithMinSize:scale:");
        v29 = objc_claimAutoreleasedReturnValue();
        v20 = v29;
        v68 = length;
        v69 = location;
        if (v29
          && (-[NSObject image](v29, "image"), (v30 = objc_claimAutoreleasedReturnValue()) != 0)
          && (v31 = (void *)v30,
              v65 = -[NSObject version](v20, "version"),
              v32 = objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion"),
              v31,
              v32 <= v65))
        {
          -[NSObject image](v20, "image");
          v33 = objc_claimAutoreleasedReturnValue();
          -[NSObject size](v33, "size");
          objc_msgSend(v17, "setSizeWidth:");
          -[NSObject size](v33, "size");
          objc_msgSend(v17, "setSizeHeight:", v48);
          objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject ic_imageDataWithUTType:](v33, "ic_imageDataWithUTType:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "writeFallbackImageData:", v50);

        }
        else
        {
          v33 = os_log_create("com.apple.notes", "PencilKit");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[ICDrawingPencilKitConverter convertSketchAttachment:toInlineDrawingAtRange:inNote:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);
        }

        objc_msgSend(v9, "userTitle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setUserTitle:", v51);

        objc_msgSend(v9, "title");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTitle:", v52);

        objc_msgSend(v9, "summary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSummary:", v53);

        +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v17);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v55, "mutableCopy");

        objc_msgSend(v56, "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v54, 0, objc_msgSend(v56, "length"));
        objc_msgSend(v10, "textStorage");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "replaceCharactersInRange:withAttributedString:", v69, v68, v56);

        objc_msgSend(v9, "markForDeletion");
        objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Converted sketch to inline drawing"));
        objc_msgSend(v17, "updateChangeCountWithReason:", CFSTR("Converted sketch to inline drawing"));
        objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Converted sketch to inline drawing"));
        objc_msgSend(v10, "textStorage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setWantsUndoCommands:", v66);

        v21 = v67;
      }

LABEL_28:
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)convertSketch:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[3];
  char v24;

  v3 = a3;
  objc_msgSend(v3, "serializeWithPathData:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v6 = (void *)MEMORY[0x1E0CD1158];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__ICDrawingPencilKitConverter_convertSketch___block_invoke;
  v12[3] = &unk_1E5C1DB88;
  v7 = v3;
  v13 = v7;
  v15 = v23;
  v16 = &v17;
  v8 = v5;
  v14 = v8;
  v9 = (id)objc_msgSend(v6, "_upgradeDrawingData:queue:completionBlock:", v4, 0, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);

  return v10;
}

void __45__ICDrawingPencilKitConverter_convertSketch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__ICDrawingPencilKitConverter_convertSketch___block_invoke_cold_1(a1, (uint64_t)v6, v7);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)updateInlineDrawingAttachment:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;

  v3 = a3;
  objc_msgSend(v3, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D63688]);

  v6 = objc_msgSend(v3, "rangeInNote");
  if (v5)
    v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 1;
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v3, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "wantsUndoCommands");

    objc_msgSend(v8, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWantsUndoCommands:", 0);

    objc_msgSend(v8, "addInlineDrawingAttachmentWithAnalytics:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mergeableData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMergeableData:", v13);

    objc_msgSend(v12, "setTypeUTI:", *MEMORY[0x1E0D63680]);
    objc_msgSend(v3, "sizeWidth");
    objc_msgSend(v12, "setSizeWidth:");
    objc_msgSend(v3, "sizeHeight");
    objc_msgSend(v12, "setSizeHeight:");
    objc_msgSend(v3, "fallbackImageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeFallbackImageData:", v14);

    objc_msgSend(v3, "userTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserTitle:", v15);

    objc_msgSend(v3, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v16);

    objc_msgSend(v3, "summary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSummary:", v17);

    +[ICTextAttachment textAttachmentWithAttachment:](ICTextAttachment, "textAttachmentWithAttachment:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v21 = *MEMORY[0x1E0DC10F8];
    v22 = objc_msgSend(v20, "ic_range");
    objc_msgSend(v20, "addAttribute:value:range:", v21, v18, v22, v23);
    v24 = objc_msgSend(v3, "rangeInNote");
    v26 = v25;
    objc_msgSend(v8, "textStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "replaceCharactersInRange:withAttributedString:", v24, v26, v20);

    objc_msgSend(v3, "markForDeletion");
    objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Updated inline drawing"));
    objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Updated inline drawing"));
    objc_msgSend(v8, "updateChangeCountWithReason:", CFSTR("Updated inline drawing"));
    objc_msgSend(v8, "textStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWantsUndoCommands:", v10);

    v29 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[ICDrawingPencilKitConverter updateInlineDrawingAttachment:].cold.1(v3, v12, v29);

  }
  return v12;
}

- (BOOL)compareDrawingAttachment:(id)a3 withConvertedDrawing:(id)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v23;
  double v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  CGSize v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0D64290], "isInternalInstall");
  v8 = 0;
  if (v5 && v7)
  {
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
    objc_msgSend(v5, "attachmentPreviewImageWithMinSize:scale:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && (v11 = objc_msgSend(v9, "version"),
          objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion") == v11))
    {
      objc_msgSend(v10, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CD11C0], "compareLegacyDrawingImage:toConvertedDrawing:", v12, v6);
      v14 = v13;
      v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "size");
        NSStringFromCGSize(v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v12, "imageOrientation");
        objc_msgSend(v6, "_canvasBounds");
        NSStringFromCGRect(v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 134218754;
        v24 = v14;
        v25 = 2112;
        v26 = v16;
        v27 = 2048;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_DEFAULT, "convertSketch compareError %f %@ %lu %@", (uint8_t *)&v23, 0x2Au);

      }
      if (v14 <= 5.0)
      {
LABEL_16:
        v8 = 0;
        goto LABEL_17;
      }
      v19 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ICDrawingPencilKitConverter compareDrawingAttachment:withConvertedDrawing:].cold.2(v19, v14, v20, v21);
      v8 = 1;
    }
    else
    {
      v19 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ICDrawingPencilKitConverter compareDrawingAttachment:withConvertedDrawing:].cold.1(v10, (uint64_t)v5, v19);

      v12 = 0;
      v8 = 0;
    }

LABEL_17:
  }

  return v8;
}

- (void)convertDrawingsInNote:(id)a3 inWindow:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  ICLongRunningTaskController *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICDrawingPencilKitConverter *v16;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:]([ICLongRunningTaskController alloc], "initWithWindow:intervalBeforeOpeningProgressDialog:", v11, 0.1);

  -[ICLongRunningTaskController setProgressString:](v12, "setProgressString:", v10);
  -[ICLongRunningTaskController setAllowSingleUnitProgress:](v12, "setAllowSingleUnitProgress:", 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke;
  v14[3] = &unk_1E5C1DBB0;
  v15 = v9;
  v16 = self;
  v13 = v9;
  -[ICLongRunningTaskController startTask:completionBlock:](v12, "startTask:completionBlock:", v14, &__block_literal_global_66);

}

void __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;

  v3 = a2;
  objc_msgSend(v3, "setTotalUnitCount:", 1);
  objc_msgSend(v3, "setCompletedUnitCount:", 1);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke_2;
  v7[3] = &unk_1E5C1D9A8;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v4, "performBlockAndWait:", v7);

}

uint64_t __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertDrawingsInNote:waitUntilFinished:", *(_QWORD *)(a1 + 40), 1);
}

- (id)addOperationForAttachment:(id)a3 automatic:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__1;
  v25[4] = __Block_byref_object_dispose__1;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke;
  v21[3] = &unk_1E5C1DC18;
  v10 = v6;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v24 = v25;
  objc_msgSend(v11, "performBlockAndWait:", v21);
  -[ICDrawingPencilKitConverter convertDispatchQueue](self, "convertDispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke_2;
  v16[3] = &unk_1E5C1DC40;
  v16[4] = self;
  v17 = v10;
  v18 = &v27;
  v19 = v25;
  v20 = a4;
  v13 = v10;
  dispatch_sync(v12, v16);

  v14 = (id)v28[5];
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v13, "attachmentType") == 10;
  v5 = v13;
  if (v4)
  {
    objc_msgSend(v13, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "rangeInNote");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "range.location != NSNotFound", "-[ICDrawingPencilKitConverter addOperationForAttachment:automatic:]_block_invoke", 1, 0, CFSTR("ICDrawingPencilKitConverter operationComplete expected to find attachment range in note"));
    objc_opt_class();
    objc_msgSend(v6, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v5 = v13;
  }

}

void __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICDrawingConversionOperation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "lastOperationForAttachmentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICDrawingConversionOperation initWithAttachment:textAttachment:automatic:]([ICDrawingConversionOperation alloc], "initWithAttachment:textAttachment:automatic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "converterQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    objc_msgSend(*(id *)(a1 + 32), "lastOperationForAttachmentID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v11, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v12, v13);

  }
}

- (void)convertAllDrawingsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICDrawingPencilKitConverter *v8;

  if (-[ICDrawingPencilKitConverter shouldConvertAllDrawingsIfNeeded](self, "shouldConvertAllDrawingsIfNeeded"))
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "workerManagedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke;
    v6[3] = &unk_1E5C1D9A8;
    v7 = v4;
    v8 = self;
    v5 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

void __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639C8], "allActiveAccountsInContext:", *(_QWORD *)(a1 + 32));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1AF445E78]();
        v10 = *(void **)(a1 + 32);
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_2;
        v13[3] = &unk_1E5C1D7C0;
        v13[4] = v8;
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 40);
        v14 = v11;
        v15 = v12;
        objc_msgSend(v11, "performBlock:", v13);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_2(id *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "predicateForVisibleNotes");
  v2 = 0x1E0D63000uLL;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BB8], "ic_objectIDsMatchingPredicate:context:");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    v6 = MEMORY[0x1E0C809B0];
    v21 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1AF445E78]();
        objc_msgSend(*(id *)(v2 + 3000), "ic_existingObjectWithID:context:", v8, a1[5]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1[6], "shouldAutoConvertNote:", v10))
        {
          v25 = v9;
          v26 = v7;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v24 = v10;
          objc_msgSend(v10, "attachments");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
                v17 = (void *)MEMORY[0x1AF445E78]();
                if (objc_msgSend(v16, "isVisible")
                  && ((objc_msgSend((id)objc_opt_class(), "canUpdateFullscreenSketchAttachment:", v16) & 1) != 0
                   || objc_msgSend((id)objc_opt_class(), "canUpdateInlineDrawingAttachment:", v16)))
                {
                  v18 = a1[6];
                  v19 = a1[4];
                  v27[0] = v6;
                  v27[1] = 3221225472;
                  v27[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_3;
                  v27[3] = &unk_1E5C1DC68;
                  v27[4] = v18;
                  v27[5] = v16;
                  objc_msgSend(v18, "canAutoUpdateDrawingsInAccount:completion:", v19, v27);
                }
                objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", v16, 0);
                objc_autoreleasePoolPop(v17);
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v13);
          }

          v2 = 0x1E0D63000;
          v5 = v21;
          v4 = v22;
          v9 = v25;
          v7 = v26;
          v10 = v24;
        }
        objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", v10, 0);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v4);
  }

}

id *__57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_3(id *result, int a2)
{
  if (a2)
    return (id *)(id)objc_msgSend(result[4], "addOperationForAttachment:automatic:", result[5], 1);
  return result;
}

- (void)convertDrawingsInNote:(id)a3 waitUntilFinished:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ICDrawingPencilKitConverter_convertDrawingsInNote_waitUntilFinished___block_invoke;
  v4[3] = &unk_1E5C1DC90;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "enumerateAttachmentsInOrderUsingBlock:", v4);
}

void __71__ICDrawingPencilKitConverter_convertDrawingsInNote_waitUntilFinished___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "canUpdateFullscreenSketchAttachment:", v4) & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "canUpdateInlineDrawingAttachment:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "addOperationForAttachment:automatic:", v4, *(_BYTE *)(a1 + 40) == 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueuePriority:", 4);
    objc_msgSend(v3, "setQualityOfService:", -1);
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v3, "waitUntilFinished");

  }
}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v3 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_cold_1(v3);

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_75;
    v4[3] = &unk_1E5C1DCB8;
    v5 = *(id *)(a1 + 32);
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v6);

  }
}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_75(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_saveWithLogDescription:", CFSTR("Save before converting drawings in a single opened note"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "convertDrawingsInNote:waitUntilFinished:", *(_QWORD *)(a1 + 32), 0);

}

- (void)operationComplete:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  ICDrawingPencilKitConverter *v13;

  v4 = a3;
  -[ICDrawingPencilKitConverter convertDispatchQueue](self, "convertDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICDrawingPencilKitConverter_operationComplete___block_invoke;
  block[3] = &unk_1E5C1D9A8;
  v7 = v4;
  v12 = v7;
  v13 = self;
  dispatch_async(v5, block);

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __49__ICDrawingPencilKitConverter_operationComplete___block_invoke_2;
  v9[3] = &unk_1E5C1D540;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __49__ICDrawingPencilKitConverter_operationComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generatePreviewIfNeededForAttachmentWithObjectID:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "lastOperationForAttachmentID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachmentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

}

void __49__ICDrawingPencilKitConverter_operationComplete___block_invoke_2(uint64_t a1)
{
  void *v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  ICIndexHandwritingOperation *v25;
  void *v26;
  ICIndexHandwritingOperation *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(a1 + 32), "attachmentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "attachmentType") == 10)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "textAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "detachView");
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("ICDrawingPencilKitConvertedNotificationFinalAttachmentKey");
    objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("ICDrawingPencilKitConvertedNotificationAutomaticKey");
    v29[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isAutomatic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("ICDrawingPencilKitConvertedNotification"), 0, v12);

    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v6, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsToBeSaved:", 1);

  objc_msgSend(v6, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "noteData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "saveNoteDataIfNeeded");

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ic_saveWithLogDescription:", CFSTR("saving main context after converting sketch attachment operation completed"));

  objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = objc_msgSend(*(id *)(a1 + 32), "isAutomatic");

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "workerManagedObjectContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICIndexHandwritingOperation sharedOperationQueue](ICIndexHandwritingOperation, "sharedOperationQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [ICIndexHandwritingOperation alloc];
      objc_msgSend(*(id *)(a1 + 32), "finalAttachmentID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ICIndexHandwritingOperation initWithAttachmentObjectID:context:](v25, "initWithAttachmentObjectID:context:", v26, v23);

      objc_msgSend(v24, "addOperation:", v27);
    }
  }

}

- (NSOperationQueue)converterQueue
{
  return self->_converterQueue;
}

- (void)setConverterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_converterQueue, a3);
}

- (NSMapTable)lastOperationForAttachmentID
{
  return self->_lastOperationForAttachmentID;
}

- (void)setLastOperationForAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, a3);
}

- (OS_dispatch_queue)convertDispatchQueue
{
  return self->_convertDispatchQueue;
}

- (void)setConvertDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_convertDispatchQueue, a3);
}

- (void)setMutableFailedSketches:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFailedSketches, a3);
}

- (BOOL)isThrowaway
{
  return self->_isThrowaway;
}

- (void)setIsThrowaway:(BOOL)a3
{
  self->_isThrowaway = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFailedSketches, 0);
  objc_storeStrong((id *)&self->_convertDispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, 0);
  objc_storeStrong((id *)&self->_converterQueue, 0);
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*a1, "completedUnitCount");
  v5 = objc_msgSend(*a1, "totalUnitCount");
  v7 = 134218240;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a2, v6, "Final completed unit count is not equal to total unit count %lld %lld", (uint8_t *)&v7);
  OUTLINED_FUNCTION_4();
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, a3, "Beginning to convert sketches in %lu notes", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)convertAllSketchesInNote:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1AC7A1000, a4, a3, "converted %lu sketches in note %@", (uint8_t *)a2);

}

- (void)convertAllSketchesInNote:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a3, (uint64_t)a3, "converting all sketches in note %@", (uint8_t *)a2);

}

- (void)convertSketchAttachment:(uint64_t)a3 toInlineDrawingAtRange:(uint64_t)a4 inNote:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Unable to create inline drawing attachment when converting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)convertSketchAttachment:(uint64_t)a3 toInlineDrawingAtRange:(uint64_t)a4 inNote:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Unable to find sketch's preview image to use as the fallback", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __45__ICDrawingPencilKitConverter_convertSketch___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a3, (uint64_t)a3, "Error converting drawing %@ %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)updateInlineDrawingAttachment:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_5_0(&dword_1AC7A1000, a3, v7, "updateInlineDrawingAttachment: updated %@ to %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_4();
}

- (void)compareDrawingAttachment:(NSObject *)a3 withConvertedDrawing:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  CGSize v17;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "version");
  objc_msgSend(a1, "size");
  NSStringFromCGSize(v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218754;
  v9 = a1;
  v10 = 1024;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Could not find a proper preview image for drawing %p %hd %@ %@", (uint8_t *)&v8, 0x26u);

}

- (void)compareDrawingAttachment:(uint64_t)a3 withConvertedDrawing:(uint64_t)a4 .cold.2(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = 0x4014000000000000;
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a1, a4, "convertSketch compareError higher than threshold %f > %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)convertDrawingsInNoteIfNeeded:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v4, "Checking device state and attempting to automatically update any drawings in note %@", (uint8_t *)&v5);

}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Automatically updating any drawings in note after checking device state", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)countOfDrawingsNeedingConversionInNote:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "countOfDrawingsNeedingConversionInNote %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
