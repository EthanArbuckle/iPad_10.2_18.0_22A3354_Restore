@implementation PurplePageMemoryTestRunner

- (PurplePageMemoryTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  PurplePageMemoryTestRunner *v4;
  NSMutableArray *v5;
  NSMutableArray *pagesNeedingMemoryWarningSent;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PurplePageMemoryTestRunner;
  v4 = -[PurplePageLoadTestRunner initWithTestName:browserController:](&v8, sel_initWithTestName_browserController_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pagesNeedingMemoryWarningSent = v4->super.super._pagesNeedingMemoryWarningSent;
    v4->super.super._pagesNeedingMemoryWarningSent = v5;

    v4->super.super._measureTime = 0;
  }
  return v4;
}

- (void)_updatePageLoad:(id)a3 stats:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "memoryBeforeWarning");
    if (v7)
      objc_msgSend(v9, "setMemoryBeforeWarning:", v7);
    v8 = objc_msgSend(v6, "memoryAfterWarning");
    if (v8)
      objc_msgSend(v9, "setMemoryAfterWarning:", v8);
  }

}

- (void)collectPPTResults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  long double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSMutableDictionary *pptResults;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._pageLoadArray, "objectAtIndexedSubscript:", self->super.super._currentTestIteration, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "status") == 5)
        {
          if (objc_msgSend(v12, "memoryBeforeWarning") && objc_msgSend(v12, "memoryAfterWarning"))
          {
            v13 = objc_msgSend(v12, "memoryBeforeWarning");
            v14 = (double)((unint64_t)(objc_msgSend(v12, "memoryAfterWarning") + v13) >> 1);
            objc_msgSend(v12, "URL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", v15, 0, CFSTR("bytes"), (double)v14);

            ++v6;
            v9 = v9 + v14;
            v10 = v10 + log(v14);
          }
        }
        else
        {
          ++v7;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v9 = 0.0;
    v10 = 0.0;
  }

  -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Total Memory"), 0, CFSTR("bytes"), v9);
  if (v6 >= 1)
  {
    -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Mean Memory"), 0, CFSTR("bytes"), v9 / (double)v6);
    -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Geometric Mean Memory"), 0, CFSTR("bytes"), (double)exp(v10 / (double)v6));
    -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Square-Mean-Root Memory"), 0, CFSTR("bytes"), 0.0 / (double)v6 * (0.0 / (double)v6));
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._pageLoadArray, "objectAtIndexedSubscript:", self->super.super._currentTestIteration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
    v18 = v7;
  else
    v18 = v7 + 1;
  if (v18 >= 1)
  {
    pptResults = self->super._pptResults;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](pptResults, "setObject:forKey:", v20, CFSTR("Errors"));

  }
}

@end
