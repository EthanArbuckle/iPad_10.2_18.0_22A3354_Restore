void sub_210AFBC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  void *v13;

  operator delete(v11);
  v13 = *(void **)a11;
  if (*(_QWORD *)a11)
  {
    *(_QWORD *)(a11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(a1);
}

const void **ausdk::Owned<__CFString const*>::operator=(const void **a1, const void *a2)
{
  const void *v3;

  v3 = *a1;
  if (v3 != a2)
  {
    ausdk::Owned<__CFString const*>::releaseRef(v3);
    *a1 = a2;
    ausdk::Owned<__CFString const*>::retainRef(a2);
  }
  return a1;
}

const unsigned __int8 *ausdk::AUScope::RestoreState(ausdk::AUScope *this, const unsigned __int8 *a2)
{
  unint64_t v4;
  uint64_t v5;
  ausdk::AUElement *v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;

  v4 = bswap32(*(_DWORD *)a2);
  v5 = *((_QWORD *)this + 5);
  if (v5)
  {
    v6 = (ausdk::AUElement *)(*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v5 + 32))(v5, v4);
    if (!v6)
      return &a2[8 * bswap32(*((_DWORD *)a2 + 1)) + 8];
  }
  else
  {
    v8 = (char *)this + 16;
    v7 = *((_QWORD *)this + 2);
    if (v4 >= (*((_QWORD *)v8 + 1) - v7) >> 3)
      return &a2[8 * bswap32(*((_DWORD *)a2 + 1)) + 8];
    v6 = *(ausdk::AUElement **)(v7 + 8 * v4);
    if (!v6)
      return &a2[8 * bswap32(*((_DWORD *)a2 + 1)) + 8];
  }
  v9 = *((_DWORD *)a2 + 1);
  v10 = (unsigned int *)(a2 + 8);
  if (v9)
  {
    v11 = bswap32(v9);
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    do
    {
      v13 = *v10;
      v14 = v10[1];
      v10 += 2;
      ausdk::AUElement::SetParameter(v6, bswap32(v13), COERCE_FLOAT(bswap32(v14)), 0);
      --v12;
    }
    while (v12);
  }
  return (const unsigned __int8 *)v10;
}

void ausdk::AUEffectBase::~AUEffectBase(ausdk::AUEffectBase *this)
{
  void **v2;

  *(_QWORD *)this = &off_24CA94B10;
  v2 = (void **)((char *)this + 528);
  std::vector<std::unique_ptr<ausdk::AUKernelBase>>::__destroy_vector::operator()[abi:ne180100](&v2);
  ausdk::AUBase::~AUBase(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_24CA94B10;
  v2 = (void **)((char *)this + 528);
  std::vector<std::unique_ptr<ausdk::AUKernelBase>>::__destroy_vector::operator()[abi:ne180100](&v2);
  ausdk::AUBase::~AUBase(this);
  JUMPOUT(0x212BCDF50);
}

uint64_t ausdk::AUEffectBase::Initialize(int64x2_t *this)
{
  ausdk::AUScope *v2;
  int v3;
  int v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v8;
  uint64_t v9;
  __int16 *v10;
  int v11;
  int v12;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  int64x2_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  int64x2_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD v63[2];
  int64x2_t *v64;

  v2 = (ausdk::AUScope *)&this[5];
  v3 = *(_DWORD *)(ausdk::AUScope::SafeGetElement((ausdk::AUScope *)&this[5], 0) + 108);
  v4 = *(_DWORD *)(ausdk::AUScope::SafeGetElement((ausdk::AUScope *)&this[8], 0) + 108);
  v61 = 0;
  v5 = (*(uint64_t (**)(int64x2_t *, uint64_t *))(this->i64[0] + 376))(this, &v61);
  if (v5)
    v6 = v61 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v9 = 0;
    while (1)
    {
      v10 = (__int16 *)(v61 + 4 * v9);
      v11 = *v10;
      v12 = v10[1];
      if (v11 < 0 && v12 < 0)
      {
        if (v11 == -1 && v12 == -2)
          goto LABEL_10;
        v14 = (v11 & v12) == 0xFFFFFFFF && (unsigned __int16)(v4 ^ v3) == 0;
        v15 = v14;
        v16 = v12 == -1 && v11 == -2;
        if (v16 || v15)
          goto LABEL_10;
LABEL_44:
        if (++v9 >= (unint64_t)v5)
          return 4294956428;
      }
      else
      {
        if (v11 != -1 && (__int16)v3 != v11)
          goto LABEL_44;
        v19 = v12 == -1 || (__int16)v4 == v12;
        if (++v9 >= (unint64_t)v5 || v19)
        {
          if (!v19)
            return 4294956428;
LABEL_10:
          if (this[36].i8[8])
            v8 = 1;
          else
            v8 = *(_DWORD *)(ausdk::AUScope::SafeGetElement((ausdk::AUScope *)&this[8], 0) + 108);
          v21 = this[33].i64[1];
          v22 = this[33].i64[0];
          v23 = v21 - v22;
          v24 = (v21 - v22) >> 3;
          v25 = v8;
          if (v24 >= v8)
          {
            if (v24 > v8)
            {
              v33 = (uint64_t *)(v21 - 8);
              v34 = v21 - 8;
              do
              {
                v35 = *v33;
                *v33 = 0;
                if (v35)
                  (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
                this[33].i64[1] = (uint64_t)v33;
                v36 = v34 - this[33].i64[0];
                v34 -= 8;
                --v33;
              }
              while (v25 < v36 >> 3);
            }
          }
          else
          {
            if (v8 > (unint64_t)((this[34].i64[0] - v22) >> 3))
            {
              v64 = this + 34;
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PitchShifter3 *>>(v8);
              v28 = (_QWORD *)this[33].i64[1];
              v29 = (_QWORD *)this[33].i64[0];
              if (v28 == v29)
              {
                v32 = vdupq_n_s64((unint64_t)v28);
                v30 = &v26[8 * v24];
              }
              else
              {
                v30 = &v26[8 * v24];
                do
                {
                  v31 = *--v28;
                  *v28 = 0;
                  *((_QWORD *)v30 - 1) = v31;
                  v30 -= 8;
                }
                while (v28 != v29);
                v32 = this[33];
              }
              this[33].i64[0] = (uint64_t)v30;
              this[33].i64[1] = (uint64_t)&v26[8 * v24];
              *(int64x2_t *)((char *)v63 + 8) = v32;
              v37 = this[34].i64[0];
              this[34].i64[0] = (uint64_t)&v26[8 * v27];
              *((_QWORD *)&v63[1] + 1) = v37;
              *(_QWORD *)&v63[0] = v32.i64[0];
              std::__split_buffer<std::unique_ptr<AT::Resampler>>::~__split_buffer((uint64_t)v63);
              v23 = this[33].i64[1] - this[33].i64[0];
            }
            v38 = v23 >> 3;
            if (v25 > (v23 >> 3))
            {
              do
              {
                (*(void (**)(uint64_t *__return_ptr, int64x2_t *))(this->i64[0] + 576))(&v62, this);
                v39 = (_QWORD *)this[33].i64[1];
                v40 = this[34].u64[0];
                if ((unint64_t)v39 >= v40)
                {
                  v43 = this[33].i64[0];
                  v44 = ((uint64_t)v39 - v43) >> 3;
                  if ((unint64_t)(v44 + 1) >> 61)
                    std::vector<void const*>::__throw_length_error[abi:ne180100]();
                  v45 = v40 - v43;
                  v46 = v45 >> 2;
                  if (v45 >> 2 <= (unint64_t)(v44 + 1))
                    v46 = v44 + 1;
                  if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
                    v47 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v47 = v46;
                  v64 = this + 34;
                  if (v47)
                    v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PitchShifter3 *>>(v47);
                  else
                    v48 = 0;
                  v49 = (_QWORD *)(v47 + 8 * v44);
                  v50 = v47 + 8 * v48;
                  *((_QWORD *)&v63[1] + 1) = v50;
                  v51 = v62;
                  v62 = 0;
                  *v49 = v51;
                  v42 = v49 + 1;
                  *(_QWORD *)&v63[1] = v49 + 1;
                  v52 = (_QWORD *)this[33].i64[1];
                  v53 = (_QWORD *)this[33].i64[0];
                  if (v52 == v53)
                  {
                    v55 = vdupq_n_s64((unint64_t)v52);
                  }
                  else
                  {
                    do
                    {
                      v54 = *--v52;
                      *v52 = 0;
                      *--v49 = v54;
                    }
                    while (v52 != v53);
                    v55 = this[33];
                    v50 = *((_QWORD *)&v63[1] + 1);
                    v42 = *(_QWORD **)&v63[1];
                  }
                  this[33].i64[0] = (uint64_t)v49;
                  this[33].i64[1] = (uint64_t)v42;
                  *(int64x2_t *)((char *)v63 + 8) = v55;
                  v56 = this[34].i64[0];
                  this[34].i64[0] = v50;
                  *((_QWORD *)&v63[1] + 1) = v56;
                  *(_QWORD *)&v63[0] = v55.i64[0];
                  std::__split_buffer<std::unique_ptr<AT::Resampler>>::~__split_buffer((uint64_t)v63);
                }
                else
                {
                  v41 = v62;
                  v62 = 0;
                  *v39 = v41;
                  v42 = v39 + 1;
                }
                this[33].i64[1] = (uint64_t)v42;
                v57 = v62;
                v62 = 0;
                if (v57)
                  (*(void (**)(uint64_t))(*(_QWORD *)v57 + 8))(v57);
                LODWORD(v38) = v38 + 1;
              }
              while ((_DWORD)v38 != (_DWORD)v25);
            }
          }
          if ((_DWORD)v25)
          {
            v58 = 0;
            v59 = this[33].i64[0];
            do
            {
              v60 = *(_QWORD *)(v59 + 8 * v58);
              if (v60)
                *(_DWORD *)(v60 + 16) = v58;
              ++v58;
            }
            while (v25 != v58);
          }
          this[35].i64[1] = ausdk::AUScope::SafeGetElement((ausdk::AUScope *)&this[8], 0);
          this[36].i64[0] = ausdk::AUScope::SafeGetElement(v2, 0);
          v64 = 0;
          memset(v63, 0, sizeof(v63));
          (*(void (**)(_OWORD *__return_ptr, int64x2_t *, uint64_t, _QWORD))(this->i64[0] + 392))(v63, this, 2, 0);
          result = 0;
          this[36].i32[3] = DWORD2(v63[1]);
          return result;
        }
      }
    }
  }
  if (v4 << 16 == v3 << 16 && v4 << 16 != 0)
    goto LABEL_10;
  return 4294956428;
}

void sub_210AFC2D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

double ausdk::AUEffectBase::Cleanup(ausdk::AUEffectBase *this)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v2 = (_QWORD *)*((_QWORD *)this + 67);
  v3 = (_QWORD *)*((_QWORD *)this + 66);
  while (v2 != v3)
  {
    v5 = *--v2;
    v4 = v5;
    *v2 = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  *((_QWORD *)this + 67) = v3;
  result = 0.0;
  *(_OWORD *)((char *)this + 568) = 0u;
  return result;
}

uint64_t ausdk::AUEffectBase::Reset(ausdk::AUEffectBase *this)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)*((_QWORD *)this + 66);
  v2 = (_QWORD *)*((_QWORD *)this + 67);
  while (v1 != v2)
  {
    if (*v1)
      (*(void (**)(_QWORD))(*(_QWORD *)*v1 + 16))(*v1);
    ++v1;
  }
  return 0;
}

uint64_t ausdk::AUEffectBase::GetPropertyInfo(ausdk::AUEffectBase *this, int a2, int a3, unsigned int a4, unsigned int *a5, BOOL *a6)
{
  uint64_t result;

  if (a3 || (a2 | 8) != 0x1D)
    return 4294956417;
  result = 0;
  *a6 = 1;
  *a5 = 4;
  return result;
}

uint64_t ausdk::AUEffectBase::GetProperty(ausdk::AUEffectBase *this, int a2, int a3, unsigned int a4, _DWORD *a5)
{
  uint64_t result;
  unsigned __int8 *v6;

  if (a3)
    return 4294956417;
  if (a2 == 29)
  {
    v6 = (unsigned __int8 *)this + 554;
  }
  else
  {
    if (a2 != 21)
      return 4294956417;
    v6 = (unsigned __int8 *)this + 552;
  }
  result = 0;
  *a5 = *v6;
  return result;
}

uint64_t ausdk::AUEffectBase::SetProperty(ausdk::AUEffectBase *this, int a2, int a3, unsigned int a4, int *a5, unsigned int a6)
{
  uint64_t result;
  int v8;

  if (a3)
    return 4294956417;
  if (a2 == 29)
  {
    result = 0;
    *((_BYTE *)this + 554) = *a5 != 0;
  }
  else if (a2 == 21)
  {
    if (a6 < 4)
    {
      return 4294956445;
    }
    else
    {
      v8 = *a5;
      if ((*a5 != 0) != (*((_BYTE *)this + 552) != 0))
      {
        if (!v8 && *((_BYTE *)this + 552))
        {
          if (*((_BYTE *)this + 17))
            (*(void (**)(ausdk::AUEffectBase *, _QWORD, _QWORD))(*(_QWORD *)this + 72))(this, 0, 0);
        }
        (*(void (**)(ausdk::AUEffectBase *, BOOL))(*(_QWORD *)this + 584))(this, v8 != 0);
      }
      return 0;
    }
  }
  else
  {
    return 4294956417;
  }
  return result;
}

uint64_t ausdk::AUEffectBase::ProcessBufferLists(ausdk::AUEffectBase *this, unsigned int *a2, const AudioBufferList *a3, AudioBufferList *a4, uint64_t a5)
{
  int v10;
  double v11;
  double v12;
  double v13;
  char v14;
  unsigned int v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  char v24;

  if (((*(uint64_t (**)(ausdk::AUEffectBase *))(*(_QWORD *)this + 592))(this) & 1) != 0)
    return 0;
  v10 = *a2;
  v11 = *(double *)(ausdk::AUScope::SafeGetElement((ausdk::AUEffectBase *)((char *)this + 128), 0) + 80);
  v12 = (*(double (**)(ausdk::AUEffectBase *))(*(_QWORD *)this + 344))(this);
  (*(void (**)(ausdk::AUEffectBase *))(*(_QWORD *)this + 352))(this);
  if ((v10 & 0x10) == 0)
  {
    v14 = 0;
    *((_BYTE *)this + 560) = 1;
    goto LABEL_11;
  }
  if (*((_BYTE *)this + 560))
  {
    v15 = (v11 * (v12 + v13));
    *((_DWORD *)this + 139) = v15;
    *((_BYTE *)this + 560) = 0;
    if (v15)
    {
LABEL_6:
      v14 = 0;
      v16 = v15 >= a5;
      v17 = v15 - a5;
      if (!v16)
        v17 = 0;
      *((_DWORD *)this + 139) = v17;
      goto LABEL_11;
    }
  }
  else
  {
    v15 = *((_DWORD *)this + 139);
    if (v15)
      goto LABEL_6;
  }
  v14 = 1;
LABEL_11:
  *a2 |= 0x10u;
  v18 = *((_QWORD *)this + 67);
  v19 = *((_QWORD *)this + 66);
  if (v18 != v19)
  {
    v20 = 0;
    v21 = 1;
    do
    {
      v22 = *(_QWORD *)(v19 + 8 * v20);
      if (v22)
      {
        v24 = v14;
        (*(void (**)(uint64_t, void *, void *, uint64_t, char *))(*(_QWORD *)v22 + 24))(v22, a3->mBuffers[v20].mData, a4->mBuffers[v20].mData, a5, &v24);
        if (!v24)
          *a2 &= ~0x10u;
        v18 = *((_QWORD *)this + 67);
        v19 = *((_QWORD *)this + 66);
      }
      v20 = v21++;
    }
    while (v20 < (v18 - v19) >> 3);
  }
  return 0;
}

