@implementation AKAppleIDServerUIDataHarvester

- (AKAppleIDServerUIDataHarvester)init
{
  AKAppleIDServerUIDataHarvester *v2;
  uint64_t v3;
  NSMutableDictionary *harvestedData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDServerUIDataHarvester;
  v2 = -[AKAppleIDServerUIDataHarvester init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    harvestedData = v2->_harvestedData;
    v2->_harvestedData = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSDictionary)harvestedData
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_harvestedData, "copy");
}

- (void)harvestDataFromServerUIObjectModel:(id)a3
{
  id v4;
  NSObject *v5;
  AKAppleIDObjectModelFieldExtractor *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138477827;
    v9 = v4;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from object model: %{private}@", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[AKAppleIDObjectModelFieldExtractor initWithObjectModel:]([AKAppleIDObjectModelFieldExtractor alloc], "initWithObjectModel:", v4);
  objc_msgSend(v4, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerUIDataHarvester _harvestDataFromClientInfo:withExtractor:](self, "_harvestDataFromClientInfo:withExtractor:", v7, v6);

}

- (void)_harvestDataFromClientInfo:(id)a3 withExtractor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138477827;
    v26 = v7;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Harvesting data with extractor: %{private}@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleIdRowId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForFieldWithID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleIdRowPrefixId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForFieldWithID:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_22;
  }
  v17 = (void *)v16;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleIdRowSuffixId"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForFieldWithID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleIdServerInfoSuffixId")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "valueForFieldWithID:", v20),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19))
  {
    objc_msgSend(v17, "stringByAppendingString:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if (!v10)
  {
LABEL_22:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleIdServerInfoId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForFieldWithID:", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_7;
  }
LABEL_4:
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138478083;
    v26 = v10;
    v27 = 2113;
    v28 = v7;
    _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Found an Apple ID (%{private}@) with extractor %{private}@", (uint8_t *)&v25, 0x16u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CFFFC8]);
LABEL_7:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passwordRowId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("newPasswordRowId"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v14;

  objc_msgSend(v7, "valueForFieldWithID:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    _AKLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDServerUIDataHarvester _harvestDataFromClientInfo:withExtractor:].cold.1((uint64_t)v7, v22, v23);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CFFFA0]);
  }
  -[AKAppleIDServerUIDataHarvester harvestIDMSRecoveryInfoFromClientInfo:](self, "harvestIDMSRecoveryInfoFromClientInfo:", v6);

}

- (void)harvestDataFromServerHTTPResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerUIDataHarvester harvestDataFromServerHTTPResponse:].cold.1((uint64_t)v4, v5);

  objc_msgSend(v4, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Found continuation data header in HTTP response", (uint8_t *)&v18, 2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CFFF98]);
  }
  objc_msgSend(v4, "allHeaderFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFEA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138477827;
      v19 = v10;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Found Apple ID (%{private}@) in HTTP response", (uint8_t *)&v18, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CFFFC8]);
  }
  objc_msgSend(v4, "allHeaderFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D00030]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138477827;
      v19 = v13;
      _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Found HME email address  (%{private}@) in HTTP response", (uint8_t *)&v18, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D00038]);
  }
  objc_msgSend(v4, "allHeaderFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("X-Apple-I-Private-Email-Client-Bundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138477827;
      v19 = v16;
      _os_log_impl(&dword_1BD795000, v17, OS_LOG_TYPE_DEFAULT, "Found HME email bundle (%{private}@) in HTTP response", (uint8_t *)&v18, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v16, CFSTR("X-Apple-I-Private-Email-Client-Bundle"));
  }
  -[AKAppleIDServerUIDataHarvester _harvestIDMSRecoveryHeadersInfo:](self, "_harvestIDMSRecoveryHeadersInfo:", v4);

}

- (void)_harvestIDMSRecoveryHeadersInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "allHeaderFields");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerUIDataHarvester harvestIDMSRecoveryInfoFromHeaders:](self, "harvestIDMSRecoveryInfoFromHeaders:", v4);

}

- (void)harvestIDMSRecoveryInfoFromClientInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFFFC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v6, v5);
  v7 = *MEMORY[0x1E0D00078];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D00078]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t *)MEMORY[0x1E0D002D0];
  if (v8
    || (v10 = *MEMORY[0x1E0D002D0],
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D002D0]),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "Harvested recovery continuation endpoint", (uint8_t *)&v16, 2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v8, v7);
    v10 = *v9;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v12, v10);
  v13 = *MEMORY[0x1E0D00068];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D00068]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_1BD795000, v15, OS_LOG_TYPE_DEFAULT, "harvestIDMSRecoveryInfoFromClientInfo: RKMandate is %@", (uint8_t *)&v16, 0xCu);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v14, v13);
}

- (void)harvestIDMSRecoveryInfoFromHeaders:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFFED8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFED8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v6, v5);
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFEF0]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFEF8]))
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "Harvested native recovery action: %@", (uint8_t *)&v21, 0xCu);
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D002C8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D00070];
      if (v8
        || (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D00070]),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v8, v9);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D002C0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0D00060];
      if (v10
        || (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D00060]),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v10, v11);

      }
      v12 = *MEMORY[0x1E0CFFF08];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF08]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v13, v12);
      v14 = *MEMORY[0x1E0CFFFF8];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFF8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v15, v14);
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFEA8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CFFFC8]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-AK-Recovery-URL-Key"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        _AKLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1BD795000, v18, OS_LOG_TYPE_DEFAULT, "Harvested recovery continuation endpoint", (uint8_t *)&v21, 2u);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D00078]);
      }
      v19 = *MEMORY[0x1E0CFFE98];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFE98]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_harvestedData, "setObject:forKeyedSubscript:", v20, v19);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestedData, 0);
}

- (void)_harvestDataFromClientInfo:(NSObject *)a3 withExtractor:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "length");
  v6 = CFSTR("(******)");
  if (!v5)
    v6 = CFSTR("(empty)");
  v7 = 138478083;
  v8 = a1;
  v9 = 2113;
  v10 = v6;
  _os_log_debug_impl(&dword_1BD795000, a3, OS_LOG_TYPE_DEBUG, "Found a password with extractor %{private}@ - %{private}@", (uint8_t *)&v7, 0x16u);
}

- (void)harvestDataFromServerHTTPResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Harvesting data from response: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
