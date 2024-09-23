@implementation DYCaptureArchiveStack

- (void)push:(id)a3
{
  id v5;
  char *value;
  char *end;
  void *v8;
  _BYTE *begin;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  id *v15;
  _QWORD v16[5];

  v5 = a3;
  value = (char *)self->_archives.__end_cap_.__value_;
  end = (char *)self->_archives.__end_;
  if (end >= value)
  {
    begin = self->_archives.__begin_;
    v10 = (end - begin) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v11 = value - begin;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v16[4] = &self->_archives.__end_cap_;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_archives.__end_cap_, v13);
    else
      v14 = 0;
    v15 = (id *)&v14[8 * v10];
    v16[0] = v14;
    v16[1] = v15;
    v16[3] = &v14[8 * v13];
    *v15 = a3;
    v16[2] = v15 + 1;
    std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__swap_out_circular_buffer((uint64_t *)&self->_archives, v16);
    v8 = self->_archives.__end_;
    std::__split_buffer<GPUTools::objc_ref<DYCaptureArchive *>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *(_QWORD *)end = a3;
    v8 = end + 8;
    self->_archives.__end_ = v8;
  }
  self->_archives.__end_ = v8;
}

- (void)pop
{
  std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_archives, (uint64_t)self->_archives.__end_ - 8);
}

- (void)clear
{
  std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_archives, (uint64_t)self->_archives.__begin_);
}

- (unint64_t)size
{
  return ((char *)self->_archives.__end_ - (char *)self->_archives.__begin_) >> 3;
}

- (BOOL)empty
{
  return self->_archives.__begin_ == self->_archives.__end_;
}

- (id)top
{
  _QWORD *end;

  end = self->_archives.__end_;
  if (self->_archives.__begin_ == end)
    return 0;
  else
    return (id)*(end - 1);
}

- (id)allObjects
{
  void *v3;
  uint64_t *end;
  uint64_t *begin;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  begin = (uint64_t *)self->_archives.__begin_;
  end = (uint64_t *)self->_archives.__end_;
  while (begin != end)
  {
    v6 = *begin++;
    objc_msgSend(v3, "addObject:", v6);
  }
  return v3;
}

- (BOOL)_stackIsEmpty:(id *)a3
{
  void *begin;
  void *end;

  begin = self->_archives.__begin_;
  end = self->_archives.__end_;
  if (a3 && begin == end)
    *a3 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
  return begin == end;
}

- (void)close
{
  char *i;
  char *begin;
  void *v5;

  begin = (char *)self->_archives.__begin_;
  for (i = (char *)self->_archives.__end_; i != begin; i -= 8)
  {
    v5 = (void *)*((_QWORD *)i - 1);
    objc_msgSend(v5, "close");
  }
  -[DYCaptureArchiveStack clear](self, "clear");
}

