@implementation NSFileAttributes

+ (id)_attributesAtPath:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  int *v10;
  NSError *v11;
  NSError *v12;
  id result;
  NSFileAttributes *v14;
  uint64_t v15;
  NSDictionary *v16;
  int v17;
  uint64_t v18;
  _QWORD v19[3];
  char v20[1026];
  stat v21;
  uint64_t v22;

  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  memset(&v21, 0, sizeof(v21));
  if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "getFileSystemRepresentation:maxLength:withPath:", v20, 1024, a3))
  {
    if (a6)
    {
      v11 = _NSErrorWithFilePath(256, (uint64_t)a3);
      goto LABEL_7;
    }
    return 0;
  }
  if (lstat(v20, &v21))
  {
    if (a6)
    {
      v10 = __error();
      v11 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v10, (uint64_t)a3, 1, 0, 0);
LABEL_7:
      v12 = v11;
      result = 0;
      *a6 = v12;
      return result;
    }
    return 0;
  }
  v14 = +[NSFileAttributes attributesWithStat:](NSFileAttributes, "attributesWithStat:", &v21);
  v15 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  if (v8)
    a6 = 0;
  if (+[NSFileAttributes _populateCatInfo:forURL:statInfo:error:](NSFileAttributes, "_populateCatInfo:forURL:statInfo:error:", &v14->catInfo, v15, &v21, a6)|| (result = 0, v8))
  {
    v16 = _attributesAtPath(v20, a5, (NSError **)a6);
    v14->extendedAttrs = v16;
    if (!v16 && !v8)
      return 0;
    v17 = v21.st_mode & 0xF000;
    if (v17 == 0x8000 || v17 == 0x4000)
    {
      v18 = 0;
      v19[1] = 0;
      v19[2] = 0;
      v19[0] = 0x4000000000000005;
      if (getattrlist(v20, v19, &v18, 8uLL, 1u) || HIDWORD(v18) == -1)
        v14->fileProtectionClass = 0;
      else
        v14->fileProtectionClass = HIDWORD(v18);
    }
    return v14;
  }
  return result;
}

+ (id)attributesWithStat:(stat *)a3
{
  char *v4;

  v4 = (char *)objc_allocWithZone((Class)a1);
  memmove(v4 + 16, a3, 0x90uLL);
  return v4;
}

+ (BOOL)_populateCatInfo:(id *)a3 forURL:(id)a4 statInfo:(stat *)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0C999B0];
  v8 = *MEMORY[0x1E0C998E8];
  v13[0] = *MEMORY[0x1E0C999B0];
  v13[1] = v8;
  v9 = (void *)objc_msgSend(a4, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2, a5), a6);
  v10 = v9;
  if (v9)
  {
    a3->var0 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v7), "BOOLValue");
    *(_DWORD *)&a3->var2 |= 1u;
    v11 = (void *)objc_msgSend(v10, "objectForKey:", v8);
    if (v11)
    {
      a3->var1 = (id)objc_msgSend(v11, "copy");
      *(_DWORD *)&a3->var2 |= 2u;
    }
  }
  return v10 != 0;
}

+ (id)attributesAtPath:(id)a3 traverseLink:(BOOL)a4
{
  id v4;
  NSString *v5;
  NSString *v6;

  v4 = a3;
  if (a4)
  {
    v5 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "destinationOfSymbolicLinkAtPath:error:", a3, 0);
    v6 = v5;
    if (v5 && !-[NSString isAbsolutePath](v5, "isAbsolutePath"))
      v6 = (NSString *)objc_msgSend((id)objc_msgSend(v4, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v6);
    if (v6)
      a3 = v6;
    else
      a3 = v4;
  }
  return +[NSFileAttributes _attributesAtPath:partialReturn:filterResourceFork:error:](NSFileAttributes, "_attributesAtPath:partialReturn:filterResourceFork:error:", a3, 1, 1, 0);
}

- (unint64_t)count
{
  NSMutableDictionary *dict;

  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }
  return -[NSMutableDictionary count](dict, "count");
}