uint64_t ausdk::AUEffectBase::Render(ausdk::AUInputElement **this, unsigned int *a2, const AudioTimeStamp *a3, uint64_t a4)
{
  uint64_t v8;
  ausdk::AUInputElement *v9;
  const AudioBufferList *BufferList;
  ausdk::AUInputElement *v11;
  AudioBufferList *v12;
  ausdk::AUInputElement *v14;
  ausdk::AUInputElement *v15;
  unsigned int *v16;
  uint64_t v17;
  unsigned int *v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _DWORD *v26;
  unsigned int *v27;
  unsigned int v28;
  void **v29;
  _QWORD v30[3];

  if (!ausdk::AUBase::HasInput((ausdk::AUBase *)this, 0))
    return 4294956420;
  v8 = ausdk::AUInputElement::PullInput(this[72], a2, a3, 0, a4);
  if (!(_DWORD)v8)
  {
    if (*((_BYTE *)this + 554))
    {
      v9 = this[71];
      if (*((_BYTE *)v9 + 168))
      {
        BufferList = (const AudioBufferList *)ausdk::AUBufferList::GetBufferList((ausdk::AUInputElement *)((char *)this[72] + 144));
        ausdk::AUBufferList::SetBufferList((ausdk::AUInputElement *)((char *)v9 + 144), BufferList);
      }
    }
    if ((*((unsigned int (**)(ausdk::AUInputElement **))*this + 74))(this))
    {
      if (!*((_BYTE *)this + 554))
      {
        v11 = this[72];
        v12 = (AudioBufferList *)ausdk::AUBufferList::GetBufferList((ausdk::AUInputElement *)((char *)this[71] + 144));
        ausdk::AUBufferList::CopyBufferContentsTo((_QWORD *)v11 + 18, v12);
      }
      v8 = 0;
    }
    else
    {
      v14 = this[48];
      v15 = this[49];
      v16 = (unsigned int *)ausdk::AUBufferList::GetBufferList((ausdk::AUInputElement *)((char *)this[72] + 144));
      v17 = ausdk::AUBufferList::GetBufferList((ausdk::AUInputElement *)((char *)this[71] + 144));
      v18 = (unsigned int *)v17;
      if (v14 == v15)
      {
        v8 = (*((uint64_t (**)(ausdk::AUInputElement **, unsigned int *, unsigned int *, uint64_t, uint64_t))*this
              + 22))(this, a2, v16, v17, a4);
      }
      else
      {
        v30[0] = a2;
        v30[1] = v16;
        v30[2] = v17;
        v8 = (*((uint64_t (**)(ausdk::AUInputElement **, char *, uint64_t, _QWORD *))*this + 70))(this, (char *)this + 384, a4, v30);
        v19 = *((_DWORD *)this + 147) * a4;
        v20 = *v16;
        if ((_DWORD)v20)
        {
          v21 = v16 + 4;
          do
          {
            v22 = (*((_DWORD *)v21 - 2) * v19);
            *v21 -= v22;
            *((_DWORD *)v21 - 1) = v22;
            v21 += 2;
            --v20;
          }
          while (v20);
        }
        v23 = *v18;
        if ((_DWORD)v23)
        {
          v24 = v18 + 4;
          do
          {
            v25 = (*((_DWORD *)v24 - 2) * v19);
            *v24 -= v25;
            *((_DWORD *)v24 - 1) = v25;
            v24 += 2;
            --v23;
          }
          while (v23);
        }
      }
    }
    if ((*(_BYTE *)a2 & 0x10) != 0 && !*((_BYTE *)this + 554))
    {
      v26 = (_DWORD *)ausdk::AUBufferList::GetBufferList((ausdk::AUInputElement *)((char *)this[71] + 144));
      if (*v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = (void **)(v26 + 4);
        do
        {
          bzero(*v29, *((unsigned int *)v29 - 1));
          ++v28;
          v29 += 2;
        }
        while (v28 < *v27);
      }
    }
  }
  return v8;
}

BOOL ausdk::AUEffectBase::StreamFormatWritable(ausdk::AUEffectBase *this)
{
  return *((_BYTE *)this + 17) == 0;
}

uint64_t ausdk::AUEffectBase::ChangeStreamFormat(ausdk::AUEffectBase *this, uint64_t a2, uint64_t a3, const AudioStreamBasicDescription *a4, const AudioStreamBasicDescription *a5)
{
  ausdk::AUBase::ChangeStreamFormat(this, a2, a3, a4, a5);
  if (*((_BYTE *)this + 553) && a4->mSampleRate != a5->mSampleRate)
    (*(void (**)(ausdk::AUEffectBase *, uint64_t, _QWORD, _QWORD, Float64))(*(_QWORD *)this + 432))(this, 3, 0, 0, a4->mSampleRate);
  return 0;
}

uint64_t ausdk::AUEffectBase::ProcessScheduledSlice(ausdk::AUEffectBase *this, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;

  v5 = *a2;
  v7 = (unsigned int *)a2[1];
  v6 = (unsigned int *)a2[2];
  v8 = *((_DWORD *)this + 147) * a4;
  v9 = *v7;
  if ((_DWORD)v9)
  {
    v10 = v7 + 3;
    do
    {
      *v10 = *(v10 - 1) * v8;
      v10 += 4;
      --v9;
    }
    while (v9);
  }
  v11 = *v6;
  if ((_DWORD)v11)
  {
    v12 = v6 + 3;
    do
    {
      *v12 = *(v12 - 1) * v8;
      v12 += 4;
      --v11;
    }
    while (v11);
  }
  result = (*(uint64_t (**)(ausdk::AUEffectBase *, uint64_t, unsigned int *, unsigned int *, uint64_t))(*(_QWORD *)this + 176))(this, v5, v7, v6, a4);
  v14 = *v7;
  if ((_DWORD)v14)
  {
    v15 = v7 + 4;
    do
    {
      *v15 += (*((_DWORD *)v15 - 2) * v8);
      v15 += 2;
      --v14;
    }
    while (v14);
  }
  v16 = *v6;
  if ((_DWORD)v16)
  {
    v17 = v6 + 4;
    do
    {
      *v17 += (*((_DWORD *)v17 - 2) * v8);
      v17 += 2;
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t ausdk::AUBase::Initialize(ausdk::AUBase *this)
{
  return 0;
}

uint64_t ausdk::AUBase::Reset(ausdk::AUBase *this)
{
  return 0;
}

uint64_t ausdk::AUBase::GetPropertyInfo(ausdk::AUBase *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int *a5, BOOL *a6)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::GetProperty(ausdk::AUBase *this, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::SetProperty(ausdk::AUBase *this, unsigned int a2, unsigned int a3, unsigned int a4, const void *a5)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::RemovePropertyValue(ausdk::AUBase *this)
{
  return 4294956445;
}

uint64_t ausdk::AUBase::RemovePropertyListener(ausdk::AUBase *this, int a2, void (*a3)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int), void *a4, int a5)
{
  __int128 *v5;
  uint64_t v6;
  __int128 *v8;
  __int128 v9;

  v6 = *((_QWORD *)this + 51);
  v5 = (__int128 *)*((_QWORD *)this + 52);
  if ((__int128 *)v6 != v5)
  {
    while (*(_DWORD *)v6 != a2
         || *(void (**)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int))(v6 + 8) != a3
         || a5 && *(void **)(v6 + 16) != a4)
    {
      v6 += 24;
      if ((__int128 *)v6 == v5)
        return 0;
    }
    if ((__int128 *)v6 != v5)
    {
      v8 = (__int128 *)(v6 + 24);
      if ((__int128 *)(v6 + 24) != v5)
      {
        do
        {
          if (*(_DWORD *)v8 != a2
            || *((void (**)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int))v8
               + 1) != a3
            || a5 && *((void **)v8 + 2) != a4)
          {
            v9 = *v8;
            *(_QWORD *)(v6 + 16) = *((_QWORD *)v8 + 2);
            *(_OWORD *)v6 = v9;
            v6 += 24;
          }
          v8 = (__int128 *)((char *)v8 + 24);
        }
        while (v8 != v5);
        v5 = (__int128 *)*((_QWORD *)this + 52);
      }
      if ((__int128 *)v6 != v5)
        *((_QWORD *)this + 52) = v6;
    }
  }
  return 0;
}

uint64_t ausdk::AUBase::SetRenderNotification(ausdk::AUBase *this, int (*a2)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *a3)
{
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;

  if (!a2)
    return 4294967246;
  *((_BYTE *)this + 248) = 1;
  ausdk::AUThreadSafeList<ausdk::AUBase::RenderCallback>::AllocNode((uint64_t)this + 224);
  *(_DWORD *)(v6 + 8) = 1;
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = (unint64_t *)((char *)this + 232);
LABEL_3:
  v8 = atomic_load(v7);
  *(_QWORD *)v6 = v8;
  do
  {
    v9 = __ldaxr(v7);
    if (v9 != v8)
    {
      __clrex();
      goto LABEL_3;
    }
  }
  while (__stlxr(v6, v7));
  return 0;
}

uint64_t ausdk::AUBase::RemoveRenderNotification(ausdk::AUBase *this, int (*a2)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *a3)
{
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;

  ausdk::AUThreadSafeList<ausdk::AUBase::RenderCallback>::AllocNode((uint64_t)this + 224);
  *(_DWORD *)(v6 + 8) = 2;
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = (unint64_t *)((char *)this + 232);
LABEL_2:
  v8 = atomic_load(v7);
  *(_QWORD *)v6 = v8;
  do
  {
    v9 = __ldaxr(v7);
    if (v9 != v8)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(v6, v7));
  return 0;
}

uint64_t ausdk::AUBase::ScheduleParameter(ausdk::AUBase *this, const AudioUnitParameterEvent *a2, int a3)
{
  int v6;
  int v7;
  uint64_t v8;
  const AudioUnitParameterEvent *v9;
  _OWORD *v10;
  unint64_t v11;
  AudioUnitParameterEvent::$30DB46DA13B14C3192C3DF0E34A08043 v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  AudioUnitParameterEvent::$30DB46DA13B14C3192C3DF0E34A08043 eventValues;
  char *v22;
  char *v23;
  _OWORD *v24;
  __int128 v25;

  v6 = (*(uint64_t (**)(ausdk::AUBase *))(*(_QWORD *)this + 160))(this);
  if (a3)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = &a2[v8];
      if (v9->eventType == kParameterEvent_Immediate)
        (*(void (**)(ausdk::AUBase *, _QWORD, _QWORD, _QWORD, _QWORD, AudioUnitParameterValue))(*(_QWORD *)this + 152))(this, v9->parameter, v9->scope, v9->element, v9->eventValues.immediate.bufferOffset, v9->eventValues.immediate.value);
      if (v7)
      {
        v10 = (_OWORD *)*((_QWORD *)this + 49);
        v11 = *((_QWORD *)this + 50);
        if ((unint64_t)v10 >= v11)
        {
          v14 = *((_QWORD *)this + 48);
          v15 = ((uint64_t)v10 - v14) >> 5;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 59)
            std::vector<void const*>::__throw_length_error[abi:ne180100]();
          v17 = v11 - v14;
          if (v17 >> 4 > v16)
            v16 = v17 >> 4;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0)
            v18 = 0x7FFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioUnitParameterEvent>>(v18);
          else
            v19 = 0;
          v20 = (_OWORD *)(v18 + 32 * v15);
          eventValues = v9->eventValues;
          *v20 = *(_OWORD *)&v9->scope;
          v20[1] = eventValues;
          v23 = (char *)*((_QWORD *)this + 48);
          v22 = (char *)*((_QWORD *)this + 49);
          v24 = v20;
          if (v22 != v23)
          {
            do
            {
              v25 = *((_OWORD *)v22 - 1);
              *(v24 - 2) = *((_OWORD *)v22 - 2);
              *(v24 - 1) = v25;
              v24 -= 2;
              v22 -= 32;
            }
            while (v22 != v23);
            v22 = (char *)*((_QWORD *)this + 48);
          }
          v13 = v20 + 2;
          *((_QWORD *)this + 48) = v24;
          *((_QWORD *)this + 49) = v20 + 2;
          *((_QWORD *)this + 50) = v18 + 32 * v19;
          if (v22)
            operator delete(v22);
        }
        else
        {
          v12 = v9->eventValues;
          *v10 = *(_OWORD *)&v9->scope;
          v10[1] = v12;
          v13 = v10 + 2;
        }
        *((_QWORD *)this + 49) = v13;
      }
      ++v8;
    }
    while (v8 != a3);
  }
  return 0;
}

uint64_t ausdk::AUBase::SetBusCount(ausdk::AUBase *this, unsigned int a2, unsigned int a3)
{
  int64x2_t *Scope;

  if (*((_BYTE *)this + 17))
    return 4294956447;
  Scope = (int64x2_t *)ausdk::AUBase::GetScope(this, a2);
  ausdk::AUScope::SetNumberOfElements(Scope, a3);
  return 0;
}

uint64_t ausdk::AUBase::GetParameterList(ausdk::AUBase *this, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  _QWORD *Scope;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  Scope = (_QWORD *)ausdk::AUBase::GetScope(this, a2);
  v7 = Scope[5];
  if (v7)
  {
    LODWORD(v8) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if ((_DWORD)v8)
      goto LABEL_3;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v8 = (Scope[3] - Scope[2]) >> 3;
  if (!(_DWORD)v8)
    goto LABEL_14;
LABEL_3:
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v8;
  do
  {
    v13 = Scope[5];
    if (v13)
      v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 32))(v13, v9);
    else
      v14 = *(_QWORD *)(Scope[2] + 8 * v9);
    v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
    if (v15 > v10)
    {
      v11 = v14;
      v10 = v15;
    }
    ++v9;
  }
  while (v12 != v9);
  if (a3 && v11)
    (*(void (**)(uint64_t, unsigned int *))(*(_QWORD *)v11 + 24))(v11, a3);
LABEL_15:
  *a4 = v10;
  return 0;
}

uint64_t ausdk::AUBase::GetParameterInfo(ausdk::AUBase *this, unsigned int a2, unsigned int a3, AudioUnitParameterInfo *a4)
{
  return 4294956418;
}

