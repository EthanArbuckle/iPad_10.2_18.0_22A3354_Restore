@implementation CTLazuliFileTransferDescriptor

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliFileTransferDescriptor thumbnail](self, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", thumbnail = %@"), v4);

  -[CTLazuliFileTransferDescriptor file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", file = %@"), v5);

  -[CTLazuliFileTransferDescriptor metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliFileTransferDescriptor:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;

  v6 = a3;
  -[CTLazuliFileTransferDescriptor thumbnail](self, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v6, "thumbnail"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferDescriptor thumbnail](self, "thumbnail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToCTLazuliFileThumbnailInformation:", v4))
    {
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v18 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[CTLazuliFileTransferDescriptor file](self, "file");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "file");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToCTLazuliFileDispositionInformation:", v10))
  {

    v8 = 0;
    if (!v18)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[CTLazuliFileTransferDescriptor metaData](self, "metaData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v6, "metaData"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliFileTransferDescriptor metaData](self, "metaData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metaData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "isEqualToCTLazuliCustomMetaData:", v13);

    if (v11)
    {

      goto LABEL_20;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    v8 = 1;
  }

LABEL_20:
  if ((v18 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  if (!v7)

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliFileTransferDescriptor *v4;
  CTLazuliFileTransferDescriptor *v5;
  BOOL v6;

  v4 = (CTLazuliFileTransferDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliFileTransferDescriptor isEqualToCTLazuliFileTransferDescriptor:](self, "isEqualToCTLazuliFileTransferDescriptor:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliFileTransferDescriptor *v4;

  v4 = +[CTLazuliFileTransferDescriptor allocWithZone:](CTLazuliFileTransferDescriptor, "allocWithZone:", a3);
  -[CTLazuliFileTransferDescriptor setThumbnail:](v4, "setThumbnail:", self->_thumbnail);
  -[CTLazuliFileTransferDescriptor setFile:](v4, "setFile:", self->_file);
  -[CTLazuliFileTransferDescriptor setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_thumbnail, CFSTR("kThumbnailKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_file, CFSTR("kFileKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliFileTransferDescriptor)initWithCoder:(id)a3
{
  id v4;
  CTLazuliFileTransferDescriptor *v5;
  uint64_t v6;
  CTLazuliFileThumbnailInformation *thumbnail;
  uint64_t v8;
  CTLazuliFileDispositionInformation *file;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliFileTransferDescriptor;
  v5 = -[CTLazuliFileTransferDescriptor init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kThumbnailKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (CTLazuliFileThumbnailInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    file = v5->_file;
    v5->_file = (CTLazuliFileDispositionInformation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMetaDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;

  }
  return v5;
}

- (CTLazuliFileTransferDescriptor)initWithReflection:(const void *)a3
{
  CTLazuliFileTransferDescriptor *v4;
  CTLazuliFileTransferDescriptor *v5;
  CTLazuliFileThumbnailInformation *v6;
  uint64_t v7;
  CTLazuliFileThumbnailInformation *thumbnail;
  CTLazuliFileDispositionInformation *v9;
  CTLazuliFileDispositionInformation *file;
  CTLazuliCustomMetaData *v11;
  uint64_t v12;
  CTLazuliCustomMetaData *metaData;
  CTLazuliFileTransferDescriptor *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliFileTransferDescriptor;
  v4 = -[CTLazuliFileTransferDescriptor init](&v15, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (*((_BYTE *)a3 + 80))
  {
    v6 = [CTLazuliFileThumbnailInformation alloc];
    if (!*((_BYTE *)a3 + 80))
      goto LABEL_12;
    v7 = -[CTLazuliFileThumbnailInformation initWithReflection:](v6, "initWithReflection:", a3);
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (CTLazuliFileThumbnailInformation *)v7;
  }
  else
  {
    thumbnail = v4->_thumbnail;
    v4->_thumbnail = 0;
  }

  v9 = -[CTLazuliFileDispositionInformation initWithReflection:]([CTLazuliFileDispositionInformation alloc], "initWithReflection:", (char *)a3 + 88);
  file = v5->_file;
  v5->_file = v9;

  if (!*((_BYTE *)a3 + 240))
  {
    metaData = v5->_metaData;
    v5->_metaData = 0;
    goto LABEL_10;
  }
  v11 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 240))
  {
    v12 = -[CTLazuliCustomMetaData initWithReflection:](v11, "initWithReflection:", (char *)a3 + 216);
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v12;
LABEL_10:

    return v5;
  }
LABEL_12:
  result = (CTLazuliFileTransferDescriptor *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliFileThumbnailInformation)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (CTLazuliFileDispositionInformation)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (CTLazuliCustomMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end
