@implementation RemovabilityPListToMetadata

void ___RemovabilityPListToMetadata_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  IXApplicationIdentity *v12;
  IXAppRemovabilityMetadata *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  v9 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10)
  {
    objc_opt_class();
    v11 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (v11)
    {
      v12 = -[IXApplicationIdentity initWithPlistKeySerialization:]([IXApplicationIdentity alloc], "initWithPlistKeySerialization:", v9);
      if (v12)
      {
        v13 = -[IXAppRemovabilityMetadata initWithMetadataDictionary:]([IXAppRemovabilityMetadata alloc], "initWithMetadataDictionary:", v11);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v12);

      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315394;
          v17 = "_RemovabilityPListToMetadata_block_invoke";
          v18 = 2112;
          v19 = v9;
          _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to deserialize removability entry: %@", (uint8_t *)&v16, 0x16u);
        }

      }
      goto LABEL_16;
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = "_RemovabilityPListToMetadata_block_invoke";
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_DEFAULT, "%s: Deserialized key for removability entry is not string %@ : %@", (uint8_t *)&v16, 0x20u);
    }

  }
LABEL_17:
  *a4 = 0;

}

@end