uint64_t ausdk::AUBase::GetParameterHistoryInfo(ausdk::AUBase *this, unsigned int a2, unsigned int a3, float *a4, float *a5)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::SaveState(ausdk::AUBase *this, __CFDictionary **a2)
{
  __CFData *Mutable;
  unsigned int v3;
  uint64_t Scope;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Length;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int *v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  ausdk::AUScope *v22;
  __CFDictionary *v23;
  unsigned int v24;
  const CFDictionaryKeyCallBacks *v25;
  const CFDictionaryValueCallBacks *v26;
  uint64_t v27;
  __CFDictionary *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFStringRef v35;
  const void *v36;
  CFStringRef v37;
  __CFDictionary *theDict;
  unsigned int v41;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46[2];
  int v47[2];
  int v48;
  UInt8 v49[4];
  UInt8 v50[4];
  UInt8 bytes[16];
  __int128 v52;
  __int128 v53;
  CFTypeRef v54[2];
  CFTypeRef cf[2];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v46 = 0;
  *(_QWORD *)v47 = 0;
  v48 = 0;
  ausdk::ComponentBase::GetComponentDescription((ausdk::ComponentBase *)v46, *((OpaqueAudioComponentInstance **)this + 1));
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  AddNumToDictionary(theDict, CFSTR("version"), 0);
  AddNumToDictionary(theDict, CFSTR("type"), v46[0]);
  AddNumToDictionary(theDict, CFSTR("subtype"), v46[1]);
  v45 = v47[0];
  AddNumToDictionary(theDict, CFSTR("manufacturer"), v47[0]);
  Mutable = CFDataCreateMutable(0, 0);
  v3 = 0;
  do
  {
    Scope = ausdk::AUBase::GetScope(this, v3);
    v5 = *(_QWORD *)(Scope + 40);
    v41 = v3;
    if (!v5)
    {
      v6 = (*(_QWORD *)(Scope + 24) - *(_QWORD *)(Scope + 16)) >> 3;
      if (!(_DWORD)v6)
        goto LABEL_41;
LABEL_6:
      v7 = 0;
      v43 = Scope;
      v44 = v6;
      while (1)
      {
        v8 = *(_QWORD *)(Scope + 40);
        if (v8)
          v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 32))(v8, v7);
        else
          v9 = *(_QWORD *)(*(_QWORD *)(Scope + 16) + 8 * v7);
        if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9))
          goto LABEL_40;
        *(_DWORD *)bytes = bswap32(*(_DWORD *)(Scope + 8));
        CFDataAppendBytes(Mutable, bytes, 4);
        *(_DWORD *)bytes = bswap32(v7);
        CFDataAppendBytes(Mutable, bytes, 4);
        v10 = *(unsigned int *)(Scope + 8);
        v57 = 0;
        *(_OWORD *)cf = 0u;
        v56 = 0u;
        v53 = 0u;
        *(_OWORD *)v54 = 0u;
        *(_OWORD *)bytes = 0u;
        v52 = 0u;
        Length = CFDataGetLength(Mutable);
        *(_DWORD *)v49 = 0;
        CFDataAppendBytes(Mutable, v49, 4);
        if (*(_BYTE *)(v9 + 40))
        {
          v12 = *(_QWORD *)(v9 + 56) - *(_QWORD *)(v9 + 48);
          if ((v12 & 0x3FFFFFFFCLL) != 0)
          {
            v13 = 0;
            v14 = 0;
            v15 = (v12 >> 2);
            do
            {
              v16 = atomic_load((unsigned int *)(*(_QWORD *)(v9 + 48) + 4 * v13));
              if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t, UInt8 *))(**(_QWORD **)(v9 + 8) + 256))(*(_QWORD *)(v9 + 8), v10, v13, bytes))
              {
                goto LABEL_15;
              }
              if ((v57 & 0x10) != 0)
              {
                if (cf[1])
                  CFRelease(cf[1]);
                if ((_DWORD)v56 == 26 && v54[1])
                  CFRelease(v54[1]);
              }
              if ((v57 & 0xA000) == 0)
              {
LABEL_15:
                *(_DWORD *)v50 = bswap32(v13);
                CFDataAppendBytes(Mutable, v50, 4);
                *(_DWORD *)v50 = bswap32(v16);
                CFDataAppendBytes(Mutable, v50, 4);
                ++v14;
              }
              ++v13;
            }
            while (v15 != v13);
            goto LABEL_39;
          }
        }
        else
        {
          v17 = *(unsigned int **)(v9 + 16);
          v18 = *(unsigned int **)(v9 + 24);
          if (v17 != v18)
          {
            v14 = 0;
            do
            {
              v19 = *v17;
              v20 = atomic_load(v17 + 1);
              if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t, UInt8 *))(**(_QWORD **)(v9 + 8) + 256))(*(_QWORD *)(v9 + 8), v10, v19, bytes))
              {
                goto LABEL_28;
              }
              if ((v57 & 0x10) != 0)
              {
                if (cf[1])
                  CFRelease(cf[1]);
                if ((_DWORD)v56 == 26 && v54[1])
                  CFRelease(v54[1]);
              }
              if ((v57 & 0xA000) == 0)
              {
LABEL_28:
                *(_DWORD *)v50 = bswap32(v19);
                CFDataAppendBytes(Mutable, v50, 4);
                *(_DWORD *)v50 = bswap32(v20);
                CFDataAppendBytes(Mutable, v50, 4);
                ++v14;
              }
              v17 += 2;
            }
            while (v17 != v18);
            goto LABEL_39;
          }
        }
        v14 = 0;
LABEL_39:
        Scope = v43;
        *(_DWORD *)&CFDataGetMutableBytePtr(Mutable)[Length] = bswap32(v14);
LABEL_40:
        if (++v7 == v44)
          goto LABEL_41;
      }
    }
    LODWORD(v6) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    if ((_DWORD)v6)
      goto LABEL_6;
LABEL_41:
    v3 = v41 + 1;
  }
  while (v41 != 2);
  (*(void (**)(ausdk::AUBase *, __CFData *))(*(_QWORD *)this + 280))(this, Mutable);
  CFDictionarySetValue(theDict, CFSTR("data"), Mutable);
  if (Mutable)
    ausdk::Owned<__CFData *>::releaseRef(Mutable);
  CFDictionarySetValue(theDict, CFSTR("name"), *((const void **)this + 46));
  if (!(*(unsigned int (**)(ausdk::AUBase *, uint64_t, _QWORD, _QWORD, int *))(*(_QWORD *)this + 88))(this, 26, 0, 0, &v45))AddNumToDictionary(theDict, CFSTR("render-quality"), v45);
  v21 = 0;
  while (1)
  {
    v22 = (ausdk::AUScope *)ausdk::AUBase::GetScope(this, v21);
    if (ausdk::AUScope::HasElementWithName(v22))
      break;
    if (++v21 == 4)
      goto LABEL_68;
  }
  v23 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v24 = 0;
  v25 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v26 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  while (2)
  {
    v27 = ausdk::AUBase::GetScope(this, v24);
    if (!ausdk::AUScope::HasElementWithName((ausdk::AUScope *)v27))
      goto LABEL_66;
    v28 = CFDictionaryCreateMutable(0, 0, v25, v26);
    v29 = 0;
    while (2)
    {
      v30 = *(_QWORD *)(v27 + 40);
      if (v30)
        LODWORD(v31) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
      else
        v31 = (*(_QWORD *)(v27 + 24) - *(_QWORD *)(v27 + 16)) >> 3;
      if (v29 < v31)
      {
        v32 = *(_QWORD *)(v27 + 40);
        if (v32)
        {
          v33 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v32 + 32))(v32, v29);
          if (!v33)
          {
LABEL_64:
            ++v29;
            continue;
          }
        }
        else
        {
          v34 = *(_QWORD *)(v27 + 16);
          if (v29 >= (*(_QWORD *)(v27 + 24) - v34) >> 3)
            goto LABEL_64;
          v33 = *(_QWORD *)(v34 + 8 * v29);
          if (!v33)
            goto LABEL_64;
        }
        if (*(_QWORD *)(v33 + 72))
        {
          v35 = CFStringCreateWithFormat(0, 0, CFSTR("%u"), v29);
          v36 = *(const void **)(v33 + 72);
          ausdk::Owned<__CFString const*>::retainRef(v36);
          CFDictionarySetValue(v28, v35, v36);
          ausdk::Owned<__CFString const*>::releaseRef(v36);
          ausdk::Owned<__CFString const*>::releaseRef(v35);
        }
        goto LABEL_64;
      }
      break;
    }
    v37 = CFStringCreateWithFormat(0, 0, CFSTR("%u"), *(unsigned int *)(v27 + 8));
    CFDictionarySetValue(v23, v37, v28);
    ausdk::Owned<__CFString const*>::releaseRef(v37);
    ausdk::Owned<__CFDictionary *>::releaseRef(v28);
LABEL_66:
    if (++v24 != 4)
      continue;
    break;
  }
  CFDictionarySetValue(theDict, CFSTR("element-name"), v23);
  ausdk::Owned<__CFDictionary *>::releaseRef(v23);
LABEL_68:
  *a2 = theDict;
  ausdk::Owned<__CFData *>::releaseRef(0);
  ausdk::Owned<__CFDictionary *>::releaseRef(0);
  return 0;
}

void sub_210AFD4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11)
{
  const void *v11;

  ausdk::Owned<__CFDictionary *>::releaseRef(v11);
  ausdk::Owned<__CFData *>::releaseRef(0);
  ausdk::Owned<__CFDictionary *>::releaseRef(a11);
  _Unwind_Resume(a1);
}

uint64_t ausdk::AUBase::RestoreState(OpaqueAudioComponentInstance **this, CFTypeRef cf)
{
  CFTypeID v4;
  uint64_t result;
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFData *v15;
  const __CFData *v16;
  CFTypeID v17;
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v20;
  ausdk::AUScope *Scope;
  const __CFString *v22;
  OpaqueAudioComponentInstance *v23;
  CFTypeID v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  CFTypeID v27;
  const __CFDictionary *v28;
  CFTypeID v29;
  uint64_t v30;
  CFStringRef v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  CFTypeID v34;
  const __CFDictionary *v35;
  void *v36;
  unsigned int *v37;
  unsigned int *i;
  unsigned int *v39;
  unsigned int *v40;
  int valuePtr;
  uint64_t v42;
  uint64_t v43;
  int v44;

  v4 = CFGetTypeID(cf);
  if (v4 != CFDictionaryGetTypeID())
    return 4294956445;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  ausdk::ComponentBase::GetComponentDescription((ausdk::ComponentBase *)&v42, this[1]);
  if (CFDictionaryContainsKey((CFDictionaryRef)cf, CFSTR("part")))
    return 4294956445;
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("version"));
  if (!Value)
    return 4294956445;
  v7 = Value;
  v8 = CFGetTypeID(Value);
  if (v8 != CFNumberGetTypeID())
    return 4294956445;
  valuePtr = 0;
  CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr)
    return 4294956445;
  v9 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("subtype"));
  if (!v9)
    return 4294956445;
  v10 = v9;
  v11 = CFGetTypeID(v9);
  if (v11 != CFNumberGetTypeID())
    return 4294956445;
  CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr != HIDWORD(v42))
    return 4294956445;
  v12 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("manufacturer"));
  if (!v12)
    return 4294956445;
  v13 = v12;
  v14 = CFGetTypeID(v12);
  if (v14 != CFNumberGetTypeID())
    return 4294956445;
  CFNumberGetValue(v13, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr != (_DWORD)v43)
    return 4294956445;
  v15 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("data"));
  if (v15)
  {
    v16 = v15;
    v17 = CFGetTypeID(v15);
    if (v17 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v16);
      Length = CFDataGetLength(v16);
      if (Length >= 1)
      {
        v20 = &BytePtr[Length];
        do
        {
          Scope = (ausdk::AUScope *)ausdk::AUBase::GetScope((ausdk::AUBase *)this, bswap32(*(_DWORD *)BytePtr));
          BytePtr = ausdk::AUScope::RestoreState(Scope, BytePtr + 4);
        }
        while (BytePtr < v20);
      }
    }
  }
  v22 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("name"));
  v23 = this[46];
  if (v23)
    CFRelease(v23);
  if (!v22 || (v24 = CFGetTypeID(v22), v24 != CFStringGetTypeID()))
    v22 = CFSTR("Untitled");
  this[46] = (OpaqueAudioComponentInstance *)v22;
  *((_DWORD *)this + 90) = -1;
  CFRetain(v22);
  (*((void (**)(OpaqueAudioComponentInstance **, uint64_t, _QWORD, _QWORD))*this + 54))(this, 36, 0, 0);
  v25 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("render-quality"));
  if (v25)
  {
    v26 = v25;
    v27 = CFGetTypeID(v25);
    if (v27 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v26, kCFNumberSInt32Type, &valuePtr);
      ausdk::AUBase::DispatchSetProperty((const void **)this, 26, 0, 0, &valuePtr, 4);
    }
  }
  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("element-name"));
  if (result)
  {
    v28 = (const __CFDictionary *)result;
    v29 = CFGetTypeID((CFTypeRef)result);
    if (v29 == CFDictionaryGetTypeID())
    {
      v30 = 0;
      do
      {
        v31 = CFStringCreateWithFormat(0, 0, CFSTR("%u"), v30);
        v32 = (const __CFDictionary *)CFDictionaryGetValue(v28, v31);
        if (v32)
        {
          v33 = v32;
          v34 = CFGetTypeID(v32);
          if (v34 == CFDictionaryGetTypeID())
          {
            v35 = (const __CFDictionary *)ausdk::AUBase::GetScope((ausdk::AUBase *)this, v30);
            ausdk::AUScope::RestoreElementNames((ausdk::AUScope *)&v39, v35, v33);
            v36 = v39;
            v37 = v40;
            for (i = v39; i != v37; ++i)
              (*((void (**)(OpaqueAudioComponentInstance **, uint64_t, uint64_t, _QWORD))*this + 54))(this, 30, v30, *i);
            if (v36)
              operator delete(v36);
          }
        }
        CFRelease(v31);
        result = 0;
        v30 = (v30 + 1);
      }
      while ((_DWORD)v30 != 4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_210AFD904(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ausdk::AUBase::GetParameterValueStrings(ausdk::AUBase *this, unsigned int a2, unsigned int a3, const __CFArray **a4)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::CopyClumpName(ausdk::AUBase *this, unsigned int a2, unsigned int a3, unsigned int a4, const __CFString **a5)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::GetPresets(ausdk::AUBase *this, const __CFArray **a2)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::NewFactoryPresetSet(ausdk::AUBase *this, const AUPreset *a2)
{
  return 4294956417;
}

uint64_t ausdk::AUBase::NewCustomPresetSet(CFTypeRef *this, const AUPreset *a2)
{
  AUPreset *v4;

  v4 = (AUPreset *)(this + 45);
  CFRelease(this[46]);
  *v4 = *a2;
  CFRetain(this[46]);
  return 0;
}

uint64_t ausdk::AUBase::CopyIconLocation(ausdk::AUBase *this)
{
  return 0;
}

uint64_t ausdk::AUBase::SupportedNumChannels(ausdk::AUBase *this, const AUChannelInfo **a2)
{
  return 0;
}

uint64_t ausdk::AUBase::GetAudioChannelLayout(ausdk::AUBase *this, unsigned int a2, unsigned int a3, AudioChannelLayout *a4, BOOL *a5)
{
  ausdk::AUScope *Scope;
  uint64_t IOElement;

  Scope = (ausdk::AUScope *)ausdk::AUBase::GetScope(this, a2);
  IOElement = ausdk::AUScope::GetIOElement(Scope, a3);
  return (*(uint64_t (**)(uint64_t, AudioChannelLayout *, BOOL *))(*(_QWORD *)IOElement + 96))(IOElement, a4, a5);
}

uint64_t ausdk::AUBase::RemoveAudioChannelLayout(ausdk::AUBase *this, unsigned int a2, unsigned int a3)
{
  ausdk::AUScope *Scope;
  uint64_t IOElement;
  uint64_t result;
  char v7;

  Scope = (ausdk::AUScope *)ausdk::AUBase::GetScope(this, a2);
  IOElement = ausdk::AUScope::GetIOElement(Scope, a3);
  v7 = 0;
  result = (*(uint64_t (**)(uint64_t, _QWORD, char *))(*(_QWORD *)IOElement + 96))(IOElement, 0, &v7);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)IOElement + 104))(IOElement);
  return result;
}

uint64_t ausdk::AUBase::ProcessForScheduledParams(ausdk::AUBase *a1, __int128 **a2, uint64_t a3, uint64_t a4)
{
  __int128 *v8;
  __int128 *v9;
  unint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int *v15;
  __int128 *v16;
  uint64_t v17;
  __int128 *v18;
  int v19;
  int v21;
  uint64_t v23;
  int v24;
  uint64_t Element;
  uint64_t result;
  BOOL v28;
  BOOL (*v29)(ausdk *, const AudioUnitParameterEvent *, const AudioUnitParameterEvent *);

  v8 = *a2;
  v9 = a2[1];
  v10 = 126 - 2 * __clz(((char *)v9 - (char *)v8) >> 5);
  v29 = ausdk::ParameterEventListSortPredicate;
  if (v9 == v8)
    v11 = 0;
  else
    v11 = v10;
  v12.n128_f64[0] = _ZNSt3__111__introsortINS_15_RangeAlgPolicyERPDoFbRK23AudioUnitParameterEventS4_EPS2_Lb0EEEvT1_S9_T0_NS_15iterator_traitsIS9_E15difference_typeEb(v8, v9, (uint64_t (**)(__int128 *, __int128 *))&v29, v11, 1);
  if ((_DWORD)a3)
  {
    v13 = 0;
    v14 = a3;
    while (1)
    {
      v15 = (unsigned int *)*a2;
      v16 = a2[1];
      v17 = a3;
      v18 = *a2;
      if (*a2 != v16)
        break;
      v23 = (a3 - v13);
      v17 = a3;
LABEL_34:
      result = (*(uint64_t (**)(ausdk::AUBase *, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(_QWORD *)a1 + 568))(a1, a4, v13, v23, a3, v12);
      if ((_DWORD)result)
        return result;
      v13 = v17;
      v28 = v14 > v23;
      if (v14 >= v23)
        v14 -= v23;
      else
        v14 = 0;
      if (!v28)
        return 0;
    }
    while (1)
    {
      v19 = *((_DWORD *)v18 + 4);
      if (v19 > (int)v13 && v19 < (int)v17)
        break;
      if (*((_DWORD *)v18 + 3) == 2)
      {
        v21 = *((_DWORD *)v18 + 5) + v19;
        if (v21 >= (int)v17 || v21 <= (int)v13)
          v17 = v17;
        else
          v17 = v21;
      }
      v18 += 2;
      if (v18 == v16)
        goto LABEL_22;
    }
    v17 = *((unsigned int *)v18 + 4);
LABEL_22:
    v23 = (v17 - v13);
    while (1)
    {
      v24 = v15[4];
      if (v15[3] == 2)
      {
        if (v24 < (int)v17 && (int)(v15[5] + v24) > (int)v13)
        {
LABEL_31:
          Element = ausdk::AUBase::GetElement(a1, *v15, v15[1]);
          if (Element)
            (*(void (**)(uint64_t, _QWORD, unsigned int *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)Element + 32))(Element, v15[2], v15, v13, (v17 - v13), 0);
        }
      }
      else if (v24 <= v13)
      {
        goto LABEL_31;
      }
      v15 += 8;
      if (v15 == (unsigned int *)v16)
        goto LABEL_34;
    }
  }
  return 0;
}

BOOL ausdk::ParameterEventListSortPredicate(ausdk *this, const AudioUnitParameterEvent *a2, const AudioUnitParameterEvent *a3)
{
  return *((_DWORD *)this + 4) < a2->eventValues.ramp.startBufferOffset;
}

double _ZNSt3__111__introsortINS_15_RangeAlgPolicyERPDoFbRK23AudioUnitParameterEventS4_EPS2_Lb0EEEvT1_S9_T0_NS_15iterator_traitsIS9_E15difference_typeEb(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5)
{
  __int128 *v10;
  uint64_t v11;
  unint64_t v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  BOOL v28;
  double result;
  __int128 v30;
  __int128 *v31;
  int v32;
  __int128 *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 *v43;
  BOOL v45;
  uint64_t v46;
  __int128 *v47;
  __int128 *v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  __int128 *v53;
  __int128 v54;
  int64_t v55;
  int64_t v56;
  uint64_t v57;
  __int128 *v58;
  __int128 *v59;
  __int128 v60;
  __int128 *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  __int128 *v67;
  __int128 *v68;
  uint64_t v69;
  __int128 v70;
  __int128 *v71;
  __int128 *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 *v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  unint64_t v80;
  __int128 *v81;
  __int128 v82;
  __int128 *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 *v88;
  __int128 v89;
  __int128 *v90;
  __int128 *v91;
  __int128 v92;
  char v93;
  __int128 v94;
  __int128 *v95;
  __int128 *v96;
  __int128 *v97;
  __int128 *v98;
  int64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;

uint64_t ausdk::AUBase::GetElement(ausdk::AUBase *this, unsigned int a2, uint64_t a3)
{
  _QWORD *Scope;
  uint64_t v5;
  uint64_t v7;

  Scope = (_QWORD *)ausdk::AUBase::GetScope(this, a2);
  v5 = Scope[5];
  if (v5)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)v5 + 32))(Scope[5], a3);
  v7 = Scope[2];
  if (a3 >= (unint64_t)((Scope[3] - v7) >> 3))
    return 0;
  else
    return *(_QWORD *)(v7 + 8 * a3);
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_15_RangeAlgPolicyERPDoFbRK23AudioUnitParameterEventS4_EPS2_EEbT1_S9_T0_(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  uint64_t v6;
  _BOOL8 result;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = ((char *)a2 - (char *)a1) >> 5;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = a2 - 2;
      if ((*a3)(a2 - 2, a1))
      {
        v10 = *a1;
        v9 = a1[1];
        v11 = *(a2 - 1);
        *a1 = *v8;
        a1[1] = v11;
        *v8 = v10;
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AudioUnitParameterEvent const&,AudioUnitParameterEvent const&),AudioUnitParameterEvent*>(a1, a1 + 2, a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AudioUnitParameterEvent const&,AudioUnitParameterEvent const&),AudioUnitParameterEvent*>((uint64_t)a1, a1 + 2, a1 + 4, a2 - 2, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AudioUnitParameterEvent const&,AudioUnitParameterEvent const&),AudioUnitParameterEvent*>((uint64_t)a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2, a3);
      return 1;
    default:
      v12 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AudioUnitParameterEvent const&,AudioUnitParameterEvent const&),AudioUnitParameterEvent*>(a1, a1 + 2, a1 + 4, a3);
      v13 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v13, v12))
    {
      v16 = v13[1];
      v22 = *v13;
      v23 = v16;
      v17 = v14;
      while (1)
      {
        v18 = (__int128 *)((char *)a1 + v17);
        v19 = *(__int128 *)((char *)a1 + v17 + 80);
        v18[6] = *(__int128 *)((char *)a1 + v17 + 64);
        v18[7] = v19;
        if (v17 == -64)
          break;
        v17 -= 32;
        if (((*a3)(&v22, v18 + 2) & 1) == 0)
        {
          v20 = (__int128 *)((char *)a1 + v17 + 96);
          goto LABEL_12;
        }
      }
      v20 = a1;
LABEL_12:
      v21 = v23;
      *v20 = v22;
      v20[1] = v21;
      if (++v15 == 8)
        return v13 + 2 == a2;
    }
    v12 = v13;
    v14 += 32;
    v13 += 2;
    if (v13 == a2)
      return 1;
  }
}