- (id)filenamesWithPrefix:(id)a3 error:(id *)a4
{
  void *v7;
  id *end;
  id *begin;
  uint64_t v10;
  void *v11;

  v7 = (void *)objc_opt_new();
  begin = (id *)self->_archives.__begin_;
  end = (id *)self->_archives.__end_;
  while (1)
  {
    if (begin == end)
    {
      v11 = (void *)objc_msgSend(v7, "allObjects");
      goto LABEL_6;
    }
    v10 = objc_msgSend(*begin, "filenamesWithPrefix:error:", a3, a4);
    if (!v10)
      break;
    objc_msgSend(v7, "addObjectsFromArray:", v10);
    ++begin;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)filenamesWithPredicate:(id)a3 error:(id *)a4
{
  void *v7;
  id *end;
  id *begin;
  uint64_t v10;
  void *v11;

  v7 = (void *)objc_opt_new();
  begin = (id *)self->_archives.__begin_;
  end = (id *)self->_archives.__end_;
  while (1)
  {
    if (begin == end)
    {
      v11 = (void *)objc_msgSend(v7, "allObjects");
      goto LABEL_6;
    }
    v10 = objc_msgSend(*begin, "filenamesWithPredicate:error:", a3, a4);
    if (!v10)
      break;
    objc_msgSend(v7, "addObjectsFromArray:", v10);
    ++begin;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)resolveFilename:(id)a3 error:(id *)a4
{
  id result;
  char *begin;
  char *i;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void *v11;

  if (!-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a4))
  {
    p_archives = &self->_archives;
    begin = (char *)self->_archives.__begin_;
    for (i = (char *)p_archives->__end_; i != begin; i -= 8)
    {
      v11 = (void *)*((_QWORD *)i - 1);
      result = (id)objc_msgSend(v11, "resolveFilename:error:", a3, a4);
      if (result)
        return result;
    }
  }
  return 0;
}

- (vector<unsigned)getSortedFilePositionsForDataCaching
{
  unint64_t *end;
  unint64_t v5;
  vector<unsigned long long, std::allocator<unsigned long long>> *v6;
  id *v7;
  unint64_t *value;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t *v21;
  id *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char v34;
  unint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  __int128 *v39;
  _OWORD *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *p_end_cap;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t *begin;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  unint64_t *v63;
  unint64_t v64;
  vector<unsigned long long, std::allocator<unsigned long long>> *v65;
  id *v66;
  __int128 v67;
  __int128 *v68;
  _OWORD v69[2];
  int v70;
  void *__p;
  uint64_t *v72;
  uint64_t *v73;
  const char *v74;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  end = self->__end_;
  v65 = self;
  v5 = self->__end_cap_.__value_ - end;
  if (v5)
  {
    if (v5 == 1)
    {
      self = (vector<unsigned long long, std::allocator<unsigned long long>> *)*end;
      if (*end)
      {
        unk_256BBB2B8(self, "getSortedFilePositionsForDataCaching");
        self = (vector<unsigned long long, std::allocator<unsigned long long>> *)retstr->__begin_;
        if (!retstr->__begin_)
          goto LABEL_36;
        operator delete(self);
        v6 = retstr;
      }
      else
      {
        v6 = (vector<unsigned long long, std::allocator<unsigned long long>> *)v69;
      }
      v6->__begin_ = 0;
      v6->__end_ = 0;
      v6->__end_cap_.__value_ = 0;
LABEL_36:
      v36 = *(_QWORD **)&v69[0];
      retstr->__begin_ = *(unint64_t **)&v69[0];
      v37 = (_QWORD *)*((_QWORD *)&v69[0] + 1);
      *(_OWORD *)&retstr->__end_ = *(_OWORD *)((char *)v69 + 8);
      while (v36 != v37)
        *v36++ |= 0x8000000000000000;
      return self;
    }
    __p = 0;
    v72 = 0;
    v73 = 0;
    std::vector<std::pair<unsigned int,unsigned int>>::reserve(&__p, v5);
    v7 = (id *)v65->__end_;
    value = v65->__end_cap_.__value_;
    if (v7 == (id *)value)
    {
      v35 = 0;
      memset(v69, 0, sizeof(v69));
      v70 = 1065353216;
    }
    else
    {
      do
      {
        v9 = objc_msgSend(*v7, "_fileTable");
        v10 = v9;
        v11 = v72;
        if (v72 >= v73)
        {
          v13 = ((char *)v72 - (_BYTE *)__p) >> 3;
          if ((unint64_t)(v13 + 1) >> 61)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v14 = ((char *)v73 - (_BYTE *)__p) >> 2;
          if (v14 <= v13 + 1)
            v14 = v13 + 1;
          if ((unint64_t)((char *)v73 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
            v15 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          if (v15)
            v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v73, v15);
          else
            v16 = 0;
          v17 = (uint64_t *)&v16[8 * v13];
          *v17 = v10;
          v12 = v17 + 1;
          v19 = (char *)__p;
          v18 = (char *)v72;
          if (v72 != __p)
          {
            do
            {
              v20 = *((_QWORD *)v18 - 1);
              v18 -= 8;
              *--v17 = v20;
            }
            while (v18 != v19);
            v18 = (char *)__p;
          }
          __p = v17;
          v72 = v12;
          v73 = (uint64_t *)&v16[8 * v15];
          if (v18)
            operator delete(v18);
        }
        else
        {
          *v72 = v9;
          v12 = v11 + 1;
        }
        v72 = v12;
        ++v7;
      }
      while (v7 != (id *)value);
      v22 = (id *)v65->__end_;
      v21 = v65->__end_cap_.__value_;
      memset(v69, 0, sizeof(v69));
      v70 = 1065353216;
      v66 = (id *)v21;
      if (v22 == (id *)v21)
      {
        v35 = 0;
      }
      else
      {
        do
        {
          v23 = objc_msgSend(*v22, "_header");
          v24 = (unsigned int *)objc_msgSend(*v22, "_hashTable");
          v25 = objc_msgSend(*v22, "_fileTable");
          v26 = objc_msgSend(*v22, "_stringTableStorage");
          v27 = objc_msgSend(*v22, "_stringTableOffsets");
          v28 = *(unsigned int *)(v23 + 8);
          if ((_DWORD)v28)
          {
            v29 = v27;
            v30 = ((char *)v22 - (char *)v65->__end_) >> 3;
            v31 = 12 * v28;
            do
            {
              if (*v24 != -1 && v24[2] == -1)
              {
                v74 = 0;
                v74 = (const char *)(*(_QWORD *)(v29 + 8 * v24[1]) + v26);
                v32 = v25 + 24 * *v24;
                *(_QWORD *)&v67 = v32;
                *((_QWORD *)&v67 + 1) = v30;
                v33 = std::__hash_table<std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>>>::__emplace_unique_key_args<char const*,char const*&,std::pair<dy_capture_index_file_entry_t *,unsigned long>>((uint64_t)v69, &v74, &v74, &v67);
                if (!v34)
                {
                  *((_QWORD *)v33 + 3) = v32;
                  *((_QWORD *)v33 + 4) = v30;
                }
              }
              v24 += 3;
              v31 -= 12;
            }
            while (v31);
          }
          ++v22;
        }
        while (v22 != v66);
        v35 = *((_QWORD *)&v69[1] + 1);
      }
    }
    v67 = 0uLL;
    v68 = 0;
    std::vector<std::pair<dy_capture_index_file_entry_t *,unsigned long>>::reserve((void **)&v67, v35);
    v38 = *(_QWORD **)&v69[1];
    if (*(_QWORD *)&v69[1])
    {
      v39 = (__int128 *)*((_QWORD *)&v67 + 1);
      do
      {
        v40 = v38 + 3;
        if (v39 >= v68)
        {
          v41 = (uint64_t)((uint64_t)v39 - v67) >> 4;
          if ((unint64_t)(v41 + 1) >> 60)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v42 = (uint64_t)((uint64_t)v68 - v67) >> 3;
          if (v42 <= v41 + 1)
            v42 = v41 + 1;
          if ((unint64_t)((unint64_t)v68 - v67) >= 0x7FFFFFFFFFFFFFF0)
            v43 = 0xFFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_capture_index_file_entry_t *,unsigned long>>>((uint64_t)&v68, v43);
          else
            v44 = 0;
          v45 = &v44[16 * v41];
          *(_OWORD *)v45 = *v40;
          v46 = (char *)*((_QWORD *)&v67 + 1);
          v47 = (char *)v67;
          v48 = v45;
          if (*((_QWORD *)&v67 + 1) != (_QWORD)v67)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v46 - 1);
              v48 -= 16;
              v46 -= 16;
            }
            while (v46 != v47);
            v46 = (char *)v67;
          }
          v39 = (__int128 *)(v45 + 16);
          *(_QWORD *)&v67 = v48;
          *((_QWORD *)&v67 + 1) = v45 + 16;
          v68 = (__int128 *)&v44[16 * v43];
          if (v46)
            operator delete(v46);
        }
        else
        {
          *v39++ = *v40;
        }
        *((_QWORD *)&v67 + 1) = v39;
        v38 = (_QWORD *)*v38;
      }
      while (v38);
    }
    else
    {
      v39 = (__int128 *)*((_QWORD *)&v67 + 1);
    }
    v49 = 126 - 2 * __clz((uint64_t)((uint64_t)v39 - v67) >> 4);
    v74 = (const char *)&__block_literal_global_0;
    if (v39 == (__int128 *)v67)
      v50 = 0;
    else
      v50 = v49;
    std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*,false>(v67, v39, (uint64_t)&v74, v50, 1);
    std::vector<unsigned long long>::reserve((void **)&retstr->__begin_, (uint64_t)(*((_QWORD *)&v67 + 1) - v67) >> 4);
    v52 = (_QWORD *)*((_QWORD *)&v67 + 1);
    v51 = (_QWORD *)v67;
    if ((_QWORD)v67 != *((_QWORD *)&v67 + 1))
    {
      p_end_cap = &retstr->__end_cap_;
      v54 = retstr->__end_;
      do
      {
        v55 = (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v51 - *((_QWORD *)__p + v51[1])) >> 3)) | (v51[1] << 32) | 0x8000000000000000;
        if (v54 >= p_end_cap->__value_)
        {
          begin = retstr->__begin_;
          v58 = v54 - retstr->__begin_;
          v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 61)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v60 = (char *)p_end_cap->__value_ - (char *)begin;
          if (v60 >> 2 > v59)
            v59 = v60 >> 2;
          if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
            v61 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v61 = v59;
          if (v61)
          {
            v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&retstr->__end_cap_, v61);
            begin = retstr->__begin_;
            v54 = retstr->__end_;
          }
          else
          {
            v62 = 0;
          }
          v63 = (unint64_t *)&v62[8 * v58];
          *v63 = v55;
          v56 = v63 + 1;
          while (v54 != begin)
          {
            v64 = *--v54;
            *--v63 = v64;
          }
          retstr->__begin_ = v63;
          retstr->__end_ = v56;
          retstr->__end_cap_.__value_ = (unint64_t *)&v62[8 * v61];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v54 = v55;
          v56 = v54 + 1;
        }
        retstr->__end_ = v56;
        v51 += 2;
        v54 = v56;
      }
      while (v51 != v52);
      v51 = (_QWORD *)v67;
    }
    if (v51)
    {
      *((_QWORD *)&v67 + 1) = v51;
      operator delete(v51);
    }
    std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)v69);
    self = (vector<unsigned long long, std::allocator<unsigned long long>> *)__p;
    if (__p)
    {
      v72 = (uint64_t *)__p;
      operator delete(__p);
    }
  }
  return self;
}

