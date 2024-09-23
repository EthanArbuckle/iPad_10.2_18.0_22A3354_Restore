@implementation ADImageDescriptor

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

+ (id)descriptorForSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  ADImageDescriptor *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[ADImageDescriptor initWithSupportedSizes:pixelFormat:]([ADImageDescriptor alloc], "initWithSupportedSizes:pixelFormat:", v5, v4);

  return v6;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->_sizeForLayout.__table_.__p1_.__value_.__next_;
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
  value = self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
  self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (ADImageDescriptor)initWithSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4
{
  unint64_t v4;
  ADImageDescriptor *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<ADLayout, CGSize>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<ADLayout, CGSize>, void *>>> *p_p1;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t value;
  uint8x8_t v21;
  _QWORD **v22;
  _QWORD *i;
  unint64_t v24;
  float v25;
  float v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  int8x8_t prime;
  void **v31;
  void **v32;
  uint64_t v33;
  _QWORD *next;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint8x8_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  void **v42;
  void **v43;
  void **v44;
  unint64_t v45;
  void **v46;
  uint64_t v47;
  unsigned int v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v55.receiver = self;
  v55.super_class = (Class)ADImageDescriptor;
  v7 = -[ADImageDescriptor init](&v55, sel_init);
  if (v7)
  {
    v49 = a4;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v8 = v50;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v52;
      p_p1 = &v7->_sizeForLayout.__table_.__p1_;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v12);
          objc_msgSend(v13, "size");
          v15 = v14;
          v17 = v16;
          v18 = objc_msgSend(v13, "layout");
          v19 = v18;
          value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            v21 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              v4 = v18;
              if (v18 >= value)
                v4 = v18 % value;
            }
            else
            {
              v4 = (value - 1) & v18;
            }
            v22 = (_QWORD **)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v4];
            if (v22)
            {
              for (i = *v22; i; i = (_QWORD *)*i)
              {
                v24 = i[1];
                if (v24 == v18)
                {
                  if (i[2] == v18)
                    goto LABEL_79;
                }
                else
                {
                  if (v21.u32[0] > 1uLL)
                  {
                    if (v24 >= value)
                      v24 %= value;
                  }
                  else
                  {
                    v24 &= value - 1;
                  }
                  if (v24 != v4)
                    break;
                }
              }
            }
          }
          i = operator new(0x28uLL);
          *i = 0;
          i[1] = v19;
          i[3] = 0;
          i[4] = 0;
          i[2] = v19;
          v25 = (float)(v7->_sizeForLayout.__table_.__p2_.__value_ + 1);
          v26 = v7->_sizeForLayout.__table_.__p3_.__value_;
          if (!value || (float)(v26 * (float)value) < v25)
          {
            v27 = (value & (value - 1)) != 0;
            if (value < 3)
              v27 = 1;
            v28 = v27 | (2 * value);
            v29 = vcvtps_u32_f32(v25 / v26);
            if (v28 <= v29)
              prime = (int8x8_t)v29;
            else
              prime = (int8x8_t)v28;
            if (*(_QWORD *)&prime == 1)
            {
              prime = (int8x8_t)2;
            }
            else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
            {
              prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
              value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            }
            if (*(_QWORD *)&prime <= value)
            {
              if (*(_QWORD *)&prime < value)
              {
                v37 = vcvtps_u32_f32((float)v7->_sizeForLayout.__table_.__p2_.__value_ / v7->_sizeForLayout.__table_.__p3_.__value_);
                if (value < 3
                  || (v38 = (uint8x8_t)vcnt_s8((int8x8_t)value), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
                {
                  v37 = std::__next_prime(v37);
                }
                else
                {
                  v39 = 1 << -(char)__clz(v37 - 1);
                  if (v37 >= 2)
                    v37 = v39;
                }
                if (*(_QWORD *)&prime <= v37)
                  prime = (int8x8_t)v37;
                if (*(_QWORD *)&prime >= value)
                {
                  value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
                }
                else
                {
                  if (prime)
                    goto LABEL_35;
                  v46 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
                  v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = 0;
                  if (v46)
                    operator delete(v46);
                  value = 0;
                  v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
                }
              }
            }
            else
            {
LABEL_35:
              if (*(_QWORD *)&prime >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v31 = (void **)operator new(8 * *(_QWORD *)&prime);
              v32 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
              v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = v31;
              if (v32)
                operator delete(v32);
              v33 = 0;
              v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
              while (*(_QWORD *)&prime != v33);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                v35 = next[1];
                v36 = (uint8x8_t)vcnt_s8(prime);
                v36.i16[0] = vaddlv_u8(v36);
                if (v36.u32[0] > 1uLL)
                {
                  if (v35 >= *(_QWORD *)&prime)
                    v35 %= *(_QWORD *)&prime;
                }
                else
                {
                  v35 &= *(_QWORD *)&prime - 1;
                }
                v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v35] = p_p1;
                v40 = (_QWORD *)*next;
                if (*next)
                {
                  do
                  {
                    v41 = v40[1];
                    if (v36.u32[0] > 1uLL)
                    {
                      if (v41 >= *(_QWORD *)&prime)
                        v41 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v41 &= *(_QWORD *)&prime - 1;
                    }
                    if (v41 != v35)
                    {
                      v42 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
                      if (!v42[v41])
                      {
                        v42[v41] = next;
                        goto LABEL_60;
                      }
                      *next = *v40;
                      *v40 = *(_QWORD *)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v41];
                      *(_QWORD *)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v41] = v40;
                      v40 = next;
                    }
                    v41 = v35;
LABEL_60:
                    next = v40;
                    v40 = (_QWORD *)*v40;
                    v35 = v41;
                  }
                  while (v40);
                }
              }
              value = (unint64_t)prime;
            }
            if ((value & (value - 1)) != 0)
            {
              if (v19 >= value)
                v4 = v19 % value;
              else
                v4 = v19;
            }
            else
            {
              v4 = (value - 1) & v19;
            }
          }
          v43 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
          v44 = (void **)v43[v4];
          if (v44)
          {
            *i = *v44;
LABEL_77:
            *v44 = i;
            goto LABEL_78;
          }
          *i = p_p1->__value_.__next_;
          p_p1->__value_.__next_ = i;
          v43[v4] = p_p1;
          if (*i)
          {
            v45 = *(_QWORD *)(*i + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v45 >= value)
                v45 %= value;
            }
            else
            {
              v45 &= value - 1;
            }
            v44 = &v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v45];
            goto LABEL_77;
          }
