@implementation AAPhotoResponse

- (AAPhotoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  AAPhotoResponse *v7;
  AAPhotoResponse *v8;
  uint64_t v9;
  NSData *photoData;
  void *v11;
  void *v12;
  void *v13;
  CGImageSource *v14;
  CGImageSource *v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  NSValue *cropRect;
  void *v32;
  uint64_t v33;
  NSString *serverCacheTag;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;

  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AAPhotoResponse;
  v7 = -[AAResponse initWithHTTPResponse:data:](&v40, sel_initWithHTTPResponse_data_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[AAResponse data](v7, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    photoData = v8->_photoData;
    v8->_photoData = (NSData *)v9;

    objc_msgSend(v6, "allHeaderFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("X-MMe-Setup-Family-Photo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 4)
      {
        v14 = CGImageSourceCreateWithData((CFDataRef)v8->_photoData, 0);
        if (v14)
        {
          v15 = v14;
          v16 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
          v17 = (void *)*MEMORY[0x1E0CBD040];
          -[__CFDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedIntegerValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "integerValue");
          objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v19 - (v21 + objc_msgSend(v22, "integerValue"));

          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (double)objc_msgSend(v24, "integerValue");
          v26 = (double)v23;
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (double)objc_msgSend(v27, "integerValue");
          objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v25;
          v37 = v26;
          v38 = v28;
          v39 = (double)objc_msgSend(v29, "integerValue");

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v36, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v30 = objc_claimAutoreleasedReturnValue();
          cropRect = v8->_cropRect;
          v8->_cropRect = (NSValue *)v30;

          CFRelease(v15);
        }
      }

    }
    objc_msgSend(v6, "allHeaderFields", *(_QWORD *)&v36, *(_QWORD *)&v37, *(_QWORD *)&v38, *(_QWORD *)&v39);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ETag"));
    v33 = objc_claimAutoreleasedReturnValue();
    serverCacheTag = v8->_serverCacheTag;
    v8->_serverCacheTag = (NSString *)v33;

  }
  return v8;
}

- (NSData)photoData
{
  return self->_photoData;
}

- (NSValue)cropRect
{
  return self->_cropRect;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_cropRect, 0);
  objc_storeStrong((id *)&self->_photoData, 0);
}

@end