BOOL __61__DYCaptureArchiveStack_getSortedFilePositionsForDataCaching__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;

  v3 = *(_DWORD *)(*(_QWORD *)a2 + 20);
  v4 = *(_DWORD *)(*(_QWORD *)a3 + 20);
  v5 = v3 > v4;
  if (v3 == v4)
    return **(_DWORD **)a2 > **(_DWORD **)a3;
  return v5;
}

- (id)openFileWithFilename:(id)a3 error:(id *)a4
{
  id result;
  char *begin;
  char *i;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void *v11;

  if (!-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a4))
  {
    p_archives = &self->_archives;
    begin = (char *)self->_archives.__begin_;
    for (i = (char *)p_archives->__end_; i != begin; i -= 8)
    {
      v11 = (void *)*((_QWORD *)i - 1);
      result = (id)objc_msgSend(v11, "openFileWithFilename:error:", a3, a4);
      if (result)
        return result;
    }
  }
  return 0;
}

- (int64_t)readDataForFilenameBuffer:(const char *)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  char *end;
  char *begin;
  uint64_t v13;
  void *v14;
  int64_t result;
  id v16;
  id v17;

  if (!-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a6))
  {
    v17 = 0;
    begin = (char *)self->_archives.__begin_;
    end = (char *)self->_archives.__end_;
    v13 = *MEMORY[0x24BE39080];
    while (end != begin)
    {
      v14 = (void *)*((_QWORD *)end - 1);
      end -= 8;
      result = objc_msgSend(v14, "readDataForFilenameBuffer:buffer:size:error:", a3, a4, a5, &v17);
      if (result != -1)
        return result;
      if (!v13)
        __assert_rtn("BOOL dy_error_eq(NSError *, NSString *, int)", ", 0, "domain");
      v16 = v17;
      if (!v17
        || objc_msgSend(v17, "code") != 13
        || (objc_msgSend((id)objc_msgSend(v16, "domain"), "isEqualToString:", v13) & 1) == 0)
      {
        if (a6)
          *a6 = v17;
        return -1;
      }
    }
  }
  return -1;
}

