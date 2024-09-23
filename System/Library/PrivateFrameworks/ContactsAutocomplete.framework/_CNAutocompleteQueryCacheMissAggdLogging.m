@implementation _CNAutocompleteQueryCacheMissAggdLogging

- (_CNAutocompleteQueryCacheMissAggdLogging)init
{
  void *v3;
  const char *v4;
  void *v5;
  CNAutocompleteAggdProbe *v6;
  _CNAutocompleteQueryCacheMissAggdLogging *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("com.apple.contacts.autocomplete");
  v9[1] = CFSTR("performance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNAutocompleteAggdProbe initWithKeyPrefix:]([CNAutocompleteAggdProbe alloc], "initWithKeyPrefix:", v5);
  v7 = -[_CNAutocompleteQueryCacheMissAggdLogging initWithProbe:](self, "initWithProbe:", v6);

  return v7;
}

- (_CNAutocompleteQueryCacheMissAggdLogging)initWithProbe:(id)a3
{
  id v5;
  _CNAutocompleteQueryCacheMissAggdLogging *v6;
  _CNAutocompleteQueryCacheMissAggdLogging *v7;
  _CNAutocompleteQueryCacheMissAggdLogging *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteQueryCacheMissAggdLogging;
  v6 = -[_CNAutocompleteQueryCacheMissAggdLogging init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_probe, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[_CNAutocompleteQueryCacheMissAggdLogging probe](self, "probe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordAddValue:forKey:", v5, CFSTR("false-negatives"));

    -[_CNAutocompleteQueryCacheMissAggdLogging probe](self, "probe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendData");

  }
}

- (void)didReturnCacheFalsePositives:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[_CNAutocompleteQueryCacheMissAggdLogging probe](self, "probe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordAddValue:forKey:", v5, CFSTR("false-positives"));

    -[_CNAutocompleteQueryCacheMissAggdLogging probe](self, "probe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendData");

  }
}

- (CNAutocompleteAggdProbe)probe
{
  return (CNAutocompleteAggdProbe *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probe, 0);
}

@end
