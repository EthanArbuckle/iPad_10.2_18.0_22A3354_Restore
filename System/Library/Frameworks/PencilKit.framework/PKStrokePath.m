@implementation PKStrokePath

- (PKStrokePath)init
{
  void *v3;
  PKStrokePath *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](self, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", 0, 0, 0, 1, v3, 0.0);

  return v4;
}

- (PKStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8
{
  id v15;
  PKStrokePath *v16;
  objc_super v18;

  v15 = a8;
  v18.receiver = self;
  v18.super_class = (Class)PKStrokePath;
  v16 = -[PKStrokePath init](&v18, sel_init);
  if (v16)
  {
    objc_msgSend((id)objc_opt_class(), "calculateOffsets");
    v16->_immutablePointsCount = a5;
    v16->_inputType = a6;
    objc_storeStrong((id *)&v16->_strokeDataUUID, a8);
    v16->_cachedMaxWidth = 1.79769313e308;
    -[PKStrokePath setPoints:pointsCount:timestamp:](v16, "setPoints:pointsCount:timestamp:", a3, a4, a7);
  }

  return v16;
}

- (PKStrokePath)initWithDataPoints:(PKStrokePathPointsPrivate *)a3 immutableCount:(unint64_t)a4 inputType:(int64_t)a5 UUID:(id)a6 didValidateTimestamps:(BOOL)a7 hasValidTimestampData:(BOOL)a8 cachedMaxWidth:(double)a9 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a10
{
  id v18;
  PKStrokePath *v19;
  objc_super v21;

  v18 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKStrokePath;
  v19 = -[PKStrokePath init](&v21, sel_init);
  if (v19)
  {
    objc_msgSend((id)objc_opt_class(), "calculateOffsets");
    v19->_immutablePointsCount = a4;
    v19->_startIndex = a5;
    v19->_inputType = a5;
    objc_storeStrong((id *)&v19->_strokeDataUUID, a6);
    v19->_cachedMaxWidth = a9;
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v19->_strokeDataPointsPrivate.constants.__ptr_, (uint64_t *)a3);
    if (&v19->_strokeDataPointsPrivate != a3)
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v19->_strokeDataPointsPrivate.pointsData.__begin_, a3->pointsData.__begin_, a3->pointsData.__end_, a3->pointsData.__end_ - a3->pointsData.__begin_);
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v19->_unknownFields.__ptr_, (uint64_t *)a10.__ptr_);
    v19->_didValidateTimestamps = a7;
    v19->_hasValidTimestampData = a8;
  }

  return v19;
}

- (PKStrokePath)initWithControlPoints:(NSArray *)controlPoints creationDate:(NSDate *)creationDate
{
  NSArray *v6;
  NSDate *v7;
  PKStrokePath *v8;
  uint64_t v9;
  NSUUID *strokeDataUUID;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __int128 *v15;
  unint64_t immutablePointsCount;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  void *__p;
  void *v23;
  uint64_t v24;
  objc_super v25;

  v6 = controlPoints;
  v7 = creationDate;
  v25.receiver = self;
  v25.super_class = (Class)PKStrokePath;
  v8 = -[PKStrokePath init](&v25, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "calculateOffsets");
    v8->_immutablePointsCount = -[NSArray count](v6, "count");
    v8->_inputType = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    strokeDataUUID = v8->_strokeDataUUID;
    v8->_strokeDataUUID = (NSUUID *)v9;

    v8->_cachedMaxWidth = 1.79769313e308;
    __p = 0;
    v23 = 0;
    v24 = 0;
    std::vector<PKCompressedStrokePoint>::resize((uint64_t)&__p, v8->_immutablePointsCount);
    if (v8->_immutablePointsCount)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v12, v20, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "_compressedPoint");
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }
        v15 = (__int128 *)((char *)__p + v11);
        *v15 = v20;
        v15[1] = v21;

        ++v12;
        immutablePointsCount = v8->_immutablePointsCount;
        v11 += 32;
      }
      while (v12 < immutablePointsCount);
    }
    else
    {
      immutablePointsCount = 0;
    }
    v18 = __p;
    v17 = v23;
    if (v23 != __p)
    {
      -[NSDate timeIntervalSinceReferenceDate](v7, "timeIntervalSinceReferenceDate");
      -[PKStrokePath setPoints:pointsCount:timestamp:](v8, "setPoints:pointsCount:timestamp:", v18, immutablePointsCount);
      v17 = __p;
    }
    if (v17)
    {
      v23 = v17;
      operator delete(v17);
    }
  }

  return v8;
}

- (PKStrokePath)initWithData:(id)a3 range:(_NSRange)a4 UUID:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t *v9;
  id v10;
  PKStrokePath *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v9 = (uint64_t *)a3;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKStrokePath;
  v11 = -[PKStrokePath init](&v13, sel_init);
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "calculateOffsets");
    v11->_startIndex = location;
    v11->_immutablePointsCount = objc_msgSend(v9, "_immutablePointsCount");
    v11->_inputType = objc_msgSend(v9, "_inputType");
    objc_storeStrong((id *)&v11->_strokeDataUUID, a5);
    v11->_cachedMaxWidth = 1.79769313e308;
    -[PKStrokePath setPointsFrom:range:](v11, "setPointsFrom:range:", v9, location, length);
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v11->_unknownFields.__ptr_, v9 + 6);
  }

  return v11;
}

