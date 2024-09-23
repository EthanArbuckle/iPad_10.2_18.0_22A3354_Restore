@implementation ICParticipantUpdater

- (ICParticipantUpdater)initWithManagedObjectContext:(id)a3
{
  id v5;
  ICParticipantUpdater *v6;
  ICParticipantUpdater *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICParticipantUpdater;
  v6 = -[ICParticipantUpdater init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, -1);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.notes.participant-updater-background", v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)updateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke;
  v15[3] = &unk_1E76C73F8;
  v7 = v5;
  v16 = v7;
  -[ICParticipantUpdater deleteOrphanedParticipantsWithCompletion:](self, "deleteOrphanedParticipantsWithCompletion:", v15);
  dispatch_group_enter(v7);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke_2;
  v13[3] = &unk_1E76C73F8;
  v14 = v7;
  v8 = v7;
  -[ICParticipantUpdater insertMissingParticipantsWithCompletion:](self, "insertMissingParticipantsWithCompletion:", v13);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke_3;
  block[3] = &unk_1E76C91F0;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v8, v9, block);

}

void __45__ICParticipantUpdater_updateWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__ICParticipantUpdater_updateWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __45__ICParticipantUpdater_updateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)insertMissingParticipantsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICParticipantUpdater serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E76C73F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performBlockAndWait:", v4);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "missingNoteObjectsIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2_cold_1(v2);

  objc_msgSend(v2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4;
  v6[3] = &unk_1E76CCD50;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(*(id *)(a1 + 32), "insertParticipantsForNoteObjectID:", a2);
  if (a3 && !(a3 % 5) || objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_save");

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reset");

    v7 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4_cold_1(a3, v7);

  }
}

- (void)deleteOrphanedParticipantsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICParticipantUpdater serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E76C73F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performBlockAndWait:", v4);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2(uint64_t a1)
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
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.serverShareData == nil"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.folder.serverShareData == nil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICFolder ancestorFolderPredicatesWithBlock:](ICFolder, "ancestorFolderPredicatesWithBlock:", &__block_literal_global_43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNoteParticipant fetchRequest](ICNoteParticipant, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v7);
  objc_msgSend(v9, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "executeRequest:error:", v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v12)
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_2();

  }
  v14 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_1(v11);

}

uint64_t __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.folder.%K.serverShareData == nil"), a2);
}

- (void)insertParticipantsForNoteObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  -[ICParticipantUpdater managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_existingObjectWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "serverShareCheckingParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_acceptedParticipants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ICParticipantUpdater_insertParticipantsForNoteObjectID___block_invoke;
  v11[3] = &unk_1E76CCDB8;
  v11[4] = self;
  objc_msgSend(v8, "ic_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParticipants:", v10);

}

ICNoteParticipant *__58__ICParticipantUpdater_insertParticipantsForNoteObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICNoteParticipant *v4;
  void *v5;
  ICNoteParticipant *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = [ICNoteParticipant alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICNoteParticipant initWithContext:](v4, "initWithContext:", v5);

  objc_msgSend(v3, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userRecordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteParticipant setUserID:](v6, "setUserID:", v9);

  objc_msgSend(v3, "participantID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteParticipant setParticipantID:](v6, "setParticipantID:", v10);
  return v6;
}

- (id)missingNoteObjectsIDs
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
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[ICParticipantUpdater managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote predicateForVisibleNotesInContext:](ICNote, "predicateForVisibleNotesInContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("serverShareData != nil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.serverShareData != nil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICFolder ancestorFolderPredicatesWithBlock:](ICFolder, "ancestorFolderPredicatesWithBlock:", &__block_literal_global_25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("participants.@count == 0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote fetchRequest](ICNote, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v4;
  v23[1] = v10;
  v23[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v15);

  objc_msgSend(v12, "setResultType:", 1);
  -[ICParticipantUpdater managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v16, "executeFetchRequest:error:", v12, &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v22;

  if (v18)
  {
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICParticipantUpdater missingNoteObjectsIDs].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __45__ICParticipantUpdater_missingNoteObjectsIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("folder.%K.serverShareData != nil"), a2);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v1, v2, "found %lu shared notes with missing participants", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1 + 1;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "updated participant associations for %lu shared note(s)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "result");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "%@ orphaned participant records deleted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error deleting orphaned participants: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)missingNoteObjectsIDs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching shared note object IDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