LABEL_78:
          ++v7->_sizeForLayout.__table_.__p2_.__value_;
LABEL_79:
          i[3] = v15;
          i[4] = v17;
          ++v12;
        }
        while (v12 != v9);
        v47 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        v9 = v47;
      }
      while (v47);
    }

    v7->_pixelFormat = v49;
  }

  return v7;
}

- (CGSize)sizeForLayout:(unint64_t)a3
{
  double *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  CGSize result;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (double *)std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::find<ADLayout>(&self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v4)
  {
    v6 = v4[3];
    v5 = v4[4];
  }
  else
  {
    v6 = 0.0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[ADLayoutUtils layoutAsString:](ADLayoutUtils, "layoutAsString:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported layout: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    v5 = 0.0;
  }
  v7 = v6;
  result.height = v5;
  result.width = v7;
  return result;
}

- (id)cloneWithDifferentFormat:(unsigned int)a3
{
  ADImageDescriptor *v5;
  ADImageDescriptor *v6;
  char *next;
  unint64_t value;
  uint64_t i;
  char *v10;
  unint64_t v11;
  char *v12;
  _QWORD *inserted;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  char *v19;

  v5 = (ADImageDescriptor *)objc_opt_new();
  v6 = v5;
  v5->_pixelFormat = a3;
  if (v5 != self)
  {
    v5->_sizeForLayout.__table_.__p3_.__value_ = self->_sizeForLayout.__table_.__p3_.__value_;
    next = (char *)self->_sizeForLayout.__table_.__p1_.__value_.__next_;
    value = v5->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (!value)
      goto LABEL_10;
    for (i = 0; i != value; v5->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[i++] = 0)
      ;
    v10 = (char *)v5->_sizeForLayout.__table_.__p1_.__value_.__next_;
    v5->_sizeForLayout.__table_.__p1_.__value_.__next_ = 0;
    v5->_sizeForLayout.__table_.__p2_.__value_ = 0;
    if (v10)
    {
      while (next)
      {
        v11 = *((_QWORD *)next + 2);
        *((_QWORD *)v10 + 2) = v11;
        *(_OWORD *)(v10 + 24) = *(_OWORD *)(next + 24);
        v12 = *(char **)v10;
        *((_QWORD *)v10 + 1) = v11;
        inserted = std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_prepare((uint64_t)&v6->_sizeForLayout, v11, (_QWORD *)v10 + 2);
        std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_perform(&v6->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, v10, inserted);
        next = *(char **)next;
        v10 = v12;
        if (!v12)
          goto LABEL_10;
      }
      do
      {
        v19 = *(char **)v10;
        operator delete(v10);
        v10 = v19;
      }
      while (v19);
    }
    else
    {
LABEL_10:
      while (next)
      {
        v14 = operator new(0x28uLL);
        *v14 = 0;
        v15 = *((_QWORD *)next + 4);
        *((_OWORD *)v14 + 1) = *((_OWORD *)next + 1);
        v14[4] = v15;
        v16 = v14[2];
        v14[1] = v16;
        v17 = std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_prepare((uint64_t)&v6->_sizeForLayout, v16, v14 + 2);
        std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_perform(&v6->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, v14, v17);
        next = *(char **)next;
      }
    }
  }
  return v6;
}

- (BOOL)supportsLayout:(unint64_t)a3
{
  return a3 != 254
      && std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::find<ADLayout>(&self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (unint64_t)layoutForSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t v6;
  float v7;
  double v8;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  v6 = +[ADLayoutUtils layoutForSize:](ADLayoutUtils, "layoutForSize:");
  if (!-[ADImageDescriptor supportsLayout:](self, "supportsLayout:", v6))
  {
    -[ADImageDescriptor sizeForLayout:](self, "sizeForLayout:", 255);
    v7 = width / height;
    v10 = v8 / v9;
    *(float *)&v9 = v10;
    *(float *)&v10 = v7;
    if (+[ADLayoutUtils aspectRatio:matchesAspectRatio:](ADLayoutUtils, "aspectRatio:matchesAspectRatio:", v10, v9))
    {
      return 255;
    }
    else
    {
      return 254;
    }
  }
  return v6;
}

+ (id)descriptorWithDefaultSize:(CGSize)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v4 = *(_QWORD *)&a4;
  v9[1] = *MEMORY[0x24BDAC8D0];
  +[ADImageSupportedSize createWithSize:andLayout:](ADImageSupportedSize, "createWithSize:andLayout:", 255, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADImageDescriptor descriptorForSupportedSizes:pixelFormat:](ADImageDescriptor, "descriptorForSupportedSizes:pixelFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