void ausdk::Owned<__CFData *>::releaseRef(const void *a1)
{
  if (a1)
    CFRelease(a1);
}

double ausdk::AUThreadSafeList<ausdk::AUBase::RenderCallback>::AllocNode(uint64_t a1)
{
  unint64_t *v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  double result;

  v1 = (unint64_t *)(a1 + 16);
LABEL_2:
  v2 = (unint64_t *)atomic_load(v1);
  if (v2)
  {
    do
    {
      v3 = __ldaxr(v1);
      if ((unint64_t *)v3 != v2)
      {
        __clrex();
        goto LABEL_2;
      }
    }
    while (__stlxr(0, v1));
    v4 = *v2;
    if (*v2)
    {
      v5 = (unint64_t *)*v2;
      do
      {
        v6 = v5;
        v5 = (unint64_t *)*v5;
      }
      while (v5);
      while (1)
      {
        v7 = atomic_load(v1);
        *v6 = v7;
        while (1)
        {
          v8 = __ldaxr(v1);
          if (v8 != v7)
            break;
          if (!__stlxr(v4, v1))
            return result;
        }
        __clrex();
      }
    }
  }
  else
  {
    v9 = (_OWORD *)operator new();
    result = 0.0;
    *v9 = 0u;
    v9[1] = 0u;
  }
  return result;
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  unsigned int *v4;
  uint64_t v5;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    v4 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(__n);
    this->__begin_ = v4;
    this->__end_cap_.__value_ = &v4[v5];
    bzero(v4, 4 * __n);
    this->__end_ = &v4[__n];
  }
  return this;
}

void sub_210AFE6F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ausdk::AUBase::DoRender(unsigned int &,AudioTimeStamp const&,unsigned int,unsigned int,AudioBufferList &)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  _QWORD *v5;
  int v6;
  _QWORD *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    if (!(_DWORD)a2)
      return a2;
    goto LABEL_3;
  }
  v5 = (_QWORD *)(a1 + 440);
  if (*(char *)(a1 + 463) < 0)
    v5 = (_QWORD *)*v5;
  v6 = 136315394;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, render err: %d", (uint8_t *)&v6, 0x12u);
  if ((_DWORD)a2)
  {
LABEL_3:
    if (!*(_DWORD *)(a1 + 340))
    {
      *(_DWORD *)(a1 + 340) = a2;
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 432))(a1, 22, 0, 0);
    }
  }
  return a2;
}

_DWORD *ausdk::AUBufferList::PrepareNullBuffer(ausdk::AUBufferList *this, const AudioStreamBasicDescription *a2, int a3)
{
  AudioFormatFlags mFormatFlags;
  UInt32 mChannelsPerFrame;
  UInt32 v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  UInt32 v9;
  _QWORD *v10;
  std::runtime_error *exception;
  std::logic_error *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  mFormatFlags = a2->mFormatFlags;
  mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((mFormatFlags & 0x20) != 0)
    v5 = a2->mChannelsPerFrame;
  else
    v5 = 1;
  if (v5 > *((_DWORD *)this + 4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = -10868;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "throwing %d", (uint8_t *)v14, 8u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x18uLL);
    ausdk::AUException::AUException(exception, -10868);
  }
  if ((mFormatFlags & 0x20) != 0)
    mChannelsPerFrame = 1;
  v6 = (_DWORD *)*((_QWORD *)this + 1);
  v7 = v6 + 12;
  v8 = v6[12];
  if (v6[12] > *v6)
  {
    v13 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](v13, "AllocatedBuffer::PrepareNull(): too many buffers");
  }
  if ((_DWORD)v8)
  {
    v9 = a2->mBytesPerFrame * a3;
    v10 = v6 + 16;
    do
    {
      *((_DWORD *)v10 - 2) = mChannelsPerFrame;
      *((_DWORD *)v10 - 1) = v9;
      *v10 = 0;
      v10 += 2;
      --v8;
    }
    while (v8);
  }
  *(_DWORD *)this = 2;
  return v7;
}

void sub_210AFE968(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ausdk::AUIOElement::~AUIOElement(ausdk::AUIOElement *this)
{
  void *v2;

  *(_QWORD *)this = off_24CA94A90;
  ausdk::AUBufferList::Deallocate((_QWORD *)this + 18);
  v2 = (void *)*((_QWORD *)this + 15);
  if (v2)
  {
    *((_QWORD *)this + 16) = v2;
    operator delete(v2);
  }
  ausdk::AUElement::~AUElement((const void **)this);
}

void ausdk::ComponentBase::~ComponentBase(ausdk::ComponentBase *this)
{
  JUMPOUT(0x212BCDF50);
}

void `anonymous namespace'::CustomBufferAllocator::~CustomBufferAllocator(_anonymous_namespace_::CustomBufferAllocator *this)
{
  JUMPOUT(0x212BCDF50);
}

uint64_t `anonymous namespace'::CustomBufferAllocator::Deallocate()
{
  return ExtendedAudioBufferList_Destroy();
}

uint64_t ausdk::AUMIDIBase::DelegateGetPropertyInfo(ausdk::AUMIDIBase *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int *a5, BOOL *a6)
{
  return 4294956417;
}

uint64_t ausdk::AUMIDIBase::DelegateGetProperty(ausdk::AUMIDIBase *this, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  return 4294956417;
}

uint64_t ausdk::AUMIDIBase::DelegateSetProperty(ausdk::AUMIDIBase *this, unsigned int a2, unsigned int a3, unsigned int a4, const void *a5)
{
  return 4294956417;
}

uint64_t ausdk::AUMIDIBase::HandleMIDIEvent(ausdk::AUMIDIBase *this, unsigned int a2, unsigned __int8 a3, unsigned __int8 a4, int a5)
{
  uint64_t v5;
  uint64_t (*v6)(void);

  if (!*(_BYTE *)(*((_QWORD *)this + 1) + 17))
    return 4294956429;
  if (a2 >> 4 == 8)
  {
    v6 = *(uint64_t (**)(void))(*(_QWORD *)this + 88);
  }
  else
  {
    if (a2 >> 4 != 9)
      return (*(uint64_t (**)(ausdk::AUMIDIBase *))(*(_QWORD *)this + 72))(this);
    v5 = *(_QWORD *)this;
    if (a5)
      v6 = *(uint64_t (**)(void))(v5 + 80);
    else
      v6 = *(uint64_t (**)(void))(v5 + 88);
  }
  return v6();
}

uint64_t (*ausdk::AUBaseLookup::Lookup(ausdk::AUBaseLookup *this))(ausdk *__hidden this, void *)
{
  if (((_DWORD)this - 1) > 0x11)
    return 0;
  else
    return off_24CA97038[(int)this - 1];
}

uint64_t ausdk::AUMethodUninitialize(ausdk *this, void *a2)
{
  uint64_t v3;
  char *v4;

  v3 = *((_QWORD *)this + 67);
  if (v3)
    (*(void (**)(_QWORD, void *))(*(_QWORD *)v3 + 16))(*((_QWORD *)this + 67), a2);
  v4 = (char *)this + 64;
  if (*((_BYTE *)this + 81))
    (*(void (**)(char *, void *))(*(_QWORD *)v4 + 64))((char *)this + 64, a2);
  (*(void (**)(char *, void *))(*(_QWORD *)v4 + 504))((char *)this + 64, a2);
  *((_QWORD *)this + 49) = 0;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *((_QWORD *)this + 42) = 0xFFEFFFFFFFFFFFFFLL;
  *(_WORD *)((char *)this + 81) = 0;
  if (v3)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    return 0;
  }
  return v3;
}

void sub_210AFEBA8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFEB94);
}

uint64_t ausdk::AUMethodGetParameter(ausdk *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, float *a6)
{
  uint64_t v11;
  uint64_t v12;

  v11 = *((_QWORD *)this + 67);
  if (v11)
    (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, float *))(*(_QWORD *)v11 + 16))(*((_QWORD *)this + 67), a2, a3, a4, a5, a6);
  if (a5)
  {
    v12 = (*(uint64_t (**)(char *, void *, uint64_t, uint64_t, uint64_t, float *))(*((_QWORD *)this + 8) + 144))((char *)this + 64, a2, a3, a4, a5, a6);
    if (!v11)
      return v12;
    goto LABEL_7;
  }
  v12 = 4294967246;
  if (v11)
LABEL_7:
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
  return v12;
}

void sub_210AFECD0(void *a1)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFECB8);
}

uint64_t ausdk::AUMethodRemovePropertyListener(ausdk *this, void *a2, uint64_t a3, void (*a4)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int))
{
  uint64_t v7;
  uint64_t v8;

  v7 = *((_QWORD *)this + 67);
  if (v7)
    (*(void (**)(_QWORD, void *, uint64_t, void (*)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int)))(*(_QWORD *)v7 + 16))(*((_QWORD *)this + 67), a2, a3, a4);
  v8 = (*(uint64_t (**)(char *, void *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 120))((char *)this + 64, a2, a3, 0, 0);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  return v8;
}

void sub_210AFEDD8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFEDC4);
}

uint64_t ausdk::AUMethodAddRenderNotify(ausdk *this, void *a2, int (*a3)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = *((_QWORD *)this + 67);
  if (v7)
    (*(void (**)(_QWORD, void *, int (*)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *))(*(_QWORD *)v7 + 16))(*((_QWORD *)this + 67), a2, a3, a4);
  v8 = (*(uint64_t (**)(char *, void *, int (*)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *))(*((_QWORD *)this + 8) + 128))((char *)this + 64, a2, a3, a4);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  return v8;
}

void sub_210AFEED8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFEEC4);
}

uint64_t ausdk::AUMethodRemoveRenderNotify(ausdk *this, void *a2, int (*a3)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = *((_QWORD *)this + 67);
  if (v7)
    (*(void (**)(_QWORD, void *, int (*)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *))(*(_QWORD *)v7 + 16))(*((_QWORD *)this + 67), a2, a3, a4);
  v8 = (*(uint64_t (**)(char *, void *, int (*)(void *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, AudioBufferList *), void *))(*((_QWORD *)this + 8) + 136))((char *)this + 64, a2, a3, a4);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  return v8;
}

void sub_210AFEFD8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFEFC4);
}

uint64_t ausdk::AUMethodRemovePropertyListenerWithUserData(ausdk *this, void *a2, uint64_t a3, void (*a4)(void *, OpaqueAudioComponentInstance *, unsigned int, unsigned int, unsigned int), void *a5)
{
  uint64_t v9;
  uint64_t v10;

  v9 = *((_QWORD *)this + 67);
  if (v9)
    (*(void (**)(_QWORD, void *, uint64_t, _QWORD, void *))(*(_QWORD *)v9 + 16))(*((_QWORD *)this + 67), a2, a3, a4, a5);
  v10 = (*(uint64_t (**)(char *, void *, uint64_t, _QWORD, uint64_t))(*((_QWORD *)this + 8) + 120))((char *)this + 64, a2, a3, a4, 1);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  return v10;
}

void sub_210AFF0EC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFF0D4);
}

