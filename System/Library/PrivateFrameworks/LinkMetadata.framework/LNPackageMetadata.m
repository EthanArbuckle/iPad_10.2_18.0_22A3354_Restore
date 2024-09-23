@implementation LNPackageMetadata

- (LNPackageMetadata)initWithIncludes:(id)a3
{
  id v4;
  LNPackageMetadata *v5;
  uint64_t v6;
  NSArray *includes;
  LNPackageMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPackageMetadata;
  v5 = -[LNPackageMetadata init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    includes = v5->_includes;
    v5->_includes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includes, 0);
}

- (id)resolveWithBundle:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v22;
  id v23;
  id v24;

  objc_msgSend(a3, "executablePathWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v9 = MEMORY[0x1E0C9AA60];
    v10 = -[LNPackageMetadata resolveWithImagePath:executablePath:rpaths:partialResults:error:](self, "resolveWithImagePath:executablePath:rpaths:partialResults:error:", v6, v8, MEMORY[0x1E0C9AA60], v7, &v24);
    v11 = v24;

    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".debug.dylib"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    LOBYTE(v9) = -[LNPackageMetadata resolveWithImagePath:executablePath:rpaths:partialResults:error:](self, "resolveWithImagePath:executablePath:rpaths:partialResults:error:", v12, v13, v9, v7, &v23);
    v14 = v23;

    if ((v9 & 1) != 0)
    {
      v15 = v14;
    }
    else
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".preview.dylib"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      v19 = -[LNPackageMetadata resolveWithImagePath:executablePath:rpaths:partialResults:error:](self, "resolveWithImagePath:executablePath:rpaths:partialResults:error:", v17, v18, MEMORY[0x1E0C9AA60], v7, &v22);
      v15 = v22;

      if (!v10 && !v19)
      {
        if (v11)
        {
          v20 = objc_retainAutorelease(v11);
        }
        else
        {
          if (!v15)
          {
            v16 = 0;
            goto LABEL_13;
          }
          v20 = objc_retainAutorelease(v15);
          v15 = v20;
        }
        v16 = 0;
        *a4 = v20;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    objc_msgSend(v7, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)resolveWithImagePath:(id)a3 executablePath:(id)a4 rpaths:(id)a5 partialResults:(id)a6 error:(id *)a7
{
  NSObject *v11;
  id v12;
  id *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  BOOL v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  __int128 v50;
  uint64_t v51;
  id v52;
  id v53;
  NSObject *v54;
  id v56;
  NSObject *obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  NSObject *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v58 = a4;
  v52 = a5;
  v56 = a6;
  -[LNPackageMetadata linkerSymbolNames](self, "linkerSymbolNames");
  v54 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v54, "count"))
  {
    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__6391;
    v81 = __Block_byref_object_dispose__6392;
    v82 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__6391;
    v75 = __Block_byref_object_dispose__6392;
    v76 = 0;
    getLNLogCategoryMetadata();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v86 = (uint64_t)v53;
      v87 = 2112;
      v88 = v54;
      _os_log_impl(&dword_19A9C7000, v11, OS_LOG_TYPE_DEBUG, "resolving %@ looking for symbols %@", buf, 0x16u);
    }

    v12 = objc_retainAutorelease(v53);
    v13 = a7;
    v14 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke;
    v67[3] = &unk_1E39A1AC0;
    v68 = v54;
    v69 = &v77;
    v70 = &v71;
    v15 = macho_good_enough_slice(v14, v67);
    v16 = v15;
    if (v72[5] && v78[5])
    {
      objc_msgSend(v52, "arrayByAddingObjectsFromArray:");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = (id)v72[5];
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v64 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            if (objc_msgSend(v22, "length"))
            {
              objc_msgSend(v12, "stringByDeletingLastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              _URLFromLibraryName(v22, 0, v23, v58, v17);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                getLNLogCategoryMetadata();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v86 = (uint64_t)v22;
                  v87 = 2112;
                  v88 = v17;
                  _os_log_impl(&dword_19A9C7000, v44, OS_LOG_TYPE_ERROR, "could not resolve library name %@ to path: tried %@", buf, 0x16u);
                }

                if (a7)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithErrno:forFilePath:", 85, v12);
                  v41 = 0;
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
LABEL_59:
                  v41 = 0;
                }
                goto LABEL_60;
              }
              v25 = (void *)_CFBundleCopyBundleURLForExecutableURL();
              objc_msgSend(v25, "absoluteURL");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v18, "containsObject:", v26) & 1) == 0)
                objc_msgSend(v18, "addObject:", v26);

            }
          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
          if (v19)
            continue;
          break;
        }
      }

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v18;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
      if (v27)
      {
        v51 = *(_QWORD *)v60;
        *(_QWORD *)&v28 = 138412546;
        v50 = v28;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v60 != v51)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            if ((objc_msgSend(v56, "containsObject:", v30, v50) & 1) == 0)
            {
              objc_msgSend(v56, "addObject:", v30);
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "_initUniqueWithURL:", v30);
              v32 = -[LNPackageMetadata initFrom:error:]([LNPackageMetadata alloc], "initFrom:error:", v31, a7);
              if (!v32)
              {
                getLNLogCategoryMetadata();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v30, "path");
                  v34 = objc_claimAutoreleasedReturnValue();
                  v35 = (void *)v34;
                  v36 = a7;
                  if (a7)
                    v36 = *a7;
                  *(_DWORD *)buf = v50;
                  v86 = v34;
                  v87 = 2112;
                  v88 = v36;
                  _os_log_impl(&dword_19A9C7000, v33, OS_LOG_TYPE_ERROR, "could not get package metadata from bundle %@, %@", buf, 0x16u);

                }
              }
              objc_msgSend(v31, "executablePathWithError:", a7);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37)
              {
                getLNLogCategoryMetadata();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v30, "path");
                  v46 = objc_claimAutoreleasedReturnValue();
                  v47 = (void *)v46;
                  v48 = a7;
                  if (a7)
                    v48 = *a7;
                  *(_DWORD *)buf = v50;
                  v86 = v46;
                  v87 = 2112;
                  v88 = v48;
                  _os_log_impl(&dword_19A9C7000, v45, OS_LOG_TYPE_ERROR, "bundle %@ has no executable, %@", buf, 0x16u);

                }
                v37 = 0;
