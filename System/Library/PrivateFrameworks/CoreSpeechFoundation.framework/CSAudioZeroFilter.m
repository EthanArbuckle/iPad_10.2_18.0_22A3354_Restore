@implementation CSAudioZeroFilter

- (CSAudioZeroFilter)initWithZeroWindowSize:(unint64_t)a3 approxAbsSpeechThreshold:(unsigned __int16)a4 numHostTicksPerAudioSample:(double)a5
{
  CSAudioZeroFilter *v8;
  uint64_t v9;
  uint64_t value;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSAudioZeroFilter;
  v8 = -[CSAudioZeroFilter init](&v12, sel_init);
  if (v8)
  {
    v9 = operator new();
    *(_QWORD *)v9 = a3;
    *(_WORD *)(v9 + 8) = a4;
    *(_BYTE *)(v9 + 10) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    *(_BYTE *)(v9 + 24) = 0;
    *(_DWORD *)(v9 + 28) = -1;
    *(_QWORD *)(v9 + 64) = 0;
    *(_QWORD *)(v9 + 72) = 0;
    *(_QWORD *)(v9 + 56) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 40) = 0;
    *(double *)(v9 + 80) = a5;
    value = (uint64_t)v8->_audioZeroFilterImpl.__ptr_.__value_;
    v8->_audioZeroFilterImpl.__ptr_.__value_ = (void *)v9;
    if (value)
      std::default_delete<CSAudioZeroFilterImpl<unsigned short>>::operator()[abi:ne180100](value);
  }
  return v8;
}