- (id)copyTransformed:(id)a3 inCoordinateSpace:(CGAffineTransform *)a4
{
  id v6;
  PKStrokePath *v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  unint64_t immutablePointsCount;
  int64_t inputType;
  void *v13;
  _BOOL4 didValidateTimestamps;
  _BOOL4 hasValidTimestampData;
  double cachedMaxWidth;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  PKStrokePath *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  __int128 v27;
  _OWORD v29[3];
  PKProtobufUnknownFields *v30;
  __shared_weak_count *v31;
  PKStrokePathPointsShared *ptr;
  __shared_weak_count *v33;
  void *__p;
  void *v35;
  uint64_t v36;

  v6 = a3;
  v7 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v33 = cntrl;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  __p = 0;
  v35 = 0;
  v36 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  immutablePointsCount = self->_immutablePointsCount;
  inputType = self->_inputType;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  didValidateTimestamps = self->_didValidateTimestamps;
  hasValidTimestampData = self->_hasValidTimestampData;
  cachedMaxWidth = self->_cachedMaxWidth;
  v17 = self->_unknownFields.__cntrl_;
  v30 = self->_unknownFields.__ptr_;
  v31 = v17;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v20 = -[PKStrokePath initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:](v7, "initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:", &ptr, immutablePointsCount, inputType, v13, didValidateTimestamps, hasValidTimestampData, cachedMaxWidth, &v30);
  v21 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v22 = (unint64_t *)((char *)v31 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  v24 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v25 = (unint64_t *)((char *)v33 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = *(_OWORD *)&a4->c;
  v29[0] = *(_OWORD *)&a4->a;
  v29[1] = v27;
  v29[2] = *(_OWORD *)&a4->tx;
  -[PKStrokePath _transform:existingTransform:](v20, "_transform:existingTransform:", v6, v29);

  return v20;
}

- (id)copyWithScaledRadius:(double)a3 isVector:(BOOL)a4
{
  _BOOL8 v4;
  PKStrokePath *v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  unint64_t immutablePointsCount;
  int64_t inputType;
  void *v13;
  _BOOL4 didValidateTimestamps;
  _BOOL4 hasValidTimestampData;
  double cachedMaxWidth;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  PKStrokePath *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  PKProtobufUnknownFields *v28;
  __shared_weak_count *v29;
  PKStrokePathPointsShared *ptr;
  __shared_weak_count *v31;
  void *__p;
  void *v33;
  uint64_t v34;

  v4 = a4;
  v7 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v31 = cntrl;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  __p = 0;
  v33 = 0;
  v34 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  immutablePointsCount = self->_immutablePointsCount;
  inputType = self->_inputType;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  didValidateTimestamps = self->_didValidateTimestamps;
  hasValidTimestampData = self->_hasValidTimestampData;
  cachedMaxWidth = self->_cachedMaxWidth;
  v17 = self->_unknownFields.__cntrl_;
  v28 = self->_unknownFields.__ptr_;
  v29 = v17;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v20 = -[PKStrokePath initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:](v7, "initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:", &ptr, immutablePointsCount, inputType, v13, didValidateTimestamps, hasValidTimestampData, cachedMaxWidth, &v28);
  v21 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v22 = (unint64_t *)((char *)v29 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  v24 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v25 = (unint64_t *)((char *)v31 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  -[PKStrokePath _scaleRadius:isVector:](v20, "_scaleRadius:isVector:", v4, a3);
  return v20;
}

- (id)copyWithStrokeDataUUID:(id)a3
{
  id v4;
  PKStrokePath *v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  unint64_t immutablePointsCount;
  int64_t inputType;
  _BOOL4 didValidateTimestamps;
  _BOOL4 hasValidTimestampData;
  double cachedMaxWidth;
  __shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  PKStrokePath *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  PKProtobufUnknownFields *v25;
  __shared_weak_count *v26;
  PKStrokePathPointsShared *ptr;
  __shared_weak_count *v28;
  void *__p;
  void *v30;
  uint64_t v31;

  v4 = a3;
  v5 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v28 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  __p = 0;
  v30 = 0;
  v31 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  immutablePointsCount = self->_immutablePointsCount;
  inputType = self->_inputType;
  didValidateTimestamps = self->_didValidateTimestamps;
  hasValidTimestampData = self->_hasValidTimestampData;
  cachedMaxWidth = self->_cachedMaxWidth;
  v14 = self->_unknownFields.__cntrl_;
  v25 = self->_unknownFields.__ptr_;
  v26 = v14;
  if (v14)
  {
    v15 = (unint64_t *)((char *)v14 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = -[PKStrokePath initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:](v5, "initWithDataPoints:immutableCount:inputType:UUID:didValidateTimestamps:hasValidTimestampData:cachedMaxWidth:unknownFields:", &ptr, immutablePointsCount, inputType, v4, didValidateTimestamps, hasValidTimestampData, cachedMaxWidth, &v25);
  v18 = (std::__shared_weak_count *)v26;
  if (v26)
  {
    v19 = (unint64_t *)((char *)v26 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }
  v21 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    v22 = (unint64_t *)((char *)v28 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v17;
}

- (void)_transform:(id)a3 existingTransform:(CGAffineTransform *)a4
{
  double (**v6)(_QWORD, double, double);
  unint64_t v7;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  PKStrokePathPointsShared *ptr;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  CGPoint v18;
  CGFloat y;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v6 = (double (**)(_QWORD, double, double))a3;
  v7 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v7)
  {
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
    v10 = *((_QWORD *)ptr + 6);
    if (v10 <= v7)
    {
      v11 = 0;
      v12 = v7 / v10;
      do
      {
        v13 = PKStrokePathPointsPrivate::locationAtIndex(p_strokeDataPointsPrivate, v11);
        v15 = v6[2](v6, a4->tx + v14 * a4->c + a4->a * v13, a4->ty + v14 * a4->d + a4->b * v13);
        v20 = v16;
        v21 = v15;
        v17 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v22.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v22.c = v17;
        *(_OWORD *)&v22.tx = *(_OWORD *)&a4->tx;
        CGAffineTransformInvert(&v23, &v22);
        v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&v23.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, v20), *(float64x2_t *)&v23.a, v21));
        y = v18.y;
        PKStrokePathPointsPrivate::setLocation(p_strokeDataPointsPrivate, v18, v11++);
      }
      while (v12 != v11);
    }
  }

}

- (void)_scaleRadius:(double)a3 isVector:(BOOL)a4
{
  _BOOL4 v4;
  PKStrokePathPointsShared *ptr;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  uint64_t v9;
  uint64_t v10;
  PKStrokePathPointsShared *v11;
  const void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  float v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PKStrokePathPointsShared *v34;
  const void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  float v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  __int128 v50;
  uint64_t v51;

  v4 = a4;
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if ((*((_BYTE *)ptr + 32) & 4) != 0)
  {
    v14 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
    if (v14)
    {
      v15 = *((_QWORD *)ptr + 6);
      if (v15 <= v14)
      {
        v16 = 0;
        v17 = v14 / v15;
        do
        {
          v18 = PKStrokePathPointsPrivate::radiusAtIndex(p_strokeDataPointsPrivate, v16);
          v19 = (v18 + -2.0) * a3 + 2.0;
          v20 = v18 * a3;
          if (v4)
            v20 = v19;
          PKStrokePathPointsPrivate::setRadius(p_strokeDataPointsPrivate, v20, v16++);
        }
        while (v17 != v16);
      }
    }
  }
  else
  {
    v9 = operator new();
    v10 = v9;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)(v9 + 64) = 0u;
    *(_OWORD *)(v9 + 80) = 0u;
    *(_OWORD *)(v9 + 96) = 0u;
    v11 = p_strokeDataPointsPrivate->constants.__ptr_;
    *(_QWORD *)v9 = *(_QWORD *)p_strokeDataPointsPrivate->constants.__ptr_;
    if ((PKStrokePathPointsShared *)v9 == v11)
    {
      v13 = 0;
      v12 = 0;
    }
    else
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)(v9 + 8), *((char **)v11 + 1), *((char **)v11 + 2), *((_QWORD *)v11 + 2) - *((_QWORD *)v11 + 1));
      v12 = *(const void **)(v10 + 8);
      v13 = *(_QWORD *)(v10 + 16);
    }
    *(_OWORD *)(v10 + 32) = *((_OWORD *)v11 + 2);
    v21 = *((_OWORD *)v11 + 3);
    v22 = *((_OWORD *)v11 + 4);
    v23 = *((_OWORD *)v11 + 6);
    *(_OWORD *)(v10 + 80) = *((_OWORD *)v11 + 5);
    *(_OWORD *)(v10 + 96) = v23;
    *(_OWORD *)(v10 + 48) = v21;
    *(_OWORD *)(v10 + 64) = v22;
    v50 = 0uLL;
    v51 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v50, v12, v13, v13 - (_QWORD)v12);
    v24 = *(void **)(v10 + 8);
    if (v24)
    {
      *(_QWORD *)(v10 + 16) = v24;
      operator delete(v24);
    }
    *(_OWORD *)(v10 + 8) = v50;
    *(_QWORD *)(v10 + 24) = v51;
    v25 = *(float *)(v10 + 68);
    v26 = (v25 + -2.0) * a3 + 2.0;
    v27 = v25 * a3;
    if (v4)
      v27 = v26;
    v28 = v27;
    *(float *)(v10 + 68) = v28;
    PKStrokePathPointsShared::updateFromCachedValues((PKStrokePathPointsShared *)v10);
    std::shared_ptr<PKStrokePathPointsShared>::shared_ptr[abi:ne180100]<PKStrokePathPointsShared,void>(&v50, v10);
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)p_strokeDataPointsPrivate, &v50);
    v29 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1))
    {
      v30 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
        if (v4)
          return;
        goto LABEL_23;
      }
    }
  }
  if (v4)
    return;
