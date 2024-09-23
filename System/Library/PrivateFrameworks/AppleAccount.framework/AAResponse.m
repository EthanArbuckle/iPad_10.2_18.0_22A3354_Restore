@implementation AAResponse

- (void)_parseResponse:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSDictionary *v13;
  id v14;
  NSDictionary *responseDictionary;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = objc_retainAutorelease(v6);
    v10 = (void *)objc_msgSend(v8, "initWithBytes:length:encoding:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4);
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Response Body: %@", buf, 0xCu);
    }

  }
  objc_storeStrong((id *)&self->_mediaType, a4);
  objc_msgSend(MEMORY[0x1E0CF0EB8], "ofType:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v12, "dictionaryFromObject:error:", v6, &v22);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v13;

  if (v14)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Unable to parse response of type: '%@', error: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("COMMUNICATIONS_ERROR"), &stru_1E41752F8, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v20, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), objc_msgSend(v14, "code"), v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAResponse setError:](self, "setError:", v21);

  }
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  return -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](self, "initWithHTTPResponse:data:bodyIsPlist:", a3, a4, 1);
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  AAResponse *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "MIMEType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF0EB8], "ofType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = CFSTR("application/json");
    if (v5)
      v12 = CFSTR("application/x-plist");
    v13 = v12;

    v10 = v13;
  }
  v14 = -[AAResponse initWithHTTPResponse:data:mediaType:](self, "initWithHTTPResponse:data:mediaType:", v8, v9, v10);

  return v14;
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAResponse *v12;
  AAResponse *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *maxAge;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  objc_super v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v59.receiver = self;
  v59.super_class = (Class)AAResponse;
  v12 = -[AAResponse init](&v59, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v12->_httpResponse, a3);
      v13->_statusCode = objc_msgSend(v9, "statusCode");
      objc_storeStrong((id *)&v13->_data, a4);
    }
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[NSHTTPURLResponse statusCode](v13->_httpResponse, "statusCode");
      *(_DWORD *)buf = 134217984;
      v61 = v15;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Response code: %ld", buf, 0xCu);
    }

    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NSHTTPURLResponse allHeaderFields](v13->_httpResponse, "allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = (uint64_t)v17;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Response headers: %@", buf, 0xCu);

    }
    -[AAResponse _parseResponse:ofType:](v13, "_parseResponse:ofType:", v10, v11);
    if (-[NSHTTPURLResponse statusCode](v13->_httpResponse, "statusCode") == 200)
    {
      -[NSHTTPURLResponse allHeaderFields](v13->_httpResponse, "allHeaderFields");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Cache-control"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_61;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_61;
      objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("="));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count") != 2)
        goto LABEL_60;
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", CFSTR("max-age"));

      if (!v22
        || (objc_msgSend(v20, "objectAtIndexedSubscript:", 1),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "integerValue"),
            v23,
            v24 < 1))
      {
LABEL_60:

LABEL_61:
        goto LABEL_62;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      maxAge = v13->_maxAge;
      v13->_maxAge = (NSNumber *)v25;
LABEL_59:

      goto LABEL_60;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[NSHTTPURLResponse statusCode](v13->_httpResponse, "statusCode");
    switch(v27)
    {
      case 401:
        _AALogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "Password is bad.", buf, 2u);
        }

        -[AAResponse responseDictionary](v13, "responseDictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", CFSTR("message"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        v33 = CFSTR("INVALID_PASSWORD");
        goto LABEL_41;
      case 402:
      case 406:
      case 407:
      case 408:
        goto LABEL_25;
      case 403:
        _AALogSystem();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v39, OS_LOG_TYPE_DEFAULT, "Forbidden.", buf, 2u);
        }

        -[AAResponse responseDictionary](v13, "responseDictionary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", CFSTR("localizedError"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          objc_msgSend(v20, "setObject:forKey:", v32, CFSTR("localizedError"));
        -[AAResponse responseDictionary](v13, "responseDictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKey:", CFSTR("message"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          goto LABEL_48;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", v32, &stru_1E41752F8, CFSTR("Localizable"));
        v44 = objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      case 404:
        _AALogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          goto LABEL_38;
        *(_WORD *)buf = 0;
        v38 = "Not found.";
        goto LABEL_37;
      case 405:
        _AALogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          goto LABEL_38;
        *(_WORD *)buf = 0;
        v38 = "Method not allowed.";
        goto LABEL_37;
      case 409:
        _AALogSystem();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v48, OS_LOG_TYPE_DEFAULT, "Forbidden. (409)", buf, 2u);
        }

        -[AAResponse responseDictionary](v13, "responseDictionary");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKey:", CFSTR("localizedError"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          objc_msgSend(v20, "setObject:forKey:", v32, CFSTR("localizedError"));
        -[AAResponse responseDictionary](v13, "responseDictionary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", CFSTR("message"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          -[AAResponse _stringWithDescriptionForResponseError:](v13, "_stringWithDescriptionForResponseError:", v32);
          v47 = objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        }
LABEL_48:
        -[AAResponse responseDictionary](v13, "responseDictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", CFSTR("message"));
        v44 = objc_claimAutoreleasedReturnValue();
LABEL_49:
        v19 = (void *)v44;

        goto LABEL_50;
      default:
        if (v27 == 503)
        {
          _AALogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v34, OS_LOG_TYPE_DEFAULT, "Scheduled maintenance.", buf, 2u);
          }

          -[AAResponse responseDictionary](v13, "responseDictionary");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKey:", CFSTR("message"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            v33 = CFSTR("SCHEDULED_MAINTENENCE");
            goto LABEL_41;
          }
        }
        else
        {
LABEL_25:
          _AALogSystem();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v38 = "Other error.";
LABEL_37:
            _os_log_impl(&dword_19EACA000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          }
LABEL_38:

          -[AAResponse responseDictionary](v13, "responseDictionary");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKey:", CFSTR("message"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v46)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            v33 = CFSTR("COMMUNICATIONS_ERROR");
LABEL_41:
            objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_1E41752F8, CFSTR("Localizable"));
            v47 = objc_claimAutoreleasedReturnValue();
