@implementation AXMindNetConfiguration

- (AXMindNetConfiguration)initWithURL:(id)a3
{
  id v4;
  AXMindNetConfiguration *v5;
  void *v6;
  NSArray *filterThresholds;
  NSNumber *nmsThreshold;
  void *v9;
  void *v10;
  AXMindNetConfiguration *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMindNetConfiguration;
  v5 = -[AXMindNetConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    filterThresholds = v5->_filterThresholds;
    v5->_filterThresholds = (NSArray *)&unk_1E62895F0;

    nmsThreshold = v5->_nmsThreshold;
    v5->_nmsThreshold = (NSNumber *)&unk_1E6288C08;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("filterThresholds"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("nmsThreshold"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (__38__AXMindNetConfiguration_initWithURL___block_invoke((uint64_t)v10, v9))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&v5->_filterThresholds, v9);
          objc_storeStrong((id *)&v5->_nmsThreshold, v10);
        }
      }

    }
    v11 = v5;

  }
  return v5;
}

BOOL __38__AXMindNetConfiguration_initWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }

    v8 = objc_msgSend(v3, "count", v10) != 0;
  }
  else
  {
LABEL_12:
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filterThresholds: %@\nnmsThreshold: %@"), self->_filterThresholds, self->_nmsThreshold);
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (NSNumber)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nmsThreshold, 0);
  objc_storeStrong((id *)&self->_filterThresholds, 0);
}

@end
