@implementation ICCreateModernNoteAction

- (ICCreateModernNoteAction)initWithManagedObjectContext:(id)a3 folder:(id)a4
{
  id v7;
  id v8;
  ICCreateModernNoteAction *v9;
  ICCreateModernNoteAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCreateModernNoteAction;
  v9 = -[ICCreateModernNoteAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_folder, a4);
  }

  return v10;
}

- (id)performWithTitle:(id)a3 contents:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__48;
  v32 = __Block_byref_object_dispose__48;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__48;
  v26 = __Block_byref_object_dispose__48;
  v27 = 0;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v10, "ic_appendString:", CFSTR("\n"));
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v11, "insertAttributedString:atIndex:", v10, 0);
    }
    else
    {
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
    }
  }
  else
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    v10 = 0;
  }
  v12 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICCreateModernNoteAction performWithTitle:contents:error:].cold.1(buf, objc_msgSend(v11, "length"), objc_msgSend(v11, "hash"), v12);

  -[ICCreateModernNoteAction context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__ICCreateModernNoteAction_performWithTitle_contents_error___block_invoke;
  v18[3] = &unk_1E5C224D0;
  v18[4] = self;
  v20 = &v22;
  v14 = v11;
  v19 = v14;
  v21 = &v28;
  objc_msgSend(v13, "performBlockAndWait:", v18);

  if (a5)
  {
    v15 = (void *)v29[5];
    if (v15)
      *a5 = objc_retainAutorelease(v15);
  }
  v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __60__ICCreateModernNoteAction_performWithTitle_contents_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id obj;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canMoveAddOrDeleteContents");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D63BB8];
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v4, "newNoteWithAttributedString:inFolder:error:", v5, v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      return;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(id *)(v12 + 40);
    objc_msgSend(v11, "save:", &v28);
    v13 = v28;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "folder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSharedReadOnly");

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D63F58];
      v34 = *MEMORY[0x1E0D63F70];
      v35[0] = CFSTR("Can't create a note in the specified folder because it is read only");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17;
      v20 = v18;
      v21 = 228;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "folder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isSmartFolder");

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D63F58];
      if (v23)
      {
        v32 = *MEMORY[0x1E0D63F70];
        v33 = CFSTR("Can't create a note in the specified folder because it is a smart folder");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v24;
        v20 = v25;
        v21 = 229;
      }
      else
      {
        v30 = *MEMORY[0x1E0D63F70];
        v31 = CFSTR("Can't create a note in the specified folder");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v24;
        v20 = v25;
        v21 = 218;
      }
    }
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v11);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
  }

}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performWithTitle:(uint64_t)a3 contents:(os_log_t)log error:.cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "About to create note with content length %lu and hash %lu", buf, 0x16u);
}

@end
