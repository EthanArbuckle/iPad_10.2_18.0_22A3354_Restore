@implementation VCPSmartStyleMetaAnalyzer

- (VCPSmartStyleMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  VCPSmartStyleMetaAnalyzer *v4;
  uint64_t v5;
  NSMutableArray *results;
  VCPSmartStyleMetaAnalyzer *v7;
  VCPSmartStyleMetaAnalyzer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCPSmartStyleMetaAnalyzer;
  v4 = -[VCPSmartStyleMetaAnalyzer init](&v10, sel_init, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    results = v4->_results;
    v4->_results = (NSMutableArray *)v5;

    if (v4->_results)
      v7 = v4;
    else
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  NSMutableArray *results;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return -50;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "dataType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.metadata.datatype.raw-data"));

        if (v10)
        {
          results = self->_results;
          v24 = CFSTR("attributes");
          v22 = CFSTR("MetaSSInfoResults");
          objc_msgSend(v8, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v14);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v5);
  }

  return 0;
}

- (id)privateResults
{
  void *v3;
  NSMutableArray *results;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray count](self->_results, "count");
  if (v3)
  {
    results = self->_results;
    v6 = CFSTR("MetaSSResults");
    v7[0] = results;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
