@implementation NSString(NFAdditions)

- (id)nf_sha1
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)nf_stringByReversingString
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;

  v2 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2 - 1;
    do
    {
      v5 = objc_msgSend(a1, "characterAtIndex:", v4);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v6);

      --v4;
    }
    while (v4 != -1);
  }
  return v3;
}

@end
