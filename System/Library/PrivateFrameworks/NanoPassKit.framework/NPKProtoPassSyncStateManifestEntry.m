@implementation NPKProtoPassSyncStateManifestEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateManifestEntry;
  -[NPKProtoPassSyncStateManifestEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateManifestEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *relativePath;
  NSString *fileHash;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  relativePath = self->_relativePath;
  if (relativePath)
    objc_msgSend(v3, "setObject:forKey:", relativePath, CFSTR("relativePath"));
  fileHash = self->_fileHash;
  if (fileHash)
    objc_msgSend(v4, "setObject:forKey:", fileHash, CFSTR("fileHash"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateManifestEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_relativePath)
    -[NPKProtoPassSyncStateManifestEntry writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_fileHash)
    -[NPKProtoPassSyncStateManifestEntry writeTo:].cold.2();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *relativePath;
  id v5;

  relativePath = self->_relativePath;
  v5 = a3;
  objc_msgSend(v5, "setRelativePath:", relativePath);
  objc_msgSend(v5, "setFileHash:", self->_fileHash);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_relativePath, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_fileHash, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *relativePath;
  NSString *fileHash;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((relativePath = self->_relativePath, !((unint64_t)relativePath | v4[2]))
     || -[NSString isEqual:](relativePath, "isEqual:")))
  {
    fileHash = self->_fileHash;
    if ((unint64_t)fileHash | v4[1])
      v7 = -[NSString isEqual:](fileHash, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_relativePath, "hash");
  return -[NSString hash](self->_fileHash, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoPassSyncStateManifestEntry setRelativePath:](self, "setRelativePath:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoPassSyncStateManifestEntry setFileHash:](self, "setFileHash:");
    v4 = v5;
  }

}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_storeStrong((id *)&self->_relativePath, a3);
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
  objc_storeStrong((id *)&self->_fileHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateManifestEntry writeTo:]", "NPKProtoPassSyncStateManifestEntry.m", 83, "nil != self->_relativePath");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateManifestEntry writeTo:]", "NPKProtoPassSyncStateManifestEntry.m", 88, "nil != self->_fileHash");
}

@end
