@implementation NSDictionary(NSKeyValueCoding)

- (id)valueForKeyPath:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  void *v23;
  uint64_t v24;
  objc_super v25;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(a3, "characterAtIndex:", 0) == 64)
    {
      v7 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("."), 2, 0, v6);
      if (v8)
      {
        v9 = v7 + 1;
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
        v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4);
          *(_QWORD *)&v14 = MEMORY[0x1E0C80A78](v13).n128_u64[0];
          v16 = (char *)&v24 - v15;
          objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v24 - v15, v14);
          v17 = (void *)objc_opt_class();
          if (!NSKeyValueMethodForPattern(v17, "%sForKeyPath:", v16))
          {
            v18 = (void *)objc_opt_class();
            if (!NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v16))
            {

              v22 = v10;
              v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation."), objc_opt_class(), a1, v10), 0);
              objc_exception_throw(v23);
            }
          }
          method_invoke();
          v20 = v19;

          goto LABEL_12;
        }
      }
      else
      {
        v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
      }
      v26.receiver = a1;
      v26.super_class = (Class)NSDictionary_0;
      v20 = objc_msgSendSuper2(&v26, sel_valueForKey_, v10);
LABEL_12:

      return v20;
    }
  }
  v20 = (id)objc_msgSend(a1, "objectForKey:", a3);
  if (!v20)
  {
    v25.receiver = a1;
    v25.super_class = (Class)NSDictionary_0;
    return objc_msgSendSuper2(&v25, sel_valueForKeyPath_, a3);
  }
  return v20;
}

- (uint64_t)valueForKey:()NSKeyValueCoding
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (!v5)
    return objc_msgSend(a1, "objectForKey:", a3);
  v6 = v5;
  if (objc_msgSend(a3, "characterAtIndex:", 0) != 64)
    return objc_msgSend(a1, "objectForKey:", a3);
  v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
  if (!v7)
    return objc_msgSend(a1, "objectForKey:", a3);
  v8 = (void *)v7;
  v11.receiver = a1;
  v11.super_class = (Class)NSDictionary_0;
  v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

  return (uint64_t)v9;
}

@end
