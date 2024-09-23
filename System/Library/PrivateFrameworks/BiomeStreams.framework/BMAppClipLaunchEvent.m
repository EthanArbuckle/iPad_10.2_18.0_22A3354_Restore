@implementation BMAppClipLaunchEvent

- (BMAppClipLaunchEvent)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMAppClipLaunchEvent *v24;
  uint64_t v25;
  NSString *URLHash;
  uint64_t v27;
  NSString *clipBundleID;
  uint64_t v29;
  NSString *appBundleID;
  uint64_t v31;
  NSString *webAppBundleID;
  uint64_t v33;
  NSString *launchReason;
  uint64_t v35;
  NSURL *fullURL;
  uint64_t v37;
  NSURL *referrerURL;
  uint64_t v39;
  NSString *referrerBundleID;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)BMAppClipLaunchEvent;
  v24 = -[BMEventBase init](&v42, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    URLHash = v24->_URLHash;
    v24->_URLHash = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    clipBundleID = v24->_clipBundleID;
    v24->_clipBundleID = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    appBundleID = v24->_appBundleID;
    v24->_appBundleID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    webAppBundleID = v24->_webAppBundleID;
    v24->_webAppBundleID = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    launchReason = v24->_launchReason;
    v24->_launchReason = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    fullURL = v24->_fullURL;
    v24->_fullURL = (NSURL *)v35;

    v37 = objc_msgSend(v22, "copy");
    referrerURL = v24->_referrerURL;
    v24->_referrerURL = (NSURL *)v37;

    v39 = objc_msgSend(v23, "copy");
    referrerBundleID = v24->_referrerBundleID;
    v24->_referrerBundleID = (NSString *)v39;

  }
  return v24;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[BMAppClipLaunchEvent URLHash](self, "URLHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent clipBundleID](self, "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent appBundleID](self, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent webAppBundleID](self, "webAppBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent launchReason](self, "launchReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent fullURL](self, "fullURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent referrerURL](self, "referrerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipLaunchEvent referrerBundleID](self, "referrerBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@ %p> URLHash: %@, clipBundleID: %@, appBundleID: %@, webAppBundleID: %@, launchReason: %@, fullURL: %@, referrerURL: %@, referrerBundleID: %@"), v3, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  if (a4 != 1)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[BMAppClipLaunchEvent eventWithData:dataVersion:].cold.1(v7);

  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMAppClipLaunchEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMAppClipLaunchEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BMAppClipLaunchEvent *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BMAppClipLaunchEvent initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "uRLHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webAppBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "fullURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "referrerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "referrerBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMAppClipLaunchEvent initWithURLHash:clipBundleID:appBundleID:webAppBundleID:launchReason:fullURL:referrerURL:referrerBundleID:](self, "initWithURLHash:clipBundleID:appBundleID:webAppBundleID:launchReason:fullURL:referrerURL:referrerBundleID:", v19, v17, v6, v18, v16, v8, v11, v12);
  v13 = self;
LABEL_8:

  return v13;
}

