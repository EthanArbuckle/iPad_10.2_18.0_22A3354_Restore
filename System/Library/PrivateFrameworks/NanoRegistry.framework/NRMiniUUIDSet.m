@implementation NRMiniUUIDSet

- (NRMiniUUIDSet)initWithUUIDSet:(id)a3
{
  id v4;
  char *v5;
  std::vector<unsigned int>::size_type v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unsigned int *v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  char *v23;
  _DWORD *v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  int v41;
  char *v42;
  int64_t v43;
  void *v44;
  id v46;
  uint64_t v47;
  char **v48;
  uint64_t v49;
  id obj;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)NRMiniUUIDSet;
  v5 = -[NRMiniUUIDSet init](&v56, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6)
    {
      v48 = (char **)(v5 + 8);
      std::vector<unsigned int>::reserve((std::vector<unsigned int> *)(v5 + 8), v6);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v46 = v4;
      obj = v4;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v53;
        v47 = *(_QWORD *)v53;
        do
        {
          v9 = 0;
          v49 = v7;
          do
          {
            if (*(_QWORD *)v53 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v9);
            v57[0] = 0;
            v57[1] = 0;
            objc_msgSend(v10, "getUUIDBytes:", v57, v46);
            v51 = v57[0];
            v12 = (char *)*((_QWORD *)v5 + 1);
            v11 = (char *)*((_QWORD *)v5 + 2);
            v13 = v11 - v12;
            if (v11 == v12)
            {
              v15 = (char *)*((_QWORD *)v5 + 2);
            }
            else
            {
              v14 = v13 >> 2;
              v15 = (char *)*((_QWORD *)v5 + 1);
              do
              {
                v16 = v14 >> 1;
                v17 = (unsigned int *)&v15[4 * (v14 >> 1)];
                v19 = *v17;
                v18 = (char *)(v17 + 1);
                v14 += ~(v14 >> 1);
                if (LODWORD(v57[0]) < v19)
                  v14 = v16;
                else
                  v15 = v18;
              }
              while (v14);
            }
            v20 = v15 - v12;
            v21 = &v12[(v15 - v12) & 0xFFFFFFFFFFFFFFFCLL];
            v22 = *((_QWORD *)v5 + 3);
            if ((unint64_t)v11 >= v22)
            {
              v26 = (v13 >> 2) + 1;
              if (v26 >> 62)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v22 - (_QWORD)v12) >> 1 > v26)
                v26 = (uint64_t)(v22 - (_QWORD)v12) >> 1;
              if (v22 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
                v27 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v27 = v26;
              if (v27)
              {
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v27);
              }
              else
              {
                v29 = 0;
                v28 = 0;
              }
              v31 = v20 >> 2;
              v32 = &v29[4 * (v20 >> 2)];
              v33 = &v29[4 * v28];
              if (v20 >> 2 == v28)
              {
                if (v20 < 1)
                {
                  if (v15 == v12)
                    v35 = 1;
                  else
                    v35 = v20 >> 1;
                  v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v35);
                  v32 = &v36[v35 & 0xFFFFFFFFFFFFFFFCLL];
                  v33 = &v36[4 * v37];
                  if (v29)
                    operator delete(v29);
                }
                else
                {
                  if (v31 >= -1)
                    v34 = v31 + 1;
                  else
                    v34 = v31 + 2;
                  v32 -= 4 * (v34 >> 1);
                }
              }
              *(_DWORD *)v32 = v51;
              v38 = v32 + 4;
              v39 = *v48;
              if (*v48 != v21)
              {
                v40 = v21;
                do
                {
                  v41 = *((_DWORD *)v40 - 1);
                  v40 -= 4;
                  *((_DWORD *)v32 - 1) = v41;
                  v32 -= 4;
                }
                while (v40 != v39);
              }
              v42 = (char *)*((_QWORD *)v5 + 2);
              v43 = v42 - v21;
              if (v42 != v21)
                memmove(v38, v21, v42 - v21);
              v44 = (void *)*((_QWORD *)v5 + 1);
              *((_QWORD *)v5 + 1) = v32;
              *((_QWORD *)v5 + 2) = &v38[v43];
              *((_QWORD *)v5 + 3) = v33;
              v7 = v49;
              v8 = v47;
              if (v44)
                operator delete(v44);
            }
            else if (v21 == v11)
            {
              *(_DWORD *)v11 = v57[0];
              *((_QWORD *)v5 + 2) = v11 + 4;
            }
            else
            {
              v23 = v11 - 4;
              v24 = (_DWORD *)*((_QWORD *)v5 + 2);
              while (v23 < v11)
              {
                v25 = *(_DWORD *)v23;
                v23 += 4;
                *v24++ = v25;
              }
              *((_QWORD *)v5 + 2) = v24;
              if (v11 != v21 + 4)
                memmove(&v11[-4 * ((v11 - (v21 + 4)) >> 2)], &v12[(v15 - v12) & 0xFFFFFFFFFFFFFFFCLL], v11 - (v21 + 4));
              v30 = &v51;
              if (v21 <= (char *)&v51)
                v30 = &v51 + (*((_QWORD *)v5 + 2) > (unint64_t)&v51);
              *(_DWORD *)v21 = *v30;
            }
            ++v9;
          }
          while (v9 != v7);
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v7);
      }

      v4 = v46;
    }
  }

  return (NRMiniUUIDSet *)v5;
}

