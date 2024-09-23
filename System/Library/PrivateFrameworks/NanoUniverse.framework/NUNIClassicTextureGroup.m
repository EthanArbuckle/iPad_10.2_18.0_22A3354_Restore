@implementation NUNIClassicTextureGroup

- (NUNIClassicTextureGroup)initWithTextures:(id)a3
{
  id v5;
  NUNIClassicTextureGroup *v6;
  NUNIClassicTextureGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUNIClassicTextureGroup;
  v6 = -[NUNIClassicTextureGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textures, a3);

  return v7;
}

- (NSArray)textures
{
  return self->_textures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textures, 0);
}

@end
