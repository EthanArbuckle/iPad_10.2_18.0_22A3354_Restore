@implementation SKTextureCache

- (SKTextureCache)init
{
  SKTextureCache *v2;
  SKTextureCache *v3;
  CGSize v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKTextureCache;
  v2 = -[SKTextureCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (CGSize)*MEMORY[0x1E0C9D820];
    v2->size = (CGSize)*MEMORY[0x1E0C9D820];
    v2->pixelSize = v4;
    *(_WORD *)&v2->hasAlpha = 1;
    v2->pixelData = 0;
    v2->state = 0;
    pthread_mutex_init(&v2->lock, 0);
    v3->filteringMode = 1;
    *(_QWORD *)&v3->_textureFormat = 3;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SKTextureCache _reset](self, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)SKTextureCache;
  -[SKTextureCache dealloc](&v3, sel_dealloc);
}

- (void)_reset
{
  shared_ptr<jet_texture> *p_backingTexture;
  jet_texture *ptr;
  char *pixelData;
  CGSize v6;

  ptr = self->_backingTexture.__ptr_;
  p_backingTexture = &self->_backingTexture;
  if (ptr)
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](p_backingTexture);
  pixelData = self->pixelData;
  if (pixelData)
  {
    free(pixelData);
    self->pixelData = 0;
  }
  self->state = 0;
  v6 = (CGSize)*MEMORY[0x1E0C9D820];
  self->size = (CGSize)*MEMORY[0x1E0C9D820];
  self->pixelSize = v6;
  *(_WORD *)&self->hasAlpha = 1;
  pthread_mutex_init(&self->lock, 0);
  self->filteringMode = 1;
  *(_QWORD *)&self->_textureFormat = 3;
}

- (_opaque_pthread_mutex_t)getLock
{
  return &self->lock;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->size.width;
  height = self->size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (BOOL)isPOT
{
  return self->isPOT;
}

- (void)setIsPOT:(BOOL)a3
{
  self->isPOT = a3;
}

- (BOOL)hasAlpha
{
  return self->hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->hasAlpha = a3;
}

- (char)pixelData
{
  return self->pixelData;
}

- (void)setPixelData:(char *)a3
{
  self->pixelData = a3;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->pixelSize.width;
  height = self->pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  self->pixelSize = a3;
}

- (int)state
{
  return self->state;
}

- (void)setState:(int)a3
{
  self->state = a3;
}

- (int64_t)filteringMode
{
  return self->filteringMode;
}

- (void)setFilteringMode:(int64_t)a3
{
  self->filteringMode = a3;
}

- (int)wrapMode
{
  return self->wrapMode;
}

- (void)setWrapMode:(int)a3
{
  self->wrapMode = a3;
}

- (unsigned)textureFormat
{
  return self->_textureFormat;
}

- (void)setTextureFormat:(unsigned int)a3
{
  self->_textureFormat = a3;
}

- (shared_ptr<jet_texture>)backingTexture
{
  jet_texture **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<jet_texture> result;

  cntrl = self->_backingTexture.__cntrl_;
  *v2 = self->_backingTexture.__ptr_;
  v2[1] = (jet_texture *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_texture *)self;
  return result;
}

- (void)setBackingTexture:(shared_ptr<jet_texture>)a3
{
  std::shared_ptr<jet_texture>::operator=[abi:ne180100](&self->_backingTexture.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_backingTexture);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  return self;
}

@end
