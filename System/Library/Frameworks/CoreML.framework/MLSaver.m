@implementation MLSaver

+ (BOOL)saveModelToAssetAtURL:(id)a3 model:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *__p[2];
  char v19;
  _BYTE v20[16];
  std::__shared_weak_count *v21;
  char *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"));
    OArchive::OArchive((uint64_t)v20, (uint64_t)__p, 0);
    if (v19 < 0)
      operator delete(__p[0]);
    v13 = objc_msgSend(a1, "saveModelToArchive:model:error:", v20, v9, a5);
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v22);
    v14 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("URL has nil fileSystemRepresentation"));
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 error:(id *)a5
{
  return +[MLSaver saveModelToArchive:model:compilerOptions:error:](MLSaver, "saveModelToArchive:model:compilerOptions:error:", a3, a4, 0, a5);
}

+ (BOOL)saveModelToArchive:(void *)a3 model:(id)a4 compilerOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  std::__shared_weak_count_vtbl *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  uint64_t *v15;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  BOOL v19;
  void *v20;
  MLCompilerOptions *v21;
  MLCompilerOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  std::string *v29;
  void *v30;
  unint64_t v31;
  MLCompilerOptions *v33;
  void *v34;
  void *v35;
  std::string v36;
  uint64_t v37;
  std::__shared_weak_count *v38;

  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE44D080) & 1) == 0)
  {
    if (a6)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("model does not implement protocol MLModelSpecificationSaver"));
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_11:
    v19 = 0;
    goto LABEL_38;
  }
  v11 = objc_msgSend(v9, "saveModelToSpecification:", a6);
  v12 = (std::__shared_weak_count_vtbl *)v11;
  if (!v11)
    goto LABEL_11;
  v37 = v11;
  v36.__r_.__value_.__r.__words[0] = v11;
  v13 = (std::__shared_weak_count *)operator new();
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5C218;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = v12;
  v38 = v13;
  operator<<((uint64_t)a3, *((_DWORD *)v12->~__shared_weak_count + 11));
  +[MLVersionInfo versionInfoWithString:](MLVersionInfo, "versionInfoWithString:", CFSTR("0.0.0"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char *)v12->~__shared_weak_count == (char *)&CoreML::Specification::_Model_default_instance_
    || (v15 = (uint64_t *)*((_QWORD *)v12->~__shared_weak_count + 2)) == 0
    || v15 == &CoreML::Specification::_ModelDescription_default_instance_
    || (v16 = v15[20]) == 0)
  {
    v20 = v34;
  }
  else
  {
    v17 = *(__int128 **)(v16 + 56);
    if (*((char *)v17 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)v17, *((_QWORD *)v17 + 1));
    }
    else
    {
      v18 = *v17;
      v36.__r_.__value_.__r.__words[2] = *((_QWORD *)v17 + 2);
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v18;
    }
    if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v29 = &v36;
    else
      v29 = (std::string *)v36.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLVersionInfo versionInfoWithString:](MLVersionInfo, "versionInfoWithString:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (+[MLModelIOUtils serializeVersionInfo:archive:error:](MLModelIOUtils, "serializeVersionInfo:archive:error:", v20, a3, a6))
  {
    v21 = (MLCompilerOptions *)v10;
    v22 = v21;
    v35 = v20;
    if (!v21)
      v22 = objc_alloc_init(MLCompilerOptions);
    v33 = v22;
    +[MLModelIOUtils versionForSerializedSpecification:options:error:](MLModelIOUtils, "versionForSerializedSpecification:options:error:", v12, v22, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[MLModelIOUtils serializeVersionInfo:archive:error:](MLModelIOUtils, "serializeVersionInfo:archive:error:", v23, a3, a6))
    {
      if (v21)
      {
        if (a6)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Serializing model to compiled format is not yet supported.  Try with compilerOptions=nil"));
          v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

          v20 = v35;
          goto LABEL_34;
        }
      }
      else
      {
        +[MLModelIOUtils serializeSpecification:toArchive:error:](MLModelIOUtils, "serializeSpecification:toArchive:error:", v12, a3, a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          objc_msgSend(v24, "outputFiles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v25, "outputFiles");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            if (v28)
            {
              v19 = 1;
              goto LABEL_33;
            }
          }
          else
          {

          }
        }
      }
    }
    v19 = 0;
    goto LABEL_33;
  }
  v19 = 0;
LABEL_34:

  do
    v31 = __ldaxr(p_shared_owners);
  while (__stlxr(v31 - 1, p_shared_owners));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_38:

  return v19;
}

+ (BOOL)copyModelAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  char v16;
  id v17;
  BOOL v18;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v8, 1, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v10)
  {
    objc_msgSend(v7, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v11;
    v14 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v7, v13, &v21);
    v15 = v21;

    if ((v14 & 1) != 0)
    {
      v20 = v15;
      v16 = objc_msgSend(v9, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v8, v13, 0, 0, 0, &v20);
      v17 = v20;

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v9, "removeItemAtURL:error:", v10, 0);
        v18 = 1;
      }
      else
      {
        if (a5)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, v17, CFSTR("Failed to replace model from %@ to %@"), v13, v8);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "removeItemAtURL:error:", v10, 0);
        v18 = 0;
      }
      v15 = v17;
    }
    else
    {
      if (a5)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, v15, CFSTR("Failed to copy model from %@ to %@"), v7, v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "removeItemAtURL:error:", v10, 0);
      v18 = 0;
    }

    v11 = v15;
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, v11, CFSTR("Failed to create a working directory URL"));
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
