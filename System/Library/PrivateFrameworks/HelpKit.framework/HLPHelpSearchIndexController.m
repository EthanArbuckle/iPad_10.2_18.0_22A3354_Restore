@implementation HLPHelpSearchIndexController

- (void)dealloc
{
  objc_super v3;

  -[HLPHelpSearchIndexController cancelSpotlightSearch](self, "cancelSpotlightSearch");
  v3.receiver = self;
  v3.super_class = (Class)HLPHelpSearchIndexController;
  -[HLPRemoteDataController dealloc](&v3, sel_dealloc);
}

- (void)setUseCSSearch:(BOOL)a3
{
  CSPrivateSearchableIndex *privateSearchableIndex;
  CSPrivateSearchableIndex *v5;

  if (self->_useCSSearch != a3)
  {
    self->_useCSSearch = a3;
    privateSearchableIndex = self->_privateSearchableIndex;
    if (a3)
    {
      if (privateSearchableIndex)
        return;
      objc_msgSend(MEMORY[0x24BDC2440], "defaultSearchableIndex");
      v5 = (CSPrivateSearchableIndex *)objc_claimAutoreleasedReturnValue();
      privateSearchableIndex = self->_privateSearchableIndex;
    }
    else
    {
      v5 = 0;
    }
    self->_privateSearchableIndex = v5;

  }
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  +[HLPCommonDefines assetRequestHeaderFields](HLPCommonDefines, "assetRequestHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPRemoteDataController setHeaderFields:](self, "setHeaderFields:", v10);

  v11.receiver = self;
  v11.super_class = (Class)HLPHelpSearchIndexController;
  -[HLPRemoteDataController fetchDataWithDataType:identifier:completionHandler:](&v11, sel_fetchDataWithDataType_identifier_completionHandler_, a3, v9, v8);

}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  void (**v4)(id, BOOL, id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, BOOL, id, _QWORD))a3;
  v5 = (void *)MEMORY[0x24BDBCE50];
  -[HLPRemoteDataController URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  -[HLPHelpSearchIndexController processData:formattedData:](self, "processData:formattedData:", v7, v8);
  v4[2](v4, v8 != 0, v9, 0);

}

- (void)processData:(id)a3 formattedData:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (-[HLPHelpBookController isSemanticHTML](self->_helpBookController, "isSemanticHTML"))
    {
      -[HLPHelpSearchIndexController setSearchIndex:](self, "setSearchIndex:", v6);
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke;
      v15[3] = &unk_24D32EA48;
      v16 = v8;
      v9 = v8;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpSearchIndexController setSearchIndex:](self, "setSearchIndex:", v10);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_initWeak(&location, self);
      dispatch_get_global_queue(0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_3;
      v11[3] = &unk_24D32EAB8;
      objc_copyWeak(&v13, &location);
      v12 = v5;
      dispatch_async(v7, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2;
  v9[3] = &unk_24D32EA20;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  HLPHelpSearchResult *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(HLPHelpSearchResult);
  -[HLPHelpSearchResult setIdentifier:](v8, "setIdentifier:", v6);

  v7 = objc_msgSend(v5, "integerValue");
  -[HLPHelpSearchResult setWeight:](v8, "setWeight:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hpd_decompressedDataUsingAlgorithm:", 2049);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDD1620];
      _allowedClassesForIndexArchive();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v6, &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v5 = (void *)objc_msgSend(v9, "mutableCopy");

      if (v5)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CS_INDEXABLE_ITEMS"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        HLPLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_2153AA000, v12, OS_LOG_TYPE_DEFAULT, "Unable to achive search index file. %@", buf, 0xCu);
        }

        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v11, "count"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_33;
      block[3] = &unk_24D32EA90;
      block[4] = WeakRetained;
      v14 = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_33(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "privateSearchableIndex");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexSearchableItems:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_1);

}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_34()
{
  NSObject *v0;

  HLPLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_34_cold_1(v0);

}