- (unint64_t)filterZerosInAudioPacket:(id)a3 atBufferHostTime:(unint64_t)a4 filteredPacket:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  double *value;
  _WORD *v12;
  unint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  __int16 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  char *v47;
  char *v48;
  unint64_t *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  __int16 v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  __int16 v63;
  void *v64;
  void *v66;
  id *v67;
  unint64_t v68;
  uint64_t v69;

  v8 = a3;
  v9 = v8;
  if (!a5)
  {
    a4 = 0;
    goto LABEL_108;
  }
  if (!v8 || !*(_QWORD *)self->_audioZeroFilterImpl.__ptr_.__value_)
  {
    *a5 = objc_retainAutorelease(v8);
    goto LABEL_108;
  }
  v10 = objc_msgSend(v8, "length");
  value = (double *)self->_audioZeroFilterImpl.__ptr_.__value_;
  v12 = (_WORD *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
  v69 = v10 >> 1;
  if (*(_QWORD *)value)
  {
    v13 = *((_QWORD *)value + 2);
    if (v13)
      a4 = (unint64_t)((double)a4 - (double)v13 * value[10]);
    v68 = a4;
    if (v10 >= 2)
    {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v69);
      v15 = &v17[2 * v18];
      v14 = v17;
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    if (*((_BYTE *)value + 10))
      v19 = 1;
    else
      v19 = *v12 == 0;
    v67 = a5;
    if (v10 >= 2)
    {
      v66 = v9;
      v23 = 0;
      v21 = 0;
      v22 = v14;
      do
      {
        if (v12[v23])
        {
          if (*((_BYTE *)value + 10))
          {
            v24 = *((_QWORD *)value + 2);
            if (v24 >= *(_QWORD *)value)
            {
              if (v19)
                v68 = (unint64_t)((double)v68 + (double)v24 * value[10]);
              v34 = *((_QWORD *)value + 5) - v24;
              v36 = (unint64_t *)*((_QWORD *)value + 8);
              v35 = *((_QWORD *)value + 9);
              if ((unint64_t)v36 >= v35)
              {
                v38 = *((_QWORD *)value + 7);
                v39 = ((uint64_t)v36 - v38) >> 4;
                if ((unint64_t)(v39 + 1) >> 60)
                  std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
                v40 = v35 - v38;
                v41 = v40 >> 3;
                if (v40 >> 3 <= (unint64_t)(v39 + 1))
                  v41 = v39 + 1;
                if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0)
                  v42 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v42 = v41;
                v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v42);
                v45 = (unint64_t *)&v43[16 * v39];
                v46 = *((_QWORD *)value + 2);
                *v45 = v34;
                v45[1] = v46;
                v48 = (char *)*((_QWORD *)value + 7);
                v47 = (char *)*((_QWORD *)value + 8);
                v49 = v45;
                if (v47 != v48)
                {
                  do
                  {
                    *((_OWORD *)v49 - 1) = *((_OWORD *)v47 - 1);
                    v49 -= 2;
                    v47 -= 16;
                  }
                  while (v47 != v48);
                  v47 = (char *)*((_QWORD *)value + 7);
                }
                v37 = v45 + 2;
                *((_QWORD *)value + 7) = v49;
                *((_QWORD *)value + 8) = v45 + 2;
                *((_QWORD *)value + 9) = &v43[16 * v44];
                if (v47)
                  operator delete(v47);
              }
              else
              {
                *v36 = v34;
                v36[1] = v24;
                v37 = v36 + 2;
              }
              *((_QWORD *)value + 8) = v37;
            }
            else
            {
              if (v24)
              {
                for (i = 0; i < v24; ++i)
                {
                  if (v22 >= v15)
                  {
                    v26 = v22 - v14;
                    if (v22 - v14 <= -3)
                      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
                    v27 = v26 >> 1;
                    if (v15 - v14 <= (unint64_t)((v26 >> 1) + 1))
                      v28 = v27 + 1;
                    else
                      v28 = v15 - v14;
                    if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL)
                      v29 = 0x7FFFFFFFFFFFFFFFLL;
                    else
                      v29 = v28;
                    if (v29)
                      v29 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v29);
                    else
                      v30 = 0;
                    v31 = (char *)(v29 + 2 * v27);
                    *(_WORD *)v31 = 0;
                    v32 = v31 + 2;
                    while (v22 != v14)
                    {
                      v33 = *((_WORD *)v22 - 1);
                      v22 -= 2;
                      *((_WORD *)v31 - 1) = v33;
                      v31 -= 2;
                    }
                    v15 = (char *)(v29 + 2 * v30);
                    if (v14)
                      operator delete(v14);
                    v14 = v31;
                    v22 = v32;
                  }
                  else
                  {
                    *(_WORD *)v22 = 0;
                    v22 += 2;
                  }
                  ++*((_QWORD *)value + 4);
                  v24 = *((_QWORD *)value + 2);
                }
              }
              v21 += v24;
            }
            v19 = 0;
            *((_BYTE *)value + 10) = 0;
            value[2] = 0.0;
          }
          if (!*((_BYTE *)value + 24) && (unsigned __int16)v12[v23] >= *((unsigned __int16 *)value + 4))
          {
            *((_BYTE *)value + 24) = 1;
            *((_DWORD *)value + 7) = *((_QWORD *)value + 5);
          }
          if (v22 >= v15)
          {
            v51 = v22 - v14;
            if (v22 - v14 <= -3)
              std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
            v52 = v51 >> 1;
            if (v15 - v14 <= (unint64_t)((v51 >> 1) + 1))
              v53 = v52 + 1;
            else
              v53 = v15 - v14;
            if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL)
              v54 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v54 = v53;
            if (v54)
              v54 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v54);
            else
              v55 = 0;
            v56 = (char *)(v54 + 2 * v52);
            *(_WORD *)v56 = v12[v23];
            v50 = v56 + 2;
            while (v22 != v14)
            {
              v57 = *((_WORD *)v22 - 1);
              v22 -= 2;
              *((_WORD *)v56 - 1) = v57;
              v56 -= 2;
            }
            v15 = (char *)(v54 + 2 * v55);
            if (v14)
              operator delete(v14);
            v14 = v56;
          }
          else
          {
            *(_WORD *)v22 = v12[v23];
            v50 = v22 + 2;
          }
          ++*((_QWORD *)value + 4);
          ++v21;
          v22 = v50;
        }
        else
        {
          ++*((_QWORD *)value + 2);
          *((_BYTE *)value + 10) = 1;
        }
        ++*((_QWORD *)value + 5);
        ++v23;
      }
      while (v23 != v69);
      v20 = (v22 - v14) >> 1;
      if (v21 > v20)
      {
        v58 = v21 - v20;
        v9 = v66;
        if (v21 - v20 > (v15 - v22) >> 1)
        {
          if ((v21 & 0x8000000000000000) != 0)
            std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
          if (v15 - v14 <= v21)
            v59 = v21;
          else
            v59 = v15 - v14;
          if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL)
            v60 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v60 = v59;
          a5 = v67;
          a4 = v68;
          v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v60) + 2 * v20;
          bzero(v61, 2 * v58);
          v62 = &v61[2 * v58];
          while (v22 != v14)
          {
            v63 = *((_WORD *)v22 - 1);
            v22 -= 2;
            *((_WORD *)v61 - 1) = v63;
            v61 -= 2;
          }
          if (v14)
            operator delete(v14);
          v14 = v61;
          goto LABEL_104;
        }
        bzero(v22, 2 * v58);
        v62 = &v22[2 * v58];
