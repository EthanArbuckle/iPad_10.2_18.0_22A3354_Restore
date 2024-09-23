@implementation WFDataDetectorResults

- (WFDataDetectorResults)initWithTextCheckingResults:(id)a3 number:(id)a4 dictionaries:(id)a5 dictionaryType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFDataDetectorResults *v14;
  uint64_t v15;
  NSArray *textCheckingResults;
  uint64_t v17;
  NSArray *dictionaries;
  WFDataDetectorResults *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDataDetectorResults;
  v14 = -[WFDataDetectorResults init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    textCheckingResults = v14->_textCheckingResults;
    v14->_textCheckingResults = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_number, a4);
    v17 = objc_msgSend(v12, "copy");
    dictionaries = v14->_dictionaries;
    v14->_dictionaries = (NSArray *)v17;

    objc_storeStrong((id *)&v14->_dictionaryType, a6);
    v19 = v14;
  }

  return v14;
}

- (WFDataDetectorResults)init
{
  return -[WFDataDetectorResults initWithTextCheckingResults:number:dictionaries:dictionaryType:](self, "initWithTextCheckingResults:number:dictionaries:dictionaryType:", MEMORY[0x24BDBD1A8], 0, 0, 0);
}

- (NSArray)URLs
{
  void *v2;
  void *v3;

  -[WFDataDetectorResults textCheckingResults](self, "textCheckingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_18592);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)streetAddresses
{
  void *v2;
  void *v3;

  -[WFDataDetectorResults textCheckingResults](self, "textCheckingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_7_18589);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)phoneNumbers
{
  void *v2;
  void *v3;

  -[WFDataDetectorResults textCheckingResults](self, "textCheckingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)dates
{
  void *v2;
  void *v3;

  -[WFDataDetectorResults textCheckingResults](self, "textCheckingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_12_18585);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)dateComponentsResults
{
  void *v2;
  void *v3;

  -[WFDataDetectorResults textCheckingResults](self, "textCheckingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_14_18582);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)textCheckingResults
{
  return self->_textCheckingResults;
}

- (NSNumber)number
{
  return self->_number;
}

- (NSArray)dictionaries
{
  return self->_dictionaries;
}

- (WFFileType)dictionaryType
{
  return self->_dictionaryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryType, 0);
  objc_storeStrong((id *)&self->_dictionaries, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_textCheckingResults, 0);
}

id __46__WFDataDetectorResults_dateComponentsResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 8
    && (objc_msgSend(v2, "date"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "componentsInTimeZone:fromDate:", v5, v6);
    else
      objc_msgSend(v4, "components:fromDate:", -1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __30__WFDataDetectorResults_dates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 8)
  {
    objc_msgSend(v2, "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __37__WFDataDetectorResults_phoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 2048)
  {
    +[WFPhoneNumber phoneNumberWithTextCheckingResult:](WFPhoneNumber, "phoneNumberWithTextCheckingResult:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __40__WFDataDetectorResults_streetAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 16)
  {
    +[WFStreetAddress streetAddressWithTextCheckingResult:](WFStreetAddress, "streetAddressWithTextCheckingResult:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __29__WFDataDetectorResults_URLs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 32)
  {
    objc_msgSend(v2, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WFAppTransportSecuredURL(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
