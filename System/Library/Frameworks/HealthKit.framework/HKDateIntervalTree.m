@implementation HKDateIntervalTree

- (HKDateIntervalTree)init
{
  id v2;
  uint64_t *v3;
  uint64_t *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKDateIntervalTree;
  v2 = -[HKDateIntervalTree init](&v6, sel_init);
  if (v2)
  {
    v3 = (uint64_t *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v5 = 0;
    std::unique_ptr<HKIntervalTree<double>>::reset[abi:ne180100]((uint64_t **)v2 + 1, v3);
    std::unique_ptr<HKIntervalTree<double>>::reset[abi:ne180100](&v5, 0);
    *(_BYTE *)(*((_QWORD *)v2 + 1) + 8) = 1;
  }
  return (HKDateIntervalTree *)v2;
}

- (void)setMergeIntervals:(BOOL)a3
{
  *((_BYTE *)self->_tree.__ptr_.__value_ + 8) = a3;
}

- (BOOL)mergeIntervals
{
  return *((_BYTE *)self->_tree.__ptr_.__value_ + 8);
}

- (void)insertIntervalWithStartTime:(double)a3 endTime:(double)a4
{
  uint64_t *value;
  double v5;
  double v6[2];

  value = (uint64_t *)self->_tree.__ptr_.__value_;
  if (a4 >= a3)
    v5 = a3;
  else
    v5 = a4;
  if (a3 < a4)
    a3 = a4;
  v6[0] = v5;
  v6[1] = a3;
  HKIntervalTree<double>::insertInterval(value, v6, *(__n128 *)&a3);
}

- (void)insertInterval:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v9, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[HKDateIntervalTree insertIntervalWithStartTime:endTime:](self, "insertIntervalWithStartTime:endTime:", v6, v8);

}

- (BOOL)hasOverlapWithInterval:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  LOBYTE(self) = -[HKDateIntervalTree hasOverlapWithStartTime:endTime:](self, "hasOverlapWithStartTime:endTime:", v7, v9);

  return (char)self;
}

- (BOOL)hasOverlapWithStartTime:(double)a3 endTime:(double)a4
{
  uint64_t *value;
  double v5;
  double v7[2];

  value = (uint64_t *)self->_tree.__ptr_.__value_;
  if (a4 >= a3)
    v5 = a3;
  else
    v5 = a4;
  if (a3 < a4)
    a3 = a4;
  v7[0] = v5;
  v7[1] = a3;
  return HKIntervalTree<double>::hasOverlapWithInterval(value, v7);
}

- (id)mergedIntervals
{
  uint64_t *value;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  value = (uint64_t *)self->_tree.__ptr_.__value_;
  v9[0] = &off_1E37EDA38;
  v9[1] = &v8;
  v10 = v9;
  HKIntervalTree<double>::_enumeratePreOrder((uint64_t)value, *value, (uint64_t)v9);
  v4 = v10;
  if (v10 == v9)
  {
    v5 = 4;
    v4 = v9;
    goto LABEL_5;
  }
  if (v10)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

- (void).cxx_destruct
{
  std::unique_ptr<HKIntervalTree<double>>::reset[abi:ne180100]((uint64_t **)&self->_tree, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)mergedIntervals
{
}

- (_QWORD)mergedIntervals
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E37EDA38;
  result[1] = v3;
  return result;
}

- (uint64_t)mergedIntervals
{
    return a1 + 8;
  else
    return 0;
}

@end
