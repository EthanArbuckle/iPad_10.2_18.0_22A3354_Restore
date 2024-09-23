@implementation SecCertificateHasOCSPNoCheckMarkerExtension

const __CFArray *__SecCertificateHasOCSPNoCheckMarkerExtension_block_invoke()
{
  const __CFArray *result;

  result = SecCertificateCreateOidDataFromString(0, CFSTR("1.3.6.1.5.5.7.48.1.5"));
  SecCertificateHasOCSPNoCheckMarkerExtension_sOCSPNoCheckOIDData = (uint64_t)result;
  return result;
}

@end
