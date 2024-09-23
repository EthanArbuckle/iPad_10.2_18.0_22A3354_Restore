@implementation MTLBufferDescriptor

- (unint64_t)pinnedGPUAddress
{
  return self->_pinnedGPUAddress;
}

- (void)setResourceOptions:(unint64_t)a3
{
  self->_resourceOptions = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

- (unint64_t)parentGPUSize
{
  return self->_parentGPUSize;
}

- (unint64_t)parentGPUAddress
{
  return self->_parentGPUAddress;
}

- (BOOL)noCopy
{
  return self->_noCopy;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)contents
{
  return self->_contents;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (unint64_t)storageMode
{
  return self->_resourceOptions >> 4;
}

- (void)dealloc
{
  id deallocator;
  objc_super v4;

  deallocator = self->_deallocator;
  if (deallocator)
    _Block_release(deallocator);

  self->_addressRanges = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLBufferDescriptor;
  -[MTLBufferDescriptor dealloc](&v4, sel_dealloc);
}

- (MTLBufferDescriptor)init
{
  MTLBufferDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBufferDescriptor;
  result = -[MTLBufferDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_noCopy = 0;
    result->_contents = 0;
    result->_deallocator = 0;
    result->_length = 0;
    *(_OWORD *)&result->_alignment = xmmword_18281A700;
    result->_iosurface = 0;
    *(_OWORD *)&result->_pinnedGPUAddress = 0u;
    *(_OWORD *)&result->_parentGPUSize = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = (_QWORD *)objc_opt_new();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLength:", self->_length);
    objc_msgSend(v5, "setNoCopy:", self->_noCopy);
    objc_msgSend(v5, "setResourceOptions:", self->_resourceOptions);
    objc_msgSend(v5, "setAlignment:", self->_alignment);
    objc_msgSend(v5, "setParentGPUAddress:", self->_parentGPUAddress);
    objc_msgSend(v5, "setParentGPUSize:", self->_parentGPUSize);
    objc_msgSend(v5, "setPinnedGPUAddress:", self->_pinnedGPUAddress);
    objc_msgSend(v5, "setPointerTag:", self->_pointerTag);
    objc_msgSend(v5, "setDeallocator:", self->_deallocator);
    objc_msgSend(v5, "setContents:", self->_contents);
    v5[11] = -[MTLResourceAddressRangeArray copy](self->_addressRanges, "copy");
    objc_msgSend(v5, "setIosurface:", self->_iosurface);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t length;
  unint64_t alignment;
  unint64_t resourceOptions;
  void *contents;
  int noCopy;
  id deallocator;
  unint64_t pinnedGPUAddress;
  unint64_t pointerTag;
  unint64_t parentGPUAddress;
  unint64_t parentGPUSize;
  _BOOL4 v21;
  MTLResourceAddressRangeArray *addressRanges;
  _BOOL4 v23;
  __IOSurface *iosurface;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a3 == self)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    v26 = v5;
    v27 = v4;
    v28 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    length = self->_length;
    if (length != objc_msgSend(a3, "length"))
      goto LABEL_17;
    alignment = self->_alignment;
    if (alignment != objc_msgSend(a3, "alignment"))
      goto LABEL_17;
    resourceOptions = self->_resourceOptions;
    if (resourceOptions != objc_msgSend(a3, "resourceOptions"))
      goto LABEL_17;
    contents = self->_contents;
    if (contents != (void *)objc_msgSend(a3, "contents"))
      goto LABEL_17;
    noCopy = self->_noCopy;
    if (noCopy == objc_msgSend(a3, "noCopy")
      && (deallocator = self->_deallocator, deallocator == (id)objc_msgSend(a3, "deallocator"))
      && (pinnedGPUAddress = self->_pinnedGPUAddress, pinnedGPUAddress == objc_msgSend(a3, "pinnedGPUAddress"))
      && (pointerTag = self->_pointerTag, pointerTag == objc_msgSend(a3, "pointerTag"))
      && (parentGPUAddress = self->_parentGPUAddress, parentGPUAddress == objc_msgSend(a3, "parentGPUAddress"))
      && (parentGPUSize = self->_parentGPUSize, parentGPUSize == objc_msgSend(a3, "parentGPUSize"))
      && (v21 = self->_addressRanges != 0, v21 != (objc_msgSend(a3, "addressRanges") == 0)))
    {
      addressRanges = self->_addressRanges;
      if (!addressRanges
        || (v23 = -[MTLResourceAddressRangeArray isEqual:](addressRanges, "isEqual:", objc_msgSend(a3, "addressRanges"))))
      {
        iosurface = self->_iosurface;
        LOBYTE(v23) = iosurface == (__IOSurface *)objc_msgSend(a3, "iosurface", v6, v26, v27, v28, v7, v8);
      }
    }
    else
    {
LABEL_17:
      LOBYTE(v23) = 0;
    }
  }
  return v23;
}

- (unint64_t)hash
{
  unsigned int v3;
  _QWORD v5[2];
  BOOL v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __IOSurface *v14;

  bzero(v5, 0x58uLL);
  v5[0] = -[MTLBufferDescriptor length](self, "length");
  v5[1] = -[MTLBufferDescriptor resourceOptions](self, "resourceOptions");
  v6 = -[MTLBufferDescriptor noCopy](self, "noCopy");
  v7 = -[MTLBufferDescriptor contents](self, "contents");
  v8 = -[MTLBufferDescriptor deallocator](self, "deallocator");
  v9 = -[MTLBufferDescriptor alignment](self, "alignment");
  v11 = -[MTLBufferDescriptor parentGPUAddress](self, "parentGPUAddress");
  v12 = -[MTLBufferDescriptor parentGPUSize](self, "parentGPUSize");
  v10 = -[MTLBufferDescriptor pinnedGPUAddress](self, "pinnedGPUAddress");
  v13 = -[MTLBufferDescriptor pointerTag](self, "pointerTag");
  v14 = -[MTLBufferDescriptor iosurface](self, "iosurface");
  v3 = _MTLHashState((int *)v5, 0x58uLL);
  return -[MTLResourceAddressRangeArray hash](self->_addressRanges, "hash") + v3;
}

- (void)setDeallocator:(id)a3
{
  id deallocator;

  deallocator = self->_deallocator;
  if (deallocator != a3)
  {
    if (deallocator)
      _Block_release(deallocator);
    self->_deallocator = _Block_copy(a3);
  }
}

- (void)setCpuCacheMode:(unint64_t)a3
{
  self->_resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFFF0 | a3;
}

- (unint64_t)cpuCacheMode
{
  return self->_resourceOptions & 0xF;
}

- (void)setHazardTrackingMode:(unint64_t)a3
{
  self->_resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFCFFLL | (a3 << 8);
}

- (unint64_t)hazardTrackingMode
{
  return (self->_resourceOptions >> 8) & 3;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_resourceOptions = self->_resourceOptions & 0xFFFFFFFFFFFFFF0FLL | (16 * a3);
}

- (void)setContents:(void *)a3
{
  self->_contents = a3;
}

- (void)setNoCopy:(BOOL)a3
{
  self->_noCopy = a3;
}

- (id)deallocator
{
  return self->_deallocator;
}

- (void)setPinnedGPUAddress:(unint64_t)a3
{
  self->_pinnedGPUAddress = a3;
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  self->_parentGPUAddress = a3;
}

- (void)setParentGPUSize:(unint64_t)a3
{
  self->_parentGPUSize = a3;
}

- (unint64_t)pointerTag
{
  return self->_pointerTag;
}

- (void)setPointerTag:(unint64_t)a3
{
  self->_pointerTag = a3;
}

- (MTLResourceAddressRangeArray)addressRanges
{
  return self->_addressRanges;
}

- (void)setAddressRanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

- (void)setIosurface:(__IOSurface *)a3
{
  self->_iosurface = a3;
}

@end