uint64_t ausdk::AUMethodStop(ausdk *this, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)this + 67);
  if (v3)
    (*(void (**)(_QWORD, void *))(*(_QWORD *)v3 + 16))(*((_QWORD *)this + 67), a2);
  v4 = (*(uint64_t (**)(char *, void *))(*((_QWORD *)this + 8) + 448))((char *)this + 64, a2);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  return v4;
}

void sub_210AFF1D4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x210AFF1C4);
}

uint64_t (*ausdk::AUComplexOutputLookup::Lookup(ausdk::AUComplexOutputLookup *this))(ausdk *__hidden this, void *)
{
  int v1;
  uint64_t (*v3)(ausdk *, void *);
  uint64_t (*v4)(ausdk *, int *, unsigned int *, const AudioTimeStamp *, unsigned int, unsigned int, unsigned int *, AudioStreamPacketDescription *, AudioBufferList *, void *, unsigned int *);

  v1 = (_DWORD)this - 1;
  if (((_DWORD)this - 1) <= 0x11 && ((0x1880uLL >> v1) & 1) == 0)
    return off_24CA97038[v1];
  v3 = ausdk::AUMethodStop;
  if ((_DWORD)this != 514)
    v3 = 0;
  if ((_DWORD)this == 513)
    v3 = ausdk::AUMethodStart;
  v4 = ausdk::AUMethodComplexRender;
  if ((_DWORD)this != 19)
    v4 = 0;
  if (v3)
    return v3;
  else
    return (uint64_t (*)(ausdk *__hidden, void *))v4;
}

uint64_t ausdk::AUMethodComplexRender(ausdk *this, int *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, unsigned int a6, unsigned int *a7, AudioStreamPacketDescription *a8, AudioBufferList *a9, void *a10, unsigned int *a11)
{
  uint64_t v11;
  int v13;

  v13 = 0;
  v11 = 4294967246;
  if (a3 && a8)
  {
    if (!a2)
      a2 = &v13;
    return (*(uint64_t (**)(char *, int *))(*((_QWORD *)this + 8) + 192))((char *)this + 64, a2);
  }
  return v11;
}

uint64_t (*ausdk::AUBaseProcessLookup::Lookup(ausdk::AUBaseProcessLookup *this))(ausdk *__hidden this, void *)
{
  uint64_t (*v1)(ausdk *__hidden, void *);
  uint64_t (*v2)(ausdk *, int *, unsigned int *, const AudioTimeStamp *, _DWORD *, AudioBufferList *);

  if (((_DWORD)this - 1) > 0x11)
    v1 = 0;
  else
    v1 = off_24CA97038[(int)this - 1];
  v2 = ausdk::AUMethodProcess;
  if ((_DWORD)this != 20)
    v2 = 0;
  if (v1)
    return v1;
  else
    return (uint64_t (*)(ausdk *__hidden, void *))v2;
}

uint64_t ausdk::AUMethodProcess(ausdk *this, int *a2, unsigned int *a3, const AudioTimeStamp *a4, _DWORD *a5, AudioBufferList *a6)
{
  int *v10;
  int v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  uint64_t Element;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD *v27;
  int v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  int v33;
  uint8_t buf[4];
  _BYTE v35[10];
  _BYTE v36[6];
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  if (a2)
  {
    v10 = a2;
    v11 = *a2;
    if ((*a2 & 0x200) != 0)
      goto LABEL_7;
  }
  else
  {
    LOWORD(v11) = 0;
    v10 = &v33;
  }
  v12 = 4294967246;
  if (!a3 || !a5)
    return v12;
LABEL_7:
  v13 = (char *)this + 64;
  if ((v11 & 0x200) != 0)
    goto LABEL_31;
  if (!*((_BYTE *)this + 81))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v27 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v27 = (_QWORD *)*v27;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v35 = v27;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)v36 = -10867;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", buf, 0x12u);
    }
    v12 = 4294956429;
    if (!*((_DWORD *)this + 101))
    {
      *((_DWORD *)this + 101) = -10867;
      (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
    }
    return v12;
  }
  v14 = *((_DWORD *)this + 100);
  if (v14 < a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v29 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v29 = (_QWORD *)*v29;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v35 = v29;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)v36 = -10874;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", buf, 0x12u);
    }
    v12 = 4294956422;
    if (!*((_DWORD *)this + 101))
    {
      *((_DWORD *)this + 101) = -10874;
      (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
    }
    return v12;
  }
  if (v14 != (_DWORD)a4 && *((_BYTE *)this + 440))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v30 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v30 = (_QWORD *)*v30;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v35 = v30;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)v36 = -50;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", buf, 0x12u);
    }
    v12 = 4294967246;
    if (!*((_DWORD *)this + 101))
      goto LABEL_49;
    return v12;
  }
  Element = ausdk::AUScope::SafeGetElement((ausdk *)((char *)this + 144), 0);
  if ((*(_BYTE *)(Element + 92) & 0x20) != 0)
    v16 = *(unsigned int *)(Element + 108);
  else
    v16 = 1;
  v17 = *a5;
  if ((_DWORD)v16 == *a5)
  {
    if ((_DWORD)v16)
    {
      v18 = 0;
      v19 = *(_DWORD *)(Element + 104);
      v20 = v19 * (_DWORD)a4;
      v21 = a5 + 3;
      do
      {
        if (*(_QWORD *)(v21 + 1))
        {
          v22 = *v21;
          if (*v21 < v20)
          {
            v28 = v19;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110144;
              *(_DWORD *)v35 = (_DWORD)a4;
              *(_WORD *)&v35[4] = 1024;
              *(_DWORD *)&v35[6] = v28;
              *(_WORD *)v36 = 1024;
              *(_DWORD *)&v36[2] = v20;
              v37 = 1024;
              v38 = v18;
              v39 = 1024;
              v40 = v22;
              _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%u frames, %u bytes/frame, expected %u-byte buffer; ioData.mBuffers[%u].mDataByteSize=%u; kAudio_ParamError",
                buf,
                0x20u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v32 = (_QWORD *)((char *)this + 504);
              if (*((char *)this + 527) < 0)
                v32 = (_QWORD *)*v32;
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v35 = v32;
              *(_WORD *)&v35[8] = 1024;
              *(_DWORD *)v36 = -50;
              _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", buf, 0x12u);
            }
            v12 = 4294967246;
            if (!*((_DWORD *)this + 101))
              goto LABEL_49;
            return v12;
          }
          *v21 = v20;
        }
        ++v18;
        v21 += 4;
      }
      while (v16 != v18);
    }
LABEL_31:
    if (*((_BYTE *)this + 328))
      *((_QWORD *)this + 40) = pthread_self();
    if (*(double *)a3 == *((double *)this + 42))
      return 0;
    v23 = *(_OWORD *)a3;
    v24 = *((_OWORD *)a3 + 1);
    v25 = *((_OWORD *)a3 + 3);
    *((_OWORD *)this + 23) = *((_OWORD *)a3 + 2);
    *((_OWORD *)this + 24) = v25;
    *((_OWORD *)this + 21) = v23;
    *((_OWORD *)this + 22) = v24;
    return (*(uint64_t (**)(char *, int *, _DWORD *, _DWORD *, const AudioTimeStamp *, AudioBufferList *))(*(_QWORD *)v13 + 176))((char *)this + 64, v10, a5, a5, a4, a6);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v35 = v17;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = v16;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ioData.mNumberBuffers=%u, ASBD::NumberChannelStreams(input->GetStreamFormat())=%u; kAudio_ParamError",
      buf,
      0xEu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v31 = (_QWORD *)((char *)this + 504);
    if (*((char *)this + 527) < 0)
      v31 = (_QWORD *)*v31;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v35 = v31;
    *(_WORD *)&v35[8] = 1024;
    *(_DWORD *)v36 = -50;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", buf, 0x12u);
  }
  v12 = 4294967246;
  if (!*((_DWORD *)this + 101))
  {
LABEL_49:
    *((_DWORD *)this + 101) = -50;
    (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
  }
  return v12;
}

void sub_210AFF8DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  uint64_t v11;
  uint64_t v12;
  int *v14;
  int v15;
  _QWORD *v16;
  _QWORD *v17;

  if (!a2)
    _Unwind_Resume(a1);
  v14 = (int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    v15 = *v14;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      if (!v15)
        goto LABEL_13;
      goto LABEL_7;
    }
    v16 = (_QWORD *)(v11 + 504);
    if (*(char *)(v11 + 527) < 0)
      v16 = (_QWORD *)*v16;
    LODWORD(buf) = 136315394;
    *(_QWORD *)((char *)&buf + 4) = v16;
    WORD6(buf) = 1024;
    *(_DWORD *)((char *)&buf + 14) = v15;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", (uint8_t *)&buf, 0x12u);
    if (v15)
    {
LABEL_7:
      if (!*(_DWORD *)(v11 + 404))
      {
        *(_DWORD *)(v11 + 404) = v15;
        (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v11 + 64) + 432))(v12, 22, 0, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v17 = (_QWORD *)(v11 + 504);
      if (*(char *)(v11 + 527) < 0)
        v17 = (_QWORD *)*v17;
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = v17;
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = -1;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, process err: %d", (uint8_t *)&buf, 0x12u);
    }
    if (!*(_DWORD *)(v11 + 404))
    {
      *(_DWORD *)(v11 + 404) = -1;
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v11 + 64) + 432))(v12, 22, 0, 0);
    }
  }
LABEL_13:
  __cxa_end_catch();
  JUMPOUT(0x210AFF574);
}

void sub_210AFFA74()
{
  __cxa_end_catch();
  JUMPOUT(0x210AFF8F8);
}

void sub_210AFFA80()
{
  __cxa_end_catch();
  JUMPOUT(0x210AFF8F8);
}

void sub_210AFFA90()
{
  JUMPOUT(0x210AFF8F8);
}

uint64_t (*ausdk::AUBaseProcessMultipleLookup::Lookup(ausdk::AUBaseProcessMultipleLookup *this))(ausdk *__hidden this, void *)
{
  uint64_t (*v1)(ausdk *__hidden, void *);
  uint64_t (*v2)(ausdk *, int *, unsigned int *, const AudioTimeStamp *, uint64_t, uint64_t, const AudioBufferList **, uint64_t, AudioBufferList **);

  if (((_DWORD)this - 1) > 0x11)
    v1 = 0;
  else
    v1 = off_24CA97038[(int)this - 1];
  v2 = ausdk::AUMethodProcessMultiple;
  if ((_DWORD)this != 21)
    v2 = 0;
  if (v1)
    return v1;
  else
    return (uint64_t (*)(ausdk *__hidden, void *))v2;
}

uint64_t ausdk::AUMethodProcessMultiple(ausdk *this, int *a2, unsigned int *a3, const AudioTimeStamp *a4, uint64_t a5, uint64_t a6, const AudioBufferList **a7, uint64_t a8, AudioBufferList **a9)
{
  unint64_t v10;
  uint64_t v12;
  unint64_t v13;
  int *v16;
  int v17;
  uint64_t v18;
  char *v19;
  unsigned int v20;
  uint64_t v21;
  BOOL v22;
  uint64_t Element;
  uint64_t v24;
  _DWORD *v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD *v29;
  unsigned int v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD *v35;
  int v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v46;
  char *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  ausdk::AUScope *v55;
  int v56;
  BOOL v57;
  unsigned int v58;
  unsigned int v59;
  char *v60;
  unsigned int v61;
  int v62;
  uint8_t buf[4];
  _BYTE v64[10];
  _BYTE v65[6];
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  unsigned int v71;
  uint64_t v72;

  v10 = (unint64_t)a7;
  v12 = a5;
  v13 = (unint64_t)a4;
  v72 = *MEMORY[0x24BDAC8D0];
  v62 = 0;
  if (a2)
  {
    v16 = a2;
    v17 = *a2;
    if ((*a2 & 0x200) != 0)
      goto LABEL_8;
  }
  else
  {
    LOWORD(v17) = 0;
    v16 = &v62;
  }
  v18 = 4294967246;
  if (!a3 || !a6 || !a8)
    return v18;
LABEL_8:
  v19 = (char *)this + 64;
  if ((v17 & 0x200) != 0)
    goto LABEL_59;
  if (!*((_BYTE *)this + 81))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v48 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v48 = (_QWORD *)*v48;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v64 = v48;
      *(_WORD *)&v64[8] = 1024;
      *(_DWORD *)v65 = -10867;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
    }
    v18 = 4294956429;
    if (!*((_DWORD *)this + 101))
    {
      *((_DWORD *)this + 101) = -10867;
      (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
    }
    return v18;
  }
  v20 = *((_DWORD *)this + 100);
  if (v20 < a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v49 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v49 = (_QWORD *)*v49;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v64 = v49;
      *(_WORD *)&v64[8] = 1024;
      *(_DWORD *)v65 = -10874;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
    }
    v18 = 4294956422;
    if (!*((_DWORD *)this + 101))
    {
      *((_DWORD *)this + 101) = -10874;
      (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
    }
    return v18;
  }
  if (v20 != (_DWORD)a4 && *((_BYTE *)this + 440))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v50 = (_QWORD *)((char *)this + 504);
      if (*((char *)this + 527) < 0)
        v50 = (_QWORD *)*v50;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v64 = v50;
      *(_WORD *)&v64[8] = 1024;
      *(_DWORD *)v65 = -50;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
    }
    v18 = 4294967246;
    if (!*((_DWORD *)this + 101))
    {
      *((_DWORD *)this + 101) = -50;
      (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))((char *)this + 64, 22, 0, 0);
    }
    return v18;
  }
  v58 = a7;
  v59 = a5;
  v61 = a4;
  v60 = (char *)this + 64;
  if ((_DWORD)a5)
  {
    v21 = 0;
    v22 = 1;
    v55 = (ausdk *)((char *)this + 144);
    while (1)
    {
      v57 = v22;
      if (*(_QWORD *)(a6 + 8 * v21))
      {
        Element = ausdk::AUScope::SafeGetElement(v55, v21);
        if ((*(_BYTE *)(Element + 92) & 0x20) != 0)
          v24 = *(unsigned int *)(Element + 108);
        else
          v24 = 1;
        v25 = *(_DWORD **)(a6 + 8 * v21);
        v26 = *v25;
        if ((_DWORD)v24 != *v25)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v64 = v21;
            *(_WORD *)&v64[4] = 1024;
            *(_DWORD *)&v64[6] = v26;
            *(_WORD *)v65 = 1024;
            *(_DWORD *)&v65[2] = v24;
            _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "inInputBufferLists[%u]->mNumberBuffers=%u, ASBD::NumberChannelStreams(input.GetStreamFormat())=%u; kAudio_ParamError",
              buf,
              0x14u);
          }
          v47 = v60;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v54 = (_QWORD *)((char *)this + 504);
            if (*((char *)this + 527) < 0)
              v54 = (_QWORD *)*v54;
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v64 = v54;
            *(_WORD *)&v64[8] = 1024;
            *(_DWORD *)v65 = -50;
            _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
          }
          v18 = 4294967246;
          if (*((_DWORD *)this + 101))
            return v18;
LABEL_88:
          *((_DWORD *)this + 101) = -50;
          (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*((_QWORD *)this + 8) + 432))(v47, 22, 0, 0);
          return v18;
        }
        if ((_DWORD)v24)
          break;
      }
LABEL_34:
      v22 = ++v21 < (unint64_t)v59;
      if (v21 == v59)
        goto LABEL_45;
    }
    v27 = 0;
    v28 = *(_DWORD *)(Element + 104) * v61;
    v29 = v25 + 4;
    while (*v29)
    {
      v30 = *((_DWORD *)v29 - 1);
      if (v30 < v28)
      {
        v56 = *(_DWORD *)(Element + 104);
        v31 = v60;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110400;
          *(_DWORD *)v64 = v61;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v56;
          *(_WORD *)v65 = 1024;
          *(_DWORD *)&v65[2] = v28;
          v66 = 1024;
          v67 = v21;
          v68 = 1024;
          v69 = v27;
          v70 = 1024;
          v71 = v30;
          _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%u frames, %u bytes/frame, expected %u-byte buffer; inInputBufferLists[%u].mBuffers[%u].mDataByteSize=%u; kAudio_ParamError",
            buf,
            0x26u);
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
LABEL_41:
          if (!*((_DWORD *)this + 101))
          {
            *((_DWORD *)this + 101) = -50;
            (*(void (**)(char *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v31 + 432))(v31, 22, 0, 0);
          }
          if (v57)
            return 4294967246;
          goto LABEL_45;
        }
LABEL_89:
        v51 = (_QWORD *)((char *)this + 504);
        if (*((char *)this + 527) < 0)
          v51 = (_QWORD *)*v51;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v64 = v51;
        *(_WORD *)&v64[8] = 1024;
        *(_DWORD *)v65 = -50;
        _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
        goto LABEL_41;
      }
      ++v27;
      v29 += 2;
      if (v24 == v27)
        goto LABEL_34;
    }
    v31 = v60;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    goto LABEL_89;
  }
