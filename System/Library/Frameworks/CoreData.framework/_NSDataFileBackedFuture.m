@implementation _NSDataFileBackedFuture

- (void)dealloc
{
  objc_super v3;

  self->_fileURL = 0;
  self->_uuid = 0;

  self->_realData = 0;
  self->_originalFileURL = 0;

  self->_bytes = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSDataFileBackedFuture;
  -[_NSDataFileBackedFuture dealloc](&v3, sel_dealloc);
}

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4
{
  return -[_NSDataFileBackedFuture initWithStoreMetadata:directory:originalFileURL:](self, "initWithStoreMetadata:directory:originalFileURL:", a3, a4, 0);
}

- (NSUUID)UUID
{
  return self->_uuid;
}

- (NSURL)fileURL
{
  void *v3;
  NSURL *fileURL;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  fileURL = self->_fileURL;
  if (fileURL
    && -[NSURL isFileURL](fileURL, "isFileURL")
    && objc_msgSend(v3, "fileExistsAtPath:", -[NSURL path](self->_fileURL, "path")))
  {
    return self->_fileURL;
  }
  else
  {
    return 0;
  }
}

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5
{
  uint64_t v9;
  _NSDataFileBackedFuture *v10;
  unint64_t v11;
  _NSDataFileBackedFuture *v12;

  v9 = objc_msgSend(a3, "bytes");
  if (!strncmp((const char *)v9, "\x03###", 4uLL) && (!a5 || objc_msgSend(a5, "isFileURL")))
  {
    v11 = *(_QWORD *)(v9 + 4);
    v12 = (_NSDataFileBackedFuture *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v9 + 12);
    v10 = (_NSDataFileBackedFuture *)-[_NSDataFileBackedFuture initWithURL:UUID:size:](self, (void *)objc_msgSend(a4, "URLByAppendingPathComponent:", -[_NSDataFileBackedFuture UUIDString](v12, "UUIDString")), v12, v11);
    if (v10)
    {
      v10->_bytes = (NSData *)a3;
      v10->_originalFileURL = (NSURL *)a5;
    }
    self = v12;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_QWORD)initWithURL:(void *)a3 UUID:(unint64_t)a4 size:
{
  _QWORD *v4;
  objc_super v9;

  v4 = a1;
  if (a1)
  {
    if ((!a2 || (objc_msgSend(a2, "isFileURL") & 1) != 0) && a4 < 0x7FFFFFFFFFFFFFFFLL)
    {
      v9.receiver = v4;
      v9.super_class = (Class)_NSDataFileBackedFuture;
      v4 = objc_msgSendSuper2(&v9, sel_init);
      if (v4)
      {
        v4[1] = a2;
        v4[4] = a3;
        v4[3] = a4;
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (_QWORD)initWithDirectoryURL:(void *)a3 UUID:(void *)a4 originalURL:
{
  _QWORD *v4;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  objc_super v14;

  v4 = a1;
  if (a1)
  {
    if (a4 && (objc_msgSend(a4, "isFileURL") & 1) == 0)
      goto LABEL_10;
    v14.receiver = v4;
    v14.super_class = (Class)_NSDataFileBackedFuture;
    v4 = objc_msgSendSuper2(&v14, sel_init);
    if (v4)
    {
      v13 = 0;
      v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a4, "path"), &v13);
      if (!v8 || (v9 = v8, !objc_msgSend(v8, "valueForKey:", CFSTR("NSFileSize"))))
      {

        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No file exists at URL '%@'"), a2), 0));
      }
      if ((v4[3] = objc_msgSend((id)objc_msgSend(v9, "valueForKey:", CFSTR("NSFileSize")), "unsignedIntegerValue"),
            v10 = a3,
            v4[4] = v10,
            v4[1] = (id)objc_msgSend(a2, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(v10, "UUIDString"), 0), v4[2] = a4, (v11 = (void *)v4[1]) != 0)&& (objc_msgSend(v11, "isFileURL") & 1) == 0|| v4[3] >= 0x7FFFFFFFFFFFFFFFuLL)
      {
LABEL_10:

        return 0;
      }
    }
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_NSDataFileBackedFuture : <%@, %llu, %@ (%@)>"), self->_uuid, self->_fileSize, self->_fileURL, self->_originalFileURL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "delegate");
    if (v5
      && (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) != 0)
      && (objc_msgSend(v6, "_allowCoreDataFutures") & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()) & 1) != 0)
    {
      objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("NSUUID"));
      objc_msgSend(a3, "encodeInt64:forKey:", self->_fileSize, CFSTR("NSFileSize"));
      objc_msgSend(a3, "encodeObject:forKey:", self->_fileURL, CFSTR("NSFileURL"));
      objc_msgSend(a3, "encodeObject:forKey:", self->_originalFileURL, CFSTR("NSOriginalFileURL"));
      return;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v9 = &unk_1E1F4B1C8;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v9 = &unk_1E1F4B1A0;
  }
  objc_msgSend(a3, "failWithError:", objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v9));
}

