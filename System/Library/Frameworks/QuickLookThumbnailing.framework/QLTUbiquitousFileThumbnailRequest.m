@implementation QLTUbiquitousFileThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTUbiquitousFileThumbnailRequest)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v14;
  QLCacheFileProviderFileIdentifier *v15;
  void *v16;
  QLCacheFileProviderFileIdentifier *v17;
  QLThumbnailVersion *v18;
  QLCacheFileProviderVersionedFileIdentifier *v19;
  QLTUbiquitousFileThumbnailRequest *v20;
  QLTUbiquitousFileThumbnailRequest *v21;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = [QLCacheFileProviderFileIdentifier alloc];
  objc_msgSend(v14, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[QLCacheFileProviderFileIdentifier initWithItemID:](v15, "initWithItemID:", v16);

  v18 = -[QLThumbnailVersion initWithFPItem:automaticallyGenerated:]([QLThumbnailVersion alloc], "initWithFPItem:automaticallyGenerated:", v14, 1);
  v19 = -[QLCacheFileProviderVersionedFileIdentifier initWithFileIdentifier:version:]([QLCacheFileProviderVersionedFileIdentifier alloc], "initWithFileIdentifier:version:", v17, v18);
  v20 = -[QLTThumbnailRequest initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:](self, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v19, v7, 0, 0, -1, width, height, a6, a5);
  v21 = v20;
  if (v20)
    objc_storeStrong((id *)&v20->_item, a3);

  return v21;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem providerID](self->_item, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem itemIdentifier](self->_item, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem displayName](self->_item, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTThumbnailRequest size](self, "size");
  v10 = v9;
  -[QLTThumbnailRequest size](self, "size");
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p %@/%@ (%@) {%g, %g}>"), v5, self, v6, v7, v8, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  FPItem *item;
  id v5;
  objc_super v6;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", item, CFSTR("it"));
  v6.receiver = self;
  v6.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  -[QLTThumbnailRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (QLTUbiquitousFileThumbnailRequest)initWithCoder:(id)a3
{
  id v4;
  QLTUbiquitousFileThumbnailRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  FPItem *item;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  v5 = -[QLTThumbnailRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getFPItemClass_softClass_0;
    v16 = getFPItemClass_softClass_0;
    if (!getFPItemClass_softClass_0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getFPItemClass_block_invoke_0;
      v12[3] = &unk_1E5D7C1B8;
      v12[4] = &v13;
      __getFPItemClass_block_invoke_0((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("it"));
    v8 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (FPItem *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLTUbiquitousFileThumbnailRequest;
  v4 = -[QLTThumbnailRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 12, self->_item);
  return v4;
}

- (id)computeContentType
{
  return (id)-[FPItem typeIdentifier](self->_item, "typeIdentifier");
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return -[FPItem isDownloaded](self->_item, "isDownloaded");
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
