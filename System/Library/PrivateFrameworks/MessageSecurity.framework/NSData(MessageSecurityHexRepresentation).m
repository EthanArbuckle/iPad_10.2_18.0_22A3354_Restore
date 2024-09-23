@implementation NSData(MessageSecurityHexRepresentation)

- (__CFString)asMessageSecurityHexString
{
  unint64_t v2;
  __CFString *v3;
  id v4;
  __CFString *v5;

  if (objc_msgSend(a1, "length"))
  {
    v2 = 0;
    v3 = &stru_1EA967BF8;
    do
    {
      v4 = objc_retainAutorelease(a1);
      -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("%02X"), *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v2));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }
    while (v2 < objc_msgSend(v4, "length"));
  }
  else
  {
    v5 = &stru_1EA967BF8;
  }
  return v5;
}

@end
