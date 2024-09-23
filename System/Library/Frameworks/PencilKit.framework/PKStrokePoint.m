@implementation PKStrokePoint

- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude
{
  return -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:secondaryScale:](self, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:secondaryScale:", location.x, location.y, timeOffset, size.width, size.height, opacity, force, azimuth, *(_QWORD *)&altitude, 0x3FF0000000000000);
}

- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude secondaryScale:(CGFloat)secondaryScale
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  char *v18;
  PKStrokePathPointsPrivate *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  PKStrokePathPointsShared *ptr;
  float v29;
  float v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  PKStrokePathPointsShared *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  PKStrokePathPointsShared *v39;
  float v40;
  __int128 v42;
  objc_super v43;
  CGPoint v44;

  height = size.height;
  width = size.width;
  y = location.y;
  x = location.x;
  v43.receiver = self;
  v43.super_class = (Class)PKStrokePoint;
  v18 = -[PKStrokePoint init](&v43, sel_init);
  +[PKStrokePoint _sharedConstantData](PKStrokePoint, "_sharedConstantData");
  v19 = (PKStrokePathPointsPrivate *)(v18 + 8);
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)(v18 + 8), &v42);
  v20 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
  if (*((_QWORD *)&v42 + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *((_QWORD *)v18 + 3);
  v24 = *((_QWORD *)v18 + 4) - v23;
  if (v24 > 0x1F)
  {
    if (v24 != 32)
      *((_QWORD *)v18 + 4) = v23 + 32;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)v18 + 3, 32 - v24);
  }
  v44.x = x;
  v44.y = y;
  PKStrokePathPointsPrivate::setLocation(v19, v44, 0);
  v25 = *((_QWORD *)v18 + 3);
  v26 = *((_QWORD *)v18 + 4);
  v27 = v26 - v25;
  if (v26 != v25)
  {
    ptr = v19->constants.__ptr_;
    if (*((_QWORD *)v19->constants.__ptr_ + 6) <= v27)
    {
      if ((*((_BYTE *)ptr + 32) & 2) != 0)
      {
        v29 = timeOffset;
        *(float *)(v25 + *((unsigned __int8 *)ptr + 89)) = v29;
      }
      if ((*((_BYTE *)ptr + 32) & 4) != 0)
      {
        v30 = width;
        *(float *)(v25 + *((unsigned __int8 *)ptr + 90)) = v30;
      }
    }
  }
  v31 = height / width;
  if (width <= 0.0)
    v31 = 1.0;
  PKStrokePathPointsPrivate::setAspectRatio(v19, v31, 0);
  v32 = *((_QWORD *)v18 + 3);
  v33 = *((_QWORD *)v18 + 4);
  v34 = v33 - v32;
  if (v33 != v32)
  {
    v35 = v19->constants.__ptr_;
    if (*((_QWORD *)v19->constants.__ptr_ + 6) <= v34 && (*((_BYTE *)v35 + 32) & 0x10) != 0)
      *(_WORD *)(v32 + *((unsigned __int8 *)v35 + 92)) = 0;
  }
  PKStrokePathPointsPrivate::setForce(v19, force, 0);
  PKStrokePathPointsPrivate::setAzimuth(v19, azimuth + -3.14159265, 0);
  PKStrokePathPointsPrivate::setAltitude(v19, 1.57079633 - altitude, 0);
  PKStrokePathPointsPrivate::setOpacity(v19, opacity, 0);
  v36 = *((_QWORD *)v18 + 3);
  v37 = *((_QWORD *)v18 + 4);
  v38 = v37 - v36;
  if (v37 != v36)
  {
    v39 = v19->constants.__ptr_;
    if (*((_QWORD *)v19->constants.__ptr_ + 6) <= v38 && (*((_BYTE *)v39 + 33) & 2) != 0)
    {
      v40 = width * secondaryScale;
      *(float *)(v36 + *((unsigned __int8 *)v39 + 97)) = v40;
    }
  }
  return (PKStrokePoint *)v18;
}

- (PKStrokePoint)initWithLocation:(CGPoint)a3 timeOffset:(double)a4 size:(CGSize)a5 opacity:(double)a6 force:(double)a7 azimuth:(double)a8 altitude:(double)a9 edgeWidth:(double)a10 radius2:(double)a11
{
  PKStrokePoint *v11;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  char *begin;
  char *end;
  unint64_t v15;
  PKStrokePathPointsShared *ptr;
  float v17;

  v11 = -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:](self, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", a3.x, a3.y, a4, a5.width, a5.height, a6, a7, a8, *(_QWORD *)&a9);
  p_strokeDataPointsPrivate = &v11->_strokeDataPointsPrivate;
  begin = v11->_strokeDataPointsPrivate.pointsData.__begin_;
  end = v11->_strokeDataPointsPrivate.pointsData.__end_;
  v15 = end - begin;
  if (end != begin)
  {
    ptr = p_strokeDataPointsPrivate->constants.__ptr_;
    if (*((_QWORD *)p_strokeDataPointsPrivate->constants.__ptr_ + 6) <= v15 && (*((_BYTE *)ptr + 33) & 2) != 0)
    {
      v17 = a11;
      *(float *)&begin[*((unsigned __int8 *)ptr + 97)] = v17;
    }
  }
  PKStrokePathPointsPrivate::setEdgeWidth(p_strokeDataPointsPrivate, a10, 0);
  return v11;
}

