@implementation EnsureOTRAlgIDInited

double __EnsureOTRAlgIDInited_block_invoke()
{
  double result;

  result = *(double *)&CSSMOID_ECDSA_WithSHA1.Length;
  EnsureOTRAlgIDInited_kOTRECSignatureAlgID = (__int128)CSSMOID_ECDSA_WithSHA1;
  kOTRSignatureAlgIDPtr = (uint64_t)&EnsureOTRAlgIDInited_kOTRECSignatureAlgID;
  return result;
}

@end
