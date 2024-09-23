@implementation ATXHeroAndClipDebugSampler

- (ATXHeroAndClipDebugSampler)initWithSampleIndices:(id)a3
{
  id v5;
  ATXHeroAndClipDebugSampler *v6;
  ATXHeroAndClipDebugSampler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAndClipDebugSampler;
  v6 = -[ATXHeroAndClipDebugSampler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_indicesToSample, a3);

  return v7;
}

- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_indicesToSample;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "unsignedIntegerValue", (_QWORD)v18);
        if (v14 < objc_msgSend(v6, "count") && v11 < a4)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

          ++v11;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicesToSample, 0);
}

@end