- (NRMiniUUIDSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NRMiniUUIDSet *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NRMiniUUIDSet initWithData:](self, "initWithData:", v5);

  return v6;
}

- (NRMiniUUIDSet)initWithData:(id)a3
{
  id v4;
  char *v5;
  std::vector<unsigned int>::size_type v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  std::vector<unsigned int>::size_type v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  int v22;
  std::vector<unsigned int>::size_type v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NRMiniUUIDSet;
  v5 = -[NRMiniUUIDSet init](&v25, sel_init);
  if (v5 && (unint64_t)objc_msgSend(v4, "length") >= 4)
  {
    v6 = (unint64_t)objc_msgSend(v4, "length") >> 2;
    std::vector<unsigned int>::reserve((std::vector<unsigned int> *)(v5 + 8), v6);
    v7 = *((_QWORD *)v5 + 1);
    v8 = *((_QWORD *)v5 + 2);
    v9 = (v8 - v7) >> 2;
    if (v6 <= v9)
    {
      if (v6 >= v9)
      {
LABEL_19:
        memcpy(*((void **)v5 + 1), (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), *((_QWORD *)v5 + 3) - *((_QWORD *)v5 + 1));
        goto LABEL_20;
      }
      v23 = v7 + 4 * v6;
    }
    else
    {
      v10 = v6 - v9;
      v11 = *((_QWORD *)v5 + 3);
      if (v6 - v9 > (v11 - v8) >> 2)
      {
        v12 = v11 - v7;
        v13 = v12 >> 1;
        if (v12 >> 1 <= v6)
          v13 = v6;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
          v14 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v14);
        v16 = (char *)*((_QWORD *)v5 + 1);
        v17 = (char *)*((_QWORD *)v5 + 2);
        v18 = &v15[4 * v9];
        v20 = &v15[4 * v19];
        bzero(v18, 4 * v10);
        v21 = &v18[4 * v10];
        while (v17 != v16)
        {
          v22 = *((_DWORD *)v17 - 1);
          v17 -= 4;
          *((_DWORD *)v18 - 1) = v22;
          v18 -= 4;
        }
        *((_QWORD *)v5 + 1) = v18;
        *((_QWORD *)v5 + 2) = v21;
        *((_QWORD *)v5 + 3) = v20;
        if (v16)
          operator delete(v16);
        goto LABEL_19;
      }
      bzero(*((void **)v5 + 2), 4 * v10);
      v23 = v8 + 4 * v10;
    }
    *((_QWORD *)v5 + 2) = v23;
    goto LABEL_19;
  }
