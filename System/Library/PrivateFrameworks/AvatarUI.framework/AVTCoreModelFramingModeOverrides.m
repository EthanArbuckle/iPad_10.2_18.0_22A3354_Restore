@implementation AVTCoreModelFramingModeOverrides

- (AVTCoreModelFramingModeOverrides)initWithCameraOverrides:(id)a3
{
  id v4;
  AVTCoreModelFramingModeOverrides *v5;
  AVTCoreModelFramingModeOverrides *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *orderedTags;
  uint64_t v27;
  NSArray *orderedFramingModeOverrides;
  AVTCoreModelFramingModeOverrides *v30;
  id v31;
  id obj;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AVTCoreModelFramingModeOverrides;
  v5 = -[AVTCoreModelFramingModeOverrides init](&v47, sel_init);
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    v7 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v31 = v4;
    obj = v4;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v36)
    {
      v33 = *(_QWORD *)v44;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          v38 = v8;
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("tags"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v40 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                v19 = (void *)MEMORY[0x1E0C99E40];
                objc_msgSend(v9, "objectForKeyedSubscript:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "orderedSetWithObject:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v15);
          }

          v22 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v35, "addObject:", v22);

          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("camera"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AVTEditingModelMappings framingModeForCameraIdentifier:](AVTEditingModelMappings, "framingModeForCameraIdentifier:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v24);
          v8 = v38 + 1;
        }
        while (v38 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v36);
    }

    v25 = objc_msgSend(v35, "copy");
    v6 = v30;
    orderedTags = v30->_orderedTags;
    v30->_orderedTags = (NSArray *)v25;

    v27 = objc_msgSend(v34, "copy");
    orderedFramingModeOverrides = v30->_orderedFramingModeOverrides;
    v30->_orderedFramingModeOverrides = (NSArray *)v27;

    v4 = v31;
  }

  return v6;
}

- (NSArray)orderedTags
{
  return self->_orderedTags;
}

- (NSArray)orderedFramingModeOverrides
{
  return self->_orderedFramingModeOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFramingModeOverrides, 0);
  objc_storeStrong((id *)&self->_orderedTags, 0);
}

@end
