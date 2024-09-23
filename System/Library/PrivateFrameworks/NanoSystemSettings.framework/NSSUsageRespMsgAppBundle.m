@implementation NSSUsageRespMsgAppBundle

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasBundleVersion
{
  return self->_bundleVersion != 0;
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (void)setSupportsManualPurge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsManualPurge = a3;
}

- (void)setHasSupportsManualPurge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsManualPurge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSize
{
  return self->_size != 0;
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
  v8.super_class = (Class)NSSUsageRespMsgAppBundle;
  -[NSSUsageRespMsgAppBundle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUsageRespMsgAppBundle dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *vendor;
  void *v9;
  NSSUsageSize *size;
  void *v11;

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
  vendor = self->_vendor;
  if (vendor)
    objc_msgSend(v4, "setObject:forKey:", vendor, CFSTR("vendor"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsManualPurge);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("supportsManualPurge"));

  }
  size = self->_size;
  if (size)
  {
    -[NSSUsageSize dictionaryRepresentation](size, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("size"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgAppBundleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_vendor)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_size)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    v4 = v5;
  }
  if (self->_bundleVersion)
  {
    objc_msgSend(v5, "setBundleVersion:");
    v4 = v5;
  }
  if (self->_vendor)
  {
    objc_msgSend(v5, "setVendor:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_supportsManualPurge;
    v4[52] |= 1u;
  }
  if (self->_size)
  {
    objc_msgSend(v5, "setSize:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_vendor, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_supportsManualPurge;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v14 = -[NSSUsageSize copyWithZone:](self->_size, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSString *vendor;
  char v9;
  NSSUsageSize *size;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_14;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_14;
  }
  bundleVersion = self->_bundleVersion;
  if ((unint64_t)bundleVersion | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleVersion, "isEqual:"))
      goto LABEL_14;
  }
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](vendor, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_supportsManualPurge)
      {
        if (*((_BYTE *)v4 + 48))
          goto LABEL_20;
      }
      else if (!*((_BYTE *)v4 + 48))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
    goto LABEL_14;
LABEL_20:
  size = self->_size;
  if ((unint64_t)size | *((_QWORD *)v4 + 4))
    v9 = -[NSSUsageSize isEqual:](size, "isEqual:");
  else
    v9 = 1;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash");
  v5 = -[NSString hash](self->_bundleVersion, "hash");
  v6 = -[NSString hash](self->_vendor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_supportsManualPurge;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSSUsageSize hash](self->_size, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  NSSUsageSize *size;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NSSUsageRespMsgAppBundle setName:](self, "setName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NSSUsageRespMsgAppBundle setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NSSUsageRespMsgAppBundle setBundleVersion:](self, "setBundleVersion:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NSSUsageRespMsgAppBundle setVendor:](self, "setVendor:");
    v4 = v7;
  }
  if (v4[52])
  {
    self->_supportsManualPurge = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }
  size = self->_size;
  v6 = *((_QWORD *)v4 + 4);
  if (size)
  {
    if (v6)
    {
      -[NSSUsageSize mergeFrom:](size, "mergeFrom:");
LABEL_16:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NSSUsageRespMsgAppBundle setSize:](self, "setSize:");
    goto LABEL_16;
  }

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

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (BOOL)supportsManualPurge
{
  return self->_supportsManualPurge;
}

- (NSSUsageSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
