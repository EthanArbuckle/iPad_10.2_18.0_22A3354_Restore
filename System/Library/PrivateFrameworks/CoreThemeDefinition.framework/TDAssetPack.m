@implementation TDAssetPack

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTags:", -[TDAssetPack tags](self, "tags"));
  objc_msgSend(v4, "setOutputPath:", -[TDAssetPack outputPath](self, "outputPath"));
  objc_msgSend(v4, "setAssetPackIdentifier:", -[TDAssetPack assetPackIdentifier](self, "assetPackIdentifier"));
  objc_msgSend(v4, "setWasModified:", -[TDAssetPack wasModified](self, "wasModified"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TDAssetPack setTags:](self, "setTags:", 0);
  -[TDAssetPack setOutputPath:](self, "setOutputPath:", 0);
  -[TDAssetPack setAssetStore:](self, "setAssetStore:", 0);
  -[TDAssetPack setAssetPackIdentifier:](self, "setAssetPackIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDAssetPack;
  -[TDAssetPack dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](-[TDAssetPack tags](self, "tags"), "hash");
  return -[NSString hash](-[TDAssetPack assetPackIdentifier](self, "assetPackIdentifier"), "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend((id)objc_msgSend(a3, "tags"), "isEqualToSet:", -[TDAssetPack tags](self, "tags")))
  {
    return objc_msgSend((id)objc_msgSend(a3, "assetPackIdentifier"), "isEqualToString:", -[TDAssetPack assetPackIdentifier](self, "assetPackIdentifier"));
  }
  else
  {
    return 0;
  }
}

- (NSSet)tags
{
  return self->tags;
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)outputPath
{
  return self->outputPath;
}

- (void)setOutputPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CUIMutableCommonAssetStorage)assetStore
{
  return (CUIMutableCommonAssetStorage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)wasModified
{
  return self->wasModified;
}

- (void)setWasModified:(BOOL)a3
{
  self->wasModified = a3;
}

- (NSString)assetPackIdentifier
{
  return self->assetPackIdentifier;
}

- (void)setAssetPackIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
