@implementation NSData(FPFSHelpers)

- (uint64_t)getFileIDFromXattr:()FPFSHelpers docID:genCount:
{
  size_t v9;
  char *v10;
  const char *v11;
  BOOL v12;
  uint64_t result;
  const char *v14;
  uint64_t v15;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v9 = objc_msgSend(a1, "length");
  v10 = (char *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v11 = (const char *)memchr(v10, 58, v9);
  if (v10[v9 - 1])
    v12 = 1;
  else
    v12 = v11 == 0;
  if (v12)
    return 0;
  v14 = v11;
  if (a3)
    *a3 = atoll(v10);
  result = (uint64_t)memchr((void *)(v14 + 1), 58, (size_t)&v10[v9 + ~(unint64_t)v14]);
  if (result)
  {
    v15 = result;
    if (a4)
      *a4 = atol(v14 + 1);
    if (a5)
      *a5 = atoll((const char *)(v15 + 1));
    return 1;
  }
  return result;
}

@end
