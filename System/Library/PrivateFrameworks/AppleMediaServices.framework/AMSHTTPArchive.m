@implementation AMSHTTPArchive

id __57__AMSHTTPArchive_ams_generateHeadersArrayForHTTPHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("value");
  v10[0] = a2;
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ams_generateCommentsStringForMetrics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "_apsRelayAttempted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("APS-Attempted"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "_apsRelaySucceeded");

  objc_msgSend(v7, "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("APS-Succeeded"));

  +[AMSDevice localIPAddress](AMSDevice, "localIPAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v10, CFSTR("clientIPAddress"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  else
    v12 = 0;

  return v12;
}

+ (id)ams_dateFormatterForTimeZone:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (_MergedGlobals_111 != -1)
    dispatch_once(&_MergedGlobals_111, &__block_literal_global_63);
  v4 = (void *)qword_1ECEAD268;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke_2;
  v9[3] = &unk_1E25425E8;
  v10 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "objectForKey:withCreationBlock:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ams_generateResponseDictionaryForMetrics:(id)a3 responseData:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "response");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
    goto LABEL_10;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_10:
    v24 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_11;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "allHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Content-Length"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "integerValue"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_1E25AF5C0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("bodySize"), v26);

  objc_msgSend(a1, "ams_generateContentDictionaryForResponse:responseData:", v9, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("content"));

  objc_msgSend(v9, "allHeaderFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_generateHeadersArrayForHTTPHeaders:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v28[0] = CFSTR("name");
  v28[1] = CFSTR("value");
  v29[0] = CFSTR("X-Apple-Connection-Reused");
  v19 = objc_msgSend(v6, "resourceFetchType");
  v20 = CFSTR("false");
  if (v19 == 3)
    v20 = CFSTR("true");
  v29[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v21);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("headers"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E25AF5C0, CFSTR("headersSize"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", objc_msgSend(v9, "statusCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v23, CFSTR("statusText"));

  v24 = (void *)objc_msgSend(v10, "copy");
LABEL_11:

  return v24;
}

+ (id)ams_generateContentDictionaryForResponse:(id)a3 responseData:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  uint64_t v15;

  v5 = a4;
  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E08];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "expectedContentLength"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bodySize"));

    objc_msgSend(v7, "MIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ams_setNullableObject:forKey:", v10, CFSTR("mimeType"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    if (+[AMSDefaults includeFullResponseInHARLogging](AMSDefaults, "includeFullResponseInHARLogging")
      || +[AMSDefaults QAMode](AMSDefaults, "QAMode"))
    {
      v12 = -1;
    }
    else if (+[AMSDefaults logHARData](AMSDefaults, "logHARData"))
    {
      v12 = -1;
    }
    else
    {
      v12 = 40000;
    }
    if (objc_msgSend(v11, "length") && objc_msgSend(v5, "length") > v12)
    {
      v13 = (double)(unint64_t)objc_msgSend(v11, "length");
      v14 = (unint64_t)(v13 / (double)(unint64_t)objc_msgSend(v5, "length") * 40000.0);
      if (objc_msgSend(v11, "length") <= v14)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v11, "substringToIndex:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
      }

      v11 = (void *)v15;
    }
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("text"));

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

+ (id)ams_generateRequestDictionaryForMetrics:(id)a3 requestData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  BOOL v34;
  unint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bodySize"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF5C0, CFSTR("headersSize"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
  objc_msgSend(v7, "allHTTPHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_generateHeadersArrayForHTTPHeaders:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v11, CFSTR("headers"));

  objc_msgSend(v7, "HTTPMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v12, CFSTR("method"));

  objc_msgSend(v7, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v14, CFSTR("url"));

  if (+[AMSDefaults includeFullRequestInHARLogging](AMSDefaults, "includeFullRequestInHARLogging")
    || +[AMSDefaults QAMode](AMSDefaults, "QAMode"))
  {
    objc_msgSend(v6, "length");
  }
  else
  {
    v34 = +[AMSDefaults logHARData](AMSDefaults, "logHARData");
    v35 = objc_msgSend(v6, "length");
    if (!v34 && v35 >= 0x9C41)
    {

      v6 = 0;
    }
  }
  objc_msgSend(v6, "ams_decompressedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;

    v6 = v17;
  }
  objc_msgSend(v7, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsString:", CFSTR("/WebObjects/MZFinance.woa/wa/authenticate"));

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 1, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("password"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("******"), CFSTR("password"));
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v21, 100, 0, 0);
        v23 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v23;
      }
    }
