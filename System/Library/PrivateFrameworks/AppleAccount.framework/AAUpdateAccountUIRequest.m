@implementation AAUpdateAccountUIRequest

- (AAUpdateAccountUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4 deviceOSVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AAUpdateAccountUIRequest *v15;
  objc_super v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v19 = v10;
    v20 = CFSTR("iOS");
    v18 = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[AAGenericTermsUIRequest _requestParamsForTermsEntries:additionalInfo:](self, "_requestParamsForTermsEntries:additionalInfo:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)AAUpdateAccountUIRequest;
  v15 = -[AAGenericTermsUIRequest initWithAccount:parameters:](&v17, sel_initWithAccount_parameters_, v8, v14);

  return v15;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAccountUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
