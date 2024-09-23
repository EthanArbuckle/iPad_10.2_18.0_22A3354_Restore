@implementation ICEvernoteNoteParser

- (ICEvernoteNoteParser)init
{
  ICEvernoteNoteParser *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *parseQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICEvernoteNoteParser;
  v2 = -[ICEvernoteNoteParser init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.EvernoteNoteParser", v3);
    parseQueue = v2->_parseQueue;
    v2->_parseQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSURL)importDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D64240], "importDocumentsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Import"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  return (NSURL *)v4;
}

- (unint64_t)countEvernoteNotesFromBookmarkData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  -[ICEvernoteNoteParser parseFileAtBookmarkData:shouldCountOnly:](self, "parseFileAtBookmarkData:shouldCountOnly:", v4, 1);
  v6 = -[ICEvernoteNoteParser noteCount](self, "noteCount");
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)archiveItemsFromBookmarkData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[ICEvernoteNoteParser setImportItems:](self, "setImportItems:", v8);

  -[ICEvernoteNoteParser parseFileAtBookmarkData:shouldCountOnly:](self, "parseFileAtBookmarkData:shouldCountOnly:", v7, 0);
  if (a4)
  {
    -[ICEvernoteNoteParser parseError](self, "parseError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ICEvernoteNoteParser parseError](self, "parseError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return -[ICEvernoteNoteParser importItems](self, "importItems");
}

- (id)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4
{
  id v6;
  void *v7;
  ICEvernoteNote *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v9 = a3;
    -[ICEvernoteNoteParser importDirectory](self, "importDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if (v14)
    {
      objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v7, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

      if (v18)
      {
        v31 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v15, 1, &v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v31;
        if (v19)
        {
          v30 = 0;
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v19, &v30);
          v22 = v30;
          if (v22)
          {
            v23 = os_log_create("com.apple.notes", "Import");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:].cold.3();

          }
          v8 = -[ICEvernoteNote initWithCoder:]([ICEvernoteNote alloc], "initWithCoder:", v21);

        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:].cold.2();
          v8 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v20;
        v25 = objc_msgSend(v24, "removeItemAtURL:error:", v15, &v29);
        v26 = v29;

        if ((v25 & 1) == 0)
        {
          v27 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:].cold.1(v26, v27);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4
{
  id v6;
  void *v7;
  ICEvernoteResource *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v9 = a3;
    -[ICEvernoteNoteParser importDirectory](self, "importDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if (v14)
    {
      objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v7, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

      if (v18)
      {
        v31 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v15, 1, &v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v31;
        if (v19)
        {
          v30 = 0;
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v19, &v30);
          v22 = v30;
          if (v22)
          {
            v23 = os_log_create("com.apple.notes", "Import");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[ICEvernoteNoteParser unarchiveEvernoteNoteFromArchiveId:noteArchiveId:].cold.3();

          }
          v8 = -[ICEvernoteResource initWithCoder:]([ICEvernoteResource alloc], "initWithCoder:", v21);

        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ICEvernoteNoteParser unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:].cold.2();
          v8 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v20;
        v25 = objc_msgSend(v24, "removeItemAtURL:error:", v15, &v29);
        v26 = v29;

        if ((v25 & 1) == 0)
        {
          v27 = os_log_create("com.apple.notes", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[ICEvernoteNoteParser unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:].cold.1(v26, v27);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)cleanupArchiveId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  -[ICEvernoteNoteParser importDirectory](self, "importDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v10, "removeItemAtURL:error:", v6, &v13);
    v11 = v13;

    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ICEvernoteNoteParser cleanupArchiveId:].cold.1(v11, v12);

    }
  }

}

- (void)parserDidEndDocument:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ICEvernoteNoteParser parseQueue](self, "parseQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICEvernoteNoteParser_parserDidEndDocument___block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __45__ICEvernoteNoteParser_parserDidEndDocument___block_invoke(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "parseSemaphore");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v1);

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICEvernoteNoteParser *v10;

  v5 = a4;
  -[ICEvernoteNoteParser parseQueue](self, "parseQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke;
  v8[3] = &unk_1E76C73B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "setParseError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "parseSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a4;
  -[ICEvernoteNoteParser parseQueue](self, "parseQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__ICEvernoteNoteParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
  v11[3] = &unk_1E76C73B0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

void __85__ICEvernoteNoteParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ICEvernoteNote *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICEvernoteResource *v12;
  id v13;

  v2 = (void *)MEMORY[0x1C3B7AC74]();
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldCountOnly") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCurrentNote") & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "contentLevel"))
    {
      objc_msgSend(*(id *)(a1 + 32), "contentString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bufferString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v4);

    }
    objc_msgSend(*(id *)(a1 + 40), "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("note")))
    {
      objc_msgSend(*(id *)(a1 + 32), "setShouldIgnoreCurrentNote:", 0);
      v6 = objc_alloc_init(ICEvernoteNote);
      objc_msgSend(*(id *)(a1 + 32), "setCurrentNote:", v6);

      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "setCurrentImportItem:", v7);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "currentImportItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("archiveId"));

      objc_msgSend(*(id *)(a1 + 32), "importDirectoryURLWithImportIdentifier:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCurrentImportDirectory:", v11);

    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("content")))
      {
        objc_msgSend(*(id *)(a1 + 32), "setContentLevel:", 0);
        v12 = (ICEvernoteResource *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(*(id *)(a1 + 32), "setContentString:", v12);
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("resource")))
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "contentLevel") & 0x8000000000000000) == 0)
            objc_msgSend(*(id *)(a1 + 32), "setContentLevel:", objc_msgSend(*(id *)(a1 + 32), "contentLevel") + 1);
          goto LABEL_12;
        }
        v12 = objc_alloc_init(ICEvernoteResource);
        objc_msgSend(*(id *)(a1 + 32), "setCurrentResource:", v12);
      }

    }
