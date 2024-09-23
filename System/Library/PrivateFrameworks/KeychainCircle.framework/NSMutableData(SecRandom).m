@implementation NSMutableData(SecRandom)

+ (id)dataWithRandomBytes:()SecRandom
{
  void *v3;
  const __SecRandom *v4;
  size_t v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  if (SecRandomCopyBytes(v4, v5, (void *)objc_msgSend(v6, "mutableBytes")))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

@end
