@implementation _LSAppLinkPlugIn

+ (id)plugInClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)canHandleURLComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  if (v4 && (id)objc_opt_class() != a1)
  {
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = 0;
      if (!objc_msgSend(v5, "length") || !v6)
        goto LABEL_17;
      if (objc_msgSend(v6, "length"))
      {
        v8 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("http"));
        v9 = v8 == 0;
        if (v8)
        {
          v10 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("https"));
          v11 = v10 == 0;
          v7 = v10 == 0;
        }
        else
        {
          v7 = 0;
          v11 = 1;
        }
        if ((objc_msgSend(v6, "containsString:", CFSTR(".")) & v11) == 1)
        {
          objc_msgSend(v4, "port");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = objc_msgSend(v12, "unsignedIntegerValue");
            if (v14 == 80)
            {
              v7 = v9;
            }
            else if (v14 != 443)
            {
              v7 = 0;
            }
          }
          else
          {
            v7 = 1;
          }

          goto LABEL_17;
        }
      }
    }
    v7 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSAppLinkPlugIn appLinksWithContext:error:]", 134, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSURLComponents)URLComponents
{
  return (NSURLComponents *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURLComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (_LSAppLinkOpenState)state
{
  return (_LSAppLinkOpenState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
}

@end
