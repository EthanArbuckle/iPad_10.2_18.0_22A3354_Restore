@implementation AMDMegadomeTest

+ (id)testMegadome:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id obj;
  id v10;
  id v11;
  int v12;
  id location[2];
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = (id)objc_msgSend(location[0], "objectForKey:", TEST_API);

  if (v8)
  {
    v15 = (id)objc_msgSend(v14, "testAPI");
    v12 = 1;
  }
  else
  {
    v11 = 0;
    v7 = (id)objc_msgSend(location[0], "objectForKey:", TEST_JS_HANDLER);

    if (v7)
    {
      v6 = (id)objc_msgSend(location[0], "objectForKey:", TEST_JS_HANDLER);
      obj = v11;
      v5 = +[AMDMegadomeIntegration handleJSRequest:error:](AMDMegadomeIntegration, "handleJSRequest:error:");
      objc_storeStrong(&v11, obj);
      v10 = v5;

      if (v11)
      {
        v16 = CFSTR("error");
        v4 = (id)objc_msgSend(v11, "localizedDescription");
        v17[0] = v4;
        v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);

      }
      else
      {
        v15 = v10;
      }
      v12 = 1;
      objc_storeStrong(&v10, 0);
    }
    else
    {
      v15 = &unk_1EA4D1320;
      v12 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(location, 0);
  return v15;
}