LABEL_18:

    if (v6)
    {
LABEL_19:
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      v30 = (void *)v29;
      if (v29)
        v31 = (const __CFString *)v29;
      else
        v31 = &stru_1E2548760;
      v36 = CFSTR("text");
      v37 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("postData"));

    }
LABEL_23:
    v28 = (void *)objc_msgSend(v8, "copy");
    goto LABEL_24;
  }
  objc_msgSend(v7, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "isEqualToString:", CFSTR("application/x-apple-plist"));
  if (!v16 || !v24)
    goto LABEL_18;

  if (!v6)
    goto LABEL_23;
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString hasPrefix:](v25, "hasPrefix:", CFSTR("YnBsaX")))
  {

    goto LABEL_19;
  }
  if (v25)
    v26 = v25;
  else
    v26 = &stru_1E2548760;
  v38 = CFSTR("text");
  v39[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("postData"));

  v28 = (void *)objc_msgSend(v8, "copy");
LABEL_24:

  return v28;
}

+ (id)ams_generateHeadersArrayForHTTPHeaders:(id)a3
{
  return (id)objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_65_0);
}

- (AMSHTTPArchive)initWithHTTPArchiveTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *urlString;
  AMSHTTPArchive *v16;

  v4 = a3;
  objc_msgSend(v4, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSHTTPArchive _createJSONObjectForTaskMetrics:requestData:responseData:](AMSHTTPArchive, "_createJSONObjectForTaskMetrics:requestData:responseData:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transactionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  urlString = self->_urlString;
  self->_urlString = v14;

  v16 = -[AMSHTTPArchive initWithJSONObject:](self, "initWithJSONObject:", v8);
  return v16;
}

- (AMSHTTPArchive)initWithMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  void *v6;
  AMSHTTPArchive *v7;

  +[AMSHTTPArchive _createJSONObjectForTaskMetrics:requestData:responseData:](AMSHTTPArchive, "_createJSONObjectForTaskMetrics:requestData:responseData:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSHTTPArchive initWithJSONObject:](self, "initWithJSONObject:", v6);

  return v7;
}

- (AMSHTTPArchive)initWithJSONObject:(id)a3
{
  id v4;
  AMSHTTPArchive *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSHTTPArchive;
  v5 = -[AMSHTTPArchive init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "ams_compressedData");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = v7 != 0;
    if (v7)
      v10 = (void *)v7;
    else
      v10 = v6;
    objc_storeStrong((id *)&v5->_backingJSONData, v10);
    v5->_compressed = v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSHTTPArchive urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyUrlString"));

  -[AMSHTTPArchive backingJSONData](self, "backingJSONData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyBackingJSONData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSHTTPArchive isCompressed](self, "isCompressed"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCodingKeyCompressed"));

}

- (AMSHTTPArchive)initWithCoder:(id)a3
{
  id v4;
  AMSHTTPArchive *v5;
  uint64_t v6;
  NSString *urlString;
  uint64_t v8;
  NSData *backingJSONData;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSHTTPArchive;
  v5 = -[AMSHTTPArchive init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyUrlString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyBackingJSONData"));
    v8 = objc_claimAutoreleasedReturnValue();
    backingJSONData = v5->_backingJSONData;
    v5->_backingJSONData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyCompressed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_compressed = objc_msgSend(v10, "BOOLValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)directory
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  CPSharedResourcesDirectory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v8[0] = v2;
    v8[1] = CFSTR("Library");
    v8[2] = CFSTR("Logs");
    v8[3] = CFSTR("com.apple.StoreServices");
    v8[4] = CFSTR("HTTPArchives");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathWithComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)logHARData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AMSHTTPArchive backingJSONData](self, "backingJSONData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AMSHTTPArchive isCompressed](self, "isCompressed"))
  {
    objc_msgSend(v3, "ams_decompressedData");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "ams_compressWithAlgorithm:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (objc_msgSend(v6, "length"))
  {
    v8 = v6;
    if ((unint64_t)objc_msgSend(v8, "length") < 0x2711)
    {
      v6 = 0;
      v9 = v8;
    }
    else
    {
      objc_msgSend(v8, "substringToIndex:", 10000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "substringFromIndex:", 10000);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v7, "addObject:", v9);
  }
  AMSGenerateLogCorrelationKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      ++v11;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138413058;
        v17 = v10;
        v18 = 1024;
        v19 = v11;
        v20 = 1024;
        v21 = v15;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "HARData: %@ %d/%d %@", buf, 0x22u);
      }

    }
    while (objc_msgSend(v7, "count") > v11);
  }

}

