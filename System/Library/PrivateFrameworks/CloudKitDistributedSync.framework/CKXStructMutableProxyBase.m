@implementation CKXStructMutableProxyBase

- (BOOL)isMutable
{
  return 1;
}

- (void)commit
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  objc_super v10;
  _BYTE v11[24];

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_structInstance(self, v7, v8);
  objc_msgSend_commitStruct_(v6, v9, (uint64_t)v11);

  v10.receiver = self;
  v10.super_class = (Class)CKXStructMutableProxyBase;
  -[CKXProxyBase commit](&v10, sel_commit);
}

- (void)reset
{
  unordered_map<unsigned long long, CKXListInstance, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, CKXListInstance>>> *p_fieldTokenToListInstance;
  _QWORD *next;
  _QWORD *v5;
  unint64_t value;
  uint64_t i;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKXStructMutableProxyBase;
  -[CKXStructProxyBase reset](&v8, sel_reset);
  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  if (p_fieldTokenToListInstance->__table_.__p2_.__value_)
  {
    next = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v5 = (_QWORD *)*next;
        operator delete(next);
        next = v5;
      }
      while (v5);
    }
    p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_ = 0;
    value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    p_fieldTokenToListInstance->__table_.__p2_.__value_ = 0;
  }
}

- ($3CC19D079FD0B010EE84973AA846B91B)mutableListInstanceForField:(SEL)a3
{
  unordered_map<unsigned long long, CKXListInstance, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, CKXListInstance>>> *p_fieldTokenToListInstance;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  unint64_t value;
  uint8x8_t v17;
  void **v18;
  char *v19;
  unint64_t v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void **v27;
  void **v28;
  uint64_t v29;
  _QWORD *next;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  void **v38;
  void **v39;
  unint64_t v40;
  __int128 v41;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  __int128 v43;
  void **v44;
  _BYTE v45[24];
  __int128 v46;
  __int128 v47;

  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  if (sub_1D4BCBBB4(&self->fieldTokenToListInstance.__table_.__bucket_list_.__ptr_.__value_, a4))
    goto LABEL_79;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_backingStore(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writerForProxy_(v10, v11, (uint64_t)self);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_structInstance(self, v13, v14);
  if (v12)
  {
    objc_msgSend_beginReferencedListForReference_inStruct_((void *)v12, v15, a4, v45);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }

  value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      v12 = a4;
      if (value <= a4)
        v12 = a4 % value;
    }
    else
    {
      v12 = (value - 1) & a4;
    }
    v18 = (void **)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v12];
    if (v18)
    {
      v19 = (char *)*v18;
      if (*v18)
      {
        do
        {
          v20 = *((_QWORD *)v19 + 1);
          if (v20 == a4)
          {
            if (*((_QWORD *)v19 + 2) == a4)
              goto LABEL_78;
          }
          else
          {
            if (v17.u32[0] > 1uLL)
            {
              if (v20 >= value)
                v20 %= value;
            }
            else
            {
              v20 &= value - 1;
            }
            if (v20 != v12)
              break;
          }
          v19 = *(char **)v19;
        }
        while (v19);
      }
    }
  }
  v19 = (char *)operator new(0x38uLL);
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = a4;
  *((_QWORD *)v19 + 2) = a4;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  v21 = (float)(p_fieldTokenToListInstance->__table_.__p2_.__value_ + 1);
  v22 = p_fieldTokenToListInstance->__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    v23 = 1;
    if (value >= 3)
      v23 = (value & (value - 1)) != 0;
    v24 = v23 | (2 * value);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > value)
      goto LABEL_34;
    if (*(_QWORD *)&prime < value)
    {
      v33 = vcvtps_u32_f32((float)p_fieldTokenToListInstance->__table_.__p2_.__value_/ p_fieldTokenToListInstance->__table_.__p3_.__value_);
      if (value < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)value), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= value)
      {
        value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(_QWORD *)&prime >> 61)
            sub_1D4B18174();
          v27 = (void **)operator new(8 * *(_QWORD *)&prime);
          v28 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
          p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v29++] = 0;
          while (*(_QWORD *)&prime != v29);
          next = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
          if (next)
          {
            v31 = next[1];
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v31] = &p_fieldTokenToListInstance->__table_.__p1_;
            v36 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                if (v37 != v31)
                {
                  if (!p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37])
                  {
                    p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37] = next;
                    goto LABEL_59;
                  }
                  *next = *v36;
                  *v36 = *(_QWORD *)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(_QWORD *)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  v36 = next;
                }
                v37 = v31;
LABEL_59:
                next = v36;
                v36 = (_QWORD *)*v36;
                v31 = v37;
              }
              while (v36);
            }
          }
          value = (unint64_t)prime;
          goto LABEL_63;
        }
        v44 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v44)
          operator delete(v44);
        value = 0;
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_63:
    if ((value & (value - 1)) != 0)
    {
      if (value <= a4)
        v12 = a4 % value;
      else
        v12 = a4;
    }
    else
    {
      v12 = (value - 1) & a4;
    }
  }
  v38 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
  v39 = (void **)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v12];
  if (v39)
  {
    *(_QWORD *)v19 = *v39;
  }
  else
  {
    *(_QWORD *)v19 = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
    p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_ = v19;
    v38[v12] = &p_fieldTokenToListInstance->__table_.__p1_;
    if (!*(_QWORD *)v19)
      goto LABEL_77;
    v40 = *(_QWORD *)(*(_QWORD *)v19 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v40 >= value)
        v40 %= value;
    }
    else
    {
      v40 &= value - 1;
    }
    v39 = &p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v40];
  }
  *v39 = v19;
LABEL_77:
  ++p_fieldTokenToListInstance->__table_.__p2_.__value_;
LABEL_78:
  v41 = v47;
  *(_OWORD *)(v19 + 24) = v46;
  *(_OWORD *)(v19 + 40) = v41;
LABEL_79:
  result = ($3CC19D079FD0B010EE84973AA846B91B *)sub_1D4BCBBB4(p_fieldTokenToListInstance, a4);
  if (!result)
    sub_1D4B1F118("unordered_map::at: key not found");
  v43 = *(_OWORD *)&result[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var3;
  *(_OWORD *)&retstr->var2 = v43;
  return result;
}

- (void).cxx_destruct
{
  unordered_map<unsigned long long, CKXListInstance, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, CKXListInstance>>> *p_fieldTokenToListInstance;
  _QWORD *next;
  _QWORD *v4;
  void **value;

  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  next = self->fieldTokenToListInstance.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
  p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

@end
