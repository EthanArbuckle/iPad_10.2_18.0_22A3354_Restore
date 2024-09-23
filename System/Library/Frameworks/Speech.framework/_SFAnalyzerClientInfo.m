@implementation _SFAnalyzerClientInfo

- (_SFAnalyzerClientInfo)initWithID:(id)a3 source:(id)a4 applicationName:(id)a5 inputOrigin:(id)a6 asrID:(id)a7 requestID:(id)a8 dictationUIInteractionID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _SFAnalyzerClientInfo *v22;
  uint64_t v23;
  NSString *clientID;
  uint64_t v25;
  NSString *applicationName;
  uint64_t v27;
  NSString *source;
  uint64_t v29;
  NSString *inputOrigin;
  uint64_t v31;
  NSUUID *asrID;
  uint64_t v33;
  NSUUID *requestID;
  uint64_t v35;
  NSString *dictationUIInteractionID;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)_SFAnalyzerClientInfo;
  v22 = -[_SFAnalyzerClientInfo init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    clientID = v22->_clientID;
    v22->_clientID = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    applicationName = v22->_applicationName;
    v22->_applicationName = (NSString *)v25;

    v27 = objc_msgSend(v16, "copy");
    source = v22->_source;
    v22->_source = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    inputOrigin = v22->_inputOrigin;
    v22->_inputOrigin = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    asrID = v22->_asrID;
    v22->_asrID = (NSUUID *)v31;

    v33 = objc_msgSend(v20, "copy");
    requestID = v22->_requestID;
    v22->_requestID = (NSUUID *)v33;

    v35 = objc_msgSend(v21, "copy");
    dictationUIInteractionID = v22->_dictationUIInteractionID;
    v22->_dictationUIInteractionID = (NSString *)v35;

  }
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  id v5;

  clientID = self->_clientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientID, CFSTR("_clientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationName, CFSTR("_applicationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("_source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputOrigin, CFSTR("_inputOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_asrID, CFSTR("_asrID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestID, CFSTR("_requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dictationUIInteractionID, CFSTR("_dictationUIInteractionID"));

}

- (_SFAnalyzerClientInfo)initWithCoder:(id)a3
{
  id v4;
  _SFAnalyzerClientInfo *v5;
  uint64_t v6;
  NSString *clientID;
  uint64_t v8;
  NSString *applicationName;
  uint64_t v10;
  NSString *source;
  uint64_t v12;
  NSString *inputOrigin;
  uint64_t v14;
  NSUUID *asrID;
  uint64_t v16;
  NSUUID *requestID;
  uint64_t v18;
  NSString *dictationUIInteractionID;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFAnalyzerClientInfo;
  v5 = -[_SFAnalyzerClientInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_source"));
    v10 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_inputOrigin"));
    v12 = objc_claimAutoreleasedReturnValue();
    inputOrigin = v5->_inputOrigin;
    v5->_inputOrigin = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_asrID"));
    v14 = objc_claimAutoreleasedReturnValue();
    asrID = v5->_asrID;
    v5->_asrID = (NSUUID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestID"));
    v16 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dictationUIInteractionID"));
    v18 = objc_claimAutoreleasedReturnValue();
    dictationUIInteractionID = v5->_dictationUIInteractionID;
    v5->_dictationUIInteractionID = (NSString *)v18;

  }
  return v5;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSUUID)asrID
{
  return self->_asrID;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSString)dictationUIInteractionID
{
  return self->_dictationUIInteractionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationUIInteractionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_asrID, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
