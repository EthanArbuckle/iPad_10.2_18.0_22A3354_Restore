@implementation APWebViewResourceLoadCAReporter

+ (BOOL)_isHTTPOrHTTPSURL:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("http")))
      v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https")) == 0;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)_parseResourceLoadResultForError:(id)a3 response:(id)a4 result:(int64_t *)a5 errorDomain:(id *)a6 errorCode:(int64_t *)a7
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  __CFString *v17;
  int64_t v18;
  id v19;

  v19 = a3;
  v11 = a4;
  *a5 = 0;
  *a6 = 0;
  *a7 = -1;
  if (v19)
  {
    objc_msgSend(v19, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v19, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        objc_msgSend(v19, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *a6 = (id)objc_msgSend(v15, "copy");

LABEL_12:
        *a7 = objc_msgSend(v19, "code");
LABEL_13:
        v18 = 2;
        goto LABEL_14;
      }
      v17 = CFSTR("AdEmptyDomainErrors");
    }
    else
    {
      v17 = CFSTR("AdNilDomainErrors");
    }
    *a6 = v17;
    goto LABEL_12;
  }
  if (!v11)
  {
    *a6 = CFSTR("AdWebViewErrors");
    *a7 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a6 = CFSTR("AdWebViewErrors");
    *a7 = 0;
    goto LABEL_18;
  }
  v16 = objc_msgSend(v11, "statusCode");
  if ((unint64_t)(v16 - 600) <= 0xFFFFFFFFFFFFFE0BLL)
  {
    *a6 = CFSTR("AdWebViewErrors");
    *a7 = 2;
LABEL_18:
    v18 = 3;
    goto LABEL_14;
  }
  if ((unint64_t)(v16 - 200) > 0x63)
  {
    *a5 = 3;
    *a7 = v16;
    *a6 = CFSTR("AdHTTPErrors");
    goto LABEL_15;
  }
  v18 = 1;
LABEL_14:
  *a5 = v18;
LABEL_15:

}

@end
