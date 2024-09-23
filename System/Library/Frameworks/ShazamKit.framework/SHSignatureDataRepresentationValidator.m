@implementation SHSignatureDataRepresentationValidator

+ (BOOL)signatureDataIsValid:(id)a3 error:(id *)a4
{
  BOOL result;
  uint64_t v6;

  if (!a3
    || (v6 = 0,
        +[SigCrop getSampleLength:error:](SigCrop, "getSampleLength:error:", a3, &v6),
        result = v6 == 0,
        v6))
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 200, 0);
    return 0;
  }
  return result;
}

@end