LABEL_12:
    v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(*(id *)(a1 + 32), "setBufferString:", v13);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ICEvernoteNoteParser parseQueue](self, "parseQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__ICEvernoteNoteParser_parser_foundCharacters___block_invoke;
  v8[3] = &unk_1E76C73B0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __47__ICEvernoteNoteParser_parser_foundCharacters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1C3B7AC74]();
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldCountOnly") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCurrentNote") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bufferString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", *(_QWORD *)(a1 + 40));

  }
  objc_autoreleasePoolPop(v2);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICEvernoteNoteParser *v12;

  v7 = a4;
  -[ICEvernoteNoteParser parseQueue](self, "parseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke;
  v10[3] = &unk_1E76C73B0;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  int v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;

  v2 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "shouldCountOnly");
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("note"));
  if (v4)
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "setNoteCount:", objc_msgSend(*(id *)(a1 + 40), "noteCount") + 1);
    goto LABEL_22;
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreCurrentNote");
      v8 = *(void **)(a1 + 40);
      if ((v7 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "currentImportItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("archiveId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "cleanupArchiveId:", v10);
        objc_msgSend(*(id *)(a1 + 40), "setShouldIgnoreCurrentNote:", 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "currentNote");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "archiveEvernoteNote:", v21);

        objc_msgSend(*(id *)(a1 + 40), "notes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "currentNote");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v22);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setCurrentNote:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentImportItem:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentImportDirectory:", 0);
    goto LABEL_19;
  }
  v11 = objc_msgSend(v3, "isEqualToString:", CFSTR("title"));
  v12 = *(void **)(a1 + 40);
  if (v11)
  {
    objc_msgSend(v12, "bufferString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v14);
    goto LABEL_10;
  }
  if ((objc_msgSend(v12, "shouldIgnoreCurrentNote") & 1) != 0)
    goto LABEL_22;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("created")))
  {
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v16, "bufferString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v16, "dateFromDateString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCreated:", v19);
LABEL_25:

    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("updated")))
  {
    v23 = *(void **)(a1 + 40);
    objc_msgSend(v23, "bufferString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v23, "dateFromDateString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUpdated:", v19);
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tag")))
  {
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tags");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bufferString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject arrayByAddingObject:](v14, "arrayByAddingObject:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTags:", v24);

  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("content")))
  {
    objc_msgSend(*(id *)(a1 + 40), "contentString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bufferString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendString:", v27);

    objc_msgSend(*(id *)(a1 + 40), "contentString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    objc_msgSend(*(id *)(a1 + 40), "currentNote");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContent:", v14);
  }
  else
  {
    v28 = objc_msgSend(v3, "isEqualToString:", CFSTR("resource"));
    v29 = *(void **)(a1 + 40);
    objc_msgSend(v29, "currentResource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v28)
    {
      objc_msgSend(v29, "archiveEvernoteResource:", v30);

      objc_msgSend(*(id *)(a1 + 40), "setCurrentResource:", 0);
      goto LABEL_19;
    }

    if (!v31)
      goto LABEL_19;
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mime")))
    {
      objc_msgSend(*(id *)(a1 + 40), "bufferString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentResource");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setMime:](v14, "setMime:", v13);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("width")))
    {
      objc_msgSend(*(id *)(a1 + 40), "bufferString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (double)objc_msgSend(v13, "integerValue");
      objc_msgSend(*(id *)(a1 + 40), "currentResource");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setImageWidth:](v14, "setImageWidth:", v32);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("height")))
    {
      objc_msgSend(*(id *)(a1 + 40), "bufferString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (double)objc_msgSend(v13, "integerValue");
      objc_msgSend(*(id *)(a1 + 40), "currentResource");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setImageHeight:](v14, "setImageHeight:", v33);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("duration")))
    {
      objc_msgSend(*(id *)(a1 + 40), "bufferString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v35 = v34;
      objc_msgSend(*(id *)(a1 + 40), "currentResource");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setDuration:](v14, "setDuration:", v35);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("file-name")))
    {
      objc_msgSend(*(id *)(a1 + 40), "bufferString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentResource");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setFileName:](v14, "setFileName:", v13);
      goto LABEL_11;
    }
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("data")))
      goto LABEL_19;
    v36 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(*(id *)(a1 + 40), "bufferString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v36, "initWithBase64EncodedString:options:", v37, 1);

    if (!v13)
    {
      v14 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_1(v14);
      goto LABEL_11;
    }
    +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "maximumAttachmentSizeMB");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedLongLongValue");

    if (objc_msgSend(v13, "length") > (unint64_t)(v40 << 20))
    {
      v41 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_2(v13, v40 << 20, v41);

      objc_msgSend(*(id *)(a1 + 40), "setShouldIgnoreCurrentNote:", 1);
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "currentResource");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setData:", v13);

    objc_msgSend(v13, "ic_md5");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentResource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMd5Hash:", v14);
  }