LABEL_45:
  v19 = v60;
  v13 = v61;
  v10 = v58;
  v12 = v59;
  if (!v58)
  {
LABEL_59:
    if (*((_BYTE *)this + 328))
      *((_QWORD *)this + 40) = pthread_self();
    if (*(double *)a3 == *((double *)this + 42))
      return 0;
    v42 = *(_OWORD *)a3;
    v43 = *((_OWORD *)a3 + 1);
    v44 = *((_OWORD *)a3 + 3);
    *((_OWORD *)this + 23) = *((_OWORD *)a3 + 2);
    *((_OWORD *)this + 24) = v44;
    *((_OWORD *)this + 21) = v42;
    *((_OWORD *)this + 22) = v43;
    return (*(uint64_t (**)(char *, int *, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)v19 + 184))(v19, v16, v13, v12, a6, v10, a8);
  }
  v32 = 0;
  while (1)
  {
    if (*(_QWORD *)(a8 + 8 * v32))
    {
      v33 = ausdk::AUScope::SafeGetElement((ausdk *)((char *)this + 192), v32);
      if ((*(_BYTE *)(v33 + 92) & 0x20) != 0)
        v34 = *(unsigned int *)(v33 + 108);
      else
        v34 = 1;
      v35 = *(_DWORD **)(a8 + 8 * v32);
      v36 = *v35;
      if ((_DWORD)v34 != *v35)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v64 = v32;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v36;
          *(_WORD *)v65 = 1024;
          *(_DWORD *)&v65[2] = v34;
          _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ioOutputBufferLists[%u]->mNumberBuffers=%u, ASBD::NumberChannelStreams(output.GetStreamFormat())=%u; kAudio_ParamError",
            buf,
            0x14u);
        }
        v47 = v60;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v53 = (_QWORD *)((char *)this + 504);
          if (*((char *)this + 527) < 0)
            v53 = (_QWORD *)*v53;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v64 = v53;
          *(_WORD *)&v64[8] = 1024;
          *(_DWORD *)v65 = -50;
          _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
        }
        v18 = 4294967246;
        if (*((_DWORD *)this + 101))
          return v18;
        goto LABEL_88;
      }
      if ((_DWORD)v34)
        break;
    }
LABEL_58:
    ++v32;
    v19 = v60;
    v13 = v61;
    v10 = v58;
    v12 = v59;
    if (v32 == v58)
      goto LABEL_59;
  }
  v37 = 0;
  v38 = *(_DWORD *)(v33 + 104);
  v39 = v38 * v61;
  v40 = v35 + 3;
  while (!*(_QWORD *)(v40 + 1))
  {
LABEL_57:
    ++v37;
    v40 += 4;
    if (v34 == v37)
      goto LABEL_58;
  }
  v41 = *v40;
  if (*v40 >= v39)
  {
    *v40 = v39;
    goto LABEL_57;
  }
  v46 = v38;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)v64 = v61;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v46;
    *(_WORD *)v65 = 1024;
    *(_DWORD *)&v65[2] = v39;
    v66 = 1024;
    v67 = v32;
    v68 = 1024;
    v69 = v37;
    v70 = 1024;
    v71 = v41;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%u frames, %u bytes/frame, expected %u-byte buffer; ioOutputBufferLists[%u]->mBuffers[%u].mDataByteSize=%u; kAudio_ParamError",
      buf,
      0x26u);
  }
  v47 = v60;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v52 = (_QWORD *)((char *)this + 504);
    if (*((char *)this + 527) < 0)
      v52 = (_QWORD *)*v52;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v64 = v52;
    *(_WORD *)&v64[8] = 1024;
    *(_DWORD *)v65 = -50;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", buf, 0x12u);
  }
  v18 = 4294967246;
  if (!*((_DWORD *)this + 101))
    goto LABEL_88;
  return v18;
}

void sub_210B003F4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf)
{
  uint64_t v15;
  int *v17;
  int v18;
  _QWORD *v19;
  _QWORD *v20;

  if (!a2)
    _Unwind_Resume(a1);
  v17 = (int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    v18 = *v17;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      if (!v18)
        goto LABEL_13;
      goto LABEL_7;
    }
    v19 = (_QWORD *)(v15 + 504);
    if (*(char *)(v15 + 527) < 0)
      v19 = (_QWORD *)*v19;
    LODWORD(buf) = 136315394;
    *(_QWORD *)((char *)&buf + 4) = v19;
    WORD6(buf) = 1024;
    *(_DWORD *)((char *)&buf + 14) = v18;
    _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", (uint8_t *)&buf, 0x12u);
    if (v18)
    {
LABEL_7:
      if (!*(_DWORD *)(v15 + 404))
      {
        *(_DWORD *)(v15 + 404) = v18;
        (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v15 + 64) + 432))(a13, 22, 0, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v20 = (_QWORD *)(v15 + 504);
      if (*(char *)(v15 + 527) < 0)
        v20 = (_QWORD *)*v20;
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = v20;
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = -1;
      _os_log_error_impl(&dword_210A23000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "  from %s, processmultiple err: %d", (uint8_t *)&buf, 0x12u);
    }
    if (!*(_DWORD *)(v15 + 404))
    {
      *(_DWORD *)(v15 + 404) = -1;
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v15 + 64) + 432))(a13, 22, 0, 0);
    }
  }
LABEL_13:
  __cxa_end_catch();
  JUMPOUT(0x210AFFE9CLL);
}

void sub_210B005A0()
{
  __cxa_end_catch();
  JUMPOUT(0x210B00420);
}

void sub_210B005AC()
{
  __cxa_end_catch();
  JUMPOUT(0x210B00420);
}

void sub_210B005BC()
{
  JUMPOUT(0x210B00420);
}

uint64_t ausdk::AUMethodMIDIEvent(ausdk *this, void *a2)
{
  return (*(uint64_t (**)(char *, void *))(*((_QWORD *)this + 8) + 456))((char *)this + 64, a2);
}

uint64_t ausdk::AUMethodSysEx(ausdk *this, void *a2, const unsigned __int8 *a3)
{
  return (*(uint64_t (**)(char *, void *, const unsigned __int8 *))(*((_QWORD *)this + 8) + 464))((char *)this + 64, a2, a3);
}

uint64_t ausdk::AUMethodMIDIEventList(ausdk *this, void *a2, uint64_t a3, const MIDIEventList *a4)
{
  if (a3)
    return (*(uint64_t (**)(char *, void *, uint64_t, const MIDIEventList *))(*((_QWORD *)this + 8) + 472))((char *)this + 64, a2, a3, a4);
  else
    return 4294967246;
}

uint64_t (*ausdk::AUMusicLookup::Lookup(ausdk::AUMusicLookup *this))(ausdk *__hidden this, void *)
{
  int v1;

  v1 = (_DWORD)this - 1;
  if (((_DWORD)this - 1) > 0x11)
  {
    if (((_DWORD)this - 257) > 6)
      return 0;
    else
      return (uint64_t (*)(ausdk *__hidden, void *))*(&off_24CA970C8 + ((_DWORD)this - 257));
  }
  else if (((0x1880uLL >> v1) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return off_24CA97038[v1];
  }
}

uint64_t ausdk::AUMethodStopNote(ausdk *this, void *a2)
{
  return (*(uint64_t (**)(char *, void *))(*((_QWORD *)this + 8) + 488))((char *)this + 64, a2);
}

uint64_t AUOOPWorkgroupManager_AddRemoteIOWorkgroup()
{
  return MEMORY[0x24BDB6750]();
}

uint64_t AUOOPWorkgroupManager_RemoveRemoteIOWorkgroup()
{
  return MEMORY[0x24BDB6758]();
}

uint64_t AURegistrationServerConnection_Connect()
{
  return MEMORY[0x24BDB6760]();
}

uint64_t AURegistrationServerConnection_ServerPort()
{
  return MEMORY[0x24BDB6768]();
}

OSStatus AudioCodecAppendInputData(AudioCodec inCodec, const void *inInputData, UInt32 *ioInputDataByteSize, UInt32 *ioNumberPackets, const AudioStreamPacketDescription *inPacketDescription)
{
  return MEMORY[0x24BDB6770](inCodec, inInputData, ioInputDataByteSize, ioNumberPackets, inPacketDescription);
}

OSStatus AudioCodecGetProperty(AudioCodec inCodec, AudioCodecPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6778](inCodec, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioCodecGetPropertyInfo(AudioCodec inCodec, AudioCodecPropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x24BDB6780](inCodec, *(_QWORD *)&inPropertyID, outSize, outWritable);
}

OSStatus AudioCodecInitialize(AudioCodec inCodec, const AudioStreamBasicDescription *inInputFormat, const AudioStreamBasicDescription *inOutputFormat, const void *inMagicCookie, UInt32 inMagicCookieByteSize)
{
  return MEMORY[0x24BDB6788](inCodec, inInputFormat, inOutputFormat, inMagicCookie, *(_QWORD *)&inMagicCookieByteSize);
}

OSStatus AudioCodecProduceOutputPackets(AudioCodec inCodec, void *outOutputData, UInt32 *ioOutputDataByteSize, UInt32 *ioNumberPackets, AudioStreamPacketDescription *outPacketDescription, UInt32 *outStatus)
{
  return MEMORY[0x24BDB6790](inCodec, outOutputData, ioOutputDataByteSize, ioNumberPackets, outPacketDescription, outStatus);
}

OSStatus AudioCodecSetProperty(AudioCodec inCodec, AudioCodecPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6798](inCodec, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioCodecUninitialize(AudioCodec inCodec)
{
  return MEMORY[0x24BDB67A0](inCodec);
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x24BDB67A8](inComponent, inDesc);
}

OSStatus AudioComponentGetDescription(AudioComponent inComponent, AudioComponentDescription *outDesc)
{
  return MEMORY[0x24BDB67B0](inComponent, outDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x24BDB67B8](inInstance);
}

AudioComponent AudioComponentInstanceGetComponent(AudioComponentInstance inInstance)
{
  return (AudioComponent)MEMORY[0x24BDB67C0](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x24BDB67C8](inComponent, outInstance);
}

AudioComponent AudioComponentRegister(const AudioComponentDescription *inDesc, CFStringRef inName, UInt32 inVersion, AudioComponentFactoryFunction inFactory)
{
  return (AudioComponent)MEMORY[0x24BDB67D0](inDesc, inName, *(_QWORD *)&inVersion, inFactory);
}

uint64_t AudioComponentRelease()
{
  return MEMORY[0x24BDB67D8]();
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x24BDB67E0](inAudioConverter, *(_QWORD *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BDB67F0](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x24BDB67F8](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6800](inAudioConverter, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterGetPropertyInfo(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x24BDB6808](inAudioConverter, *(_QWORD *)&inPropertyID, outSize, outWritable);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x24BDB6810](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x24BDB6820](inAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6828](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioFileCountUserData(AudioFileID inAudioFile, UInt32 inUserDataID, UInt32 *outNumberItems)
{
  return MEMORY[0x24BDB6840](inAudioFile, *(_QWORD *)&inUserDataID, outNumberItems);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6850](inAudioFile, *(_QWORD *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetPropertyInfo(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *outDataSize, UInt32 *isWritable)
{
  return MEMORY[0x24BDB6858](inAudioFile, *(_QWORD *)&inPropertyID, outDataSize, isWritable);
}

OSStatus AudioFileGetUserData(AudioFileID inAudioFile, UInt32 inUserDataID, UInt32 inIndex, UInt32 *ioUserDataSize, void *outUserData)
{
  return MEMORY[0x24BDB6860](inAudioFile, *(_QWORD *)&inUserDataID, *(_QWORD *)&inIndex, ioUserDataSize, outUserData);
}

OSStatus AudioFileGetUserDataSize(AudioFileID inAudioFile, UInt32 inUserDataID, UInt32 inIndex, UInt32 *outUserDataSize)
{
  return MEMORY[0x24BDB6868](inAudioFile, *(_QWORD *)&inUserDataID, *(_QWORD *)&inIndex, outUserDataSize);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB68A8](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x24BDB68B0](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

uint64_t AudioSessionAddPropertyListener_Priv()
{
  return MEMORY[0x24BDB69B8]();
}

uint64_t AudioSessionCopyProperty_Priv()
{
  return MEMORY[0x24BDB69C0]();
}

uint64_t AudioSessionCreatePrimarySession_Priv()
{
  return MEMORY[0x24BDB69C8]();
}

OSStatus AudioSessionGetProperty(AudioSessionPropertyID inID, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDB69D0](*(_QWORD *)&inID, ioDataSize, outData);
}

uint64_t AudioSessionGetServerProperty()
{
  return MEMORY[0x24BDB69D8]();
}

uint64_t AudioSessionRemovePropertyListener_Priv()
{
  return MEMORY[0x24BDB69E0]();
}

uint64_t AudioSessionRequestRecordPermission()
{
  return MEMORY[0x24BDB69E8]();
}

OSStatus AudioSessionSetProperty(AudioSessionPropertyID inID, UInt32 inDataSize, const void *inData)
{
  return MEMORY[0x24BDB69F0](*(_QWORD *)&inID, *(_QWORD *)&inDataSize, inData);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6A10](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6A38](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

os_workgroup_interval_t AudioWorkIntervalCreate(const char *name, os_clockid_t clock, os_workgroup_attr_t attr)
{
  return (os_workgroup_interval_t)MEMORY[0x24BDB6A58](name, *(_QWORD *)&clock, attr);
}

uint64_t CADefaultLog()
{
  return MEMORY[0x24BDB6A68]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x24BDBBA68](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x24BDBC790](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7C0](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7D8](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC810](allocator, url);
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x24BDBC818](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x24BDBC820](allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC840](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC860](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

OSStatus CopyInstrumentInfoFromSoundBank(CFURLRef inURL, CFArrayRef *outInstrumentInfo)
{
  return MEMORY[0x24BDB6AA0](inURL, outInstrumentInfo);
}

OSStatus CopyNameFromSoundBank(CFURLRef inURL, CFStringRef *outName)
{
  return MEMORY[0x24BDB6AA8](inURL, outName);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x24BDB6AC8](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6AD8](inExtAudioFile, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BDB6AF0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6B00](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x24BDB6B10](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6B20](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BDB6B30](inFileID, inForWriting, outExtAudioFile);
}

uint64_t ExtendedAudioBufferList_Create()
{
  return MEMORY[0x24BDB6B48]();
}

uint64_t ExtendedAudioBufferList_Destroy()
{
  return MEMORY[0x24BDB6B50]();
}

uint64_t Float32ToNativeInt16Scaled_ARM()
{
  return MEMORY[0x24BDB6B60]();
}

uint64_t Float32ToNativeInt24_Portable()
{
  return MEMORY[0x24BDB6B68]();
}

uint64_t Float32ToNativeInt32Scaled_ARM()
{
  return MEMORY[0x24BDB6B70]();
}

uint64_t IPCAUIconForBundle()
{
  return MEMORY[0x24BDB6BA0]();
}

uint64_t MSHMIGDispatchMessage()
{
  return MEMORY[0x24BED2F48]();
}

uint64_t MultiRadixRealFFT_Create()
{
  return MEMORY[0x24BED2F50]();
}

uint64_t MultiRadixRealFFT_Dispose()
{
  return MEMORY[0x24BED2F58]();
}

uint64_t MultiRadixRealFFT_RealInPlaceTransform()
{
  return MEMORY[0x24BED2F60]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x24BDAC4A8](libraryName);
}

uint64_t NativeInt16ToFloat32Scaled_ARM()
{
  return MEMORY[0x24BDB6BA8]();
}

uint64_t NativeInt24ToFloat32_Portable()
{
  return MEMORY[0x24BDB6BB0]();
}

uint64_t NativeInt32ToFloat32Scaled_ARM()
{
  return MEMORY[0x24BDB6BB8]();
}

uint64_t StereoDeinterleaveNativeInt16ToScaledFloat32_ARM()
{
  return MEMORY[0x24BDB6BF8]();
}

uint64_t StereoInterleaveFloat32ToInt824_ARM()
{
  return MEMORY[0x24BDB6C00]();
}

uint64_t StereoInterleaveFloat32ToNativeInt16Scaled_ARM()
{
  return MEMORY[0x24BDB6C08]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x24BDBD008]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _CheckRPCError(const char *a1)
{
  return MEMORY[0x24BDB6C10](a1);
}

uint64_t GetMediaServerRPCTimeout(void)
{
  return MEMORY[0x24BDB6C18]();
}

uint64_t _CAInitDefaultDeferredLog(void)
{
  return MEMORY[0x24BDB6C20]();
}

uint64_t CACFPreferencesCopyAppValue(const __CFString *a1, const __CFString *a2)
{
  return MEMORY[0x24BED2F68](a1, a2);
}

uint64_t CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  return MEMORY[0x24BED2F70](a1, a2, a3);
}

uint64_t CAShouldEmitRateLimitedRTErrorLog(void)
{
  return MEMORY[0x24BDB6C28]();
}

uint64_t Read()
{
  return MEMORY[0x24BED2F78]();
}

uint64_t PowerMeter::ClearClipping(PowerMeter *this)
{
  return MEMORY[0x24BED2F80](this);
}

uint64_t PowerMeter::Process_Int16(PowerMeter *this, const __int16 *a2)
{
  return MEMORY[0x24BED2F88](this, a2);
}

uint64_t PowerMeter::Process_Int32(PowerMeter *this, const int *a2)
{
  return MEMORY[0x24BED2F90](this, a2);
}

uint64_t PowerMeter::SetSampleRate(PowerMeter *this, double a2)
{
  return MEMORY[0x24BED2F98](this, a2);
}

uint64_t PowerMeter::Reset(PowerMeter *this)
{
  return MEMORY[0x24BED2FA0](this);
}

uint64_t PowerMeter::Process(PowerMeter *this, const float *a2)
{
  return MEMORY[0x24BED2FA8](this, a2);
}

void PowerMeter::PowerMeter(PowerMeter *this)
{
  MEMORY[0x24BED2FB0](this);
}

void SincKernel::SincKernel(SincKernel *this, double a2, double a3)
{
  MEMORY[0x24BED2FB8](this, a2, a3);
}

void SincKernel::~SincKernel(SincKernel *this)
{
  MEMORY[0x24BED2FC0](this);
}

void CAFormatter::CAFormatter(CAFormatter *this, OpaqueAudioConverter *a2)
{
  MEMORY[0x24BDB6C30](this, a2);
}

void CAFormatter::CAFormatter(CAFormatter *this, const AudioChannelLayout *a2)
{
  MEMORY[0x24BDB6C38](this, a2);
}

void CAFormatter::CAFormatter(CAFormatter *this, const void *a2)
{
  MEMORY[0x24BDB6C40](this, a2);
}

void CAFormatter::CAFormatter(CAFormatter *this, const CAStreamBasicDescription *a2)
{
  MEMORY[0x24BDB6C48](this, a2);
}

void CAFormatter::CAFormatter(CAFormatter *this, const AudioComponentDescription *a2)
{
  MEMORY[0x24BDB6C50](this, a2);
}

void CAFormatter::CAFormatter(CAFormatter *this, const AudioStreamBasicDescription *a2)
{
  MEMORY[0x24BDB6C58](this, a2);
}

uint64_t CADeprecated::XMachServer::XMachServer()
{
  return MEMORY[0x24BED2FD0]();
}

uint64_t CADeprecated::CABufferList::AllocateBuffers(CADeprecated::CABufferList *this)
{
  return MEMORY[0x24BED2FD8](this);
}

uint64_t CADeprecated::XBasicMIGServer::SetServerDispatchQueue()
{
  return MEMORY[0x24BED2FE0]();
}

uint64_t CADeprecated::XMachReceivePort::SetMachPort(CADeprecated::XMachReceivePort *this)
{
  return MEMORY[0x24BED2FE8](this);
}

uint64_t CADeprecated::XMachReceivePort::CreateMachPort(CADeprecated::XMachReceivePort *this)
{
  return MEMORY[0x24BED2FF0](this);
}

void CADeprecated::XMachReceivePort::~XMachReceivePort(CADeprecated::XMachReceivePort *this)
{
  MEMORY[0x24BED2FF8](this);
}

uint64_t CADeprecated::RealtimeMessenger::PerformAsync()
{
  return MEMORY[0x24BED3000]();
}

uint64_t CADeprecated::RealtimeMessenger::PerformPendingMessages(CADeprecated::RealtimeMessenger *this)
{
  return MEMORY[0x24BED3008](this);
}

uint64_t CADeprecated::RealtimeMessenger::RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  return MEMORY[0x24BED3010](this);
}

{
  return MEMORY[0x24BED3018](this);
}

void CADeprecated::RealtimeMessenger::~RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  MEMORY[0x24BED3020](this);
}

uint64_t CADeprecated::XRemoteMachServer::SetServerPort(CADeprecated::XRemoteMachServer *this)
{
  return MEMORY[0x24BED3028](this);
}

uint64_t CADeprecated::XRemoteMachServer::XRemoteMachServer(CADeprecated::XRemoteMachServer *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED3030](this, a2, a3);
}

