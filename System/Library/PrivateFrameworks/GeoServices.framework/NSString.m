@implementation NSString

- (id)_geo_stringByAppendingOptionalPathComponent:(void *)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(a1, "stringByAppendingPathComponent:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = a1;
    }
    a1 = v5;
  }

  return a1;
}

- (_QWORD)stdString
{
  _QWORD *v2;
  id v3;

  v2 = result;
  if (a2)
  {
    v3 = objc_retainAutorelease(a2);
    return std::string::basic_string[abi:ne180100](v2, (void *)objc_msgSend(v3, "UTF8String"), objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4));
  }
  else
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  return result;
}

+ (id)stringWithStdString:(uint64_t)a1 copy:(uint64_t *)a2
{
  id v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;

  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v3)
  {
    v4 = *((char *)a2 + 23);
    if (v4 >= 0)
      v5 = a2;
    else
      v5 = (uint64_t *)*a2;
    if (v4 >= 0)
      v6 = *((unsigned __int8 *)a2 + 23);
    else
      v6 = a2[1];
    v3 = (id)objc_msgSend(v3, "initWithBytes:length:encoding:", v5, v6, 4);
  }
  return v3;
}

@end