LABEL_10:

LABEL_11:
LABEL_12:

LABEL_19:
  if ((objc_msgSend(*(id *)(a1 + 40), "contentLevel") & 0x8000000000000000) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setContentLevel:", objc_msgSend(*(id *)(a1 + 40), "contentLevel") - 1);
  objc_msgSend(*(id *)(a1 + 40), "setBufferString:", 0);
LABEL_22:

  objc_autoreleasePoolPop(v2);
}

- (void)parseFileAtBookmarkData:(id)a3 shouldCountOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  ICEvernoteNoteParser *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  -[ICEvernoteNoteParser setShouldCountOnly:](self, "setShouldCountOnly:", v4);
  -[ICEvernoteNoteParser setShouldIgnoreCurrentNote:](self, "setShouldIgnoreCurrentNote:", 0);
  -[ICEvernoteNoteParser setContentLevel:](self, "setContentLevel:", -1);
  -[ICEvernoteNoteParser setNoteCount:](self, "setNoteCount:", 0);
  -[ICEvernoteNoteParser setParseError:](self, "setParseError:", 0);
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v6, 256, 0, 0, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v16;
  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICEvernoteNoteParser parseFileAtBookmarkData:shouldCountOnly:].cold.1(v8, v9);

  }
  else
  {
    v10 = dispatch_semaphore_create(0);
    -[ICEvernoteNoteParser setParseSemaphore:](self, "setParseSemaphore:", v10);

    -[ICEvernoteNoteParser parseQueue](self, "parseQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICEvernoteNoteParser_parseFileAtBookmarkData_shouldCountOnly___block_invoke;
    block[3] = &unk_1E76C73B0;
    v14 = v7;
    v15 = self;
    dispatch_async(v11, block);

    -[ICEvernoteNoteParser parseSemaphore](self, "parseSemaphore");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    v9 = v14;
  }

}

