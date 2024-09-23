@implementation NSURLSessionTaskTransactionMetrics(TLSVersionString)

- (id)c2_NegotiatedTLSProtocolVersionString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "negotiatedTLSProtocolVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_c2_stringForTLSProtocolVersion:", (unsigned __int16)objc_msgSend(v3, "unsignedLongLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (const)_c2_stringForTLSProtocolVersion:()TLSVersionString
{
  const __CFString *result;
  const __CFString *v4;

  result = CFSTR("TLSv10");
  switch(a3)
  {
    case 769:
      return result;
    case 770:
      result = CFSTR("TLSv11");
      break;
    case 771:
      result = CFSTR("TLSv12");
      break;
    case 772:
      result = CFSTR("TLSv13");
      break;
    default:
      v4 = CFSTR("Unknown");
      if (a3 == 65279)
        v4 = CFSTR("DTLSv10");
      if (a3 == 65277)
        result = CFSTR("DTLSv12");
      else
        result = v4;
      break;
  }
  return result;
}

@end
