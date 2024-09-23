@implementation NMSDownloadableItem

- (NMSDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7
{
  id v13;
  id v14;
  NMSDownloadableItem *v15;
  NMSDownloadableItem *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NMSDownloadableItem;
  v15 = -[NMSDownloadableItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaLibraryIdentifier, a3);
    objc_storeStrong((id *)&v16->_externalLibraryIdentifier, a4);
    v16->_size = a5;
    v16->_itemType = a6;
    v16->_manuallyAdded = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  NMSDownloadableItem *v4;
  NMSDownloadableItem *v5;
  NMSDownloadableItem *v6;
  id v7;
  id v8;
  int v9;
  BOOL v10;
  id v11;
  id v12;
  int v13;
  unint64_t v14;

  v4 = (NMSDownloadableItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[NMSDownloadableItem mediaLibraryIdentifier](self, "mediaLibraryIdentifier");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[NMSDownloadableItem mediaLibraryIdentifier](v6, "mediaLibraryIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {

        }
        else
        {
          v9 = objc_msgSend(v7, "isEqual:", v8);

          if (!v9)
          {
            v10 = 0;
LABEL_16:

            goto LABEL_17;
          }
        }
        -[NMSDownloadableItem externalLibraryIdentifier](self, "externalLibraryIdentifier");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[NMSDownloadableItem externalLibraryIdentifier](v6, "externalLibraryIdentifier");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {

        }
        else
        {
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (!v13)
          {
            v10 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        v14 = -[NMSDownloadableItem itemType](self, "itemType");
        v10 = v14 == -[NMSDownloadableItem itemType](v6, "itemType");
        goto LABEL_15;
      }
    }
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_mediaLibraryIdentifier, "hash");
  return -[NSString hash](self->_externalLibraryIdentifier, "hash") ^ v3 ^ self->_itemType;
}

- (id)identifier
{
  if (self->_mediaLibraryIdentifier)
    return self->_mediaLibraryIdentifier;
  else
    return &unk_24D6558F0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)NMSDownloadableItem;
  -[NMSDownloadableItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSDownloadableItem mediaLibraryIdentifier](self, "mediaLibraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSDownloadableItem externalLibraryIdentifier](self, "externalLibraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - MLDB pid: %@ - PDB UUID %@ - size: %llu - type: %lu - manuallyAdded: %x>"), v4, v5, v6, -[NMSDownloadableItem size](self, "size"), -[NMSDownloadableItem itemType](self, "itemType"), -[NMSDownloadableItem isManuallyAdded](self, "isManuallyAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)mediaLibraryIdentifier
{
  return self->_mediaLibraryIdentifier;
}

- (NSString)externalLibraryIdentifier
{
  return self->_externalLibraryIdentifier;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (BOOL)isManuallyAdded
{
  return self->_manuallyAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaLibraryIdentifier, 0);
}

@end