void __64__ICEvernoteNoteParser_parseFileAtBookmarkData_shouldCountOnly___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithStream:", v3);
  objc_msgSend(v2, "setShouldResolveExternalEntities:", 0);
  objc_msgSend(v2, "setShouldProcessNamespaces:", 1);
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "parse");

}

- (void)archiveEvernoteNote:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    v5 = a3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICEvernoteNoteParser currentImportDirectory](self, "currentImportDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v5, "encodeWithCoder:", v10);

    objc_msgSend(v10, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v12 = objc_msgSend(v11, "writeToURL:options:error:", v9, 2, &v18);
    v13 = v18;
    if ((v12 & 1) != 0)
    {
      -[ICEvernoteNoteParser currentImportItem](self, "currentImportItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("noteId"));

      -[ICEvernoteNoteParser importItems](self, "importItems");
      v15 = objc_claimAutoreleasedReturnValue();
      -[ICEvernoteNoteParser currentImportItem](self, "currentImportItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      -[NSObject addObject:](v15, "addObject:", v17);

    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICEvernoteNoteParser archiveEvernoteNote:].cold.1();
    }

  }
}

- (void)archiveEvernoteResource:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    v5 = a3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICEvernoteNoteParser currentImportDirectory](self, "currentImportDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v5, "encodeWithCoder:", v10);

    objc_msgSend(v10, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = objc_msgSend(v11, "writeToURL:options:error:", v9, 2, &v17);
    v13 = v17;
    if ((v12 & 1) != 0)
    {
      -[ICEvernoteNoteParser currentImportItem](self, "currentImportItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("resourceIds"));
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSObject addObject:](v15, "addObject:", v7);
      -[ICEvernoteNoteParser currentImportItem](self, "currentImportItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("resourceIds"));

    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Import");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICEvernoteNoteParser archiveEvernoteResource:].cold.1();
    }

  }
}

- (id)importDirectoryURLWithImportIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  -[ICEvernoteNoteParser importDirectory](self, "importDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v11);
  v8 = v11;

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICEvernoteNoteParser importDirectoryURLWithImportIdentifier:].cold.1(v8, v9);

  }
  return v6;
}

- (id)dateFromDateString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)dateFromDateString__dateFormatter;
  if (!dateFromDateString__dateFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)dateFromDateString__dateFormatter;
    dateFromDateString__dateFormatter = (uint64_t)v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend((id)dateFromDateString__dateFormatter, "setLocale:", v7);
    v8 = (void *)dateFromDateString__dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v9);

    objc_msgSend((id)dateFromDateString__dateFormatter, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss'Z'"));
    v4 = (void *)dateFromDateString__dateFormatter;
  }
  objc_msgSend(v4, "dateFromString:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldCountOnly
{
  return self->_shouldCountOnly;
}

- (void)setShouldCountOnly:(BOOL)a3
{
  self->_shouldCountOnly = a3;
}

- (BOOL)shouldIgnoreCurrentNote
{
  return self->_shouldIgnoreCurrentNote;
}

- (void)setShouldIgnoreCurrentNote:(BOOL)a3
{
  self->_shouldIgnoreCurrentNote = a3;
}

- (unint64_t)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(unint64_t)a3
{
  self->_noteCount = a3;
}

- (OS_dispatch_queue)parseQueue
{
  return self->_parseQueue;
}

- (void)setParseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_parseQueue, a3);
}