LABEL_23:
  if ((*((_BYTE *)p_strokeDataPointsPrivate->constants.__ptr_ + 33) & 2) != 0)
  {
    v37 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
    if (v37)
    {
      v38 = *((_QWORD *)p_strokeDataPointsPrivate->constants.__ptr_ + 6);
      if (v38 <= v37)
      {
        v39 = 0;
        v40 = v37 / v38;
        do
        {
          v41 = PKStrokePathPointsPrivate::radius2AtIndex(p_strokeDataPointsPrivate, v39);
          PKStrokePathPointsPrivate::setRadius2(p_strokeDataPointsPrivate, v41 * a3, v39++);
        }
        while (v40 != v39);
      }
    }
  }
  else
  {
    v32 = operator new();
    v33 = v32;
    *(_OWORD *)v32 = 0u;
    *(_OWORD *)(v32 + 16) = 0u;
    *(_OWORD *)(v32 + 32) = 0u;
    *(_OWORD *)(v32 + 48) = 0u;
    *(_OWORD *)(v32 + 64) = 0u;
    *(_OWORD *)(v32 + 80) = 0u;
    *(_OWORD *)(v32 + 96) = 0u;
    v34 = p_strokeDataPointsPrivate->constants.__ptr_;
    *(_QWORD *)v32 = *(_QWORD *)p_strokeDataPointsPrivate->constants.__ptr_;
    if ((PKStrokePathPointsShared *)v32 == v34)
    {
      v36 = 0;
      v35 = 0;
    }
    else
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)(v32 + 8), *((char **)v34 + 1), *((char **)v34 + 2), *((_QWORD *)v34 + 2) - *((_QWORD *)v34 + 1));
      v35 = *(const void **)(v33 + 8);
      v36 = *(_QWORD *)(v33 + 16);
    }
    *(_OWORD *)(v33 + 32) = *((_OWORD *)v34 + 2);
    v42 = *((_OWORD *)v34 + 3);
    v43 = *((_OWORD *)v34 + 4);
    v44 = *((_OWORD *)v34 + 6);
    *(_OWORD *)(v33 + 80) = *((_OWORD *)v34 + 5);
    *(_OWORD *)(v33 + 96) = v44;
    *(_OWORD *)(v33 + 48) = v42;
    *(_OWORD *)(v33 + 64) = v43;
    v50 = 0uLL;
    v51 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v50, v35, v36, v36 - (_QWORD)v35);
    v45 = *(void **)(v33 + 8);
    if (v45)
    {
      *(_QWORD *)(v33 + 16) = v45;
      operator delete(v45);
    }
    *(_OWORD *)(v33 + 8) = v50;
    *(_QWORD *)(v33 + 24) = v51;
    v46 = *(float *)(v33 + 84) * a3;
    *(float *)(v33 + 84) = v46;
    PKStrokePathPointsShared::updateFromCachedValues((PKStrokePathPointsShared *)v33);
    std::shared_ptr<PKStrokePathPointsShared>::shared_ptr[abi:ne180100]<PKStrokePathPointsShared,void>(&v50, v33);
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)p_strokeDataPointsPrivate, &v50);
    v47 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1))
    {
      v48 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
      do
        v49 = __ldaxr(v48);
      while (__stlxr(v49 - 1, v48));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
  }
}

- (unint64_t)_pointsCount
{
  unint64_t v2;

  v2 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v2)
    return v2 / *((_QWORD *)self->_strokeDataPointsPrivate.constants.__ptr_ + 6);
  else
    return 0;
}

- (NSUInteger)count
{
  unint64_t v2;

  v2 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v2)
    return v2 / *((_QWORD *)self->_strokeDataPointsPrivate.constants.__ptr_ + 6);
  else
    return 0;
}

- (double)_timestamp
{
  return *(double *)self->_strokeDataPointsPrivate.constants.__ptr_;
}

- (NSDate)creationDate
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[PKStrokePath _timestamp](self, "_timestamp");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (BOOL)hasValidPointTimestampData
{
  PKStrokePathPointsShared *ptr;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  char *begin;
  unint64_t v6;
  float *v7;
  unint64_t v8;
  double v9;
  BOOL hasValidTimestampData;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  BOOL v18;

  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if ((*((_BYTE *)ptr + 40) & 2) != 0)
    return 0;
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  v6 = self->_strokeDataPointsPrivate.pointsData.__end_ - begin;
  if (v6)
  {
    v7 = *((_QWORD *)ptr + 6) <= v6 && (*((_BYTE *)ptr + 32) & 2) != 0
       ? (float *)&begin[*((unsigned __int8 *)ptr + 89)]
       : (float *)((char *)ptr + 64);
    v8 = v6 / *((_QWORD *)ptr + 6) - 1;
  }
  else
  {
    v7 = (float *)((char *)ptr + 64);
    v8 = -1;
  }
  v9 = *v7;
  if (PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v8) <= v9)
    return 0;
  if (self->_didValidateTimestamps)
  {
    hasValidTimestampData = self->_hasValidTimestampData;
  }
  else
  {
    v11 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
    if (v11)
      v12 = v11 / *((_QWORD *)p_strokeDataPointsPrivate->constants.__ptr_ + 6) - 1;
    else
      v12 = -1;
    v13 = 0;
    v14 = v12 & ~(v12 >> 63);
    while (v14 != v13)
    {
      v15 = v13 + 1;
      v16 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v13 + 1);
      v17 = v16 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v13);
      v18 = v17 > 0.0 && v17 < 10.0;
      ++v13;
      if (!v18)
      {
        v14 = v15 - 1;
        break;
      }
    }
    hasValidTimestampData = v14 >= v12;
    self->_didValidateTimestamps = 1;
    self->_hasValidTimestampData = v14 >= v12;
  }
  return hasValidTimestampData;
}

