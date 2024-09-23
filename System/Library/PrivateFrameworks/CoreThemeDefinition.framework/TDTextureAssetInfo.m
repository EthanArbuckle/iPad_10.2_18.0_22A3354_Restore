@implementation TDTextureAssetInfo

- (id)copyWithZone:(_NSZone *)a3
{
  TDTextureAssetInfo *v4;

  v4 = -[TDTextureAssetInfo init](+[TDTextureAssetInfo allocWithZone:](TDTextureAssetInfo, "allocWithZone:", a3), "init");
  -[TDTextureAssetInfo setFileURL:](v4, "setFileURL:", -[TDTextureAssetInfo fileURL](self, "fileURL"));
  -[TDTextureAssetInfo setMipLevel:](v4, "setMipLevel:", -[TDTextureAssetInfo mipLevel](self, "mipLevel"));
  -[TDTextureAssetInfo setTextureFace:](v4, "setTextureFace:", -[TDTextureAssetInfo textureFace](self, "textureFace"));
  -[TDTextureAssetInfo setFlipped:](v4, "setFlipped:", -[TDTextureAssetInfo flipped](self, "flipped"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TDTextureAssetInfo setFileURL:](self, "setFileURL:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDTextureAssetInfo;
  -[TDTextureAssetInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TDTextureAssetInfo;
  v3 = -[TDTextureAssetInfo description](&v6, sel_description);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fileURL:%@ mipLevel: %d textureFace: %d flipped: %d "), -[TDTextureAssetInfo fileURL](self, "fileURL"), -[TDTextureAssetInfo mipLevel](self, "mipLevel"), -[TDTextureAssetInfo textureFace](self, "textureFace"), -[TDTextureAssetInfo flipped](self, "flipped"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@  %@"), v3, v4);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)mipLevel
{
  return self->_mipLevel;
}

- (void)setMipLevel:(unint64_t)a3
{
  self->_mipLevel = a3;
}

- (int64_t)textureFace
{
  return self->_textureFace;
}

- (void)setTextureFace:(int64_t)a3
{
  self->_textureFace = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

@end
