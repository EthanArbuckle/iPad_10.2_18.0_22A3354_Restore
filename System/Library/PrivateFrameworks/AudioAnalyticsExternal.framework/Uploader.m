@implementation Uploader

- (id)_hmacSHA1WithKey:(id)a3 forData:(id)a4
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  size_t v9;
  id v10;
  void *v11;
  _BYTE macOut[20];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_retainAutorelease(v5);
    v8 = (const void *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");
    v10 = objc_retainAutorelease(v6);
    CCHmac(0, v8, v9, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), macOut);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_authorizationHeaderWithRequest:(id)a3 withContentType:(id)a4 withContentMD5:(id)a5 withDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[6];

  v32[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = v11;
  v31 = v12;
  objc_msgSend(v10, "HTTPMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  v32[1] = v12;
  v32[2] = v11;
  v32[3] = v13;
  objc_msgSend(v10, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[Uploader bucketInfo](self, "bucketInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SecretKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[Uploader _hmacSHA1WithKey:forData:](self, "_hmacSHA1WithKey:forData:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BDD17C8];
  -[Uploader bucketInfo](self, "bucketInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AccessIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("AWS %@:%@"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_dateStringForHeaderForDate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    if (-[Uploader _dateStringForHeaderForDate:]::onceToken[0] != -1)
      dispatch_once(-[Uploader _dateStringForHeaderForDate:]::onceToken, &__block_literal_global);
    objc_msgSend((id)-[Uploader _dateStringForHeaderForDate:]::dateFormatter, "stringFromDate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __40__Uploader__dateStringForHeaderForDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)-[Uploader _dateStringForHeaderForDate:]::dateFormatter;
  -[Uploader _dateStringForHeaderForDate:]::dateFormatter = (uint64_t)v0;

  objc_msgSend((id)-[Uploader _dateStringForHeaderForDate:]::dateFormatter, "setDateFormat:", CFSTR("EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss Z"));
  v2 = (void *)-[Uploader _dateStringForHeaderForDate:]::dateFormatter;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v2, "setTimeZone:");

  v3 = (void *)-[Uploader _dateStringForHeaderForDate:]::dateFormatter;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v3, "setLocale:");

}

- (id)_md5OfData:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  CC_MD5((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_urlRequestForFileAtPath:(id)a3 bucket:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  _QWORD v42[6];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = v11;
  v39 = v12;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v10, 8, a6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a6)
  {
    -[Uploader logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = *a6;
      *(_DWORD *)buf = 138478083;
      v44 = v10;
      v45 = 2113;
      v46 = v14;
      _os_log_impl(&dword_236BE1000, v13, OS_LOG_TYPE_DEBUG, "Unable to memory map. { path=%{private}@, error=%{private}@ }", buf, 0x16u);
    }
    v15 = 0;
  }
  else
  {
    objc_msgSend(v10, "lastPathComponent");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/%@"), v11, v12, v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[Uploader logger](self, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[Uploader bucketInfo](self, "bucketInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Endpoint"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v44 = v18;
      _os_log_impl(&dword_236BE1000, v16, OS_LOG_TYPE_DEBUG, "Endpoint found. { self.bucketInfo[kEndpointKey]=%{private}@ }", buf, 0xCu);

    }
    v19 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAddingPercentEncodingWithAllowedCharacters:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDBCF48];
    -[Uploader bucketInfo](self, "bucketInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Endpoint"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLWithString:relativeToURL:", v22, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[Uploader logger](self, "logger");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v44 = v27;
      _os_log_impl(&dword_236BE1000, v28, OS_LOG_TYPE_DEBUG, "Blobby upload URL: { url=%{private}@ }", buf, 0xCu);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v27);
    objc_msgSend(v15, "setCachePolicy:", 1);
    objc_msgSend(v15, "setHTTPMethod:", CFSTR("PUT"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v40, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[Uploader _md5OfData:](self, "_md5OfData:", v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[Uploader _dateStringForHeaderForDate:](self, "_dateStringForHeaderForDate:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[Uploader _authorizationHeaderWithRequest:withContentType:withContentMD5:withDate:](self, "_authorizationHeaderWithRequest:withContentType:withContentMD5:withDate:", v15, CFSTR("application/octet-stream"), v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = CFSTR("Content-Type");
    v41[1] = CFSTR("Content-Length");
    v42[0] = CFSTR("application/octet-stream");
    v42[1] = v29;
    v41[2] = CFSTR("Content-MD5");
    v41[3] = CFSTR("Date");
    v42[2] = v31;
    v42[3] = v33;
    v41[4] = CFSTR("Expect");
    v41[5] = CFSTR("Authorization");
    v42[4] = CFSTR("100-continue");
    v42[5] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllHTTPHeaderFields:", v35);
    objc_msgSend(v15, "setCachePolicy:", 1);
    objc_msgSend(v15, "setHTTPShouldHandleCookies:", 0);
    objc_msgSend(v15, "setTimeoutInterval:", 600.0);
    objc_msgSend(v15, "setCachePolicy:", 1);

  }
  return v15;
}

- (void)_uploadFile:(id)a3 bucket:(id)a4 prefix:(id)a5 withCompletion:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, _QWORD, id);
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  Uploader *v25;
  id v26;
  void (**v27)(id, uint64_t, _QWORD, id);
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, uint64_t, _QWORD, id))a6;
  v28 = 0;
  -[Uploader _urlRequestForFileAtPath:bucket:prefix:error:](self, "_urlRequestForFileAtPath:bucket:prefix:error:", v10, a4, a5, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;
  if (v13)
  {
    v11[2](v11, -1, 0, v13);
  }
  else
  {
    -[Uploader logger](self, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236BE1000, v14, OS_LOG_TYPE_DEBUG, "Getting ready for upload task", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[Uploader session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __53__Uploader__uploadFile_bucket_prefix_withCompletion___block_invoke;
    v24 = &unk_25082E040;
    v25 = self;
    v27 = v11;
    v17 = v10;
    v26 = v17;
    objc_msgSend(v16, "uploadTaskWithRequest:fromFile:completionHandler:", v12, v15, &v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[Uploader logger](self, "logger", v21, v22, v23, v24, v25);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v17, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v30 = v20;
      _os_log_impl(&dword_236BE1000, v19, OS_LOG_TYPE_DEBUG, "Uploading package. { [packagePath lastPathComponent]=%{private}@ }", buf, 0xCu);

    }
    objc_msgSend(v18, "resume");

  }
}

void __53__Uploader__uploadFile_bucket_prefix_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138477827;
      v19 = v11;
      _os_log_impl(&dword_236BE1000, v10, OS_LOG_TYPE_INFO, "Upload task error: { error=%{private}@ }", (uint8_t *)&v18, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v8;
      objc_msgSend(v12, "statusCode");
      v13 = objc_msgSend(v12, "statusCode");
      v14 = *(void **)(a1 + 32);
      if (v13 == 200)
      {
        objc_msgSend(v14, "logger");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138477827;
          v19 = v16;
          _os_log_impl(&dword_236BE1000, v15, OS_LOG_TYPE_DEBUG, "Upload successful. { [packagePath lastPathComponent]=%{private}@ }", (uint8_t *)&v18, 0xCu);

        }
      }
      else
      {
        objc_msgSend(v14, "logger");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", objc_msgSend(v12, "statusCode"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138478083;
          v19 = v17;
          v20 = 2048;
          v21 = objc_msgSend(v12, "statusCode");
          _os_log_impl(&dword_236BE1000, v15, OS_LOG_TYPE_INFO, "Upload task unsuccessful. { [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]=%{private}@, httpResponse.statusCode=%ld }", (uint8_t *)&v18, 0x16u);

        }
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

- (void)uploadFile:(id)a3 bucket:(id)a4 subfolder:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[Uploader logger](self, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    v26 = v10;
    v27 = 2113;
    v28 = v11;
    v29 = 2113;
    v30 = v12;
    _os_log_impl(&dword_236BE1000, v14, OS_LOG_TYPE_DEBUG, "Blobby uploader called with { filePath=%{private}@, bucket=%{private}@, subfolder=%{private}@ }", buf, 0x20u);
  }

  -[Uploader queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__Uploader_uploadFile_bucket_subfolder_withCompletion___block_invoke;
  block[3] = &unk_25082E090;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_sync(v15, block);

}

void __55__Uploader_uploadFile_bucket_subfolder_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138478339;
    v20 = v3;
    v21 = 2113;
    v22 = v4;
    v23 = 2113;
    v24 = v5;
    _os_log_impl(&dword_236BE1000, v2, OS_LOG_TYPE_DEBUG, "Starting to upload fp, bucket, subfolder { filePath=%{private}@, bucket=%{private}@ , subfolder=%{private}@ }", buf, 0x20u);
  }

  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = dispatch_time(0, 30000000000);
  v8 = dispatch_semaphore_wait(v6, v7) == 0;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138477827;
      v20 = v11;
      _os_log_impl(&dword_236BE1000, v9, OS_LOG_TYPE_INFO, "Semaphore wait completed. Concurrent upload now available.{ filePath=%{private}@ }", buf, 0xCu);
    }

    v13 = *(void **)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__Uploader_uploadFile_bucket_subfolder_withCompletion___block_invoke_54;
    v16[3] = &unk_25082E068;
    v16[4] = v13;
    v17 = v12;
    v18 = *(id *)(a1 + 64);
    objc_msgSend(v13, "_uploadFile:bucket:prefix:withCompletion:", v17, v14, v15, v16);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236BE1000, v9, OS_LOG_TYPE_INFO, "Timed out waiting for blobby request queue", buf, 2u);
    }

  }
}

