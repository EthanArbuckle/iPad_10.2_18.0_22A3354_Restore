@implementation NoiseSampler

- (NoiseSampler)init
{

  return 0;
}

- (NoiseSampler)initWithZipfOfSize:(unint64_t)a3
{
  unint64_t v3;
  float *v5;
  double v6;
  unint64_t v7;
  float v8;
  float v9;
  float v10;
  float *v11;
  NoiseSampler *v12;
  void *__p;
  _BYTE *v15;

  v3 = a3;
  std::vector<float>::vector(&__p, a3);
  v5 = (float *)__p;
  if (v3)
  {
    v6 = log((double)(v3 + 1));
    v7 = 0;
    v8 = 0.0;
    do
    {
      v9 = logf((float)v7 + 2.0);
      v10 = (float)(v9 - logf((float)v7 + 1.0)) / v6;
      v8 = v8 + v10;
      v5[v7++] = v10;
    }
    while (v3 != v7);
    v11 = v5;
    do
    {
      *v11 = *v11 / v8;
      ++v11;
      --v3;
    }
    while (v3);
  }
  v12 = -[NoiseSampler initWithUnigram:ofSize:](self, "initWithUnigram:ofSize:", v5, (v15 - (_BYTE *)v5) >> 2);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
  return v12;
}

