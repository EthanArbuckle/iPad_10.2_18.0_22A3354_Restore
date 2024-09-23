@implementation VCPStillImageMetaAnalyzer

- (VCPStillImageMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  VCPStillImageMetaAnalyzer *v4;
  uint64_t v5;
  NSMutableArray *results;
  VCPStillImageMetaAnalyzer *v7;
  VCPStillImageMetaAnalyzer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCPStillImageMetaAnalyzer;
  v4 = -[VCPStillImageMetaAnalyzer init](&v10, sel_init, a3, a4);
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
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  NSMutableArray *results;
  void *v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  id obj;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTime time;
  _QWORD v28[2];
  _QWORD v29[2];
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = v4;
  if (v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      v7 = *MEMORY[0x1E0CA2420];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "dataType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v7);

          if (v11)
          {
            results = self->_results;
            v30 = CFSTR("attributes");
            v28[0] = CFSTR("MetaStillImagePerspectiveTransformResults");
            objc_msgSend(v9, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v28[1] = CFSTR("MetaPresentationTimeResults");
            v29[0] = v13;
            if (v9)
              objc_msgSend(v9, "time");
            else
              memset(&v22, 0, sizeof(v22));
            time = v22;
            v14 = CMTimeCopyAsDictionary(&time, 0);
            v29[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](results, "addObject:", v16);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v5);
    }

    v17 = 0;
  }
  else
  {
    v17 = -50;
  }

  return v17;
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
    v6 = CFSTR("MetaStillImageHomographyResults");
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
