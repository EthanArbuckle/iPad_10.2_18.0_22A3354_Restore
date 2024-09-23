@implementation VNContoursObservation

- (VNContoursObservation)initWithOriginatingRequestSpecifier:(id)a3 compressedPoints:(id)a4 imageSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  VNContoursObservation *v11;
  VNContoursObservation *v12;
  objc_super v14;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v11 = 0;
  if (width > 0.0 && height > 0.0)
  {
    v14.receiver = self;
    v14.super_class = (Class)VNContoursObservation;
    v12 = -[VNObservation initWithOriginatingRequestSpecifier:](&v14, sel_initWithOriginatingRequestSpecifier_, v9);
    self = v12;
    if (v12
      && (objc_storeStrong((id *)&v12->_compressedPoints, a4),
          self->_imageSize.width = width,
          self->_imageSize.height = height,
          self->_pathLock._os_unfair_lock_opaque = 0,
          -[VNContoursObservation _initializePolygonContainers](self, "_initializePolygonContainers")))
    {
      self = self;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_normalizedPath);
  v3.receiver = self;
  v3.super_class = (Class)VNContoursObservation;
  -[VNContoursObservation dealloc](&v3, sel_dealloc);
}

- (BOOL)_initializePolygonContainers
{
  EPolygonList *v3;
  __shared_weak_count *v4;
  shared_ptr<apple::vision::libraries::autotrace::EPolygonList> v5;
  shared_ptr<apple::vision::libraries::autotrace::EPolygonList> *p_polygonList;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(void *, _DWORD *);
  char v12;
  id v13;
  EPolygonList *ptr;
  int var0;
  uint64_t v16;
  float v17;
  EPolygon *var2;
  int *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  char v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  _QWORD v44[5];
  _QWORD aBlock[5];

  v3 = (EPolygonList *)operator new();
  v3->var2 = 0;
  *(_QWORD *)&v3->var3 = 0;
  *(_QWORD *)&v3->var0 = 0;
  v4 = (__shared_weak_count *)operator new();
  *(_QWORD *)v4 = &off_1E453BDF0;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = v3;
  v5.__ptr_ = v3;
  v5.__cntrl_ = v4;
  *((_QWORD *)v4 + 4) = _deleteEPolygonList;
  p_polygonList = &self->_polygonList;
  cntrl = self->_polygonList.__cntrl_;
  self->_polygonList = v5;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__VNContoursObservation__initializePolygonContainers__block_invoke;
  aBlock[3] = &unk_1E4545840;
  aBlock[4] = self;
  v11 = (uint64_t (**)(void *, _DWORD *))_Block_copy(aBlock);
  v43 = 0;
  v44[0] = v10;
  v44[1] = 3221225472;
  v44[2] = __53__VNContoursObservation__initializePolygonContainers__block_invoke_3;
  v44[3] = &unk_1E4547B88;
  v44[4] = self;
  v12 = VNExecuteBlock(v44, (uint64_t)&v43);
  v13 = v43;
  if ((v12 & 1) != 0)
  {
    ptr = p_polygonList->__ptr_;
    var0 = p_polygonList->__ptr_->var0;
    if (var0 >= 1)
    {
      v16 = 0;
      v17 = 1.0 / self->_imageSize.width;
      _S1 = 1.0 / self->_imageSize.height;
      do
      {
        var2 = ptr->var2;
        v20 = (int *)((char *)var2 + 40 * v16);
        if (*v20 >= 1)
        {
          v21 = 0;
          v22 = (_QWORD *)((char *)var2 + 40 * v16 + 8);
          do
          {
            _D2 = *(_QWORD *)(*v22 + 8 * v21);
            *(float *)&v24 = v17 * *(float *)&_D2;
            __asm { FMLS            S4, S1, V2.S[1] }
            HIDWORD(v24) = _S4;
            *(_QWORD *)(*v22 + 8 * v21++) = v24;
          }
          while (v21 < *v20);
          var0 = ptr->var0;
        }
        ++v16;
      }
      while (v16 < var0);
      ptr = p_polygonList->__ptr_;
    }
    v30 = ((uint64_t (**)(void *, EPolygonList *))v11)[2](v11, ptr);
  }
  else
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "localizedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("Failed to execute bit string to polygon list with error: %@"), v32);

    v34 = objc_retainAutorelease(v33);
    v35 = objc_msgSend(v34, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v36, v37, v38, v39, v40, v41, v35);

    v30 = 0;
  }

  return v30;
}

- (NSInteger)contourCount
{
  return self->_polygonList.__ptr_->var0;
}

- (NSInteger)topLevelContourCount
{
  return self->_topLevelContoursIndices.__end_ - self->_topLevelContoursIndices.__begin_;
}

- (NSArray)topLevelContours
{
  vector<unsigned int, std::allocator<unsigned int>> *p_topLevelContoursIndices;
  unsigned int *end;
  unsigned int *begin;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  VNContour *v10;
  void *v11;
  void *v12;
  float v13;
  id *v14;

  p_topLevelContoursIndices = &self->_topLevelContoursIndices;
  begin = self->_topLevelContoursIndices.__begin_;
  end = self->_topLevelContoursIndices.__end_;
  v6 = end - begin;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  if (end != begin)
  {
    v8 = 0;
    if (v6 <= 1)
      v9 = 1;
    else
      v9 = v6;
    do
    {
      v10 = [VNContour alloc];
      v11 = (void *)p_topLevelContoursIndices->__begin_[v8];
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndex:", v8);
      v13 = self->_imageSize.width / self->_imageSize.height;
      v14 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v10->super.isa, self, v11, v12, v13);
      objc_msgSend(v7, "addObject:", v14);

      ++v8;
    }
    while (v9 != v8);
  }
  return (NSArray *)v7;
}

