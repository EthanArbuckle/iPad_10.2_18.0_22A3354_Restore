@implementation CDMLVCResponseCommand

- (CDMLVCResponseCommand)initWithITFMResponse:(id)a3 languageVariantResult:(id)a4
{
  id v7;
  id v8;
  CDMLVCResponseCommand *v9;
  CDMLVCResponseCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMLVCResponseCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itfmResponse, a3);
    objc_storeStrong((id *)&v10->_languageVariantResult, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("languageVariantResult.multilingualVariants: "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMLVCResponseCommand languageVariantResult](self, "languageVariantResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multilingualVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[CDMLVCResponseCommand languageVariantResult](self, "languageVariantResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "multilingualVariants");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "languageVariantName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageVariantScore");
      objc_msgSend(v3, "appendFormat:", CFSTR("[%lu] %@=%.2f, "), v7, v11, v12);

      ++v7;
      -[CDMLVCResponseCommand languageVariantResult](self, "languageVariantResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "multilingualVariants");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v7 < v15);
  }
  return v3;
}

- (int)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(int)a3
{
  self->_classLabel = a3;
}

- (SIRINLUINTERNALITFMITFMParserResponse)itfmResponse
{
  return self->_itfmResponse;
}

- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult
{
  return self->_languageVariantResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageVariantResult, 0);
  objc_storeStrong((id *)&self->_itfmResponse, 0);
}

@end
