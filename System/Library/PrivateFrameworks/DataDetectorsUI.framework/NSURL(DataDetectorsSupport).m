@implementation NSURL(DataDetectorsSupport)

+ (id)dd_URLWithPotentiallyInvalidURLString:()DataDetectorsSupport
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v4 = a3;
  objc_msgSend(a1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    goto LABEL_15;
  }
  v8 = objc_msgSend(v4, "rangeOfString:", CFSTR("://"));
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v10;
      objc_msgSend(v4, "substringToIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ++v21;
      v22 = objc_msgSend(v4, "length");
      objc_msgSend(v4, "substringFromIndex:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 < v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v11, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "URLWithString:", v25);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v24;
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_msgSend(a1, "URLWithString:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v13 = v8 + v9;
  if (v8 + v9 >= (unint64_t)objc_msgSend(v4, "length"))
  {
    v7 = 0;
    goto LABEL_15;
  }
  v14 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("/"), 0, v13, objc_msgSend(v4, "length") - v13);
  v16 = v14 + v15;
  v7 = 0;
  if (v14 + v15 < (unint64_t)objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "substringToIndex:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v11, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "URLWithString:", v20);
    v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  }
LABEL_15:

  return v7;
}

@end