+ (id)_attributesAtURL:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  NSFileManager *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  NSError *v14;
  uint64_t v15;
  uint64_t v16;
  NSError *v17;
  id result;
  NSFileAttributes *v19;
  NSDictionary *v20;
  int v21;
  int v22;
  char v23[1026];
  stat v24;
  uint64_t v25;

  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!objc_msgSend(a3, "isFileURL"))
  {
    if (a6)
    {
      v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("NSURL"));
      v16 = 262;
LABEL_11:
      v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v16, v15);
      goto LABEL_12;
    }
    return 0;
  }
  v11 = objc_msgSend(a3, "path");
  if (!v11)
  {
    if (a6)
    {
      v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("NSURL"));
      v16 = 260;
      goto LABEL_11;
    }
    return 0;
  }
  v12 = v11;
  memset(&v24, 0, sizeof(v24));
  if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:](v10, "getFileSystemRepresentation:maxLength:withPath:", v23, 1024, v11))
  {
    if (a6)
    {
      v14 = _NSErrorWithFilePath(256, v12);
      goto LABEL_12;
    }
    return 0;
  }
  if (lstat(v23, &v24))
  {
    if (a6)
    {
      v13 = __error();
      v14 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v13, v12, 1, 0, 0);
LABEL_12:
      v17 = v14;
      result = 0;
      *a6 = v17;
      return result;
    }
    return 0;
  }
  v19 = +[NSFileAttributes attributesWithStat:](NSFileAttributes, "attributesWithStat:", &v24);
  if (v8)
    a6 = 0;
  if (+[NSFileAttributes _populateCatInfo:forURL:statInfo:error:](NSFileAttributes, "_populateCatInfo:forURL:statInfo:error:", &v19->catInfo, a3, &v24, a6)|| (result = 0, v8))
  {
    v20 = _attributesAtPath(v23, a5, (NSError **)a6);
    v19->extendedAttrs = v20;
    if (!v20 && !v8)
      return 0;
    v21 = v24.st_mode & 0xF000;
    if (v21 == 0x8000 || v21 == 0x4000)
    {
      v22 = _NSFileProtectionValueForPath(v23);
      if (v22 == -1)
        v19->fileProtectionClass = 0;
      else
        v19->fileProtectionClass = v22;
    }
    return v19;
  }
  return result;
}