- (id)searchTermsForSearchText:(id)a3 localeCode:(id)a4
{
  __CFString *v5;
  const __CFAllocator *v6;
  CFLocaleRef v7;
  __CFStringTokenizer *v8;
  void *v9;
  char v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFRange v17;
  CFRange CurrentTokenRange;

  v5 = (__CFString *)a3;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFLocaleIdentifier)a4);
  if (!MEMORY[0x2199E0194]())
  {
    CFRelease(v7);
    v7 = CFLocaleCopyCurrent();
  }
  v17.length = -[__CFString length](v5, "length");
  v17.location = 0;
  v8 = CFStringTokenizerCreate(v6, v5, v17, 4uLL, v7);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  if (CFStringTokenizerAdvanceToNextToken(v8))
  {
    v10 = 0;
    do
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
      v11 = (id)CFStringCreateWithSubstring(v6, v5, CurrentTokenRange);
      if (-[__CFString length](v11, "length"))
      {
        if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("-")))
        {
          objc_msgSend(v9, "lastObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingString:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "removeLastObject");
          objc_msgSend(v9, "addObject:", v13);

          v10 = 1;
        }
        else if (-[__CFString length](v11, "length") != 1
               || (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR(" ")) & 1) == 0)
        {
          if ((v10 & 1) != 0)
          {
            objc_msgSend(v9, "lastObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringByAppendingString:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "removeLastObject");
            objc_msgSend(v9, "addObject:", v15);

          }
          else
          {
            objc_msgSend(v9, "addObject:", v11);
          }
          v10 = 0;
        }
      }
      CFRelease(v11);

    }
    while (CFStringTokenizerAdvanceToNextToken(v8));
  }
  CFRelease(v8);
  CFRelease(v7);

  return v9;
}

- (id)resultsWithSearchText:(id)a3 localeCode:(id)a4 searchTerms:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];

  v51[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v50 = (id)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)MEMORY[0x24BDBCEB8];
    -[HLPHelpSearchIndexController searchTermsForSearchText:localeCode:](self, "searchTermsForSearchText:localeCode:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HLPHelpBookController isSemanticHTML](self->_helpBookController, "isSemanticHTML"))
    {
      v13 = MEMORY[0x24BDAC760];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke;
      v44[3] = &unk_24D32EAE0;
      v44[4] = self;
      v44[5] = &v45;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v44);
      if (objc_msgSend((id)v46[5], "count"))
      {
        objc_msgSend((id)v46[5], "keysSortedByValueUsingComparator:", &__block_literal_global_44);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v13;
        v42[1] = 3221225472;
        v42[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_3;
        v42[3] = &unk_24D32E958;
        v42[4] = self;
        v15 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
        v43 = v15;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v42);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v12);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqualToString:", CFSTR(" ")) & 1) != 0)
      {
        v31 = 0;
      }
      else
      {
        objc_msgSend(v12, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_4;
      v40[3] = &unk_24D32E958;
      v40[4] = self;
      v17 = v12;
      v41 = v17;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v40);
      if (v31)
      {
        -[HLPHelpSearchIndexController searchIndex](self, "searchIndex");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_5;
        v37[3] = &unk_24D32E958;
        v38 = v31;
        v39 = v17;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v37);

      }
      -[HLPHelpBookController copyrightTopicIdentifier](self->_helpBookController, "copyrightTopicIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_6;
      v34[3] = &unk_24D32EB70;
      v34[4] = self;
      v36 = &v45;
      v21 = v20;
      v35 = v21;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v34);
      if (objc_msgSend((id)v46[5], "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v46[5], "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("matchCount"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v23;
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("weight"), 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sortedArrayUsingDescriptors:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_8;
        v32[3] = &unk_24D32EB98;
        v32[4] = self;
        v28 = v27;
        v33 = v28;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v32);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }

    }
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v45, 8);

  return v16;
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "length"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "searchIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchTree:forQueryWord:withMaxDepth:", v4, v9, 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "mergeDictionary:withDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 <= objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v4, "integerValue");
    v7 = v8 < objc_msgSend(v5, "integerValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "helpBookController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "helpItemForID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);

}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  _QWORD v10[4];
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "searchIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v6, "mutableCopy");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_7;
  v10[3] = &unk_24D32EB48;
  v8 = *(_OWORD *)(a1 + 40);
  v7 = (id)v8;
  v11 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_msgSend(v9, "setWeight:", -1);
    v7 = v9;
    v8 = -1;
LABEL_6:
    objc_msgSend(v7, "setMatchCount:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, v3);
    goto LABEL_7;
  }
  v7 = v9;
  if (!v4)
  {
    v8 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "setWeight:", objc_msgSend(v4, "weight") + objc_msgSend(v9, "weight"));
  objc_msgSend(v4, "setMatchCount:", objc_msgSend(v4, "matchCount") + 1);
LABEL_7:

}