LABEL_20:

  return (NRMiniUUIDSet *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unsigned int *begin;
  void *v6;
  id v7;

  v4 = a3;
  begin = self->_miniUUIDs.__begin_;
  if (self->_miniUUIDs.__end_ != begin)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", begin, (char *)self->_miniUUIDs.__end_cap_.__value_ - (char *)begin);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("data"));

    v4 = v7;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NRMiniUUIDSet *v4;
  NRMiniUUIDSet *v5;
  char *begin;
  vector<unsigned int, std::allocator<unsigned int> > *p_miniUUIDs;
  unsigned int *v8;
  unsigned int *end;
  int64_t v10;
  unint64_t v11;
  uint64_t value;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  void **p_end;
  uint64_t v17;
  char *v18;
  _DWORD *v19;
  int v20;
  unsigned int *v21;
  unint64_t v22;
  unsigned int *v23;
  char *v24;
  int v25;

  v4 = objc_alloc_init(NRMiniUUIDSet);
  v5 = v4;
  if (v4 != self)
  {
    p_miniUUIDs = &v4->_miniUUIDs;
    begin = (char *)v4->_miniUUIDs.__begin_;
    v8 = self->_miniUUIDs.__begin_;
    end = self->_miniUUIDs.__end_;
    v10 = (char *)end - (char *)v8;
    v11 = end - v8;
    value = (uint64_t)v4->_miniUUIDs.__end_cap_.__value_;
    if (v11 <= (value - (uint64_t)begin) >> 2)
    {
      p_end = (void **)&v4->_miniUUIDs.__end_;
      v21 = v4->_miniUUIDs.__end_;
      v22 = ((char *)v21 - begin) >> 2;
      if (v22 >= v11)
      {
        if (end != v8)
          memmove(v4->_miniUUIDs.__begin_, v8, (char *)end - (char *)v8);
        goto LABEL_23;
      }
      v23 = &v8[v22];
      if (v21 != (unsigned int *)begin)
      {
        memmove(v4->_miniUUIDs.__begin_, v8, (char *)v21 - begin);
        begin = (char *)*p_end;
      }
      v18 = begin;
      if (v23 != end)
      {
        v18 = begin;
        v24 = begin;
        do
        {
          v25 = *v23++;
          *(_DWORD *)v24 = v25;
          v24 += 4;
          v18 += 4;
        }
        while (v23 != end);
      }
    }
    else
    {
      if (begin)
      {
        v4->_miniUUIDs.__end_ = (unsigned int *)begin;
        operator delete(begin);
        value = 0;
        p_miniUUIDs->__begin_ = 0;
        v5->_miniUUIDs.__end_ = 0;
        v5->_miniUUIDs.__end_cap_.__value_ = 0;
      }
      if (v10 < 0)
        goto LABEL_27;
      v13 = value >> 1;
      if (value >> 1 <= v11)
        v13 = end - v8;
      v14 = (unint64_t)value >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v13;
      if (v14 >> 62)
LABEL_27:
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v14);
      begin = v15;
      v5->_miniUUIDs.__begin_ = (unsigned int *)v15;
      p_end = (void **)&v5->_miniUUIDs.__end_;
      v5->_miniUUIDs.__end_cap_.__value_ = (unsigned int *)&v15[4 * v17];
      v18 = v15;
      if (v8 != end)
      {
        v18 = v15;
        v19 = v15;
        do
        {
          v20 = *v8++;
          *v19++ = v20;
          v18 += 4;
        }
        while (v8 != end);
      }
    }
    v10 = v18 - begin;
LABEL_23:
    *p_end = &begin[v10];
  }
  return v5;
}

- (BOOL)hasUUID:(id)a3
{
  id v4;
  unsigned int *begin;
  unsigned int *end;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  BOOL v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = 0;
  v14[1] = 0;
  objc_msgSend(v4, "getUUIDBytes:", v14);
  begin = self->_miniUUIDs.__begin_;
  end = self->_miniUUIDs.__end_;
  if (end == begin)
    goto LABEL_9;
  v7 = end - begin;
  do
  {
    v8 = v7 >> 1;
    v9 = &begin[v7 >> 1];
    v11 = *v9;
    v10 = v9 + 1;
    v7 += ~(v7 >> 1);
    if (v11 < LODWORD(v14[0]))
      begin = v10;
    else
      v7 = v8;
  }
  while (v7);
  if (begin == end)
LABEL_9:
    v12 = 0;
  else
    v12 = LODWORD(v14[0]) >= *begin;

  return v12;
}

- (BOOL)hasCapability:(unsigned int)a3
{
  unsigned int *begin;
  unsigned int *end;
  unint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;

  begin = self->_miniUUIDs.__begin_;
  end = self->_miniUUIDs.__end_;
  if (end == begin)
    return 0;
  v5 = end - begin;
  do
  {
    v6 = v5 >> 1;
    v7 = &begin[v5 >> 1];
    v9 = *v7;
    v8 = v7 + 1;
    v5 += ~(v5 >> 1);
    if (v9 < a3)
      begin = v8;
    else
      v5 = v6;
  }
  while (v5);
  return begin != end && *begin <= a3;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_miniUUIDs.__begin_, (char *)self->_miniUUIDs.__end_cap_.__value_ - (char *)self->_miniUUIDs.__begin_);
}

- (id)description
{
  void *v3;
  unsigned int *begin;
  unint64_t v5;

  v3 = (void *)objc_msgSend(CFSTR("Mini Capabilities: "), "mutableCopy");
  begin = self->_miniUUIDs.__begin_;
  if (self->_miniUUIDs.__end_ != begin)
  {
    v5 = 0;
    do
    {
      if (v5)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", "));
        begin = self->_miniUUIDs.__begin_;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("%X-"), bswap32(begin[v5++]));
      begin = self->_miniUUIDs.__begin_;
    }
    while (v5 < self->_miniUUIDs.__end_ - begin);
  }
  return v3;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  unsigned int *begin;

  objc_storeStrong((id *)&self->_data, 0);
  begin = self->_miniUUIDs.__begin_;
  if (begin)
  {
    self->_miniUUIDs.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
