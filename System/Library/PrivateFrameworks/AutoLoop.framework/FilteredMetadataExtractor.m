@implementation FilteredMetadataExtractor

- (FilteredMetadataExtractor)init
{
  FilteredMetadataExtractor *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *filteredKeysArray;
  objc_super v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FilteredMetadataExtractor;
  v2 = -[IrisVideoMetadataExtractor init](&v7, sel_init);
  v8[0] = CFSTR("privET");
  v8[1] = CFSTR("privImgG");
  v8[2] = CFSTR("privTZF");
  v8[3] = CFSTR("privAFS");
  v8[4] = CFSTR("privAFSt");
  v8[5] = CFSTR("privFM");
  v8[6] = CFSTR("privECMVct");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  filteredKeysArray = v2->filteredKeysArray;
  v2->filteredKeysArray = (NSMutableArray *)v4;

  return v2;
}

- (void)removeMetadataFromInterpolatedFrameDict:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "BOOLValue"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->filteredKeysArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v11, (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v4, "removeObjectForKey:", v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (int)processFile
{
  int v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *framesMetadataArray;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)FilteredMetadataExtractor;
  v3 = -[IrisVideoMetadataExtractor processFile](&v17, sel_processFile);
  if (!v3 && self->super._framesMetadataArray)
  {
    v4 = (NSArray *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->super._framesMetadataArray;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[FilteredMetadataExtractor removeMetadataFromInterpolatedFrameDict:](self, "removeMetadataFromInterpolatedFrameDict:", v10);
          -[NSArray addObject:](v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

    framesMetadataArray = self->super._framesMetadataArray;
    self->super._framesMetadataArray = v4;

  }
  return v3;
}

- (NSMutableArray)filteredKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFilteredKeysArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->filteredKeysArray, 0);
}

@end
