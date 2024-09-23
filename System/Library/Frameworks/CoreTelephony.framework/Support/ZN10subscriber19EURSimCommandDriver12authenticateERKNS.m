@implementation ZN10subscriber19EURSimCommandDriver12authenticateERKNS

_QWORD *___ZN10subscriber19EURSimCommandDriver12authenticateERKNS_11SimCardInfoENS_8AuthTypeENSt3__13mapINS_8AuthInfoENS5_6vectorIhNS5_9allocatorIhEEEENS5_4lessIS7_EENS9_INS5_4pairIKS7_SB_EEEEEENS5_8functionIFvSI_EEE_block_invoke(_QWORD *result, _DWORD *a2)
{
  _QWORD *v2;

  *a2 = *((_DWORD *)result + 14);
  v2 = a2 + 2;
  if (v2 != result + 4)
    return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v2, (char *)result[4], (char *)result[5], result[5] - result[4]);
  return result;
}

@end
