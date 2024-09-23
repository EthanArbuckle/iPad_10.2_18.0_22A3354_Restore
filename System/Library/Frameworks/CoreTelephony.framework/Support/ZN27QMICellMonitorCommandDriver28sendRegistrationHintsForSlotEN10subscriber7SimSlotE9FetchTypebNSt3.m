@implementation ZN27QMICellMonitorCommandDriver28sendRegistrationHintsForSlotEN10subscriber7SimSlotE9FetchTypebNSt3

char ***___ZN27QMICellMonitorCommandDriver28sendRegistrationHintsForSlotEN10subscriber7SimSlotE9FetchTypebNSt3__16vectorI14SystemRecord1xNS3_9allocatorIS5_EEEENS4_I16SystemRecordEVDONS6_IS9_EEEENS4_I15SystemRecordGSMNS6_ISC_EEEESE_NS4_I15SystemRecordLTENS6_ISF_EEEESE_NS4_I14SystemRecordNRNS6_ISI_EEEE_block_invoke_30(char ***result, char **a2)
{
  unsigned int *v2;
  unsigned int *v3;
  __int16 v4;
  unint64_t v5;
  __int16 v6;
  char **v7;

  v2 = (unsigned int *)result[4];
  v3 = (unsigned int *)result[5];
  v7 = a2;
  while (v2 != v3)
  {
    v4 = *((_WORD *)v2 + 4);
    v5 = *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32) | ((unint64_t)*((unsigned __int16 *)v2 + 3) << 48);
    v6 = v4;
    result = std::back_insert_iterator<std::vector<nas::tlv::GSMHintItem>>::operator=[abi:ne180100](&v7, (uint64_t *)&v5);
    v2 = (unsigned int *)((char *)v2 + 10);
  }
  return result;
}

char ***___ZN27QMICellMonitorCommandDriver28sendRegistrationHintsForSlotEN10subscriber7SimSlotE9FetchTypebNSt3__16vectorI14SystemRecord1xNS3_9allocatorIS5_EEEENS4_I16SystemRecordEVDONS6_IS9_EEEENS4_I15SystemRecordGSMNS6_ISC_EEEESE_NS4_I15SystemRecordLTENS6_ISF_EEEESE_NS4_I14SystemRecordNRNS6_ISI_EEEE_block_invoke_32(char ***result, char **a2)
{
  unsigned int *v2;
  unsigned int *v3;
  __int16 v4;
  unint64_t v5;
  __int16 v6;
  char **v7;

  v2 = (unsigned int *)result[4];
  v3 = (unsigned int *)result[5];
  v7 = a2;
  while (v2 != v3)
  {
    v4 = *((_WORD *)v2 + 4);
    v5 = *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32) | ((unint64_t)*((unsigned __int16 *)v2 + 3) << 48);
    v6 = v4;
    result = std::back_insert_iterator<std::vector<nas::tlv::GSMHintItem>>::operator=[abi:ne180100](&v7, (uint64_t *)&v5);
    v2 = (unsigned int *)((char *)v2 + 10);
  }
  return result;
}

char ***___ZN27QMICellMonitorCommandDriver28sendRegistrationHintsForSlotEN10subscriber7SimSlotE9FetchTypebNSt3__16vectorI14SystemRecord1xNS3_9allocatorIS5_EEEENS4_I16SystemRecordEVDONS6_IS9_EEEENS4_I15SystemRecordGSMNS6_ISC_EEEESE_NS4_I15SystemRecordLTENS6_ISF_EEEESE_NS4_I14SystemRecordNRNS6_ISI_EEEE_block_invoke_36(char ***result, char **a2)
{
  unsigned int *v2;
  unsigned int *v3;
  __int16 v4;
  unint64_t v5;
  __int16 v6;
  char **v7;

  v2 = (unsigned int *)result[4];
  v3 = (unsigned int *)result[5];
  v7 = a2;
  while (v2 != v3)
  {
    v4 = *((_WORD *)v2 + 4);
    v5 = *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32) | ((unint64_t)*((unsigned __int16 *)v2 + 3) << 48);
    v6 = v4;
    result = std::back_insert_iterator<std::vector<nas::tlv::GSMHintItem>>::operator=[abi:ne180100](&v7, (uint64_t *)&v5);
    v2 = (unsigned int *)((char *)v2 + 10);
  }
  return result;
}

