@implementation ECMessageBodyParser

os_log_t ___ef_log_ECMessageBodyParser_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.email", "ECMessageBodyParser");
  _ef_log_ECMessageBodyParser_log = (uint64_t)result;
  return result;
}

+ (BOOL)cacheRetainsNodes
{
  return 0;
}

- (ECMessageBodyParser)init
{
  ECMessageBodyParser *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ECMessageBodyParser;
  v2 = -[ECMessageBodyParser init](&v4, sel_init);
  if (v2)
    v2->_elementPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  NSMutableArray *elementPool;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __CFArray *nodesStackCache;
  __CFDictionary *nodesLevelCache;
  __CFDictionary *nodesQuoteLevelCache;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  elementPool = self->_elementPool;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(elementPool);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setParser:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  nodesStackCache = self->_nodesStackCache;
  if (nodesStackCache)
    CFRelease(nodesStackCache);
  nodesLevelCache = self->_nodesLevelCache;
  if (nodesLevelCache)
    CFRelease(nodesLevelCache);
  nodesQuoteLevelCache = self->_nodesQuoteLevelCache;
  if (nodesQuoteLevelCache)
    CFRelease(nodesQuoteLevelCache);
  v11.receiver = self;
  v11.super_class = (Class)ECMessageBodyParser;
  -[ECMessageBodyParser dealloc](&v11, sel_dealloc);
}

- (BOOL)parse
{
  return 0;
}

- (BOOL)shouldProceedParsing
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyParser;
  v3 = -[ECMessageBodyParserObject shouldProceedParsing](&v5, sel_shouldProceedParsing);
  if (v3)
    LOBYTE(v3) = self->_parserError == 0;
  return v3;
}

- (NSError)parserError
{
  return self->_parserError;
}

- (id)newStringAccumulatorWithOptions:(unint64_t)a3 lengthLimit:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(-[ECMessageBodyParser messageBodyStringAccumulatorClass](self, "messageBodyStringAccumulatorClass")), "initWithOptions:lengthLimit:", -[ECMessageBodyParser messageBodyStringAccumulatorDefaultOptions](self, "messageBodyStringAccumulatorDefaultOptions") | a3, a4);
}

- (void)setFoundMessageBodyElementBlock:(id)a3
{
  self->_foundMessageBodyElementBlock = a3;
}

- (void)addSubparser:(id)a3
{
  NSMutableArray *subparsers;

  subparsers = self->_subparsers;
  if (!subparsers)
  {
    subparsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_subparsers = subparsers;
  }
  -[NSMutableArray addObject:](subparsers, "addObject:", a3);
}

- (void)removeSubparser:(id)a3
{
  -[NSMutableArray removeObject:](self->_subparsers, "removeObject:", a3);
}

- (id)getAvailableMessageBodyElement
{
  NSMutableArray *elementPool;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  elementPool = self->_elementPool;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(elementPool);
      v8 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);
      if (!objc_msgSend(v8, "isExternallyRetained"))
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    if (v8)
      return v8;
  }
LABEL_11:
  v8 = objc_alloc_init(-[ECMessageBodyParser messageBodyElementClass](self, "messageBodyElementClass"));
  objc_msgSend(v8, "setParser:", self);
  -[NSMutableArray addObject:](self->_elementPool, "addObject:", v8);

  return v8;
}

- (BOOL)isLandmarkTagName:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "compare:options:", CFSTR("div"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("p"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("br"), 3))
  {
    return objc_msgSend(a3, "compare:options:", CFSTR("blockquote"), 3) == 0;
  }
  return 1;
}

- (BOOL)shouldIgnoreTagWithTagName:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "compare:options:", CFSTR("title"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("script"), 3))
  {
    return objc_msgSend(a3, "compare:options:", CFSTR("style"), 3) == 0;
  }
  return 1;
}

