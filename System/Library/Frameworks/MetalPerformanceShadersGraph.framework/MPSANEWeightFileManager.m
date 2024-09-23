@implementation MPSANEWeightFileManager

- (MPSANEWeightFileManager)initWithFilePath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  MPSANEWeightFileManager *v12;
  MPSANEWeightFileManager *v13;
  uint64_t v14;
  NSMutableArray *weights;
  uint64_t v16;
  NSMutableDictionary *weightsInMemoryDictionary;
  int v19;
  objc_super v20;
  id v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@net.weights"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileExistsAtPath:", v7) & 1) == 0)
  {
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v9 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v21);
    v10 = v21;
    if (v9)
    {
      if ((objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, 0, 0) & 1) != 0)
      {

        goto LABEL_7;
      }
      v19 = 44;
    }
    else
    {
      v19 = 47;
    }
    __assert_rtn("-[MPSANEWeightFileManager initWithFilePath:]", "MPSGraphANEUtils.mm", v19, "0");
  }
  if ((objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, 0, 0) & 1) == 0)
    __assert_rtn("-[MPSANEWeightFileManager initWithFilePath:]", "MPSGraphANEUtils.mm", 55, "0");
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    __assert_rtn("-[MPSANEWeightFileManager initWithFilePath:]", "MPSGraphANEUtils.mm", 62, "0");
  v20.receiver = self;
  v20.super_class = (Class)MPSANEWeightFileManager;
  v12 = -[MPSANEWeightFileManager init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_filePath, v7);
    objc_storeStrong((id *)&v13->_fileDirectoryPath, a3);
    objc_storeStrong((id *)&v13->_fileHandle, v11);
    v13->_currentDataSizeInBytes = 0;
    v13->_currentPaddingSizeInBytes = 0;
    v13->_currentFileSizeInBytes = 0;
    v14 = objc_msgSend(&unk_1E0E9B5C0, "mutableCopy");
    weights = v13->_weights;
    v13->_weights = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    weightsInMemoryDictionary = v13->_weightsInMemoryDictionary;
    v13->_weightsInMemoryDictionary = (NSMutableDictionary *)v16;

  }
  return v13;
}

+ (id)weightFileOpsAtPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:", v4);

  return v5;
}