- (BOOL)hasAzimuthAngles
{
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  NSUInteger v3;
  double v4;
  double v5;

  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  if ((*((_BYTE *)self->_strokeDataPointsPrivate.constants.__ptr_ + 40) & 0x40) != 0)
  {
    v3 = -[PKStrokePath count](self, "count");
    if (v3)
    {
      v5 = PKStrokePathPointsPrivate::azimuthAtIndex(p_strokeDataPointsPrivate, 0, v4);
      LOBYTE(v3) = fabs(v5) >= 0.00999999978 && fabs(v5 + -3.14159265) >= 0.00999999978;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)inflight
{
  unint64_t v3;

  v3 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
  return v3 < -[PKStrokePath _pointsCount](self, "_pointsCount");
}

- (unsigned)_legacyRandomSeed
{
  void *v2;
  unsigned int v3;

  -[PKStrokePath _strokeDataUUID](self, "_strokeDataUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (void)calculateOffsets
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PKStrokePath_calculateOffsets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PKStrokePath calculateOffsets]::onceToken != -1)
    dispatch_once(&+[PKStrokePath calculateOffsets]::onceToken, block);
}

uint64_t __32__PKStrokePath_calculateOffsets__block_invoke()
{
}

+ (void)_calculateOffsets:(unint64_t *)a3 sizes:(unint64_t *)a4
{
  int64x2_t v4;

  *(_OWORD *)a3 = xmmword_1BE4FC3E0;
  *((_OWORD *)a3 + 1) = xmmword_1BE4FC3F0;
  *((_OWORD *)a3 + 2) = xmmword_1BE4FC400;
  *((_OWORD *)a3 + 3) = xmmword_1BE4FC410;
  *((_OWORD *)a3 + 4) = xmmword_1BE4FC420;
  v4 = vdupq_n_s64(2uLL);
  *(_OWORD *)a4 = xmmword_1BE4FC430;
  *((_OWORD *)a4 + 1) = xmmword_1BE4FC440;
  *((int64x2_t *)a4 + 2) = v4;
  *((int64x2_t *)a4 + 3) = v4;
  *((_OWORD *)a4 + 4) = xmmword_1BE4FB870;
}

- (void)setPoints:(PKCompressedStrokePoint *)a3 pointsCount:(unint64_t)a4 timestamp:(double)a5
{
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *begin;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  PKStrokePath *v37;
  PKStrokePathPointsShared *v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41[2];

  v9 = operator new();
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)(v9 + 48) = 0u;
  *(_OWORD *)(v9 + 64) = 0u;
  *(_OWORD *)(v9 + 80) = 0u;
  *(_OWORD *)(v9 + 96) = 0u;
  std::shared_ptr<PKStrokePathPointsShared>::shared_ptr[abi:ne180100]<PKStrokePathPointsShared,void>(v41, v9);
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)&self->_strokeDataPointsPrivate, v41);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v41[0] + 1);
  if (!*((_QWORD *)&v41[0] + 1))
    goto LABEL_5;
  v11 = (unint64_t *)(*((_QWORD *)&v41[0] + 1) + 8);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    if (a4)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (a4)
    {
LABEL_6:
      v13 = *(_OWORD *)&a3->var3;
      v41[0] = *(_OWORD *)&a3->var0.var0;
      v41[1] = v13;
      v37 = self;
      v38 = (PKStrokePathPointsShared *)v9;
      v40 = a4;
      if (a4 == 1)
      {
        v14 = 1;
      }
      else
      {
        v15 = 1;
        v14 = 1;
        do
        {
          for (i = 0; i != 10; ++i)
          {
            if ((v14 & (1 << i)) == 0)
            {
              else
                v17 = (1 << i);
              v14 |= v17;
            }
          }
          if (v14 == 1023)
            break;
          ++v15;
        }
        while (v15 != a4);
      }
      v18 = 0;
      v19 = 0;
      v20 = (unint64_t *)(v9 + 8);
      *(double *)v38 = a5;
      *((_QWORD *)v38 + 4) = v14;
      do
      {
        if ((v14 & (1 << v18)) != 0)
        ++v18;
      }
      while (v18 != 10);
      v21 = ~(_DWORD)v14 & 0x3FFLL;
      *((_QWORD *)v38 + 5) = v21;
      *((_QWORD *)v38 + 6) = v19;
      if (v21)
      {
        v22 = 0;
        v23 = 0;
        do
        {
          if ((v21 & (1 << v22)) != 0)
          ++v22;
        }
        while (v22 != 10);
        v39 = *((_QWORD *)v38 + 1);
        v24 = *((_QWORD *)v38 + 2) - v39;
        if (v23 <= v24)
        {
          if (v23 < v24)
            *((_QWORD *)v38 + 2) = v39 + v23;
        }
        else
        {
          std::vector<unsigned char>::__append(v20, v23 - v24);
          v39 = *v20;
        }
        v27 = 0;
        v28 = 0;
        do
        {
          if ((v21 & (1 << v27)) != 0)
            v28 = v27;
          ++v27;
        }
        while (v27 != 10);
        if ((v28 & 0x8000000000000000) == 0)
        {
          v29 = 0;
          v30 = 0;
          v31 = v28 + 1;
          do
          {
            if ((v21 & (1 << v29)) != 0)
            {
            }
            ++v29;
          }
          while (v31 != v29);
        }
      }
      begin = v37->_strokeDataPointsPrivate.pointsData.__begin_;
      v33 = v37->_strokeDataPointsPrivate.pointsData.__end_ - begin;
      if (v19 * v40 <= v33)
      {
        if (v19 * v40 < v33)
          v37->_strokeDataPointsPrivate.pointsData.__end_ = &begin[v19 * v40];
      }
      else
      {
        std::vector<unsigned char>::__append((unint64_t *)&v37->_strokeDataPointsPrivate.pointsData, v19 * v40 - v33);
        begin = v37->_strokeDataPointsPrivate.pointsData.__begin_;
      }
      v34 = 0;
      if (v40 <= 1)
        v35 = 1;
      else
        v35 = v40;
      do
      {
        for (j = 0; j != 10; ++j)
        {
          if ((v14 & (1 << j)) != 0)
          {
          }
        }
        ++v34;
      }
      while (v34 != v35);
      PKStrokePathPointsShared::computeCachedValues(v38);
      return;
    }
  }
  v25 = *(_QWORD *)(v9 + 8);
  if (*(_QWORD *)(v9 + 16) != v25)
    *(_QWORD *)(v9 + 16) = v25;
  v26 = self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (self->_strokeDataPointsPrivate.pointsData.__end_ != v26)
    self->_strokeDataPointsPrivate.pointsData.__end_ = v26;
}

- (void)setPointsFrom:(id)a3 range:(_NSRange)a4
{
  PKStrokePathPointsPrivate *v4;
  _NSRange v5;

  v5.location = a4.location;
  a4.location = (NSUInteger)&self->_strokeDataPointsPrivate;
  v4 = (PKStrokePathPointsPrivate *)((char *)a3 + 8);
  v5.length = a4.length;
  PKStrokePathPointsPrivate::slice(v4, v5, (PKStrokePathPointsPrivate *)a4.location);
}

- (CGPoint)locationAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = PKStrokePathPointsPrivate::locationAtIndex(&self->_strokeDataPointsPrivate, a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setLocation:(CGPoint)a3 atIndex:(unint64_t)a4
{
  PKStrokePathPointsPrivate::setLocation(&self->_strokeDataPointsPrivate, a3, a4);
}

- (double)timestampAtIndex:(unint64_t)a3
{
  return PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, a3);
}

- (double)radiusAtIndex:(unint64_t)a3
{
  return PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, a3);
}

- (CGPath)_newPathRepresentation
{
  return PKCreateCGPathFromBSpline(&self->_strokeDataPointsPrivate, -[PKStrokePath _pointsCount](self, "_pointsCount"));
}

- (PKCompressedStrokePoint)_compressedPointAt:(SEL)a3
{
  return (PKCompressedStrokePoint *)PKStrokePathPointsPrivate::operator[](&self->_strokeDataPointsPrivate.constants.__ptr_, a4, retstr);
}

- (PKStrokePoint)pointAtIndex:(NSUInteger)i
{
  return -[PKStrokePoint initWithSlice:index:]([PKStrokePoint alloc], "initWithSlice:index:", &self->_strokeDataPointsPrivate, i);
}

- (PKStrokePoint)objectAtIndexedSubscript:(NSUInteger)i
{
  return -[PKStrokePoint initWithSlice:index:]([PKStrokePoint alloc], "initWithSlice:index:", &self->_strokeDataPointsPrivate, i);
}

- (CGPoint)interpolatedLocationAt:(CGFloat)parametricValue
{
  double v3;
  double v4;
  CGPoint result;

  -[PKStrokePath locationOnSegment:t:](self, "locationOnSegment:t:", vcvtmd_u64_f64(parametricValue), parametricValue - floor(parametricValue));
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)interpolatedTimeoffsetAt:(double)a3
{
  NSUInteger v5;
  char *begin;
  PKStrokePathPointsShared *ptr;
  char *v8;
  float *v9;
  unint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  double v16;

  v5 = -[PKStrokePath count](self, "count");
  if (a3 >= 0.0)
  {
    v11 = v5 - 1;
    if ((double)(uint64_t)(v5 - 1) <= a3)
    {
      return PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v11);
    }
    else
    {
      v12 = vcvtmd_u64_f64(a3);
      v13 = a3 - (double)(unint64_t)floor(a3);
      if (v12 + 1 < v11)
        v14 = v12 + 1;
      else
        v14 = v5 - 1;
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      v16 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v12);
      return v13 * PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v14) + v16 * (1.0 - v13);
    }
  }
  else
  {
    begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    v8 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
    if (v8 && *((_QWORD *)ptr + 6) <= (unint64_t)v8 && (*((_BYTE *)ptr + 32) & 2) != 0)
      v9 = (float *)&begin[*((unsigned __int8 *)ptr + 89)];
    else
      v9 = (float *)((char *)ptr + 64);
    return *v9;
  }
}

