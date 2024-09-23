@implementation SUUIReportAConcernOperation

- (SUUIReportAConcernOperation)initWithMetadata:(id)a3
{
  id v5;
  SUUIReportAConcernOperation *v6;
  SUUIReportAConcernOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernOperation;
  v6 = -[SUUIReportAConcernOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadata, a3);

  return v7;
}

- (void)run
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  -[SUUIReportAConcernOperation metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportConcernURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v5);
  objc_msgSend(v6, "setAllowedRetryCount:", 0);
  objc_msgSend(v6, "setCachePolicy:", 1);
  -[SUUIReportAConcernOperation _httpBody](self, "_httpBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHTTPBody:", v7);

  objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "setRequestProperties:", v6);
  objc_msgSend(MEMORY[0x24BEC8C08], "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldProcessDialogs:", 0);
  objc_msgSend(v3, "setDataProvider:", v8);
  v14 = 0;
  v9 = -[SUUIReportAConcernOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v14);
  v10 = v14;
  v11 = 0;
  if (v9)
  {
    objc_msgSend(v8, "output");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("status-code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "integerValue") == 3200;
    -[SUUIReportAConcernOperation setResponseDictionary:](self, "setResponseDictionary:", v12);

  }
  -[SUUIReportAConcernOperation setError:](self, "setError:", v10);
  -[SUUIReportAConcernOperation setSuccess:](self, "setSuccess:", v11);

}

- (id)_httpBody
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SUUIReportAConcernOperation metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v2, "itemIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("userReviewId"));

  objc_msgSend(v2, "selectedReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reasonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("selectedReson"));
  objc_msgSend(v2, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("explanation"));
  objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("guid"));
  objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setResponseDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (SUUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