- (OS_dispatch_semaphore)parseSemaphore
{
  return self->_parseSemaphore;
}

- (void)setParseSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_parseSemaphore, a3);
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void)setParseError:(id)a3
{
  objc_storeStrong((id *)&self->_parseError, a3);
}

- (NSMutableString)bufferString
{
  return self->_bufferString;
}

- (void)setBufferString:(id)a3
{
  objc_storeStrong((id *)&self->_bufferString, a3);
}

- (int64_t)contentLevel
{
  return self->_contentLevel;
}

- (void)setContentLevel:(int64_t)a3
{
  self->_contentLevel = a3;
}

- (NSMutableString)contentString
{
  return self->_contentString;
}

- (void)setContentString:(id)a3
{
  objc_storeStrong((id *)&self->_contentString, a3);
}

- (NSMutableArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (ICEvernoteNote)currentNote
{
  return self->_currentNote;
}

- (void)setCurrentNote:(id)a3
{
  objc_storeStrong((id *)&self->_currentNote, a3);
}

- (ICEvernoteResource)currentResource
{
  return self->_currentResource;
}

- (void)setCurrentResource:(id)a3
{
  objc_storeStrong((id *)&self->_currentResource, a3);
}

- (NSURL)currentImportDirectory
{
  return self->_currentImportDirectory;
}

- (void)setCurrentImportDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_currentImportDirectory, a3);
}

- (NSMutableDictionary)currentImportItem
{
  return self->_currentImportItem;
}

- (void)setCurrentImportItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentImportItem, a3);
}

- (NSMutableArray)importItems
{
  return self->_importItems;
}

- (void)setImportItems:(id)a3
{
  objc_storeStrong((id *)&self->_importItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importItems, 0);
  objc_storeStrong((id *)&self->_currentImportItem, 0);
  objc_storeStrong((id *)&self->_currentImportDirectory, 0);
  objc_storeStrong((id *)&self->_currentResource, 0);
  objc_storeStrong((id *)&self->_currentNote, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_bufferString, 0);
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_parseSemaphore, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
}

- (void)unarchiveEvernoteNoteFromArchiveId:(void *)a1 noteArchiveId:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error removing note: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)unarchiveEvernoteNoteFromArchiveId:noteArchiveId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error loading Evernote note: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)unarchiveEvernoteNoteFromArchiveId:noteArchiveId:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error creating unarchiver: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)unarchiveEvernoteResourceFromArchiveId:(void *)a1 resourceArchiveId:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error removing resource: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error loading Evernote resource: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)cleanupArchiveId:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error cleaning up archive: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

void __50__ICEvernoteNoteParser_parser_parseErrorOccurred___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error occurred during parsing: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Couldn't decode data.", v1, 2u);
}

void __72__ICEvernoteNoteParser_parser_didEndElement_namespaceURI_qualifiedName___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(a1, "length"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Attachment size (%@) is greater then our max (%@)", (uint8_t *)&v7, 0x16u);

}

- (void)parseFileAtBookmarkData:(void *)a1 shouldCountOnly:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error retrieving URL from bookmark data: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)archiveEvernoteNote:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Couldn't archive evernote note for import: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)archiveEvernoteResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Couldn't archive evernote resource for import: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)importDirectoryURLWithImportIdentifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Error creating import directory: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

@end