- (int64_t)writeData:(id)a3 value:(Value)a4 index:(unint64_t *)a5
{
  unint64_t v8;
  unordered_map<void *, unsigned long, std::hash<void *>, std::equal_to<void *>, std::allocator<std::pair<void *const, unsigned long>>> *p_weightsDataIndex;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  int64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  uint64_t ***v25;
  uint64_t **v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t ***v35;
  uint64_t **v36;
  unint64_t v37;
  uint64_t *v38;
  Value *v39;
  float v40;
  float v41;
  void **v42;
  ValueImpl **v43;
  _BOOL8 v44;
  unint64_t v45;
  unint64_t v46;
  size_t prime;
  void *v48;
  char v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void **v58;
  void **v59;
  uint64_t v60;
  _QWORD *next;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<void *, unsigned long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<void *, unsigned long>, void *>>> *p_p1;
  size_t v63;
  size_t v64;
  size_t v65;
  _QWORD *i;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint8x8_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  size_t v74;
  uint64_t v75;
  void **v76;
  unint64_t v77;
  void *v78;
  NSMutableDictionary *weightsInMemoryDictionary;
  void *v80;
  int v82;
  unint64_t v83;
  id v84;
  id v85;
  void *v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t)a3;
  if (!self->_useInMemory)
  {
    *a5 = 0;
    v17 = -[MPSANEWeightFileManager currentFileSizeInBytes](self, "currentFileSizeInBytes");
    v18 = -[MPSANEWeightFileManager currentFileSizeInBytes](self, "currentFileSizeInBytes");
    v19 = 4 - (v18 & 3);
    if ((v18 & 3) != 0)
      v20 = 4 - (v18 & 3);
    else
      v20 = 0;
    if ((v18 & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(4 - (v18 & 3), 1uLL, 0x100004077774924uLL), v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSANEWeightFileManager fileHandle](self, "fileHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0;
      v23 = objc_msgSend(v22, "writeData:error:", v21, &v85);
      v24 = v85;

      if ((v23 & 1) == 0)
        __assert_rtn("-[MPSANEWeightFileManager writeData:value:index:]", "MPSGraphANEUtils.mm", 128, "0");

      v17 += v19;
    }
    else
    {
      v24 = 0;
    }
    -[MPSANEWeightFileManager fileHandle](self, "fileHandle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v49 = objc_msgSend(v48, "writeData:error:", v8, &v84);
    v50 = v84;

    if ((v49 & 1) == 0)
      __assert_rtn("-[MPSANEWeightFileManager writeData:value:index:]", "MPSGraphANEUtils.mm", 136, "0");
    v51 = objc_msgSend((id)v8, "length");
    -[MPSANEWeightFileManager setCurrentPaddingSizeInBytes:](self, "setCurrentPaddingSizeInBytes:", -[MPSANEWeightFileManager currentPaddingSizeInBytes](self, "currentPaddingSizeInBytes") + v20);
    -[MPSANEWeightFileManager setCurrentDataSizeInBytes:](self, "setCurrentDataSizeInBytes:", -[MPSANEWeightFileManager currentDataSizeInBytes](self, "currentDataSizeInBytes") + v51);
    -[MPSANEWeightFileManager setCurrentFileSizeInBytes:](self, "setCurrentFileSizeInBytes:", v51 + v20 + -[MPSANEWeightFileManager currentFileSizeInBytes](self, "currentFileSizeInBytes"));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSANEWeightFileManager filePath](self, "filePath");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "attributesOfItemAtPath:error:", v53, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "fileSize");

    if (-[MPSANEWeightFileManager currentFileSizeInBytes](self, "currentFileSizeInBytes") == v55)
    {
      v56 = -[MPSANEWeightFileManager currentFileSizeInBytes](self, "currentFileSizeInBytes");
      v57 = -[MPSANEWeightFileManager currentDataSizeInBytes](self, "currentDataSizeInBytes");
      if (v56 == -[MPSANEWeightFileManager currentPaddingSizeInBytes](self, "currentPaddingSizeInBytes") + v57)
      {

        goto LABEL_127;
      }
      v82 = 158;
    }
    else
    {
      v82 = 149;
    }
    __assert_rtn("-[MPSANEWeightFileManager writeData:value:index:]", "MPSGraphANEUtils.mm", v82, "0");
  }
  p_weightsDataIndex = &self->_weightsDataIndex;
  v10 = 0x9DDFEA08EB382D69 * (((8 * LODWORD(a4.impl)) + 8) ^ ((unint64_t)a4.impl >> 32));
  v11 = 0x9DDFEA08EB382D69 * (((unint64_t)a4.impl >> 32) ^ (v10 >> 47) ^ v10);
  v12 = v11 ^ (v11 >> 47);
  v13 = 0x9DDFEA08EB382D69 * v12;
  v14 = self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v14)
  {
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      v16 = 0x9DDFEA08EB382D69 * v12;
      if (v13 >= v14)
        v16 = v13 % v14;
    }
    else
    {
      v16 = (v14 - 1) & v13;
    }
    v25 = (uint64_t ***)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v16];
    if (v25)
    {
      v26 = *v25;
      if (v26)
      {
        if (v15.u32[0] < 2uLL)
        {
          v27 = v14 - 1;
          while (1)
          {
            v29 = v26[1];
            if (v29 == (uint64_t *)v13)
            {
              if (v26[2] == (uint64_t *)a4.impl)
                goto LABEL_106;
            }
            else if (((unint64_t)v29 & v27) != v16)
            {
              goto LABEL_28;
            }
            v26 = (uint64_t **)*v26;
            if (!v26)
              goto LABEL_28;
          }
        }
        do
        {
          v28 = (unint64_t)v26[1];
          if (v28 == v13)
          {
            if (v26[2] == (uint64_t *)a4.impl)
            {
LABEL_106:
              v17 = 0;
              *a5 = (unint64_t)v26[3];
              goto LABEL_127;
            }
          }
          else
          {
            if (v28 >= v14)
              v28 %= v14;
            if (v28 != v16)
              break;
          }
          v26 = (uint64_t **)*v26;
        }
        while (v26);
      }
    }
  }
