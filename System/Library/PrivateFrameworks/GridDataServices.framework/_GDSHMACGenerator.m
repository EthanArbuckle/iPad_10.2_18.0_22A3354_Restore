@implementation _GDSHMACGenerator

+ (id)HMAC_SHA256Digest:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  size_t v10;
  size_t v11;
  void *v12;
  void *v13;
  _BYTE macOut[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 1);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 1);

  v10 = strlen(v7);
  v11 = strlen(v9);
  CCHmac(2u, v7, v10, v9, v11, macOut);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", macOut, 32);
  objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)SHA256_HashStringFromData:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

+ (id)HMACSignedRequest:(id)a3 secret:(id)a4 secretVersion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[8];

  v44[7] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v40 = a4;
  objc_msgSend(v8, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "HTTPBody");
  v15 = objc_claimAutoreleasedReturnValue();
  v42 = v8;
  objc_msgSend(v8, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "query");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)v15;
  objc_msgSend(a1, "SHA256_HashStringFromData:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bucketedEpochTimeStamp");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v11;
  objc_msgSend(a1, "encodeStringToBase64:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

  v41 = (void *)v14;
  objc_msgSend(a1, "encodeStringToBase64:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v22);

  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(a1, "encodeStringToBase64:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v23);

  }
  objc_msgSend(a1, "encodeStringToBase64:", CFSTR("X-Apple-Content-SHA256"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v24;
  objc_msgSend(a1, "encodeStringToBase64:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v25;
  objc_msgSend(a1, "encodeStringToBase64:", CFSTR("X-Apple-HMAC-Secret-Version"));
  v37 = (void *)v18;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v26;
  objc_msgSend(a1, "encodeStringToBase64:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v27;
  objc_msgSend(a1, "encodeStringToBase64:", CFSTR("X-Apple-HMAC-Sent-Timestamp"));
  v38 = v17;
  v28 = v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v29;
  objc_msgSend(a1, "encodeStringToBase64:", v19);
  v36 = (void *)v19;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v30;
  v44[6] = &stru_250E0DDF0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v31);

  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("|"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "HMAC_SHA256Digest:key:", v32, v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "generateURLRequest:secretVersion:signature:content:timestamp:", v42, v28, v33, v37, v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)generateURLRequest:(id)a3 secretVersion:(id)a4 signature:(id)a5 content:(id)a6 timestamp:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-Content-SHA256"));

  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Apple-HMAC-Secret-Version"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v11, CFSTR("X-Apple-HMAC-Sent-Timestamp"));

  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-HMAC-Digest"));
  return v15;
}

+ (id)bucketedEpochTimeStamp
{
  void *v2;
  double v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f"), floor(v3 * 1000.0 / 300000.0) * 300000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)encodeStringToBase64:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
