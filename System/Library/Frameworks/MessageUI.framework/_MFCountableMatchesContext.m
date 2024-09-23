@implementation _MFCountableMatchesContext

- (_MFCountableMatchesContext)init
{
  _MFCountableMatchesContext *v2;
  NSMutableSet *v3;
  NSMutableSet *popularPeople;
  _MFCountableMatchesContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFCountableMatchesContext;
  v2 = -[_MFCountableMatchesContext init](&v7, sel_init);
  if (v2)
  {
    v2->_peopleCount = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    popularPeople = v2->_popularPeople;
    v2->_popularPeople = v3;

    v5 = v2;
  }

  return v2;
}

- (id)highestMatches
{
  return self->_popularPeople;
}

- (void)dealloc
{
  __CFDictionary *peopleCount;
  objc_super v4;

  peopleCount = self->_peopleCount;
  if (peopleCount)
    CFRelease(peopleCount);
  v4.receiver = self;
  v4.super_class = (Class)_MFCountableMatchesContext;
  -[_MFCountableMatchesContext dealloc](&v4, sel_dealloc);
}

- (void)countInstances:(id)a3 usingPredicate:(id)a4
{
  id v6;
  uint64_t (**v7)(id, const void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t maxCount;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, const void *))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(const void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = v7[2](v7, v12);
        if (v13)
        {
          v14 = (int64_t)CFDictionaryGetValue(self->_peopleCount, v12) + v13;
          maxCount = self->_maxCount;
          if (v14 == maxCount)
          {
            if (v14 <= 0)
              goto LABEL_13;
          }
          else
          {
            if (v14 <= maxCount)
              goto LABEL_13;
            self->_maxCount = v14;
            -[NSMutableSet removeAllObjects](self->_popularPeople, "removeAllObjects", (_QWORD)v16);
            if (v14 < 1)
              goto LABEL_13;
          }
          -[NSMutableSet addObject:](self->_popularPeople, "addObject:", v12, (_QWORD)v16);
LABEL_13:
          CFDictionarySetValue(self->_peopleCount, v12, (const void *)v14);
          continue;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularPeople, 0);
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

@end
