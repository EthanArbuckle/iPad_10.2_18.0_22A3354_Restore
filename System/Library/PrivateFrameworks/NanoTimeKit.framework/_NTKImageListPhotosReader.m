@implementation _NTKImageListPhotosReader

- (_NTKImageListPhotosReader)initWithResourceDirectory:(id)a3
{
  id v4;
  _NTKImageListPhotosReader *v5;
  uint64_t v6;
  NSMutableArray *photos;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_NTKImageListPhotosReader;
  v5 = -[NTKPhotosReader initWithResourceDirectory:](&v24, sel_initWithResourceDirectory_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    photos = v5->_photos;
    v5->_photos = (NSMutableArray *)v6;

    if (v4)
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Images.plist"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetCollection"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPhotosReader setAssetCollectionIdentifier:](v5, "setAssetCollectionIdentifier:", v11);

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("imageList"));
        v12 = objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v13)
        {
          v14 = v13;
          v19 = v8;
          v15 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              +[NTKPhoto decodeFromDictionary:forResourceDirectory:](NTKPhoto, "decodeFromDictionary:forResourceDirectory:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v4);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                -[NSMutableArray addObject:](v5->_photos, "addObject:", v17);

            }
            v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          }
          while (v14);
          v8 = v19;
        }
      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[_NTKImageListPhotosReader initWithResourceDirectory:].cold.1();
      }

    }
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_photos, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_photos, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
}

- (void)initWithResourceDirectory:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "%@: cannot read image list from %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end
