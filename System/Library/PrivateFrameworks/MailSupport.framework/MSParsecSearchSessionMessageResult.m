@implementation MSParsecSearchSessionMessageResult

+ (id)resultWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initResultWithIdentifier:date:", v4, 0);

  return v5;
}

+ (id)resultWithIdentifier:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initResultWithIdentifier:date:", v6, v7);

  return v8;
}

- (id)initResultWithIdentifier:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  MSParsecSearchSessionMessageResult *v9;
  MSParsecSearchSessionMessageResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSParsecSearchSessionMessageResult;
  v9 = -[MSParsecSearchSessionMessageResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultID, a3);
    v10->_messageAge = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketedMessageAgeSinceDate:leadingDigits:", v8, 2);
  }

  return v10;
}

- (id)feedbackResult
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  -[MSParsecSearchSessionMessageResult resultID](self, "resultID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  v8 = CFSTR("messageAgeInDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MSParsecSearchSessionMessageResult messageAge](self, "messageAge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalFeatures:", v6);

  objc_msgSend(v3, "setType:", 2);
  return v3;
}

- (NSString)resultID
{
  return self->_resultID;
}

- (int64_t)messageAge
{
  return self->_messageAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultID, 0);
}

@end
