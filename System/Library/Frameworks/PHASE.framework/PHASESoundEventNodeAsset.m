@implementation PHASESoundEventNodeAsset

- (PHASESoundEventNodeAsset)init
{
  -[PHASESoundEventNodeAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESoundEventNodeAsset)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  -[PHASESoundEventNodeAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 ownedActionTree:()unique_ptr<Phase:(std:(id)a5 :(id)a6 default_delete<Phase::ActionTree>>)a4 :ActionTree assetRegistry:details:
{
  PHASESoundEventNodeAsset *v7;
  PHASESoundEventNodeAsset *v8;
  Phase::ActionTree *v9;
  PHASESoundEventNodeAsset *v10;

  v7 = -[PHASESoundEventNodeAsset initWithUID:actionTreeWeakReference:assetRegistry:details:](self, "initWithUID:actionTreeWeakReference:assetRegistry:details:", a3, *(_QWORD *)a4.__ptr_.__value_, a5, a6);
  v8 = v7;
  if (v7)
  {
    v9 = *(Phase::ActionTree **)a4.__ptr_.__value_;
    *(_QWORD *)a4.__ptr_.__value_ = 0;
    std::unique_ptr<Phase::ActionTree>::reset[abi:ne180100]((Phase::ActionTree **)&v7->_actionTreeOwnedAsset, v9);
    v10 = v8;
  }

  return v8;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 actionTreeWeakReference:(const void *)a4 assetRegistry:(id)a5 details:(id)a6
{
  id v10;
  id v11;
  id v12;
  PHASESoundEventNodeAsset *v13;
  uint64_t v14;
  NSMutableDictionary *streamNodeFormats;
  PHASESoundEventNodeAsset *v16;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PHASESoundEventNodeAsset;
  v13 = -[PHASEAsset initWithUID:assetRegistry:](&v18, sel_initWithUID_assetRegistry_, v10, v11);
  if (v13)
  {
    objc_msgSend(v12, "streamNodeFormats");
    v14 = objc_claimAutoreleasedReturnValue();
    streamNodeFormats = v13->_streamNodeFormats;
    v13->_streamNodeFormats = (NSMutableDictionary *)v14;

    v13->_actionTreeReference = a4;
    v16 = v13;
  }

  return v13;
}

- (const)getActionTree
{
  return self->_actionTreeReference;
}

- (void)getRandomHistory:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unordered_map<unsigned long long, std::deque<int>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::deque<int>>>> *p_randomHistory;
  unint64_t value;
  uint8x8_t v7;
  unint64_t v8;
  void **v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *j;
  unint64_t v15;
  char *v16;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::deque<int>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::deque<int>>, void *>>> *p_p1;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  int8x8_t prime;
  void **v24;
  void **v25;
  uint64_t v26;
  _QWORD *next;
  unint64_t v28;
  uint8x8_t v29;
  unint64_t v30;
  uint8x8_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  void **v35;
  unint64_t v36;
  void **v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  char v43;

  v4 = a3;
  p_randomHistory = &self->_randomHistory;
  value = self->_randomHistory.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = a3;
      if (value <= a3)
        v8 = a3 % value;
    }
    else
    {
      v8 = (value - 1) & a3;
    }
    v9 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
    v10 = (_QWORD **)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v8];
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == a3)
        {
          if (i[2] == a3)
            return i + 3;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v12 >= value)
              v12 %= value;
          }
          else
          {
            v12 &= value - 1;
          }
          if (v12 != v8)
            break;
        }
      }
    }
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    if (v7.u32[0] > 1uLL)
    {
      v3 = a3;
      if (value <= a3)
        v3 = a3 % value;
    }
    else
    {
      v3 = (value - 1) & a3;
    }
    v13 = v9[v3];
    if (v13)
    {
      for (j = (_QWORD *)*v13; j; j = (_QWORD *)*j)
      {
        v15 = j[1];
        if (v15 == a3)
        {
          if (j[2] == a3)
          {
            std::deque<int>::~deque[abi:ne180100]((uint64_t)&v39);
            return 0;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v15 >= value)
              v15 %= value;
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
  }
  v16 = (char *)operator new(0x48uLL);
  p_p1 = &p_randomHistory->__table_.__p1_;
  v42[0] = v16;
  v42[1] = &p_randomHistory->__table_.__p1_;
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = v4;
  *((_QWORD *)v16 + 2) = v4;
  *(_OWORD *)(v16 + 24) = 0u;
  *(_OWORD *)(v16 + 40) = 0u;
  v39 = 0u;
  v40 = 0u;
  *((_QWORD *)v16 + 7) = 0;
  *((_QWORD *)v16 + 8) = 0;
  v41 = 0uLL;
  v43 = 1;
  v18 = (float)(p_randomHistory->__table_.__p2_.__value_ + 1);
  v19 = p_randomHistory->__table_.__p3_.__value_;
  if (value && (float)(v19 * (float)value) >= v18)
  {
    v4 = v3;
    goto LABEL_79;
  }
  v20 = 1;
  if (value >= 3)
    v20 = (value & (value - 1)) != 0;
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
    value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(_QWORD *)&prime <= value)
  {
    if (*(_QWORD *)&prime >= value)
      goto LABEL_75;
    v30 = vcvtps_u32_f32((float)p_randomHistory->__table_.__p2_.__value_ / p_randomHistory->__table_.__p3_.__value_);
    if (value < 3 || (v31 = (uint8x8_t)vcnt_s8((int8x8_t)value), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
    {
      v30 = std::__next_prime(v30);
    }
    else
    {
      v32 = 1 << -(char)__clz(v30 - 1);
      if (v30 >= 2)
        v30 = v32;
    }
    if (*(_QWORD *)&prime <= v30)
      prime = (int8x8_t)v30;
    if (*(_QWORD *)&prime >= value)
    {
      value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_75;
    }
    if (!*(_QWORD *)&prime)
    {
      v38 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
      p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v38)
        operator delete(v38);
      value = 0;
      p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_75;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v24 = (void **)operator new(8 * *(_QWORD *)&prime);
  v25 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = v24;
  if (v25)
    operator delete(v25);
  v26 = 0;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v26++] = 0;
  while (*(_QWORD *)&prime != v26);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    v28 = next[1];
    v29 = (uint8x8_t)vcnt_s8(prime);
    v29.i16[0] = vaddlv_u8(v29);
    if (v29.u32[0] > 1uLL)
    {
      if (v28 >= *(_QWORD *)&prime)
        v28 %= *(_QWORD *)&prime;
    }
    else
    {
      v28 &= *(_QWORD *)&prime - 1;
    }
    p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v28] = p_p1;
    v33 = (_QWORD *)*next;
    if (*next)
    {
      do
      {
        v34 = v33[1];
        if (v29.u32[0] > 1uLL)
        {
          if (v34 >= *(_QWORD *)&prime)
            v34 %= *(_QWORD *)&prime;
        }
        else
        {
          v34 &= *(_QWORD *)&prime - 1;
        }
        if (v34 != v28)
        {
          if (!p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34])
          {
            p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34] = next;
            goto LABEL_71;
          }
          *next = *v33;
          *v33 = *(_QWORD *)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34];
          *(_QWORD *)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34] = v33;
          v33 = next;
        }
        v34 = v28;