- (PKStrokePoint)interpolatedPointAt:(CGFloat)parametricValue
{
  NSUInteger v5;
  unint64_t v6;
  PKStrokePoint *v7;
  PKStrokePathPointsPrivate *v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  char *begin;
  char *end;
  unint64_t v16;
  PKStrokePathPointsShared *ptr;
  double v18;
  char *v19;
  char *v20;
  unint64_t v21;
  PKStrokePathPointsShared *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char *v37;
  char *v38;
  unint64_t v39;
  PKStrokePathPointsShared *v40;
  float v41;
  CGPoint v43;

  v5 = -[PKStrokePath count](self, "count");
  v6 = vcvtmd_u64_f64(parametricValue);
  v7 = -[PKStrokePoint initWithSlice:index:]([PKStrokePoint alloc], "initWithSlice:index:", &self->_strokeDataPointsPrivate, v6);
  v8 = -[PKStrokePoint _strokeDataPointsPrivate](v7, "_strokeDataPointsPrivate");
  v9 = (double)(unint64_t)floor(parametricValue);
  v10 = parametricValue - v9;
  v11 = *((_QWORD *)self->_strokeDataPointsPrivate.constants.__ptr_ + 4);
  if ((v11 & 1) != 0)
  {
    -[PKStrokePath locationOnSegment:t:](self, "locationOnSegment:t:", v6, v10);
    *(float *)&v9 = PKStrokePathPointsPrivate::setLocation(v8, v43, 0);
  }
  if (v6 + 1 < v5 - 1)
    v12 = v6 + 1;
  else
    v12 = v5 - 1;
  if ((v11 & 2) != 0)
  {
    v13 = PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v6);
    v9 = PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v12);
    begin = v8->pointsData.__begin_;
    end = v8->pointsData.__end_;
    v16 = end - begin;
    if (end != begin)
    {
      ptr = v8->constants.__ptr_;
      if (*((_QWORD *)v8->constants.__ptr_ + 6) <= v16 && (*((_BYTE *)ptr + 32) & 2) != 0)
      {
        v9 = v10 * v9 + v13 * (1.0 - v10);
        *(float *)&v9 = v9;
        *(_DWORD *)&begin[*((unsigned __int8 *)ptr + 89)] = LODWORD(v9);
      }
    }
  }
  if ((v11 & 4) != 0)
  {
    v18 = PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, v6);
    v9 = PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, v12);
    v19 = v8->pointsData.__begin_;
    v20 = v8->pointsData.__end_;
    v21 = v20 - v19;
    if (v20 != v19)
    {
      v22 = v8->constants.__ptr_;
      if (*((_QWORD *)v8->constants.__ptr_ + 6) <= v21 && (*((_BYTE *)v22 + 32) & 4) != 0)
      {
        v9 = v10 * v9 + v18 * (1.0 - v10);
        *(float *)&v9 = v9;
        *(_DWORD *)&v19[*((unsigned __int8 *)v22 + 90)] = LODWORD(v9);
      }
    }
  }
  if ((v11 & 8) != 0)
  {
    v23 = PKStrokePathPointsPrivate::aspectRatioAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    v24 = PKStrokePathPointsPrivate::aspectRatioAtIndex(&self->_strokeDataPointsPrivate, v12, v23);
    PKStrokePathPointsPrivate::setAspectRatio(v8, v10 * v24 + v23 * (1.0 - v10), 0);
    if ((v11 & 0x10) == 0)
    {
LABEL_18:
      if ((v11 & 0x20) == 0)
        goto LABEL_19;
LABEL_23:
      v27 = PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
      v28 = PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, v12, v27);
      PKStrokePathPointsPrivate::setForce(v8, v10 * v28 + v27 * (1.0 - v10), 0);
      if ((v11 & 0x40) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_18;
  }
  v25 = PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
  v26 = PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, v12, v25);
  PKStrokePathPointsPrivate::setEdgeWidth(v8, v10 * v26 + v25 * (1.0 - v10), 0);
  if ((v11 & 0x20) != 0)
    goto LABEL_23;
LABEL_19:
  if ((v11 & 0x40) != 0)
  {
LABEL_24:
    v29 = PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    v30 = PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, v12, v29);
    PKStrokePathPointsPrivate::setAzimuth(v8, v10 * v30 + v29 * (1.0 - v10), 0);
  }
LABEL_25:
  if ((v11 & 0x80) == 0)
  {
    if ((v11 & 0x100) == 0)
      goto LABEL_27;
LABEL_30:
    v33 = PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    v34 = PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, v12, v33);
    PKStrokePathPointsPrivate::setOpacity(v8, v10 * v34 + v33 * (1.0 - v10), 0);
    if ((v11 & 0x200) == 0)
      return v7;
    goto LABEL_31;
  }
  v31 = PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
  v32 = PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, v12, v31);
  PKStrokePathPointsPrivate::setAltitude(v8, v10 * v32 + v31 * (1.0 - v10), 0);
  if ((v11 & 0x100) != 0)
    goto LABEL_30;
LABEL_27:
  if ((v11 & 0x200) == 0)
    return v7;
LABEL_31:
  v35 = PKStrokePathPointsPrivate::radius2AtIndex(&self->_strokeDataPointsPrivate, v6);
  v36 = PKStrokePathPointsPrivate::radius2AtIndex(&self->_strokeDataPointsPrivate, v12);
  v37 = v8->pointsData.__begin_;
  v38 = v8->pointsData.__end_;
  v39 = v38 - v37;
  if (v38 != v37)
  {
    v40 = v8->constants.__ptr_;
    if (*((_QWORD *)v8->constants.__ptr_ + 6) <= v39 && (*((_BYTE *)v40 + 33) & 2) != 0)
    {
      v41 = v10 * v36 + v35 * (1.0 - v10);
      *(float *)&v37[*((unsigned __int8 *)v40 + 97)] = v41;
    }
  }
  return v7;
}

- (_PKStrokePoint)decompressedPointAt:(SEL)a3
{
  _PKStrokePoint *result;

  PKStrokePathPointsPrivate::pointAtIndex(&self->_strokeDataPointsPrivate, a4, (uint64_t)retstr);
  return result;
}

- (CGPoint)locationOnSegment:(unint64_t)a3 t:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = splinePoint(&self->_strokeDataPointsPrivate, 0, -[PKStrokePath _pointsCount](self, "_pointsCount"), a3, a4, b);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByDistance:(CGFloat)distanceStep
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  double v12;
  PKStrokePathPointsPrivate *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;

  v7 = -[PKStrokePath _pointsCount](self, "_pointsCount");
  v8 = v7;
  v9 = (uint64_t)parametricValue;
  if (distanceStep <= 0.0)
  {
    if (distanceStep < 0.0)
    {
      v16 = (double)v9;
      v17 = (double)v9 - parametricValue + 1.0;
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      v19 = splineSegmentLength(p_strokeDataPointsPrivate, 0, v7, v9);
      v20 = v17 > 0.0;
      v21 = -(distanceStep - v17 * v19);
      if (v17 <= 0.0)
        v21 = -distanceStep;
      if (v21 >= v19)
      {
        do
        {
          if (v20)
            v17 = 0.0;
          v22 = v21 - v19;
          v19 = splineSegmentLength(p_strokeDataPointsPrivate, 0, v8, --v9);
          v20 = v17 > 0.0;
          v21 = v22 + v17 * v19;
          if (v17 <= 0.0)
            v21 = v22;
        }
        while (v21 >= v19);
        v16 = (double)v9;
      }
      v23 = v16 + 1.0 - v21 / v19;
      if (v23 >= 0.0)
        return v23;
      else
        return 0.0;
    }
  }
  else
  {
    v10 = (double)v9;
    v11 = v7 - 1;
    v12 = 0.0;
    if (v7 - 1 > v9)
    {
      v13 = &self->_strokeDataPointsPrivate;
      v14 = parametricValue - v10;
      while (1)
      {
        v12 = splineSegmentLength(v13, 0, v8, v9);
        if (v14 > 0.0)
          distanceStep = distanceStep + v14 * v12;
        if (distanceStep < v12)
          break;
        if (v14 > 0.0)
          v14 = 0.0;
        distanceStep = distanceStep - v12;
        if (v11 == ++v9)
        {
          v9 = v8 - 1;
          break;
        }
      }
      v10 = (double)v9;
    }
    v15 = v10 + distanceStep / v12;
    if (v15 >= (double)v11)
      return (double)v11;
    else
      return v15;
  }
  return parametricValue;
}

- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByTime:(NSTimeInterval)timeStep
{
  unint64_t v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  PKStrokePathPointsPrivate *v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PKStrokePathPointsPrivate *p_strokeDataPointsPrivate;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;

  v7 = -[PKStrokePath _pointsCount](self, "_pointsCount");
  v8 = (uint64_t)parametricValue;
  if (timeStep <= 0.0)
  {
    if (timeStep < 0.0)
    {
      v17 = (double)v8;
      v18 = (double)v8 - parametricValue + 1.0;
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      v20 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8 + 1);
      v21 = v20 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8);
      v22 = v18 > 0.0;
      v23 = -(timeStep - v18 * v21);
      if (v18 <= 0.0)
        v23 = -timeStep;
      if (v23 >= v21)
      {
        do
        {
          if (v22)
            v18 = 0.0;
          v24 = v23 - v21;
          v25 = v8 - 1;
          v26 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8);
          v21 = v26 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8 - 1);
          v22 = v18 > 0.0;
          v23 = v24 + v18 * v21;
          if (v18 <= 0.0)
            v23 = v24;
          --v8;
        }
        while (v23 >= v21);
        v17 = (double)v25;
      }
      v27 = v17 + 1.0 - v23 / v21;
      if (v27 >= 0.0)
        return v27;
      else
        return 0.0;
    }
  }
  else
  {
    v9 = (double)v8;
    v10 = v7 - 1;
    v11 = 0.0;
    if (v7 - 1 > v8)
    {
      v12 = &self->_strokeDataPointsPrivate;
      v13 = parametricValue - v9;
      while (1)
      {
        v14 = v8 + 1;
        v15 = PKStrokePathPointsPrivate::timestampAtIndex(v12, v8 + 1);
        v11 = v15 - PKStrokePathPointsPrivate::timestampAtIndex(v12, v8);
        if (v13 > 0.0)
          timeStep = timeStep + v13 * v11;
        if (timeStep < v11)
          break;
        if (v13 > 0.0)
          v13 = 0.0;
        timeStep = timeStep - v11;
        ++v8;
        if (v10 == v14)
        {
          v8 = v10;
          break;
        }
      }
      v9 = (double)v8;
    }
    v16 = v9 + timeStep / v11;
    if (v16 >= (double)v10)
      return (double)v10;
    else
      return v16;
  }
  return parametricValue;
}

- (void)_enumerateInterpolatedPointsInRange:(id)a3 incrementBlock:(id)a4 usingBlock:(id)a5
{
  id v8;
  double (**v9)(_QWORD, double);
  void (**v10)(id, void *, _BYTE *);
  double v11;
  double v12;
  double v13;
  double v14;
  NSUInteger v15;
  double v16;
  void *v17;
  double v18;
  char v19;

  v8 = a3;
  v9 = (double (**)(_QWORD, double))a4;
  v10 = (void (**)(id, void *, _BYTE *))a5;
  objc_msgSend(v8, "lowerBound");
  if (v11 >= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  objc_msgSend(v8, "upperBound");
  v14 = v13;
  v15 = -[PKStrokePath count](self, "count");
  if (v14 >= (double)(v15 - 1))
    v14 = (double)(v15 - 1);
  if (v14 >= v12)
  {
    v19 = 0;
    while (1)
    {
      v16 = v12 >= v14 ? v14 : v12;
      -[PKStrokePath interpolatedPointAt:](self, "interpolatedPointAt:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v17, &v19);
      if (v12 >= v14)
        break;
      v18 = v9[2](v9, v12);
      if (v18 + 0.001 >= v14)
        v12 = v14;
      else
        v12 = v18;

      if (v19)
        goto LABEL_18;
    }

  }
LABEL_18:

}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByDistance:(CGFloat)distanceStep usingBlock:(void *)block
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PKStrokePath_enumerateInterpolatedPointsInRange_strideByDistance_usingBlock___block_invoke;
  v5[3] = &unk_1E7778D20;
  v5[4] = self;
  *(CGFloat *)&v5[5] = distanceStep;
  -[PKStrokePath _enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:](self, "_enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:", range, v5, block);
}

uint64_t __79__PKStrokePath_enumerateInterpolatedPointsInRange_strideByDistance_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parametricValue:offsetByDistance:", a2, *(double *)(a1 + 40));
}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByTime:(NSTimeInterval)timeStep usingBlock:(void *)block
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKStrokePath_enumerateInterpolatedPointsInRange_strideByTime_usingBlock___block_invoke;
  v5[3] = &unk_1E7778D20;
  v5[4] = self;
  *(NSTimeInterval *)&v5[5] = timeStep;
  -[PKStrokePath _enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:](self, "_enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:", range, v5, block);
}

uint64_t __75__PKStrokePath_enumerateInterpolatedPointsInRange_strideByTime_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parametricValue:offsetByTime:", a2, *(double *)(a1 + 40));
}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByParametricStep:(CGFloat)parametricStep usingBlock:(void *)block
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PKStrokePath_enumerateInterpolatedPointsInRange_strideByParametricStep_usingBlock___block_invoke;
  v5[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(CGFloat *)&v5[4] = parametricStep;
  -[PKStrokePath _enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:](self, "_enumerateInterpolatedPointsInRange:incrementBlock:usingBlock:", range, v5, block);
}

double __85__PKStrokePath_enumerateInterpolatedPointsInRange_strideByParametricStep_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

- (double)_maxWidth
{
  PKStrokePath *v2;
  double cachedMaxWidth;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  PKStrokePath *v12;
  float v14;

  v2 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&maxStrokeWidth_lock);
  cachedMaxWidth = v2->_cachedMaxWidth;

  os_unfair_lock_unlock((os_unfair_lock_t)&maxStrokeWidth_lock);
  if (cachedMaxWidth == 1.79769313e308)
  {
    v4 = -[PKStrokePath _pointsCount](v2, "_pointsCount");
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      cachedMaxWidth = 1.0;
      do
      {
        -[PKStrokePath _compressedPointAt:](v2, "_compressedPointAt:", v6, 0, 0);
        LOWORD(v7) = 0;
        v8 = (double)v7 / 10.0;
        LOWORD(v9) = 0;
        v10 = (double)v9 / 1000.0;
        if (v10 == 1.0)
          v11 = 1.0;
        else
          v11 = v10 * 1.5;
        if ((v8 + v14) * v11 > cachedMaxWidth)
          cachedMaxWidth = (v8 + v14) * v11;
        ++v6;
      }
      while (v5 != v6);
    }
    else
    {
      cachedMaxWidth = 1.0;
    }
    v12 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&maxStrokeWidth_lock);
    v2->_cachedMaxWidth = cachedMaxWidth;

    os_unfair_lock_unlock((os_unfair_lock_t)&maxStrokeWidth_lock);
  }
  return cachedMaxWidth;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PKStrokePath: %p points: %lu>"), self, -[PKStrokePath count](self, "count"));
}

- (unint64_t)_immutablePointsCount
{
  return self->_immutablePointsCount;
}