+ (id)merge:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "merge:withEstimatedFileSizeLimit:", a3, 0x7FFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id obj;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 1000 * a4;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x18D78A1C4]();
        v15 = objc_msgSend(v13, "isCompressed");
        objc_msgSend(v13, "backingJSONData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {
          objc_msgSend(v16, "ams_decompressedData");
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v18;
        }
        if (v17)
        {
          v34 = v14;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("log"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("entries"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            objc_msgSend(v6, "addObjectsFromArray:", v21);
          v9 += objc_msgSend(v17, "length");
          if (v9 > v10)
          {
            +[AMSHTTPArchive _createJSONObjectForEntries:](AMSHTTPArchive, "_createJSONObjectForEntries:", v6);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v11;
            v23 = v9;
            v24 = v8;
            v25 = v10;
            v26 = v6;
            v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJSONObject:", v33);
            objc_msgSend(v31, "addObject:", v27);

            v6 = v26;
            v10 = v25;
            v8 = v24;
            v9 = v23;
            v11 = v22;
            objc_msgSend(v6, "removeAllObjects");

          }
          v14 = v34;
        }

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    +[AMSHTTPArchive _createJSONObjectForEntries:](AMSHTTPArchive, "_createJSONObjectForEntries:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJSONObject:", v28);
    objc_msgSend(v31, "addObject:", v29);

  }
  return v31;
}

+ (void)removeHTTPArchiveFilesOlderThanDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  double v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumeratorAtPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x18D78A1C4]();
        objc_msgSend(a1, "_timeIntervalFromFilename:", v16);
        if (v18 != 1.79769313e308 && v18 <= v7)
        {
          objc_msgSend(v5, "stringByAppendingPathComponent:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeItemAtPath:error:", v20, 0);

        }
        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

}

- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4
{
  return -[AMSHTTPArchive writeToDiskWithError:compressed:appendCombined:](self, "writeToDiskWithError:compressed:appendCombined:", a3, a4, 0);
}

- (BOOL)writeToDiskWithError:(id *)a3 compressed:(BOOL)a4 appendCombined:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  BOOL v49;
  id v50;
  __CFString *v51;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v5 = a5;
  v6 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "directory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
LABEL_5:
    v15 = -[AMSHTTPArchive isCompressed](self, "isCompressed");
    v16 = &stru_1E2548760;
    if (v5)
      v16 = CFSTR("_combined_ams");
    v17 = v16;
    v18 = CFSTR(".har");
    v49 = v15 && v6;
    if (v15 && v6)
      v18 = CFSTR(".har.compressed");
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = v18;
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v51 = v17;
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%f%@%@"), v22, v24, v17, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_opt_class();
      AMSLogKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v27);
      v32 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v30;
      v57 = 2114;
      v58 = v31;
      v59 = 2114;
      v60 = v33;
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing HAR to fileURL: %{public}@", buf, 0x20u);

      v8 = v32;
    }

    -[AMSHTTPArchive backingJSONData](self, "backingJSONData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (!v49)
    {
      objc_msgSend(v34, "ams_decompressedData");
      v36 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v36;
    }
    v53 = v11;
    v37 = objc_msgSend(v35, "writeToURL:options:error:", v27, 1, &v53);
    v14 = v53;

    if ((v37 & 1) == 0)
    {
      v38 = v8;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v39, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (void *)objc_opt_class();
        v50 = v41;
        AMSLogKey();
        v42 = v25;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = (uint64_t)v41;
        v57 = 2114;
        v58 = v43;
        v59 = 2114;
        v60 = v14;
        _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to write a HAR object to disk. error = %{public}@", buf, 0x20u);

        v25 = v42;
      }

      v8 = v38;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v14);

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v54);
  v14 = v54;

  if ((v13 & 1) != 0)
  {
    v11 = v14;
    goto LABEL_5;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v45, "OSLogObject");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v47 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v56 = (uint64_t)v47;
    v57 = 2114;
    v58 = v14;
    v48 = v47;
    _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create the directory to write HAR files into. error = %{public}@", buf, 0x16u);

  }
  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    v37 = 0;
    *a3 = v14;
  }
  else
  {
    v37 = 0;
  }