LABEL_71:
        next = v33;
        v33 = (_QWORD *)*v33;
        v28 = v34;
      }
      while (v33);
    }
  }
  value = (unint64_t)prime;
LABEL_75:
  if ((value & (value - 1)) != 0)
  {
    if (value <= v4)
      v4 %= value;
  }
  else
  {
    v4 &= value - 1;
  }
LABEL_79:
  v35 = (void **)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v4];
  i = (_QWORD *)v42[0];
  if (v35)
  {
    *(_QWORD *)v42[0] = *v35;
LABEL_87:
    *v35 = i;
    goto LABEL_88;
  }
  *(_QWORD *)v42[0] = p_randomHistory->__table_.__p1_.__value_.__next_;
  p_randomHistory->__table_.__p1_.__value_.__next_ = i;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v4] = p_p1;
  if (*i)
  {
    v36 = *(_QWORD *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value)
        v36 %= value;
    }
    else
    {
      v36 &= value - 1;
    }
    v35 = &p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_87;
  }
LABEL_88:
  v42[0] = 0;
  ++p_randomHistory->__table_.__p2_.__value_;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::deque<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::deque<int>>,void *>>>>::reset[abi:ne180100]((uint64_t)v42);
  std::deque<int>::~deque[abi:ne180100]((uint64_t)&v39);
  return i + 3;
}

- (unint64_t)sizeInBytes
{
  unsigned int *actionTreeReference;

  actionTreeReference = (unsigned int *)self->_actionTreeReference;
  return 4 * actionTreeReference[10]
       + 8 * (actionTreeReference[6] + (unint64_t)actionTreeReference[2] + actionTreeReference[10])
       + 464 * actionTreeReference[16]
       + actionTreeReference[20]
       + 5944 * actionTreeReference[24]
       + 120;
}

- (NSMutableDictionary)streamNodeFormats
{
  return self->_streamNodeFormats;
}

- (void).cxx_destruct
{
  unordered_map<unsigned long long, std::deque<int>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::deque<int>>>> *p_randomHistory;
  _QWORD *next;
  _QWORD *v5;
  void **value;

  objc_storeStrong((id *)&self->_streamNodeFormats, 0);
  p_randomHistory = &self->_randomHistory;
  next = self->_randomHistory.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (_QWORD *)*next;
      std::deque<int>::~deque[abi:ne180100]((uint64_t)(next + 3));
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  std::unique_ptr<Phase::ActionTree>::reset[abi:ne180100]((Phase::ActionTree **)&self->_actionTreeOwnedAsset, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end
