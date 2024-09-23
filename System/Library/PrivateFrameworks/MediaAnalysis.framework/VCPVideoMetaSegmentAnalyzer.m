@implementation VCPVideoMetaSegmentAnalyzer

- (VCPVideoMetaSegmentAnalyzer)init
{
  VCPVideoMetaSegmentAnalyzer *v2;
  uint64_t v3;
  NSMutableArray *results;
  VCPVideoMetaSegmentAnalyzer *v5;
  VCPVideoMetaSegmentAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPVideoMetaSegmentAnalyzer;
  v2 = -[VCPVideoMetaSegmentAnalyzer init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    results = v2->_results;
    v2->_results = (NSMutableArray *)v3;

    if (v2->_results)
      v5 = v2;
    else
      v5 = 0;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *results;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  void *v14;
  int v15;
  void *v17;
  id obj;
  CMTime v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime time;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = v5;
  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v5, "items", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          results = self->_results;
          v25[0] = CFSTR("start");
          if (v10)
            objc_msgSend(v10, "time");
          else
            memset(&v19[1], 0, sizeof(CMTime));
          time = v19[1];
          v12 = CMTimeCopyAsDictionary(&time, 0);
          v25[1] = CFSTR("duration");
          v26[0] = v12;
          if (v10)
            objc_msgSend(v10, "duration");
          else
            memset(v19, 0, 24);
          time = v19[0];
          v13 = CMTimeCopyAsDictionary(&time, 0);
          v26[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v14);

        }
        v6 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v7);
    }

    v15 = 0;
  }
  else
  {
    v15 = -50;
  }

  return v15;
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
    v6 = CFSTR("MetaSegmentResults");
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