LABEL_58:

                goto LABEL_59;
              }
              if (!v32)
                goto LABEL_58;
              v38 = objc_msgSend(v32, "resolveWithImagePath:executablePath:rpaths:partialResults:error:", v37, v58, v17, v56, a7);

              if (!v38)
                goto LABEL_59;
            }
          }
          v27 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
          if (v27)
            continue;
          break;
        }
      }

      getLNLogCategoryMetadata();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v56, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "if_map:", &__block_literal_global_30_6400);
        v40 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v86 = (uint64_t)v12;
        v87 = 2112;
        v88 = v40;
        _os_log_impl(&dword_19A9C7000, obj, OS_LOG_TYPE_DEBUG, "success: %@ includes %@", buf, 0x16u);

      }
      v41 = 1;
LABEL_60:

    }
    else
    {
      if (a7)
      {
        v42 = (void *)MEMORY[0x1E0CB35C8];
        if (!(_DWORD)v15)
          v16 = *__error();
        objc_msgSend(v42, "errorWithErrno:forFilePath:", v16, v12);
        v13 = a7;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      getLNLogCategoryMetadata();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if (v13)
          v43 = *v13;
        else
          v43 = 0;
        *(_DWORD *)buf = 138412546;
        v86 = (uint64_t)v12;
        v87 = 2112;
        v88 = v43;
        _os_log_impl(&dword_19A9C7000, v17, OS_LOG_TYPE_DEBUG, "could not resolve package includes in %@ - %@", buf, 0x16u);
      }
      v41 = 0;
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v77, 8);

  }
  else
  {
    v41 = 1;
  }

  return v41;
}

