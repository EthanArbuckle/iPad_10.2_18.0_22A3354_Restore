@implementation ICCreateHTMLNoteAction

- (ICCreateHTMLNoteAction)initWithHTMLNoteContext:(id)a3 folder:(id)a4
{
  id v7;
  id v8;
  ICCreateHTMLNoteAction *v9;
  ICCreateHTMLNoteAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCreateHTMLNoteAction;
  v9 = -[ICCreateHTMLNoteAction init](&v12, sel_init);
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
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  ICCreateHTMLNoteAction *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__79;
  v35 = __Block_byref_object_dispose__79;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__79;
  v29 = __Block_byref_object_dispose__79;
  v30 = 0;
  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v9, "length"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(v11, "ic_appendString:", v8);
      objc_msgSend(v11, "ic_appendString:", CFSTR("\n"));
      objc_msgSend(v11, "appendAttributedString:", v9);
      v12 = objc_msgSend(v11, "copy");

      v9 = (id)v12;
    }
    else
    {
      v11 = v9;
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
    }

  }
  -[ICCreateHTMLNoteAction context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__ICCreateHTMLNoteAction_performWithTitle_contents_error___block_invoke;
  v19[3] = &unk_1E5C24398;
  v14 = v9;
  v20 = v14;
  v21 = self;
  v15 = v10;
  v22 = v15;
  v23 = &v31;
  v24 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v19);

  if (a5)
  {
    v16 = (void *)v32[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __58__ICCreateHTMLNoteAction_performWithTitle_contents_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  int v16;
  id obj;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = *MEMORY[0x1E0DC1148];
    v3 = *MEMORY[0x1E0DC1128];
    v18[0] = *MEMORY[0x1E0DC1118];
    v18[1] = v3;
    v19[0] = v2;
    v19[1] = &unk_1E5C71B38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataFromRange:documentAttributes:error:", 0, objc_msgSend(*(id *)(a1 + 32), "length"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "newlyAddedNote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCreationDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "setModificationDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStore:", v10);

  objc_msgSend(v9, "setContent:", v6);
  objc_msgSend(*(id *)(a1 + 32), "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICNoteTitleFromPlainText();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v12);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v15 + 40);
  v16 = objc_msgSend(v14, "save:", &obj);
  objc_storeStrong((id *)(v15 + 40), obj);

  if (v16)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);

}

- (ICLegacyContext)context
{
  return self->_context;
}

- (ICLegacyFolder)folder
{
  return self->_folder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
