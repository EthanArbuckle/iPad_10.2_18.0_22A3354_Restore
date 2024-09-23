@implementation MLReporterUtils

+ (id)hashFileAt:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE v12[32];
  void *data;
  CC_LONG len[2];
  void *__p[2];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AD6ED8]();
    objc_msgSend(v5, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "fileSystemRepresentation"));
    Archiver::MMappedFile::MMappedFile((uint64_t)v12, (__int128 *)__p);
    if (v16 < 0)
      operator delete(__p[0]);

    if (*(_QWORD *)len >= 0xFFFFFFFFuLL)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Input file too large to hash"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v12);
      v9 = 0;
    }
    else
    {
      CC_SHA256(data, len[0], (unsigned __int8 *)__p);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v12);
      v10 = 0;
    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v9 = 0;
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("fileURL is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

+ (BOOL)archiveModelDetails:(const void *)a3 withName:(const void *)a4 toArchive:(void *)a5 error:(id *)a6
{
  char *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  BOOL v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *__p[2];
  char v24;
  char v25[8];
  uint64_t v26;
  std::__shared_weak_count *v27;
  char *v28[3];

  if (*((_QWORD *)a3 + 2))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "analytics");
    v9 = OArchive::nestedArchive((char *)a5, (uint64_t)__p);
    v25[0] = *v9;
    v10 = (std::__shared_weak_count *)*((_QWORD *)v9 + 2);
    v26 = *((_QWORD *)v9 + 1);
    v27 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v28, (_QWORD *)v9 + 3);
    if (v24 < 0)
      operator delete(__p[0]);
    operator<<((uint64_t)v25, (uint64_t *)a4);
    operator<<((uint64_t)v25, *((_QWORD *)a3 + 2));
    v15 = *(char **)a3;
    v13 = (char *)a3 + 8;
    v14 = v15;
    if (v15 != v13)
    {
      do
      {
        operator<<((uint64_t)v25, (uint64_t *)v14 + 4);
        operator<<((uint64_t)v25, (uint64_t *)v14 + 7);
        v16 = (char *)*((_QWORD *)v14 + 1);
        if (v16)
        {
          do
          {
            v17 = v16;
            v16 = *(char **)v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (char *)*((_QWORD *)v14 + 2);
            v18 = *(_QWORD *)v17 == (_QWORD)v14;
            v14 = v17;
          }
          while (!v18);
        }
        v14 = v17;
      }
      while (v17 != v13);
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v28[1]);
    v19 = v27;
    if (v27)
    {
      v20 = (unint64_t *)&v27->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  return 1;
}

@end
