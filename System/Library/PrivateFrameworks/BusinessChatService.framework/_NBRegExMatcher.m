@implementation _NBRegExMatcher

- (BOOL)matchNationalNumber:(id)a3 phoneNumberDesc:(id)a4 allowsPrefixMatch:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v7 = a3;
  objc_msgSend(a4, "nationalNumberPattern");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    +[_NBPhoneNumberUtil sharedInstance](_NBPhoneNumberUtil, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entireRegularExpressionWithPattern:options:error:", v8, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v7, "length");
      +[_NBRegularExpressionCache sharedInstance](_NBRegularExpressionCache, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "regularExpressionForPattern:error:", v8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "firstMatchInString:options:range:", v7, 4, 0, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "numberOfRanges"))
        {
          objc_msgSend(v10, "firstMatchInString:options:range:", v7, 4, 0, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = a5 || objc_msgSend(v15, "numberOfRanges") != 0;

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