void CADeprecated::XRemoteMachServer::~XRemoteMachServer(CADeprecated::XRemoteMachServer *this)
{
  MEMORY[0x24BED3038](this);
}

void CADeprecated::XMachPortSendRight::~XMachPortSendRight(CADeprecated::XMachPortSendRight *this)
{
  MEMORY[0x24BED3040](this);
}

uint64_t CADeprecated::XMachPortDeathListener::SetDeathNotificationDispatchQueue()
{
  return MEMORY[0x24BED3048]();
}

void CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(CADeprecated::XMachPortDeathListener *this)
{
  MEMORY[0x24BED3050](this);
}

uint64_t CADeprecated::CAGuard::Wait(CADeprecated::CAGuard *this)
{
  return MEMORY[0x24BED3058](this);
}

uint64_t CADeprecated::CAGuard::Notify(CADeprecated::CAGuard *this)
{
  return MEMORY[0x24BED3060](this);
}

uint64_t CADeprecated::CAGuard::CAGuard(CADeprecated::CAGuard *this, const char *a2)
{
  return MEMORY[0x24BED3068](this, a2);
}

void CADeprecated::CAGuard::~CAGuard(CADeprecated::CAGuard *this)
{
  MEMORY[0x24BED3070](this);
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  return MEMORY[0x24BED3078](this, a2);
}

uint64_t CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  return MEMORY[0x24BED3080](this);
}

uint64_t CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  return MEMORY[0x24BED3088](this);
}

uint64_t CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  return MEMORY[0x24BED3090](this, a2);
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  MEMORY[0x24BED3098](this);
}

uint64_t CADeprecated::XThread::Stop(CADeprecated::XThread *this)
{
  return MEMORY[0x24BED30A0](this);
}

uint64_t CADeprecated::CAPThread::SetPriority(CADeprecated::CAPThread *this, _opaque_pthread_t *a2)
{
  return MEMORY[0x24BED30B0](this, a2);
}

uint64_t CADeprecated::CAPThread::SetPriority(CADeprecated::CAPThread *this)
{
  return MEMORY[0x24BED30B8](this);
}

uint64_t CADeprecated::CAPThread::Start(CADeprecated::CAPThread *this)
{
  return MEMORY[0x24BED30C0](this);
}

uint64_t CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  return MEMORY[0x24BED30C8](this, a2, a3, a4, a5, a6, a7);
}

{
  return MEMORY[0x24BED30D0](this, a2, a3, a4, a5, a6, a7);
}

uint64_t CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, unsigned int a4, unsigned int a5, unsigned int a6, BOOL a7, BOOL a8, const char *a9)
{
  return MEMORY[0x24BED30D8](this, a2, a3);
}

void CADeprecated::CAPThread::~CAPThread(CADeprecated::CAPThread *this)
{
  MEMORY[0x24BED30E0](this);
}

uint64_t CASerializer::WritePlist(CASerializer *this, const void *a2)
{
  return MEMORY[0x24BED30E8](this, a2);
}

uint64_t CASerializer::Write(CASerializer *this, const void *a2)
{
  return MEMORY[0x24BED30F0](this, a2);
}

void CASerializer::CASerializer(CASerializer *this, __CFData *a2)
{
  MEMORY[0x24BED30F8](this, a2);
}

void CASerializer::~CASerializer(CASerializer *this)
{
  MEMORY[0x24BED3100](this);
}

uint64_t MemoryStream::MemoryStream()
{
  return MEMORY[0x24BED3110]();
}

void MemoryStream::MemoryStream(MemoryStream *this)
{
  MEMORY[0x24BED3118](this);
}

void MemoryStream::~MemoryStream(MemoryStream *this)
{
  MEMORY[0x24BED3120](this);
}

void CABundleLocker::CABundleLocker(CABundleLocker *this)
{
  MEMORY[0x24BED3128](this);
}

void CABundleLocker::~CABundleLocker(CABundleLocker *this)
{
  MEMORY[0x24BED3130](this);
}

uint64_t CACFDictionary::AddFloat32(CACFDictionary *this, const __CFString *a2, float a3)
{
  return MEMORY[0x24BED3138](this, a2, a3);
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  return MEMORY[0x24BED3140](this, a2, a3);
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BED3148](this, a2);
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  return MEMORY[0x24BED3150](this, a2, a3);
}

uint64_t CACFDictionary::AddSInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BED3158](this, a2);
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BED3160](this, a2, a3);
}

uint64_t CACFDictionary::AddUInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BED3168](this, a2);
}

uint64_t CACFDictionary::AddUInt64(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x24BED3170](this, a2);
}

uint64_t CADeserializer::GetAndAdvanceReadPtr(CADeserializer *this)
{
  return MEMORY[0x24BED3178](this);
}

uint64_t CADeserializer::Read(CADeserializer *this, void *a2)
{
  return MEMORY[0x24BED3180](this, a2);
}

uint64_t CADeserializer::ReadPlist(CADeserializer *this)
{
  return MEMORY[0x24BED3188](this);
}

void CADeserializer::CADeserializer(CADeserializer *this, const void *a2)
{
  MEMORY[0x24BED3190](this, a2);
}

void CADeserializer::~CADeserializer(CADeserializer *this)
{
  MEMORY[0x24BED3198](this);
}

uint64_t BaseOpaqueObject::ResolveOpaqueRef()
{
  return MEMORY[0x24BED31A8]();
}

uint64_t BaseOpaqueObject::checkRTTI()
{
  return MEMORY[0x24BED31B0]();
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this)
{
  MEMORY[0x24BED31C0](this);
}

void BaseOpaqueObject::~BaseOpaqueObject(BaseOpaqueObject *this)
{
  MEMORY[0x24BED31C8](this);
}

uint64_t CASmartPreferences::_RegisterFirstHandler()
{
  return MEMORY[0x24BED31E0]();
}

uint64_t CASmartPreferences::instance(CASmartPreferences *this)
{
  return MEMORY[0x24BED31E8](this);
}

uint64_t PropertyMarshaller::Deserialize()
{
  return MEMORY[0x24BED31F0]();
}

uint64_t PropertyMarshaller::Serialize()
{
  return MEMORY[0x24BED31F8]();
}

uint64_t SharableMemoryBlock::InitClient()
{
  return MEMORY[0x24BED3200]();
}

uint64_t SharableMemoryBlock::MachClientToken::Reset(SharableMemoryBlock::MachClientToken *this)
{
  return MEMORY[0x24BED3208](this);
}

uint64_t SharableMemoryBlock::Free(SharableMemoryBlock *this)
{
  return MEMORY[0x24BED3210](this);
}

uint64_t CAAudioChannelLayout::NumberChannels(CAAudioChannelLayout *this, const AudioChannelLayout *a2)
{
  return MEMORY[0x24BED3218](this, a2);
}

uint64_t CAAudioChannelLayout::Set(CAAudioChannelLayout *this, const AudioChannelLayout *a2)
{
  return MEMORY[0x24BED3220](this, a2);
}

uint64_t CAAudioChannelLayout::Clear(CAAudioChannelLayout *this)
{
  return MEMORY[0x24BED3228](this);
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, const CAAudioChannelLayout *a2)
{
  MEMORY[0x24BED3230](this, a2);
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this)
{
  MEMORY[0x24BED3238](this);
}

{
  MEMORY[0x24BED3240](this);
}

void CAAudioChannelLayout::~CAAudioChannelLayout(CAAudioChannelLayout *this)
{
  MEMORY[0x24BED3248](this);
}

uint64_t CAAudioChannelLayout::operator=()
{
  return MEMORY[0x24BED3250]();
}

{
  return MEMORY[0x24BED3258]();
}

uint64_t PlatformUtilities_iOS::GetProductType(PlatformUtilities_iOS *this)
{
  return MEMORY[0x24BED3260](this);
}

uint64_t PlatformUtilities_iOS::ProductIsAPhone(PlatformUtilities_iOS *this)
{
  return MEMORY[0x24BED3268](this);
}

uint64_t PlatformUtilities_iOS::ProductIsAppleTV(PlatformUtilities_iOS *this)
{
  return MEMORY[0x24BED3270](this);
}

uint64_t PlatformUtilities_iOS::ProductIsAppleWatch(PlatformUtilities_iOS *this)
{
  return MEMORY[0x24BED3278](this);
}

uint64_t AudioUnitPropertyMarshaller::CreateMarshaller(AudioUnitPropertyMarshaller *this)
{
  return MEMORY[0x24BDB6C60](this);
}

uint64_t AT::RingBuffer::Fetch(AT::RingBuffer *this, AudioBufferList *a2)
{
  return MEMORY[0x24BDB6C68](this, a2);
}

uint64_t AT::RingBuffer::Store(AT::RingBuffer *this, const AudioBufferList *a2)
{
  return MEMORY[0x24BDB6C70](this, a2);
}

uint64_t AT::RingBuffer::RingBuffer(AT::RingBuffer *this)
{
  return MEMORY[0x24BDB6C78](this);
}

void AT::RingBuffer::~RingBuffer(AT::RingBuffer *this)
{
  MEMORY[0x24BDB6C80](this);
}

uint64_t AT::AudioTapClient::AudioTapClient(AT::AudioTapClient *this, const void *a2)
{
  return MEMORY[0x24BDB6C88](this, a2);
}

uint64_t AT::Resampler::MockResampler::SetIsBypassed(AT::Resampler::MockResampler *this)
{
  return MEMORY[0x24BDB6C90](this);
}

uint64_t AT::Resampler::MockResampler::SetVarispeedRate(AT::Resampler::MockResampler *this, double a2)
{
  return MEMORY[0x24BDB6C98](this, a2);
}

uint64_t AT::Resampler::MockResampler::GetNumberOfSourceFrames(AT::Resampler::MockResampler *this)
{
  return MEMORY[0x24BDB6CA0](this);
}

uint64_t AT::Resampler::MockResampler::Process(AT::Resampler::MockResampler *this)
{
  return MEMORY[0x24BDB6CA8](this);
}

uint64_t AT::Resampler::MockResampler::SetRamp()
{
  return MEMORY[0x24BDB6CB0]();
}

uint64_t AT::Resampler::MockResampler::MockResampler()
{
  return MEMORY[0x24BDB6CB8]();
}

void AT::Resampler::MockResampler::~MockResampler(AT::Resampler::MockResampler *this)
{
  MEMORY[0x24BDB6CC0](this);
}

uint64_t AT::Resampler::ShutdownVarispeedMode(AT::Resampler *this)
{
  return MEMORY[0x24BDB6CC8](this);
}

uint64_t AT::Resampler::InitializeVarispeedMode(AT::Resampler *this)
{
  return MEMORY[0x24BDB6CD0](this);
}

uint64_t AT::Resampler::create(AT::Resampler *this, double a2, double a3, double a4)
{
  return MEMORY[0x24BDB6CD8](this, a2, a3, a4);
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
  MEMORY[0x24BEC6D98](this);
}

