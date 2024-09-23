@implementation NSData(CCDatabaseValue)

- (id)databaseValue_toString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
}

- (id)databaseValue_toNumber
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "databaseValue_toString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "databaseValue_toNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)databaseValue_type
{
  return 1;
}

- (uint64_t)databaseValue_blobRepresentationWithLength:()CCDatabaseValue
{
  if (a3)
    *a3 = objc_msgSend(a1, "length");
  return objc_msgSend(objc_retainAutorelease(a1), "bytes");
}

@end