- (int64_t)readDataForFilename:(id)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  return -[DYCaptureArchiveStack readDataForFilenameBuffer:buffer:size:error:](self, "readDataForFilenameBuffer:buffer:size:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4, a5, a6);
}

- (id)copyDataForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  char *end;
  char *begin;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  if (-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a4))
    return 0;
  begin = (char *)self->_archives.__begin_;
  end = (char *)self->_archives.__end_;
  if (end == begin)
    return 0;
  v9 = *MEMORY[0x24BE39080];
  while (1)
  {
    v14 = 0;
    v10 = (void *)*((_QWORD *)end - 1);
    end -= 8;
    v11 = (void *)objc_msgSend(v10, "copyDataForFilenameBuffer:error:", a3, &v14);
    if (v11)
      break;
    if (!v9)
      __assert_rtn("BOOL dy_error_eq(NSError *, NSString *, int)", ", 0, "domain");
    v12 = v14;
    if (!v14
      || objc_msgSend(v14, "code") != 13
      || (objc_msgSend((id)objc_msgSend(v12, "domain"), "isEqualToString:", v9) & 1) == 0)
    {
      if (a4)
        *a4 = v14;
      return v11;
    }
    if (end == begin)
      return 0;
  }
  return v11;
}

- (id)copyDataForFilename:(id)a3 error:(id *)a4
{
  return -[DYCaptureArchiveStack copyDataForFilenameBuffer:error:](self, "copyDataForFilenameBuffer:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4);
}

- (void)allocateAndReadDataForFilenameBuffer:(const char *)a3 outSize:(unint64_t *)a4 error:(id *)a5
{
  void *result;
  char *end;
  char *begin;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  if (!-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a5))
  {
    v15 = 0;
    begin = (char *)self->_archives.__begin_;
    end = (char *)self->_archives.__end_;
    v12 = *MEMORY[0x24BE39080];
    while (end != begin)
    {
      v13 = (void *)*((_QWORD *)end - 1);
      end -= 8;
      result = (void *)objc_msgSend(v13, "allocateAndReadDataForFilenameBuffer:outSize:error:", a3, a4, &v15);
      if (result)
        return result;
      if (!v12)
        __assert_rtn("BOOL dy_error_eq(NSError *, NSString *, int)", ", 0, "domain");
      v14 = v15;
      if (!v15
        || objc_msgSend(v15, "code") != 13
        || (objc_msgSend((id)objc_msgSend(v14, "domain"), "isEqualToString:", v12) & 1) == 0)
      {
        if (!a5)
          return 0;
        result = 0;
        *a5 = v15;
        return result;
      }
    }
  }
  return 0;
}

- (BOOL)getInfo:(id *)a3 forFilenameBuffer:(const char *)a4 error:(id *)a5
{
  BOOL result;
  void *end;
  void *begin;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  if (-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a5))
    return 0;
  v16 = 0;
  begin = self->_archives.__begin_;
  end = self->_archives.__end_;
  v12 = *MEMORY[0x24BE39080];
  v13 = 0x100000000 - ((_QWORD)end << 29);
  while (1)
  {
    if (end == begin)
    {
LABEL_10:
      result = 0;
      if (!a5)
        return result;
      goto LABEL_11;
    }
    v14 = (void *)*((_QWORD *)end - 1);
    end = (char *)end - 8;
    if (objc_msgSend(v14, "getInfo:forFilenameBuffer:error:", a3, a4, &v16))
      break;
    if (!v12)
      __assert_rtn("BOOL dy_error_eq(NSError *, NSString *, int)", ", 0, "domain");
    v15 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "code") == 13)
      {
        v13 += 0x100000000;
        if ((objc_msgSend((id)objc_msgSend(v15, "domain"), "isEqualToString:", v12) & 1) != 0)
          continue;
      }
    }
    goto LABEL_10;
  }
  a3->var0 |= -(v13 + ((uint64_t)self->_archives.__begin_ << 29)) | 0x8000000000000000;
  result = 1;
  if (a5)
