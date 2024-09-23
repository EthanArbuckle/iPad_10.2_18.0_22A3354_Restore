@implementation SUUIRedeemIdValidateOperation

- (SUUIRedeemIdValidateOperation)initWithDictionary:(id)a3
{
  id v5;
  SUUIRedeemIdValidateOperation *v6;
  SUUIRedeemIdValidateOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemIdValidateOperation;
  v6 = -[SUUIRedeemIdValidateOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (void)main
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD block[5];
  char v15;
  id v16;

  -[SUUIRedeemIdValidateOperation _subOperation](self, "_subOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v4 = -[SUUIRedeemIdValidateOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v16);
  v5 = (unint64_t)v16;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Underlying sub-operation for '%@' failed."), CFSTR("redeemValidateIdUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemIdValidateOperation _logResultsForSuccess:failureReason:failureMessage:error:](self, "_logResultsForSuccess:failureReason:failureMessage:error:", 0, v9, 0, v5);
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v3, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("validNationalId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dialog"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v12;
    else
      v10 = 0;

    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unuccessful operation. We did not have a valid %@ flag in the response."), CFSTR("validNationalId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  v11 = 0;
LABEL_12:

  -[SUUIRedeemIdValidateOperation _logResultsForSuccess:failureReason:failureMessage:error:](self, "_logResultsForSuccess:failureReason:failureMessage:error:", v11, v9, v10, v5);
  if ((v11 & 1) != 0)
  {
    v13 = 1;
LABEL_17:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__SUUIRedeemIdValidateOperation_main__block_invoke;
    block[3] = &unk_2511F82E0;
    block[4] = self;
    v15 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    goto LABEL_18;
  }
LABEL_14:
  v13 = v5 | v10;
  if (!(v5 | v10))
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[SUUIRedeemIdValidateOperation _handleFailure:serverDialogDictionary:](self, "_handleFailure:serverDialogDictionary:", v5, v10);
LABEL_18:

}

uint64_t __37__SUUIRedeemIdValidateOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(unsigned __int8 *)(a1 + 40));
}

- (void)_handleFailure:(id)a3 serverDialogDictionary:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (v8)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", v8);
    objc_msgSend(MEMORY[0x24BEC8BA0], "operationWithDialog:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8BA0], "operationWithError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setDelegate:", self);
  -[SUUIRedeemIdValidateOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, 0);

}

- (void)operation:(id)a3 selectedButton:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUUIRedeemIdValidateOperation_operation_selectedButton___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __58__SUUIRedeemIdValidateOperation_operation_selectedButton___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))();
}

- (id)_subOperation
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  v4 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v4, "setURLBagKey:", CFSTR("redeemValidateIdUrl"));
  objc_msgSend(v4, "setITunesStoreRequest:", 1);
  SSVDefaultUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));

  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v6 = (void *)MEMORY[0x24BDD1608];
  -[SUUIRedeemIdValidateOperation dictionary](self, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithJSONObject:options:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHTTPBody:", v8);
  objc_msgSend(v3, "setRequestProperties:", v4);
  objc_msgSend(MEMORY[0x24BEC8C10], "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataProvider:", v9);

  return v3;
}

- (void)_logResultsForSuccess:(BOOL)a3 failureReason:(id)a4 failureMessage:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v8 = a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15 = CFSTR("validNationalId");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("dialog"));
  if (v9)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("failure reason"));
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("error"));
  SSDebugLog();

}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

@end
