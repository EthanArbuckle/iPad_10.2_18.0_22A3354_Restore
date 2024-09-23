@implementation _SFSearchResult

- (_SFSearchResult)initWithVoiceSearchResult:(id)a3
{
  id v4;
  _SFSearchResult *v5;
  const __CFAllocator *v6;
  void *v7;
  int v8;
  CFHTTPMessageRef Response;
  void *v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  NSHTTPURLResponse *v14;
  uint64_t v15;
  NSData *data;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFSearchResult;
  v5 = -[_SFSearchResult init](&v21, sel_init);
  if (v5)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend(v4, "statusCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");
    Response = CFHTTPMessageCreateResponse(v6, v8, &stru_1E6486C88, (CFStringRef)*MEMORY[0x1E0C930E8]);

    if (Response)
    {
      objc_msgSend(v4, "headers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __45___SFSearchResult_initWithVoiceSearchResult___block_invoke;
      v20[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
      v20[4] = Response;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);

      v11 = CFURLResponseCreateWithHTTPResponse();
      if (v11)
      {
        v12 = (const void *)v11;
        objc_msgSend(MEMORY[0x1E0CB3680], "_responseWithCFURLResponse:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v5->_response;
        v5->_response = (NSHTTPURLResponse *)v13;

        CFRelease(v12);
      }
      CFRelease(Response);
    }
    objc_msgSend(v4, "result");
    v15 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v15;

    objc_msgSend(v4, "searchType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D89100]) & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D89108]))
      {
LABEL_11:

        goto LABEL_12;
      }
      v18 = 2;
    }
    v5->_searchType = v18;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", self->_data, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", v5, 4);

    if (v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)_SFSearchResult;
      -[_SFSearchResult description](&v10, sel_description);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)_SFSearchResult;
      -[_SFSearchResult description](&v11, sel_description);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_SFSearchResult;
    -[_SFSearchResult description](&v12, sel_description);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)searchType
{
  return self->_searchType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
