@implementation NSMutableData(NSDataUtils)

- (uint64_t)mf_appendCString:()NSDataUtils
{
  return objc_msgSend(a1, "appendBytes:length:", __s, strlen(__s));
}

- (char)mf_convertNetworkLineEndingsToUnixInRange:()NSDataUtils
{
  char *result;
  char *v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  _BOOL4 v17;
  BOOL v18;
  char *v19;
  char *v20;
  char *v21;
  void *v22;

  result = (char *)objc_msgSend(a1, "length");
  if ((unint64_t)a4 < 2)
    return result;
  v8 = result;
  v9 = objc_retainAutorelease(a1);
  v10 = objc_msgSend(v9, "mutableBytes");
  v11 = (char *)(v10 + a3);
  v12 = (char *)(v10 + a3 + a4);
  v22 = v9;
  if (a4 < 1)
  {
    result = (char *)(v10 + a3);
    goto LABEL_22;
  }
  v13 = (char *)(v10 + a3);
  v14 = (char *)(v10 + a3);
  while (1)
  {
    v15 = (char *)memchr(v13, 13, v12 - v13 - 1);
    v16 = v15;
    v17 = v15 != 0;
    if (v15)
      v18 = v15 >= v12;
    else
      v18 = 1;
    if (!v18)
    {
      while (v16[1] != 10)
      {
        v20 = (char *)memchr(v16 + 1, 13, v12 - 2 - v16);
        v16 = v20;
        v17 = v20 != 0;
        if (!v20 || v20 >= v12)
          goto LABEL_9;
      }
      goto LABEL_10;
    }
LABEL_9:
    if (!v17)
      break;
LABEL_10:
    v19 = v16;
    if (v13 != v14)
    {
      memmove(v14, v13, v16 - v13);
      v19 = &v14[v16 - v13];
    }
    *v19 = 10;
    result = v19 + 1;
    v13 = v16 + 2;
    v14 = result;
    if (v16 + 2 >= v12)
      goto LABEL_22;
  }
  if (v14 != v11)
    memmove(v14, v13, v12 - v13);
  result = &v14[v12 - v13];
LABEL_22:
  v21 = (char *)(result - v11);
  if (result - v11 != a4 && v8 != (char *)a4)
    result = (char *)memmove(result, v12, (size_t)&v8[-a3 - a4]);
  if (v21 != (char *)a4)
    return (char *)objc_msgSend(v22, "setLength:", &v8[(_QWORD)v21 - a4]);
  return result;
}

- (uint64_t)mf_convertNetworkLineEndingsToUnix
{
  return objc_msgSend(a1, "mf_convertNetworkLineEndingsToUnixInRange:", 0, objc_msgSend(a1, "length"));
}

@end
