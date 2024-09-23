@implementation _UIDocumentPickerContainerItem

- (BOOL)isActionApplicableForItem:(int64_t)a3
{
  _UIDocumentPickerContainerItem *v4;
  _UIDocumentPickerContainerItem *v5;
  _BOOL4 v6;
  BOOL v7;

  v4 = self;
  v5 = v4;
  LOBYTE(v6) = 1;
  switch(a3)
  {
    case 0:
    case 1:
      break;
    case 2:
      v7 = -[_UIDocumentPickerContainerItem type](v4, "type") == 0;
      goto LABEL_5;
    case 3:
      LOBYTE(v6) = -[_UIDocumentPickerContainerItem renameable](v4, "renameable");
      break;
    case 4:
      if (-[_UIDocumentPickerContainerItem type](v4, "type"))
        goto LABEL_10;
      v6 = !-[_UIDocumentPickerContainerItem isAlias](v5, "isAlias");
      break;
    case 5:
    case 6:
      if (-[_UIDocumentPickerContainerItem type](v4, "type"))
      {
        v7 = -[_UIDocumentPickerContainerItem type](v5, "type") == 1;
LABEL_5:
        LOBYTE(v6) = v7;
      }
      break;
    default:
LABEL_10:
      LOBYTE(v6) = 0;
      break;
  }

  return v6;
}

- (_UIDocumentPickerContainerItem)init
{
  _UIDocumentPickerContainerItem *v2;
  _UIDocumentPickerContainerItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerContainerItem;
  v2 = -[_UIDocumentPickerContainerItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIDocumentPickerContainerItem setPickable:](v2, "setPickable:", 1);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIDocumentPickerContainerItem setParentModel:](self, "setParentModel:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerItem;
  -[_UIDocumentPickerContainerItem dealloc](&v3, sel_dealloc);
}

+ (id)_lruThumbnailArray
{
  if (_lruThumbnailArray_onceToken != -1)
    dispatch_once(&_lruThumbnailArray_onceToken, &__block_literal_global_275);
  return (id)_lruThumbnailArray_cacheArray;
}

+ (void)markThumbnailAsRecentlyUsed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_lruThumbnailArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v4, 0);

  if ((unint64_t)objc_msgSend(v5, "count") >= 0x29)
    objc_msgSend(v5, "removeObjectsInRange:", 40, objc_msgSend(v5, "count") - 40);

}

