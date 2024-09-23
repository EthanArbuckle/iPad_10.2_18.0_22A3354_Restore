@implementation DEGroundingInfo

- (id)init:(int)a3 timeStamps:(id)a4 text:(id)a5
{
  id v8;
  DEGroundingInfo *v9;
  id v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  int v28;
  DEGroundingInfo *v29;
  id v30;
  id v31;
  void *v32[2];
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *__p;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char *v43;
  char *v44;
  unint64_t v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v8 = a5;
  v46.receiver = self;
  v46.super_class = (Class)DEGroundingInfo;
  v9 = -[DEGroundingInfo init](&v46, sel_init);
  if (v9)
  {
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v31;
    v29 = v9;
    v30 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    v28 = a3;
    if (v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v10);
          v17 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          if ((unint64_t)v12 >= v14)
          {
            v20 = (v12 - v13) >> 3;
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 61)
            {
              v45 = v14;
              v43 = v13;
              std::vector<BOOL>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v14 - (_QWORD)v13) >> 2 > v21)
              v21 = (uint64_t)(v14 - (_QWORD)v13) >> 2;
            if (v14 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
              v22 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v22 = v21;
            if (v22)
              v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v22);
            else
              v23 = 0;
            v24 = (char *)(v22 + 8 * v20);
            *(_QWORD *)v24 = v19;
            v25 = v24 + 8;
            while (v12 != v13)
            {
              v26 = *((_QWORD *)v12 - 1);
              v12 -= 8;
              *((_QWORD *)v24 - 1) = v26;
              v24 -= 8;
            }
            v14 = v22 + 8 * v23;
            v44 = v25;
            if (v13)
              operator delete(v13);
            v13 = v24;
            v12 = v25;
          }
          else
          {
            *(_QWORD *)v12 = v18;
            v12 += 8;
          }
          v44 = v12;

        }
        v45 = v14;
        v43 = v13;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0;
    }

    std::string::basic_string[abi:ne180100]<0>(v32, (char *)objc_msgSend(objc_retainAutorelease(v30), "UTF8String"));
    v9 = v29;
    siri::dialogengine::GroundingInfo::GroundingInfo(&v34, v28, (uint64_t)&v43, (__int128 *)v32);
    -[DEGroundingInfo setThis:](v29, "setThis:", &v34);
    v8 = v30;
    if (v38 < 0)
      operator delete(__p);
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }
    if (v33 < 0)
      operator delete(v32[0]);
    if (v13)
    {
      v44 = v13;
      operator delete(v13);
    }
  }

  return v9;
}

- (id)text
{
  void *v2;
  std::string *v3;
  void *v4;
  void *v6;
  _BYTE __p[24];
  std::string v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEGroundingInfo This](self, "This");
  if ((__p[23] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  else
    v8 = *(std::string *)__p;
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v8;
  else
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v6)
    operator delete(v6);
  return v4;
}

- (int)count
{
  int v3;
  void *v4;
  void *__p;
  char v6;

  -[DEGroundingInfo This](self, "This");
  if (v6 < 0)
    operator delete(__p);
  if (v4)
    operator delete(v4);
  return v3;
}

- (id)timestamps
{
  id v2;
  double *v3;
  double *v4;
  double *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *__p;
  char v11;
  double *v12;
  double *v13;
  uint64_t v14;

  -[DEGroundingInfo This](self, "This");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v12, v8, v9, (v9 - (uint64_t)v8) >> 3);
  if (v11 < 0)
    operator delete(__p);
  if (v8)
    operator delete(v8);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v12;
  v4 = v13;
  if (v12 != v13)
  {
    v5 = v12;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

      ++v5;
    }
    while (v5 != v4);
  }
  if (v3)
    operator delete(v3);
  return v2;
}

- (GroundingInfo)This
{
  uint64_t v1;
  GroundingInfo *result;

  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3831);
  return result;
}

- (void)setThis:(GroundingInfo *)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__3830);
}

- (void).cxx_destruct
{
  double *begin;

  if (*((char *)&self->_This.mText.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_This.mText.__r_.__value_.var0.var1.__data_);
  begin = self->_This.mTimestamps.__begin_;
  if (begin)
  {
    self->_This.mTimestamps.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
