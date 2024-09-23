@implementation NSData

- (_QWORD)cppData
{
  _QWORD *v2;
  id v3;

  v2 = result;
  if (a2)
  {
    v3 = objc_retainAutorelease(a2);
    return std::string::basic_string[abi:ne180100](v2, (void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"));
  }
  else
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  return result;
}

- (id)initWithCPPData:(void *)a1 copy:(const void *)a2
{
  id v2;
  size_t v4;
  int v5;
  size_t v6;
  const void *v7;
  const void *v8;
  void *__dst;
  _BYTE *v11;

  v2 = a1;
  if (a1)
  {
    if (*((char *)a2 + 23) >= 0)
      v4 = *((unsigned __int8 *)a2 + 23);
    else
      v4 = (size_t)a2[1];
    std::vector<unsigned char>::vector(&__dst, v4);
    v5 = *((char *)a2 + 23);
    if (v5 >= 0)
      v6 = *((unsigned __int8 *)a2 + 23);
    else
      v6 = (size_t)a2[1];
    if (v6)
    {
      if (v5 >= 0)
        v7 = a2;
      else
        v7 = *a2;
      memmove(__dst, v7, v6);
      LOBYTE(v5) = *((_BYTE *)a2 + 23);
    }
    if ((v5 & 0x80u) == 0)
      v8 = a2;
    else
      v8 = *a2;
    v2 = (id)objc_msgSend(v2, "initWithBytes:length:", v8, v11 - (_BYTE *)__dst);
    if (__dst)
    {
      v11 = __dst;
      operator delete(__dst);
    }

  }
  return v2;
}

@end