LABEL_42:
            v19 = (void *)v47;
LABEL_50:

            if (v19)
              objc_msgSend(v20, "setObject:forKey:", v19, *MEMORY[0x1E0CB2D50]);
            -[AAResponse responseDictionary](v13, "responseDictionary");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              -[AAResponse responseDictionary](v13, "responseDictionary");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v53, CFSTR("responseDictionary"));

            }
            -[AAResponse error](v13, "error");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54)
              goto LABEL_60;
            v55 = -[NSHTTPURLResponse statusCode](v13->_httpResponse, "statusCode");
            v56 = (void *)MEMORY[0x1E0CB35C8];
            if (v55 == 409)
              v57 = 403;
            else
              v57 = -[NSHTTPURLResponse statusCode](v13->_httpResponse, "statusCode");
            objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), v57, v20);
            maxAge = (void *)objc_claimAutoreleasedReturnValue();
            -[AAResponse setError:](v13, "setError:", maxAge);
            goto LABEL_59;
          }
        }
LABEL_39:
        -[AAResponse responseDictionary](v13, "responseDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", CFSTR("message"));
        v47 = objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
    }
  }
LABEL_62:

  return v13;
}

- (id)_stringWithDescriptionForResponseError:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  int v9;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_14;
  }
  v6 = CFSTR("MOBILEME_CREATE_UNAVAILABLE");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MOBILEME_CREATE_UNAVAILABLE")))
    goto LABEL_3;
  v8 = CFSTR("MOBILEME_UNSUPPORTED_DEVICE");
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("MOBILEME_UNSUPPORTED_DEVICE")))
  {
    v6 = CFSTR("MOBILEME_INVALID_SIGNATURE");
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("MOBILEME_INVALID_SIGNATURE")))
    {
LABEL_3:
      -[AAResponse _deviceSpecificLocalizedString:](self, "_deviceSpecificLocalizedString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v5, &stru_1E41752F8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_msgSend(CFSTR("MOBILEME_UNSUPPORTED_DEVICE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("MOBILEME_UNSUPPORTED_DEVICE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
  }
  AADeviceLocStringForKey(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_13;
LABEL_14:

  return v7;
}

- (id)_deviceSpecificLocalizedString:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = MGCopyAnswer();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("iPhone");
  -[__CFString uppercaseString](v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1E41752F8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)protocolVersion
{
  return (NSString *)-[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("protocolVersion"));
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
