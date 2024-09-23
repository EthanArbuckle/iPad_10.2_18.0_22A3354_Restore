@implementation JFXMediaItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXMediaItem)init
{
  JFXMediaItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXMediaItem;
  result = -[JFXMediaItem init](&v3, sel_init);
  if (result)
  {
    result->_mediaType = 0;
    result->_mediaState = 0;
    result->_durationAt30fps = 1;
    *(_OWORD *)&result->_mediaLoadState = xmmword_226AB7210;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JFXMediaItem;
  -[JFXMediaItem dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media type: %ld, duration: %ld"), self->_mediaType, self->_durationAt30fps);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_mediaType;
  *((_DWORD *)result + 2) = self->_durationAt30fps;
  *((_QWORD *)result + 5) = self->_interfaceOrientationForDisplay;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  JFXMediaItem *v4;
  JFXMediaItem *v5;
  int64_t v6;
  int v7;
  BOOL v8;

  v4 = (JFXMediaItem *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[JFXMediaItem mediaType](self, "mediaType");
      v8 = 0;
      if (v6 == -[JFXMediaItem mediaType](v5, "mediaType"))
      {
        v7 = -[JFXMediaItem durationAt30fps](self, "durationAt30fps");
        if (v7 == -[JFXMediaItem durationAt30fps](v5, "durationAt30fps"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXMediaItem;
  return -[JFXMediaItem hash](&v3, sel_hash);
}

- (PVColorSpace)colorSpace
{
  return 0;
}

- (int)playableMediaContentMode
{
  return 1;
}

- (BOOL)canSaveToCameraRoll
{
  return 0;
}

- (BOOL)canBeAddedToSequence
{
  return 0;
}

- (BOOL)canHaveFilter
{
  return 1;
}

- (BOOL)hasAudibleCharacteristic
{
  return 0;
}

- (BOOL)hasVisualCharacteristic
{
  return 0;
}

- (BOOL)hasPhotoCharacteristic
{
  return 0;
}

- (JFXMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  JFXMediaItem *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[JFXMediaItem init](self, "init");
  objc_storeWeak((id *)&v8->_delegate, v6);

  objc_msgSend(v7, "objectForKey:", kMediaItemTypeKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_mediaType = (int)objc_msgSend(v9, "intValue");

  objc_msgSend(v7, "objectForKey:", kMediaItemDurationKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_durationAt30fps = objc_msgSend(v10, "intValue");

  objc_msgSend(v7, "objectForKey:", kMediaItemInterfaceOrientationForDisplayKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v8->_interfaceOrientationForDisplay = (int)objc_msgSend(v11, "intValue");
  return v8;
}

- (id)info
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_mediaType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, kMediaItemTypeKey);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_durationAt30fps);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, kMediaItemDurationKey);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_interfaceOrientationForDisplay);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, kMediaItemInterfaceOrientationForDisplayKey);

  return v3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaState
{
  return self->_mediaState;
}

- (void)setMediaState:(int64_t)a3
{
  self->_mediaState = a3;
}

- (int64_t)mediaLoadState
{
  return self->_mediaLoadState;
}

- (void)setMediaLoadState:(int64_t)a3
{
  self->_mediaLoadState = a3;
}

- (int)durationAt30fps
{
  return self->_durationAt30fps;
}

- (void)setDurationAt30fps:(int)a3
{
  self->_durationAt30fps = a3;
}

- (int64_t)interfaceOrientationForDisplay
{
  return self->_interfaceOrientationForDisplay;
}

- (void)setInterfaceOrientationForDisplay:(int64_t)a3
{
  self->_interfaceOrientationForDisplay = a3;
}

- (JFXMediaItemDelegate)delegate
{
  return (JFXMediaItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
