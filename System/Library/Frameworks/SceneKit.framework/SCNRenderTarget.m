@implementation SCNRenderTarget

- (SCNRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint64_t v4;
  uint64_t v6;
  SCNRenderTarget *result;
  objc_super v9;

  v6 = v4;
  v9.receiver = self;
  v9.super_class = (Class)SCNRenderTarget;
  result = -[SCNRenderTarget init](&v9, sel_init);
  if (result)
  {
    result->_description = ($70D0A97A2D0AFAF0EE8A7EF308C233C5)*a3;
    *(_QWORD *)result->_size = v6;
    result->_arrayLength = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNRenderTarget;
  -[SCNRenderTarget dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Format: %@ ; Size: %gx%g[%d] ; Texture: <%p> ; [rc:%ld/ts:%ld]\n"),
                 C3DRenderBufferFormatToString(self->_description.format),
                 COERCE_FLOAT(*(_QWORD *)self->_size),
                 COERCE_FLOAT(HIDWORD(*(_QWORD *)self->_size)),
                 LOBYTE(self->_arrayLength),
                 self->_texture,
                 self->_referenceCount,
                 self->_timeStamp);
  if (self->_name)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ ; %@"), self->_name, result);
  return result;
}

- (BOOL)viewportDependant
{
  return (*((unsigned __int8 *)&self->_description + 3) >> 2) & 1;
}

- (unsigned)renderBufferFormat
{
  return self->_description.format;
}

- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  float32x2_t v4;
  uint32x2_t v5;
  BOOL v6;
  BOOL result;

  v5 = (uint32x2_t)vceq_f32(*(float32x2_t *)self->_size, v4);
  result = (vpmin_u32(v5, v5).u32[0] & 0x80000000) != 0
        && self->_description.format == a3->var0
        && self->_description.sampleCount == a3->var1
        && ((*((_BYTE *)a3 + 3) ^ *((_BYTE *)&self->_description + 3)) & 5) == 0
        && (((*((_BYTE *)a3 + 3) ^ *((_BYTE *)&self->_description + 3)) & 0x30) == 0
          ? (v6 = self->_description.textureUsage == a3->var2)
          : (v6 = 0),
            v6)
        && self->_arrayLength == a4;
  return result;
}

- (void)setName:(id)a3
{

  self->_name = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setTexture:(id)a3
{
  id texture;
  id v6;
  BOOL v7;

  texture = self->_texture;
  if (texture != a3)
  {

    v6 = a3;
    self->_texture = v6;
    if (self->_name)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_texture, "setLabel:", self->_name);

    self->_ciImage = 0;
  }
}

- (id)textureForSliceIndex:(unint64_t)a3
{
  NSArray *sliceTextures;
  id texture;
  unint64_t v7;
  void *v8;

  sliceTextures = self->_sliceTextures;
  if (sliceTextures)
    return -[NSArray objectAtIndexedSubscript:](sliceTextures, "objectAtIndexedSubscript:", a3);
  texture = self->_texture;
  if (objc_msgSend(texture, "textureType") == 3 || objc_msgSend(texture, "textureType") == 5)
  {
    sliceTextures = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(texture, "arrayLength"));
    if (objc_msgSend(texture, "arrayLength"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_msgSend(texture, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(texture, "pixelFormat"), 2, 0, 1, v7, 1);
        -[NSArray setObject:atIndexedSubscript:](sliceTextures, "setObject:atIndexedSubscript:", v8, v7);

        ++v7;
      }
      while (v7 < objc_msgSend(texture, "arrayLength"));
    }
    self->_sliceTextures = sliceTextures;
    if (!sliceTextures)
      -[SCNRenderTarget textureForSliceIndex:].cold.1();
    return -[NSArray objectAtIndexedSubscript:](sliceTextures, "objectAtIndexedSubscript:", a3);
  }
  return self->_texture;
}

- (id)ciImage
{
  id result;

  result = self->_ciImage;
  if (!result)
  {
    if (self->_texture)
    {
      result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithMTLTexture:options:", self->_texture, 0);
      self->_ciImage = (CIImage *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)texture
{
  return self->_texture;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (int64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->_timeStamp = a3;
}

- (void)textureForSliceIndex:.cold.1()
{
  __assert_rtn("-[SCNRenderTarget textureForSliceIndex:]", "SCNRenderTarget.m", 143, "_sliceTextures != nil");
}

@end
