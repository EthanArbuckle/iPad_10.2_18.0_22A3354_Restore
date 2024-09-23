@implementation PAMediaConversionServiceSetCreationDateImageMetadataPolicy

+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCreationDate:", v6);

  if (v5)
  {
    objc_msgSend(v7, "setTimeZone:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("creationDate")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDateTimeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy setCreationDate:](self, "setCreationDate:", v5);
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy setTimeZone:](self, "setTimeZone:", v6);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("creationDate"));

  -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("creationDateTimeZone"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v29;
  void *v30;
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[9];

  v33[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCED8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0D75108]);
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCreationDate:timeZone:", v9, v10);

    objc_msgSend(v8, "exifDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tiffDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iptcDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CBCCA0];
    v33[0] = *MEMORY[0x1E0CBCB40];
    v33[1] = v14;
    v15 = *MEMORY[0x1E0CBCB38];
    v33[2] = *MEMORY[0x1E0CBCC20];
    v33[3] = v15;
    v16 = *MEMORY[0x1E0CBCC18];
    v33[4] = *MEMORY[0x1E0CBCC98];
    v33[5] = v16;
    v17 = *MEMORY[0x1E0CBCC10];
    v33[6] = *MEMORY[0x1E0CBCC90];
    v33[7] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    v19 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v6, v11, v18);

    if (v19)
    {
      v32 = *MEMORY[0x1E0CBD088];
      v20 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      v23 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v7, v12, v21);

      v24 = v29;
      if (v23)
      {
        v25 = *MEMORY[0x1E0CBCF20];
        v31[0] = *MEMORY[0x1E0CBCED0];
        v31[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v29, v13, v26);

        v20 = v27 ^ 1;
      }
    }
    else
    {
      v22 = v7;
      v20 = 1;
      v24 = v29;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "addEntriesFromDictionary:", v4);
    v8 = objc_alloc_init(MEMORY[0x1E0D75108]);
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCreationDate:timeZone:", v9, v10);

    v19[0] = *MEMORY[0x1E0CBCB50];
    objc_msgSend(v8, "exifDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E0CBD090];
    objc_msgSend(v8, "tiffDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E0CBCED8];
    objc_msgSend(v8, "iptcDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_processMetadata___block_invoke;
    v17[3] = &unk_1E99539E0;
    v15 = v7;
    v18 = v15;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
  else
  {
    v15 = v4;
  }

  return v15;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

void __78__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_processMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v10, "addEntriesFromDictionary:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

  }
}

uint64_t __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (!v15)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

@end