+ (void)clearLRUThumbnailCache
{
  id v2;

  objc_msgSend(a1, "_lruThumbnailArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)thumbnailWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  NSMapTable *v9;
  NSMapTable *thumbnailsBySize;
  _UIDocumentPickerContainerItemThumbnailKey *v11;
  void *v12;
  _UIDocumentPickerContainerItemThumbnailKey *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSOperation *v18;
  NSOperation *thumbnailLoadOperation;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  _UIDocumentPickerContainerItem *v26;
  _UIDocumentPickerContainerItemThumbnailKey *v27;
  id v28;
  id v29[4];
  id location;

  height = a3.height;
  width = a3.width;
  -[_UIDocumentPickerContainerItem url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!self->_thumbnailsBySize)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 5);
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      thumbnailsBySize = self->_thumbnailsBySize;
      self->_thumbnailsBySize = v9;

    }
    v11 = [_UIDocumentPickerContainerItemThumbnailKey alloc];
    -[_UIDocumentPickerContainerItem url](self, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIDocumentPickerContainerItemThumbnailKey initWithPrimaryKey:size:scale:](v11, "initWithPrimaryKey:size:scale:", v12, width, height, a4);

    -[NSMapTable objectForKey:](self->_thumbnailsBySize, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[_UIDocumentPickerContainerItem parentModel](self, "parentModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_initWeak(&location, self);
        v16 = (void *)MEMORY[0x24BDD1478];
        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __58___UIDocumentPickerContainerItem_thumbnailWithSize_scale___block_invoke;
        v25 = &unk_24E43ADA0;
        objc_copyWeak(v29, &location);
        v26 = self;
        v29[1] = *(id *)&width;
        v29[2] = *(id *)&height;
        v29[3] = *(id *)&a4;
        v27 = v13;
        v17 = v15;
        v28 = v17;
        objc_msgSend(v16, "blockOperationWithBlock:", &v22);
        v18 = (NSOperation *)objc_claimAutoreleasedReturnValue();
        thumbnailLoadOperation = self->_thumbnailLoadOperation;
        self->_thumbnailLoadOperation = v18;

        objc_msgSend(v17, "thumbnailQueue", v22, v23, v24, v25, v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addOperation:", self->_thumbnailLoadOperation);

        objc_destroyWeak(v29);
        objc_destroyWeak(&location);
      }

    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)_createThumbnailWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  double v26;
  double v27;
  char v28;
  char v29;

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x2207C9CBC](self, a2);
  v29 = 0;
  -[_UIDocumentPickerContainerItem _blockingThumbnailWithSize:scale:wantsBorder:](self, "_blockingThumbnailWithSize:scale:wantsBorder:", &v29, width, height, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "size");
    v12 = v11 / height;
    objc_msgSend(v10, "size");
    v14 = fmax(v12, v13 / width);
    if (fabs(v14 + -1.0) < 2.22044605e-16 && v29 == 0)
    {
      v22 = v10;
    }
    else
    {
      objc_msgSend(v10, "size");
      v17 = v16 / v14;
      objc_msgSend(v10, "size");
      v19 = v18 / v14;
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setScale:", a4);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v20, v17, v19);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __65___UIDocumentPickerContainerItem__createThumbnailWithSize_scale___block_invoke;
      v24[3] = &unk_24E43ADC8;
      v26 = v17;
      v27 = v19;
      v25 = v10;
      v28 = v29;
      objc_msgSend(v21, "imageWithActions:", v24);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v22 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v22;
}

- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  height = a3.height;
  width = a3.width;
  if (-[_UIDocumentPickerContainerItem type](self, "type") == 1)
  {
    if (a5)
      *a5 = 0;
    v10 = (void *)objc_opt_class();
    -[_UIDocumentPickerContainerItem url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_blockingFolderIconForURL:container:size:scale:", v11, 0, width, height, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDC1570];
    -[_UIDocumentPickerContainerItem url](self, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerItem contentType](self, "contentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentProxyForName:type:MIMEType:", v15, v16, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_opt_class();
    -[_UIDocumentPickerContainerItem url](self, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:", v18, v11, a5, 0, width, height, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (NSString)title
{
  return 0;
}

- (NSString)subtitle
{
  return 0;
}

- (NSString)subtitle2
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (id)_resourceIdentifier
{
  id resourceIdentifier;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;

  resourceIdentifier = self->_resourceIdentifier;
  if (!resourceIdentifier)
  {
    -[_UIDocumentPickerContainerItem url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v5 = *MEMORY[0x24BDBCC30];
    v11 = 0;
    objc_msgSend(v4, "getPromisedItemResourceValue:forKey:error:", &v12, v5, &v11);
    v6 = v12;
    v7 = v11;

    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[_UIDocumentPickerContainerItem url](self, "url");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_resourceIdentifier;
    self->_resourceIdentifier = v8;

    resourceIdentifier = self->_resourceIdentifier;
  }
  return resourceIdentifier;
}

- (_UIDocumentPickerContainerModel)model
{
  return (_UIDocumentPickerContainerModel *)self->_model;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_resourceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerItem _resourceIdentifier](self, "_resourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_UIDocumentPickerContainerItem _resourceIdentifier](self, "_resourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)tags
{
  void *v2;
  id v3;
  id v5;

  -[_UIDocumentPickerContainerItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "br_getTagNames:error:", &v5, 0);
  v3 = v5;

  return v3;
}

- (id)tagBlipsWithHeight:(double)a3 scale:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[_UIDocumentPickerContainerItem tags](self, "tags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "count") >= 4)
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, 3);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[_UIDocumentPickerContainerItem _blipWithTags:height:scale:](self, "_blipWithTags:height:scale:", v9, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_blipWithTags:(id)a3 height:(double)a4 scale:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  double v17;
  double v18;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDF81E8];
    __UIImageCacheKeyWithSentinel();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61___UIDocumentPickerContainerItem__blipWithTags_height_scale___block_invoke;
    v15[3] = &unk_24E43AE18;
    v17 = a4;
    v16 = v7;
    v18 = a5;
    objc_msgSend(v8, "_cachedImageForKey:fromBlock:", v11, v15, v7, v9, v10, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerContainerItem url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isAlias
{
  void *v4;
  id v5;
  id v6;

  if (-[_UIDocumentPickerContainerItem type](self, "type"))
    return 0;
  if (!self->_hasCachedIsAlias)
  {
    -[_UIDocumentPickerContainerItem url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v6, *MEMORY[0x24BDBCC58], 0);
    v5 = v6;

    LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
    self->_cachedIsAlias = (char)v4;
    self->_hasCachedIsAlias = 1;
  }
  return self->_cachedIsAlias;
}

- (void)incrementModelDisplayCount
{
  void *v3;

  ++self->_modelDisplayCount;
  -[_UIDocumentPickerContainerItem _ensureModelPresent](self, "_ensureModelPresent");
  if (self->_modelDisplayCount == 1)
  {
    if (self->_model)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_modelChanged, CFSTR("_UIDocumentPickerModelUpdatedNotification"), self->_model);

      -[_UIDocumentPickerURLContainerModel startMonitoringChanges](self->_model, "startMonitoringChanges");
    }
  }
}

- (void)_ensureModelPresent
{
  _UIDocumentPickerURLContainerModel *WeakRetained;
  _UIDocumentPickerURLContainerModel *model;
  void *v5;
  _UIDocumentPickerURLContainerModel *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIDocumentPickerURLContainerModel *v10;
  _UIDocumentPickerURLContainerModel *v11;
  void *v12;
  id v13;

  if ((-[_UIDocumentPickerContainerItem type](self, "type") == 1
     || -[_UIDocumentPickerContainerItem type](self, "type") == 2)
    && !self->_model)
  {
    WeakRetained = (_UIDocumentPickerURLContainerModel *)objc_loadWeakRetained((id *)&self->_weak_model);
    model = self->_model;
    self->_model = WeakRetained;

    if (!self->_model)
    {
      -[_UIDocumentPickerContainerItem url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "br_realpathURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v6 = [_UIDocumentPickerURLContainerModel alloc];
      -[_UIDocumentPickerContainerItem parentModel](self, "parentModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pickableTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerContainerItem parentModel](self, "parentModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](v6, "initWithURL:pickableTypes:mode:", v13, v8, objc_msgSend(v9, "pickerMode"));
      v11 = self->_model;
      self->_model = v10;

      -[_UIDocumentPickerContainerItem title](self, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerURLContainerModel setDisplayTitle:](self->_model, "setDisplayTitle:", v12);

      objc_storeWeak((id *)&self->_weak_model, self->_model);
    }
  }
}

- (void)modelChanged
{
  id v3;

  -[_UIDocumentPickerContainerItem _modelChanged](self, "_modelChanged");
  -[_UIDocumentPickerContainerItem parentModel](self, "parentModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshItem:thumbnailOnly:", self, 0);

}

- (void)decrementModelDisplayCount
{
  int64_t v2;
  void *v4;
  _UIDocumentPickerURLContainerModel *model;
  NSOperation *thumbnailLoadOperation;

  v2 = self->_modelDisplayCount - 1;
  self->_modelDisplayCount = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_UIDocumentPickerModelUpdatedNotification"), self->_model);

    model = self->_model;
    self->_model = 0;

    -[NSOperation cancel](self->_thumbnailLoadOperation, "cancel");
    thumbnailLoadOperation = self->_thumbnailLoadOperation;
    self->_thumbnailLoadOperation = 0;

  }
}

- (id)_formattedSubtitleForNumberOfItems:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%lu items"), CFSTR("%lu items"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)renameable
{
  return 0;
}

- (id)contentType
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)pickable
{
  return self->_pickable;
}

- (void)setPickable:(BOOL)a3
{
  self->_pickable = a3;
}

- (NSMapTable)thumbnailsBySize
{
  return self->_thumbnailsBySize;
}

- (void)setThumbnailsBySize:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailsBySize, a3);
}

- (_UIDocumentPickerContainerModel)parentModel
{
  return (_UIDocumentPickerContainerModel *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (NSString)pickabilityReason
{
  return self->_pickabilityReason;
}

- (void)setPickabilityReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickabilityReason, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_thumbnailsBySize, 0);
  objc_storeStrong((id *)&self->_thumbnailLoadOperation, 0);
  objc_storeStrong(&self->_resourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_weak_model);
  objc_storeStrong((id *)&self->_model, 0);
}

- (unint64_t)indentationLevel
{
  return 0;
}

- (id)sortPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x2207C9CBC](self, a2);
  -[_UIDocumentPickerContainerItem url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

+ (id)_blockingThumbnailForItem:(id)a3 documentProxy:(id)a4 withSize:(CGSize)a5 scale:(double)a6 wantsBorder:(BOOL *)a7 generatedThumbnail:(BOOL *)a8
{
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;

  height = a5.height;
  width = a5.width;
  v15 = a3;
  v16 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EC8]), "initWithURL:", v15);
  objc_msgSend(MEMORY[0x24BDE5ED0], "descriptorWithSize:scaleFactor:", width, height, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v17, "imageForUseMode:descriptor:generateIfNeeded:contentRect:error:", 0, v18, 1, 0, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;
  if (v19)
  {
    if (a8)
      *a8 = 1;
    if (a7)
      *a7 = 1;
  }
  else
  {
    cdui_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[_UIDocumentPickerContainerItem(Icons) _blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:].cold.1(v15);

    if (a8)
      *a8 = 0;
    objc_msgSend(a1, "_blockingIconForDocumentProxy:withSize:", v16, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (id)_blockingIconForURL:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12 = 0;
  objc_msgSend(v7, "getPromisedItemResourceValue:forKey:error:", &v12, *MEMORY[0x24BDBCCF0], 0);
  v8 = (__CFString *)v12;
  if (UTTypeConformsTo(v8, (CFStringRef)*MEMORY[0x24BDC1770]))
  {
    objc_msgSend(a1, "_blockingFolderIconForURL:container:size:scale:", v7, 0, width, height, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1570], "documentProxyForName:type:MIMEType:", 0, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_blockingIconForDocumentProxy:withSize:", v10, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)_blockingIconForDocumentProxy:(id)a3 withSize:(CGSize)a4
{
  double height;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  height = a4.height;
  v5 = a3;
  if (height <= 100.0)
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    v7 = v5;
    if (height >= 50.0)
      v8 = 11;
    else
      v8 = 13;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    v7 = v5;
    v8 = 12;
  }
  objc_msgSend(v6, "_iconForResourceProxy:format:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_blockingBadgeForContainer:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  float v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  height = a4.height;
  width = a4.width;
  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v43 = 1;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17550]);

  if (!v10)
    goto LABEL_3;
  v11 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("iCloudDrive-TopLevel"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  if (!v14)
  {
LABEL_3:
    v15 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", (uint64_t)a5, &v43, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithData:scale:", v16, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14
      || (v17 = width * a5,
          v18 = (void *)MEMORY[0x24BDF6AC8],
          objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", 1, &v43, v17, height * a5),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "imageWithData:scale:", v19, a5),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v14))
    {
LABEL_5:
      if (v43)
      {
        objc_msgSend(v14, "scale");
        objc_msgSend(v14, "_applicationIconImageForFormat:precomposed:scale:", 2, 0);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_7:

        v14 = (void *)v20;
      }
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v8, "imageRepresentationsAvailable", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v22)
      {
LABEL_17:
        v20 = 0;
        goto LABEL_7;
      }
      v23 = v22;
      v24 = *(_QWORD *)v40;
LABEL_11:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v14);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v25);
        objc_msgSend(v26, "objectForKey:", CFSTR("size"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "CGSizeValue");
        v29 = v28;
        v31 = v30;

        objc_msgSend(v26, "objectForKey:", CFSTR("scale"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "floatValue");
        v34 = v33;
        v35 = v33;

        v43 = 0;
        if (v29 * v35 >= v17)
          break;
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16, v29 * v35);
          if (v23)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v36 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v8, "imageDataForSize:scale:shouldTransformToAppIcon:", (uint64_t)v34, &v43, v29, v31);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "imageWithData:scale:", v37, a5);
      v38 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v38;
      if (v38)
        goto LABEL_5;
    }
  }

  return v14;
}

