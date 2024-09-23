@implementation CKImageBalloonPluginDatasource

- (CKImageBalloonPluginDatasource)initWithPluginPayload:(id)a3
{
  CKImageBalloonPluginDatasource *v3;
  CKImageBalloonPluginDatasource *v4;
  void *v5;
  uint64_t v6;
  CKMediaObject *mediaObject;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKImageBalloonPluginDatasource;
  v3 = -[CKImageBalloonPluginDatasource initWithPluginPayload:](&v9, sel_initWithPluginPayload_, a3);
  v4 = v3;
  if (v3)
  {
    -[CKImageBalloonPluginDatasource pluginPayload](v3, "pluginPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaObjectFromPayload");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaObject = v4->_mediaObject;
    v4->_mediaObject = (CKMediaObject *)v6;

  }
  return v4;
}

- (id)imageBalloon
{
  void *v3;
  CKMediaObject *mediaObject;
  void *v5;
  void *v6;
  CKMediaObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_previewDidChange_, CFSTR("CKPreviewDidChangeNotification"), 0);

  mediaObject = self->_mediaObject;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMaxWidth");
  CKBalloonViewForClass(-[CKMediaObject balloonViewClassForWidth:orientation:](mediaObject, "balloonViewClassForWidth:orientation:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_mediaObject;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewMaxWidth");
  objc_msgSend(v6, "configureForMediaObject:previewWidth:orientation:", v7, 1);

  objc_msgSend(v6, "setOrientation:", 1);
  objc_msgSend(v6, "setCanUseOpaqueMask:", 0);
  objc_msgSend(v6, "setHasTail:", 0);
  objc_msgSend(v6, "setBalloonShape:", 0);
  objc_msgSend(v6, "prepareForDisplay");
  v9 = (void *)objc_opt_class();
  if (objc_msgSend(v9, "__ck_isKindOfClass:", objc_opt_class()))
  {
    -[CKImageBalloonPluginDatasource mediaObject](self, "mediaObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributionInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D37F10]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
      objc_msgSend(v6, "setStickerAccessibilityDescription:", v13);

  }
  -[CKImageBalloonPluginDatasource setBalloonView:](self, "setBalloonView:", v6);
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKImageBalloonPluginDatasource mediaObject](self, "mediaObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSticker");

  if (v8)
  {
    -[CKImageBalloonPluginDatasource mediaObject](self, "mediaObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "previewMaxWidth");
    objc_msgSend(v9, "previewForWidth:orientation:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v10) = objc_opt_isKindOfClass();
    v12 = v11;
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v12, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v16 = v15;
      v18 = v17;

      objc_msgSend(v13, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "size");
      v16 = v22;
      v18 = v23;
      v19 = v13;
    }
    objc_msgSend(v19, "scale");
    v25 = v24;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stickerScreenScale");
    objc_msgSend(v26, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v16, v18, v25, 1.0, v27, width);
    v29 = v28;
    v31 = v30;

    v20 = v29;
    v21 = v31;
  }
  else
  {
    -[CKBalloonView sizeThatFits:](self->_balloonView, "sizeThatFits:", width, height);
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)previewDidChange:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  CKBalloonView *balloonView;
  CKMediaObject *mediaObject;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transferGUID](self->_mediaObject, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transferGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      balloonView = self->_balloonView;
      mediaObject = self->_mediaObject;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "previewMaxWidth");
      -[CKBalloonView configureForMediaObject:previewWidth:orientation:](balloonView, "configureForMediaObject:previewWidth:orientation:", mediaObject, 1);

    }
    v6 = v14;
  }

}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
