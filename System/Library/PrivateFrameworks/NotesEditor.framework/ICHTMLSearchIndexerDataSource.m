@implementation ICHTMLSearchIndexerDataSource

void __55__ICHTMLSearchIndexerDataSource_App__mainThreadContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (_UIApplicationIsExtension())
  {
    v2 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
    if (!kICSearchTableRowAttribute_block_invoke_mainNoteContext)
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D629F0]), "initForMainContext");
      v4 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
      kICSearchTableRowAttribute_block_invoke_mainNoteContext = v3;

      v2 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
    }
    objc_msgSend(v2, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    -[objc_class sharedNotesApp](NSClassFromString(CFSTR("NotesApp")), "sharedNotesApp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "noteContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v7 = v12;
  }

}

@end