- (VNContour)contourAtIndex:(NSInteger)contourIndex error:(NSError *)error
{
  EPolygonList *ptr;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  EPolygon *var2;
  int v12;
  vector<unsigned int, std::allocator<unsigned int>> *p_topLevelContoursIndices;
  unsigned int *begin;
  unsigned int *end;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  char *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  VNContour *v31;
  float v32;
  id *v33;
  void *v34;

  if (contourIndex < 0 || (ptr = self->_polygonList.__ptr_, ptr->var0 <= contourIndex))
  {
    if (error)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v34, CFSTR("contourIndex"));
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
    v33 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = contourIndex;
    var2 = ptr->var2;
    do
    {
      v12 = *((_DWORD *)var2 + 10 * v10 + 8);
      if (v12 == -1)
        p_topLevelContoursIndices = &self->_topLevelContoursIndices;
      else
        p_topLevelContoursIndices = (vector<unsigned int, std::allocator<unsigned int>> *)((char *)self->_contourChildrenIndices.__begin_
                                                                                         + 24 * v12);
      begin = p_topLevelContoursIndices->__begin_;
      end = p_topLevelContoursIndices->__end_;
      v16 = begin;
      if (begin != end)
      {
        while (*v16 != v10)
        {
          if (++v16 == end)
          {
            v16 = end;
            break;
          }
        }
      }
      v17 = v16 - begin;
      if ((unint64_t)v8 >= v9)
      {
        v18 = v8 - v7;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v9 - (_QWORD)v7) >> 2 > v19)
          v19 = (uint64_t)(v9 - (_QWORD)v7) >> 2;
        if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
          v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        else
          v21 = 0;
        v22 = (uint64_t *)(v20 + 8 * v18);
        *v22 = v17;
        v23 = v22 + 1;
        while (v8 != v7)
        {
          v24 = *--v8;
          *--v22 = v24;
        }
        v9 = v20 + 8 * v21;
        if (v7)
          operator delete(v7);
        v7 = v22;
        v8 = v23;
      }
      else
      {
        *v8++ = v17;
      }
      var2 = self->_polygonList.__ptr_->var2;
      v10 = *((unsigned int *)var2 + 10 * v10 + 8);
    }
    while ((v10 & 0x80000000) == 0);
    v25 = v8 - 1;
    if (v7 != v8 && v25 > v7)
    {
      v27 = (char *)(v7 + 1);
      do
      {
        v28 = *((_QWORD *)v27 - 1);
        *((_QWORD *)v27 - 1) = *v25;
        *v25-- = v28;
        v29 = v27 >= (char *)v25;
        v27 += 8;
      }
      while (!v29);
    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v7, v8 - v7);
    v31 = [VNContour alloc];
    v32 = self->_imageSize.width / self->_imageSize.height;
    v33 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v31->super.isa, self, (void *)contourIndex, v30, v32);

    if (v7)
      operator delete(v7);
  }
  return (VNContour *)v33;
}