void __55__Uploader_uploadFile_bucket_subfolder_withCompletion___block_invoke_54(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)a1[4];
  if (a3)
  {
    objc_msgSend(v7, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = a1[5];
      v12 = 138477827;
      v13 = v9;
      _os_log_impl(&dword_236BE1000, v8, OS_LOG_TYPE_DEBUG, "File uploaded successfully. { filePath=%{private}@ }", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v7, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = a1[5];
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138478083;
      v13 = v10;
      v14 = 2113;
      v15 = v11;
      _os_log_impl(&dword_236BE1000, v8, OS_LOG_TYPE_DEBUG, "File upload failed. { filePath=%{private}@, error=%{private}@ }", (uint8_t *)&v12, 0x16u);

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 16));
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)invalidateConnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[Uploader session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[Uploader logger](self, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_236BE1000, v4, OS_LOG_TYPE_DEBUG, "Invalidating URL session.", v6, 2u);
    }

    -[Uploader session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateAndCancel");

    -[Uploader setSession:](self, "setSession:", 0);
  }
}

- (id)init:(id)a3
{
  id v5;
  Uploader *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURLSession *session;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *concurrentUploadSemaphore;
  os_log_t v15;
  OS_os_log *logger;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)Uploader;
  v6 = -[Uploader init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWaitsForConnectivity:", 1);
    objc_msgSend(v7, "setAllowsCellularAccess:", 1);
    objc_msgSend(v7, "setNetworkServiceType:", 6);
    objc_msgSend(v7, "setTimeoutIntervalForRequest:", 600.0);
    objc_msgSend(v7, "setTimeoutIntervalForResource:", 600.0);
    objc_msgSend(v7, "setSessionSendsLaunchEvents:", 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, 0);
    objc_msgSend(v7, "setURLCache:", v8);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    session = v6->_session;
    v6->_session = (NSURLSession *)v9;

    v11 = dispatch_queue_create("Blobby Uploader", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = dispatch_semaphore_create(3);
    concurrentUploadSemaphore = v6->_concurrentUploadSemaphore;
    v6->_concurrentUploadSemaphore = (OS_dispatch_semaphore *)v13;

    objc_storeStrong((id *)&v6->_bucketInfo, a3);
    v15 = os_log_create("com.apple.coreaudio", "carv");
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v15;

  }
  return v6;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_semaphore)concurrentUploadSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConcurrentUploadSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)bucketInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBucketInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_bucketInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_concurrentUploadSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
