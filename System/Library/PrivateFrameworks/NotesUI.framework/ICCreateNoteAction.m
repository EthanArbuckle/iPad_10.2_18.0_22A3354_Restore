@implementation ICCreateNoteAction

- (ICCreateNoteAction)initWithNoteContext:(id)a3
{
  id v5;
  ICCreateNoteAction *v6;
  ICCreateNoteAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCreateNoteAction;
  v6 = -[ICCreateNoteAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_noteContext, a3);
    v7->_allowsNoContent = 0;
  }

  return v7;
}

- (id)performWithTitle:(id)a3 contents:(id)a4 container:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  ICCreateModernNoteAction *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  ICCreateHTMLNoteAction *v31;
  id v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "length")
    || objc_msgSend(v10, "length")
    || -[ICCreateNoteAction allowsNoContent](self, "allowsNoContent"))
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__22;
    v54 = __Block_byref_object_dispose__22;
    objc_opt_class();
    ICDynamicCast();
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__22;
    v48 = __Block_byref_object_dispose__22;
    objc_opt_class();
    ICClassAndProtocolCast();
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v51;
    if (!v45[5] && !v51[5])
    {
      v14 = (void *)MEMORY[0x1E0D63AD0];
      -[ICCreateNoteAction noteContext](self, "noteContext", &unk_1EED6F370);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "htmlNoteContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultAccountWithHTMLNoteContext:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke;
      v42[3] = &unk_1E5C1D540;
      v20 = v17;
      v43 = v20;
      objc_msgSend(v18, "performBlock:", v42);

      objc_opt_class();
      ICDynamicCast();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ICProtocolCast();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[ICCreateNoteAction noteContext](self, "noteContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "modernManagedObjectContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v19;
        v41[1] = 3221225472;
        v41[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_157;
        v41[3] = &unk_1E5C1D9D0;
        v41[5] = &v50;
        v24 = v41;
        v41[4] = v21;
        objc_msgSend(v23, "performBlockAndWait:", v41);
      }
      else
      {
        if (!v39)
        {
          if (a6)
          {
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v35 = *MEMORY[0x1E0D63F70];
            v57[0] = CFSTR("Unknown default account type");
            v36 = *MEMORY[0x1E0D63F60];
            v56[0] = v35;
            v56[1] = v36;
            v37 = v20;
            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v57[1] = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 218, v38);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

            if (!v20)
          }
          a6 = 0;
          v32 = v43;
          goto LABEL_19;
        }
        -[ICCreateNoteAction noteContext](self, "noteContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "htmlManagedObjectContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v19;
        v40[1] = 3221225472;
        v40[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_2;
        v40[3] = &unk_1E5C1D9D0;
        v40[5] = &v44;
        v24 = v40;
        v40[4] = v39;
        objc_msgSend(v23, "performBlockAndWait:", v40);
      }

      v13 = v51;
    }
    if (v13[5])
    {
      v27 = [ICCreateModernNoteAction alloc];
      -[ICCreateNoteAction noteContext](self, "noteContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "modernManagedObjectContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ICCreateModernNoteAction initWithManagedObjectContext:folder:](v27, "initWithManagedObjectContext:folder:", v29, v51[5]);
    }
    else
    {
      if (!v45[5])
      {
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCreateNoteAction performWithTitle:contents:container:error:]", 1, 0, CFSTR("Expected a default folder to be set or an error returned"));
        a6 = 0;
        goto LABEL_21;
      }
      v31 = [ICCreateHTMLNoteAction alloc];
      -[ICCreateNoteAction noteContext](self, "noteContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "htmlNoteContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ICCreateHTMLNoteAction initWithHTMLNoteContext:folder:](v31, "initWithHTMLNoteContext:folder:", v29, v45[5]);
    }
    v20 = (id)v30;

    objc_msgSend(v20, "performWithTitle:contents:error:", v10, v11, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
LABEL_20:

LABEL_21:
      _Block_object_dispose(&v44, 8);

      _Block_object_dispose(&v50, 8);
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0D642A0], "sharedWidget");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "reloadTimelinesWithReason:", CFSTR("Note was created via automation"));
LABEL_19:

    goto LABEL_20;
  }
  if (a6)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0D63F70];
    v59[0] = CFSTR("Attempted to create a note with no content");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 218, v26);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }
LABEL_22:

  return a6;
}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_cold_1(a1, v2);

}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_157(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultFolder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultFolder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (ICUnifiedNoteContext)noteContext
{
  return self->_noteContext;
}

- (BOOL)allowsNoContent
{
  return self->_allowsNoContent;
}

- (void)setAllowsNoContent:(BOOL)a3
{
  self->_allowsNoContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteContext, 0);
}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "default account for Siri %@", (uint8_t *)&v4, 0xCu);

}

@end
