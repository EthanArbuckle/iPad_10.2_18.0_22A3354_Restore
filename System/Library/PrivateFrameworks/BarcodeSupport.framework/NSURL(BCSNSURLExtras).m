@implementation NSURL(BCSNSURLExtras)

- (uint64_t)_bcs_isHTTPFamilyURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("https"));

  return v3;
}

- (uint64_t)_bcs_isWalletRemoteRequestURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("https://wallet.apple.com/remoteRequest/?t="));

  return v2;
}

- (uint64_t)_bcs_isMapsURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("maps")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("https")))
  {
    objc_msgSend(a1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("maps.apple.com"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_bcs_isSHCURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  validHealthURLPrefixForScheme(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "safari_hasCaseInsensitivePrefix:", v4)
      && (v6 = objc_msgSend(v4, "length"), objc_msgSend(v5, "length") >= v6))
    {
      objc_msgSend(v5, "substringFromIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "hasPrefix:", CFSTR("/")) ^ 1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_bcs_isRedirectedSHCURL
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "safari_hasCaseInsensitivePrefix:", CFSTR("https://redirect.health.apple.com/SMARTHealthCard/")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", CFSTR("https://redirect.health.apple.com/EU-DCC/#"));

  }
  return v3;
}

- (uint64_t)_bcs_isUPIURL
{
  return objc_msgSend(a1, "_bcs_hasScheme:", CFSTR("upi"));
}

- (uint64_t)_bcs_isOtpauthURL
{
  if ((objc_msgSend(a1, "_bcs_hasScheme:", CFSTR("otpauth")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_bcs_hasScheme:", CFSTR("apple-otpauth"));
}

- (uint64_t)_bcs_isOtpauthMigrationURL
{
  if ((objc_msgSend(a1, "_bcs_hasScheme:", CFSTR("otpauth-migration")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_bcs_hasScheme:", CFSTR("apple-otpauth-migration"));
}

- (id)_bcs_displayString
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if ((objc_msgSend(a1, "_bcs_isHTTPFamilyURL") & 1) != 0)
  {
    objc_msgSend(a1, "_lp_simplifiedDisplayString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "length") > 0x14)
    {
      objc_msgSend(a1, "_lp_highLevelDomain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        objc_msgSend(v4, "_bcs_stringForcingLeftToRightDirection");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = v2;
      }
      v3 = v5;

    }
    else
    {
      v3 = v2;
    }

  }
  else
  {
    objc_msgSend(a1, "scheme");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)_bcs_isDataDetectorURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x-barcode-datadetectors-action"));
  return v3;
}

- (id)_bcs_hostWithoutWwwDot
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "rangeOfString:options:", CFSTR("www."), 9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringFromIndex:", 4);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v4;
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v6, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_bcs_redirectedHealthURLWithOriginalString:()BCSNSURLExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  validHealthURLPrefixForScheme(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v6, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("shc"));

    if (v10)
    {
      objc_msgSend(a1, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("hc1"));

      if (v12)
      {
        v13 = 0;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(CFSTR("https://redirect.health.apple.com/EU-DCC/#"), "stringByAppendingString:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLWithString:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(CFSTR("https://redirect.health.apple.com/SMARTHealthCard/#"), "stringByAppendingString:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_9;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (id)_bcs_localizedDisplayNameForRedirectedSHCURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  Class (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v2 = (void *)getHKSignedClinicalDataSourceClass_softClass;
  v36 = getHKSignedClinicalDataSourceClass_softClass;
  if (!getHKSignedClinicalDataSourceClass_softClass)
  {
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __getHKSignedClinicalDataSourceClass_block_invoke;
    v31 = &unk_24D787158;
    v32 = &v33;
    __getHKSignedClinicalDataSourceClass_block_invoke((uint64_t)&v28);
    v2 = (void *)v34[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v33, 8);
  objc_msgSend(a1, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "sourceWithQRCodeValue:error:", v4, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;

  if (v5)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v7 = (void *)getHKVerifiableHealthRecordsParserClass_softClass;
    v36 = getHKVerifiableHealthRecordsParserClass_softClass;
    if (!getHKVerifiableHealthRecordsParserClass_softClass)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getHKVerifiableHealthRecordsParserClass_block_invoke;
      v31 = &unk_24D787158;
      v32 = &v33;
      __getHKVerifiableHealthRecordsParserClass_block_invoke((uint64_t)&v28);
      v7 = (void *)v34[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v33, 8);
    v9 = objc_alloc_init(v8);
    v26 = v6;
    objc_msgSend(v9, "parseDataSource:options:error:", v5, 0, &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;

    if (v11
      || (objc_msgSend(v10, "localizedTypeDisplayNames"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "count"),
          v21,
          !v22))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[NSURL(BCSNSURLExtras) _bcs_localizedDisplayNameForRedirectedSHCURL].cold.2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      objc_msgSend(v10, "localizedTypeDisplayNames");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24 == 1)
      {
        objc_msgSend(v10, "localizedTypeDisplayNames");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[NSURL(BCSNSURLExtras) _bcs_localizedDisplayNameForRedirectedSHCURL].cold.3(v10);
    }
    v19 = 0;
LABEL_10:

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NSURL(BCSNSURLExtras) _bcs_localizedDisplayNameForRedirectedSHCURL].cold.1(a1, (uint64_t)v6);
  v19 = 0;
  v11 = v6;
LABEL_14:

  return v19;
}

+ (id)_bcs_searchURLWithQuery:()BCSNSURLExtras
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x-web-search://?%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)_bcs_URLWithUserTypedString:()BCSNSURLExtras
{
  return objc_msgSend(a1, "_lp_URLWithUserTypedString:relativeToURL:", a3, 0);
}

- (uint64_t)_bcs_hasScheme:()BCSNSURLExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v4);

  return v6;
}

- (void)_bcs_localizedDisplayNameForRedirectedSHCURL
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedTypeDisplayNames");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: obtained multiple HKVerifiableHealthRecordsParsingResult entries: %{private}@", v3, v4, v5, v6, 3u);

  OUTLINED_FUNCTION_2();
}

@end