void __77__HLPHelpSearchIndexController_resultsWithSearchText_localeCode_searchTerms___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "helpBookController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "helpItemForID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v7 = v8;
  }

}

- (id)searchTree:(id)a3 forQueryWord:(id)a4 withMaxDepth:(int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "substringWithRange:", 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "substringFromIndex:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length") == 1)
        -[HLPHelpSearchIndexController getAllIdentifiersFromTree:withMaxDepth:](self, "getAllIdentifiersFromTree:withMaxDepth:", v13, v5);
      else
        -[HLPHelpSearchIndexController searchTree:forQueryWord:withMaxDepth:](self, "searchTree:forQueryWord:withMaxDepth:", v13, v14, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)getAllIdentifiersFromTree:(id)a3 withMaxDepth:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = 0;
        v14 = (a4 - 1);
        do
        {
          -[HLPHelpSearchIndexController getAllIdentifiersFromTree:withMaxDepth:](self, "getAllIdentifiersFromTree:withMaxDepth:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HLPHelpSearchIndexController mergeDictionary:withDictionary:](self, "mergeDictionary:withDictionary:", v13, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "nextObject");
          v17 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v17;
          v13 = v16;
        }
        while (v17);
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("$"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[HLPHelpSearchIndexController mergeDictionary:withDictionary:](self, "mergeDictionary:withDictionary:", v16, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v20;
    }
    v18 = v16;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)mergeDictionary:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __63__HLPHelpSearchIndexController_mergeDictionary_withDictionary___block_invoke;
      v10[3] = &unk_24D32EBC0;
      v5 = v5;
      v11 = v5;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
    else
    {
      v5 = (id)objc_msgSend(v6, "mutableCopy");
    }
  }
  v8 = v5;

  return v8;
}

void __63__HLPHelpSearchIndexController_mergeDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v10 = objc_msgSend(v5, "integerValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v10 + v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v12);
  }

}

+ (id)_stopwordsForLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HLPHelpSearchIndexController__stopwordsForLanguage___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_stopwordsForLanguage__pred == -1)
  {
    if (v4)
      goto LABEL_3;
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  dispatch_once(&_stopwordsForLanguage__pred, block);
  if (!v5)
    goto LABEL_10;
LABEL_3:
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend((id)_stopwordsForLanguage__stopwordsCache, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  if (!v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend((id)_stopwordsForLanguage__stopwordsDictionary, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v5, "length") >= 3)
    {
      objc_msgSend(v5, "substringToIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend((id)_stopwordsForLanguage__stopwordsDictionary, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    if (v7)
    {
      v14 = v6;
      objc_sync_enter(v14);
      objc_msgSend((id)_stopwordsForLanguage__stopwordsCache, "setObject:forKeyedSubscript:", v7, v5);
      objc_sync_exit(v14);

    }
  }
LABEL_11:

  return v7;
}

void __54__HLPHelpSearchIndexController__stopwordsForLanguage___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("stopwords"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithContentsOfFile:", v2);
  v4 = (void *)_stopwordsForLanguage__stopwordsDictionary;
  _stopwordsForLanguage__stopwordsDictionary = v3;

  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)_stopwordsForLanguage__stopwordsDictionary, "count"));
  v7 = (void *)_stopwordsForLanguage__stopwordsCache;
  _stopwordsForLanguage__stopwordsCache = v6;

}

- (id)_strippedSearchTermFromSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1638], "dominantLanguageForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("und")) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_stopwordsForLanguage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[HLPHelpSearchIndexController _tokenizeSearchTerm:](self, "_tokenizeSearchTerm:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __66__HLPHelpSearchIndexController__strippedSearchTermFromSearchTerm___block_invoke;
  v19 = &unk_24D32EC08;
  v20 = v7;
  v21 = v6;
  v22 = v10;
  v23 = v9;
  v11 = v10;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "), v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __66__HLPHelpSearchIndexController__strippedSearchTermFromSearchTerm___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  if (*(_QWORD *)(a1 + 56) == a3
    || (v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8), v6 = v8, (v5 & 1) == 0)
    && (!objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("en"))
     || (v7 = objc_msgSend(v8, "length"), v6 = v8, v7 >= 3)))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
    v6 = v8;
  }

}