- (unint64_t)fileSize
{
  return self->statInfo.st_size;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAttributes;
  -[NSFileAttributes dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(id)a3
{
  NSMutableDictionary *dict;
  __darwin_ino64_t st_nlink;
  unsigned int st_mode;
  uint64_t v9;
  _BOOL8 extensionHidden;
  BOOL v11;
  uint64_t st_uid;
  unsigned int v13;

  dict = self->dict;
  if (dict)
    return (id)-[NSMutableDictionary objectForKey:](dict, "objectForKey:", a3);
  if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileModificationDate")))
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)self->statInfo.st_mtimespec.tv_sec- *MEMORY[0x1E0C9ADF8]+ (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001);
  if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileSize")))
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->statInfo.st_size);
  if (objc_msgSend(a3, "isEqual:", CFSTR("NSFilePosixPermissions")))
  {
    st_nlink = self->statInfo.st_mode & 0xFFF;
    return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", st_nlink);
  }
  if (!objc_msgSend(a3, "isEqual:", CFSTR("NSFileType")))
  {
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileReferenceCount")))
    {
      st_nlink = self->statInfo.st_nlink;
      return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", st_nlink);
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileSystemNumber")))
    {
      st_nlink = self->statInfo.st_dev;
      return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", st_nlink);
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileSystemFileNumber")))
    {
      st_nlink = self->statInfo.st_ino;
      return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", st_nlink);
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileOwnerAccountName")))
      return __NSUserAccountNumberToName(self->statInfo.st_uid);
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileGroupOwnerAccountName")))
      return __NSGroupAccountNumberToName(self->statInfo.st_gid);
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileDeviceIdentifier")))
    {
      if ((self->statInfo.st_mode & 0xB000 | 0x4000) == 0x6000)
      {
        st_nlink = self->statInfo.st_rdev;
        return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", st_nlink);
      }
      return 0;
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileExtensionHidden")))
    {
      if ((*(_BYTE *)&self->catInfo.validFields & 1) != 0)
      {
        extensionHidden = self->catInfo.extensionHidden;
        return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", extensionHidden);
      }
      return 0;
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileCreationDate")))
    {
      if ((*(_BYTE *)&self->catInfo.validFields & 2) != 0)
        return self->catInfo.creationDate;
      return 0;
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileImmutable")))
    {
      v11 = (self->statInfo.st_flags & 0x20002) == 0;
    }
    else
    {
      if (!objc_msgSend(a3, "isEqual:", CFSTR("NSFileAppendOnly")))
      {
        if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileOwnerAccountID")))
        {
          st_uid = self->statInfo.st_uid;
        }
        else
        {
          if (!objc_msgSend(a3, "isEqual:", CFSTR("NSFileGroupOwnerAccountID")))
          {
            if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileExtendedAttributes")))
              return self->extendedAttrs;
            if (objc_msgSend(a3, "isEqual:", CFSTR("NSFileProtectionKey")))
            {
              v13 = self->fileProtectionClass - 1;
              if (v13 < 7)
                return off_1E0F4E258[v13];
            }
            return 0;
          }
          st_uid = self->statInfo.st_gid;
        }
        return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", st_uid);
      }
      v11 = (self->statInfo.st_flags & 0x40004) == 0;
    }
    extensionHidden = !v11;
    return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", extensionHidden);
  }
  st_mode = self->statInfo.st_mode;
  if ((st_mode & 0x1000) != 0)
    return CFSTR("NSFileTypeUnknown");
  v9 = (st_mode >> 13) - 1;
  if (v9 >= 6)
    return CFSTR("NSFileTypeUnknown");
  else
    return off_1E0F4E290[v9];
}

- (id)keyEnumerator
{
  NSMutableDictionary *dict;

  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }
  return (id)-[NSMutableDictionary keyEnumerator](dict, "keyEnumerator");
}

- (id)fileModificationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)self->statInfo.st_mtimespec.tv_sec- *MEMORY[0x1E0C9ADF8]+ (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001);
}

- (id)fileOwnerAccountName
{
  return __NSUserAccountNumberToName(self->statInfo.st_uid);
}

- (unint64_t)hash
{
  NSMutableDictionary *dict;

  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }
  return -[NSMutableDictionary hash](dict, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *dict;

  if (!a3)
    return 0;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (self->statInfo.st_ino == *((_QWORD *)a3 + 3)
      && self->statInfo.st_dev == *((_DWORD *)a3 + 4)
      && self->statInfo.st_mtimespec.tv_sec == *((_QWORD *)a3 + 8)
      && self->statInfo.st_mtimespec.tv_nsec == *((_QWORD *)a3 + 9)
      && self->statInfo.st_mode == *((unsigned __int16 *)a3 + 10)
      && self->statInfo.st_size == *((_QWORD *)a3 + 14)
      && self->statInfo.st_nlink == *((unsigned __int16 *)a3 + 11)
      && self->statInfo.st_uid == *((_DWORD *)a3 + 8)
      && self->statInfo.st_gid == *((_DWORD *)a3 + 9))
    {
      return self->statInfo.st_flags == *((_DWORD *)a3 + 33);
    }
    return 0;
  }
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }
  return objc_msgSend(a3, "isEqual:", dict);
}

- (id)fileType
{
  unsigned int st_mode;
  uint64_t v3;

  st_mode = self->statInfo.st_mode;
  if ((st_mode & 0x1000) != 0)
    return CFSTR("NSFileTypeUnknown");
  v3 = (st_mode >> 13) - 1;
  if (v3 > 5)
    return CFSTR("NSFileTypeUnknown");
  else
    return off_1E0F4E290[v3];
}

- (unint64_t)filePosixPermissions
{
  return self->statInfo.st_mode & 0xFFF;
}

- (unint64_t)fileOwnerAccountNumber
{
  return self->statInfo.st_uid;
}

- (id)fileGroupOwnerAccountName
{
  return __NSGroupAccountNumberToName(self->statInfo.st_gid);
}

- (unint64_t)fileGroupOwnerAccountNumber
{
  return self->statInfo.st_gid;
}

- (int64_t)fileSystemNumber
{
  return self->statInfo.st_dev;
}

- (unint64_t)fileSystemFileNumber
{
  return self->statInfo.st_ino;
}

- (BOOL)isDirectory
{
  return (self->statInfo.st_mode & 0xF000) == 0x4000;
}

@end