- (_NSDataFileBackedFuture)initWithCoder:(id)a3
{
  _NSDataFileBackedFuture *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_NSDataFileBackedFuture;
  v4 = -[_NSDataFileBackedFuture init](&v13, sel_init);
  if (v4)
  {
    if (!objc_msgSend(a3, "allowsKeyedCoding"))
    {
      v11 = &unk_1E1F4B1F0;
      goto LABEL_19;
    }
    v5 = objc_msgSend(a3, "delegate");
    if (!v5
      || (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) == 0)
      || (objc_msgSend(v6, "_allowCoreDataFutures") & 1) == 0)
    {
      if (!objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()))
      {
        v11 = &unk_1E1F4B218;
        goto LABEL_19;
      }
    }
    v4->_uuid = (NSUUID *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSUUID"));
    v4->_fileSize = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSFileSize"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFileURL"));
    if (v7)
    {
      v8 = v7;
      if (!objc_msgSend(v7, "isFileURL"))
      {
        v11 = &unk_1E1F4B240;
        goto LABEL_19;
      }
      v4->_fileURL = (NSURL *)v8;
    }
    v9 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSOriginalFileURL"));
    if (v9)
    {
      v10 = v9;
      if (!objc_msgSend(v9, "isFileURL"))
      {
        v11 = &unk_1E1F4B268;
        goto LABEL_19;
      }
      v4->_originalFileURL = (NSURL *)v10;
    }
    if (v4->_fileSize >= 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = &unk_1E1F4B290;
LABEL_19:
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v11));

      return 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_fileURL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSUUID *uuid;
  NSUUID *v6;
  BOOL v7;
  int v8;
  NSURL *fileURL;
  NSURL *v10;
  BOOL v11;

  if (a3 == self)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_fileSize != *((_QWORD *)a3 + 3))
    goto LABEL_16;
  uuid = self->_uuid;
  v6 = (NSUUID *)*((_QWORD *)a3 + 4);
  if (uuid == v6)
    goto LABEL_10;
  if (uuid)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_16;
  v8 = -[NSUUID isEqual:](uuid, "isEqual:");
  if (v8)
  {
LABEL_10:
    fileURL = self->_fileURL;
    v10 = (NSURL *)*((_QWORD *)a3 + 1);
    if (fileURL != v10)
    {
      if (fileURL)
        v11 = v10 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        LOBYTE(v8) = -[NSURL isEqual:](fileURL, "isEqual:");
        return v8;
      }
LABEL_16:
      LOBYTE(v8) = 0;
      return v8;
    }
LABEL_17:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (_QWORD)_underlyingData
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[5];
    if (!result)
    {
      v2 = (void *)objc_msgSend(v1, "fileURL");
      if (!v2)
      {
        v5 = (void *)MEMORY[0x1E0C99DA0];
        v18 = CFSTR("URL");
        v19[0] = CFSTR("<null url>");
        v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Underlying file for this file backed future has not been downloaded."), v6));
      }
      v3 = v2;
      if ((objc_msgSend(v2, "isFileURL") & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v16 = CFSTR("URL");
        v17 = v3;
        v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Underlying url for this file backed future is not a file url."), v8));
      }
      v13 = 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v3, 0, &v13);
      v1[5] = v4;
      if (!v4)
      {
        v9 = *MEMORY[0x1E0CB3388];
        v14[0] = CFSTR("URL");
        v14[1] = v9;
        v10 = v13;
        if (!v13)
          v10 = CFSTR("<no error>");
        v11 = (void *)MEMORY[0x1E0C99DA0];
        v15[0] = v3;
        v15[1] = v10;
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
        objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Underlying file for this file backed future has not been downloaded."), v12));
      }
      v1[3] = objc_msgSend(v4, "length");
      return (_QWORD *)v1[5];
    }
  }
  return result;
}