- (NoiseSampler)initWithUnigram:(float *)a3 ofSize:(unint64_t)a4
{
  NoiseSampler *v6;
  uint32_t v7;
  uint64_t i;
  vector<float, std::allocator<float>> *p_unigram;
  uint64_t v10;
  float v11;
  char *v12;
  void *v13;
  char *v14;
  char *v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  float v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  char *v55;
  uint64_t *v56;
  unint64_t v57;
  float *begin;
  uint64_t v59;
  unint64_t v60;
  float *v61;
  uint64_t *v62;
  uint64_t v63;
  std::random_device v65[2];
  char *v66;
  char *v67;
  void *__src[313];
  objc_super v69;

  v69.receiver = self;
  v69.super_class = (Class)NoiseSampler;
  v6 = -[NoiseSampler init](&v69, sel_init);
  if (!v6)
    return v6;
  std::random_device::random_device[abi:ne180100](v65);
  v7 = arc4random();
  LODWORD(__src[0]) = v7;
  for (i = 1; i != 624; ++i)
  {
    v7 = i + 1812433253 * (v7 ^ (v7 >> 30));
    *((_DWORD *)__src + i) = v7;
  }
  __src[312] = 0;
  memcpy(&v6->_generator, __src, sizeof(v6->_generator));
  std::random_device::~random_device(v65);
  p_unigram = &v6->_unigram;
  LODWORD(__src[0]) = 0;
  std::vector<float>::resize((uint64_t)&v6->_unigram, a4, __src);
  __src[0] = 0;
  std::vector<unsigned long>::resize((uint64_t)&v6->_alias, a4, __src);
  memset(__src, 0, 24);
  *(_QWORD *)&v65[0].__padding_ = 0;
  v66 = 0;
  v67 = 0;
  if (a4)
  {
    v10 = 0;
    do
    {
      v11 = a3[v10] * (float)a4;
      p_unigram->__begin_[v10] = v11;
      if (v11 >= 1.0)
      {
        v14 = v66;
        if (v66 >= v67)
        {
          v22 = *(char **)&v65[0].__padding_;
          v23 = (uint64_t)&v66[-*(_QWORD *)&v65[0].__padding_] >> 3;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 61)
LABEL_99:
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v25 = (uint64_t)&v67[-*(_QWORD *)&v65[0].__padding_];
          if ((uint64_t)&v67[-*(_QWORD *)&v65[0].__padding_] >> 2 > v24)
            v24 = v25 >> 2;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v26 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&v67, v26);
            v22 = *(char **)&v65[0].__padding_;
            v14 = v66;
          }
          else
          {
            v27 = 0;
          }
          v30 = &v27[8 * v23];
          *(_QWORD *)v30 = v10;
          v15 = v30 + 8;
          while (v14 != v22)
          {
            v31 = *((_QWORD *)v14 - 1);
            v14 -= 8;
            *((_QWORD *)v30 - 1) = v31;
            v30 -= 8;
          }
          *(_QWORD *)&v65[0].__padding_ = v30;
          v66 = v15;
          v67 = &v27[8 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *(_QWORD *)v66 = v10;
          v15 = v14 + 8;
        }
        v66 = v15;
      }
      else
      {
        v12 = (char *)__src[1];
        if (__src[1] >= __src[2])
        {
          v16 = (char *)__src[0];
          v17 = ((char *)__src[1] - (char *)__src[0]) >> 3;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 61)
            goto LABEL_99;
          v19 = (char *)__src[2] - (char *)__src[0];
          if (((char *)__src[2] - (char *)__src[0]) >> 2 > v18)
            v18 = v19 >> 2;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
            v20 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&__src[2], v20);
            v16 = (char *)__src[0];
            v12 = (char *)__src[1];
          }
          else
          {
            v21 = 0;
          }
          v28 = &v21[8 * v17];
          *(_QWORD *)v28 = v10;
          v13 = v28 + 8;
          while (v12 != v16)
          {
            v29 = *((_QWORD *)v12 - 1);
            v12 -= 8;
            *((_QWORD *)v28 - 1) = v29;
            v28 -= 8;
          }
          __src[0] = v28;
          __src[1] = v13;
          __src[2] = &v21[8 * v20];
          if (v16)
            operator delete(v16);
        }
        else
        {
          *(_QWORD *)__src[1] = v10;
          v13 = v12 + 8;
        }
        __src[1] = v13;
      }
      ++v10;
    }
    while (v10 != a4);
    v32 = (char *)__src[0];
    v33 = (char *)__src[1];
    if (__src[1] != __src[0])
    {
      while (1)
      {
        v34 = *(char **)&v65[0].__padding_;
        v35 = v66;
        if (v66 == *(char **)&v65[0].__padding_)
          break;
        v36 = v33 - 8;
        v37 = *((_QWORD *)v33 - 1);
        v38 = v66 - 8;
        v39 = *((_QWORD *)v66 - 1);
        __src[1] = v33 - 8;
        v66 -= 8;
        v6->_alias.__begin_[v37] = v39;
        v40 = p_unigram->__begin_[v39] + -1.0 + p_unigram->__begin_[v37];
        p_unigram->__begin_[v39] = v40;
        if (v40 >= 1.0)
        {
          if (v38 >= v67)
          {
            v46 = (v38 - v34) >> 3;
            v47 = v46 + 1;
            if ((unint64_t)(v46 + 1) >> 61)
LABEL_100:
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v48 = v67 - v34;
            if ((v67 - v34) >> 2 > v47)
              v47 = v48 >> 2;
            if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
              v49 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v49 = v47;
            if (v49)
            {
              v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&v67, v49);
              v34 = *(char **)&v65[0].__padding_;
              v38 = v66;
            }
            else
            {
              v50 = 0;
            }
            v53 = (unint64_t *)&v50[8 * v46];
            *v53 = v39;
            v35 = (char *)(v53 + 1);
            while (v38 != v34)
            {
              v54 = *((_QWORD *)v38 - 1);
              v38 -= 8;
              *--v53 = v54;
            }
            *(_QWORD *)&v65[0].__padding_ = v53;
            v66 = v35;
            v67 = &v50[8 * v49];
            if (v34)
              operator delete(v34);
          }
          else
          {
            *(_QWORD *)v38 = v39;
          }
          v66 = v35;
          v33 = (char *)__src[1];
        }
        else
        {
          if (v36 >= __src[2])
          {
            v41 = (v36 - v32) >> 3;
            v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 61)
              goto LABEL_100;
            v43 = (char *)__src[2] - (char *)v32;
            if (((char *)__src[2] - (char *)v32) >> 2 > v42)
              v42 = v43 >> 2;
            if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8)
              v44 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v44 = v42;
            if (v44)
            {
              v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)&__src[2], v44);
              v32 = (char *)__src[0];
              v36 = (char *)__src[1];
            }
            else
            {
              v45 = 0;
            }
            v51 = (unint64_t *)&v45[8 * v41];
            *v51 = v39;
            v33 = (char *)(v51 + 1);
            while (v36 != v32)
            {
              v52 = *((_QWORD *)v36 - 1);
              v36 -= 8;
              *--v51 = v52;
            }
            __src[0] = v51;
            __src[1] = v33;
            __src[2] = &v45[8 * v44];
            if (v32)
              operator delete(v32);
          }
          else
          {
            *(_QWORD *)v36 = v39;
          }
          __src[1] = v33;
        }
        v32 = (char *)__src[0];
        v55 = v33;
        if (v33 == __src[0])
          goto LABEL_83;
      }
      v55 = v32;