LABEL_24:

  return v37;
}

void __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke()
{
  AMSLRUCache *v0;
  void *v1;

  v0 = -[AMSLRUCache initWithMaxSize:]([AMSLRUCache alloc], "initWithMaxSize:", 2);
  v1 = (void *)qword_1ECEAD268;
  qword_1ECEAD268 = (uint64_t)v0;

}

id __47__AMSHTTPArchive_ams_dateFormatterForTimeZone___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("uuuu-MM-dd'T'HH:mm:ss.sXXX"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setTimeZone:", *(_QWORD *)(a1 + 32));
  return v2;
}

+ (id)_createJSONObjectForEntries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AMSMappedBundleInfo currentBundleInfo](AMSMappedBundleInfo, "currentBundleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("name");
  objc_msgSend(v4, "clientName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("AppleMediaServices");
  if (v5)
    v7 = (const __CFString *)v5;
  v20[1] = CFSTR("version");
  v21[0] = v7;
  objc_msgSend(v4, "clientVersion");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("1.0");
  if (v8)
    v10 = (const __CFString *)v8;
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("log");
  v16[0] = CFSTR("creator");
  v16[1] = CFSTR("entries");
  v12 = (id)MEMORY[0x1E0C9AA60];
  if (v3)
    v12 = v3;
  v17[0] = v11;
  v17[1] = v12;
  v16[2] = CFSTR("version");
  v17[2] = CFSTR("1.2");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_createJSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "transactionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__AMSHTTPArchive__createJSONObjectForTaskMetrics_requestData_responseData___block_invoke;
  v16[3] = &unk_1E2542630;
  v18 = v9;
  v19 = a1;
  v17 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "ams_mapWithTransform:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_createJSONObjectForEntries:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __75__AMSHTTPArchive__createJSONObjectForTaskMetrics_requestData_responseData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 48), "ams_generateCommentsStringForMetrics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("comment"));

  objc_msgSend(*(id *)(a1 + 48), "ams_generateRequestDictionaryForMetrics:requestData:", v4, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("request"));

  objc_msgSend(*(id *)(a1 + 48), "ams_generateResponseDictionaryForMetrics:responseData:", v4, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("response"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "responseEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  objc_msgSend(v9, "numberWithDouble:", v12 * 1000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("time"));

  v14 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_dateFormatterForTimeZone:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v18, CFSTR("startedDateTime"));

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

+ (double)_timeIntervalFromFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v11;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR(".har")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_streamwrite.har"), &stru_1E2548760);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".har.compressed"), &stru_1E2548760);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".har"), &stru_1E2548760);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (objc_msgSend(v8, "scanDouble:", &v11))
        v9 = v11;
      else
        v9 = 1.79769313e308;

    }
    else
    {
      v9 = 1.79769313e308;
    }

  }
  else
  {
    v9 = 1.79769313e308;
  }

  return v9;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (NSData)backingJSONData
{
  return self->_backingJSONData;
}

- (void)setBackingJSONData:(id)a3
{
  objc_storeStrong((id *)&self->_backingJSONData, a3);
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (NSData)JSONData
{
  return self->_JSONData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONData, 0);
  objc_storeStrong((id *)&self->_backingJSONData, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
