@implementation ZN11HALS

char *___ZN11HALS_PlugIn17_RemoveAllDevicesEv_block_invoke(char *result)
{
  uint64_t v1;
  _QWORD *v2;
  char *v3;
  _BYTE *v4;
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char **v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
  unint64_t v16;
  char *v17;
  void *v18;
  char *v19;

  v1 = *((_QWORD *)result + 5);
  v2 = *(_QWORD **)(*((_QWORD *)result + 4) + 8);
  if (v2 + 5 != (_QWORD *)(v1 + 496))
  {
    v3 = *(char **)(v1 + 496);
    v4 = *(_BYTE **)(v1 + 504);
    v5 = v4 - v3;
    v6 = (v4 - v3) >> 3;
    v7 = v2[7];
    v8 = (char *)v2[5];
    if (v6 <= (v7 - (uint64_t)v8) >> 3)
    {
      v14 = (char *)v2[6];
      v11 = (char **)(v2 + 6);
      v13 = v14;
      v15 = v14 - v8;
      v16 = (v14 - v8) >> 3;
      if (v16 < v6)
      {
        v17 = &v3[8 * v16];
        if (v13 != v8)
        {
          result = (char *)memmove(v8, v3, v15);
          v8 = *v11;
        }
        v5 = v4 - v17;
        if (v4 == v17)
          goto LABEL_21;
        v18 = v8;
        v19 = v17;
        goto LABEL_20;
      }
    }
    else
    {
      if (v8)
      {
        v2[6] = v8;
        operator delete(v8);
        v7 = 0;
        v2[5] = 0;
        v2[6] = 0;
        v2[7] = 0;
      }
      if ((v5 & 0x8000000000000000) != 0)
        goto LABEL_23;
      v9 = v7 >> 2;
      if (v7 >> 2 <= v6)
        v9 = (v4 - v3) >> 3;
      v10 = (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v9;
      if (v10 >> 61)
LABEL_23:
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>(v10);
      v8 = result;
      v2[6] = result;
      v11 = (char **)(v2 + 6);
      *(v11 - 1) = result;
      v11[1] = &result[8 * v12];
    }
    if (v4 == v3)
    {
LABEL_21:
      *v11 = &v8[v5];
      return result;
    }
    v18 = v8;
    v19 = v3;
LABEL_20:
    result = (char *)memmove(v18, v19, v5);
    goto LABEL_21;
  }
  return result;
}

_QWORD *___ZN11HALS_Device15SetPropertyDataEjRK26AudioObjectPropertyAddressjPKvjS4_P11HALS_Client_block_invoke_182(_QWORD *result)
{
  _QWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  _DWORD *exception;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v1 = result;
  v13 = *MEMORY[0x1E0C80C00];
  v2 = (_DWORD *)result[7];
  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(unsigned int *)(v3 + 24);
  v5 = v2[38];
  if (v5 == (_DWORD)v4)
  {
    if ((_DWORD)v4 != -1)
    {
      *(_DWORD *)(v3 + 24) = -1;
      v6 = *(unsigned int *)(*(_QWORD *)(result[4] + 8) + 24);
      v7 = v2[38];
      if (v7 != (_DWORD)v6)
      {
        (*(void (**)(_DWORD *, _QWORD))(*(_QWORD *)v2 + 504))(v2, *(unsigned int *)(*(_QWORD *)(result[4] + 8) + 24));
        v2[38] = v6;
        result = (_QWORD *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)v2 + 520))(v2, v6);
      }
      *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = v7 != (_DWORD)v6;
    }
  }
  else
  {
    if (v5 != -1 && result[8])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "HALS_Device.cpp";
        v11 = 1024;
        v12 = 4209;
        _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  HALS_Device::_SetPropertyData: kAudioDevicePropertyHogMode: hog mode is owned by another process", (uint8_t *)&v9, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_1E69A1B30;
      exception[2] = 560492391;
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)v2 + 504))(result[7], v4);
    v2[38] = v4;
    result = (_QWORD *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)v2 + 520))(v2, v4);
    *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = 1;
  }
  return result;
}

char *___ZN11HALS_Device35SetDSPVirtualChannelLayoutForClientEbP11HALS_ClientPK18AudioChannelLayout_block_invoke(char *result)
{
  _DWORD *v1;
  BOOL v2;
  char *v3;
  void **v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  size_t v15;
  _BYTE *v16;
  char *v17;
  char *v18;
  char *v19;
  char v20;

  v1 = (_DWORD *)*((_QWORD *)result + 6);
  if (v1)
    v2 = result[56] == 0;
  else
    v2 = 0;
  if (v2)
  {
    result = (char *)HALS_Device::ClientDSPInfo::find(*((_QWORD *)result + 4) + 616, *((_QWORD *)result + 5), 1);
    v3 = result;
    if (result)
    {
      v4 = (void **)(result + 72);
      v5 = v1[2];
      if (v5 <= 1)
        v6 = 1;
      else
        v6 = v1[2];
      v7 = 20 * v6;
      v8 = v7 + 12;
      if (result[96])
      {
        v9 = *((_QWORD *)result + 9);
        v10 = (_BYTE *)*((_QWORD *)result + 10);
        v11 = v8 - (_QWORD)&v10[-v9];
        if (v8 <= (unint64_t)&v10[-v9])
        {
          if (v8 < (unint64_t)&v10[-v9])
            *((_QWORD *)result + 10) = v9 + v8;
        }
        else
        {
          v12 = *((_QWORD *)result + 11);
          if (v12 - (uint64_t)v10 >= v11)
          {
            bzero(*((void **)result + 10), v8 - (_QWORD)&v10[-v9]);
            *((_QWORD *)v3 + 10) = v8 + v9;
          }
          else
          {
            v13 = v12 - v9;
            v14 = 2 * v13;
            if (2 * v13 <= v8)
              v14 = v7 + 12;
            if (v13 >= 0x3FFFFFFFFFFFFFFFLL)
              v15 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v15 = v14;
            v16 = operator new(v15);
            v17 = &v16[v15];
            v18 = &v16[v8];
            bzero(&v10[(_QWORD)v16 - v9], v11);
            if (v10 == (_BYTE *)v9)
            {
              v16 = &v10[(_QWORD)v16 - v9];
            }
            else
            {
              v19 = &v10[~v9];
              do
              {
                v20 = *--v10;
                (v19--)[(_QWORD)v16] = v20;
              }
              while (v10 != (_BYTE *)v9);
              v10 = *v4;
            }
            *((_QWORD *)v3 + 9) = v16;
            *((_QWORD *)v3 + 10) = v18;
            *((_QWORD *)v3 + 11) = v17;
            if (v10)
              operator delete(v10);
          }
          v9 = (unint64_t)*v4;
          v5 = v1[2];
        }
        return (char *)memcpy((void *)v9, v1, 20 * v5 + 12);
      }
      else
      {
        std::vector<char>::vector((std::vector<char> *)result + 3, v7 + 12);
        result = (char *)memcpy(*((void **)v3 + 9), v1, 20 * v1[2] + 12);
        v3[96] = 1;
      }
    }
  }
  return result;
}

@end