+ (id)testAPI
{
  id v3;
  id v4[2];
  id v5;

  v5 = a1;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NSLog(CFSTR("In Megadome API test"));
  objc_msgSend(v5, "testSingleView:summary:", 0x1EA4B7728, v4[0]);
  objc_msgSend(v5, "testSingleView:summary:", 0x1EA4B7768, v4[0]);
  NSLog(CFSTR("Done Megadome API test"));
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

+ (void)testSingleView:(id)a3 summary:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v32;
  double v33;
  id v34;
  id v35;
  unsigned int v36;
  id v37;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;
  unsigned int v40;
  uint64_t v41;
  int v42;
  int v43;
  void (*v44)(_QWORD *, void *);
  void *v45;
  id v46[2];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  int v50;
  int v51;
  int v52;
  int v53;
  id v54;
  id v55;
  id v56;
  id v57;
  char v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id location[3];
  _QWORD v64[4];

  v64[3] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v62 = 0;
  objc_storeStrong(&v62, a4);
  NSLog(CFSTR("Listing view: %@"), location[0]);
  v61 = 0;
  v60 = 0;
  v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = 0;
  v57 = (id)objc_msgSend(getGDViewServiceClass_0(), "clientService");
  v56 = 0;
  if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4B7768) & 1) != 0)
  {
    v55 = v61;
    v30 = (id)objc_msgSend(v57, "firstPartyShortTermTopicViewWithError:", &v55);
    objc_storeStrong(&v61, v55);
    v4 = v56;
    v56 = v30;

  }
  else
  {
    if ((objc_msgSend(location[0], "isEqualToString:", 0x1EA4B7728) & 1) == 0)
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad view: %@"), location[0]);
      v7 = v60;
      v60 = v6;

      NSLog(CFSTR("%@"), v60);
      objc_msgSend(v59, "setObject:forKey:", v60, CFSTR("error"));
      v53 = 1;
      goto LABEL_19;
    }
    v54 = v61;
    v29 = (id)objc_msgSend(v57, "firstPartyLongTermTopicViewWithError:", &v54);
    objc_storeStrong(&v61, v54);
    v5 = v56;
    v56 = v29;

  }
  if (v61)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = location[0];
    v26 = (id)objc_msgSend(v61, "localizedDescription");
    v8 = (id)objc_msgSend(v27, "stringWithFormat:", CFSTR("Error obtaining viewProtocol for %@: %@"), v28, v26);
    v9 = v60;
    v60 = v8;

    NSLog(CFSTR("%@"), v60);
    objc_msgSend(v59, "setObject:forKey:", v60, CFSTR("error"));
    v53 = 1;
  }
  else
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x20000000;
    v51 = 32;
    v52 = 0;
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = v56;
    v41 = MEMORY[0x1E0C809B0];
    v42 = -1073741824;
    v43 = 0;
    v44 = __42__AMDMegadomeTest_testSingleView_summary___block_invoke;
    v45 = &unk_1EA4B5A40;
    v46[0] = v47;
    v46[1] = &v48;
    objc_msgSend(v25, "enumerateTopicsWithBlock:", &v41);
    objc_msgSend(v59, "setObject:forKey:", v47, CFSTR("iteratedData"));
    v24 = v59;
    v23 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v49 + 6));
    objc_msgSend(v24, "setObject:forKey:");

    NSLog(CFSTR("Found %u entries in view %@ using iterator"), *((unsigned int *)v49 + 6), location[0]);
    v22 = location[0];
    v21 = (id)objc_msgSend(v56, "databaseFilePath");
    NSLog(CFSTR("db path for view '%@': %@"), v22, v21);

    v40 = 0;
    ppDb = 0;
    v20 = (id)objc_msgSend(v56, "databaseFilePath");
    v40 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"), &ppDb, 65538, 0);

    if (v40)
    {
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MEGADOME DB loading failed: %d"), v40);
      v11 = v60;
      v60 = v10;

      NSLog(CFSTR("%@"), v60);
      objc_msgSend(v59, "setObject:forKey:", v60, CFSTR("SQLData"));
      v53 = 1;
    }
    else
    {
      NSLog(CFSTR("Loaded DB"));
      ppStmt = 0;
      v37 = CFSTR("SELECT topicId, score, most_recent_documentId FROM topics ORDER BY score DESC");
      v40 = sqlite3_prepare_v2(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"), -1, &ppStmt, 0);
      if (!v40 && ppStmt)
      {
        v36 = 0;
        v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        while (sqlite3_step(ppStmt) == 100)
        {
          v34 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
          v33 = 0.0;
          v33 = sqlite3_column_double(ppStmt, 1);
          v32 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 2));
          NSLog(CFSTR("topic id: %@, score: %f, docId: %@"), v34, *(_QWORD *)&v33, v32);
          v19 = v35;
          v64[0] = v34;
          v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v64[1] = v18;
          v64[2] = v32;
          v17 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
          objc_msgSend(v19, "addObject:");

          ++v36;
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v34, 0);
        }
        objc_msgSend(v59, "setObject:forKey:", v35, CFSTR("sqlData"));
        v16 = v59;
        v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36);
        objc_msgSend(v16, "setObject:forKey:");

        NSLog(CFSTR("Found %u entries in view %@ using SQL"), *((unsigned int *)v49 + 6), location[0]);
        objc_storeStrong(&v35, 0);
        v53 = 0;
      }
      else
      {
        v12 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MEGADOME Query prep failed: %d"), v40);
        v13 = v60;
        v60 = v12;

        NSLog(CFSTR("%@"), v60);
        objc_msgSend(v59, "setObject:forKey:", v60, CFSTR("sqlData"));
        v53 = 1;
      }
      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(v46, 0);
    objc_storeStrong(&v47, 0);
    _Block_object_dispose(&v48, 8);
  }
LABEL_19:
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  if (!v53)
    v53 = 0;
  v14 = v53;
  objc_msgSend(v62, "setObject:forKey:", v59, location[0]);
  if ((v58 & 1) != 0)
    objc_exception_rethrow();
  v53 = v14;
  if (v14)
  {
    if (v14 == 2)
    {
      __break(1u);
      JUMPOUT(0x1DC719B20);
    }
  }
  else
  {
    v53 = 0;
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
}

void __42__AMDMegadomeTest_testSingleView_summary___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = (id)objc_msgSend(location[0], "topicIdentifier");
  objc_msgSend(location[0], "topicScore");
  v3 = v2;
  v4 = (id)objc_msgSend(location[0], "mostRecentDocumentId");
  NSLog(CFSTR("topic id: %@, score: %f, docId: %@"), v5, v3, v4);

  v7 = (void *)a1[4];
  v11 = (id)objc_msgSend(location[0], "topicIdentifier");
  v14[0] = v11;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(location[0], "topicScore");
  v10 = (id)objc_msgSend(v6, "numberWithDouble:");
  v14[1] = v10;
  v9 = (id)objc_msgSend(location[0], "mostRecentDocumentId");
  v14[2] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  objc_msgSend(v7, "addObject:");

  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_storeStrong(location, 0);
}

@end