uint64_t caulk::concurrent::messenger::drain(caulk::concurrent::messenger *this)
{
  return MEMORY[0x24BEC6DB0](this);
}

uint64_t caulk::concurrent::messenger::enqueue(caulk::concurrent::messenger *this, caulk::concurrent::message *a2)
{
  return MEMORY[0x24BEC6DB8](this, a2);
}

uint64_t caulk::concurrent::messenger::messenger()
{
  return MEMORY[0x24BEC6DC0]();
}

void caulk::concurrent::messenger::~messenger(caulk::concurrent::messenger *this)
{
  MEMORY[0x24BEC6DD0](this);
}

uint64_t caulk::deferred_logger::create_message(caulk::deferred_logger *this, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEC6DD8](this, a2, a3);
}

uint64_t caulk::pooled_semaphore_mutex::_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DE8](this);
}

uint64_t caulk::pooled_semaphore_mutex::_unlock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DF0](this);
}

uint64_t caulk::pooled_semaphore_mutex::try_lock(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6DF8](this);
}

uint64_t caulk::pooled_semaphore_mutex::pooled_semaphore_mutex(caulk::pooled_semaphore_mutex *this)
{
  return MEMORY[0x24BEC6E00](this);
}

uint64_t caulk::rt_safe_memory_resource::rt_allocate(caulk::rt_safe_memory_resource *this)
{
  return MEMORY[0x24BEC6E08](this);
}

uint64_t caulk::rt_safe_memory_resource::rt_deallocate(caulk::rt_safe_memory_resource *this, void *a2)
{
  return MEMORY[0x24BEC6E10](this, a2);
}

uint64_t caulk::init_realtime_safe_resource(caulk *this)
{
  return MEMORY[0x24BEC6E20](this);
}

uint64_t caulk::mach::this_thread::set_priority()
{
  return MEMORY[0x24BEC6E28]();
}

uint64_t caulk::mach::os_workgroup_managed::join(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x24BEC6E30](this);
}

uint64_t caulk::mach::os_workgroup_managed::make()
{
  return MEMORY[0x24BEC6E38]();
}

uint64_t caulk::mach::os_workgroup_managed::leave(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x24BEC6E40](this);
}

void caulk::mach::os_workgroup_managed::~os_workgroup_managed(caulk::mach::os_workgroup_managed *this)
{
  MEMORY[0x24BEC6E48](this);
}

void caulk::mach::os_workgroup_interval_managed::~os_workgroup_interval_managed(caulk::mach::os_workgroup_interval_managed *this)
{
  MEMORY[0x24BEC6E58](this);
}

uint64_t caulk::mach::details::retain_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x24BEC6E60](this, a2);
}

uint64_t caulk::mach::details::release_os_object(caulk::mach::details *this, void *a2)
{
  return MEMORY[0x24BEC6E68](this, a2);
}

uint64_t caulk::thread::attributes::apply_to_this_thread(caulk::thread::attributes *this)
{
  return MEMORY[0x24BEC6EC0](this);
}

uint64_t caulk::thread::join(caulk::thread *this)
{
  return MEMORY[0x24BEC6EC8](this);
}

uint64_t caulk::thread::start(caulk::thread *this, caulk::thread::attributes *a2, void *(*a3)(void *), void *a4)
{
  return MEMORY[0x24BEC6ED0](this, a2, a3, a4);
}

void caulk::thread::~thread(caulk::thread *this)
{
  MEMORY[0x24BEC6ED8](this);
}

uint64_t caulk::semaphore::timed_wait(caulk::semaphore *this, double a2)
{
  return MEMORY[0x24BEC6F08](this, a2);
}

uint64_t caulk::semaphore::signal(caulk::semaphore *this)
{
  return MEMORY[0x24BEC6F10](this);
}

uint64_t caulk::semaphore::semaphore(caulk::semaphore *this)
{
  return MEMORY[0x24BEC6F18](this);
}

void caulk::semaphore::~semaphore(caulk::semaphore *this)
{
  MEMORY[0x24BEC6F20](this);
}

uint64_t TStream::ReadLittle16(TStream *this)
{
  return MEMORY[0x24BED3288](this);
}

uint64_t TStream::ReadLittle32(TStream *this)
{
  return MEMORY[0x24BED3290](this);
}

uint64_t TStream::WriteLittle16(TStream *this)
{
  return MEMORY[0x24BED3298](this);
}

uint64_t TStream::WriteLittle32(TStream *this)
{
  return MEMORY[0x24BED32A0](this);
}

uint64_t TStream::ReadByte(TStream *this)
{
  return MEMORY[0x24BED32A8](this);
}

uint64_t RampList::Reader::AdvanceOutputTime(RampList::Reader *this, double a2)
{
  return MEMORY[0x24BED32B0](this, a2);
}

uint64_t RampList::Reader::Segment()
{
  return MEMORY[0x24BED32B8]();
}

uint64_t RampList::Writer::ScaleRates(RampList::Writer *this, double a2)
{
  return MEMORY[0x24BED32C0](this, a2);
}

uint64_t RampList::Writer::clear(RampList::Writer *this)
{
  return MEMORY[0x24BED32C8](this);
}

uint64_t RampList::Writer::AddRamps()
{
  return MEMORY[0x24BED32D0]();
}

uint64_t RampList::Writer::GetRamps()
{
  return MEMORY[0x24BED32D8]();
}

uint64_t RampList::Writer::SetOrigin(RampList::Writer *this, double a2, double a3)
{
  return MEMORY[0x24BED32E0](this, a2, a3);
}

void RampList::~RampList(RampList *this)
{
  MEMORY[0x24BED32E8](this);
}

uint64_t RateRamp::OffsetTimes(RateRamp *this, double a2, double a3)
{
  return MEMORY[0x24BED32F0](this, a2, a3);
}

void RateRamp::RateRamp(RateRamp *this, double a2, double a3, double a4, double a5, double a6)
{
  MEMORY[0x24BED32F8](this, a2, a3, a4, a5, a6);
}

void RateRamp::RateRamp(RateRamp *this)
{
  MEMORY[0x24BED3300](this);
}

uint64_t TFileBSD::InitializeAsync(TFileBSD *this, int *a2)
{
  return MEMORY[0x24BED3308](this, a2);
}

void TFileBSD::TFileBSD(TFileBSD *this, const __CFURL *a2)
{
  MEMORY[0x24BED3310](this, a2);
}

uint64_t TruePeak::ResetStats(TruePeak *this)
{
  return MEMORY[0x24BED3318](this);
}

uint64_t TruePeak::Reset(TruePeak *this)
{
  return MEMORY[0x24BED3320](this);
}

uint64_t TruePeak::Process(TruePeak *this, uint64_t a2, const float *a3)
{
  return MEMORY[0x24BED3328](this, a2, a3);
}

void TruePeak::TruePeak(TruePeak *this)
{
  MEMORY[0x24BED3330](this);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this)
{
  return MEMORY[0x24BED3338](this);
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED3340](this, a2);
}

uint64_t PowerMeter::LinearToDB(PowerMeter *this, double a2)
{
  return MEMORY[0x24BED3348](this, a2);
}

uint64_t CADeprecated::CAMutex::IsOwnedByCurrentThread(CADeprecated::CAMutex *this)
{
  return MEMORY[0x24BED3350](this);
}

uint64_t CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  return MEMORY[0x24BED3358](this, a2, a3);
}

uint64_t CACFDictionary::GetCACFArray(CACFDictionary *this, const __CFString *a2, CACFArray *a3)
{
  return MEMORY[0x24BED3360](this, a2, a3);
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  return MEMORY[0x24BED3368](this, a2, a3);
}

uint64_t CACFDictionary::GetCACFDictionary(CACFDictionary *this, const __CFString *a2, CACFDictionary *a3)
{
  return MEMORY[0x24BED3370](this, a2, a3);
}

uint64_t CACFDictionary::Size(CACFDictionary *this)
{
  return MEMORY[0x24BED3378](this);
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  return MEMORY[0x24BED3380](this, a2, a3);
}

uint64_t CACFDictionary::GetKeys(CACFDictionary *this, const void **a2)
{
  return MEMORY[0x24BED3388](this, a2);
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  return MEMORY[0x24BED3390](this, a2, a3);
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  return MEMORY[0x24BED3398](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  return MEMORY[0x24BED33A0](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  return MEMORY[0x24BED33A8](this, a2, a3);
}

uint64_t AT::AudioTapClient::GetChannelLayout(AT::AudioTapClient *this)
{
  return MEMORY[0x24BDB6CE0](this);
}

uint64_t AT::AudioTapClient::GetSerializedObjC(AT::AudioTapClient *this)
{
  return MEMORY[0x24BDB6CE8](this);
}

uint64_t AT::AudioTapClient::GetObjC(AT::AudioTapClient *this, void *a2)
{
  return MEMORY[0x24BDB6CF0](this, a2);
}

uint64_t AT::AudioTapClient::GetFormat(AT::AudioTapClient *this)
{
  return MEMORY[0x24BDB6CF8](this);
}

uint64_t caulk::mach::os_workgroup_managed::copy_mach_port(caulk::mach::os_workgroup_managed *this)
{
  return MEMORY[0x24BEC6F38](this);
}

uint64_t RateRamp::OutputDuration(RateRamp *this)
{
  return MEMORY[0x24BED33B0](this);
}

uint64_t RateRamp::RateForOutputTime(RateRamp *this, double a2)
{
  return MEMORY[0x24BED33B8](this, a2);
}

uint64_t RateRamp::InputTimeForOutputTime(RateRamp *this, double a2)
{
  return MEMORY[0x24BED33C0](this, a2);
}

uint64_t TruePeak::GetStats()
{
  return MEMORY[0x24BED33C8]();
}

uint64_t CACFArray::GetCACFDictionary(CACFArray *this, uint64_t a2, CACFDictionary *a3)
{
  return MEMORY[0x24BED33D0](this, a2, a3);
}

uint64_t CACFArray::GetUInt32(CACFArray *this, uint64_t a2, unsigned int *a3)
{
  return MEMORY[0x24BED33D8](this, a2, a3);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB58](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const char *__what_arg)
{
  return (std::system_error *)MEMORY[0x24BEDADB0](this, *(_QWORD *)&__ev, __ecat, __what_arg);
}

void std::system_error::~system_error(std::system_error *this)
{
  MEMORY[0x24BEDADC8](this);
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x24BEDB028](this);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB088](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB090](this);
}

BOOL std::recursive_mutex::try_lock(std::recursive_mutex *this)
{
  return MEMORY[0x24BEDB098](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x24BEDB0A0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB0A8](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x24BEDB660](this);
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
  MEMORY[0x24BEDB670](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24CA862B8();
}

void operator delete(void *__p)
{
  off_24CA862C0(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_24CA862C8(__p, a2);
}

uint64_t operator delete()
{
  return off_24CA862D0();
}

uint64_t operator<<()
{
  return MEMORY[0x24BED3400]();
}

{
  return MEMORY[0x24BED3408]();
}

{
  return MEMORY[0x24BED3410]();
}

{
  return MEMORY[0x24BED3418]();
}

{
  return MEMORY[0x24BED3420]();
}

uint64_t operator new[]()
{
  return off_24CA86300();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA86308(__sz);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_24CA86310(__sz, a2);
}

uint64_t operator new()
{
  return off_24CA86318();
}

uint64_t operator>>()
{
  return MEMORY[0x24BED3428]();
}

{
  return MEMORY[0x24BED3430]();
}

{
  return MEMORY[0x24BED3438]();
}

{
  return MEMORY[0x24BED3440]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x24BEDB938](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x24BDACB98]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x24BDACBA0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

long double asinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAD198](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x24BEDA8D8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x24BDAE580](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x24BDAE7A0](a1, *(_QWORD *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
  MEMORY[0x24BDAE7A8](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

uint64_t initInterAppAudioLogging()
{
  return MEMORY[0x24BDB6D18]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

long double logb(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAE8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x24BDAED18]();
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x24BDAED48](ptr);
}

void malloc_make_purgeable(void *ptr)
{
  MEMORY[0x24BDAED50](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAEDA0](zone, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x24BDAEDC0](zone, ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x24BDAF4E8]();
}

int os_workgroup_interval_finish(os_workgroup_interval_t wg, os_workgroup_interval_data_t data)
{
  return MEMORY[0x24BDAF548](wg, data);
}

int os_workgroup_interval_start(os_workgroup_interval_t wg, uint64_t start, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x24BDAF550](wg, start, deadline, data);
}

uint64_t os_workgroup_join_self()
{
  return MEMORY[0x24BDAF568]();
}

uint64_t os_workgroup_leave_self()
{
  return MEMORY[0x24BDAF578]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

long double scalbn(long double __x, int __y)
{
  long double result;

  MEMORY[0x24BDAFC38](*(_QWORD *)&__y, __x);
  return result;
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE28](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

void srandom(unsigned int a1)
{
  MEMORY[0x24BDAFE98](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x24BDB0110](*(_QWORD *)&state, path);
}

sysdir_search_path_enumeration_state sysdir_start_search_path_enumeration(sysdir_search_path_directory_t dir, sysdir_search_path_domain_mask_t domainMask)
{
  return MEMORY[0x24BDB0118](*(_QWORD *)&dir, *(_QWORD *)&domainMask);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x24BDB0170](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void vDSP_biquadm(vDSP_biquadm_Setup __Setup, const float **__X, vDSP_Stride __IX, float **__Y, vDSP_Stride __IY, vDSP_Length __N)
{
  MEMORY[0x24BDB3160](__Setup, __X, __IX, __Y, __IY, __N);
}

void vDSP_biquadm_CopyState(vDSP_biquadm_Setup __dest, const vDSP_biquadm_SetupStruct *__src)
{
  MEMORY[0x24BDB3168](__dest, __src);
}

vDSP_biquadm_Setup vDSP_biquadm_CreateSetup(const double *__coeffs, vDSP_Length __M, vDSP_Length __N)
{
  return (vDSP_biquadm_Setup)MEMORY[0x24BDB3170](__coeffs, __M, __N);
}

void vDSP_biquadm_DestroySetup(vDSP_biquadm_Setup __setup)
{
  MEMORY[0x24BDB3178](__setup);
}

void vDSP_biquadm_ResetState(vDSP_biquadm_Setup __setup)
{
  MEMORY[0x24BDB3180](__setup);
}

void vDSP_biquadm_SetActiveFilters(vDSP_biquadm_Setup __setup, const BOOL *__filter_states)
{
  MEMORY[0x24BDB3188](__setup, __filter_states);
}

void vDSP_biquadm_SetCoefficientsDouble(vDSP_biquadm_Setup __setup, const double *__coeffs, vDSP_Length __start_sec, vDSP_Length __start_chn, vDSP_Length __nsec, vDSP_Length __nchn)
{
  MEMORY[0x24BDB3190](__setup, __coeffs, __start_sec, __start_chn, __nsec, __nchn);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x24BDB31A0](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x24BDB31A8](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x24BDB31C0](__setup);
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31C8](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x24BDB31F8](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
  MEMORY[0x24BDB3208](__C, __N, *(_QWORD *)&__Flag);
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB32C8](__A, __B, __IB, __C, __IC, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3308](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vasm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3320](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3328](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3330](__C, __IC, __N);
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3408](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmin(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3418](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmsa(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3428](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vrampmul(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3468](__I, __IS, __Start, __Step, __O, __OS, __N);
}

void vDSP_vrampmuladd(const float *__I, vDSP_Stride __IS, float *__Start, const float *__Step, float *__O, vDSP_Stride __OS, vDSP_Length __N)
{
  MEMORY[0x24BDB3478](__I, __IS, __Start, __Step, __O, __OS, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsbsm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34B8](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34C0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34D8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, const float *__D, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x24BDB34E8](__A, __IA, __B, __C, __IC, __D, __E, __IE);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vthres(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3550](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3598](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvabs(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB35A0](__A, __IA, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB35C0](__A, __IA, __C, __IC, __N);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x24BDB35D0](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

void vDSP_zvphas(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB35E0](__A, __IA, __C, __IC, __N);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

void vvpowf(float *a1, const float *a2, const float *a3, const int *a4)
{
  MEMORY[0x24BDB3B60](a1, a2, a3, a4);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

