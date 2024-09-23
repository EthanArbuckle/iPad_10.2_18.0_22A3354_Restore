@implementation MontrealModelJSONParser

- (MontrealModelJSONParser)initWithURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  MontrealNNModelNetwork *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MontrealModelJSONParser;
  v8 = -[MontrealModelJSONParser init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend_path(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    v11 = [MontrealNNModelNetwork alloc];
    v14 = objc_msgSend_initWithJSONDir_(v11, v12, *((_QWORD *)v8 + 1), v13);
    v15 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v14;

  }
  return (MontrealModelJSONParser *)v8;
}

- (id)createJSONFromFile:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v5, (uint64_t)v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (MontrealNNModelNetwork)network
{
  return (MontrealNNModelNetwork *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_jsonDir, 0);
}

@end
