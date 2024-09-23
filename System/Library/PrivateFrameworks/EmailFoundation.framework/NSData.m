@implementation NSData

uint64_t __48__NSData_EmailFoundationAdditions__ef_md5Digest__block_invoke(uint64_t result, char *data, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v4 = a4;
    v6 = result;
    do
    {
      if (v4 >= 0xFFFFFFFF)
        v7 = 0xFFFFFFFFLL;
      else
        v7 = v4;
      result = CC_MD5_Update(*(CC_MD5_CTX **)(v6 + 32), data, v7);
      data += v7;
      v4 -= v7;
    }
    while (v4);
  }
  return result;
}

void __47__NSData_EmailFoundationAdditions__ef_crlfData__block_invoke()
{
  uint64_t v0;
  void *v1;
  __int16 v2;

  v2 = 2573;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ef_crlfData_crlfData;
  ef_crlfData_crlfData = v0;

}

@end