- (PKStrokePoint)initWithSlice:(void *)a3 index:(int64_t)a4
{
  PKStrokePoint *v6;
  objc_super v8;
  _NSRange v9;

  v8.receiver = self;
  v8.super_class = (Class)PKStrokePoint;
  v6 = -[PKStrokePoint init](&v8, sel_init);
  v9.location = a4;
  v9.length = 1;
  PKStrokePathPointsPrivate::slice((PKStrokePathPointsPrivate *)a3, v9, &v6->_strokeDataPointsPrivate);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKStrokePoint *v4;
  PKStrokePoint *v5;
  uint64_t v6;
  PKStrokePathPointsShared *ptr;
  PKStrokePathPointsShared *v8;
  char *begin;
  char *v10;
  char *v11;
  const void *v12;
  const void *v13;
  size_t v14;
  BOOL v15;

  v4 = (PKStrokePoint *)a3;
  v5 = v4;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_11;
    v6 = objc_opt_class();
    if (v6 != objc_opt_class())
      goto LABEL_11;
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    v8 = v5->_strokeDataPointsPrivate.constants.__ptr_;
    if (*(double *)ptr != *(double *)v8)
      goto LABEL_11;
    if (*((_QWORD *)ptr + 4) == *((_QWORD *)v8 + 4)
      && *((_QWORD *)ptr + 5) == *((_QWORD *)v8 + 5)
      && (begin = self->_strokeDataPointsPrivate.pointsData.__begin_,
          v10 = v5->_strokeDataPointsPrivate.pointsData.__begin_,
          v11 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin),
          v11 == (char *)(v5->_strokeDataPointsPrivate.pointsData.__end_ - v10))
      && !memcmp(begin, v10, (size_t)v11)
      && (v12 = (const void *)*((_QWORD *)ptr + 1),
          v13 = (const void *)*((_QWORD *)v8 + 1),
          v14 = *((_QWORD *)ptr + 2) - (_QWORD)v12,
          v14 == *((_QWORD *)v8 + 2) - (_QWORD)v13))
    {
      v15 = memcmp(v12, v13, v14) == 0;
    }
    else
    {
LABEL_11:
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  PKStrokePathPointsShared *ptr;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *begin;
  char *end;
  uint64_t v10;
  uint64_t v11;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v5 = PKHashBytes((uint64_t)ptr, 8) ^ v3;
  v6 = v5 ^ PKHashBytes((uint64_t)ptr + 32, 8);
  v7 = v6 ^ PKHashBytes((uint64_t)ptr + 40, 8);
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  end = self->_strokeDataPointsPrivate.pointsData.__end_;
  if (end != begin)
    v7 ^= PKHashBytes((uint64_t)begin, (int)end - (int)begin);
  v10 = *((_QWORD *)ptr + 1);
  v11 = *((_QWORD *)ptr + 2);
  if (v11 != v10)
    v7 ^= PKHashBytes(v10, (int)v11 - (int)v10);
  return v7;
}

+ (shared_ptr<PKStrokePathPointsShared>)_sharedConstantData
{
  _QWORD *v2;
  _QWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  shared_ptr<PKStrokePathPointsShared> result;

  v3 = v2;
  v4 = atomic_load((unsigned __int8 *)&qword_1ECEE6168);
  if ((v4 & 1) == 0)
  {
    a1 = (id)__cxa_guard_acquire(&qword_1ECEE6168);
    if ((_DWORD)a1)
    {
      __cxa_atexit((void (*)(void *))std::shared_ptr<PKStrokePathPointsShared>::~shared_ptr[abi:ne180100], &qword_1ECEE6170, &dword_1BE213000);
      __cxa_guard_release(&qword_1ECEE6168);
    }
  }
  if (_MergedGlobals_120 != -1)
    dispatch_once(&_MergedGlobals_120, &__block_literal_global_23);
  v5 = *(_QWORD *)algn_1ECEE6178;
  *v3 = qword_1ECEE6170;
  v3[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKStrokePathPointsShared *)a1;
  return result;
}