LABEL_28:
  v30 = -[NSMutableArray count](self->_weights, "count");
  *a5 = v30;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("net.weights.%lu"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v8;
  -[NSMutableArray addObject:](self->_weights, "addObject:", v31);
  v32 = *a5;
  v33 = self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v33)
  {
    v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
    v34.i16[0] = vaddlv_u8(v34);
    if (v34.u32[0] > 1uLL)
    {
      v8 = v13;
      if (v13 >= v33)
        v8 = v13 % v33;
    }
    else
    {
      v8 = (v33 - 1) & v13;
    }
    v35 = (uint64_t ***)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v8];
    if (v35)
    {
      v36 = *v35;
      if (v36)
      {
        if (v34.u32[0] < 2uLL)
        {
          while (1)
          {
            v38 = v36[1];
            if (v38 == (uint64_t *)v13)
            {
              if (v36[2] == (uint64_t *)a4.impl)
                goto LABEL_126;
            }
            else if (((unint64_t)v38 & (v33 - 1)) != v8)
            {
              goto LABEL_49;
            }
            v36 = (uint64_t **)*v36;
            if (!v36)
              goto LABEL_49;
          }
        }
        do
        {
          v37 = (unint64_t)v36[1];
          if (v37 == v13)
          {
            if (v36[2] == (uint64_t *)a4.impl)
              goto LABEL_126;
          }
          else
          {
            if (v37 >= v33)
              v37 %= v33;
            if (v37 != v8)
              break;
          }
          v36 = (uint64_t **)*v36;
        }
        while (v36);
      }
    }
  }
LABEL_49:
  v39 = (Value *)operator new(0x20uLL);
  v39->impl = 0;
  v39[1].impl = (ValueImpl *)v13;
  v39[2].impl = a4.impl;
  v39[3].impl = (ValueImpl *)v32;
  v40 = (float)(self->_weightsDataIndex.__table_.__p2_.__value_ + 1);
  v41 = self->_weightsDataIndex.__table_.__p3_.__value_;
  if (!v33 || (float)(v41 * (float)v33) < v40)
  {
    v44 = 1;
    if (v33 >= 3)
      v44 = (v33 & (v33 - 1)) != 0;
    v45 = v44 | (2 * v33);
    v46 = vcvtps_u32_f32(v40 / v41);
    if (v45 <= v46)
      prime = v46;
    else
      prime = v45;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v33 = self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (prime > v33)
    {
LABEL_68:
      if (prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v58 = (void **)operator new(8 * prime);
      v59 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
      p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_ = v58;
      if (v59)
        operator delete(v59);
      v60 = 0;
      self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = prime;
      do
        p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v60++] = 0;
      while (prime != v60);
      p_p1 = &self->_weightsDataIndex.__table_.__p1_;
      next = self->_weightsDataIndex.__table_.__p1_.__value_.__next_;
      if (!next)
        goto LABEL_100;
      v63 = next[1];
      v64 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        v65 = v63 & v64;
        p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v65] = p_p1;
        for (i = (_QWORD *)*next; *next; i = (_QWORD *)*next)
        {
          v67 = i[1] & v64;
          if (v67 == v65)
          {
            next = i;
          }
          else if (p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v67])
          {
            *next = *i;
            v68 = v67;
            *i = *(_QWORD *)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v68];
            *(_QWORD *)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v68] = i;
          }
          else
          {
            p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v67] = next;
            next = i;
            v65 = v67;
          }
        }
        goto LABEL_100;
      }
      if (v63 >= prime)
        v63 %= prime;
      p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v63] = p_p1;
      v72 = (_QWORD *)*next;
      if (!*next)
      {
LABEL_100:
        v33 = prime;
        v75 = prime - 1;
        if ((prime & (prime - 1)) != 0)
          goto LABEL_101;
        goto LABEL_117;
      }
      while (1)
      {
        v74 = v72[1];
        if (v74 >= prime)
          v74 %= prime;
        if (v74 == v63)
          goto LABEL_94;
        if (p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v74])
        {
          *next = *v72;
          v73 = v74;
          *v72 = *(_QWORD *)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v73];
          *(_QWORD *)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v73] = v72;
          v72 = next;
