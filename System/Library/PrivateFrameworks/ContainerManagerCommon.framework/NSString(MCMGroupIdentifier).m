@implementation NSString(MCMGroupIdentifier)

- (id)stringByExtractingTeamIDPrefix
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  void *v8;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "cStringUsingEncoding:", 4);
  if ((unint64_t)objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 4) >= 0xC && *(_BYTE *)(v2 + 10) == 46)
  {
    v3 = 0;
    while (1)
    {
      v4 = *(unsigned __int8 *)(v2 + v3);
      v5 = v4 - 65;
      v6 = v4 - 48;
      if (v5 >= 0x1A && v6 >= 0xA)
        break;
      if (++v3 == 10)
      {
        objc_msgSend(v1, "substringToIndex:", 10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
    }
  }
  v8 = 0;
  return v8;
}

@end
