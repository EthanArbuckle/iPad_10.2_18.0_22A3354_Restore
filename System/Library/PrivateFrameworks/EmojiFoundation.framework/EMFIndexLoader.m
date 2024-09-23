@implementation EMFIndexLoader

+ (id)defaultIndexForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("term_index"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("document_index"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stemmedIndexForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("term_index_stemmed"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("document_index_stemmed"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_invertedIndexWithTermIndexURL:(id)a3 andDocumentIndexURL:(id)a4 fromBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  EMFInvertedIndex *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:].cold.1(v10);
    goto LABEL_10;
  }
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:].cold.2(v10);
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "_loadDictionaryResource:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_loadDictionaryResource:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:].cold.3();
  v13 = (void *)v12;
  if (!v12)
    +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:].cold.4();
  v14 = -[EMFInvertedIndex initWithTermIndex:andDocumentIndex:]([EMFInvertedIndex alloc], "initWithTermIndex:andDocumentIndex:", v11, v12);
  -[EMFInvertedIndex setTermIndexURL:](v14, "setTermIndexURL:", v8);
  -[EMFInvertedIndex setDocumentIndexURL:](v14, "setDocumentIndexURL:", v9);
  -[EMFInvertedIndex setAssetBundle:](v14, "setAssetBundle:", v10);
  objc_msgSend(a1, "_inferAndApplyStrategyToIndex:", v14);

LABEL_11:
  return v14;
}

+ (id)_loadDictionaryResource:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v15;

  v3 = a3;
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[EMFIndexLoader _loadDictionaryResource:].cold.2((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
      v13 = 0;
    }
    else
    {
      if (!v4)
        +[EMFIndexLoader _loadDictionaryResource:].cold.1();
      v13 = v4;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)_inferAndApplyStrategyToIndex:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[EMFIndexStrategyFactory inferStrategyForIndex:](EMFIndexStrategyFactory, "inferStrategyForIndex:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrategy:", v4);

}

+ (void)_invertedIndexWithTermIndexURL:(void *)a1 andDocumentIndexURL:fromBundle:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1B3DE1000, MEMORY[0x1E0C81028], v2, "Term index plist could not be found in bundle: '%@'.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_invertedIndexWithTermIndexURL:(void *)a1 andDocumentIndexURL:fromBundle:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1B3DE1000, MEMORY[0x1E0C81028], v2, "Document index plist could not be found in bundle: '%@'", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:.cold.3()
{
  __assert_rtn("+[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:]", "EMFIndexLoader.m", 57, "termIndex");
}

+ (void)_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:.cold.4()
{
  __assert_rtn("+[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:]", "EMFIndexLoader.m", 58, "documentIndex");
}

+ (void)_loadDictionaryResource:.cold.1()
{
  __assert_rtn("+[EMFIndexLoader _loadDictionaryResource:]", "EMFIndexLoader.m", 83, "dictionaryResource");
}

+ (void)_loadDictionaryResource:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B3DE1000, MEMORY[0x1E0C81028], a3, "Unable to deserialize search engine dictionary resource: '%@'", a5, a6, a7, a8, 2u);
}

@end
