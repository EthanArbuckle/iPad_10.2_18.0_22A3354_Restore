@implementation MADEmbedding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbedding)initWithFormat:(int64_t)a3 dimension:(int64_t)a4 version:(int64_t)a5 vectors:(id)a6
{
  id v11;
  MADEmbedding *v12;
  MADEmbedding *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MADEmbedding;
  v12 = -[MADEmbedding init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_format = a3;
    v12->_dimension = a4;
    v12->_version = a5;
    objc_storeStrong((id *)&v12->_vectors, a6);
  }

  return v13;
}

- (MADEmbedding)initWithCoder:(id)a3
{
  id v4;
  MADEmbedding *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *vectors;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADEmbedding;
  v5 = -[MADEmbedding init](&v12, sel_init);
  if (v5)
  {
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Format"));
    v5->_dimension = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Dimension"));
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Version"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Vectors"));
    v9 = objc_claimAutoreleasedReturnValue();
    vectors = v5->_vectors;
    v5->_vectors = (NSArray *)v9;

  }
  return v5;
}

+ (id)madEmbeddingFromCSEmbedding:(id)a3
{
  id v3;
  MADEmbedding *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  MADEmbedding *v9;

  v3 = a3;
  v4 = [MADEmbedding alloc];
  v5 = objc_msgSend(v3, "format");
  v6 = objc_msgSend(v3, "dimension");
  v7 = objc_msgSend(v3, "version");
  objc_msgSend(v3, "vectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MADEmbedding initWithFormat:dimension:version:vectors:](v4, "initWithFormat:dimension:version:vectors:", v5, v6, v7, v8);
  return v9;
}

- (_CSEmbedding)csEmbedding
{
  return (_CSEmbedding *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6BA8]), "initWithFormat:dimension:version:vectors:", LODWORD(self->_format), LODWORD(self->_dimension), LOWORD(self->_version), self->_vectors);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t format;
  id v5;

  format = self->_format;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", format, CFSTR("Format"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dimension, CFSTR("Dimension"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vectors, CFSTR("Vectors"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %d, "), CFSTR("Format"), self->_format);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %d, "), CFSTR("Dimension"), self->_dimension);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %d, "), CFSTR("Version"), self->_version);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@>"), CFSTR("Vectors"), self->_vectors);
  return v3;
}

+ (id)fetchEmbeddingWithAssetUUID:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t v21[16];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    +[MADEmbeddingStoreService sharedService](MADEmbeddingStoreService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v22 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:", v15, v10, v11, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", v9);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbedding] Failed to fetch embedding due to nil asset requested", v21, 2u);
  }
  if (a6)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbedding] nil asset requested"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -50, v19);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return a6;
}

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v18[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count"))
  {
    +[MADEmbeddingStoreService sharedService](MADEmbeddingStoreService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:", v9, v10, v11, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbedding] Failed to fetch embedding due to 0 asset requested", v18, 2u);
    }
    if (a6)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbedding] 0 asset requested"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -50, v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return a6;
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    +[MADEmbeddingStoreService sharedService](MADEmbeddingStoreService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchWithEmbeddings:photoLibraryURL:options:error:", v9, v10, v11, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbedding] Invalid incoming embeddings %@", buf, 0xCu);
    }
    if (a6)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbedding] Invalid incoming embeddings"), *MEMORY[0x1E0CB2D50]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -50, v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return a6;
}

+ (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;

  v7 = a4;
  +[MADEmbeddingStoreService sharedService](MADEmbeddingStoreService, "sharedService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:", a3, v7, a5);

}

- (int64_t)format
{
  return self->_format;
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)vectors
{
  return self->_vectors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectors, 0);
}

@end