PKStrokePathPointsShared *__36__PKStrokePoint__sharedConstantData__block_invoke()
{
  _OWORD *v0;
  std::__shared_weak_count *v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  __int128 v6;

  v0 = (_OWORD *)operator new();
  *v0 = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[6] = 0u;
  std::shared_ptr<PKStrokePathPointsShared>::shared_ptr[abi:ne180100]<PKStrokePathPointsShared,void>(&v6, (uint64_t)v0);
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)&qword_1ECEE6170, &v6);
  v1 = (std::__shared_weak_count *)*((_QWORD *)&v6 + 1);
  if (*((_QWORD *)&v6 + 1))
  {
    v2 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  v4 = qword_1ECEE6170;
  *(_QWORD *)qword_1ECEE6170 = 0;
  *(_OWORD *)(v4 + 32) = xmmword_1BE4FC580;
  *(_QWORD *)(v4 + 48) = 32;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  +[PKStrokePath calculateOffsets](PKStrokePath, "calculateOffsets");
  return PKStrokePathPointsShared::computeCachedValues((PKStrokePathPointsShared *)qword_1ECEE6170);
}

- (PKCompressedStrokePoint)_compressedPoint
{
  return (PKCompressedStrokePoint *)PKStrokePathPointsPrivate::operator[](&self->_strokeDataPointsPrivate.constants.__ptr_, 0, retstr);
}

- (void)_strokeDataPointsPrivate
{
  return &self->_strokeDataPointsPrivate;
}

- (CGPoint)location
{
  double v2;
  double v3;
  CGPoint result;

  v2 = PKStrokePathPointsPrivate::locationAtIndex(&self->_strokeDataPointsPrivate, 0);
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSTimeInterval)timeOffset
{
  char *begin;
  PKStrokePathPointsShared *ptr;
  char *v4;
  float *v5;

  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((_QWORD *)ptr + 6) <= (unint64_t)v4 && (*((_BYTE *)ptr + 32) & 2) != 0)
    v5 = (float *)&begin[*((unsigned __int8 *)ptr + 89)];
  else
    v5 = (float *)((char *)ptr + 64);
  return *v5;
}

- (CGSize)size
{
  double v2;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  PKStrokePathPointsShared *v4;
  PKStrokePathPointsShared *ptr;
  char *begin;
  char *v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  v4 = ptr;
  begin = p_strokeDataPointsPrivate->pointsData.__begin_;
  v7 = (char *)(p_strokeDataPointsPrivate->pointsData.__end_ - begin);
  if (v7 && *((_QWORD *)v4 + 6) <= (unint64_t)v7 && (*((_BYTE *)v4 + 32) & 4) != 0)
    v8 = &begin[*((unsigned __int8 *)v4 + 90)];
  else
    v8 = (char *)v4 + 68;
  LODWORD(v2) = *(_DWORD *)v8;
  v9 = *(float *)v8;
  v10 = PKStrokePathPointsPrivate::aspectRatioAtIndex(p_strokeDataPointsPrivate, 0, v2) * v9;
  v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGFloat)force
{
  double v2;

  return PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (CGFloat)azimuth
{
  double v2;

  return PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, 0, v2) + -3.14159265;
}

- (CGFloat)altitude
{
  double v2;

  return 1.57079633 - PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (CGFloat)opacity
{
  double v2;

  return PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (double)_edgeWidth
{
  double v2;

  return PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (double)_radius2
{
  char *begin;
  PKStrokePathPointsShared *ptr;
  char *v4;
  float *v5;

  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((_QWORD *)ptr + 6) <= (unint64_t)v4 && (*((_BYTE *)ptr + 33) & 2) != 0)
    v5 = (float *)&begin[*((unsigned __int8 *)ptr + 97)];
  else
    v5 = (float *)((char *)ptr + 84);
  return *v5;
}

- (CGFloat)secondaryScale
{
  char *begin;
  PKStrokePathPointsShared *ptr;
  char *v4;
  double v5;
  float *v6;
  float *v8;

  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((_QWORD *)ptr + 6) <= (unint64_t)v4)
  {
    if ((*((_BYTE *)ptr + 33) & 2) != 0)
      v8 = (float *)&begin[*((unsigned __int8 *)ptr + 97)];
    else
      v8 = (float *)((char *)ptr + 84);
    v5 = *v8;
    if ((*((_BYTE *)ptr + 32) & 4) != 0)
    {
      v6 = (float *)&begin[*((unsigned __int8 *)ptr + 90)];
      return v5 / *v6;
    }
  }
  else
  {
    v5 = *((float *)ptr + 21);
  }
  v6 = (float *)((char *)ptr + 68);
  return v5 / *v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CGPoint v19;
  CGSize v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokePoint location](self, "location");
  NSStringFromCGPoint(v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokePoint timeOffset](self, "timeOffset");
  v8 = v7;
  -[PKStrokePoint size](self, "size");
  NSStringFromCGSize(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokePoint opacity](self, "opacity");
  v11 = v10;
  -[PKStrokePoint azimuth](self, "azimuth");
  v13 = v12;
  -[PKStrokePoint force](self, "force");
  v15 = v14;
  -[PKStrokePoint altitude](self, "altitude");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p location=%@ timeOffset=%f size=%@ opacity=%f azimuth=%f force=%f altitude=%f>"), v5, self, v6, v8, v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  char *begin;

  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (begin)
  {
    self->_strokeDataPointsPrivate.pointsData.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_strokeDataPointsPrivate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
