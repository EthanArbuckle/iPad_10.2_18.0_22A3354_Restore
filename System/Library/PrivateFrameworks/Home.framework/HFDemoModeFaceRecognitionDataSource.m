@implementation HFDemoModeFaceRecognitionDataSource

- (HFDemoModeFaceRecognitionDataSource)init
{
  HFDemoModeFaceRecognitionDataSource *v2;
  HFDemoModeFaceRecognitionDataSource *v3;
  NSArray *recentsEntries;
  NSArray *v5;
  NSArray *knownToHouseholdEntries;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  NSObject *v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HFDemoModeFaceRecognitionDataSource;
  v2 = -[HFDemoModeFaceRecognitionDataSource init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    recentsEntries = v2->_recentsEntries;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_recentsEntries = (NSArray *)MEMORY[0x1E0C9AA60];

    knownToHouseholdEntries = v3->_knownToHouseholdEntries;
    v3->_knownToHouseholdEntries = v5;

    +[HFUtilities demoModeDirectoryURL](HFUtilities, "demoModeDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("FaceRecognition.plist"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("recentVisitors"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("knownPersons"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v14 = 0;
      v13 = 0;
    }
    if (objc_msgSend(v13, "count"))
    {
      -[HFDemoModeFaceRecognitionDataSource arrayFromPlistArray:](v3, "arrayFromPlistArray:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v3->_recentsEntries;
      v3->_recentsEntries = (NSArray *)v15;

      HFLogForCategory(0x20uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[NSArray count](v3->_recentsEntries, "count");
        *(_DWORD *)buf = 134217984;
        v26 = v18;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu recents entries", buf, 0xCu);
      }
    }
    else
    {
      HFLogForCategory(0x20uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v8;
        _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "No recents items found in plist at location %@", buf, 0xCu);
      }
    }

    if (objc_msgSend(v14, "count"))
    {
      -[HFDemoModeFaceRecognitionDataSource arrayFromPlistArray:](v3, "arrayFromPlistArray:", v14);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v3->_knownToHouseholdEntries;
      v3->_knownToHouseholdEntries = (NSArray *)v19;

      HFLogForCategory(0x20uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = -[NSArray count](v3->_knownToHouseholdEntries, "count");
        *(_DWORD *)buf = 134217984;
        v26 = v22;
        _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu known to household entries", buf, 0xCu);
      }
    }
    else
    {
      HFLogForCategory(0x20uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v8;
        _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "No persons found in plist at location %@", buf, 0xCu);
      }
    }

  }
  return v3;
}

- (id)arrayFromPlistArray:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  HFDemoModeFaceRecognitionRecentsData *v26;
  __int128 v28;
  id obj;
  void *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HFUtilities demoModeDirectoryURL](HFUtilities, "demoModeDirectoryURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v6 = v4;
    v32 = *(_QWORD *)v34;
    *(_QWORD *)&v5 = 138412290;
    v28 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("displayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fileName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("secondsOffset"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length") || objc_msgSend(v12, "length"))
        {
          if (objc_msgSend(v13, "length", v28))
          {
            v15 = (void *)MEMORY[0x1E0C99D50];
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v13, v30);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dataWithContentsOfURL:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = (void *)MEMORY[0x1E0C99D68];
            if (v14)
            {
              objc_msgSend(v14, "doubleValue");
              objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            }
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v21 = objc_alloc(MEMORY[0x1E0CBA4F8]);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v22 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v21, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v22, v17, v20, 0.0, 0.0, 1.0, 1.0);
            }
            else
            {
              HFLogForCategory(0x20uLL);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v38 = v13;
                _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "Filename %@ specified but no data was found for image", buf, 0xCu);
              }
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }
          v23 = objc_alloc(MEMORY[0x1E0CBA6D8]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v23, "initWithUUID:", v24);

          objc_msgSend(v25, "setName:", v12);
          v26 = -[HFDemoModeFaceRecognitionRecentsData initWithPerson:faceCrop:]([HFDemoModeFaceRecognitionRecentsData alloc], "initWithPerson:faceCrop:", v25, v19);
          objc_msgSend(v31, "addObject:", v26);

        }
        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }

  return v31;
}

- (NSArray)recentsEntries
{
  return self->_recentsEntries;
}

- (void)setRecentsEntries:(id)a3
{
  objc_storeStrong((id *)&self->_recentsEntries, a3);
}

- (NSArray)knownToHouseholdEntries
{
  return self->_knownToHouseholdEntries;
}

- (void)setKnownToHouseholdEntries:(id)a3
{
  objc_storeStrong((id *)&self->_knownToHouseholdEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownToHouseholdEntries, 0);
  objc_storeStrong((id *)&self->_recentsEntries, 0);
}

@end