LABEL_94:
          next = v72;
          v72 = (_QWORD *)*v72;
          if (!v72)
            goto LABEL_100;
        }
        else
        {
          p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v74] = next;
          next = v72;
          v72 = (_QWORD *)*v72;
          v63 = v74;
          if (!v72)
            goto LABEL_100;
        }
      }
    }
    if (prime < v33)
    {
      v69 = vcvtps_u32_f32((float)self->_weightsDataIndex.__table_.__p2_.__value_ / self->_weightsDataIndex.__table_.__p3_.__value_);
      if (v33 < 3 || (v70 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v70.i16[0] = vaddlv_u8(v70), v70.u32[0] > 1uLL))
      {
        v69 = std::__next_prime(v69);
      }
      else
      {
        v71 = 1 << -(char)__clz(v69 - 1);
        if (v69 >= 2)
          v69 = v71;
      }
      if (prime <= v69)
        prime = v69;
      if (prime < v33)
      {
        if (!prime)
        {
          v76 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
          p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_ = 0;
          if (v76)
            operator delete(v76);
          v33 = 0;
          self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          v75 = -1;
          goto LABEL_117;
        }
        goto LABEL_68;
      }
      v33 = self->_weightsDataIndex.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    v75 = v33 - 1;
    if ((v33 & (v33 - 1)) != 0)
    {
LABEL_101:
      if (v13 >= v33)
      {
        v8 = v13 % v33;
        v42 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
        v43 = (ValueImpl **)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v13 % v33];
        if (v43)
          goto LABEL_52;
      }
      else
      {
        v8 = v13;
        v42 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
        v43 = (ValueImpl **)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v13];
        if (v43)
          goto LABEL_52;
      }
      goto LABEL_118;
    }
LABEL_117:
    v8 = v75 & v13;
    v42 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
    v43 = (ValueImpl **)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v75 & v13];
    if (v43)
      goto LABEL_52;
    goto LABEL_118;
  }
  v42 = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
  v43 = (ValueImpl **)p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v8];
  if (v43)
  {
LABEL_52:
    v39->impl = *v43;
    goto LABEL_124;
  }
LABEL_118:
  v39->impl = (ValueImpl *)self->_weightsDataIndex.__table_.__p1_.__value_.__next_;
  self->_weightsDataIndex.__table_.__p1_.__value_.__next_ = v39;
  v42[v8] = &self->_weightsDataIndex.__table_.__p1_;
  if (!v39->impl)
    goto LABEL_125;
  v77 = *((_QWORD *)v39->impl + 1);
  if ((v33 & (v33 - 1)) != 0)
  {
    if (v77 >= v33)
      v77 %= v33;
  }
  else
  {
    v77 &= v33 - 1;
  }
  v43 = (ValueImpl **)&p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_[v77];
LABEL_124:
  *v43 = (ValueImpl *)v39;
LABEL_125:
  ++self->_weightsDataIndex.__table_.__p2_.__value_;
LABEL_126:
  v8 = v83;
  v86 = v31;
  v87[0] = v83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  weightsInMemoryDictionary = self->_weightsInMemoryDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a5);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](weightsInMemoryDictionary, "setObject:forKeyedSubscript:", v78, v80);

  v17 = 0;
LABEL_127:

  return v17;
}

- (void)releaseWeightsData
{
  NSMutableDictionary *weightsInMemoryDictionary;

  weightsInMemoryDictionary = self->_weightsInMemoryDictionary;
  self->_weightsInMemoryDictionary = 0;

}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSString)fileDirectoryPath
{
  return self->_fileDirectoryPath;
}

- (NSMutableArray)weights
{
  return self->_weights;
}

- (NSMutableDictionary)weightsInMemoryDictionary
{
  return self->_weightsInMemoryDictionary;
}

- (unint64_t)currentDataSizeInBytes
{
  return self->_currentDataSizeInBytes;
}

- (void)setCurrentDataSizeInBytes:(unint64_t)a3
{
  self->_currentDataSizeInBytes = a3;
}

- (unint64_t)currentPaddingSizeInBytes
{
  return self->_currentPaddingSizeInBytes;
}

- (void)setCurrentPaddingSizeInBytes:(unint64_t)a3
{
  self->_currentPaddingSizeInBytes = a3;
}

- (unint64_t)currentFileSizeInBytes
{
  return self->_currentFileSizeInBytes;
}

- (void)setCurrentFileSizeInBytes:(unint64_t)a3
{
  self->_currentFileSizeInBytes = a3;
}

- (BOOL)useInMemory
{
  return self->_useInMemory;
}

- (void)setUseInMemory:(BOOL)a3
{
  self->_useInMemory = a3;
}

- (void).cxx_destruct
{
  unordered_map<void *, unsigned long, std::hash<void *>, std::equal_to<void *>, std::allocator<std::pair<void *const, unsigned long>>> *p_weightsDataIndex;
  _QWORD *next;
  _QWORD *v5;
  void **value;

  objc_storeStrong((id *)&self->_weightsInMemoryDictionary, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_fileDirectoryPath, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  p_weightsDataIndex = &self->_weightsDataIndex;
  next = p_weightsDataIndex->__table_.__p1_.__value_.__next_;
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
  value = p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_;
  p_weightsDataIndex->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
