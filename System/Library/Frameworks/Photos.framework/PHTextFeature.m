@implementation PHTextFeature

- (PHTextFeature)initWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6
{
  id v11;
  PHTextFeature *v12;
  PHTextFeature *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHTextFeature;
  v12 = -[PHTextFeature init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_string, a4);
    v13->_type = a3;
    v13->_weight = a5;
    v13->_origin = a6;
  }

  return v13;
}

- (id)encodedData
{
  id v3;
  void *v4;

  v3 = -[NSKeyedArchiver initRequiringSecureCoding:]([PHTextFeatureEncoder alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHTextFeature)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  PHTextFeature *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("weight"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("origin"));

  LODWORD(v10) = v8;
  v11 = -[PHTextFeature initWithType:string:weight:origin:](self, "initWithType:string:weight:origin:", v5, v6, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  double v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_string, CFSTR("string"));
  *(float *)&v5 = self->_weight;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("weight"), v5);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_origin, CFSTR("origin"));

}

- (id)description
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  +[PHTextFeature stringForType:](PHTextFeature, "stringForType:", self->_type);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("Undefined");
  v6 = v5;

  +[PHTextFeature stringForOrigin:](PHTextFeature, "stringForOrigin:", self->_origin);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = CFSTR("Undefined");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, Type = %@, Weight = %0.2f, Origin = %@"), self->_string, v6, self->_weight, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
  self->_weight = a3;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)textFeatureWithType:(int64_t)a3 string:(id)a4 weight:(float)a5 origin:(unint64_t)a6
{
  id v9;
  PHTextFeature *v10;
  double v11;
  PHTextFeature *v12;
  uint8_t v14[16];

  v9 = a4;
  if (objc_msgSend(v9, "length"))
  {
    v10 = [PHTextFeature alloc];
    *(float *)&v11 = a5;
    v12 = -[PHTextFeature initWithType:string:weight:origin:](v10, "initWithType:string:weight:origin:", a3, v9, a6, v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot create a PHTextFeature from an empty string", v14, 2u);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)textFeatureWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0;
  v4 = (void *)-[PHTextFeatureDecoder initForReadingFromData:error:]([PHTextFeatureDecoder alloc], "initForReadingFromData:error:", v3, &v8);

  v5 = v8;
  if (v4)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't unarchive text feature: error %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x13)
    return 0;
  else
    return off_1E35DA7D0[a3];
}

+ (id)stringForOrigin:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return off_1E35DA870[a3 - 1];
}

+ (id)fetchTextFeaturesByAssetLocalIdentifierForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_momentLocalIdentifierByAssetLocalIdentifiersForAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v7;
    objc_msgSend(a1, "_textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers:inPhotoLibrary:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v4 = v21;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

+ (id)_textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v16 = 0;
  objc_msgSend(v5, "requestTextFeaturesForMomentLocalIdentifiers:error:", v6, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PHTextFeature__textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers_inPhotoLibrary___block_invoke;
  v14[3] = &unk_1E35DA7B0;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

+ (id)_momentLocalIdentifierByAssetLocalIdentifiersForAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  void *v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v5, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "setChunkSizeForFetch:", 2000);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v25 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCollection fetchAssetCollectionsContainingAssets:withType:options:](PHAssetCollection, "fetchAssetCollectionsContainingAssets:withType:options:", v14, 3, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        memset(v19, 0, sizeof(v19));
        if (objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", v19, v24, 16))
        {
          objc_msgSend(**((id **)&v19[0] + 1), "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  return v7;
}

void __94__PHTextFeature__textFeaturesByMomentLocalIdentifierForMomentLocalIdentifiers_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
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
        +[PHTextFeature textFeatureWithData:](PHTextFeature, "textFeatureWithData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

@end
