@implementation CKMediaObjectBackedAsset

- (CKMediaObjectBackedAsset)initWithChatItem:(id)a3
{
  id v4;
  CKMediaObjectBackedAsset *v5;
  CKMediaObjectBackedAsset *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMediaObjectBackedAsset;
  v5 = -[CKMediaObjectBackedAsset initWithConfiguration:](&v9, sel_initWithConfiguration_, &__block_literal_global_239);
  v6 = v5;
  if (v5)
  {
    -[CKMediaObjectBackedAsset setChatItem:](v5, "setChatItem:", v4);
    objc_msgSend(v4, "mediaObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isMonoskiAsset");

  }
  return v6;
}

- (CKMediaObjectBackedAsset)initWithConfiguration:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (CKMediaObject)mediaObject
{
  void *v2;
  void *v3;

  -[CKMediaObjectBackedAsset chatItem](self, "chatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKMediaObject *)v3;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMediaObjectBackedAsset chatItem](self, "chatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleAssociatedMessageChatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (CKAggregateAcknowledgmentChatItem)acknowledgmentChatItem
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CKMediaObjectBackedAsset chatItem](self, "chatItem", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleAssociatedMessageChatItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "setOverrideBalloonOrientationForPhotoGrid:", 1);
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (CKAggregateAcknowledgmentChatItem *)v4;
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
    objc_msgSend(v4, "mediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)mediaType
{
  void *v2;
  int v3;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if (v3 == 3)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (int64_t)playbackStyle
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  int64_t v7;
  char v8;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v5, "isIrisAsset"))
      v7 = 3;
    else
      v7 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
      return 0;
    -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isAutoloopVideo"))
      v7 = 5;
    else
      v7 = 4;
  }

  return v7;
}

- (BOOL)isSpatialMedia
{
  void *v2;
  char v3;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMonoskiAsset");

  return v3;
}

- (id)url
{
  void *v2;
  void *v3;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)localCreationDate
{
  void *v2;
  void *v3;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)pixelWidth
{
  double v3;
  double v5;
  char v6;

  v6 = 0;
  -[CKMediaObjectBackedAsset _transcoderGeneratedPxSize:](self, "_transcoderGeneratedPxSize:", &v6);
  if (v6)
    return (unint64_t)v3;
  -[CKMediaObjectBackedAsset _previewPxSize:](self, "_previewPxSize:", &v6);
  if (v6)
    return (unint64_t)v5;
  else
    return 0;
}

- (unint64_t)pixelHeight
{
  double v3;
  double v5;
  char v6;

  v6 = 0;
  -[CKMediaObjectBackedAsset _transcoderGeneratedPxSize:](self, "_transcoderGeneratedPxSize:", &v6);
  if (v6)
    return (unint64_t)v3;
  -[CKMediaObjectBackedAsset _previewPxSize:](self, "_previewPxSize:", &v6);
  if (v6)
    return (unint64_t)v5;
  else
    return 0;
}

- (double)aspectRatio
{
  double v3;
  NSObject *v5;

  if (-[CKMediaObjectBackedAsset pixelHeight](self, "pixelHeight"))
  {
    v3 = (double)-[CKMediaObjectBackedAsset pixelWidth](self, "pixelWidth");
    return v3 / (double)-[CKMediaObjectBackedAsset pixelHeight](self, "pixelHeight");
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectBackedAsset aspectRatio].cold.1(v5);

    return 0.0;
  }
}

- (id)uuid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D37F40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transferGUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (double)duration
{
  void *v3;
  char isKindOfClass;
  void *v5;
  double v6;
  double v7;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0.0;
  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  return v7;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[CKMediaObjectBackedAsset isEqual:](self, "isEqual:", v4))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (CLLocation)location
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKMediaObjectBackedAsset *v4;
  void *v5;
  CKMediaObjectBackedAsset *v6;

  v4 = [CKMediaObjectBackedAsset alloc];
  -[CKMediaObjectBackedAsset chatItem](self, "chatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKMediaObjectBackedAsset initWithChatItem:](v4, "initWithChatItem:", v5);

  return v6;
}

- (CGSize)_transcoderGeneratedPxSize:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  CGSize result;

  -[CKMediaObjectBackedAsset _clientPreviewConstraints](self, "_clientPreviewConstraints");
  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transcodingPreviewConstraints");

  if (IMPreviewConstraintsEqualToConstraints())
  {
    -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject", 0, 0, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transcodingPreviewPxSize");
    v9 = v8;
    v11 = v10;

    if (a3)
    {
      v12 = v9 != *MEMORY[0x1E0C9D820];
      if (v11 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        v12 = 1;
      *a3 = v12;
    }
  }
  else
  {
    if (a3)
      *a3 = 0;
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v9;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_previewPxSize:(BOOL *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGSize result;

  -[CKMediaObjectBackedAsset _mediaObjectPreview](self, "_mediaObjectPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a3)
      *a3 = 1;
    v20 = 0u;
    v6 = v5;
    -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject", (unsigned __int128)0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "transcodingPreviewConstraints");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }

    v11 = *((double *)&v20 + 1);
    if (*((double *)&v20 + 1) <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      v11 = v13;

    }
    objc_msgSend(v6, "size", v19, (_QWORD)v20);
    v10 = v11 * v14;
    objc_msgSend(v6, "size");
    v16 = v15;

    v9 = v11 * v16;
  }
  else
  {
    if (a3)
      *a3 = 0;
    v10 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v17 = v10;
  v18 = v9;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)_mediaObjectPreview
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMediaObjectBackedAsset mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewMaxWidth");
  objc_msgSend(v2, "previewForWidth:orientation:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CKAttachmentMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
}

- (void)aspectRatio
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[CKMediaObjectBackedAsset aspectRatio]";
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "%s would have attempted divide by zero because pixelHeight was 0.", (uint8_t *)&v1, 0xCu);
}

@end
