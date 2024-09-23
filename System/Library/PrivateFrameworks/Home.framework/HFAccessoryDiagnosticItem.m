@implementation HFAccessoryDiagnosticItem

- (HFAccessoryDiagnosticItem)initWithLogMetadata:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  HFAccessoryDiagnosticItem *v9;
  HFAccessoryDiagnosticItem *v10;
  void *v11;
  uint64_t v12;
  NSString *filename;
  void *v14;
  uint64_t v15;
  NSString *manufacturer;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryDiagnosticItem;
  v9 = -[HFAccessoryDiagnosticItem init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_msgSend(v7, "snapshotPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_claimAutoreleasedReturnValue();
    filename = v10->_filename;
    v10->_filename = (NSString *)v12;

    objc_msgSend(v8, "manufacturer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    manufacturer = v10->_manufacturer;
    v10->_manufacturer = (NSString *)v15;

  }
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("title");
  -[HFAccessoryDiagnosticItem filename](self, "filename", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("hidden");
  v10[0] = v3;
  v10[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)privacyPolicyURL
{
  void *v2;
  void *v3;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyPolicyURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int64_t)consentVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consentVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)uploadType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uploadType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSString)path
{
  void *v2;
  void *v3;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEligibleForUpload
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uploadDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length")
    && -[HFAccessoryDiagnosticItem consentVersion](self, "consentVersion") == 1
    && -[HFAccessoryDiagnosticItem uploadType](self, "uploadType") == 0;

  return v6;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;
  void *v4;

  -[HFAccessoryDiagnosticItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (HMAccessoryDiagnosticsMetadata)metadata
{
  return self->_metadata;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