LABEL_83:
      if (v32 != v33)
      {
        v57 = (v33 - v32) >> 3;
        begin = p_unigram->__begin_;
        if (v57 <= 1)
          v57 = 1;
        do
        {
          v59 = *(_QWORD *)v55;
          v55 += 8;
          begin[v59] = 1.0;
          --v57;
        }
        while (v57);
      }
    }
    v56 = *(uint64_t **)&v65[0].__padding_;
  }
  else
  {
    v56 = 0;
  }
  if (v66 == (char *)v56)
  {
    if (!v56)
      goto LABEL_96;
  }
  else
  {
    v60 = (v66 - (char *)v56) >> 3;
    v61 = p_unigram->__begin_;
    if (v60 <= 1)
      v60 = 1;
    v62 = v56;
    do
    {
      v63 = *v62++;
      v61[v63] = 1.0;
      --v60;
    }
    while (v60);
  }
  v66 = (char *)v56;
  operator delete(v56);
LABEL_96:
  if (__src[0])
  {
    __src[1] = __src[0];
    operator delete(__src[0]);
  }
  return v6;
}

- (unint64_t)drawNoise
{
  int64_t v3;
  mersenne_twister_engine<unsigned int, 32UL, 624UL, 397UL, 31UL, 2567483615U, 11UL, 4294967295U, 7UL, 2636928640U, 15UL, 4022730752U, 18UL, 1812433253U> *p_generator;
  uint64_t v5;
  float v6;
  unint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  _QWORD v12[2];

  v3 = self->_unigram.__end_ - self->_unigram.__begin_;
  v12[0] = 0;
  v12[1] = v3;
  p_generator = &self->_generator;
  v5 = std::uniform_int_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)v12, (uint64_t)&self->_generator, v12);
  v6 = self->_unigram.__begin_[v5];
  v7 = self->_alias.__begin_[v5];
  v8 = v6;
  v9 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)p_generator);
  if ((v9
      + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)p_generator)
      * 4294967300.0)
     * 5.42101086e-20
     + 0.0 >= v8)
    v10 = v7;
  else
    v10 = v5;
  return (unint64_t)(float)v10;
}

- (void).cxx_destruct
{
  float *begin;
  unint64_t *v4;

  begin = self->_unigram.__begin_;
  if (begin)
  {
    self->_unigram.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_alias.__begin_;
  if (v4)
  {
    self->_alias.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  unsigned int v2;
  uint64_t v3;
  uint64_t i;
  int v5;

  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  v2 = 5489;
  *((_DWORD *)self + 14) = 5489;
  v3 = 1;
  for (i = 15; i != 638; ++i)
  {
    v5 = 1812433253 * (v2 ^ (v2 >> 30));
    v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 14;
    ++v3;
  }
  *((_QWORD *)self + 319) = 0;
  return self;
}

@end
