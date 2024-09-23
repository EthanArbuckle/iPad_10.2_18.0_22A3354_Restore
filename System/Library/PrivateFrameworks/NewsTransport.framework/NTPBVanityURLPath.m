@implementation NTPBVanityURLPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_destinationParameters, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sourcePath;
  NSString *destinationPath;
  NSString *destinationParameters;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sourcePath = self->_sourcePath, !((unint64_t)sourcePath | v4[3]))
     || -[NSString isEqual:](sourcePath, "isEqual:"))
    && ((destinationPath = self->_destinationPath, !((unint64_t)destinationPath | v4[2]))
     || -[NSString isEqual:](destinationPath, "isEqual:")))
  {
    destinationParameters = self->_destinationParameters;
    if ((unint64_t)destinationParameters | v4[1])
      v8 = -[NSString isEqual:](destinationParameters, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasDestinationParameters
{
  return self->_destinationParameters != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBVanityURLPath;
  -[NTPBVanityURLPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBVanityURLPath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourcePath;
  NSString *destinationPath;
  NSString *destinationParameters;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourcePath = self->_sourcePath;
  if (sourcePath)
    objc_msgSend(v3, "setObject:forKey:", sourcePath, CFSTR("source_path"));
  destinationPath = self->_destinationPath;
  if (destinationPath)
    objc_msgSend(v4, "setObject:forKey:", destinationPath, CFSTR("destination_path"));
  destinationParameters = self->_destinationParameters;
  if (destinationParameters)
    objc_msgSend(v4, "setObject:forKey:", destinationParameters, CFSTR("destination_parameters"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVanityURLPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_destinationParameters)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourcePath, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_destinationPath, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_destinationParameters, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_sourcePath, "hash");
  v4 = -[NSString hash](self->_destinationPath, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_destinationParameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NTPBVanityURLPath setSourcePath:](self, "setSourcePath:");
  if (v4[2])
    -[NTPBVanityURLPath setDestinationPath:](self, "setDestinationPath:");
  if (v4[1])
    -[NTPBVanityURLPath setDestinationParameters:](self, "setDestinationParameters:");

}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePath, a3);
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPath, a3);
}

- (NSString)destinationParameters
{
  return self->_destinationParameters;
}

- (void)setDestinationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_destinationParameters, a3);
}

@end