+ (id)_blockingFolderIconForURL:(id)a3 container:(id)a4 size:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  double v44;
  double v45;
  uint64_t v46;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = 0;
  v15 = *MEMORY[0x24BDBF148];
  v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v16 = 1;
  v17 = 0;
  while (v13 != 20)
  {
    if (vabdd_f64(width, *(double *)&qword_24E43AE38[v13]) >= 1.0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", qword_24E43AE38[v13 + 1]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = qword_24E43AE38[v13 + 2];
      v14 = *(double *)&qword_24E43AE38[v13 + 3];
      v16 = LOBYTE(qword_24E43AE38[v13 + 4]) != 0;
      v15 = v14;
    }
    v13 += 5;
    if (v18)
    {
      if (v12)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v11, "br_containerID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE17550]))
      {
        objc_msgSend(v11, "br_pathRelativeToSyncedRootURLForContainerID:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pathComponents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24 == 2)
        {
          objc_msgSend(v22, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE17568]))
          {
            v40 = v25;
            v26 = (void *)MEMORY[0x24BDF6AC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Desktop%@"), v18);
            goto LABEL_24;
          }
          if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE17578]))
          {
            v40 = v25;
            v26 = (void *)MEMORY[0x24BDF6AC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Documents%@"), v18);
LABEL_24:
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithDisplayScale:", a6);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v26;
            v33 = (void *)v29;
            objc_msgSend(v32, "imageNamed:inBundle:compatibleWithTraitCollection:", v29, v30, v31);
            v19 = (id)objc_claimAutoreleasedReturnValue();

            v25 = v40;
          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

      goto LABEL_29;
    }
  }
  cdui_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    +[_UIDocumentPickerContainerItem(Icons) _blockingFolderIconForURL:container:size:scale:].cold.1(width, height, (uint64_t)v11, v20);

  v18 = 0;
  if (!v12)
    goto LABEL_13;
LABEL_8:
  if (v16)
  {
    objc_msgSend(a1, "_blockingBadgeForContainer:size:scale:", v12, v15, v14, a6);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_blockingBadgeForContainer:size:scale:", v12, width, height, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v19 = v27;
      v28 = v19;
      goto LABEL_31;
    }
    v19 = 0;
  }
LABEL_29:
  v34 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Folder%@"), v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "imageNamed:inBundle:compatibleWithTraitCollection:", v35, v36, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v37 = objc_alloc(MEMORY[0x24BDF6A98]);
    objc_msgSend(v28, "size");
    v38 = (void *)objc_msgSend(v37, "initWithSize:");
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __88___UIDocumentPickerContainerItem_Icons___blockingFolderIconForURL_container_size_scale___block_invoke;
    v41[3] = &unk_24E43AF08;
    v42 = v28;
    v44 = v15;
    v45 = v14;
    v46 = v17;
    v19 = v19;
    v43 = v19;
    objc_msgSend(v38, "imageWithActions:", v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_31:

  return v28;
}

@end
