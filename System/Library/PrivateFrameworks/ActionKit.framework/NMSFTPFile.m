@implementation NMSFTPFile

- (NMSFTPFile)initWithFilename:(id)a3
{
  id v4;
  NMSFTPFile *v5;
  NMSFTPFile *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMSFTPFile;
  v5 = -[NMSFTPFile init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NMSFTPFile setFilename:](v5, "setFilename:", v4);

  return v6;
}

- (void)populateValuesFromSFTPAttributes:(_LIBSSH2_SFTP_ATTRIBUTES *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)a3->var6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTPFile setModificationDate:](self, "setModificationDate:", v5);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a3->var5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTPFile setLastAccess:](self, "setLastAccess:", v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTPFile setFileSize:](self, "setFileSize:", v7);

  -[NMSFTPFile setOwnerUserID:](self, "setOwnerUserID:", a3->var2);
  -[NMSFTPFile setOwnerGroupID:](self, "setOwnerGroupID:", a3->var3);
  -[NMSFTPFile convertPermissionToSymbolicNotation:](self, "convertPermissionToSymbolicNotation:", a3->var4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTPFile setPermissions:](self, "setPermissions:", v8);

  -[NMSFTPFile setIsDirectory:](self, "setIsDirectory:", (a3->var4 & 0xF000) == 0x4000);
  -[NMSFTPFile setFlags:](self, "setFlags:", a3->var0);
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[NMSFTPFile filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NMSFTPFile filename](self, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)convertPermissionToSymbolicNotation:(unint64_t)a3
{
  __int16 v3;
  char v4;
  char v6;
  char v7;
  _BYTE v8[11];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v8[0] = -[NMSFTPFile filetypeletter:](self, "filetypeletter:");
  __strcpy_chk();
  __strcpy_chk();
  __strcpy_chk();
  if ((v3 & 0x800) != 0)
  {
    if ((v3 & 0x40) != 0)
      v6 = 115;
    else
      v6 = 83;
    v8[3] = v6;
    if ((v3 & 0x400) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_4;
    }
  }
  else if ((v3 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  if ((v3 & 8) != 0)
    v7 = 115;
  else
    v7 = 108;
  v8[6] = v7;
  if ((v3 & 0x200) != 0)
  {
LABEL_4:
    if ((v3 & 0x40) != 0)
      v4 = 116;
    else
      v4 = 84;
    v8[9] = v4;
  }
LABEL_8:
  v8[10] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (char)filetypeletter:(unint64_t)a3
{
  unint64_t v3;

  v3 = ((unsigned __int16)a3 & 0xF000) - 4096;
  if (v3 >> 14 > 2)
    return 63;
  else
    return aPcDBLS[v3 >> 12];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTPFile filename](self, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Filename: %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[NMSFTPFile filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setFilename:", v7);

    -[NMSFTPFile modificationDate](self, "modificationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    objc_msgSend(v5, "setModificationDate:", v9);

    -[NMSFTPFile lastAccess](self, "lastAccess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
    objc_msgSend(v5, "setLastAccess:", v11);

    -[NMSFTPFile fileSize](self, "fileSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    objc_msgSend(v5, "setFileSize:", v13);

    -[NMSFTPFile permissions](self, "permissions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
    objc_msgSend(v5, "setPermissions:", v15);

    objc_msgSend(v5, "setIsDirectory:", -[NMSFTPFile isDirectory](self, "isDirectory"));
    objc_msgSend(v5, "setOwnerUserID:", -[NMSFTPFile ownerUserID](self, "ownerUserID"));
    objc_msgSend(v5, "setOwnerGroupID:", -[NMSFTPFile ownerGroupID](self, "ownerGroupID"));
    objc_msgSend(v5, "setFlags:", -[NMSFTPFile flags](self, "flags"));
  }
  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSDate)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccess, a3);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_fileSize, a3);
}

- (unint64_t)ownerUserID
{
  return self->_ownerUserID;
}

- (void)setOwnerUserID:(unint64_t)a3
{
  self->_ownerUserID = a3;
}

- (unint64_t)ownerGroupID
{
  return self->_ownerGroupID;
}

- (void)setOwnerGroupID:(unint64_t)a3
{
  self->_ownerGroupID = a3;
}

- (NSString)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_lastAccess, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

+ (id)fileWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilename:", v4);

  return v5;
}

@end
