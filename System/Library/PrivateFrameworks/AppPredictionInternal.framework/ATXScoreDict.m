@implementation ATXScoreDict

- (void)atx_writeToFile:(__sFILE *)a3
{
  unint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = -[ATXScoreDict count](self, "count");
  v6 = (_QWORD *)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v6, 8 * v5);
  -[ATXScoreDict getKeys:count:](self, "getKeys:count:", v6, v5);
  CFQSortArray();
  fwrite("{\n", 2uLL, 1uLL, a3);
  for (; v5; --v5)
  {
    printQuotedString(a3, (void *)*v6);
    fwrite(": ", 2uLL, 1uLL, a3);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXScoreDict scoreForKey:found:](self, "scoreForKey:found:", *v6, 0);
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "atx_writeToFile:", a3);
    if (v5 != 1)
      fputc(44, a3);
    fputc(10, a3);

    ++v6;
  }
  fputc(125, a3);
}

- (ATXScoreDict)init
{
  ATXScoreDict *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATXScoreDict;
  v2 = -[ATXScoreDict init](&v4, sel_init);
  if (v2)
    v2->_dict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], &kValueSlotDictionaryValueCallBacks);
  return v2;
}

- (ATXScoreDict)initWithDefaultValueForKeys:(id)a3
{
  id v5;
  ATXScoreDict *v6;
  ATXScoreDict *v7;

  v5 = a3;
  v6 = -[ATXScoreDict init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultKeys, a3);

  return v7;
}

- (ATXScoreDict)initWithDefaultValueForScoreTypeKeys
{
  if (initWithDefaultValueForScoreTypeKeys_onceToken != -1)
    dispatch_once(&initWithDefaultValueForScoreTypeKeys_onceToken, &__block_literal_global_196);
  return -[ATXScoreDict initWithDefaultValueForKeys:](self, "initWithDefaultValueForKeys:", initWithDefaultValueForScoreTypeKeys_keyNames);
}

void __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 817);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke_2;
  v4[3] = &unk_1E82E85C8;
  v5 = v0;
  v1 = v0;
  +[_ATXScoreTypes iterScoreInputsWithBlock:](_ATXScoreTypes, "iterScoreInputsWithBlock:", v4);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)initWithDefaultValueForScoreTypeKeys_keyNames;
  initWithDefaultValueForScoreTypeKeys_keyNames = v2;

}

void __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_ATXScoreTypes stringForScoreInput:](_ATXScoreTypes, "stringForScoreInput:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)dealloc
{
  __CFDictionary *dict;
  objc_super v4;

  dict = self->_dict;
  if (dict)
    CFRelease(dict);
  v4.receiver = self;
  v4.super_class = (Class)ATXScoreDict;
  -[ATXScoreDict dealloc](&v4, sel_dealloc);
}

- (void)setScore:(double)a3 forKey:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  double v9;
  void *key;

  v6 = a4;
  key = v6;
  if (a3 != -31337.0
    || (v7 = -[NSSet containsObject:](self->_defaultKeys, "containsObject:", v6, -31337.0), v8 = key, !v7))
  {
    v9 = -0.0;
    if (a3 != 0.0)
      v9 = a3;
    CFDictionarySetValue(self->_dict, key, *(const void **)&v9);
    v8 = key;
  }

}

- (double)scoreForKey:(id)a3 found:(BOOL *)a4
{
  id v6;
  double v7;
  double v9;

  v6 = a3;
  v7 = COERCE_DOUBLE(CFDictionaryGetValue(self->_dict, v6));
  if (v7 == 0.0)
  {
    if (a4)
      *a4 = -[NSSet containsObject:](self->_defaultKeys, "containsObject:", v6);
    v9 = -31337.0;
  }
  else
  {
    if (a4)
      *a4 = 1;
    if (v7 == 0.0 && v7 < 0.0)
      v9 = 0.0;
    else
      v9 = v7;
  }

  return v9;
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dict);
}

- (id)toDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", CFDictionaryGetCount(self->_dict));
  CFDictionaryApplyFunction(self->_dict, (CFDictionaryApplierFunction)toDictionaryApplier, v3);
  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[ATXScoreDict toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)scoreDictFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v4, "setScore:forKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)getKeys:(id *)a3 count:(unint64_t)a4
{
  -[__CFDictionary getObjects:andKeys:count:](self->_dict, "getObjects:andKeys:count:", 0, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultKeys, 0);
}

@end