LABEL_11:
    *a5 = v16;
  return result;
}

- (BOOL)getInfo:(id *)a3 forFilename:(id)a4 error:(id *)a5
{
  return -[DYCaptureArchiveStack getInfo:forFilenameBuffer:error:](self, "getInfo:forFilenameBuffer:error:", a3, objc_msgSend(a4, "cStringUsingEncoding:", 1), a5);
}

- (BOOL)fileExistsForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  void **end;
  void **begin;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void **v9;
  void **v10;
  void *v11;
  BOOL result;
  BOOL v13;
  uint64_t v14;

  if (-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a4))
    return 0;
  v14 = 0;
  p_archives = &self->_archives;
  begin = (void **)self->_archives.__begin_;
  end = (void **)p_archives->__end_;
  if (end == begin)
    return 0;
  v9 = end - 1;
  v10 = end - 1;
  do
  {
    v11 = *v10--;
    result = objc_msgSend(v11, "fileExistsForFilenameBuffer:error:", a3, &v14);
    if (result)
      break;
    v13 = v14 || v9 == begin;
    v9 = v10;
  }
  while (!v13);
  return result;
}

- (BOOL)fileExistsForFilename:(id)a3 error:(id *)a4
{
  return -[DYCaptureArchiveStack fileExistsForFilenameBuffer:error:](self, "fileExistsForFilenameBuffer:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4);
}

- (void)cacheAllResources
{
  id *begin;
  unint64_t v4;

  begin = (id *)self->_archives.__begin_;
  if (self->_archives.__end_ != begin)
  {
    v4 = 0;
    do
    {
      objc_msgSend(begin[v4++], "cacheAllResources");
      begin = (id *)self->_archives.__begin_;
    }
    while (v4 < ((char *)self->_archives.__end_ - (char *)begin) >> 3);
  }
}

- (void)releaseBytesForFilePosition:(unint64_t)a3
{
  unint64_t v3;
  id *begin;
  const char *v5;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v5 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v3 = HIDWORD(a3) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v3 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v5 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack releaseBytesForFilePosition:]", ", 0, v5);
  }
  objc_msgSend(begin[v3], "releaseBytesForFilePosition:");
}

