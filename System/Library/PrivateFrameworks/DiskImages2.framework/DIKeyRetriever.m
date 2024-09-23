@implementation DIKeyRetriever

+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4
{
  id v5;
  const __CFString *v6;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("uat")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-uat.g.apple.com");
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("prod")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-prod.g.apple.com");
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("dev")) & 1) != 0)
  {
    v6 = CFSTR("saks-ac-dev.g.apple.com");
  }
  else
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS environment"), a4);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (id)v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD1740], "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileHandleForReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD17D8]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/usr/local/bin/appleconnect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExecutableURL:", v7);

  objc_msgSend(v6, "setArguments:", &unk_24CF1FE60);
  objc_msgSend(v6, "setStandardOutput:", v4);
  if ((objc_msgSend(v6, "launchAndReturnError:", a3) & 1) != 0)
  {
    objc_msgSend(v6, "waitUntilExit");
    if (objc_msgSend(v6, "terminationStatus"))
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Could not generate daw token - AppleConnect Failure"), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "readDataToEndOfFileAndReturnError:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
        objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)newSessionWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a1, "newDawTokenWithError:", a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v3, CFSTR("Authorization"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPAdditionalHeaders:", v6);

    objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hintFormat:(id)a3
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("<")))
    return CFSTR("plist");
  else
    return CFSTR("json");
}

+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke;
  v15 = &unk_24CEED6C0;
  v17 = &v18;
  v8 = v7;
  v16 = v8;
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume", v12, v13, v14, v15);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      v16 = 73;
      v17 = 2080;
      v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
      v19 = 2112;
      v20 = v7;
      v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        v16 = 73;
        v17 = 2080;
        v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_ERROR, "%.*s: %@", buf, 0x1Cu);
      }

    }
    *__error() = v8;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "requestSynchronousDataWithRequest:session:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, a5);
  else
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 150, CFSTR("AEA key retrieval failed"), a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (v11)
    objc_msgSend(v12, "setHTTPBody:", v11);
  objc_msgSend(a1, "jsonResponseWithRequest:session:error:", v12, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestSynchronousDataWithRequest:session:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 150, CFSTR("AEA key retrieval failed"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS metadata (json format expected)"), a4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("environment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Not valid SAKS metadata (no environment field)"), a4);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/v1/ac/decrypt"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  size_t v9;
  uint64_t v10;
  const char *v11;
  char v12;
  BOOL v13;
  void *v14;
  _QWORD *exception;
  const std::error_category *v17;
  char __str[2];
  char v19;

  v7 = objc_retainAutorelease(a4);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_24CF07908;
      v17 = std::generic_category();
      exception[1] = 22;
      exception[2] = v17;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = v11;
    }
    v10 = 0;
    v19 = 0;
    v11 = "Key is not hexadecimal number.";
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[2 * v10];
      v12 = strtol(__str, 0, 16);
      a3[v10] = v12;
      if (!v12 && *(unsigned __int16 *)__str != 12336)
        goto LABEL_11;
      ++v10;
    }
    while (v10 != 32);
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid size hex key %lu"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v14, a5);

  }
  return v13;
}

+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v9 = a3;
  v10 = +[DIKeyRetriever newSessionWithError:](DIKeyRetriever, "newSessionWithError:", a6);
  if (v10)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("decryption-components"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIKeyRetriever postRequestWithURL:session:data:error:](DIKeyRetriever, "postRequestWithURL:session:data:error:", v11, v10, 0, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("encryption"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v17 = objc_msgSend(a1, "writeHexKeyToBuffer:hexKey:error:", a4, v16, a6);
        else
          v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in KKMS response"), a6);
        v18 = v17;

      }
      else
      {
        v18 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in KKMS response"), a6);
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD *v15;
  __int128 v16;
  BOOL v17;

  +[DIKeyRetriever getRequestWithURL:error:](DIKeyRetriever, "getRequestWithURL:error:", a3, a7, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    frk_metadata_from_aea_auth_data(a4->var0, a7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      frk_unwrapped_symmetric_key_with_shipping_private_key(v11, v10, a7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "length") == 32)
        {
          v15 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
          v16 = v15[1];
          *(_OWORD *)a5 = *v15;
          *((_OWORD *)a5 + 1) = v16;
          v17 = 1;
        }
        else
        {
          v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid key size"), a7);
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

+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  __CFString *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  size_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  void *v36;
  id v37;
  char *v38;
  id v39;
  id v40;

  v9 = a3;
  objc_msgSend(a1, "hintFormat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (objc_msgSend(v10, "isEqual:", CFSTR("plist")))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, a6);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 1, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "stringWithUTF8String:", objc_msgSend(v16, "bytes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      v19 = 0;
      v20 = CFSTR("dev");
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, a6);
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_3;
  }
  v20 = +[DIKeyRetriever newEnvWithDictionary:error:](DIKeyRetriever, "newEnvWithDictionary:error:", v18, a6);
  if (v20)
  {
    v38 = a4;
    v21 = +[DIKeyRetriever newACEndpointWithEnvironment:error:](DIKeyRetriever, "newACEndpointWithEnvironment:error:", v20, a6);
    if (v21)
    {
      v22 = +[DIKeyRetriever newSessionWithError:](DIKeyRetriever, "newSessionWithError:", a6);
      if (v22)
      {
        v40 = v22;
        v37 = v21;
        v39 = +[DIKeyRetriever newUrl:](DIKeyRetriever, "newUrl:", v21);
        objc_msgSend(v17, "dataUsingEncoding:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[DIKeyRetriever postRequestWithURL:session:data:error:](DIKeyRetriever, "postRequestWithURL:session:data:error:", v39, v40, v23, a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v36 = v24;
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("key"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = v25;
            v27 = (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
            v28 = v27;
            if (v27)
            {
              v29 = strnlen(v27, 0x59uLL);
              if (v29 == 88)
              {
                v30 = *((_OWORD *)v28 + 1);
                *(_OWORD *)v38 = *(_OWORD *)v28;
                *((_OWORD *)v38 + 1) = v30;
                v31 = *((_OWORD *)v28 + 2);
                v32 = *((_OWORD *)v28 + 3);
                v33 = *((_OWORD *)v28 + 4);
                *((_QWORD *)v38 + 10) = *((_QWORD *)v28 + 10);
                *((_OWORD *)v38 + 3) = v32;
                *((_OWORD *)v38 + 4) = v33;
                *((_OWORD *)v38 + 2) = v31;
                v19 = 1;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid size of saks response %lu"), v29);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v34, a6);

              }
            }
            else
            {
              v19 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Missing key in SAKS response"), a6);
            }
            v21 = v37;
          }
          else
          {
            v26 = 0;
            v21 = v37;
            v19 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Bad or missing key in SAKS response."), a6);
          }

          v24 = v36;
        }
        else
        {
          v19 = 0;
          v21 = v37;
        }

        v22 = v40;
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
LABEL_25:

  return v19;
}

@end
