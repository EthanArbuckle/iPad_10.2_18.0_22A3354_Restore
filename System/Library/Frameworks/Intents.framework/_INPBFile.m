@implementation _INPBFile

- (void)setBookmarkData:(id)a3
{
  NSData *v4;
  NSData *bookmarkData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  bookmarkData = self->_bookmarkData;
  self->_bookmarkData = v4;

}

- (BOOL)hasBookmarkData
{
  return self->_bookmarkData != 0;
}

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *data;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  data = self->_data;
  self->_data = v4;

}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (BOOL)hasFileURL
{
  return self->_fileURL != 0;
}

- (void)setFilename:(id)a3
{
  NSString *v4;
  NSString *filename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filename = self->_filename;
  self->_filename = v4;

}

- (BOOL)hasFilename
{
  return self->_filename != 0;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_removedOnCompletion = a3;
}

- (BOOL)hasRemovedOnCompletion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRemovedOnCompletion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setTypeIdentifier:(id)a3
{
  NSString *v4;
  NSString *typeIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  typeIdentifier = self->_typeIdentifier;
  self->_typeIdentifier = v4;

}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFileReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_INPBFile bookmarkData](self, "bookmarkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[_INPBFile data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteDataField();
  -[_INPBFile fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBFile fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFile filename](self, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if (-[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion"))
    PBDataWriterWriteBOOLField();
  -[_INPBFile typeIdentifier](self, "typeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }

}

- (_INPBFile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFile *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFile *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFile *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFile initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBFile data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFile *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = -[_INPBFile init](+[_INPBFile allocWithZone:](_INPBFile, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_bookmarkData, "copyWithZone:", a3);
  -[_INPBFile setBookmarkData:](v5, "setBookmarkData:", v6);

  v7 = (void *)-[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  -[_INPBFile setData:](v5, "setData:", v7);

  v8 = -[_INPBURLValue copyWithZone:](self->_fileURL, "copyWithZone:", a3);
  -[_INPBFile setFileURL:](v5, "setFileURL:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_filename, "copyWithZone:", a3);
  -[_INPBFile setFilename:](v5, "setFilename:", v9);

  if (-[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion"))
    -[_INPBFile setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", -[_INPBFile removedOnCompletion](self, "removedOnCompletion"));
  v10 = (void *)-[NSString copyWithZone:](self->_typeIdentifier, "copyWithZone:", a3);
  -[_INPBFile setTypeIdentifier:](v5, "setTypeIdentifier:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int removedOnCompletion;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_INPBFile bookmarkData](self, "bookmarkData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmarkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFile bookmarkData](self, "bookmarkData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFile bookmarkData](self, "bookmarkData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bookmarkData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFile data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFile data](self, "data");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBFile data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFile fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFile fileURL](self, "fileURL");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBFile fileURL](self, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBFile filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBFile filename](self, "filename");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBFile filename](self, "filename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_31;
  }
  else
  {

  }
  v27 = -[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion");
  if (v27 != objc_msgSend(v4, "hasRemovedOnCompletion"))
    goto LABEL_31;
  if (-[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion"))
  {
    if (objc_msgSend(v4, "hasRemovedOnCompletion"))
    {
      removedOnCompletion = self->_removedOnCompletion;
      if (removedOnCompletion != objc_msgSend(v4, "removedOnCompletion"))
        goto LABEL_31;
    }
  }
  -[_INPBFile typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFile typeIdentifier](self, "typeIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[_INPBFile typeIdentifier](self, "typeIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_bookmarkData, "hash");
  v4 = -[NSData hash](self->_data, "hash");
  v5 = -[_INPBURLValue hash](self->_fileURL, "hash");
  v6 = -[NSString hash](self->_filename, "hash");
  if (-[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion"))
    v7 = 2654435761 * self->_removedOnCompletion;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_typeIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bookmarkData)
  {
    -[_INPBFile bookmarkData](self, "bookmarkData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bookmarkData"));

  }
  if (self->_data)
  {
    -[_INPBFile data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("data"));

  }
  -[_INPBFile fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("fileURL"));

  if (self->_filename)
  {
    -[_INPBFile filename](self, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("filename"));

  }
  if (-[_INPBFile hasRemovedOnCompletion](self, "hasRemovedOnCompletion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBFile removedOnCompletion](self, "removedOnCompletion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("removedOnCompletion"));

  }
  if (self->_typeIdentifier)
  {
    -[_INPBFile typeIdentifier](self, "typeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("typeIdentifier"));

  }
  return v3;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (NSData)data
{
  return self->_data;
}

- (_INPBURLValue)fileURL
{
  return self->_fileURL;
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)removedOnCompletion
{
  return self->_removedOnCompletion;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
