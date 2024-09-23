@implementation PHPickerResult

- (PHPickerResult)init
{
  PHPickerResult *v2;
  SEL v3;
  id v4;

  v2 = (PHPickerResult *)_PFAssertFailHandler();
  return (PHPickerResult *)-[PHPickerResult isEqual:](v2, v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  PHPickerResult *v4;
  PHPickerResult *v5;
  objc_class *v6;
  NSString *itemIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  _PHPickerResultMetadata *metadata;
  _PHPickerResultMetadata *v14;
  _PHPickerResultMetadata *v15;
  _PHPickerResultMetadata *v16;
  objc_class *v18;
  objc_class *v19;
  PHPickerResult *v20;
  SEL v21;

  v4 = (PHPickerResult *)a3;
  if (self == v4)
  {
    v12 = 1;
LABEL_17:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[NSItemProvider isEqual:](self->_itemProvider, "isEqual:", v5->_itemProvider))
      {
        itemIdentifier = self->_itemIdentifier;
        v8 = v5->_itemIdentifier;
        if (itemIdentifier == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = itemIdentifier;
          v11 = -[NSString isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_15;
        }
        if (self->__isAssetResult == v5->__isAssetResult)
        {
          metadata = self->__metadata;
          v14 = v5->__metadata;
          v15 = metadata;
          v16 = v15;
          if (v15 == v14)
            v12 = 1;
          else
            v12 = -[_PHPickerResultMetadata isEqual:](v15, "isEqual:", v14);

          goto LABEL_16;
        }
      }
LABEL_15:
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v20 = (PHPickerResult *)_PFAssertFailHandler();
  return -[PHPickerResult hash](v20, v21);
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSItemProvider hash](self->_itemProvider, "hash");
  v4 = -[NSString hash](self->_itemIdentifier, "hash");
  v5 = self->__isAssetResult - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return -[_PHPickerResultMetadata hash](self->__metadata, "hash") - v5 + 32 * v5 + 923521;
}

- (NSString)assetIdentifier
{
  if (self->__isAssetResult)
    return self->_itemIdentifier;
  else
    return (NSString *)0;
}

- (CGRect)_preferredContentsRectForTargetSize:(CGSize)a3
{
  double v4;
  BOOL v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect result;

  v4 = 1.0;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    v5 = a3.width == *MEMORY[0x24BE71BF0] && a3.height == *(double *)(MEMORY[0x24BE71BF0] + 8);
    v6 = fabs(a3.width / a3.height);
    if (v5)
      v4 = 1.0;
    else
      v4 = v6;
  }
  v47 = v4;
  v7 = (void *)MEMORY[0x24BE723E8];
  -[PHPickerResult _metadata](self, "_metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pixelWidth");
  -[PHPickerResult _metadata](self, "_metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pixelHeight");
  -[PHPickerResult _metadata](self, "_metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredCropRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[PHPickerResult _metadata](self, "_metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "acceptableCropRect");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PHPickerResult _metadata](self, "_metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "normalizedFaceAreaRect");
  objc_msgSend(v7, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", 0, 3, v9, v11, v47, v14, v16, v18, v20, v23, v25, v27, v29, v31, v32, v33,
    v34);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  +[PHPickerResult _validateBestCropRect:](PHPickerResult, "_validateBestCropRect:", v36, v38, v40, v42);
  v43 = v36;
  v44 = v38;
  v45 = v40;
  v46 = v42;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)_requestThumbnailImageURLForPreferredSize:(int64_t)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  PHPickerResult *v12;
  SEL v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    if (a3 == 1)
      v8 = CFSTR("com.apple.private.photos.thumbnail.low");
    else
      v8 = CFSTR("com.apple.private.photos.thumbnail.standard");
    -[PHPickerResult itemProvider](self, "itemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__PHPickerResult__requestThumbnailImageURLForPreferredSize_resultHandler___block_invoke;
    v15[3] = &unk_24C62C720;
    v16 = v7;
    v10 = v7;
    v11 = (id)objc_msgSend(v9, "loadFileRepresentationForTypeIdentifier:completionHandler:", v8, v15);

  }
  else
  {
    v12 = (PHPickerResult *)_PFAssertFailHandler();
    -[PHPickerResult _filePromiseURLForTypeIdentifier:](v12, v13, v14);
  }
}

- (id)_filePromiseURLForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  PHPickerResult *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _PFAssertFailHandler();
  v5 = v4;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PHPickerResult _metadata](self, "_metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v26 = self;
    v27 = v7;
    v10 = *(_QWORD *)v30;
    v28 = v5;
    v25 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (!v16 && objc_msgSend(v14, "conformsToType:", v13))
        {
          -[PHPickerResult _metadata](v26, "_metadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "filePromiseURLs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[PHPickerResult _metadata](v26, "_metadata");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sandboxExtensionTokens");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 && v22)
          {
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72258]), "initWithURL:sandboxExtensionToken:consume:", v19, v22, 1);

            v7 = v27;
            v5 = v28;
            goto LABEL_19;
          }

          v7 = v27;
          v5 = v28;
          v10 = v25;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v9)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_19:

  return v23;
}

- (id)_initWithItemProvider:(id)a3 assetIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  PHPickerResult *v11;
  SEL v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v9 = -[PHPickerResult _initWithItemProvider:itemIdentifier:isAssetResult:metadata:](self, "_initWithItemProvider:itemIdentifier:isAssetResult:metadata:", v6, v7, 1, 0);

    return v9;
  }
  else
  {
    v11 = (PHPickerResult *)_PFAssertFailHandler();
    return -[PHPickerResult _initWithItemProvider:itemIdentifier:isAssetResult:metadata:](v11, v12, v13, v14, v15, v16);
  }
}