- (id)_tokenizeSearchTerm:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  if (_tokenizeSearchTerm__onceToken != -1)
    dispatch_once(&_tokenizeSearchTerm__onceToken, &__block_literal_global_67);
  v4 = (void *)objc_opt_new();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  objc_msgSend(v3, "lowercaseString");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)_tokenizeSearchTerm__doNotSplitList;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_2;
  v21[3] = &unk_24D32EC30;
  v23 = &v24;
  v7 = v4;
  v22 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
  v8 = (void *)objc_opt_new();
  v9 = (void *)v25[5];
  v10 = objc_msgSend(v3, "length");
  v15 = v5;
  v16 = 3221225472;
  v17 = __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_3;
  v18 = &unk_24D32EC58;
  v11 = v7;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 1027, &v15);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke()
{
  void *v0;

  v0 = (void *)_tokenizeSearchTerm__doNotSplitList;
  _tokenizeSearchTerm__doNotSplitList = (uint64_t)&unk_24D33A4F0;

}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsString:"))
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByReplacingOccurrencesOfString:withString:", v7, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v3);
  }

}

void __52__HLPHelpSearchIndexController__tokenizeSearchTerm___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = v7;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

- (id)_csQueryStringForSearchTerm:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("**==\"%@*\"cdwt"), a3);
}

- (id)_rankingQueriesForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[16];

  v27[14] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = (void *)objc_opt_new();
  -[HLPHelpSearchIndexController _strippedSearchTermFromSearchTerm:](self, "_strippedSearchTermFromSearchTerm:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDC2290];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), *MEMORY[0x24BDC2290], v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  v7 = *MEMORY[0x24BDC1ED0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), *MEMORY[0x24BDC1ED0], v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  v8 = *MEMORY[0x24BDC1BE0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), *MEMORY[0x24BDC1BE0], v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  v9 = *MEMORY[0x24BDC1BE8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), *MEMORY[0x24BDC1BE8], v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v23;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v6, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v7, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v20;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v8, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v19;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v9, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v18;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), v7, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), v8, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@*\"cdwt"), v9, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v7, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v8, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v14;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"cdwt"), v9, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27[13] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v16);

  return v22;
}

- (id)_fetchAttributesForCSSearchQuery
{
  if (_fetchAttributesForCSSearchQuery_onceToken != -1)
    dispatch_once(&_fetchAttributesForCSSearchQuery_onceToken, &__block_literal_global_77);
  return (id)_fetchAttributesForCSSearchQuery_attributes;
}

void __64__HLPHelpSearchIndexController__fetchAttributesForCSSearchQuery__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[12];

  v5[11] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDC1DE8];
  v5[0] = *MEMORY[0x24BDC2390];
  v5[1] = v0;
  v1 = *MEMORY[0x24BDC1ED0];
  v5[2] = *MEMORY[0x24BDC1BE8];
  v5[3] = v1;
  v2 = *MEMORY[0x24BDC2010];
  v5[4] = *MEMORY[0x24BDC1BE0];
  v5[5] = v2;
  v5[6] = CFSTR("_kMDItemHelpTags");
  v5[7] = CFSTR("_kMDItemHelpIdentifier");
  v5[8] = CFSTR("_kMDItemHelpTitle");
  v5[9] = CFSTR("_kMDItemHelpSummary");
  v5[10] = CFSTR("_kMDItemHelpPath");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_fetchAttributesForCSSearchQuery_attributes;
  _fetchAttributesForCSSearchQuery_attributes = v3;

}

- (double)_relevanceScore:(double)a3 forRankingQueries:(id)a4
{
  return a3 / (exp2((double)(unint64_t)objc_msgSend(a4, "count")) + -1.0);
}

- (void)_hpdResultsFromCSSearchableItems:(id)a3 rankingQueries:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HLPHelpSearchIndexController__hpdResultsFromCSSearchableItems_rankingQueries___block_invoke;
  v9[3] = &unk_24D32ECA0;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __80__HLPHelpSearchIndexController__hpdResultsFromCSSearchableItems_rankingQueries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  HLPHelpSearchResult *v10;
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("_kMDItemHelpIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v13, "attributeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResultRelevance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)objc_msgSend(v6, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "_relevanceScore:forRankingQueries:", *(_QWORD *)(a1 + 40), v7);
    v9 = v8;
    v10 = objc_alloc_init(HLPHelpSearchResult);
    -[HLPHelpSearchResult setIdentifier:](v10, "setIdentifier:", v4);
    -[HLPHelpSearchResult setRelevanceScore:](v10, "setRelevanceScore:", v9);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "spotlightSearchScores");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

  }
}