+ (BOOL)isLinebreakImpliedBeforeTagName:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "compare:options:", CFSTR("div"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("p"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h1"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h2"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h3"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h4"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h5"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("h6"), 3))
  {
    return objc_msgSend(a3, "compare:options:", CFSTR("li"), 3) == 0;
  }
  return 1;
}

+ (BOOL)isLinebreakImpliedAfterTagName:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "compare:options:", CFSTR("div"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("br"), 3)
    && objc_msgSend(a3, "compare:options:", CFSTR("p"), 3))
  {
    return objc_msgSend(a3, "compare:options:", CFSTR("blockquote"), 3) == 0;
  }
  return 1;
}

- (Class)messageBodyStringAccumulatorClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)messageBodyStringAccumulatorDefaultOptions
{
  return 0;
}

- (Class)messageBodyElementClass
{
  -[ECMessageBodyParser doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECMessageBodyParser messageBodyElementClass]", "ECMessageBodyParser.m", 189, "0");
}

- (void)enqueueParagraphNode:(id)a3 withTagName:(id)a4
{
  NSMutableArray *paragraphNodes;

  if (objc_msgSend((id)objc_opt_class(), "isLinebreakImpliedBeforeTagName:", a4))
    -[ECMessageBodyParser flushParagraphNodes](self, "flushParagraphNodes");
  paragraphNodes = self->_paragraphNodes;
  if (!paragraphNodes)
  {
    paragraphNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_paragraphNodes = paragraphNodes;
  }
  -[NSMutableArray addObject:](paragraphNodes, "addObject:", a3);
  if (objc_msgSend((id)objc_opt_class(), "isLinebreakImpliedAfterTagName:", a4))
    -[ECMessageBodyParser flushParagraphNodes](self, "flushParagraphNodes");
}

- (void)flushParagraphNodes
{
  id v3;

  if (-[NSMutableArray count](self->_paragraphNodes, "count"))
  {
    v3 = -[ECMessageBodyParser getAvailableMessageBodyElement](self, "getAvailableMessageBodyElement");
    objc_msgSend(v3, "setNodes:", self->_paragraphNodes);
    -[ECMessageBodyParser didFindBodyElement:](self, "didFindBodyElement:", v3);
    -[NSMutableArray removeAllObjects](self->_paragraphNodes, "removeAllObjects");
  }
}

- (void)didFindBodyElement:(id)a3
{
  void (**foundMessageBodyElementBlock)(id, id);
  NSMutableArray *subparsers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  foundMessageBodyElementBlock = (void (**)(id, id))self->_foundMessageBodyElementBlock;
  if (foundMessageBodyElementBlock)
    foundMessageBodyElementBlock[2](foundMessageBodyElementBlock, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  subparsers = self->_subparsers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(subparsers);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "shouldProceedParsing"))
          objc_msgSend(v11, "messageBodyParser:foundMessageBodyElement:", self, a3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
}

- (void)willBeginParsing
{
  NSMutableArray *subparsers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ECMessageBodyParserObject messageBodyParserWillBeginParsing:](self, "messageBodyParserWillBeginParsing:", self);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  subparsers = self->_subparsers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(subparsers);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "messageBodyParserWillBeginParsing:", self);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)didFinishParsing
{
  NSMutableArray *subparsers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *elementPool;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  subparsers = self->_subparsers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(subparsers);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v8, "shouldProceedParsing"))
          objc_msgSend(v8, "messageBodyParserDidFinishParsing:", self);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subparsers, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  elementPool = self->_elementPool;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(elementPool);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "setParser:", 0);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elementPool, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  -[NSMutableArray removeAllObjects](self->_elementPool, "removeAllObjects");
}

- (void)didFindError:(id)a3
{
  NSObject *v5;

  if (_ef_log_ECMessageBodyParser_onceToken != -1)
    dispatch_once(&_ef_log_ECMessageBodyParser_onceToken, &__block_literal_global_13);
  v5 = _ef_log_ECMessageBodyParser_log;
  if (os_log_type_enabled((os_log_t)_ef_log_ECMessageBodyParser_log, OS_LOG_TYPE_ERROR))
    -[ECMessageBodyParser didFindError:].cold.1(a3, v5);
  if (!self->_parserError)
    self->_parserError = (NSError *)a3;
}

