@implementation NSValue(AEAdditions)

- (id)ae_dataRepresentation
{
  id v1;
  NSUInteger v2;
  void *v3;
  NSUInteger sizep;

  v1 = objc_retainAutorelease(a1);
  sizep = 0;
  NSGetSizeAndAlignment((const char *)objc_msgSend(v1, "objCType"), &sizep, 0);
  v2 = sizep;
  v3 = malloc_type_malloc(sizep, 0x74EDC0ABuLL);
  objc_msgSend(v1, "getValue:", v3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ae_valueFromData:()AEAdditions ofObjCType:
{
  id v5;
  uint64_t v6;
  void *v7;
  NSUInteger sizep;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  sizep = 0;
  NSGetSizeAndAlignment(a4, &sizep, 0);
  v7 = 0;
  if (v6 == sizep)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v5), "bytes"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
