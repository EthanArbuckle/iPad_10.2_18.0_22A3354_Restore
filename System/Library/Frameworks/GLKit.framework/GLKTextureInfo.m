@implementation GLKTextureInfo

- (GLKTextureInfo)initWithTexture:(id)a3 textureName:(unsigned int)a4
{
  GLKTextureInfo *v6;
  GLKTextureInfo *v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int height;
  int v12;
  BOOL v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GLKTextureInfo;
  v6 = -[GLKTextureInfo init](&v15, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->name = a4;
  v6->target = objc_msgSend(a3, "bindTarget");
  v7->width = objc_msgSend(a3, "width");
  v7->height = objc_msgSend(a3, "height");
  v7->depth = 1;
  if (objc_msgSend(a3, "hasAlpha"))
  {
    if (objc_msgSend(a3, "hasPremultipliedAlpha"))
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v7->alphaState = v8;
  if (objc_msgSend(a3, "orientation") == 1)
  {
    v9 = 1;
  }
  else
  {
    if (objc_msgSend(a3, "orientation") != 4)
    {
      v7->textureOrigin = 0;
      goto LABEL_13;
    }
    v9 = 2;
  }
  v7->textureOrigin = v9;
LABEL_13:
  v7->containsMipmaps = objc_msgSend(a3, "isMipmapped");
  v7->arrayLength = 1;
  v10 = objc_msgSend(a3, "numMipMapLevels");
  v7->mimapLevelCount = v10;
  if (v10 == 1 && objc_msgSend(a3, "requestIssuedForMipmapGeneration"))
  {
    height = v7->height;
    if (v7->width > height)
      height = v7->width;
    if (height)
    {
      v12 = -1;
      do
      {
        ++v12;
        v13 = height > 1;
        height >>= 1;
      }
      while (v13);
    }
    else
    {
      v12 = -1;
    }
    v7->mimapLevelCount = v12;
  }
  return v7;
}

- (GLKTextureInfo)initWithTextureTXR:(id)a3 textureName:(unsigned int)a4
{
  GLKTextureInfo *v6;
  GLKTextureInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GLKTextureInfo;
  v6 = -[GLKTextureInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->name = a4;
    v6->target = objc_msgSend(a3, "target");
    v7->width = objc_msgSend(a3, "width");
    v7->height = objc_msgSend(a3, "height");
    v7->depth = objc_msgSend(a3, "depth");
    v7->lossyCompressedSource = objc_msgSend(a3, "lossyCompressedSource");
    v7->alphaState = objc_msgSend(a3, "hasAlpha");
    v7->textureOrigin = 0;
    v7->containsMipmaps = objc_msgSend(a3, "mipmapLevelCount") > 1;
    v7->arrayLength = objc_msgSend(a3, "arrayLength");
    v7->mimapLevelCount = objc_msgSend(a3, "mipmapLevelCount");
  }
  return v7;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  objc_super v7;

  if (-[GLKTextureInfo target](self, "target") == 3553)
  {
    v3 = CFSTR("GL_TEXTURE_2D");
  }
  else if (-[GLKTextureInfo target](self, "target") == 34067)
  {
    v3 = CFSTR("GL_TEXTURE_CUBE_MAP");
  }
  else
  {
    v3 = CFSTR("Unknown / Invalid");
  }
  if (-[GLKTextureInfo alphaState](self, "alphaState"))
  {
    if (-[GLKTextureInfo alphaState](self, "alphaState") == GLKTextureInfoAlphaStateNonPremultiplied)
    {
      v4 = CFSTR("GLKTextureInfoAlphaStateNonPremultiplied");
    }
    else if (-[GLKTextureInfo alphaState](self, "alphaState") == GLKTextureInfoAlphaStatePremultiplied)
    {
      v4 = CFSTR("GLKTextureInfoAlphaStatePremultiplied");
    }
    else
    {
      v4 = CFSTR("Unknown / Invalid");
    }
  }
  else
  {
    v4 = CFSTR("GLKTextureInfoAlphaStateNone");
  }
  if (-[GLKTextureInfo textureOrigin](self, "textureOrigin"))
  {
    if (-[GLKTextureInfo textureOrigin](self, "textureOrigin") == GLKTextureInfoOriginTopLeft)
    {
      v5 = CFSTR("GLKTextureInfoOriginTopLeft");
    }
    else if (-[GLKTextureInfo textureOrigin](self, "textureOrigin") == GLKTextureInfoOriginBottomLeft)
    {
      v5 = CFSTR("GLKTextureInfoOriginBottomLeft");
    }
    else
    {
      v5 = CFSTR("Unknown / Invaid");
    }
  }
  else
  {
    v5 = CFSTR("GLKTextureInfoOriginUnknown");
  }
  v7.receiver = self;
  v7.super_class = (Class)GLKTextureInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ \nname=%d, \ntarget=%@, \nwidth=%d, \nheight=%d, \nalphaState=%@, \ntextureOrigin=%@, \ncontainsMipmaps=%d"), -[GLKTextureInfo description](&v7, sel_description), -[GLKTextureInfo name](self, "name"), v3, -[GLKTextureInfo width](self, "width"), -[GLKTextureInfo height](self, "height"), v4, v5, -[GLKTextureInfo containsMipmaps](self, "containsMipmaps"));
}

- (BOOL)lossyCompressedSource
{
  return self->lossyCompressedSource;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GLKTextureInfo;
  -[GLKTextureInfo dealloc](&v2, sel_dealloc);
}

- (GLuint)name
{
  return self->name;
}

- (GLenum)target
{
  return self->target;
}

- (GLuint)width
{
  return self->width;
}

- (GLuint)height
{
  return self->height;
}

- (GLuint)depth
{
  return self->depth;
}

- (GLKTextureInfoAlphaState)alphaState
{
  return self->alphaState;
}

- (GLKTextureInfoOrigin)textureOrigin
{
  return self->textureOrigin;
}

- (BOOL)containsMipmaps
{
  return self->containsMipmaps;
}

- (GLuint)mimapLevelCount
{
  return self->mimapLevelCount;
}

- (GLuint)arrayLength
{
  return self->arrayLength;
}

@end