_QWORD *___ZN27QMICellMonitorCommandDriver28sendRegistrationHintsForSlotEN10subscriber7SimSlotE9FetchTypebNSt3__16vectorI14SystemRecord1xNS3_9allocatorIS5_EEEENS4_I16SystemRecordEVDONS6_IS9_EEEENS4_I15SystemRecordGSMNS6_ISC_EEEESE_NS4_I15SystemRecordLTENS6_ISF_EEEESE_NS4_I14SystemRecordNRNS6_ISI_EEEE_block_invoke_38(_QWORD *result, _QWORD *a2)
{
  __int16 *v2;
  __int16 *v3;
  char *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  _QWORD *v22;
  __int16 *v23;

  v3 = (__int16 *)result[4];
  v2 = (__int16 *)result[5];
  if (v3 != v2)
  {
    result = a2 + 2;
    v5 = (char *)a2[1];
    v22 = a2 + 2;
    v23 = v2;
    do
    {
      v6 = *v3;
      v7 = v3[1];
      v8 = v3[2];
      v9 = *((_DWORD *)v3 + 2);
      v10 = v3[6];
      v11 = *((_BYTE *)v3 + 14);
      v12 = *((_DWORD *)v3 + 4);
      if ((unint64_t)v5 >= *result)
      {
        v13 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v5[-*a2] >> 2);
        v14 = v13 + 1;
        if (v13 + 1 > 0xCCCCCCCCCCCCCCCLL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        if (0x999999999999999ALL * ((uint64_t)(*result - *a2) >> 2) > v14)
          v14 = 0x999999999999999ALL * ((uint64_t)(*result - *a2) >> 2);
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*result - *a2) >> 2) >= 0x666666666666666)
          v15 = 0xCCCCCCCCCCCCCCCLL;
        else
          v15 = v14;
        if (v15)
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nas::tlv::NRHintItem>>((uint64_t)result, v15);
        else
          v16 = 0;
        v17 = &v16[20 * v13];
        *(_WORD *)v17 = v6;
        *((_WORD *)v17 + 1) = v7;
        *((_WORD *)v17 + 2) = v8;
        *((_WORD *)v17 + 3) = 0;
        *((_DWORD *)v17 + 2) = v9;
        *((_WORD *)v17 + 6) = v10;
        v17[14] = v11;
        v17[15] = 0;
        *((_DWORD *)v17 + 4) = v12;
        v19 = (char *)*a2;
        v18 = (char *)a2[1];
        v20 = v17;
        if (v18 != (char *)*a2)
        {
          do
          {
            v21 = *(_OWORD *)(v18 - 20);
            *((_DWORD *)v20 - 1) = *((_DWORD *)v18 - 1);
            *(_OWORD *)(v20 - 20) = v21;
            v20 -= 20;
            v18 -= 20;
          }
          while (v18 != v19);
          v18 = (char *)*a2;
        }
        v5 = v17 + 20;
        *a2 = v20;
        a2[1] = v17 + 20;
        a2[2] = &v16[20 * v15];
        if (v18)
          operator delete(v18);
        result = v22;
        v2 = v23;
      }
      else
      {
        *(_WORD *)v5 = v6;
        *((_WORD *)v5 + 1) = v7;
        *((_WORD *)v5 + 2) = v8;
        *((_WORD *)v5 + 3) = 0;
        *((_DWORD *)v5 + 2) = v9;
        *((_WORD *)v5 + 6) = v10;
        v5[14] = v11;
        v5[15] = 0;
        *((_DWORD *)v5 + 4) = v12;
        v5 += 20;
      }
      a2[1] = v5;
      v3 += 10;
    }
    while (v3 != v2);
  }
  return result;
}

@end