LABEL_103:
        a5 = v67;
        a4 = v68;
LABEL_104:
        v16 = v62 - v14;
        *((_QWORD *)value + 6) = (unint64_t)((double)a4 + (double)(unint64_t)((v62 - v14) >> 1)
                                                               * value[10]);
        if (v62 == v14)
          a4 = 0;
        goto LABEL_106;
      }
      v9 = v66;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = v14;
    }
    if (v20 <= v21)
      v62 = v22;
    else
      v62 = &v14[2 * v21];
    goto LABEL_103;
  }
  if (v10 > 1)
  {
    v64 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v69);
    v16 = v10 & 0xFFFFFFFFFFFFFFFELL;
    memmove(v64, v12, v10 & 0xFFFFFFFFFFFFFFFELL);
    v14 = (char *)v64;
  }
  else
  {
    v14 = 0;
    v16 = v10 & 0xFFFFFFFFFFFFFFFELL;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, v16, v66);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
    operator delete(v14);
LABEL_108:

  return a4;
}

- (unint64_t)endAudioAndFetchAnyTrailingZerosPacket:(id *)a3
{
  unint64_t *value;
  unint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _WORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t *v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  char *v28;
  char *v29;

  if (!a3)
    return 0;
  value = (unint64_t *)self->_audioZeroFilterImpl.__ptr_.__value_;
  v5 = value[2];
  if (v5 >= *value)
  {
    v14 = value[5] - v5;
    v16 = (unint64_t *)value[8];
    v15 = value[9];
    if ((unint64_t)v16 >= v15)
    {
      v18 = value[7];
      v19 = (uint64_t)((uint64_t)v16 - v18) >> 4;
      v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60)
        std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
      v21 = v15 - v18;
      if (v21 >> 3 > v20)
        v20 = v21 >> 3;
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
        v22 = 0xFFFFFFFFFFFFFFFLL;
      else
        v22 = v20;
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v22);
      v24 = (unint64_t *)&v23[16 * v19];
      v26 = &v23[16 * v25];
      v27 = value[2];
      *v24 = v14;
      v24[1] = v27;
      v17 = v24 + 2;
      v29 = (char *)value[7];
      v28 = (char *)value[8];
      if (v28 != v29)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)v28 - 1);
          v24 -= 2;
          v28 -= 16;
        }
        while (v28 != v29);
        v28 = (char *)value[7];
      }
      value[7] = (unint64_t)v24;
      value[8] = (unint64_t)v17;
      value[9] = (unint64_t)v26;
      if (v28)
        operator delete(v28);
    }
    else
    {
      *v16 = v14;
      v16[1] = v5;
      v17 = v16 + 2;
    }
    v5 = 0;
    v12 = 0;
    v13 = 0;
    value[8] = (unint64_t)v17;
    goto LABEL_32;
  }
  value[4] += v5;
  if (!v5)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_32;
  }
  if ((v5 & 0x8000000000000000) != 0)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v5);
  v7 = v6;
  v8 = &v6[2 * v5];
  v9 = 2 * v5;
  v10 = v6;
  do
  {
    *v10++ = 0;
    v9 -= 2;
  }
  while (v9);
  v11 = (uint64_t)(2 * v5) >> 1;
  if (v8 != v6)
  {
    if (((2 * v5) & 0x8000000000000000) != 0)
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v5 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(2 * v5) >> 1);
    memmove((void *)v5, v7, v8 - v7);
    if (!v7)
      goto LABEL_11;
    goto LABEL_10;
  }
  v5 = 0;
  if (v6)