- (id)_initWithItemProvider:(id)a3 itemIdentifier:(id)a4 isAssetResult:(BOOL)a5 metadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PHPickerResult *v15;
  uint64_t v16;
  NSString *itemIdentifier;
  uint64_t v18;
  _PHPickerResultMetadata *metadata;
  PHPickerResult *v21;
  SEL v22;
  id v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    v14 = v13;
    v24.receiver = self;
    v24.super_class = (Class)PHPickerResult;
    v15 = -[PHPickerResult init](&v24, sel_init);
    if (!v15)
    {
LABEL_5:

      return v15;
    }
    if ((-[PHPickerResult isMemberOfClass:](v15, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      objc_storeStrong((id *)&v15->_itemProvider, a3);
      v16 = objc_msgSend(v12, "copy");
      itemIdentifier = v15->_itemIdentifier;
      v15->_itemIdentifier = (NSString *)v16;

      v15->__isAssetResult = a5;
      v18 = objc_msgSend(v14, "copy");
      metadata = v15->__metadata;
      v15->__metadata = (_PHPickerResultMetadata *)v18;

      goto LABEL_5;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v21 = (PHPickerResult *)_PFAssertFailHandler();
  return -[PHPickerResult initWithCoder:](v21, v22, v23);
}

- (PHPickerResult)initWithCoder:(id)a3
{
  id v4;
  PHPickerResult *v5;
  PHPickerResult *v6;
  _PHPickerResultMetadata *v7;
  PUPhotosFileProviderItemProvider *v8;
  void *v9;
  void *v10;
  PUPhotosFileProviderItemProvider *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSItemProvider *itemProvider;
  PUPhotosFileProviderItemProvider *v25;
  uint64_t v26;
  NSString *itemIdentifier;
  _PHPickerResultMetadata *metadata;
  PHPickerResult *v30;
  void *v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PHPickerResult;
  v5 = -[PHPickerResult init](&v37, sel_init);
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_517);
    v31 = v4;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerResultMetadataKey"));
    v7 = (_PHPickerResultMetadata *)objc_claimAutoreleasedReturnValue();
    v8 = [PUPhotosFileProviderItemProvider alloc];
    -[_PHPickerResultMetadata filePromiseURLs](v7, "filePromiseURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PHPickerResultMetadata sandboxExtensionTokens](v7, "sandboxExtensionTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUPhotosFileProviderItemProvider initWithProgressURLs:progressURLSandboxExtensionTokens:](v8, "initWithProgressURLs:progressURLSandboxExtensionTokens:", v9, v10);

    -[_PHPickerResultMetadata suggestedName](v7, "suggestedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosFileProviderItemProvider setSuggestedName:](v11, "setSuggestedName:", v12);

    -[PUPhotosFileProviderItemProvider set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:](v11, "set_copyToTemporaryDirectoryBeforeCallingOpenInPlaceCompletionHandler:", -[_PHPickerResultMetadata allowsItemProviderOpenInPlace](v7, "allowsItemProviderOpenInPlace"));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[_PHPickerResultMetadata typeIdentifiers](v7, "typeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[_PHPickerResultMetadata filePromiseURLs](v7, "filePromiseURLs", v30);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[_PHPickerResultMetadata sandboxExtensionTokens](v7, "sandboxExtensionTokens");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            v23 = v22 == 0;
          else
            v23 = 1;
          if (!v23)
          {
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __32__PHPickerResult_initWithCoder___block_invoke_2;
            v32[3] = &unk_24C62C790;
            v32[4] = v20;
            v32[5] = v22;
            -[PUPhotosFileProviderItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:](v11, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v18, 0, 3, v32);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    v6 = v30;
    itemProvider = v30->_itemProvider;
    v30->_itemProvider = &v11->super;
    v25 = v11;

    v4 = v31;
    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerResultItemIdentifierKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v30->_itemIdentifier;
    v30->_itemIdentifier = (NSString *)v26;

    v30->__isAssetResult = objc_msgSend(v31, "decodeBoolForKey:", CFSTR("PHPickerResultIsAssetResultKey"));
    metadata = v30->__metadata;
    v30->__metadata = v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("PHPickerResultItemIdentifierKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__isAssetResult, CFSTR("PHPickerResultIsAssetResultKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__metadata, CFSTR("PHPickerResultMetadataKey"));

}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (BOOL)_isAssetResult
{
  return self->__isAssetResult;
}

- (_PHPickerResultMetadata)_metadata
{
  return self->__metadata;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->__metadata, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

uint64_t __32__PHPickerResult_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  __int128 v8;
  id v9;

  v3 = a2;
  v4 = initWithCoder__queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__PHPickerResult_initWithCoder___block_invoke_3;
  block[3] = &unk_24C62C768;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  return 0;
}

void __32__PHPickerResult_initWithCoder___block_invoke_3(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE72258]), "initWithURL:sandboxExtensionToken:consume:", a1[4], a1[5], 1);
  (*(void (**)(void))(a1[6] + 16))();

}

void __32__PHPickerResult_initWithCoder___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.picker.results", v0);
  v2 = (void *)initWithCoder__queue;
  initWithCoder__queue = (uint64_t)v1;

}

uint64_t __74__PHPickerResult__requestThumbnailImageURLForPreferredSize_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)_validateBestCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x24BDAC8D0];
  if (CGRectIsEmpty(a3))
  {
    objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
    _PFAssertFailHandler();
  }
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = 1.0;
  v18.size.height = 1.0;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v7 = CGRectContainsRect(v18, v19);
  PLPickerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
    v10 = (void *)v9;
    v11 = CFSTR("is not");
    if (v7)
      v11 = CFSTR("is");
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ contained in the unit rect.", buf, 0x16u);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
