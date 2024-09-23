@implementation SUUIItemState

- (BOOL)activeStateIsPreview
{
  char v3;

  if ((-[SUUIItemState state](self, "state") & 3) != 0)
  {
    v3 = -[SUUIItemState downloadContentFlags](self, "downloadContentFlags");
  }
  else
  {
    if ((-[SUUIItemState state](self, "state") & 0x40) == 0)
      return 0;
    v3 = -[SUUIItemState libraryContentFlags](self, "libraryContentFlags");
  }
  return v3 & 1;
}

- (unint64_t)allContentFlags
{
  unint64_t v3;

  v3 = -[SUUIItemState downloadContentFlags](self, "downloadContentFlags");
  return -[SUUIItemState libraryContentFlags](self, "libraryContentFlags") | v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIItemState;
  -[SUUIItemState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: ID: [%@ / %@], State: %ld, Download: [%@, %.2f, %ld], Library: [%ld, %ld]"), v4, self->_itemIdentifier, self->_variantIdentifier, self->_state, self->_downloadPhase, self->_downloadProgress, self->_downloadContentFlags, self->_mediaCategory, self->_libraryContentFlags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 16) = self->_downloadContentFlags;
  v6 = -[NSString copyWithZone:](self->_downloadPhase, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(float *)(v5 + 8) = self->_downloadProgress;
  v8 = -[NSNumber copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[SUUIStoreIdentifier copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  *(_QWORD *)(v5 + 56) = self->_libraryContentFlags;
  *(_QWORD *)(v5 + 64) = self->_mediaCategory;
  *(_QWORD *)(v5 + 72) = self->_state;
  v12 = -[NSString copyWithZone:](self->_variantIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  v14 = -[NSArray copyWithZone:](self->_downloadIdentifiers, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  return (id)v5;
}

- (unint64_t)downloadContentFlags
{
  return self->_downloadContentFlags;
}

- (void)setDownloadContentFlags:(unint64_t)a3
{
  self->_downloadContentFlags = a3;
}

- (NSString)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)downloadIdentifiers
{
  return self->_downloadIdentifiers;
}

- (void)setDownloadIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)libraryContentFlags
{
  return self->_libraryContentFlags;
}

- (void)setLibraryContentFlags:(unint64_t)a3
{
  self->_libraryContentFlags = a3;
}

- (int64_t)mediaCategory
{
  return self->_mediaCategory;
}

- (void)setMediaCategory:(int64_t)a3
{
  self->_mediaCategory = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (void)setVariantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadPhase, 0);
}

@end
