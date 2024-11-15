@implementation PKLiveStrokePath

- (PKLiveStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8 inputPoints:(const void *)a9
{
  id v16;
  PKLiveStrokePath *v17;
  PKLiveStrokePath *v18;
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_inputPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  char *v21;
  char *v22;
  int64_t v23;
  unint64_t v24;
  uint64_t value;
  uint64_t v26;
  unint64_t v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v30;
  char *v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  char *v33;
  objc_super v35;

  v16 = a8;
  v35.receiver = self;
  v35.super_class = (Class)PKLiveStrokePath;
  v17 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](&v35, sel_initWithPoints_count_immutableCount_inputType_timestamp_UUID_, a3, a4, a5, a6, v16, a7);
  v18 = v17;
  p_inputPoints = &v17->_inputPoints;
  begin = v17->_inputPoints.__begin_;
  if (&v17->_inputPoints == a9)
  {
    v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((_QWORD *)a9 + 1);
    goto LABEL_22;
  }
  v21 = *(char **)a9;
  v22 = (char *)*((_QWORD *)a9 + 1);
  v23 = (int64_t)&v22[-*(_QWORD *)a9];
  v24 = v23 >> 7;
  value = (uint64_t)v17->_inputPoints.__end_cap_.__value_;
  if (v23 >> 7 <= (unint64_t)((value - (uint64_t)begin) >> 7))
  {
    end = v17->_inputPoints.__end_;
    v30 = (end - begin) >> 7;
    if (v30 < v24)
    {
      v31 = &v21[128 * v30];
      if (end != begin)
      {
        memmove(v17->_inputPoints.__begin_, v21, end - begin);
        begin = p_inputPoints->__end_;
      }
      v23 = v22 - v31;
      if (v22 == v31)
        goto LABEL_21;
      v32 = begin;
      v33 = v31;
      goto LABEL_20;
    }
  }
  else
  {
    if (begin)
    {
      v17->_inputPoints.__end_ = begin;
      operator delete(begin);
      value = 0;
      p_inputPoints->__begin_ = 0;
      p_inputPoints->__end_ = 0;
      p_inputPoints->__end_cap_.__value_ = 0;
    }
    if (v23 < 0)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v26 = value >> 6;
    if (value >> 6 <= v24)
      v26 = v23 >> 7;
    if ((unint64_t)value >= 0x7FFFFFFFFFFFFF80)
      v27 = 0x1FFFFFFFFFFFFFFLL;
    else
      v27 = v26;
    std::vector<PKInputPoint>::__vallocate[abi:ne180100](p_inputPoints, v27);
    begin = p_inputPoints->__end_;
  }
  if (v22 != v21)
  {
    v32 = begin;
    v33 = v21;
LABEL_20:
    memmove(v32, v33, v23);
  }
LABEL_21:
  v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v23);
  p_inputPoints->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v23);
  begin = p_inputPoints->__begin_;
LABEL_22:
  while (begin != v28)
  {
    *((_QWORD *)begin + 10) = -1;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
  }

  return v18;
}

- (id)regenerateStrokeWithInk:(id)a3 randomSeed:(unsigned int)a4 strokeClass:(Class)a5
{
  uint64_t v6;
  id v8;
  PKStrokeGenerator *v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_alloc_init(PKStrokeGenerator);
  -[PKStrokeGenerator setCaptureLiveData:](v9, "setCaptureLiveData:", 1);
  -[PKStrokeGenerator strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:](v9, "strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:", &self->_inputPoints, -[PKStrokePath _inputType](self, "_inputType"), v8, v6, a5, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_inputPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  p_inputPoints = &self->_inputPoints;
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    p_inputPoints->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  return self;
}

@end
