@implementation NSString(SHA1Base62)

- (id)mt_SHA1Base62String
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", md);
  objc_msgSend(v2, "mt_base62String");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