- (VNContour)contourAtIndexPath:(NSIndexPath *)indexPath error:(NSError *)error
{
  NSIndexPath *v6;
  uint64_t v7;
  uint64_t v8;
  vector<unsigned int, std::allocator<unsigned int>> *p_topLevelContoursIndices;
  unint64_t v10;
  void *v11;
  VNContour *v12;
  float v13;
  id *v14;
  void *v15;

  v6 = indexPath;
  v7 = -[NSIndexPath length](v6, "length");
  if (v7)
  {
    v8 = 0;
    p_topLevelContoursIndices = &self->_topLevelContoursIndices;
    while (1)
    {
      v10 = -[NSIndexPath indexAtPosition:](v6, "indexAtPosition:", v8);
      if (v10 >= p_topLevelContoursIndices->__end_ - p_topLevelContoursIndices->__begin_)
        break;
      v11 = (void *)p_topLevelContoursIndices->__begin_[v10];
      p_topLevelContoursIndices = (vector<unsigned int, std::allocator<unsigned int>> *)((char *)self->_contourChildrenIndices.__begin_
                                                                                       + 24 * v11);
      if (v7 == ++v8)
      {
        v12 = [VNContour alloc];
        v13 = self->_imageSize.width / self->_imageSize.height;
        v14 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v12->super.isa, self, v11, v6, v13);
        goto LABEL_12;
      }
    }
    if (error)
    {
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v6, CFSTR("indexPath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  if (!error)
    goto LABEL_11;
  +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("argument indexPath cannot be empty"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v14 = 0;
  *error = (NSError *)v15;
LABEL_12:

  return (VNContour *)v14;
}

- (CGPathRef)normalizedPath
{
  os_unfair_lock_s *p_pathLock;
  const EPolygonList *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGPath *v13;
  CGPathRef v15[2];
  CGPath *v16;

  p_pathLock = &self->_pathLock;
  os_unfair_lock_lock(&self->_pathLock);
  if (!self->_normalizedPath)
  {
    v4 = -[VNContoursObservation polygonList](self, "polygonList");
    apple::vision::libraries::autotrace::ContourToPath::ContourToPath((apple::vision::libraries::autotrace::ContourToPath *)v15, v5);
    if (v4->var0 < 1)
    {
LABEL_6:
      v13 = v16;
      v16 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      while ((apple::vision::libraries::autotrace::ContourToPath::autoTrace((apple::vision::libraries::autotrace::ContourToPath *)v15, (const apple::vision::libraries::autotrace::EPolygonList *)v4, (const apple::vision::libraries::autotrace::EPolygon *)((char *)v4->var2 + v11), v6, v7, v8, v9, v10) & 1) != 0)
      {
        ++v12;
        v11 += 40;
        if (v12 >= v4->var0)
          goto LABEL_6;
      }
      v13 = 0;
    }
    apple::vision::libraries::autotrace::ContourToPath::~ContourToPath(v15);
    self->_normalizedPath = v13;
  }
  os_unfair_lock_unlock(p_pathLock);
  return self->_normalizedPath;
}

- (const)polygonList
{
  return self->_polygonList.__ptr_;
}

- (const)childContourIndicesAtIndex:(int64_t)a3
{
  return (char *)self->_contourChildrenIndices.__begin_ + 24 * a3;
}

- (BOOL)isEqual:(id)a3
{
  VNContoursObservation *v4;
  BOOL v5;
  char v6;

  v4 = (VNContoursObservation *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (self->_imageSize.width == v4->_imageSize.width
        ? (v5 = self->_imageSize.height == v4->_imageSize.height)
        : (v5 = 0),
          v5))
    {
      v6 = -[NSData isEqual:](self->_compressedPoints, "isEqual:", v4->_compressedPoints);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __shared_weak_count *cntrl;
  EPolygonList *ptr;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VNContoursObservation;
  -[VNObservation vn_cloneObject](&v14, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSData copy](self->_compressedPoints, "copy");
    v5 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v4;

    *(CGSize *)(v3 + 104) = self->_imageSize;
    ptr = self->_polygonList.__ptr_;
    cntrl = self->_polygonList.__cntrl_;
    if (cntrl)
    {
      v8 = (unint64_t *)((char *)cntrl + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = *(std::__shared_weak_count **)(v3 + 144);
    *(_QWORD *)(v3 + 136) = ptr;
    *(_QWORD *)(v3 + 144) = cntrl;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if ((VNContoursObservation *)v3 != self)
    {
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v3 + 152), (char *)self->_topLevelContoursIndices.__begin_, (uint64_t)self->_topLevelContoursIndices.__end_, self->_topLevelContoursIndices.__end_ - self->_topLevelContoursIndices.__begin_);
      std::vector<std::vector<unsigned int>>::__assign_with_size[abi:ne180100]<std::vector<unsigned int>*,std::vector<unsigned int>*>((uint64_t *)(v3 + 176), (uint64_t)self->_contourChildrenIndices.__begin_, (uint64_t)self->_contourChildrenIndices.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_contourChildrenIndices.__end_ - (char *)self->_contourChildrenIndices.__begin_) >> 3));
    }
  }
  return (id)v3;
}

- (VNContoursObservation)initWithCoder:(id)a3
{
  id v4;
  VNContoursObservation *v5;
  VNContoursObservation *v6;
  uint64_t v8;
  NSData *compressedPoints;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNContoursObservation;
  v5 = -[VNObservation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5
    || objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNCntsObs"))
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Points")),
        v8 = objc_claimAutoreleasedReturnValue(),
        compressedPoints = v5->_compressedPoints,
        v5->_compressedPoints = (NSData *)v8,
        compressedPoints,
        !v5->_compressedPoints))
  {
LABEL_3:
    v6 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v4, "vn_decodeSizeForKey:", CFSTR("Size"));
  v6 = 0;
  v5->_imageSize.width = v11;
  v5->_imageSize.height = v10;
  if (v11 > 0.0 && v10 > 0.0)
  {
    if (-[VNContoursObservation _initializePolygonContainers](v5, "_initializePolygonContainers"))
    {
      v6 = v5;
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_4:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNContoursObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNCntsObs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compressedPoints, CFSTR("Points"));
  objc_msgSend(v4, "vn_encodeSize:forKey:", CFSTR("Size"), self->_imageSize.width, self->_imageSize.height);

}

- (id)debugQuickLookObject
{
  void *v3;
  const CGPath *v4;
  CGColor *v5;
  void *v6;
  objc_super v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VNContoursObservation;
  -[VNObservation debugQuickLookObject](&v8, sel_debugQuickLookObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNContoursObservation normalizedPath](self, "normalizedPath");
    v9[0] = xmmword_1A15FAF40;
    v9[1] = unk_1A15FAF50;
    v5 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v9);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v3, v5);
  }
  else
  {
    VNDebugPathFromNormalizedCGPath((uint64_t)-[VNContoursObservation normalizedPath](self, "normalizedPath"), self->_imageSize.width, self->_imageSize.height);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  unsigned int *begin;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  vector<std::vector<unsigned int>, std::allocator<std::vector<unsigned int>>> *p_contourChildrenIndices;

  p_contourChildrenIndices = &self->_contourChildrenIndices;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_contourChildrenIndices);
  begin = self->_topLevelContoursIndices.__begin_;
  if (begin)
  {
    self->_topLevelContoursIndices.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_polygonList.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_compressedPoints, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

uint64_t __53__VNContoursObservation__initializePolygonContainers__block_invoke(uint64_t a1, int *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _DWORD *v16;
  _DWORD **v17;
  unint64_t v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  int v32;
  char *v33;
  char *v34;
  int v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v40;
  uint64_t v41;
  void **v42;

  std::vector<std::vector<unsigned int>>::vector(&v40, *a2);
  LODWORD(v9) = *a2;
  if (*a2 >= 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *(_DWORD *)(*((_QWORD *)a2 + 1) + 40 * v13 + 32);
      if (v14 == -1)
      {
        if ((unint64_t)v11 >= v12)
        {
          v27 = (v11 - v10) >> 2;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
LABEL_48:
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v12 - (_QWORD)v10) >> 1 > v28)
            v28 = (uint64_t)(v12 - (_QWORD)v10) >> 1;
          if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
            v29 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          if (v29)
            v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
          else
            v30 = 0;
          v33 = (char *)(v29 + 4 * v27);
          *(_DWORD *)v33 = v13;
          v34 = v33 + 4;
          while (v11 != v10)
          {
            v35 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v33 - 1) = v35;
            v33 -= 4;
          }
          v12 = v29 + 4 * v30;
          if (v10)
            operator delete(v10);
          v10 = v33;
          v11 = v34;
        }
        else
        {
          *(_DWORD *)v11 = v13;
          v11 += 4;
        }
      }
      else
      {
        if (v14 >= (int)v9)
        {
          VNValidatedLog(4, (uint64_t)CFSTR("parsePolygonList: index (%d) is outside of count (%d)"), v3, v4, v5, v6, v7, v8, v13);
          v37 = 0;
          goto LABEL_45;
        }
        v15 = v40 + 24 * v14;
        v17 = (_DWORD **)(v15 + 8);
        v16 = *(_DWORD **)(v15 + 8);
        v18 = *(_QWORD *)(v15 + 16);
        if ((unint64_t)v16 >= v18)
        {
          v20 = *(_DWORD **)v15;
          v21 = ((uint64_t)v16 - *(_QWORD *)v15) >> 2;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            goto LABEL_48;
          v23 = v18 - (_QWORD)v20;
          if (v23 >> 1 > v22)
            v22 = v23 >> 1;
          v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL;
          v25 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v24)
            v25 = v22;
          if (v25)
          {
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v25);
            v16 = *v17;
            v20 = *(_DWORD **)v15;
          }
          else
          {
            v26 = 0;
          }
          v31 = (_DWORD *)(v25 + 4 * v21);
          *v31 = v13;
          v19 = v31 + 1;
          while (v16 != v20)
          {
            v32 = *--v16;
            *--v31 = v32;
          }
          *(_QWORD *)v15 = v31;
          *v17 = v19;
          *(_QWORD *)(v15 + 16) = v25 + 4 * v26;
          if (v20)
            operator delete(v20);
        }
        else
        {
          *v16 = v13;
          v19 = v16 + 1;
        }
        *v17 = v19;
      }
      ++v13;
      v9 = *a2;
      if (v13 >= v9)
        goto LABEL_41;
    }
  }
  v10 = 0;
  v11 = 0;
