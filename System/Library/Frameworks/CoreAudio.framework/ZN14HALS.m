@implementation ZN14HALS

char *___ZN14HALS_IOContext15SetPropertyDataEjRK26AudioObjectPropertyAddressjPKvjS4_P11HALS_Client_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;
  char *v4;
  char *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  _DWORD *exception;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 48) != 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "HALS_IOContext.cpp";
      v20 = 1024;
      v21 = 1236;
      _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  HALS_IOContext::_SetPropertyData: bad property data size for kAudioDevicePropertyAddReporterID", (uint8_t *)&v18, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E69A1B30;
    exception[2] = 561211770;
  }
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 40);
  result = *(char **)(v2 + 160);
  v4 = *(char **)(v2 + 168);
  if (result == v4)
  {
    v5 = *(char **)(v2 + 160);
  }
  else
  {
    v5 = *(char **)(v2 + 160);
    while (*(_QWORD *)v5 != *v1)
    {
      v5 += 8;
      if (v5 == v4)
      {
        v5 = *(char **)(v2 + 168);
        break;
      }
    }
  }
  if (v5 == v4)
  {
    v6 = *(_QWORD *)(v2 + 176);
    if ((unint64_t)v4 >= v6)
    {
      v8 = (v4 - result) >> 3;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61)
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      v10 = v6 - (_QWORD)result;
      if (v10 >> 2 > v9)
        v9 = v10 >> 2;
      v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8;
      v12 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v11)
        v12 = v9;
      if (v12)
      {
        v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>(v12);
        result = *(char **)(v2 + 160);
        v4 = *(char **)(v2 + 168);
      }
      else
      {
        v13 = 0;
      }
      v14 = (_QWORD *)(v12 + 8 * v8);
      v15 = v12 + 8 * v13;
      *v14 = *v1;
      v7 = v14 + 1;
      while (v4 != result)
      {
        v16 = *((_QWORD *)v4 - 1);
        v4 -= 8;
        *--v14 = v16;
      }
      *(_QWORD *)(v2 + 160) = v14;
      *(_QWORD *)(v2 + 168) = v7;
      *(_QWORD *)(v2 + 176) = v15;
      if (result)
        operator delete(result);
    }
    else
    {
      *(_QWORD *)v4 = *v1;
      v7 = v4 + 8;
    }
    *(_QWORD *)(v2 + 168) = v7;
    std::__sort<std::__less<long long,long long> &,long long *>();
    return (char *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 96) + 352))(*(_QWORD *)(v2 + 96));
  }
  return result;
}

_QWORD *___ZN14HALS_IOEngine221TeardownForIsolatedIOEjj_block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = *(_QWORD **)(a1 + 40);
  v3 = result[96];
  if (v3)
  {
    v4 = *(unsigned int *)(a1 + 48);
    v6 = v3 + 72;
    v5 = *(_QWORD *)(v3 + 72);
    if (v4 >= (*(_QWORD *)(v6 + 8) - v5) >> 3)
      std::vector<std::tuple<unsigned int,void *,unsigned int>>::__throw_out_of_range[abi:ne180100]();
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD, _QWORD))(*result + 1112))(result, *(_QWORD *)(v5 + 8 * v4), *(unsigned int *)(a1 + 52));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

