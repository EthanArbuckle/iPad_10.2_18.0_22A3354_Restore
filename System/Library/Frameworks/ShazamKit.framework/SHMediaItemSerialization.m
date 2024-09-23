@implementation SHMediaItemSerialization

+ (id)serializationFormatForProperties:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "transformProperties:toSerializationFormat:error:", a3, 1, a4);
}

+ (id)propertiesFromSerializationFormat:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "transformProperties:toSerializationFormat:error:", a3, 0, a4);
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_6);
  return (id)dateFormatter_dateFormatter;
}

uint64_t __41__SHMediaItemSerialization_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)dateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

+ (id)transformProperties:(id)a3 toSerializationFormat:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isInternalMediaItemProperty:", v14) & 1) == 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "transformValue:forProperty:toSerializationFormat:error:", v15, v14, v5, a5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {

            v17 = 0;
            goto LABEL_13;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = (void *)objc_msgSend(v8, "copy");
LABEL_13:

  return v17;
}

+ (id)transformValue:(id)a3 forProperty:(id)a4 toSerializationFormat:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v7 = a5;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (+[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:](SHMediaItemPropertyUtilities, "isShazamKitDefinedMediaItemProperty:", v11))
  {
    v12 = +[SHMediaItemPropertyUtilities typeForShazamKitProperty:](SHMediaItemPropertyUtilities, "typeForShazamKitProperty:", v11);
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v12 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(v10, "absoluteString");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (v12 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(a1, "dateFormatter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringFromDate:", v10);
          v14 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v16 = (void *)v14;

          goto LABEL_17;
        }
        goto LABEL_10;
      }
      v25 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid object in catalog for property %@ : %@"), v11, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = (void **)v26;
      v20 = &v25;
    }
    else
    {
      +[SHMediaItemPropertyUtilities jsonRepresentationTypeForProperty:](SHMediaItemPropertyUtilities, "jsonRepresentationTypeForProperty:", v11);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v12 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (v12 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(a1, "dateFormatter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateFromString:", v10);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
LABEL_10:
        if (v12 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(a1, "transformArrayValue:property:shouldSerialize:", v10, v11, v7);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (v12 == (objc_class *)objc_opt_class())
        {
          if (v7)
          {
            objc_msgSend(v10, "UUIDString");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
          }
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      v23 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid object in catalog for property %@ : %@"), v11, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = &v24;
      v20 = &v23;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a6, 300, 0, v21);

    v16 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v15 = v10;
LABEL_13:
  v16 = v15;
LABEL_17:

  return v16;
}

+ (id)transformArrayValue:(id)a3 property:(id)a4 shouldSerialize:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  SHRange *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  SHSignatureAlignment *v33;
  SHSignatureAlignment *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v5 = a5;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = +[SHMediaItemPropertyUtilities categoryForShazamKitProperty:](SHMediaItemPropertyUtilities, "categoryForShazamKitProperty:", v9);
  if (v5)
  {
    if (v10 == 8)
    {
      objc_msgSend(a1, "serializedFormatFromArrayValues:property:", v8, v9);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (v10 == 6)
    {
      v11 = v8;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v45 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "serializedRepresentation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        }
        while (v15);
      }
LABEL_32:

      v26 = (void *)objc_msgSend(v12, "copy");
      goto LABEL_33;
    }
  }
  else
  {
    if (v10 == 8)
    {
      v27 = v8;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = v27;
      v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v37 != v30)
              objc_enumerationMutation(v13);
            v32 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            v33 = [SHSignatureAlignment alloc];
            v34 = -[SHSignatureAlignment initWithSerializedRepresentation:](v33, "initWithSerializedRepresentation:", v32, (_QWORD)v36);
            objc_msgSend(v12, "addObject:", v34);

          }
          v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        }
        while (v29);
      }
      goto LABEL_32;
    }
    if (v10 == 6)
    {
      v19 = v8;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v13 = v19;
      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v13);
            v24 = -[SHRange initWithSerializedRepresentation:]([SHRange alloc], "initWithSerializedRepresentation:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
            objc_msgSend(v12, "addObject:", v24);

          }
          v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v21);
      }
      goto LABEL_32;
    }
  }
  v25 = v8;
LABEL_24:
  v26 = v25;
LABEL_33:

  return v26;
}

+ (id)serializedFormatFromArrayValues:(id)a3 property:(id)a4
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
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SHMediaItemPropertyUtilities categoryForShazamKitProperty:](SHMediaItemPropertyUtilities, "categoryForShazamKitProperty:", v6) == 8)
  {
    v8 = v5;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "serializedRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempting to serialize a custom array containing objects that aren't ShazamKit defined."));
  }
  v14 = (void *)objc_msgSend(v7, "copy");

  return v14;
}

+ (BOOL)isInternalMediaItemProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("sh_identifier");
  v8 = CFSTR("sh_providerIdentifier");
  v9 = CFSTR("sh_score");
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8, v9, v10);

  return (char)v3;
}

@end