- (BOOL)requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6
{
  unint64_t v6;
  id *begin;
  const char *v9;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v6 = HIDWORD(a3) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v6 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v9 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack requestDataForFilePosition:buffer:size:error:]", ", 0, v9);
  }
  return objc_msgSend(begin[v6], "requestDataForFilePosition:buffer:size:error:");
}

- (int64_t)readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  unint64_t v6;
  id *begin;
  const char *v9;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v6 = HIDWORD(a3) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v6 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v9 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack readDataForFilePosition:buffer:size:error:]", ", 0, v9);
  }
  return objc_msgSend(begin[v6], "readDataForFilePosition:buffer:size:error:");
}

- (id)copyDataForFilePosition:(unint64_t)a3 error:(id *)a4
{
  unint64_t v4;
  id *begin;
  const char *v7;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v4 = HIDWORD(a3) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v4 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v7 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack copyDataForFilePosition:error:]", ", 0, v7);
  }
  return (id)objc_msgSend(begin[v4], "copyDataForFilePosition:error:");
}

- (BOOL)getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  unint64_t v5;
  id *begin;
  const char *v8;

  if ((a4 & 0x8000000000000000) == 0)
  {
    v8 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v5 = HIDWORD(a4) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v5 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v8 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack getInfo:forFilePosition:error:]", ", 0, v8);
  }
  return objc_msgSend(begin[v5], "getInfo:forFilePosition:error:", a3);
}

