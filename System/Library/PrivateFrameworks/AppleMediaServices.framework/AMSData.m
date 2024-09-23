@implementation AMSData

+ (id)dataWithObject:(id)a3 encoding:(int64_t)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;

  v7 = a3;
  if (v7)
  {
    switch(a4)
    {
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
        v8 = v7;
        goto LABEL_11;
      case 2:
        if (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v7, 100))
        {
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, a5);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        if (!a5)
          goto LABEL_19;
        v10 = CFSTR("Invalid PLIST object");
        goto LABEL_18;
      case 3:
        if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v7))
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, a5);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        if (!a5)
          goto LABEL_19;
        v10 = CFSTR("Invalid JSON object");
        goto LABEL_18;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "dataUsingEncoding:", 4);
          v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
          v9 = v8;
        }
        else
        {
          if (!a5)
            goto LABEL_19;
          v10 = CFSTR("Invalid String object");
LABEL_18:
          AMSError(3, CFSTR("Data Encoding Failed"), v10, 0);
          v9 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
    v9 = 0;
  }

  return v9;
}

+ (id)compressedGzippedDataWithData:(id)a3
{
  id v3;
  Bytef *v4;
  uint64_t v5;
  id v6;
  id v7;
  int v8;
  int v9;
  z_stream v11;

  v3 = objc_retainAutorelease(a3);
  v4 = (Bytef *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = 0;
  if (v4 && v5)
  {
    memset(&v11.avail_in, 0, 104);
    v11.avail_in = v5;
    v11.avail_out = v5;
    v11.next_in = v4;
    v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v5));
    v11.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v11.next_in, *(_QWORD *)&v11.avail_in);
    if (v7
      && !deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112)
      && (v8 = deflate(&v11, 4), v9 = deflateEnd(&v11), v8 == 1))
    {
      v6 = 0;
      if (!v9 && v5 == v11.total_in)
      {
        objc_msgSend(v7, "setLength:", v11.total_out);
        v6 = v7;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)objectWithData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v14 = 0;
    objc_msgSend(a1, "objectWithData:encoding:error:", v8, objc_msgSend(a1, "_dataEncodingFromResponse:", v9), &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v12 = v11;
    if (a5)
      *a5 = objc_retainAutorelease(v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)objectWithData:(id)a3 encoding:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v9 = 0;
    switch(a4)
    {
      case 0:
        objc_msgSend(a1, "objectWithData:encoding:error:", v8, 2, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(a1, "objectWithData:encoding:error:", v8, 3, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            AMSError(4, CFSTR("Decoding Failed"), CFSTR("Unable to determine encoding for unknown encoding"), 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (a5)
            {
              *a5 = objc_retainAutorelease(v10);
            }
            else
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v13, "OSLogObject");
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                v15 = objc_opt_class();
                AMSLogableError(v11);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = 138543618;
                v19 = v15;
                v20 = 2114;
                v21 = v16;
                _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode data. Error = %{public}@", (uint8_t *)&v18, 0x16u);

              }
            }

            goto LABEL_17;
          }
        }
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, a5);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a5);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 4:
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
LABEL_10:
        v9 = (void *)v12;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_17:
    v9 = 0;
  }

  return v9;
}

+ (int64_t)_dataEncodingFromResponse:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "ams_valueForHTTPHeaderField:", CFSTR("Content-Type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "dataEncodingFromContentType:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)dataEncodingFromContentType:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("/xml"), 1);
      v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("/plist"), 1);
      v6 = 2;
      if (v4 == 0x7FFFFFFFFFFFFFFFLL && v5 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("/data"), 1) != 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = 3;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)decompressedDataWithGzippedData:(id)a3
{
  id v3;
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  z_stream strm;
  _BYTE v10[16384];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(v3, "length");
  v4 = objc_retainAutorelease(v3);
  strm.next_in = (Bytef *)objc_msgSend(v4, "bytes");
  v5 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v10;
      v6 = inflate(&strm, 0);
      if (v6 > 1)
        break;
      v7 = v6;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v5, "appendBytes:length:", v10, 0x4000 - strm.avail_out);
      if (v7)
      {
        inflateEnd(&strm);
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);

    v5 = 0;
  }
LABEL_9:

  return v5;
}

@end