- (BMAppClipLaunchEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBAppClipLaunchEvent *v5;
  BMAppClipLaunchEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBAppClipLaunchEvent initWithData:]([BMPBAppClipLaunchEvent alloc], "initWithData:", v4);

    self = -[BMAppClipLaunchEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[BMAppClipLaunchEvent URLHash](self, "URLHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURLHash:", v4);

  -[BMAppClipLaunchEvent clipBundleID](self, "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipBundleID:", v5);

  -[BMAppClipLaunchEvent appBundleID](self, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppBundleID:", v6);

  -[BMAppClipLaunchEvent webAppBundleID](self, "webAppBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebAppBundleID:", v7);

  -[BMAppClipLaunchEvent launchReason](self, "launchReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLaunchReason:", v8);

  -[BMAppClipLaunchEvent fullURL](self, "fullURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFullURL:", v10);

  -[BMAppClipLaunchEvent referrerURL](self, "referrerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReferrerURL:", v12);

  -[BMAppClipLaunchEvent referrerBundleID](self, "referrerBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReferrerBundleID:", v13);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[BMAppClipLaunchEvent URLHash](self, "URLHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMAppClipLaunchEvent appBundleID](self, "appBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[BMAppClipLaunchEvent clipBundleID](self, "clipBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[BMAppClipLaunchEvent webAppBundleID](self, "webAppBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[BMAppClipLaunchEvent launchReason](self, "launchReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[BMAppClipLaunchEvent fullURL](self, "fullURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[BMAppClipLaunchEvent referrerURL](self, "referrerURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[BMAppClipLaunchEvent referrerBundleID](self, "referrerBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v32;
  char v33;
  char v34;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[BMAppClipLaunchEvent URLHash](self, "URLHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "URLHash"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMAppClipLaunchEvent URLHash](self, "URLHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        -[BMAppClipLaunchEvent appBundleID](self, "appBundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 || (objc_msgSend(v6, "appBundleID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMAppClipLaunchEvent appBundleID](self, "appBundleID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appBundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v7, "isEqual:", v12);

          if (v11)
          {
LABEL_15:

            -[BMAppClipLaunchEvent clipBundleID](self, "clipBundleID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 || (objc_msgSend(v6, "clipBundleID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[BMAppClipLaunchEvent clipBundleID](self, "clipBundleID");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "clipBundleID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              HIDWORD(v32) = objc_msgSend(v7, "isEqual:", v14);

              if (v13)
              {
LABEL_21:

                -[BMAppClipLaunchEvent webAppBundleID](self, "webAppBundleID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15
                  || (objc_msgSend(v6, "webAppBundleID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[BMAppClipLaunchEvent webAppBundleID](self, "webAppBundleID");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "webAppBundleID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v32) = objc_msgSend(v7, "isEqual:", v16);

                  if (v15)
                  {
LABEL_27:

                    -[BMAppClipLaunchEvent launchReason](self, "launchReason");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v17
                      || (objc_msgSend(v6, "launchReason"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      -[BMAppClipLaunchEvent launchReason](self, "launchReason", v32);
                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "launchReason");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      v19 = objc_msgSend(v7, "isEqual:", v18);

                      if (v17)
                      {
LABEL_33:

                        -[BMAppClipLaunchEvent fullURL](self, "fullURL");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v20
                          || (objc_msgSend(v6, "fullURL"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[BMAppClipLaunchEvent fullURL](self, "fullURL", v32);
                          v7 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v6, "fullURL");
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          v22 = objc_msgSend(v7, "isEqual:", v21);

                          if (v20)
                          {
LABEL_39:

                            -[BMAppClipLaunchEvent referrerURL](self, "referrerURL");
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v23
                              || (objc_msgSend(v6, "referrerURL"),
                                  (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              -[BMAppClipLaunchEvent referrerURL](self, "referrerURL", v32);
                              v24 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v6, "referrerURL");
                              v25 = (void *)objc_claimAutoreleasedReturnValue();
                              v26 = objc_msgSend(v24, "isEqual:", v25);

                              if (v23)
                              {
LABEL_45:

                                -[BMAppClipLaunchEvent referrerBundleID](self, "referrerBundleID");
                                v27 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v27
                                  || (objc_msgSend(v6, "referrerBundleID"),
                                      (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  -[BMAppClipLaunchEvent referrerBundleID](self, "referrerBundleID", v32);
                                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v6, "referrerBundleID");
                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                  v30 = objc_msgSend(v28, "isEqual:", v29);

                                  if (v27)
                                  {
LABEL_51:

                                    v10 = v34 & v33 & BYTE4(v32) & v32 & v19 & v22 & v26 & v30;
                                    goto LABEL_52;
                                  }
                                }
                                else
                                {
                                  v30 = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              v26 = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          v22 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      v19 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  LODWORD(v32) = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              HIDWORD(v32) = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          v33 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v34 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_52:

  return v10;
}

- (NSString)URLHash
{
  return self->_URLHash;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSURL)fullURL
{
  return self->_fullURL;
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_URLHash, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Mismatched BMAppLaunchEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBAppClipLaunchEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