- (unint64_t)_startIndex
{
  return self->_startIndex;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (NSUUID)_strokeDataUUID
{
  return self->_strokeDataUUID;
}

- (void).cxx_destruct
{
  char *begin;

  objc_storeStrong((id *)&self->_strokeDataUUID, 0);
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_unknownFields);
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
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)deltaTo:(id)a3
{
  id v4;
  unint64_t v5;
  PKStrokePath *v6;
  PKStrokePath *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  v5 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
  if (v5 <= objc_msgSend(v4, "_immutablePointsCount"))
  {
    v7 = [PKStrokePath alloc];
    v8 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
    v9 = objc_msgSend(v4, "_pointsCount");
    v10 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
    objc_msgSend(v4, "_strokeDataUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKStrokePath initWithData:range:UUID:](v7, "initWithData:range:UUID:", v4, v8, v9 - v10, v11);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)deltaContainsNewInfo:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "_immutablePointsCount");
  v6 = 1;
  if (v5 <= -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount"))
  {
    v7 = objc_msgSend(v4, "_immutablePointsCount");
    if (v7 != -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount")
      || (v8 = objc_msgSend(v4, "count"), v8 <= -[PKStrokePath count](self, "count")))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)canApplyDelta:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;

  v4 = a3;
  if (-[PKStrokePath deltaContainsNewInfo:](self, "deltaContainsNewInfo:", v4)
    && (objc_msgSend(v4, "_startIndex") || -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount")))
  {
    if (-[PKStrokePath _startIndex](self, "_startIndex"))
    {
      v5 = 0;
    }
    else
    {
      v6 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
      v5 = v6 >= objc_msgSend(v4, "_startIndex");
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)dataApplying:(id)a3
{
  _QWORD *v4;
  PKStrokePathPointsShared *ptr;
  PKStrokePath *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  size_t v10;
  PKStrokePath *v11;
  PKStrokePath *v13;
  void *v14;
  PKStrokePath *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  size_t v31;
  uint64_t v32;
  _BYTE *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void **v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  size_t v44;
  void *v45;
  _BYTE *v46;
  char *v47;
  char *v48;
  _BYTE *v49;
  uint64_t v50;
  char v51;
  char *v52;
  char *v53;
  char *v54;
  char v55;
  char *v56;
  char *v57;
  char v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;
  PKStrokePath *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *begin;

  v4 = a3;
  if (!-[PKStrokePath canApplyDelta:](self, "canApplyDelta:", v4)
    || !-[PKStrokePath deltaContainsNewInfo:](self, "deltaContainsNewInfo:", v4))
  {
    v11 = self;
LABEL_7:
    v9 = (uint64_t)v11;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "_startIndex"))
  {
    v11 = v4;
    goto LABEL_7;
  }
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if (*((_QWORD *)ptr + 4) == *(_QWORD *)(v4[1] + 32))
  {
    v6 = [PKStrokePath alloc];
    v7 = objc_msgSend(v4, "_startIndex");
    objc_msgSend(v4, "_strokeDataUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKStrokePath initWithData:range:UUID:](v6, "initWithData:range:UUID:", self, 0, v7, v8);

  }
  else
  {
    v13 = [PKStrokePath alloc];
    objc_msgSend(v4, "_strokeDataUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKStrokePath initWithData:range:UUID:](v13, "initWithData:range:UUID:", v4, 0, 0, v14);

    v66 = *((_QWORD *)ptr + 6);
    v67 = *((_QWORD *)v15->_strokeDataPointsPrivate.constants.__ptr_ + 6);
    v16 = objc_msgSend(v4, "_startIndex");
    begin = v15->_strokeDataPointsPrivate.pointsData.__begin_;
    v17 = v15->_strokeDataPointsPrivate.pointsData.__end_ - begin;
    if (v16 * v67 <= v17)
    {
      if (v16 * v67 < v17)
        v15->_strokeDataPointsPrivate.pointsData.__end_ = &begin[v16 * v67];
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&v15->_strokeDataPointsPrivate.pointsData, v16 * v67 - v17);
      begin = v15->_strokeDataPointsPrivate.pointsData.__begin_;
    }
    v18 = 0;
    v19 = 0;
    v64 = v15;
    v20 = *((_QWORD *)v15->_strokeDataPointsPrivate.constants.__ptr_ + 4);
    v21 = *((_QWORD *)ptr + 4);
    v69 = *((_QWORD *)ptr + 1);
    v70 = self->_strokeDataPointsPrivate.pointsData.__begin_;
    do
    {
      if ((v20 & (1 << v18)) != 0)
        v19 = v18;
      ++v18;
    }
    while (v18 != 10);
    v22 = objc_msgSend(v4, "_startIndex");
    if (v22 >= 1)
    {
      v63 = v4;
      v23 = 0;
      v65 = v22;
      do
      {
        v24 = 0;
        v25 = 0;
        v26 = v23 * v66;
        v68 = v23;
        v27 = v23 * v67;
        do
        {
          v28 = 1 << v24;
          v29 = v21 & v28;
          if ((v20 & v28) != 0)
          {
            v30 = &begin[v27];
            if (v29)
            {
              memcpy(v30, &v70[v26], v31);
              v26 += v32;
            }
            else
            {
              memcpy(v30, (const void *)(v69 + v25), v31);
            }
            v27 += v32;
          }
          if (!v29)
          ++v24;
        }
        while (v24 <= v19);
        v23 = v68 + 1;
      }
      while (v68 + 1 != v65);
      v4 = v63;
    }
    v9 = (uint64_t)v64;
  }
  v34 = (char *)v4[3];
  v33 = (_BYTE *)v4[4];
  v35 = v33 - v34;
  if (v33 - v34 >= 1)
  {
    v36 = *(_QWORD *)(v9 + 24);
    v37 = *(char **)(v9 + 32);
    v38 = (void **)(v9 + 24);
    v39 = *(_QWORD *)(v9 + 40);
    if (v39 - (uint64_t)v37 >= v35)
    {
      if (v35 <= 0)
      {
        v46 = *(_BYTE **)(v9 + 32);
        v47 = &v37[v35];
        v48 = &v46[-v35];
        v49 = v46;
        if (&v46[-v35] < v37)
        {
          v50 = v33 - v34 - (v35 & ~(v35 >> 63));
          v49 = *(_BYTE **)(v9 + 32);
          do
          {
            v51 = *v48++;
            *v49++ = v51;
            --v50;
          }
          while (v50);
        }
        *(_QWORD *)(v9 + 32) = v49;
        if (v46 != v47)
          memmove(&v37[v35], v37, v46 - v47);
        v10 = v33 - v34;
        if (v33 != v34)
          memmove(v37, v34, v10);
      }
      else
      {
        if (v33 != v34)
          memmove(*(void **)(v9 + 32), v34, v33 - v34);
        *(_QWORD *)(v9 + 32) = &v37[v33 - v34];
      }
    }
    else
    {
      v40 = &v37[-v36];
      v41 = (uint64_t)&v37[v35 - v36];
      if (v41 < 0)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v42 = v39 - v36;
      v43 = 2 * v42;
      if (2 * v42 <= v41)
        v43 = v41;
      if (v42 >= 0x3FFFFFFFFFFFFFFFLL)
        v44 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v44 = v43;
      if (v44)
        v45 = operator new(v44);
      else
        v45 = 0;
      v52 = &v40[(_QWORD)v45];
      v53 = &v52[v35];
      v54 = v52;
      do
      {
        v55 = *v34++;
        *v54++ = v55;
        --v35;
      }
      while (v35);
      v56 = (char *)*v38;
      if (*v38 == v37)
      {
        v59 = v37;
      }
      else
      {
        v57 = v37;
        do
        {
          v58 = *--v57;
          *--v52 = v58;
        }
        while (v57 != v56);
        v59 = *(char **)(v9 + 32);
      }
      v60 = (char *)v45 + v44;
      v61 = v59 - v37;
      if (v59 != v37)
        memmove(v53, v37, v59 - v37);
      v62 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = v52;
      *(_QWORD *)(v9 + 32) = &v53[v61];
      *(_QWORD *)(v9 + 40) = v60;
      if (v62)
        operator delete(v62);
    }
  }
  *(_QWORD *)(v9 + 80) = objc_msgSend(v4, "_immutablePointsCount", v10);
LABEL_8:

  return (id)v9;
}

- (BOOL)saveToDataArchive:(void *)a3
{
  PKStrokePathPointsShared *ptr;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  PB::Data *v12;
  uint64_t v13;
  char *begin;
  char *v15;
  PB::Data *v16;
  uint64_t v17;
  void *v18;
  PB::Data *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void **v25;
  unsigned __int8 v26[8];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  v6 = -[PKStrokePath _pointsCount](self, "_pointsCount");
  v7 = *((_QWORD *)ptr + 4);
  v8 = *((_BYTE *)a3 + 84);
  *((_QWORD *)a3 + 4) = v6;
  *((_BYTE *)a3 + 84) = v8 | 0xC;
  *((_QWORD *)a3 + 6) = v7;
  v9 = *(_QWORD *)ptr;
  *((_BYTE *)a3 + 84) = v8 | 0x2C;
  *((_QWORD *)a3 + 9) = v9;
  if (v6)
  {
    v10 = v6;
    v11 = *((_QWORD *)ptr + 5);
    if (v11)
    {
      v12 = (PB::Data *)*((_QWORD *)a3 + 3);
      *((_BYTE *)a3 + 84) = v8 | 0x2E;
      *((_QWORD *)a3 + 2) = v11;
      if (!v12)
      {
        v13 = operator new();
        *(_QWORD *)v13 = 0;
        *(_QWORD *)(v13 + 8) = 0;
        *(_QWORD *)v26 = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 3, (void **)v13);
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)v26, 0);
        v12 = (PB::Data *)*((_QWORD *)a3 + 3);
      }
      PB::Data::assign(v12, *((const unsigned __int8 **)ptr + 1), *((const unsigned __int8 **)ptr + 2));
    }
    if (v7)
    {
      begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
      v15 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
      v16 = (PB::Data *)*((_QWORD *)a3 + 5);
      if (!v16)
      {
        v17 = operator new();
        *(_QWORD *)v17 = 0;
        *(_QWORD *)(v17 + 8) = 0;
        *(_QWORD *)v26 = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 5, (void **)v17);
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)v26, 0);
        v16 = (PB::Data *)*((_QWORD *)a3 + 5);
      }
      PB::Data::assign(v16, (const unsigned __int8 *)begin, (const unsigned __int8 *)&v15[(_QWORD)begin]);
    }
    *(_QWORD *)v26 = 0;
    v27 = 0;
    -[PKStrokePath _strokeDataUUID](self, "_strokeDataUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getUUIDBytes:", v26);

    v19 = (PB::Data *)*((_QWORD *)a3 + 8);
    if (!v19)
    {
      v20 = operator new();
      *(_QWORD *)v20 = 0;
      *(_QWORD *)(v20 + 8) = 0;
      v25 = 0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 8, (void **)v20);
      std::unique_ptr<PB::Data>::reset[abi:ne180100](&v25, 0);
      v19 = (PB::Data *)*((_QWORD *)a3 + 8);
    }
    PB::Data::assign(v19, v26, (const unsigned __int8 *)&v28);
    if (!-[PKStrokePath _inputType](self, "_inputType"))
    {
      *((_BYTE *)a3 + 84) |= 0x40u;
      *((_BYTE *)a3 + 80) = 1;
    }
    v21 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount", v25);
    if (v21 != -[PKStrokePath _startIndex](self, "_startIndex") + v10)
    {
      v22 = -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount");
      *((_BYTE *)a3 + 84) |= 1u;
      *((_QWORD *)a3 + 1) = v22;
    }
    if (-[PKStrokePath _startIndex](self, "_startIndex"))
    {
      v23 = -[PKStrokePath _startIndex](self, "_startIndex");
      *((_BYTE *)a3 + 84) |= 0x10u;
      *((_QWORD *)a3 + 7) = v23;
    }
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((_QWORD *)a3 + 11, (uint64_t *)&self->_unknownFields);
  }
  return 1;
}

