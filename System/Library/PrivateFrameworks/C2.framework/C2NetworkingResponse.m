@implementation C2NetworkingResponse

+ (id)responseWithURLResponse:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[2];
    v8[2] = v11;

  }
  return v8;
}

+ (id)responseFromRequest:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 body:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init((Class)a1);
  if (v13)
  {
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = (id)objc_opt_new();
    v17 = v16;

    objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("x-apple-request-uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("x-apple-request-uuid"));
    v19 = objc_alloc(MEMORY[0x1E0CB3680]);
    objc_msgSend(v10, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithURL:statusCode:HTTPVersion:headerFields:", v20, a4, CFSTR("HTTP/1.1"), v17);
    v22 = (void *)v13[1];
    v13[1] = v21;

    v23 = objc_msgSend(v12, "copy");
    v24 = (void *)v13[2];
    v13[2] = v23;

  }
  return v13;
}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (NSData)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
}

@end
