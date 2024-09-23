@implementation BMDSLJSONArchiver

+ (id)archivedStringWithDSL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "archivedDataWithDSL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return v5;
}

+ (id)archivedDataWithDSL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_class();
  v8 = CFSTR("dsl");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "archivedDataWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)archivedStringWithObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "archivedDataWithObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

+ (id)archivedDataWithObject:(id)a3
{
  id v3;
  BMDSLJSONCoder *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(BMDSLJSONCoder);
  -[BMDSLJSONCoder encodeDataFromRootObject:](v4, "encodeDataFromRootObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)archiveCompatibleObjectWithObject:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  BMDSLJSONCoder *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  v9 = -[BMDSLJSONCoder initWithOptions:]([BMDSLJSONCoder alloc], "initWithOptions:", a4);
  -[BMDSLJSONCoder setUserInfo:](v9, "setUserInfo:", v7);

  -[BMDSLJSONCoder encodingCompatibleObjectFromRootObject:](v9, "encodingCompatibleObjectFromRootObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)registerJSONTransformers
{
  if (registerJSONTransformers_onceToken != -1)
    dispatch_once(&registerJSONTransformers_onceToken, &__block_literal_global_0);
}

uint64_t __58__BMDSLJSONArchiver_CustomTypes__registerJSONTransformers__block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(MEMORY[0x1E0C9AA70], "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)v10;
    v3 = (void *)MEMORY[0x1E0C9AA70];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v10 != v2)
          objc_enumerationMutation(v3);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v4);
        v6 = (void *)MEMORY[0x1E0CB3B20];
        objc_msgSend(v3, "objectForKeyedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        BMDSLRegisterJSONTransformerNameFromEncodingDescriptor(v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValueTransformer:forName:", v7, v8);

        ++v4;
      }
      while (v1 != v4);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v1 = result;
    }
    while (result);
  }
  return result;
}

@end
