@implementation NTKKaleidoscopeCoordinatorCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_4 != -1)
    dispatch_once(&sharedCache_onceToken_4, &__block_literal_global_173);
  return (id)sharedCache_cache_1;
}

void __46__NTKKaleidoscopeCoordinatorCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache_1;
  sharedCache_cache_1 = v0;

}

- (void)setLibraryCollection:(id)a3
{
  NTKFaceCollection *v5;
  NSMutableArray *v6;
  NSMutableArray *pathsToTouch;
  NSMutableDictionary *v8;
  NSMutableDictionary *pathsToWrite;
  NSMutableArray *v10;
  NTKFaceCollection *v11;

  v5 = (NTKFaceCollection *)a3;
  if (self->_libraryCollection != v5)
  {
    v11 = v5;
    -[NTKFaceCollection addObserver:](v5, "addObserver:", self);
    -[NTKFaceCollection removeObserver:](self->_libraryCollection, "removeObserver:", self);
    objc_storeStrong((id *)&self->_libraryCollection, a3);
    -[NTKKaleidoscopeCoordinatorCache _computeKaleidoscopeFaceCount](self, "_computeKaleidoscopeFaceCount");
    if (self->_libraryCollection)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      pathsToTouch = self->_pathsToTouch;
      self->_pathsToTouch = v6;

      v8 = (NSMutableDictionary *)objc_opt_new();
      pathsToWrite = self->_pathsToWrite;
      self->_pathsToWrite = v8;
    }
    else
    {
      v10 = self->_pathsToTouch;
      self->_pathsToTouch = 0;

      pathsToWrite = self->_pathsToWrite;
      self->_pathsToWrite = 0;
    }

    v5 = v11;
  }

}

- (id)provideAtlasBacking:(id)a3 uuid:(id)a4 uuidLuma:(id)a5 uuidChroma:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  id v24;
  void *v26;
  uint8_t buf[8];
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1BCCA7FA8]();
  objc_msgSend(off_1E6BCA6D0, "atlasBackingWithImage:uuid:mipmap:", v9, v10, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  v16 = v12;
  v26 = v9;
  if (!v14)
  {
    v19 = (void *)v13;
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      v21 = "[kaleidoscope] input backing is nil";
      v22 = (uint8_t *)&v28;
LABEL_19:
      _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    }
LABEL_20:

    goto LABEL_21;
  }
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v14, "structure");
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing format is not srgba8888", buf, 2u);
  }

  if (!HIBYTE(v30))
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing mipmaps expected", buf, 2u);
    }

  }
  if (HIDWORD(v28) != (_DWORD)v29)
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] input backing is not square", buf, 2u);
    }

    if ((HIDWORD(v28) & (HIDWORD(v28) - 1)) == 0)
      goto LABEL_16;
LABEL_17:
    v19 = (void *)v13;
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "[kaleidoscope] input backing is not POT";
      v22 = buf;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if ((HIDWORD(v28) & (HIDWORD(v28) - 1)) != 0)
    goto LABEL_17;
LABEL_16:
  v19 = (void *)v13;
LABEL_21:

  v24 = 0;
  objc_autoreleasePoolPop(v19);

  return 0;
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  char isKindOfClass;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[NTKKaleidoscopeCoordinatorCache _computeKaleidoscopeFaceCount](self, "_computeKaleidoscopeFaceCount");
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  char isKindOfClass;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[NTKKaleidoscopeCoordinatorCache _computeKaleidoscopeFaceCount](self, "_computeKaleidoscopeFaceCount");
}

- (void)_computeKaleidoscopeFaceCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  v3 = -[NTKFaceCollection numberOfFaces](self->_libraryCollection, "numberOfFaces");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 0; i != v4; ++i)
    {
      -[NTKFaceCollection faceAtIndex:](self->_libraryCollection, "faceAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v5 += objc_opt_isKindOfClass() & 1;

    }
  }
  else
  {
    v5 = 0;
  }
  self->_kaleidoscopeFaceCount = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsToWrite, 0);
  objc_storeStrong((id *)&self->_pathsToTouch, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_libraryCollection, 0);
}

@end
