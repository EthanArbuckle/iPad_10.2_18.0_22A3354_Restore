@implementation _GEOFlyoverRegionVersionMap

- (_GEOFlyoverRegionVersionMap)init
{
  _GEOFlyoverRegionVersionMap *result;

  result = (_GEOFlyoverRegionVersionMap *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOFlyoverRegionVersionMap)initWithData:(id)a3
{
  id v4;
  GEOFlyoverRegionVersions *v5;
  _GEOFlyoverRegionVersionMap *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[GEOFlyoverRegionVersions initWithData:]([GEOFlyoverRegionVersions alloc], "initWithData:", v4);
    self = -[_GEOFlyoverRegionVersionMap initWithFlyoverRegions:](self, "initWithFlyoverRegions:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_GEOFlyoverRegionVersionMap)initWithFlyoverRegions:(id)a3
{
  int8x8_t prime;
  id v6;
  _GEOFlyoverRegionVersionMap *v7;
  GEOFlyoverRegionVersions *versions;
  unint64_t v9;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned long>, void *>>> *p_p1;
  unint64_t var1;
  unint64_t value;
  uint8x8_t v13;
  uint64_t **v14;
  uint64_t *i;
  unint64_t v16;
  _QWORD *v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  void **v23;
  void **v24;
  uint64_t v25;
  _QWORD *next;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  void **v34;
  void **v35;
  void **v36;
  unint64_t v37;
  void **v38;
  _GEOFlyoverRegionVersionMap *v39;
  id v41;
  objc_super v42;

  v6 = a3;
  if (!v6
    || (v42.receiver = self,
        v42.super_class = (Class)_GEOFlyoverRegionVersionMap,
        v7 = -[_GEOFlyoverRegionVersionMap init](&v42, sel_init),
        (self = v7) == 0))
  {
    v39 = 0;
    goto LABEL_91;
  }
  v41 = v6;
  objc_storeStrong((id *)&v7->_versions, a3);
  versions = self->_versions;
  if (versions)
  {
    v9 = 0;
    p_p1 = &self->_regionToIndex.__table_.__p1_;
    do
    {
      if (v9 >= versions->_regionsCount)
        break;
      var1 = versions->_regions[v9].var1;
      value = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] > 1uLL)
        {
          prime = (int8x8_t)versions->_regions[v9].var1;
          if (value <= var1)
            prime = (int8x8_t)(var1 % value);
        }
        else
        {
          prime = (int8x8_t)(((_DWORD)value - 1) & var1);
        }
        v14 = (uint64_t **)self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[*(_QWORD *)&prime];
        if (v14)
        {
          for (i = *v14; i; i = (uint64_t *)*i)
          {
            v16 = i[1];
            if (v16 == var1)
            {
              if (*((_DWORD *)i + 4) == (_DWORD)var1)
                goto LABEL_78;
            }
            else
            {
              if (v13.u32[0] > 1uLL)
              {
                if (v16 >= value)
                  v16 %= value;
              }
              else
              {
                v16 &= value - 1;
              }
              if (v16 != *(_QWORD *)&prime)
                break;
            }
          }
        }
      }
      v17 = operator new(0x20uLL);
      *v17 = 0;
      v17[1] = var1;
      *((_DWORD *)v17 + 4) = var1;
      v17[3] = v9;
      v18 = (float)(self->_regionToIndex.__table_.__p2_.__value_ + 1);
      v19 = self->_regionToIndex.__table_.__p3_.__value_;
      if (value && (float)(v19 * (float)value) >= v18)
      {
        var1 = (unint64_t)prime;
        goto LABEL_68;
      }
      v20 = (value & (value - 1)) != 0;
      if (value < 3)
        v20 = 1;
      v21 = v20 | (2 * value);
      v22 = vcvtps_u32_f32(v18 / v19);
      if (v21 <= v22)
        prime = (int8x8_t)v22;
      else
        prime = (int8x8_t)v21;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        value = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      if (*(_QWORD *)&prime <= value)
      {
        if (*(_QWORD *)&prime >= value)
          goto LABEL_64;
        v29 = vcvtps_u32_f32((float)self->_regionToIndex.__table_.__p2_.__value_ / self->_regionToIndex.__table_.__p3_.__value_);
        if (value < 3 || (v30 = (uint8x8_t)vcnt_s8((int8x8_t)value), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
        {
          v29 = std::__next_prime(v29);
        }
        else
        {
          v31 = 1 << -(char)__clz(v29 - 1);
          if (v29 >= 2)
            v29 = v31;
        }
        if (*(_QWORD *)&prime <= v29)
          prime = (int8x8_t)v29;
        if (*(_QWORD *)&prime >= value)
        {
          value = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          goto LABEL_64;
        }
        if (!*(_QWORD *)&prime)
        {
          v38 = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_;
          self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_ = 0;
          if (v38)
            operator delete(v38);
          value = 0;
          self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          goto LABEL_64;
        }
      }
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v23 = (void **)operator new(8 * *(_QWORD *)&prime);
      v24 = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_;
      self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_ = v23;
      if (v24)
        operator delete(v24);
      v25 = 0;
      self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
      do
        self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v25++] = 0;
      while (*(_QWORD *)&prime != v25);
      next = p_p1->__value_.__next_;
      if (p_p1->__value_.__next_)
      {
        v27 = next[1];
        v28 = (uint8x8_t)vcnt_s8(prime);
        v28.i16[0] = vaddlv_u8(v28);
        if (v28.u32[0] > 1uLL)
        {
          if (v27 >= *(_QWORD *)&prime)
            v27 %= *(_QWORD *)&prime;
        }
        else
        {
          v27 &= *(_QWORD *)&prime - 1;
        }
        self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v27] = p_p1;
        v32 = (_QWORD *)*next;
        if (*next)
        {
          do
          {
            v33 = v32[1];
            if (v28.u32[0] > 1uLL)
            {
              if (v33 >= *(_QWORD *)&prime)
                v33 %= *(_QWORD *)&prime;
            }
            else
            {
              v33 &= *(_QWORD *)&prime - 1;
            }
            if (v33 != v27)
            {
              v34 = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_;
              if (!v34[v33])
              {
                v34[v33] = next;
                goto LABEL_60;
              }
              *next = *v32;
              *v32 = *(_QWORD *)self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v33];
              *(_QWORD *)self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v33] = v32;
              v32 = next;
            }
            v33 = v27;
LABEL_60:
            next = v32;
            v32 = (_QWORD *)*v32;
            v27 = v33;
          }
          while (v32);
        }
      }
      value = (unint64_t)prime;
LABEL_64:
      if ((value & (value - 1)) != 0)
      {
        if (value <= var1)
          var1 %= value;
      }
      else
      {
        var1 = ((_DWORD)value - 1) & var1;
      }
LABEL_68:
      v35 = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_;
      v36 = (void **)v35[var1];
      if (v36)
      {
        *v17 = *v36;
      }
      else
      {
        *v17 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v17;
        v35[var1] = p_p1;
        if (!*v17)
          goto LABEL_77;
        v37 = *(_QWORD *)(*v17 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v37 >= value)
            v37 %= value;
        }
        else
        {
          v37 &= value - 1;
        }
        v36 = &self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v37];
      }
      *v36 = v17;
