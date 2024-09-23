@implementation CUIPSDLayerBaseRef

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerBaseRef;
  -[CUIPSDLayerBaseRef dealloc](&v3, sel_dealloc);
}

- (void)_psdLayerRecord
{
  return -[CUIPSDImageRef _psdLayerRecordAtAbsoluteIndex:](self->_imageRef, "_psdLayerRecordAtAbsoluteIndex:", self->_layerIndex);
}

- (id)_psdImageRef
{
  return self->_imageRef;
}

- (id)name
{
  return -[CUIPSDImageRef _nameAtAbsoluteIndex:](self->_imageRef, "_nameAtAbsoluteIndex:", self->_layerIndex);
}

- (BOOL)isLayerGroup
{
  return 0;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CUIPSDImageRef _boundsAtAbsoluteIndex:](self->_imageRef, "_boundsAtAbsoluteIndex:", self->_layerIndex);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)visibility
{
  return -[CUIPSDImageRef _visibilityAtAbsoluteIndex:](self->_imageRef, "_visibilityAtAbsoluteIndex:", self->_layerIndex);
}

- (double)opacity
{
  double result;

  -[CUIPSDImageRef _opacityAtAbsoluteIndex:](self->_imageRef, "_opacityAtAbsoluteIndex:", self->_layerIndex);
  return result;
}

- (double)fillOpacity
{
  double result;

  -[CUIPSDImageRef _fillOpacityAtAbsoluteIndex:](self->_imageRef, "_fillOpacityAtAbsoluteIndex:", self->_layerIndex);
  return result;
}

- (int)blendMode
{
  return -[CUIPSDImageRef _blendModeAtAbsluteIndex:](self->_imageRef, "_blendModeAtAbsluteIndex:", self->_layerIndex);
}

- (BOOL)hasLayerMask
{
  CPSDLayerMaskData *v3;

  v3 = (CPSDLayerMaskData *)((char *)-[CUIPSDLayerBaseRef _psdLayerRecord](self, "_psdLayerRecord") + 80);
  return (CPSDLayerMaskData::GetMaskCount(v3) != 1
       || !-[CUIPSDLayerBaseRef hasVectorMask](self, "hasVectorMask"))
      && CPSDLayerMaskData::GetMaskCount(v3) != 0;
}

- (BOOL)hasVectorMask
{
  char *v2;

  v2 = -[CUIPSDLayerBaseRef _psdLayerRecord](self, "_psdLayerRecord");
  if (v2)
  return (char)v2;
}

- (id)layerMaskRef
{
  if (-[CUIPSDLayerBaseRef hasLayerMask](self, "hasLayerMask"))
    return -[CUIPSDLayerMaskRef initLayerMaskWithLayerRef:]([CUIPSDLayerMaskRef alloc], "initLayerMaskWithLayerRef:", self);
  else
    return 0;
}

- (id)vectorMaskRef
{
  if (-[CUIPSDLayerBaseRef hasVectorMask](self, "hasVectorMask"))
    return -[CUIPSDLayerMaskRef initVectorMaskWithLayerRef:]([CUIPSDLayerMaskRef alloc], "initVectorMaskWithLayerRef:", self);
  else
    return 0;
}

- (CGImage)_createMaskFromAlphaChannel:(int64_t)a3
{
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  CGImage *result;
  uint64_t v11;

  v5 = -[CUIPSDImageRef psdFile](self->_imageRef, "psdFile");
  v6 = -[CUIPSDLayerBaseRef _psdLayerRecord](self, "_psdLayerRecord");
  v7 = v6[16];
  v8 = v5[77];
  if (CPSDLayerRecord::GetTransparencyMask((CPSDLayerRecord *)v6))
    v9 = v8 + a3 + 1;
  else
    v9 = v8 + a3;
  if (v9 >= v7)
    return 0;
  CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)(v5 + 124), self->_layerIndex);
  if (result)
  {
    v11 = (*(uint64_t (**)(CGImage *, int64_t))(*(_QWORD *)result + 24))(result, v9);
    return (CGImage *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
  }
  return result;
}

- (CUIPSDImageRef)imageRef
{
  return self->_imageRef;
}

- (void)setImageRef:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)layerIndex
{
  return self->_layerIndex;
}

- (void)setLayerIndex:(unsigned int)a3
{
  self->_layerIndex = a3;
}

@end