_QWORD *___ZN14HALS_IOEngine218SetupForIsolatedIOEjjj_block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = *(_QWORD **)(a1 + 40);
  v3 = result[96];
  if (v3)
  {
    v4 = *(unsigned int *)(a1 + 48);
    v6 = v3 + 72;
    v5 = *(_QWORD *)(v3 + 72);
    if (v4 >= (*(_QWORD *)(v6 + 8) - v5) >> 3)
      std::vector<std::tuple<unsigned int,void *,unsigned int>>::__throw_out_of_range[abi:ne180100]();
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD, _QWORD, _QWORD))(*result + 1104))(result, *(_QWORD *)(v5 + 8 * v4), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

unsigned int *___ZN14HALS_IOEngine214ReadFromStreamEjjjRK17HALS_IOEngineInfoRK15HALS_BufferInfo_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  unsigned int *result;
  char *v33;
  double v34;
  double v35;
  unint64_t v36;
  size_t mCounter;
  const void *v38;
  uint64_t mHostTime_high;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int *v44;
  HALS_IOClock *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[4];
  AudioTimeStamp v51;

  v2 = *(_QWORD **)(a1 + 40);
  v3 = (_QWORD *)v2[96];
  v4 = *(unsigned int *)(a1 + 64);
  v5 = v3[9];
  v6 = (v3[10] - v5) >> 3;
  if (v4 >= v6)
    goto LABEL_37;
  if (v6 <= v4)
    std::vector<std::tuple<unsigned int,void *,unsigned int>>::__throw_out_of_range[abi:ne180100]();
  v7 = *(_QWORD *)(v5 + 8 * v4);
  if (!v7 || *(_DWORD *)(v7 + 24) != 1)
  {
LABEL_37:
    result = (unsigned int *)(*(uint64_t (**)(_QWORD, _QWORD))(*v2 + 1064))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 68));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result;
    return result;
  }
  v8 = *(_QWORD *)(a1 + 56);
  v10 = (uint64_t *)v3[6];
  v9 = (uint64_t *)v3[7];
  if (v10 == v9)
  {
LABEL_8:
    v11 = 0;
  }
  else
  {
    while (1)
    {
      v11 = *v10;
      if (*(_DWORD *)(*v10 + 16) == *(_DWORD *)(v7 + 16))
        break;
      if (++v10 == v9)
        goto LABEL_8;
    }
  }
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_DWORD *)(a1 + 72);
  if (((*(uint64_t (**)(_QWORD))(*v2 + 672))(*(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if (*(_QWORD *)v8)
      v33 = (char *)(*(_QWORD *)v8 + *(unsigned int *)(v8 + 8));
    else
      v33 = 0;
    goto LABEL_56;
  }
  v14 = *(double *)(v12 + 512);
  v15 = (double)v13;
  v16 = v2[92];
  v17 = v2[93];
  if (v16 == v17)
  {
    v31 = 0;
    v28 = 0.0;
  }
  else
  {
    v18 = v14 + v15;
    v19 = *(unsigned int *)(v11 + 12);
    v20 = 0.0;
    v21 = 0.0;
    do
    {
      if (*(_BYTE *)(*(_QWORD *)v16 + 48))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v16 + 32) + 96);
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v22 + 152))(v22))
        {
          v23 = *(_QWORD *)(*(_QWORD *)v16 + 112);
          if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)v16 + 120) - v23) >> 3) <= v19)
          {
            v26 = 0;
            v25 = 0.0;
          }
          else
          {
            v24 = v23 + 40 * v19;
            v25 = (double)*(uint64_t *)(v24 + 24);
            v26 = *(_QWORD *)(v24 + 32);
          }
          v27 = (double)v26;
          if (v21 <= v20)
          {
            v21 = (double)v26;
            v20 = v25;
          }
          else if (v25 < v27)
          {
            if (v25 < v20)
              v20 = v25;
            if (v21 < v27)
              v21 = (double)v26;
          }
        }
      }
      v16 += 8;
    }
    while (v16 != v17);
    v28 = 0.0;
    if (v21 > v20)
    {
      if (v20 >= v14)
        v29 = v20;
      else
        v29 = v14;
      if (v18 >= v21)
        v30 = v21;
      else
        v30 = v14 + v15;
      if (v18 <= v14)
      {
        v30 = v14 + v15;
        v29 = v14;
      }
      if (v30 > v29)
      {
        v31 = v14 != 0.0;
        v28 = v29;
        goto LABEL_44;
      }
    }
    v31 = 0;
  }
  v30 = 0.0;
LABEL_44:
  if (*(_QWORD *)v8)
  {
    v33 = (char *)(*(_QWORD *)v8 + *(unsigned int *)(v8 + 8));
    if (!v31)
      goto LABEL_56;
LABEL_49:
    v34 = v30 - v28;
    v35 = 0.0;
    if (v30 - v28 < v15)
    {
      bzero(v33, *(unsigned int *)(v8 + 12));
      v35 = v28 - v14;
    }
    HALS_IOEngine2_StreamInfo::GetPointersForMixBuffer((uint64_t)&v51, v11, (unint64_t)v28, v34);
    mCounter = v51.mSMPTETime.mCounter;
    if (v51.mWordClockTime)
      v38 = (const void *)(v51.mWordClockTime + *(unsigned int *)&v51.mSMPTETime.mSubframes);
    else
      v38 = 0;
    if (*(_QWORD *)&v51.mSampleTime)
    {
      mHostTime_high = HIDWORD(v51.mHostTime);
      LODWORD(v36) = *(_DWORD *)(v11 + 64);
      v33 += (v35 * (double)v36);
      memcpy(v33, (const void *)(*(_QWORD *)&v51.mSampleTime + LODWORD(v51.mHostTime)), HIDWORD(v51.mHostTime));
    }
    else
    {
      mHostTime_high = 0;
    }
    if (v38)
      memcpy(&v33[mHostTime_high], v38, mCounter);
    goto LABEL_57;
  }
  v33 = 0;
  if (v31)
    goto LABEL_49;
LABEL_56:
  bzero(v33, *(unsigned int *)(v8 + 12));
LABEL_57:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v41 = *(_QWORD *)(a1 + 48);
  v40 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)v40)
    v42 = *(_QWORD *)v40 + *(unsigned int *)(v40 + 8);
  else
    v42 = 0;
  v43 = *(unsigned int *)(a1 + 72);
  v44 = *(unsigned int **)(v7 + 200);
  result = (unsigned int *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v41 + 320))(v41);
  if ((_DWORD)result)
  {
    v45 = *(HALS_IOClock **)(v41 + 288);
    v46 = *(_OWORD *)(v41 + 528);
    *(_OWORD *)&v51.mSampleTime = *(_OWORD *)(v41 + 512);
    *(_OWORD *)&v51.mRateScalar = v46;
    v47 = *(_OWORD *)(v41 + 560);
    *(_OWORD *)&v51.mSMPTETime.mSubframes = *(_OWORD *)(v41 + 544);
    *(_OWORD *)&v51.mSMPTETime.mHours = v47;
    v48 = *(_OWORD *)(v41 + 464);
    v50[0] = *(_OWORD *)(v41 + 448);
    v50[1] = v48;
    v49 = *(_OWORD *)(v41 + 496);
    v50[2] = *(_OWORD *)(v41 + 480);
    v50[3] = v49;
    return WriteToCaptureFile(v44, v45, &v51, (uint64_t)v50, v43, v42);
  }
  return result;
}

@end