LABEL_77:
      ++self->_regionToIndex.__table_.__p2_.__value_;
      versions = self->_versions;
LABEL_78:
      ++v9;
    }
    while (versions);
  }
  self = self;
  v39 = self;
  v6 = v41;
LABEL_91:

  return v39;
}

- (GEOFlyoverRegion)regionForID:(unsigned int)a3
{
  unint64_t value;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  unint64_t v8;
  GEOFlyoverRegionVersions *versions;
  unint64_t v11;

  value = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    return 0;
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
    v5 = ((_DWORD)value - 1) & a3;
  }
  v6 = (uint64_t **)self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_[v5];
  if (!v6)
    return 0;
  v7 = *v6;
  if (!v7)
    return 0;
  while (1)
  {
    v8 = v7[1];
    if (v8 == a3)
      break;
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
      return 0;
LABEL_16:
    v7 = (uint64_t *)*v7;
    if (!v7)
      return 0;
  }
  if (*((_DWORD *)v7 + 4) != a3)
    goto LABEL_16;
  versions = self->_versions;
  if (!versions)
    return 0;
  v11 = v7[3];
  if (v11 >= versions->_regionsCount)
    return 0;
  return &versions->_regions[v11];
}

- (void)enumerateFlyoverRegions:(id)a3
{
  GEOFlyoverRegionVersions *versions;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  if (v7)
  {
    versions = self->_versions;
    if (versions)
    {
      v5 = 0;
      v6 = -1;
      do
      {
        if (++v6 >= versions->_regionsCount)
          break;
        ((void (**)(id, GEOFlyoverRegion *))v7)[2](v7, &versions->_regions[v5++]);
        versions = self->_versions;
      }
      while (versions);
    }
  }

}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_regionToIndex.__table_.__p1_.__value_.__next_;
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
  value = self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_;
  self->_regionToIndex.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  objc_storeStrong((id *)&self->_versions, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

@end
