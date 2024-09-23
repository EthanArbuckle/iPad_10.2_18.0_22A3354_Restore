@implementation ATXPBFaceGalleryItem

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDescriptorIdentifier
{
  return self->_descriptorIdentifier != 0;
}

- (BOOL)hasExtensionBundleIdentifier
{
  return self->_extensionBundleIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBFaceGalleryItem;
  -[ATXPBFaceGalleryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBFaceGalleryItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *descriptorIdentifier;
  NSString *extensionBundleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  descriptorIdentifier = self->_descriptorIdentifier;
  if (descriptorIdentifier)
    objc_msgSend(v4, "setObject:forKey:", descriptorIdentifier, CFSTR("descriptorIdentifier"));
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  if (extensionBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_descriptorIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_extensionBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_descriptorIdentifier)
  {
    objc_msgSend(v5, "setDescriptorIdentifier:");
    v4 = v5;
  }
  if (self->_extensionBundleIdentifier)
  {
    objc_msgSend(v5, "setExtensionBundleIdentifier:");
    v4 = v5;
  }

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
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_descriptorIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_extensionBundleIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *descriptorIdentifier;
  NSString *extensionBundleIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[3]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((descriptorIdentifier = self->_descriptorIdentifier, !((unint64_t)descriptorIdentifier | v4[1]))
     || -[NSString isEqual:](descriptorIdentifier, "isEqual:")))
  {
    extensionBundleIdentifier = self->_extensionBundleIdentifier;
    if ((unint64_t)extensionBundleIdentifier | v4[2])
      v8 = -[NSString isEqual:](extensionBundleIdentifier, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_descriptorIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_extensionBundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[ATXPBFaceGalleryItem setIdentifier:](self, "setIdentifier:");
  if (v4[1])
    -[ATXPBFaceGalleryItem setDescriptorIdentifier:](self, "setDescriptorIdentifier:");
  if (v4[2])
    -[ATXPBFaceGalleryItem setExtensionBundleIdentifier:](self, "setExtensionBundleIdentifier:");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (void)setDescriptorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorIdentifier, a3);
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
}

@end
