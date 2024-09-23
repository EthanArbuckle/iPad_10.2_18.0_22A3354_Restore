@implementation PHMemoryGenerationOptions

- (PHMemoryGenerationOptions)init
{
  PHMemoryGenerationOptions *v2;
  uint64_t v3;
  NSDate *date;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHMemoryGenerationOptions;
  v2 = -[PHMemoryGenerationOptions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    v2->_reason = 1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setReason:", -[PHMemoryGenerationOptions reason](self, "reason"));
  -[PHMemoryGenerationOptions date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

  -[PHMemoryGenerationOptions location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v6);

  -[PHMemoryGenerationOptions peopleNames](self, "peopleNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPeopleNames:", v8);

  -[PHMemoryGenerationOptions existingMemories](self, "existingMemories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setExistingMemories:", v10);

  -[PHMemoryGenerationOptions blockedMemories](self, "blockedMemories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setBlockedMemories:", v12);

  -[PHMemoryGenerationOptions extraParameters](self, "extraParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setExtraParameters:", v14);

  -[PHMemoryGenerationOptions photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotoLibrary:", v15);

  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void *, void *, const __CFString *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD aBlock[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryGenerationOptions date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PHMemoryOptionDateKey"));

  -[PHMemoryGenerationOptions location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PHMemoryOptionLocationKey"));

  -[PHMemoryGenerationOptions peopleNames](self, "peopleNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("PHMemoryOptionPeopleNamesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHMemoryGenerationOptions reason](self, "reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PHMemoryOptionReasonKey"));

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PHMemoryGenerationOptions_dictionaryRepresentation__block_invoke;
  aBlock[3] = &unk_1E35D8460;
  v8 = v3;
  v16 = v8;
  v9 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  -[PHMemoryGenerationOptions existingMemories](self, "existingMemories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v10, CFSTR("PHMemoryOptionExistingMemoryIdentifiersKey"));

  -[PHMemoryGenerationOptions blockedMemories](self, "blockedMemories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v11, CFSTR("PHMemoryOptionBlockedMemoryIdentifiersKey"));

  -[PHMemoryGenerationOptions extraParameters](self, "extraParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("PHMemoryOptionExtraParametersKey"));

  v13 = v8;
  return v13;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setPeopleNames:(id)a3
{
  objc_storeStrong((id *)&self->_peopleNames, a3);
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (void)setExistingMemories:(id)a3
{
  objc_storeStrong((id *)&self->_existingMemories, a3);
}

- (NSArray)blockedMemories
{
  return self->_blockedMemories;
}

- (void)setBlockedMemories:(id)a3
{
  objc_storeStrong((id *)&self->_blockedMemories, a3);
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (void)setExtraParameters:(id)a3
{
  objc_storeStrong((id *)&self->_extraParameters, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong((id *)&self->_blockedMemories, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __53__PHMemoryGenerationOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "localIdentifier", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  }

}

@end
