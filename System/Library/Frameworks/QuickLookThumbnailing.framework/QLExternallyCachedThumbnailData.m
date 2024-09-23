@implementation QLExternallyCachedThumbnailData

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  QLExternallyCachedThumbnailData *v6;
  uint64_t v7;
  NSString *itemIdentifier;
  uint64_t v9;
  NSData *versionIdentifier;
  uint64_t v11;
  NSString *fileExtension;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLExternallyCachedThumbnailData;
  v6 = -[QLExternallyCachedThumbnailData init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "stringAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    objc_msgSend(v5, "dataAtIndex:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    versionIdentifier = v6->_versionIdentifier;
    v6->_versionIdentifier = (NSData *)v9;

    objc_msgSend(v5, "stringAtIndex:", 2);
    v11 = objc_claimAutoreleasedReturnValue();
    fileExtension = v6->_fileExtension;
    v6->_fileExtension = (NSString *)v11;

    v6->_size = objc_msgSend(v5, "unsignedIntegerAtIndex:", 3);
  }

  return v6;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p id:%@ vi:%@ fe: %@>"), v5, self, self->_itemIdentifier, self->_versionIdentifier, self->_fileExtension);

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  QLExternallyCachedThumbnailData *v4;
  QLExternallyCachedThumbnailData *v5;
  NSString *itemIdentifier;
  void *v7;
  NSData *versionIdentifier;
  void *v9;
  NSString *fileExtension;
  void *v11;
  char v12;

  v4 = (QLExternallyCachedThumbnailData *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      itemIdentifier = self->_itemIdentifier;
      -[QLExternallyCachedThumbnailData itemIdentifier](v5, "itemIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](itemIdentifier, "isEqualToString:", v7))
      {
        versionIdentifier = self->_versionIdentifier;
        -[QLExternallyCachedThumbnailData versionIdentifier](v5, "versionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSData isEqualToData:](versionIdentifier, "isEqualToData:", v9))
        {
          fileExtension = self->_fileExtension;
          -[QLExternallyCachedThumbnailData fileExtension](v5, "fileExtension");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSString isEqualToString:](fileExtension, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSData)versionIdentifier
{
  return self->_versionIdentifier;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
