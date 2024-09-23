@implementation CFXEffectMessagesStickerProperties

- (CFXEffectMessagesStickerProperties)initWithEffectID:(id)a3 previewUrl:(id)a4 localizedDescription:(id)a5
{
  id v9;
  id v10;
  id v11;
  CFXEffectMessagesStickerProperties *v12;
  CFXEffectMessagesStickerProperties *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CFXEffectMessagesStickerProperties;
  v12 = -[CFXEffectMessagesStickerProperties init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_effectID, a3);
    objc_storeStrong((id *)&v13->_previewUrl, a4);
    objc_storeStrong((id *)&v13->_localizedDescription, a5);
  }

  return v13;
}

- (NSString)effectID
{
  return self->_effectID;
}

- (NSURL)previewUrl
{
  return self->_previewUrl;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_previewUrl, 0);
  objc_storeStrong((id *)&self->_effectID, 0);
}

@end
