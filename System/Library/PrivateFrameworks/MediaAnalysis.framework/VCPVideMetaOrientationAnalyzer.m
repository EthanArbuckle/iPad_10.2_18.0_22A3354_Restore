@implementation VCPVideMetaOrientationAnalyzer

- (VCPVideMetaOrientationAnalyzer)init
{
  VCPVideMetaOrientationAnalyzer *v2;
  uint64_t v3;
  NSMutableArray *results;
  VCPVideMetaOrientationAnalyzer *v5;
  VCPVideMetaOrientationAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPVideMetaOrientationAnalyzer;
  v2 = -[VCPVideMetaOrientationAnalyzer init](&v8, sel_init);
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
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSMutableArray *results;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  id obj;
  uint64_t v21;
  CMTime v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time;
  const __CFString *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = v4;
  if (!v4)
  {
    v17 = -50;
    goto LABEL_22;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (!v5)
    goto LABEL_20;
  v21 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v25 != v21)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v7, "numberValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "integerValue") <= 0)
      {

LABEL_11:
        v8 = &unk_1E6B74318;
        goto LABEL_12;
      }
      objc_msgSend(v7, "numberValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue") > 8;

      if (v11)
        goto LABEL_11;
LABEL_12:
      results = self->_results;
      v31[0] = CFSTR("start");
      if (v7)
        objc_msgSend(v7, "time");
      else
        memset(&v23[1], 0, sizeof(CMTime));
      time = v23[1];
      v13 = CMTimeCopyAsDictionary(&time, 0);
      v32[0] = v13;
      v31[1] = CFSTR("duration");
      if (v7)
        objc_msgSend(v7, "duration");
      else
        memset(v23, 0, 24);
      time = v23[0];
      v14 = CMTimeCopyAsDictionary(&time, 0);
      v32[1] = v14;
      v31[2] = CFSTR("attributes");
      v29 = CFSTR("orientation");
      v30 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](results, "addObject:", v16);

    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  }
  while (v5);
LABEL_20:

  v17 = 0;
LABEL_22:

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
    v6 = CFSTR("OrientationResults");
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
