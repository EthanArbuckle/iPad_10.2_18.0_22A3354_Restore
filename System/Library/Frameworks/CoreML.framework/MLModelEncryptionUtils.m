@implementation MLModelEncryptionUtils

+ (NSData)sinfData
{
  return (NSData *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("AAADgHNpbmYAAAAMZnJtYQAAAAAAAAAUc2NobQAAAABpdHVuAAAAAAAAA1hzY2hpAAAADHVzZXIAAAAAAAAADGtleSAAAAABAAAAGGl2aXbZofvYoEHG+Bnh6TFdS4nRAAAAWHJpZ2hwbGF0AAAAAnRyYW7aSnJxdG9vbEQ5OTltZWRpAAAAgG1vZGUAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQhuYW1lAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcBwcml2dHT7EFcJPPVjnUp9b53GcsqIfPZ2Zwq2GeQ3aigPDGVuD0OGm6NZEzuiK3dNectFh1Z5LE06hTFwi67WA/4z+7xXmX0aMBmYfYmL9dVVxwOKwJ1bpkkZkXyil21zxsKwHVn6ZSgegaKm9C5YQcyL/uY9aqYkLS2+qKVWyx/3pBVY1cAAPyNpVDBsNIpNGguNmEEA4l7IhB8Q+m1VAPCcxgngaFT6ztBjdUfseVYj3fh28t7NXhdQbZB7PNDxU2VToqvN2t1f6Gco/qc8fRXXGo12pLH346qDQezYMlbBS0w76GtyWoK+oLu3FTMjjCi7Kg1SyDDBbbDsg0RVMkyHhZ3TOFmwJklAYL7HxsWa+rCRM4Q4YOJobScLgeZ/7daGTAeX03OMT/iWgPHf+ejCVQGje+Mm+a8P5UzKpHhV9ruwF2usDUoynhmyIYr/EnrcUyQdPjLX8wG7BYMJMhh/vuaIfkwVt1M2kgFJ9T8Kz+JczEJSfLIwhW6Uy+ltyRrVnlaGfoPdrohv4P4FgaBuaUFSoKiXMuZr4IXhEHh9sCoAv6sSDIAFURgBX1wtn9HWAAAAAAAAAAA="), 0);
}

+ (BOOL)addEncryptionHeaderToUnencryptedFile:(id)a3 saveToFile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  id v13;
  id v14;
  int v15;
  int v16;
  size_t v17;
  const void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  _BYTE v23[32];
  const void *v24;
  size_t v25;
  __int128 __p;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "filePathURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filePathURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v11)
  {
    objc_msgSend(v7, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v13, "fileSystemRepresentation"));
    Archiver::MMappedFile::MMappedFile((uint64_t)v23, &__p);
    if (SHIBYTE(v27) < 0)
      operator delete((void *)__p);

    v14 = objc_retainAutorelease(v8);
    v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 514, 420);
    v16 = v15;
    if (v15 == -1)
    {
      if (a5)
      {
        +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("Error creating file %s"), objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation"));
        v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v12 = 0;
        *a5 = v19;
        goto LABEL_20;
      }
    }
    else
    {
      v18 = v24;
      v17 = v25;
      v32 = 0;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      *(_QWORD *)&__p = 0x60000002454E4D4CLL;
      *((_QWORD *)&__p + 1) = v25;
      v27 = 0;
      if (write(v15, &__p, 0x60uLL) == 96)
      {
        if (v17 == write(v16, v18, v17))
        {
          close(v16);
          v12 = 1;
LABEL_20:
          Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v23);
          goto LABEL_21;
        }
        if (a5)
        {
          v20 = objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation");
          v21 = CFSTR("Error saving data to %s");
          goto LABEL_17;
        }
      }
      else if (a5)
      {
        v20 = objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation");
        v21 = CFSTR("Error saving ENML header to %s");
LABEL_17:
        +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, v21, v20);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    v12 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("saveToFile URL (%@) should be different from fileURL (%@)"), v8, v7);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_21:

  return v12;
}