- (NSArray)spotlightSearchResults
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray sortedArrayUsingComparator:](self->_spotlightSearchScores, "sortedArrayUsingComparator:", &__block_literal_global_80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[HLPHelpSearchIndexController helpBookController](self, "helpBookController", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "helpItemForID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

uint64_t __54__HLPHelpSearchIndexController_spotlightSearchResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "relevanceScore");
  v6 = v5;
  objc_msgSend(v4, "relevanceScore");
  v8 = v7;

  if (v6 < v8)
    return 1;
  else
    return -1;
}

- (void)cancelSpotlightSearch
{
  CSSearchQuery *spotlightSearchQuery;
  CSSearchQuery *v4;

  spotlightSearchQuery = self->_spotlightSearchQuery;
  if (spotlightSearchQuery)
  {
    -[CSSearchQuery setFoundItemsHandler:](spotlightSearchQuery, "setFoundItemsHandler:", 0);
    -[CSSearchQuery setCompletionHandler:](self->_spotlightSearchQuery, "setCompletionHandler:", 0);
    -[CSSearchQuery cancel](self->_spotlightSearchQuery, "cancel");
    v4 = self->_spotlightSearchQuery;
    self->_spotlightSearchQuery = 0;

    -[NSMutableArray removeAllObjects](self->_spotlightSearchScores, "removeAllObjects");
  }
}

- (void)CSSearchForSearchText:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *spotlightSearchScores;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CSSearchQuery *v19;
  CSSearchQuery *spotlightSearchQuery;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  -[HLPHelpSearchIndexController cancelSpotlightSearch](self, "cancelSpotlightSearch");
  if (!self->_spotlightSearchScores)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    spotlightSearchScores = self->_spotlightSearchScores;
    self->_spotlightSearchScores = v8;

  }
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("\\\\"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HLPHelpSearchIndexController _strippedSearchTermFromSearchTerm:](self, "_strippedSearchTermFromSearchTerm:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[HLPHelpSearchIndexController _csQueryStringForSearchTerm:](self, "_csQueryStringForSearchTerm:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@)"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HLPHelpSearchIndexController _rankingQueriesForSearchTerm:](self, "_rankingQueriesForSearchTerm:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  -[HLPHelpSearchIndexController _fetchAttributesForCSSearchQuery](self, "_fetchAttributesForCSSearchQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFetchAttributes:", v18);

  objc_msgSend(v17, "setRankingQueries:", v16);
  objc_initWeak(&location, self);
  v19 = (CSSearchQuery *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2438]), "initWithQueryString:queryContext:", v15, v17);
  spotlightSearchQuery = self->_spotlightSearchQuery;
  self->_spotlightSearchQuery = v19;

  -[CSSearchQuery setCompletionHandler:](self->_spotlightSearchQuery, "setCompletionHandler:", v7);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __72__HLPHelpSearchIndexController_CSSearchForSearchText_completionHandler___block_invoke;
  v22[3] = &unk_24D32ED08;
  objc_copyWeak(&v24, &location);
  v21 = v16;
  v23 = v21;
  -[CSSearchQuery setFoundItemsHandler:](self->_spotlightSearchQuery, "setFoundItemsHandler:", v22);
  -[CSSearchQuery start](self->_spotlightSearchQuery, "start");

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __72__HLPHelpSearchIndexController_CSSearchForSearchText_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_hpdResultsFromCSSearchableItems:rankingQueries:", v4, *(_QWORD *)(a1 + 32));

}

- (BOOL)useCSSearch
{
  return self->_useCSSearch;
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookController, a3);
}

- (NSDictionary)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndex, a3);
}

- (CSPrivateSearchableIndex)privateSearchableIndex
{
  return self->_privateSearchableIndex;
}

- (void)setPrivateSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_privateSearchableIndex, a3);
}

- (NSMutableArray)spotlightSearchScores
{
  return self->_spotlightSearchScores;
}

- (void)setSpotlightSearchScores:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightSearchScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightSearchScores, 0);
  objc_storeStrong((id *)&self->_privateSearchableIndex, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_spotlightSearchQuery, 0);
}

void __58__HLPHelpSearchIndexController_processData_formattedData___block_invoke_2_34_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2153AA000, log, OS_LOG_TYPE_DEBUG, "searchable items indexed", v1, 2u);
}

@end
