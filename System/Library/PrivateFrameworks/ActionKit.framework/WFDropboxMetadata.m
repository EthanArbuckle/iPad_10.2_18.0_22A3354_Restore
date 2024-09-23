@implementation WFDropboxMetadata

- (id)wfLastModifiedDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFDropboxMetadata clientModifiedDate](self, "clientModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFDropboxMetadata serverModifiedDate](self, "serverModifiedDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)wfFileType
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[WFDropboxMetadata wfIsDirectory](self, "wfIsDirectory");
  v4 = (void *)MEMORY[0x24BEC14A0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFDropboxMetadata name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeFromFilename:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isDirectory
{
  void *v2;
  char v3;

  -[WFDropboxMetadata itemKind](self, "itemKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("folder"));

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFDropboxMetadata identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0x89ABCDEFLL;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFDropboxMetadata *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFDropboxMetadata *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFDropboxMetadata identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDropboxMetadata identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)wfName
{
  void *v2;
  void *v3;

  -[WFDropboxMetadata name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)revision
{
  return self->_revision;
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (NSDate)clientModifiedDate
{
  return self->_clientModifiedDate;
}

- (NSDate)serverModifiedDate
{
  return self->_serverModifiedDate;
}

- (NSString)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
  objc_storeStrong((id *)&self->_itemKind, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_serverModifiedDate, 0);
  objc_storeStrong((id *)&self->_clientModifiedDate, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("path");
  v4[0] = CFSTR("name");
  v4[1] = CFSTR("path_display");
  v3[2] = CFSTR("identifier");
  v3[3] = CFSTR("revision");
  v4[2] = CFSTR("id");
  v4[3] = CFSTR("rev");
  v3[4] = CFSTR("contentHash");
  v3[5] = CFSTR("fileSize");
  v4[4] = CFSTR("content_hash");
  v4[5] = CFSTR("size");
  v3[6] = CFSTR("clientModifiedDate");
  v3[7] = CFSTR("serverModifiedDate");
  v4[6] = CFSTR("client_modified");
  v4[7] = CFSTR("server_modified");
  v3[8] = CFSTR("itemKind");
  v4[8] = CFSTR("\\.tag");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)clientModifiedDateJSONTransformer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)MEMORY[0x24BDD1970];
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"), 0, v2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
