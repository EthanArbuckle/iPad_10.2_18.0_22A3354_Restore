@implementation ZN23EurekaCallCommandDriver26parseRemotePartyNumberNameERKN2vs15VoiceCallStatus10IndicationEN10subscriber7SimSlotE

uint64_t **___ZN23EurekaCallCommandDriver26parseRemotePartyNumberNameERKN2vs15VoiceCallStatus10IndicationEN10subscriber7SimSlotE_block_invoke_2(uint64_t **result, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t **v4;
  uint64_t v5;
  uint64_t **v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  uint64_t *v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = result;
    do
    {
      v5 = v4[4][1];
      v6 = *(uint64_t ***)(v5 + 48);
      if (v6)
      {
        v7 = *v2;
        do
        {
          v8 = *((unsigned __int8 *)v6 + 32);
          if (v7 >= v8)
          {
            if (v8 >= v7)
              goto LABEL_15;
            ++v6;
          }
          v6 = (uint64_t **)*v6;
        }
        while (v6);
      }
      v9 = *v4[5];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *v2;
        *(_DWORD *)buf = 67109120;
        v13 = v10;
        _os_log_impl(&dword_216897000, v9, OS_LOG_TYPE_DEFAULT, "#I Setting caller id to \"\" for callid %d, Available since we don't want to wait for any other indication", buf, 8u);
        v5 = v4[4][1];
      }
      result = std::__tree<std::__value_type<unsigned char,CallInfo>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,CallInfo>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,CallInfo>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t **)(v5 + 40), *v2, (char *)v2);
      if (*((char *)result + 95) < 0)
      {
        result[10] = 0;
        v11 = result[9];
      }
      else
      {
        v11 = (uint64_t *)(result + 9);
        *((_BYTE *)result + 95) = 0;
      }
      *(_BYTE *)v11 = 0;
      *((_DWORD *)result + 33) = *v2;
      *((_DWORD *)result + 30) = 0;
      *((_DWORD *)result + 73) = *((_DWORD *)v4 + 12);
LABEL_15:
      v2 += 7;
    }
    while (v2 != v3);
  }
  return result;
}

@end