LABEL_10:
    operator delete(v7);
LABEL_11:
  if (v8 == v7)
  {
    v13 = 0;
    v12 = v5;
  }
  else
  {
    v12 = v5 + 2 * v11;
    v13 = value[6];
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v12 - v5);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    operator delete((void *)v5);
  return v13;
}

- (id)metrics
{
  unsigned __int8 *value;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  value = (unsigned __int8 *)self->_audioZeroFilterImpl.__ptr_.__value_;
  v3 = (_QWORD *)*((_QWORD *)value + 7);
  v4 = (_QWORD *)*((_QWORD *)value + 8);
  if (v3 == v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *((_DWORD *)value + 7);
    v11 = value[24];
    do
    {
      if (!*v3)
        v5 = v3[1];
      if (v3[1] > v6)
        v6 = v3[1];
      if (v11 && v10 <= (int)*v3)
      {
        if ((unint64_t)v8 >= v9)
        {
          v12 = (v8 - v7) >> 4;
          v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 60)
            std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v9 - (_QWORD)v7) >> 3 > v13)
            v13 = (uint64_t)(v9 - (_QWORD)v7) >> 3;
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF0)
            v14 = 0xFFFFFFFFFFFFFFFLL;
          else
            v14 = v13;
          if (v14)
            v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v14);
          else
            v15 = 0;
          v16 = (_OWORD *)(v14 + 16 * v12);
          *v16 = *(_OWORD *)v3;
          if (v8 == v7)
          {
            v18 = (char *)(v14 + 16 * v12);
          }
          else
          {
            v17 = v14 + 16 * v12;
            do
            {
              v18 = (char *)(v17 - 16);
              *(_OWORD *)(v17 - 16) = *((_OWORD *)v8 - 1);
              v8 -= 16;
              v17 -= 16;
            }
            while (v8 != v7);
          }
          v9 = v14 + 16 * v15;
          v8 = (char *)(v16 + 1);
          if (v7)
            operator delete(v7);
          v7 = v18;
        }
        else
        {
          *(_OWORD *)v8 = *(_OWORD *)v3;
          v8 += 16;
        }
      }
      v3 += 2;
    }
    while (v3 != v4);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    v19 = v7;
    do
    {
      v30[0] = CFSTR("start");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = CFSTR("len");
      v31[0] = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)v19 + 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v22);

      v19 += 16;
    }
    while (v19 != v8);
  }
  v28[0] = CFSTR("CSInitialContinuousZeros");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = CFSTR("CSMaxContinuousZeros");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = CFSTR("CSMidSegmentContinuousZeros");
  v29[1] = v24;
  v29[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    operator delete(v7);
  return v25;
}

- (void).cxx_destruct
{
  void *value;

  value = self->_audioZeroFilterImpl.__ptr_.__value_;
  self->_audioZeroFilterImpl.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<CSAudioZeroFilterImpl<unsigned short>>::operator()[abi:ne180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
