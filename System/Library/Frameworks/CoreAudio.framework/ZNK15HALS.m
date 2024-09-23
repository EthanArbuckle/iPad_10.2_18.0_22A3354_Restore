@implementation ZNK15HALS

_DWORD *___ZNK15HALS_IOA2Device11HasPropertyEjRK26AudioObjectPropertyAddressP11HALS_Client_block_invoke_24(uint64_t a1)
{
  _DWORD *result;

  result = HALS_IOA2Device::_FindCustomControlForDeviceAddress(*(HALS_IOA2Device **)(a1 + 48), *(const AudioObjectPropertyAddress **)(a1 + 56), (AudioObjectPropertyAddress *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

unsigned int *___ZNK15HALS_IOA2Device15GetPropertyDataEjRK26AudioObjectPropertyAddressjRjPvjPKvP11HALS_Client_block_invoke_78(unsigned int *result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int **v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _DWORD *exception;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = *((_QWORD *)result + 6);
  v2 = *(_QWORD *)(v1 + 1904);
  if (v2)
  {
    v3 = (unsigned int **)result;
    v4 = result[18];
    v5 = v1 + 1904;
    do
    {
      v6 = *(_DWORD *)(v2 + 32);
      v7 = v6 >= v4;
      if (v6 >= v4)
        v8 = (uint64_t *)v2;
      else
        v8 = (uint64_t *)(v2 + 8);
      if (v7)
        v5 = v2;
      v2 = *v8;
    }
    while (*v8);
    if (v5 != v1 + 1904 && v4 >= *(_DWORD *)(v5 + 32))
    {
      v9 = *(_QWORD *)(*((_QWORD *)result + 4) + 8);
      v10 = *(_QWORD *)(v5 + 40);
      *(_DWORD *)(v9 + 48) = *(_DWORD *)(v5 + 48);
      *(_QWORD *)(v9 + 40) = v10;
      v11 = *(_QWORD *)(*((_QWORD *)result + 4) + 8);
      v12 = *(const void **)(v11 + 40);
      if (v12)
      {
        v13 = *(_DWORD *)(v11 + 48);
        if (result[19] <= v13)
        {
          v14 = **((_DWORD **)result + 7);
          if (v14 > v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v17 = 136315394;
            v18 = "HALS_IOA2Device.cpp";
            v19 = 1024;
            v20 = 1569;
            _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  HALS_IOA2Device::GetPropertyData: size specified for data exchange block is too large: this should have been caught in the _GetDevicePropertyDataSize check", (uint8_t *)&v17, 0x12u);
            v14 = *v3[7];
          }
          *(_DWORD *)(*((_QWORD *)v3[5] + 1) + 24) = HALS_IOA2UCDevice::MoveDataExchangeBlockData((HALS_IOA2UCDevice *)(v1 + 1808), *((_DWORD *)v3 + 18), 0, v14);
          result = v3[8];
          if (result)
            return (unsigned int *)memcpy(result, v12, *v3[7]);
          return result;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v17 = 136315394;
          v18 = "HALS_IOA2Device.cpp";
          v19 = 1024;
          v20 = 1565;
          _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  HALS_IOA2Device::GetPropertyData: wrong data size for property 'canc'", (uint8_t *)&v17, 0x12u);
        }
        v15 = 561211770;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v17 = 136315394;
          v18 = "HALS_IOA2Device.cpp";
          v19 = 1024;
          v20 = 1564;
          _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  HALS_IOA2Device::GetPropertyDataSize: bad block ID for property 'canc'", (uint8_t *)&v17, 0x12u);
        }
        v15 = 2003329396;
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_1E69A1B30;
      exception[2] = v15;
    }
  }
  return result;
}

_DWORD *___ZNK15HALS_IOA2Device15GetPropertyDataEjRK26AudioObjectPropertyAddressjRjPvjPKvP11HALS_Client_block_invoke_92(uint64_t a1)
{
  _DWORD *result;

  result = HALS_IOA2Device::_FindCustomControlForDeviceAddress(*(HALS_IOA2Device **)(a1 + 48), *(const AudioObjectPropertyAddress **)(a1 + 56), (AudioObjectPropertyAddress *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

_DWORD *___ZNK15HALS_IOA2Device19GetPropertyDataSizeEjRK26AudioObjectPropertyAddressjPKvP11HALS_Client_block_invoke_34(uint64_t a1)
{
  _DWORD *result;

  result = HALS_IOA2Device::_FindCustomControlForDeviceAddress(*(HALS_IOA2Device **)(a1 + 48), *(const AudioObjectPropertyAddress **)(a1 + 56), (AudioObjectPropertyAddress *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

_DWORD *___ZNK15HALS_IOA2Device18IsPropertySettableEjRK26AudioObjectPropertyAddressP11HALS_Client_block_invoke(uint64_t a1)
{
  _DWORD *result;

  result = HALS_IOA2Device::_FindCustomControlForDeviceAddress(*(HALS_IOA2Device **)(a1 + 48), *(const AudioObjectPropertyAddress **)(a1 + 56), (AudioObjectPropertyAddress *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
