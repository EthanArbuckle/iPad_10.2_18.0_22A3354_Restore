@implementation NMSPartialDownloadableItem

- (NMSPartialDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7 minimumSize:(unint64_t)a8 offset:(unint64_t)a9
{
  NMSPartialDownloadableItem *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NMSPartialDownloadableItem;
  result = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](&v11, sel_initWithMediaLibraryIdentifier_externalLibraryIdentifier_size_itemType_manuallyAdded_, a3, a4, a5, a6, a7);
  if (result)
  {
    result->_minimumSize = a8;
    result->_offset = a9;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NMSPartialDownloadableItem *v4;
  NMSPartialDownloadableItem *v5;
  NMSPartialDownloadableItem *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  objc_super v12;

  v4 = (NMSPartialDownloadableItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)NMSPartialDownloadableItem;
    if (-[NMSDownloadableItem isEqual:](&v12, sel_isEqual_, v6)
      && (v7 = -[NMSPartialDownloadableItem offset](self, "offset"),
          v7 == -[NMSPartialDownloadableItem offset](v6, "offset"))
      && (v8 = -[NMSPartialDownloadableItem minimumSize](self, "minimumSize"),
          v8 == -[NMSPartialDownloadableItem minimumSize](v6, "minimumSize")))
    {
      v9 = -[NMSDownloadableItem size](self, "size");
      v10 = v9 == -[NMSDownloadableItem size](v6, "size");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t minimumSize;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSPartialDownloadableItem;
  v3 = self->_offset ^ -[NMSDownloadableItem hash](&v6, sel_hash);
  minimumSize = self->_minimumSize;
  return v3 ^ minimumSize ^ -[NMSDownloadableItem size](self, "size");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)NMSPartialDownloadableItem;
  -[NMSDownloadableItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - minimumSize: %llu - offset: %llu>"), v4, -[NMSPartialDownloadableItem minimumSize](self, "minimumSize"), -[NMSPartialDownloadableItem offset](self, "offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)minimumSize
{
  return self->_minimumSize;
}

@end