- (PKStrokePath)initWithRawValue:(id)a3
{
  id v4;
  const unsigned __int8 *v5;
  PKStrokePath *v6;
  PKStrokePath *v7;
  _BYTE v9[32];
  void **v10[13];

  v10[0] = (void **)&off_1E77748A0;
  v10[3] = 0;
  v10[5] = 0;
  v10[8] = 0;
  memset((char *)&v10[10] + 4, 0, 20);
  v4 = objc_retainAutorelease(a3);
  v5 = (const unsigned __int8 *)objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  PB::Reader::Reader((PB::Reader *)v9, v5);
  if (drawing::StrokeData::readFrom((drawing::StrokeData *)v10, (PB::Reader *)v9))
  {
    v6 = -[PKStrokePath init](self, "init");
    -[PKStrokePath readStrokeDataFromArchive:](v6, "readStrokeDataFromArchive:", v10);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  drawing::StrokeData::~StrokeData(v10);

  return v7;
}

- (id)rawValue
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void **v6[13];

  v6[0] = (void **)&off_1E77748A0;
  v6[3] = 0;
  v6[5] = 0;
  v6[8] = 0;
  memset((char *)&v6[10] + 4, 0, 20);
  -[PKStrokePath saveToDataArchive:](self, "saveToDataArchive:", v6);
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::StrokeData::writeTo((drawing::StrokeData *)v6, (PB::Writer *)&v4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v4 - v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::StrokeData::~StrokeData(v6);
  return v2;
}

+ (id)strokeDataFromDataArchive:(const void *)a3
{
  PKStrokePath *v4;

  v4 = objc_alloc_init(PKStrokePath);
  -[PKStrokePath readStrokeDataFromArchive:](v4, "readStrokeDataFromArchive:", a3);
  return v4;
}

- (void)readStrokeDataFromArchive:(const void *)a3
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  char v9;
  double v10;
  int64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  size_t v17;
  char *v18;
  size_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *begin;
  char *v24;
  NSUUID *v25;
  NSUUID *strokeDataUUID;
  unint64_t v27;
  unint64_t v28;
  __int128 v29;

  v5 = operator new();
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_OWORD *)(v5 + 80) = 0u;
  *(_OWORD *)(v5 + 96) = 0u;
  std::shared_ptr<PKStrokePathPointsShared>::shared_ptr[abi:ne180100]<PKStrokePathPointsShared,void>(&v29, v5);
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)&self->_strokeDataPointsPrivate, &v29);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *((_BYTE *)a3 + 84);
  v10 = *((double *)a3 + 9);
  if ((v9 & 0x20) == 0)
    v10 = 0.0;
  *(double *)v5 = v10;
  v12 = (v9 & 0x40) == 0 || *((_BYTE *)a3 + 80) == 0;
  self->_inputType = v12;
  v13 = *((_BYTE *)a3 + 84);
  v14 = *((_QWORD *)a3 + 6);
  if ((v13 & 8) == 0)
    v14 = 0;
  *(_QWORD *)(v5 + 32) = v14;
  v15 = *((_QWORD *)a3 + 3);
  if (v15 && (v13 & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = *((_QWORD *)a3 + 2);
    v16 = *(const void **)v15;
    v17 = *(_QWORD *)(v15 + 8);
    v18 = *(char **)(v5 + 8);
    v19 = *(_QWORD *)(v5 + 16) - (_QWORD)v18;
    if (v17 <= v19)
    {
      if (v17 < v19)
        *(_QWORD *)(v5 + 16) = &v18[v17];
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)(v5 + 8), v17 - v19);
      v18 = *(char **)(v5 + 8);
    }
    memcpy(v18, v16, v17);
  }
  v20 = *((_QWORD *)a3 + 4);
  if (v20)
  {
    v21 = *((_QWORD *)a3 + 5);
    if (v21)
    {
      v22 = *(_QWORD *)(v21 + 8);
      *(_QWORD *)(v5 + 48) = v22 / v20;
      begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
      v24 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
      if (v22 <= (unint64_t)v24)
      {
        if (v22 < (unint64_t)v24)
          self->_strokeDataPointsPrivate.pointsData.__end_ = &begin[v22];
      }
      else
      {
        std::vector<unsigned char>::__append((unint64_t *)&self->_strokeDataPointsPrivate.pointsData, v22 - (_QWORD)v24);
        begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
      }
      memcpy(begin, **((const void ***)a3 + 5), *(_QWORD *)(*((_QWORD *)a3 + 5) + 8));
    }
  }
  if (*((_QWORD *)a3 + 8))
  {
    v25 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", **((_QWORD **)a3 + 8));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  strokeDataUUID = self->_strokeDataUUID;
  self->_strokeDataUUID = v25;

  PKStrokePathPointsShared::computeCachedValues((PKStrokePathPointsShared *)v5);
  if ((*((_BYTE *)a3 + 84) & 0x10) != 0)
    v27 = *((_QWORD *)a3 + 7);
  else
    v27 = 0;
  self->_startIndex = v27;
  if ((*((_BYTE *)a3 + 84) & 1) != 0)
    v28 = *((_QWORD *)a3 + 1);
  else
    v28 = self->_startIndex + -[PKStrokePath _pointsCount](self, "_pointsCount");
  self->_immutablePointsCount = v28;
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&self->_unknownFields.__ptr_, (uint64_t *)a3 + 11);
  self->_cachedMaxWidth = 1.79769313e308;
}

@end
