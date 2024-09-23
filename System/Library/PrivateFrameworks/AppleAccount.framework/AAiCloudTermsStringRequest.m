@implementation AAiCloudTermsStringRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3
{
  return -[AAiCloudTermsStringRequest initWithAccount:preferPassword:](self, "initWithAccount:preferPassword:", a3, 1);
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 preferPassword:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AAiCloudTermsStringRequest *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];
  const __CFString *v16;
  _QWORD v17[2];

  v4 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("name");
  v17[0] = CFSTR("iCloud");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("terms");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("format");
  v15[0] = v9;
  v15[1] = CFSTR("plist/text");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)AAiCloudTermsStringRequest;
  v11 = -[AAGenericTermsUIRequest initWithAccount:parameters:preferPassword:](&v13, sel_initWithAccount_parameters_preferPassword_, v7, v10, v4);

  return v11;
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 termsEntries:(id)a4 preferPassword:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AAiCloudTermsStringRequest *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  -[AAGenericTermsUIRequest _requestParamsForTermsEntries:](self, "_requestParamsForTermsEntries:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("plist/text"), CFSTR("format"));
  v11 = (void *)objc_msgSend(v10, "copy");
  v14.receiver = self;
  v14.super_class = (Class)AAiCloudTermsStringRequest;
  v12 = -[AAGenericTermsUIRequest initWithAccount:parameters:preferPassword:](&v14, sel_initWithAccount_parameters_preferPassword_, v8, v11, v5);

  return v12;
}

@end