LABEL_41:
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(*(_QWORD *)(a1 + 32) + 152), v10, (uint64_t)v11, (v11 - v10) >> 2);
  v36 = (uint64_t *)(*(_QWORD *)(a1 + 32) + 176);
  if (v36 != &v40)
    std::vector<std::vector<unsigned int>>::__assign_with_size[abi:ne180100]<std::vector<unsigned int>*,std::vector<unsigned int>*>(v36, v40, v41, 0xAAAAAAAAAAAAAAABLL * ((v41 - v40) >> 3));
  v37 = 1;
LABEL_45:
  v42 = (void **)&v40;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v42);
  if (v10)
    operator delete(v10);
  return v37;
}

uint64_t __53__VNContoursObservation__initializePolygonContainers__block_invoke_3(uint64_t a1)
{
  unsigned int *v2;
  size_t v3;
  size_t v4;
  __int128 v5;
  __int32 v6;
  __int32 v7;
  int v8;
  apple::vision::libraries::autotrace::EPolygon *v9;
  __int8 v10;
  int v11;
  unsigned int v12;
  int32x2_t v13;
  __int8 v14;
  __int32 v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int32x2_t v21;
  __int8 v22;
  int v23;
  BOOL v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  int32x2_t v28;
  __int8 v29;
  int v30;
  __int128 v31;
  BOOL v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int32x2_t v36;
  __int8 v37;
  int v38;
  __int128 v39;
  BOOL v40;
  unsigned int v41;
  int32x2_t v42;
  apple::vision::libraries::autotrace::EPolygon *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64x2_t v50;
  char *v51;
  int v52;
  unsigned __int8 *v53;
  __int32 v54;
  int v55;
  int v56;
  __int32 v57;
  unsigned int v58;
  __int8 v59;
  int32x2_t v60;
  __int8 v61;
  uint64_t v62;
  unsigned __int8 *v63;
  BOOL v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  int32x2_t v68;
  __int8 v69;
  int v70;
  __int16 v71;
  unsigned int v72;
  unsigned int v73;
  int32x2_t v74;
  __int8 v75;
  int v76;
  BOOL v77;
  uint64_t v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  int32x2_t v82;
  __int8 v83;
  int v84;
  uint64_t v85;
  BOOL v86;
  unsigned int v87;
  unsigned int v88;
  int32x2_t v89;
  __int8 v90;
  int v91;
  BOOL v92;
  __int16 v93;
  unsigned int v94;
  unsigned int v95;
  int32x2_t v96;
  __int8 v97;
  int v98;
  char *v99;
  int v100;
  __int32 v101;
  unsigned int v102;
  __int8 v103;
  int32x2_t v104;
  uint64_t v105;
  uint64_t v106;
  int32x2_t v107;
  __int8 v108;
  BOOL v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  unsigned int v113;
  int32x2_t v114;
  __int8 v115;
  int v116;
  uint64_t v117;
  unsigned int v118;
  int32x2_t v119;
  int v120;
  int v121;
  BOOL v122;
  uint64_t v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  int32x2_t v127;
  __int8 v128;
  int v129;
  __int16 v130;
  BOOL v131;
  unsigned int v132;
  unsigned int v133;
  int32x2_t v134;
  int v135;
  unsigned int v136;
  char *v137;
  __int16 v138;
  __int16 v139;
  uint64_t v140;
  unsigned int v141;
  int32x2_t v142;
  int v143;
  int v144;
  char *v145;
  __int16 *v146;
  float32x2_t v147;
  int32x2_t v148;
  char *v149;
  int64x2_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  void *exception;
  const __CFString *v162;
  apple::vision::libraries::autotrace::EPolygonList *v163;
  __int128 v164;
  float64x2_t v165;
  int32x2_t v166;
  void *__dst[2];
  __int128 v168;
  int32x2_t v169;
  _DWORD v170[32];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "bytes");
  *(_OWORD *)__dst = 0u;
  v168 = 0u;
  v169 = 0;
  v3 = *v2;
  if ((_DWORD)v3)
  {
    std::vector<unsigned char>::__append((unint64_t *)__dst, v3);
    v4 = *v2;
    if ((_DWORD)v4)
      memmove(__dst[0], v2 + 2, v4);
  }
  DWORD2(v168) = v2[1];
  v163 = *(apple::vision::libraries::autotrace::EPolygonList **)(*(_QWORD *)(a1 + 32) + 136);
  if (!apple::vision::libraries::autotrace::EPolygonList::init(v163))
    goto LABEL_174;
  v169 = 0;
  HIDWORD(v168) = 0;
  v6 = DWORD2(v168);
  if (SDWORD2(v168) >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v162 = CFSTR("%s: could not allocate new polygon (nPoints %d)");
    v164 = v5;
    v165 = (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL);
    do
    {
      if (v7 == v6)
        goto LABEL_174;
      v10 = v169.i8[0];
      v11 = HIDWORD(v168);
      v12 = *((unsigned __int8 *)__dst[0] + SHIDWORD(v168));
      v13 = vadd_s32(v169, (int32x2_t)0x100000001);
      v169 = v13;
      v14 = v13.i8[0];
      if (v13.i32[0] == 8)
      {
        v14 = 0;
        v11 = ++HIDWORD(v168);
        v169.i32[0] = 0;
      }
      v15 = v13.i32[1];
      if (((v12 >> v10) & 1) != 0)
      {
        if (v9)
        {
          if (v13.i32[1] == v6)
            goto LABEL_174;
          v16 = *((unsigned __int8 *)__dst[0] + v11);
          v169 = vadd_s32(v169, (int32x2_t)0x100000001);
          if (v169.i32[0] == 8)
          {
            HIDWORD(v168) = v11 + 1;
            v169.i32[0] = 0;
          }
          if (((v16 >> v14) & 1) != 0)
            --v8;
          else
            v170[v8++] = -858993459 * (((unint64_t)v9 - *((_QWORD *)v163 + 1)) >> 3);
        }
      }
      else
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (v15 != v6)
        {
          v20 = *((unsigned __int8 *)__dst[0] + v11);
          v21 = vadd_s32(v169, (int32x2_t)0x100000001);
          v169 = v21;
          v22 = v21.i8[0];
          if (v21.i32[0] == 8)
          {
            v22 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          v23 = (v20 >> v14) & 1;
          v15 = v21.i32[1];
          v18 = v23 | (2 * v18);
          v17 = v19 > 0x1E;
          v14 = v22;
          if (++v19 == 32)
            goto LABEL_25;
        }
        if (!v17)
          goto LABEL_174;
        v18 = 0;
        v22 = v14;
        v15 = v6;
LABEL_25:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        while (v15 != v6)
        {
          v27 = *((unsigned __int8 *)__dst[0] + v11);
          v28 = vadd_s32(v169, (int32x2_t)0x100000001);
          v169 = v28;
          v29 = v28.i8[0];
          if (v28.i32[0] == 8)
          {
            v29 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          v30 = (v27 >> v22) & 1;
          v15 = v28.i32[1];
          v25 = v30 | (2 * v25);
          v24 = v26 > 0x1E;
          v22 = v29;
          if (++v26 == 32)
          {
            v31 = v164;
            LODWORD(v31) = v25;
            v164 = v31;
            v22 = v29;
            goto LABEL_32;
          }
        }
        v15 = v6;
        if (!v24)
          goto LABEL_174;
LABEL_32:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        while (v15 != v6)
        {
          v35 = *((unsigned __int8 *)__dst[0] + v11);
          v36 = vadd_s32(v169, (int32x2_t)0x100000001);
          v169 = v36;
          v37 = v36.i8[0];
          if (v36.i32[0] == 8)
          {
            v37 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          v38 = (v35 >> v22) & 1;
          v15 = v36.i32[1];
          v33 = v38 | (2 * v33);
          v32 = v34 > 0x1E;
          v22 = v37;
          if (++v34 == 32)
          {
            v39 = v164;
            DWORD1(v39) = v33;
            v164 = v39;
            goto LABEL_39;
          }
        }
        v15 = v6;
        if (!v32)
          goto LABEL_174;
LABEL_39:
        v40 = 0;
        v41 = 0;
        while (v15 != v6)
        {
          v42 = vadd_s32(v169, (int32x2_t)0x100000001);
          v169 = v42;
          if (v42.i32[0] == 8)
          {
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          v15 = v42.i32[1];
          v40 = v41++ > 2;
          if (v41 == 4)
            goto LABEL_46;
        }
        if (!v40)
          goto LABEL_174;
LABEL_46:
        v43 = (apple::vision::libraries::autotrace::EPolygon *)apple::vision::libraries::autotrace::EPolygonList::newPolygon(v163, v18, 0);
        v9 = v43;
        if (!v43)
          goto LABEL_176;
        v50.i64[0] = v164;
        v50.i64[1] = DWORD1(v164);
        *(float32x2_t *)apple::vision::libraries::autotrace::EPolygon::addPointAtEnd(v43) = vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v50), v165));
        v51 = (char *)malloc_type_malloc(4 * (v18 - 1), 0x100004052888210uLL);
        if (!v51)
        {
          v162 = CFSTR("%s: could not allocate deltas array for polygon (nPoints %d)");
LABEL_176:
          VNValidatedLog(4, (uint64_t)v162, v44, v45, v46, v47, v48, v49, (uint64_t)"polygonListWithBitString");
          goto LABEL_174;
        }
        v52 = v18 - 1;
        if (v18 > 1)
        {
          v53 = (unsigned __int8 *)__dst[0];
          v54 = DWORD2(v168);
          v55 = HIDWORD(v168);
          v56 = 1;
          v57 = v169.i32[1];
          while (1)
          {
            if (v57 == v54)
              goto LABEL_173;
            v58 = v53[v55];
            v59 = v169.i8[0];
            v60 = vadd_s32(v169, (int32x2_t)0x100000001);
            v169 = v60;
            v61 = v60.i8[0];
            if (v60.i32[0] == 8)
            {
              v61 = 0;
              HIDWORD(v168) = ++v55;
              v169.i32[0] = 0;
            }
            v62 = v56 - 1;
            v57 = v60.i32[1];
            v63 = (unsigned __int8 *)__dst[0];
            v64 = 0;
            if (((v58 >> v59) & 1) == 0)
            {
              v71 = 0;
              v72 = 0;
              while (v57 != v54)
              {
                v73 = *((unsigned __int8 *)__dst[0] + v55);
                v74 = vadd_s32(v169, (int32x2_t)0x100000001);
                v169 = v74;
                v75 = v74.i8[0];
                if (v74.i32[0] == 8)
                {
                  v75 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                v76 = (v73 >> v61) & 1;
                v57 = v74.i32[1];
                v71 = v76 | (2 * v71);
                v64 = v72 > 8;
                v61 = v75;
                if (++v72 == 10)
                  goto LABEL_87;
              }
              if (v64)
              {
                v71 = 0;
                v75 = v61;
                v57 = v54;
LABEL_87:
                v92 = 0;
                v93 = 0;
                v94 = 0;
                while (v57 != v54)
                {
                  v95 = *((unsigned __int8 *)__dst[0] + v55);
                  v96 = vadd_s32(v169, (int32x2_t)0x100000001);
                  v169 = v96;
                  v97 = v96.i8[0];
                  if (v96.i32[0] == 8)
                  {
                    v97 = 0;
                    HIDWORD(v168) = ++v55;
                    v169.i32[0] = 0;
                  }
                  v98 = (v95 >> v75) & 1;
                  v57 = v96.i32[1];
                  v93 = v98 | (2 * v93);
                  v92 = v94 > 8;
                  v75 = v97;
                  if (++v94 == 10)
                    goto LABEL_94;
                }
                v57 = v54;
                v93 = v71;
                if (v92)
                {
LABEL_94:
                  v99 = &v51[4 * v62];
                  *(_WORD *)v99 = v71 - 512;
                  *((_WORD *)v99 + 1) = v93 - 512;
                  goto LABEL_159;
                }
              }
              goto LABEL_173;
            }
            LODWORD(v65) = 0;
            v66 = 0;
            while (v57 != v54)
            {
              v67 = *((unsigned __int8 *)__dst[0] + v55);
              v68 = vadd_s32(v169, (int32x2_t)0x100000001);
              v169 = v68;
              v69 = v68.i8[0];
              if (v68.i32[0] == 8)
              {
                v69 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              v70 = (v67 >> v61) & 1;
              v57 = v68.i32[1];
              v65 = v70 | (2 * v65);
              v64 = v66 != 0;
              v61 = v69;
              if (++v66 == 2)
                goto LABEL_68;
            }
            if (!v64)
              goto LABEL_173;
            v65 = 0;
            v57 = v54;
            v69 = v61;
LABEL_68:
            v77 = 0;
            LODWORD(v78) = 0;
            v79 = 0;
            v80 = (v65 & 1) != 0 ? 256 : -256;
            while (v57 != v54)
            {
              v81 = *((unsigned __int8 *)__dst[0] + v55);
              v82 = vadd_s32(v169, (int32x2_t)0x100000001);
              v169 = v82;
              v83 = v82.i8[0];
              if (v82.i32[0] == 8)
              {
                v83 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              v84 = (v81 >> v69) & 1;
              v57 = v82.i32[1];
              v78 = v84 | (2 * v78);
              v77 = v79 > 2;
              v69 = v83;
              if (++v79 == 4)
                goto LABEL_77;
            }
            v57 = v54;
            v83 = v69;
            v78 = v65;
            if (!v77)
              goto LABEL_173;
LABEL_77:
            if (v78 >= 0xF)
            {
              v86 = 0;
              LODWORD(v85) = 0;
              v87 = 0;
              while (v57 != v54)
              {
                v88 = *((unsigned __int8 *)__dst[0] + v55);
                v89 = vadd_s32(v169, (int32x2_t)0x100000001);
                v169 = v89;
                v90 = v89.i8[0];
                if (v89.i32[0] == 8)
                {
                  v90 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                v91 = (v88 >> v83) & 1;
                v57 = v89.i32[1];
                v85 = v91 | (2 * v85);
                v86 = v87 > 0x1E;
                v83 = v90;
                if (++v87 == 32)
                  goto LABEL_96;
              }
              v57 = v54;
              v85 = v78;
              if (!v86)
                goto LABEL_173;
LABEL_96:
              v78 = v85;
              if ((int)v85 < 1)
              {
                v56 = v62;
                goto LABEL_159;
              }
            }
            else
            {
              LODWORD(v85) = v78 + 1;
            }
            v100 = 0;
            v101 = DWORD2(v168);
            do
            {
              if (v57 == v54)
                goto LABEL_173;
              v102 = v63[v55];
              v103 = v169.i8[0];
              v104 = vadd_s32(v169, (int32x2_t)0x100000001);
              v169 = v104;
              v105 = v104.u32[0];
              if (v104.i32[0] == 8)
              {
                v105 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              v57 = v104.i32[1];
              if (((v102 >> v103) & 1) == 0)
              {
                v49 = 0;
                LODWORD(v117) = 0;
                v110 = 0;
                while (v57 != v101)
                {
                  v118 = *((unsigned __int8 *)__dst[0] + v55);
                  v119 = vadd_s32(v169, (int32x2_t)0x100000001);
                  v169 = v119;
                  v112 = v119.u32[0];
                  if (v119.i32[0] == 8)
                  {
                    v112 = 0;
                    HIDWORD(v168) = ++v55;
                    v169.i32[0] = 0;
                  }
                  v120 = (v118 >> v105) & 1;
                  v57 = v119.i32[1];
                  v117 = v120 | (2 * v117);
                  v121 = v110 + 1;
                  v49 = v110 > 3;
                  v105 = v112;
                  v110 = (v110 + 1);
                  if (v121 == 5)
                    goto LABEL_144;
                }
                v112 = v105;
                v57 = v101;
                v117 = v78;
                if ((v49 & 1) != 0)
                {
LABEL_144:
                  if (v117 < 0x1F)
                  {
                    v106 = (v117 - 15);
                    goto LABEL_154;
                  }
                  v110 = 0;
                  LODWORD(v140) = 0;
                  v105 = 0;
                  while (v57 != v101)
                  {
                    v141 = *((unsigned __int8 *)__dst[0] + v55);
                    v142 = vadd_s32(v169, (int32x2_t)0x100000001);
                    v169 = v142;
                    v49 = v142.u32[0];
                    if (v142.i32[0] == 8)
                    {
                      v49 = 0;
                      HIDWORD(v168) = ++v55;
                      v169.i32[0] = 0;
                    }
                    v143 = (v141 >> v112) & 1;
                    v57 = v142.i32[1];
                    v140 = v143 | (2 * v140);
                    v144 = v105 + 1;
                    v110 = v105 > 8;
                    v112 = v49;
                    v105 = (v105 + 1);
                    if (v144 == 10)
                      goto LABEL_153;
                  }
                  v57 = v101;
                  v140 = v117;
                  if ((v110 & 1) != 0)
                  {
LABEL_153:
                    v106 = (v140 - 512);
                    v117 = v140;
LABEL_154:
                    if ((int)v62 < v18)
                    {
                      v56 = v62 + 1;
                      v145 = &v51[4 * (int)v62];
                      if (v65 > 1)
                      {
                        *(_WORD *)v145 = v106;
                        *((_WORD *)v145 + 1) = v80;
                      }
                      else
                      {
                        *(_WORD *)v145 = v80;
                        *((_WORD *)v145 + 1) = v106;
                      }
                      goto LABEL_158;
                    }
LABEL_172:
                    VNValidatedLog(4, (uint64_t)CFSTR("%s: max index exceeded in run"), v105, v117, v106, v112, v110, v49, (uint64_t)"decodeRun");
                  }
                }
LABEL_173:
                free(v51);
LABEL_174:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x1A1B0A5BC](exception, "polygonListWithBitString failed");
                __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
              }
              if (v104.i32[1] == v101)
                goto LABEL_173;
              v106 = v63[v55];
              v107 = vadd_s32(v169, (int32x2_t)0x100000001);
              v169 = v107;
              v108 = v107.i8[0];
              if (v107.i32[0] == 8)
              {
                v108 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              v109 = 0;
              LODWORD(v110) = 0;
              v111 = 0;
              v57 = v107.i32[1];
              v112 = (uint64_t)__dst[0];
              while (v57 != v101)
              {
                v113 = *((unsigned __int8 *)__dst[0] + v55);
                v114 = vadd_s32(v169, (int32x2_t)0x100000001);
                v169 = v114;
                v115 = v114.i8[0];
                if (v114.i32[0] == 8)
                {
                  v115 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                v116 = (v113 >> v108) & 1;
                v57 = v114.i32[1];
                v110 = v116 | (2 * v110);
                v109 = v111 > 8;
                v108 = v115;
                v49 = ++v111;
                if (v111 == 10)
                  goto LABEL_118;
              }
              v115 = v108;
              v57 = v101;
              v110 = v78;
              if (!v109)
                goto LABEL_173;
LABEL_118:
              v122 = 0;
              LODWORD(v123) = 0;
              v124 = 0;
              v125 = v110 - 512;
              do
              {
                if (v57 == v101)
                {
                  v130 = v110 - 512;
                  v57 = v101;
                  if (v122)
                    goto LABEL_125;
                  goto LABEL_173;
                }
                v126 = *((unsigned __int8 *)__dst[0] + v55);
                v127 = vadd_s32(v169, (int32x2_t)0x100000001);
                v169 = v127;
                v128 = v127.i8[0];
                if (v127.i32[0] == 8)
                {
                  v128 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                v129 = (v126 >> v115) & 1;
                v57 = v127.i32[1];
                v123 = v129 | (2 * v123);
                v122 = v124 > 8;
                v115 = v128;
                v49 = ++v124;
              }
              while (v124 != 10);
              v130 = v123 - 512;
              v115 = v128;
              v110 = v123;
LABEL_125:
              v131 = 0;
              LODWORD(v117) = 0;
              v132 = 0;
              while (v57 != v101)
              {
                v133 = *((unsigned __int8 *)__dst[0] + v55);
                v134 = vadd_s32(v169, (int32x2_t)0x100000001);
                v169 = v134;
                v49 = v134.u32[0];
                if (v134.i32[0] == 8)
                {
                  v49 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                v135 = (v133 >> v115) & 1;
                v57 = v134.i32[1];
                v117 = v135 | (2 * v117);
                v131 = v132 > 8;
                v115 = v49;
                if (++v132 == 10)
                  goto LABEL_132;
              }
              v57 = v101;
              v117 = v110;
              if (!v131)
                goto LABEL_173;
LABEL_132:
              if ((int)v62 >= v18)
                goto LABEL_172;
              v136 = (v80 << ((v106 >> v105) & 1)) - v125;
              v137 = &v51[4 * (int)v62];
              if (v65 >= 2)
                v138 = v130;
              else
                v138 = v125;
              if (v65 >= 2)
              {
                v49 = (v117 - 512);
              }
              else
              {
                LOWORD(v125) = v130;
                v49 = v136;
              }
              *(_WORD *)v137 = v138;
              *((_WORD *)v137 + 1) = v125;
              if (v65 >= 2)
                v139 = v136;
              else
                v139 = v117 - 512;
              *((_WORD *)v137 + 2) = v49;
              *((_WORD *)v137 + 3) = v139;
              v56 = v62 + 2;
              ++v100;
LABEL_158:
              ++v100;
              v78 = v117;
              LODWORD(v62) = v56;
            }
            while (v100 < (int)v85);
LABEL_159:
            if (++v56 >= v18)
            {
              v146 = (__int16 *)v51;
              v147 = (float32x2_t)v164;
              v148 = (int32x2_t)v164;
              do
              {
                v147.i16[0] = *v146;
                v147.i16[2] = v146[1];
                v166 = (int32x2_t)v147;
                v149 = apple::vision::libraries::autotrace::EPolygon::addPointAtEnd(v9);
                v148 = vsra_n_s32(v148, vshl_n_s32(v166, 0x10uLL), 0x10uLL);
                v150.i64[0] = v148.i32[0];
                v150.i64[1] = v148.i32[1];
                v147 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_s64(v150), v165));
                *(float32x2_t *)v149 = v147;
                v146 += 2;
                --v52;
              }
              while (v52);
              break;
            }
          }
        }
        free(v51);
        *((_BYTE *)v9 + 20) = 1;
        if (v8 >= 1)
        {
          v157 = v170[v8 - 1];
          v158 = *((_QWORD *)v163 + 1);
          v159 = v158 + 40 * v157;
          *((_DWORD *)v9 + 6) = *(_DWORD *)(v159 + 28);
          *(_DWORD *)(v159 + 28) = -858993459 * (((unint64_t)v9 - v158) >> 3);
          *((_DWORD *)v9 + 8) = v157;
          if (v157 < 0 || v157 >= *(_DWORD *)v163)
            VNValidatedLog(4, (uint64_t)CFSTR("%s: parent index out of whack"), v151, v152, v153, v154, v155, v156, (uint64_t)"polygonListWithBitString");
        }
      }
      v7 = v169.i32[1];
      v6 = DWORD2(v168);
    }
    while (v169.i32[1] < SDWORD2(v168));
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  const CGPath *v4;
  const void *v5;
  _OWORD v7[3];

  memset(v7, 0, sizeof(v7));
  v4 = -[VNContoursObservation normalizedPath](self, "normalizedPath", VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)v7));
  v5 = (const void *)MEMORY[0x1A1B09D7C](v4, v7);
  CFAutorelease(v5);
  return (CGPath *)v5;
}

@end