- (unint64_t)quoteLevelForBodyNode:(id)a3
{
  unint64_t v4;

  v4 = 0;
  -[ECMessageBodyParser getLevel:quoteLevel:forBodyNode:](self, "getLevel:quoteLevel:forBodyNode:", 0, &v4, a3);
  return v4;
}

- (void)getLevel:(int64_t *)a3 quoteLevel:(int64_t *)a4 forBodyNode:(id)a5
{
  const CFArrayCallBacks *v9;
  __CFDictionary *nodesLevelCache;
  CFIndex Count;
  uint64_t v12;
  const void *ValueAtIndex;
  void *v14;
  void *value;

  v14 = 0;
  value = 0;
  if (a5)
  {
    if (!self->_nodesStackCache)
    {
      if (objc_msgSend((id)objc_opt_class(), "cacheRetainsNodes"))
        v9 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      else
        v9 = 0;
      self->_nodesStackCache = CFArrayCreateMutable(0, 50, v9);
    }
    nodesLevelCache = self->_nodesLevelCache;
    if (!nodesLevelCache)
    {
      nodesLevelCache = CFDictionaryCreateMutable(0, 50, 0, 0);
      self->_nodesLevelCache = nodesLevelCache;
    }
    if (!self->_nodesQuoteLevelCache)
    {
      self->_nodesQuoteLevelCache = CFDictionaryCreateMutable(0, 50, 0, 0);
      nodesLevelCache = self->_nodesLevelCache;
    }
    if (!CFDictionaryGetValueIfPresent(nodesLevelCache, a5, (const void **)&value)
      || !CFDictionaryGetValueIfPresent(self->_nodesQuoteLevelCache, a5, (const void **)&v14))
    {
      -[ECMessageBodyParser getLevel:quoteLevel:forBodyNode:](self, "getLevel:quoteLevel:forBodyNode:", &value, &v14, objc_msgSend(a5, "parentNode", v14));
      value = (char *)value + 1;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && !objc_msgSend(CFSTR("blockquote"), "compare:options:", objc_msgSend(a5, "tagName"), 1)
        && ((objc_opt_respondsToSelector() & 1) == 0
         || !objc_msgSend(CFSTR("cite"), "compare:options:", objc_msgSend(a5, "getAttribute:", CFSTR("type")), 1)
         || !objc_msgSend(CFSTR("gmail_quote"), "compare:options:", objc_msgSend(a5, "getAttribute:", CFSTR("class")), 1)))
      {
        v14 = (char *)v14 + 1;
      }
      Count = CFArrayGetCount(self->_nodesStackCache);
      if (Count >= (uint64_t)value)
      {
        v12 = Count + 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(self->_nodesStackCache, v12 - 2);
          CFDictionaryRemoveValue(self->_nodesLevelCache, ValueAtIndex);
          CFDictionaryRemoveValue(self->_nodesQuoteLevelCache, ValueAtIndex);
          CFArrayRemoveValueAtIndex(self->_nodesStackCache, v12 - 2);
          --v12;
        }
        while (v12 > (uint64_t)value);
      }
      CFArrayAppendValue(self->_nodesStackCache, a5);
      CFDictionarySetValue(self->_nodesLevelCache, a5, value);
      CFDictionarySetValue(self->_nodesQuoteLevelCache, a5, v14);
    }
  }
  if (a3)
    *a3 = (int64_t)value;
  if (a4)
    *a4 = (int64_t)v14;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)didFindError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend(a1, "ef_publicDescription");
  _os_log_error_impl(&dword_1B9ADE000, a2, OS_LOG_TYPE_ERROR, "Did find error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
