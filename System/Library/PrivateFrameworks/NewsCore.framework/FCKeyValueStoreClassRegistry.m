@implementation FCKeyValueStoreClassRegistry

- (Class)classForValueType:(int)a3
{
  unint64_t value;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *i;
  unint64_t v8;

  value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = a3;
      if (value <= a3)
        v5 = a3 % value;
    }
    else
    {
      v5 = (value - 1) & a3;
    }
    v6 = (uint64_t **)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v6)
    {
      for (i = *v6; i; i = (uint64_t *)*i)
      {
        v8 = i[1];
        if (v8 == a3)
        {
          if (*((_DWORD *)i + 4) == a3)
            return (Class)(id)i[3];
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= value)
              v8 %= value;
          }
          else
          {
            v8 &= value - 1;
          }
          if (v8 != v5)
            return (Class)0;
        }
      }
    }
  }
  return (Class)0;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (FCKeyValueStoreClassRegistry)init
{
  FCKeyValueStoreClassRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCKeyValueStoreClassRegistry;
  v2 = -[FCKeyValueStoreClassRegistry init](&v4, sel_init);
  if (v2)
  {
    -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
    -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
    -[FCKeyValueStoreClassRegistry registerClass:](v2, "registerClass:", objc_opt_class());
  }
  return v2;
}

- (void)registerClass:(Class)a3
{
  unint64_t v3;
  int v6;
  unint64_t v7;
  unint64_t value;
  uint8x8_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<NTPBKeyValuePair_ValueType, Class<FCKeyValueStoreCoding>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<NTPBKeyValuePair_ValueType, Class<FCKeyValueStoreCoding>>, void *>>> *p_p1;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void **v21;
  void **v22;
  uint64_t v23;
  _QWORD *next;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  void **v32;
  void **v33;
  void **v34;
  unint64_t v35;
  objc_class *v36;
  void **v37;
  objc_class *v38;

  v6 = -[objc_class keyValuePairType](a3, "keyValuePairType");
  v38 = a3;
  v7 = v6;
  value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_18;
  v9 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v3 = v6;
    if (value <= v6)
      v3 = v6 % value;
  }
  else
  {
    v3 = (value - 1) & v6;
  }
  v10 = (uint64_t **)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v3];
  if (!v10 || (v11 = *v10) == 0)
  {
LABEL_18:
    v13 = operator new(0x20uLL);
    p_p1 = &self->_registry.__table_.__p1_;
    *v13 = 0;
    v13[1] = v6;
    *((_DWORD *)v13 + 4) = v6;
    v13[3] = v38;
    v15 = (float)(self->_registry.__table_.__p2_.__value_ + 1);
    v16 = self->_registry.__table_.__p3_.__value_;
    if (value && (float)(v16 * (float)value) >= v15)
    {
LABEL_64:
      v33 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
      v34 = (void **)v33[v3];
      if (v34)
      {
        *v13 = *v34;
      }
      else
      {
        *v13 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v13;
        v33[v3] = p_p1;
        if (!*v13)
        {
LABEL_73:
          v36 = 0;
          ++self->_registry.__table_.__p2_.__value_;
          goto LABEL_74;
        }
        v35 = *(_QWORD *)(*v13 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v35 >= value)
            v35 %= value;
        }
        else
        {
          v35 &= value - 1;
        }
        v34 = &self->_registry.__table_.__bucket_list_.__ptr_.__value_[v35];
      }
      *v34 = v13;
      goto LABEL_73;
    }
    v17 = 1;
    if (value >= 3)
      v17 = (value & (value - 1)) != 0;
    v18 = v17 | (2 * value);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > value)
      goto LABEL_30;
    if (*(_QWORD *)&prime < value)
    {
      v27 = vcvtps_u32_f32((float)self->_registry.__table_.__p2_.__value_ / self->_registry.__table_.__p3_.__value_);
      if (value < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)value), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= value)
      {
        value = self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v21 = (void **)operator new(8 * *(_QWORD *)&prime);
          v22 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
          self->_registry.__table_.__bucket_list_.__ptr_.__value_ = v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_registry.__table_.__bucket_list_.__ptr_.__value_[v23++] = 0;
          while (*(_QWORD *)&prime != v23);
          next = p_p1->__value_.__next_;
          if (p_p1->__value_.__next_)
          {
            v25 = next[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            self->_registry.__table_.__bucket_list_.__ptr_.__value_[v25] = p_p1;
            v30 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  v32 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v32[v31])
                  {
                    v32[v31] = next;
                    goto LABEL_55;
                  }
                  *next = *v30;
                  *v30 = *(_QWORD *)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v31];
                  *(_QWORD *)self->_registry.__table_.__bucket_list_.__ptr_.__value_[v31] = v30;
                  v30 = next;
                }
                v31 = v25;
LABEL_55:
                next = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          value = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
        self->_registry.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v37)
          operator delete(v37);
        value = 0;
        self->_registry.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_59:
    if ((value & (value - 1)) != 0)
    {
      if (value <= v7)
        v3 = v7 % value;
      else
        v3 = v7;
    }
    else
    {
      v3 = (value - 1) & v7;
    }
    goto LABEL_64;
  }
  while (1)
  {
    v12 = v11[1];
    if (v12 == v6)
      break;
    if (v9.u32[0] > 1uLL)
    {
      if (v12 >= value)
        v12 %= value;
    }
    else
    {
      v12 &= value - 1;
    }
    if (v12 != v3)
      goto LABEL_18;
LABEL_17:
    v11 = (uint64_t *)*v11;
    if (!v11)
      goto LABEL_18;
  }
  if (*((_DWORD *)v11 + 4) != v6)
    goto LABEL_17;
  v36 = v38;
LABEL_74:

}

- (void).cxx_destruct
{
  id *next;
  id *v4;
  void **value;

  next = (id *)self->_registry.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_registry.__table_.__bucket_list_.__ptr_.__value_;
  self->_registry.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

@end
