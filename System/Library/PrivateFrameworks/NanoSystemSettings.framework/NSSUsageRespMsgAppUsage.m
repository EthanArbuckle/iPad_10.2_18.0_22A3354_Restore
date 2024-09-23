@implementation NSSUsageRespMsgAppUsage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgAppUsage;
  -[NSSUsageRespMsgAppUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUsageRespMsgAppUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    objc_msgSend(v4, "setObject:forKey:", bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_staticSizeInBytes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("staticSizeInBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dynamicSizeInBytes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("dynamicSizeInBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sharedSizeInBytes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sharedSizeInBytes"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgAppUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  NSString *name;
  _QWORD *v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "setName:", name);
  objc_msgSend(v5, "setBundleIdentifier:", self->_bundleIdentifier);
  objc_msgSend(v5, "setBundleVersion:", self->_bundleVersion);
  v5[3] = self->_staticSizeInBytes;
  v5[1] = self->_dynamicSizeInBytes;
  v5[2] = self->_sharedSizeInBytes;

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
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v5[3] = self->_staticSizeInBytes;
  v5[1] = self->_dynamicSizeInBytes;
  v5[2] = self->_sharedSizeInBytes;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  BOOL v8;

  v4 = a3;
  v8 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[6])) || -[NSString isEqual:](name, "isEqual:"))
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[4]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((bundleVersion = self->_bundleVersion, !((unint64_t)bundleVersion | v4[5]))
     || -[NSString isEqual:](bundleVersion, "isEqual:"))
    && self->_staticSizeInBytes == v4[3]
    && self->_dynamicSizeInBytes == v4[1]
    && self->_sharedSizeInBytes == v4[2];

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_bundleVersion, "hash") ^ (2654435761u * self->_staticSizeInBytes) ^ (2654435761u * self->_dynamicSizeInBytes) ^ (2654435761u * self->_sharedSizeInBytes);
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)a3;
  if (v4[6])
    -[NSSUsageRespMsgAppUsage setName:](self, "setName:");
  if (v4[4])
    -[NSSUsageRespMsgAppUsage setBundleIdentifier:](self, "setBundleIdentifier:");
  if (v4[5])
    -[NSSUsageRespMsgAppUsage setBundleVersion:](self, "setBundleVersion:");
  self->_staticSizeInBytes = v4[3];
  self->_dynamicSizeInBytes = v4[1];
  self->_sharedSizeInBytes = v4[2];

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (unint64_t)staticSizeInBytes
{
  return self->_staticSizeInBytes;
}

- (void)setStaticSizeInBytes:(unint64_t)a3
{
  self->_staticSizeInBytes = a3;
}

- (unint64_t)dynamicSizeInBytes
{
  return self->_dynamicSizeInBytes;
}

- (void)setDynamicSizeInBytes:(unint64_t)a3
{
  self->_dynamicSizeInBytes = a3;
}

- (unint64_t)sharedSizeInBytes
{
  return self->_sharedSizeInBytes;
}

- (void)setSharedSizeInBytes:(unint64_t)a3
{
  self->_sharedSizeInBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
