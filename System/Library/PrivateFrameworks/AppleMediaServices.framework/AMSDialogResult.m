@implementation AMSDialogResult

- (AMSDialogResult)initWithOriginalRequest:(id)a3 selectedActionIdentifier:(id)a4
{
  id v7;
  __CFString *v8;
  AMSDialogResult *v9;
  AMSDialogResult *v10;
  __CFString *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *userInfo;
  objc_super v15;

  v7 = a3;
  v8 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialogResult;
  v9 = -[AMSDialogResult init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRequest, a3);
    if (v8)
      v11 = v8;
    else
      v11 = CFSTR("AMSDialogResultDismissIdentifier");
    objc_storeStrong((id *)&v10->_selectedActionIdentifier, v11);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v10->_userInfo;
    v10->_userInfo = v12;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AMSDialogResult selectedActionIdentifier](self, "selectedActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p selected:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AMSDialogResult originalRequest](self, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSDialogResult originalRequest](self, "originalRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("kCodingKeyOriginalRequest"));

  }
  -[AMSDialogResult selectedActionIdentifier](self, "selectedActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSDialogResult selectedActionIdentifier](self, "selectedActionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("kCodingKeySelectionActionId"));

  }
  -[AMSDialogResult textfieldValues](self, "textfieldValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSDialogResult textfieldValues](self, "textfieldValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("kCodingKeyTextfieldValues"));

  }
  -[AMSDialogResult userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSDialogResult userInfo](self, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("kCodingKeyUserInfo"));

  }
}

- (AMSDialogResult)initWithCoder:(id)a3
{
  id v4;
  AMSDialogResult *v5;
  uint64_t v6;
  AMSDialogRequest *originalRequest;
  uint64_t v8;
  NSString *selectedActionIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *textfieldValues;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *userInfo;
  objc_super v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AMSDialogResult;
  v5 = -[AMSDialogResult init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyOriginalRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSDialogRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeySelectionActionId"));
    v8 = objc_claimAutoreleasedReturnValue();
    selectedActionIdentifier = v5->_selectedActionIdentifier;
    v5->_selectedActionIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kCodingKeyTextfieldValues"));
    v13 = objc_claimAutoreleasedReturnValue();
    textfieldValues = v5->_textfieldValues;
    v5->_textfieldValues = (NSArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("kCodingKeyUserInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v5->_userInfo;
    v5->_userInfo = v19;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDialogRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSString)selectedActionIdentifier
{
  return self->_selectedActionIdentifier;
}

- (void)setSelectedActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)textfieldValues
{
  return self->_textfieldValues;
}

- (void)setTextfieldValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_textfieldValues, 0);
  objc_storeStrong((id *)&self->_selectedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

@end