+ (BOOL)encryptFile:(id)a3 withKey:(id)a4 iv:(id)a5 saveToFile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  size_t v16;
  unint64_t v17;
  void *v18;
  char *dataOut;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  BOOL v24;
  size_t v25;
  unsigned int v26;
  _OWORD *v27;
  const void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  size_t v33;
  const __CFString *v35;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  const void *v41;
  const void *v42;
  uint64_t v43;
  int __fd;
  id v45;
  size_t v47;
  _BYTE v48[32];
  uint64_t v49;
  void *v50;
  void *__p[2];
  _BYTE v52[80];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v45 = a6;
  if (objc_msgSend(v11, "length") == 16)
  {
    if (!v12 || objc_msgSend(v12, "length") == 16)
    {
      objc_msgSend(v10, "path");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "fileSystemRepresentation"));
      Archiver::MMappedFile::MMappedFile((uint64_t)v48, (__int128 *)__p);
      if ((v52[7] & 0x80000000) != 0)
        operator delete(__p[0]);

      v14 = objc_retainAutorelease(v45);
      v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 514, 420);
      if (v15 == -1)
      {
        if (a7)
        {
          +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, CFSTR("Error creating file %s"), objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation"));
          v24 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
          Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v48);
          goto LABEL_41;
        }
      }
      else
      {
        v16 = (size_t)v50;
        v43 = v49;
        v17 = (unint64_t)v50 + 4191;
        memset(&v52[8], 0, 72);
        __p[0] = (void *)0x60000002454E4D4CLL;
        __p[1] = v50;
        *(_QWORD *)v52 = ((unint64_t)v50 + 4191) >> 12;
        v40 = *(_QWORD *)v52;
        __fd = v15;
        v38 = v11;
        v39 = v10;
        v37 = v12;
        write(v15, __p, 0x50uLL);
        v18 = malloc_type_calloc(0x1000uLL, 1uLL, 0xFA1CA6B1uLL);
        dataOut = (char *)malloc_type_calloc(0x1000uLL, 1uLL, 0x654FC242uLL);
        v20 = objc_retainAutorelease(v11);
        v42 = (const void *)objc_msgSend(v20, "bytes");
        v41 = (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        v21 = objc_msgSend(v20, "length");
        if (v17 < 0x1000)
        {
          v22 = 0;
LABEL_32:
          v11 = v38;
          v10 = v39;
          v12 = v37;
          write(__fd, (const void *)(v43 + v22), v16 - v22);
          free(v18);
          free(dataOut);
          close(__fd);
          v24 = 1;
          goto LABEL_40;
        }
        v25 = v21;
        v22 = 0;
        v26 = 1;
        v27 = v18;
        while (1)
        {
          v28 = (const void *)(v43 + v22);
          v47 = 0;
          bzero(v18, 0x1000uLL);
          if (v26 == 1)
          {
            v29 = *(_OWORD *)v52;
            *v27 = *(_OWORD *)__p;
            v27[1] = v29;
            v30 = *(_OWORD *)&v52[16];
            v31 = *(_OWORD *)&v52[32];
            v32 = *(_OWORD *)&v52[64];
            v27[4] = *(_OWORD *)&v52[48];
            v27[5] = v32;
            v27[2] = v30;
            v27[3] = v31;
            v27 += 6;
            if (v16 > 0xF9F)
            {
              memcpy(v27, v28, 0xFA0uLL);
              v33 = 4000;
            }
            else
            {
              memcpy(v27, v28, v16);
              v33 = v16;
            }
          }
          else
          {
            if (v16 >= v22 + 4096)
              v33 = 4096;
            else
              v33 = v16 - v22;
            memcpy(v18, v28, v33);
          }
          if (CCCrypt(0, 0, 0, v42, v25, v41, v18, 0x1000uLL, dataOut, 0x1000uLL, &v47))
          {
            v11 = v38;
            v10 = v39;
            v12 = v37;
            if (!a7)
              goto LABEL_38;
            v35 = CFSTR("Failed to encrypt data");
            goto LABEL_37;
          }
          if (v47 != 4096)
            break;
          if (v26 == 1)
            write(__fd, dataOut + 80, 0xFB0uLL);
          else
            write(__fd, dataOut, 0x1000uLL);
          v22 += v33;
          if (v40 <= v26++)
            goto LABEL_32;
        }
        v11 = v38;
        v10 = v39;
        v12 = v37;
        if (!a7)
          goto LABEL_38;
        v35 = CFSTR("Encryption outputSize does not match outputWritten");
LABEL_37:
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", v35);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
        free(v18);
        free(dataOut);
        close(__fd);
      }
      v24 = 0;
      goto LABEL_40;
    }
    if (a7)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("IV is specified but it's length %lu does not match encryption block size %u"), objc_msgSend(v11, "length"), 16);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_14:
    v24 = 0;
    goto LABEL_41;
  }
  if (!a7)
    goto LABEL_14;
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Key length %lu does not match encryption block size %u"), objc_msgSend(v11, "length"), 16);
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v24 = 0;
  *a7 = v23;
LABEL_41:

  return v24;
}

@end
