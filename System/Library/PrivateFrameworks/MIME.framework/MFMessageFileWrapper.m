@implementation MFMessageFileWrapper

- (void)setType:(unsigned int)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _changeFileAttributes(self, (void *)*MEMORY[0x1E0CB2A68], v4);

}

- (unsigned)type
{
  void *v2;
  unsigned int v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileHFSTypeCode");

  return v3;
}

- (void)setCreator:(unsigned int)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _changeFileAttributes(self, (void *)*MEMORY[0x1E0CB2A60], v4);

}

- (unsigned)creator
{
  void *v2;
  unsigned int v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileHFSCreatorCode");

  return v3;
}

- (void)setFinderFlags:(unsigned __int16)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _changeFileAttributes(self, CFSTR("_MFFinderFlags"), v4);

}

- (unsigned)finderFlags
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFFinderFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedShortValue");

  return v4;
}

- (void)setMimeType:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFMimeType"), a3);
}

- (id)mimeType
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFMimeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inferredMimeType
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper preferredFilename](self, "preferredFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _mimeTypeFromFileName(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentID:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFContentID"), a3);
}

- (id)contentID
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFContentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMessageID:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFMessageID"), a3);
}

- (id)messageID
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEventUniqueID:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFEventUniqueID"), a3);
}

- (id)eventUniqueID
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFEventUniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMeetingStorePersistentID:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFMeetingStorePersistentID"), a3);
}

- (id)meetingStorePersistentID
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFMeetingStorePersistentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setICSRepresentation:(id)a3
{
  _changeFileAttributes(self, CFSTR("_MFICSRepresentation"), a3);
}

- (id)icsRepresentation
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MFICSRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFileProtection:(id)a3
{
  _changeFileAttributes(self, (void *)*MEMORY[0x1E0CB2AD8], a3);
}

- (id)fileProtection
{
  void *v2;
  void *v3;

  -[MFMessageFileWrapper fileAttributes](self, "fileAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB2AD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)fileSize
{
  return -[NSData length](self->_data, "length");
}

- (void)_isImage:(BOOL *)a3 orPDFFile:(BOOL *)a4
{
  BOOL *v4;
  MFTypeInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a4;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[MFMessageFileWrapper mimeType](self, "mimeType");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("application/pdf"), "caseInsensitiveCompare:")
    && objc_msgSend(CFSTR("image/pdf"), "caseInsensitiveCompare:", v15))
  {
    if (objc_msgSend(v15, "hasPrefix:", CFSTR("image/")))
    {
      if (a3)
        *a3 = 1;
      goto LABEL_24;
    }
    v7 = objc_alloc_init(MFTypeInfo);
    -[MFMessageFileWrapper preferredFilename](self, "preferredFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTypeInfo setPathExtension:](v7, "setPathExtension:", v9);

    -[MFMessageFileWrapper filename](self, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTypeInfo setFilename:](v7, "setFilename:", v10);

    if (MFGetTypeInfo(v7, 1))
    {
      -[MFTypeInfo mimeType](v7, "mimeType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeOfString:options:", CFSTR("image/"), 9);

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[MFTypeInfo mimeType](v7, "mimeType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("application/pdf"));

        if (v14)
          goto LABEL_23;
        if (a3)
          *a3 = 0;
        if (!v4)
          goto LABEL_23;
        goto LABEL_22;
      }
      v4 = a3;
      if (a3)
LABEL_22:
        *v4 = 1;
    }
LABEL_23:

    goto LABEL_24;
  }
  if (a3)
    *a3 = 0;
  if (v4)
    *v4 = 1;
LABEL_24:

}

- (BOOL)isImageFile
{
  BOOL v3;

  v3 = 0;
  -[MFMessageFileWrapper _isImage:orPDFFile:](self, "_isImage:orPDFFile:", &v3, 0);
  return v3;
}

- (BOOL)isPDFFile
{
  BOOL v3;

  v3 = 0;
  -[MFMessageFileWrapper _isImage:orPDFFile:](self, "_isImage:orPDFFile:", 0, &v3);
  return v3;
}

- (BOOL)isUnzippableFile
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MFMessageFileWrapper preferredFilename](self, "preferredFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("zip")))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "length") != 0;

  }
  return v4;
}