- (id)getFilenameForFilePosition:(unint64_t)a3 error:(id *)a4
{
  unint64_t v4;
  id *begin;
  const char *v7;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = "position & kDYCaptureArchiveStackPositionBit";
    goto LABEL_6;
  }
  v4 = HIDWORD(a3) & 0x7FFFFFFF;
  begin = (id *)self->_archives.__begin_;
  if (v4 >= ((char *)self->_archives.__end_ - (char *)begin) >> 3)
  {
    v7 = "stack_index < _archives.size()";
LABEL_6:
    __assert_rtn("-[DYCaptureArchiveStack getFilenameForFilePosition:error:]", ", 0, v7);
  }
  return (id)objc_msgSend(begin[v4], "getFilenameForFilePosition:error:");
}

- (id)metadataValueForKey:(id)a3
{
  BOOL v5;
  id result;
  char *begin;
  char *i;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void *v10;

  v5 = -[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", 0);
  result = 0;
  if (!v5)
  {
    p_archives = &self->_archives;
    begin = (char *)self->_archives.__begin_;
    for (i = (char *)p_archives->__end_; i != begin; i -= 8)
    {
      v10 = (void *)*((_QWORD *)i - 1);
      result = (id)objc_msgSend(v10, "metadataValueForKey:", a3);
      if (result)
        return result;
    }
    return 0;
  }
  return result;
}

- (id)copyAdjunctDataForFilename:(id)a3 error:(id *)a4
{
  BOOL v7;
  id result;
  char *begin;
  char *i;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void *v12;

  v7 = -[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", 0);
  result = 0;
  if (!v7)
  {
    p_archives = &self->_archives;
    begin = (char *)self->_archives.__begin_;
    for (i = (char *)p_archives->__end_; i != begin; i -= 8)
    {
      v12 = (void *)*((_QWORD *)i - 1);
      result = (id)objc_msgSend(v12, "copyAdjunctDataForFilename:error:", a3, a4);
      if (result)
        return result;
    }
    return 0;
  }
  return result;
}

- (BOOL)adjunctFileExistsForFilename:(id)a3 error:(id *)a4
{
  void **end;
  void **begin;
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;
  void **v9;
  void **v10;
  void *v11;
  BOOL result;
  BOOL v13;
  uint64_t v14;

  if (-[DYCaptureArchiveStack _stackIsEmpty:](self, "_stackIsEmpty:", a4))
    return 0;
  v14 = 0;
  p_archives = &self->_archives;
  begin = (void **)self->_archives.__begin_;
  end = (void **)p_archives->__end_;
  if (end == begin)
    return 0;
  v9 = end - 1;
  v10 = end - 1;
  do
  {
    v11 = *v10--;
    result = objc_msgSend(v11, "adjunctFileExistsForFilename:error:", a3, &v14);
    if (result)
      break;
    v13 = v14 || v9 == begin;
    v9 = v10;
  }
  while (!v13);
  return result;
}

- (BOOL)acceptCaptureVisitor:(id)a3
{
  objc_msgSend(a3, "visitCaptureArchiveStack:", self);
  return 1;
}

- (void).cxx_destruct
{
  vector<GPUTools::objc_ref<DYCaptureArchive *>, std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>> *p_archives;

  p_archives = &self->_archives;
  std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_archives);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
