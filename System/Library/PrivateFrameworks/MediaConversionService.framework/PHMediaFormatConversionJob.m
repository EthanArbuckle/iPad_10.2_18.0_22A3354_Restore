@implementation PHMediaFormatConversionJob

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionJob conversionRequest](self, "conversionRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p request identifier=%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PHMediaFormatConversionRequest)conversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConversionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_conversionRequest, 0);
}

@end
