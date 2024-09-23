@implementation BCSHashService

+ (int64_t)SHA256TruncatedHashForInputString:(id)a3 includedBytes:(unint64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    +[BCSHashService _SHA256DataForInputString:]((uint64_t)a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[BCSHashService _truncatedHashForFullHashData:includedBytes:]((uint64_t)BCSHashService, v7, a4);

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (id)_SHA256DataForInputString:(uint64_t)a1
{
  id v2;
  const char *v3;
  void *v4;
  void *v5;
  id v6;
  const void *v7;
  CC_LONG v8;
  id v9;
  void *v10;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "cStringUsingEncoding:", 4);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v3, strlen(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    v9 = objc_retainAutorelease(v5);
    CC_SHA256(v7, v8, (unsigned __int8 *)objc_msgSend(v9, "mutableBytes"));
    v10 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)_truncatedHashForFullHashData:(unint64_t)a3 includedBytes:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = a2;
  objc_opt_self();
  if (objc_msgSend(v4, "length"))
  {
    v8 = 0;
    if (a3 >= 8)
      v5 = 8;
    else
      v5 = a3;
    objc_msgSend(v4, "getBytes:length:", &v8, v5);
    if (v8 >= 0)
      v6 = v8;
    else
      v6 = -v8;
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

+ (int64_t)truncatedHashForFullHash:(id)a3 includedBytes:(unint64_t)a4
{
  void *v5;
  int64_t v6;

  +[NSData bcs_dataWithHexString:](MEMORY[0x24BDBCE50], a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = +[BCSHashService _truncatedHashForFullHashData:includedBytes:]((uint64_t)BCSHashService, v5, a4);
  else
    v6 = -1;

  return v6;
}

+ (id)SHA256HashForInputString:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  void *i;
  unsigned int v7;
  void *v8;

  +[BCSHashService _SHA256DataForInputString:]((uint64_t)a1, a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v5);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v5; --v5)
  {
    v7 = *v4++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02x"), v7);
  }
  v8 = (void *)objc_msgSend(i, "copy");

  return v8;
}

+ (BOOL)isValidFullHash:(id)a3
{
  void *v3;
  BOOL v4;

  +[NSData bcs_dataWithHexString:](MEMORY[0x24BDBCE50], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