- (MFMessageFileWrapper)initWithPath:(id)a3
{
  id v5;
  MFMessageFileWrapper *v6;
  void *v7;
  void *v8;
  void *v9;
  MFData *v10;
  NSData *data;
  void *v12;
  void *v13;
  objc_super v15;
  _BYTE __b[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  memset(__b, 170, sizeof(__b));
  v15.receiver = self;
  v15.super_class = (Class)MFMessageFileWrapper;
  v6 = -[MFMessageFileWrapper init](&v15, sel_init);
  if (v6 && objc_msgSend(v5, "getFileSystemRepresentation:maxLength:", __b, 1023))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2B18]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2B28]))
      {
        -[MFMessageFileWrapper setType:](v6, "setType:", 0);
        v10 = -[MFData initWithContentsOfFile:options:error:]([MFData alloc], "initWithContentsOfFile:options:error:", v5, 1, 0);
        data = v6->_data;
        v6->_data = &v10->super;

        _mimeTypeFromFileName(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageFileWrapper setMimeType:](v6, "setMimeType:", v12);

      }
      else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2B30]))
      {
        -[MFMessageFileWrapper setType:](v6, "setType:", 1);
      }
      objc_storeStrong((id *)&v6->_path, a3);
      objc_msgSend(v5, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageFileWrapper setPreferredFilename:](v6, "setPreferredFilename:", v13);

      __b[1023] = 0;
      _fixSubwrappersAtPath(v6, (uint64_t)__b);
    }
    else
    {
      v9 = v6;
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (id)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_url, a3);
  _MFUnlockGlobalLock();

}

- (id)initRegularFileWithContents:(id)a3
{
  id v4;
  MFMessageFileWrapper *v5;
  MFMessageFileWrapper *v6;
  MFData *v7;
  NSData *data;
  MFMessageFileWrapper *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMessageFileWrapper;
  v5 = -[MFMessageFileWrapper init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    -[MFMessageFileWrapper setFileProtection:](v5, "setFileProtection:", *MEMORY[0x1E0CB2AB8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (MFData *)v4;
    else
      v7 = -[MFData initWithImmutableData:]([MFData alloc], "initWithImmutableData:", v4);
    data = v6->_data;
    v6->_data = &v7->super;

    v9 = v6;
  }

  return v6;
}

- (id)initSymbolicLinkWithDestination:(id)a3
{
  NSString *v4;
  MFMessageFileWrapper *v5;
  NSString *linkDestination;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMessageFileWrapper;
  v5 = -[MFMessageFileWrapper init](&v8, sel_init);
  v5->_type = 0;
  linkDestination = v5->_linkDestination;
  v5->_linkDestination = v4;

  return v5;
}

- (void)setPreferredFilename:(id)a3
{
  id v4;
  NSString *v5;
  NSString *preferredFilename;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSObject mf_lock](self, "mf_lock");
  v5 = (NSString *)objc_msgSend(v7, "copy");
  preferredFilename = self->_preferredFilename;
  self->_preferredFilename = v5;

  -[NSObject mf_unlock](self, "mf_unlock");
}

- (id)preferredFilename
{
  void *v3;

  -[NSObject mf_lock](self, "mf_lock");
  v3 = (void *)-[NSString copy](self->_preferredFilename, "copy");
  -[NSObject mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setFilename:(id)a3
{
  NSString *v4;
  NSString *filename;
  id v6;

  v6 = a3;
  -[NSObject mf_lock](self, "mf_lock");
  v4 = (NSString *)objc_msgSend(v6, "copy");
  filename = self->_filename;
  self->_filename = v4;

  -[NSObject mf_unlock](self, "mf_unlock");
}

- (id)filename
{
  void *v3;

  -[NSObject mf_lock](self, "mf_lock");
  v3 = (void *)-[NSString copy](self->_filename, "copy");
  -[NSObject mf_unlock](self, "mf_unlock");
  return v3;
}

- (BOOL)isSymbolicLink
{
  return self->_type == 1;
}

- (BOOL)isRegularFile
{
  return self->_type == 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (id)fileWrappers
{
  return 0;
}

- (id)symbolicLinkDestination
{
  return self->_linkDestination;
}

- (id)regularFileContents
{
  return self->_data;
}

- (void)setFileAttributes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *attributes;
  id v6;

  v6 = a3;
  v4 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  attributes = self->_attributes;
  self->_attributes = v4;

}

- (id)fileAttributes
{
  return self->_attributes;
}

- (void)dealloc
{
  objc_super v3;

  -[MFMessageFileWrapper setMimeType:](self, "setMimeType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMessageFileWrapper;
  -[MFMessageFileWrapper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *path;
  NSString *filename;
  NSString *preferredFilename;
  NSUInteger v8;
  NSString *url;
  _BOOL4 v10;
  const char *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MFMessageFileWrapper;
  -[MFMessageFileWrapper description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  filename = self->_filename;
  preferredFilename = self->_preferredFilename;
  v8 = -[NSData length](self->_data, "length");
  url = self->_url;
  v10 = -[MFMessageFileWrapper isPlaceholder](self, "isPlaceholder");
  v11 = "NO";
  if (v10)
    v11 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tpath: %@\n\tfilename: %@\n\tpreferred: %@\n\tdata length: %lu\n\tURL: %@\n\tPlaceholder: %s"), v4, path, filename, preferredFilename, v8, url, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_linkDestination, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_preferredFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