- (id)_storeMetadata
{
  id v2;
  const char *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(id *)(a1 + 48);
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(v2, "appendBytes:length:", "\x03###", 4);
    objc_msgSend(v2, "appendBytes:length:", a1 + 24, 8);
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(*(id *)(a1 + 32), "getUUIDBytes:", v5);
    objc_msgSend(v2, "appendBytes:length:", v5, 16);
    v3 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "lastPathComponent"), "fileSystemRepresentation");
    objc_msgSend(v2, "appendBytes:length:", v3, strlen(v3));
    *(_QWORD *)(a1 + 48) = v2;
  }
  return v2;
}

- (void)_bytesPtrForStore
{
  return (void *)objc_msgSend(-[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self), "bytes");
}

- (unint64_t)_bytesLengthForStore
{
  return objc_msgSend(-[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self), "length");
}

- (void)_copyToInterimLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (self)
    v4 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingString:](-[NSURL path](self->_fileURL, "path"), "stringByAppendingString:", CFSTR(".interim")));
  else
    v4 = 0;
  v14 = 0;
  if ((objc_msgSend(v3, "copyItemAtURL:toURL:error:", self->_originalFileURL, v4, &v14) & 1) == 0)
  {
    _NSCoreDataLog(2, (uint64_t)CFSTR("%@: First attempt at moving file to interim location failed: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)self);
    if (objc_msgSend(v14, "code") != 516
      || (v14 = 0, !objc_msgSend(v3, "removeItemAtURL:error:", v4, &v14))
      || (objc_msgSend(v3, "copyItemAtURL:toURL:error:", self->_originalFileURL, v4, &v14) & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99768];
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to copy file from %@ to %@ (%@)"), self->_originalFileURL, v4, v14);
      v15 = *MEMORY[0x1E0CB3388];
      v16[0] = v14;
      objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1)));
    }
  }
}

- (void)_moveToPermanentLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (self)
    v4 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingString:](-[NSURL path](self->_fileURL, "path"), "stringByAppendingString:", CFSTR(".interim")));
  else
    v4 = 0;
  v15 = 0;
  if ((objc_msgSend(v3, "moveItemAtURL:toURL:error:", v4, self->_fileURL, &v15) & 1) == 0)
  {
    _NSCoreDataLog(2, (uint64_t)CFSTR("%@: First attempt at moving in to place failed with error: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)self);
    if (objc_msgSend(v15, "code") != 516
      || (v15 = 0,
          (v11 = (void *)objc_msgSend(v3, "attributesOfItemAtPath:error:", -[NSURL path](self->_fileURL, "path"), &v15)) == 0)
      || objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2AF0]), "unsignedLongValue") != self->_fileSize
      && (!objc_msgSend(v3, "removeItemAtURL:error:", self->_fileURL, &v15)
       || (objc_msgSend(v3, "moveItemAtURL:toURL:error:", v4, self->_fileURL, &v15) & 1) == 0))
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99768];
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to copy file from %@ to %@ (%@)"), v4, self->_fileURL, v15);
      v18 = *MEMORY[0x1E0CB3388];
      v19[0] = v15;
      objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1)));
    }
  }
  v16 = *MEMORY[0x1E0CB2AA8];
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 292);
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), -[NSURL path](self->_fileURL, "path"), &v15);

  self->_originalFileURL = 0;
}

- (unint64_t)length
{
  return objc_msgSend(-[_NSDataFileBackedFuture _underlyingData](self), "length");
}

- (const)bytes
{
  return (const void *)objc_msgSend(-[_NSDataFileBackedFuture _underlyingData](self), "bytes");
}

- (BOOL)_isCloudKitSupportOriginated
{
  return 0;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

@end