- (id)linkerSymbolNames
{
  void *v2;
  void *v3;

  -[LNPackageMetadata includes](self, "includes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_6411);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)includes
{
  return self->_includes;
}

- (id)initFrom:(id)a3 error:(id *)a4
{
  id result;

  LNPackageMetadata.init(from:)(a3);
  return result;
}

- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19AB824B8();
  MEMORY[0x1E0C80A78](v9);
  sub_19AB82488();
  if (a4)
  {
    sub_19AB82488();
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v10, 1, v9);
  LNPackageMetadata.init(metadataFileURL:bundleURL:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNPackageMetadata includes](self, "includes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("includes"));

}

- (LNPackageMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNPackageMetadata *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("includes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[LNPackageMetadata initWithIncludes:](self, "initWithIncludes:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPackageMetadata includes](self, "includes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, includes: %lu>"), v5, self, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)verboseDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPackageMetadata includes](self, "includes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, includes: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNPackageMetadata includes](self, "includes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNPackageMetadata *v4;
  LNPackageMetadata *v5;
  LNPackageMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNPackageMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNPackageMetadata includes](self, "includes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNPackageMetadata includes](v6, "includes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToArray:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

void __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v6;
  id v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t i;
  id v11;
  _QWORD *v12;
  int v13;
  _QWORD *v14;
  uint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  _DWORD *v23;
  uint64_t *v24;
  unsigned int v25;
  int v26;
  unsigned int j;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = mh_validate(a2, a4);
  *__error() = v6;
  if (v6)
    return;
  v34 = a1;
  v7 = *(id *)(a1 + 32);
  v8 = (uint64_t *)malloc_type_malloc(8 * objc_msgSend(v7, "count"), 0x10040436913F5uLL);
  if (v8)
  {
    v9 = objc_msgSend(v7, "count");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v7, "objectAtIndex:", i);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v8[i] = objc_msgSend(v11, "UTF8String");

      }
    }
  }
  else
  {
    v9 = 0;
  }

  v12 = malloc_type_malloc(8 * v9, 0x10040436913F5uLL);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v13 = macho_for_each_imported_symbol();
  if (!v13)
  {
    if (v36[3] >= v9)
      goto LABEL_18;
    v14 = v12;
    v15 = v8;
    v16 = v9;
    do
    {
      if (!*v14)
      {
        getLNLogCategoryMetadata();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = *v15;
          *(_DWORD *)buf = 136315138;
          v40 = v18;
        }

      }
      ++v15;
      ++v14;
      --v16;
    }
    while (v16);
    v13 = 22;
  }
  free(v12);
  v12 = 0;
  *__error() = v13;
LABEL_18:
  _Block_object_dispose(&v35, 8);
  v19 = a2 + 8;
  v20 = a2[4];
  if (v20)
  {
    v21 = 0;
    v22 = 0;
    v23 = a2 + 8;
    while (1)
    {
      if (*v23 == -2147483620)
      {
        if (!mh_cmdstr((uint64_t)v23))
        {
          if (!v12)
            goto LABEL_40;
          goto LABEL_39;
        }
        ++v21;
        v20 = a2[4];
      }
      ++v22;
      v23 = (_DWORD *)((char *)v23 + v23[1]);
      if (v22 >= v20)
        goto LABEL_26;
    }
  }
  v21 = 0;
LABEL_26:
  v24 = (uint64_t *)malloc_type_malloc(8 * (v21 + 1), 0x10040436913F5uLL);
  v25 = a2[4];
  if (v25)
  {
    v26 = 0;
    for (j = 0; j < v25; ++j)
    {
      if (*v19 == -2147483620)
      {
        v24[v26++] = mh_cmdstr((uint64_t)v19);
        v25 = a2[4];
      }
      v19 = (_DWORD *)((char *)v19 + v19[1]);
    }
  }
  else
  {
    v26 = 0;
  }
  v24[v26] = 0;
  if (v12 && v24)
  {
    strlist_to_array(v24, v21);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(v34 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    strlist_to_array(v12, v9);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(v34 + 48) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

  }
  else if (!v12)
  {
    goto LABEL_38;
  }
  free(v12);
LABEL_38:
  v12 = v24;
LABEL_39:
  free(v12);
LABEL_40:
  if (v8)
    free(v8);
}

uint64_t __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

uint64_t __38__LNPackageMetadata_linkerSymbolNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_$s%@"), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
