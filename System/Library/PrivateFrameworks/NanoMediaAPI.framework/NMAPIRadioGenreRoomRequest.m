@implementation NMAPIRadioGenreRoomRequest

- (NMAPIRadioGenreRoomRequest)initWithURL:(id)a3
{
  id v4;
  NMAPIRadioGenreRoomRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIRadioGenreRoomRequest;
  v5 = -[MPStoreModelRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Radio Genre Room URL : %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMAPIRadioGenreRoomRequest setLabel:](v5, "setLabel:", v6);

    -[NMAPIRadioGenreRoomRequest setURL:](v5, "setURL:", v4);
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v36;
  void *v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NMAPIRadioGenreRoomRequest;
  -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v36, sel_urlComponentsWithStoreURLBag_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MusicURLPathStorefrontWithURLBag(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NMAPIRadioGenreRoomRequest _roomIdentifierWithStoreURLBag:](self, "_roomIdentifierWithStoreURLBag:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38[0] = CFSTR("/v1/editorial");
      v38[1] = v8;
      v38[2] = CFSTR("rooms");
      v38[3] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathWithComponents:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", v13);

      objc_msgSend(v7, "queryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("art[url]"), CFSTR("f,c"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setQueryItems:", v17);

      v18 = v7;
    }
    else
    {
      NMLogForCategory(9);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[NMAPIRadioGenreRoomRequest urlComponentsWithStoreURLBag:error:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (id)_roomIdentifierWithStoreURLBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  -[NMAPIRadioGenreRoomRequest URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NMAPIRadioGenreRoomRequest _bagRoomURLRegularExpressionWithStoreURLBag:](self, "_bagRoomURLRegularExpressionWithStoreURLBag:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    NMLogForCategory(9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NMAPIRadioGenreRoomRequest _roomIdentifierWithStoreURLBag:].cold.1((uint64_t)v6, v14, v21, v22, v23, v24, v25, v26);
    goto LABEL_8;
  }
  v11 = objc_msgSend(v9, "rangeWithName:", CFSTR("identifier"));
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v6, "substringWithRange:", v11, v12), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NMLogForCategory(9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NMAPIRadioGenreRoomRequest _roomIdentifierWithStoreURLBag:].cold.2((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
LABEL_8:

    v13 = 0;
  }

  return v13;
}

- (id)_bagRoomURLRegularExpressionWithStoreURLBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  objc_msgSend(a3, "dictionaryForBagKey:", *MEMORY[0x24BEC86F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("viewRoomUrlRegex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 0, &v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v6)
      {
        NMLogForCategory(9);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[NMAPIRadioGenreRoomRequest _bagRoomURLRegularExpressionWithStoreURLBag:].cold.1((uint64_t)v4, (uint64_t)v6, v7);

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMAPIRadioGenreRoomRequest;
  v4 = -[NMAPIRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 16, self->_URL);
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A803000, a1, a3, "[NMAPIRequest] Missing room identifier.", a5, a6, a7, a8, 0);
}

- (void)_roomIdentifierWithStoreURLBag:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A803000, a2, a3, "[NMAPIRequest] No match found, URL is not supported: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_roomIdentifierWithStoreURLBag:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21A803000, a2, a3, "[NMAPIRequest] Match didn't capture an identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_bagRoomURLRegularExpressionWithStoreURLBag:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Regex cannot be generated from pattern: %{public}@ with error %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
