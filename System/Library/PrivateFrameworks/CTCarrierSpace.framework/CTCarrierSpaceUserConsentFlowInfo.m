@implementation CTCarrierSpaceUserConsentFlowInfo

- (CTCarrierSpaceUserConsentFlowInfo)init
{
  CTCarrierSpaceUserConsentFlowInfo *v2;
  CTCarrierSpaceUserConsentFlowInfo *v3;
  NSString *webURL;
  NSString *postData;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpaceUserConsentFlowInfo;
  v2 = -[CTCarrierSpaceUserConsentFlowInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    webURL = v2->_webURL;
    v2->_webURL = 0;

    postData = v3->_postData;
    v3->_postData = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceUserConsentFlowInfo webURL](self, "webURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" URL=%@"), v4);

  -[CTCarrierSpaceUserConsentFlowInfo postData](self, "postData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" postData=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTCarrierSpaceUserConsentFlowInfo *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTCarrierSpaceUserConsentFlowInfo *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceUserConsentFlowInfo webURL](self, "webURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceUserConsentFlowInfo webURL](v6, "webURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTCarrierSpaceUserConsentFlowInfo webURL](self, "webURL"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTCarrierSpaceUserConsentFlowInfo webURL](v6, "webURL"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        -[CTCarrierSpaceUserConsentFlowInfo postData](self, "postData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUserConsentFlowInfo postData](v6, "postData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTCarrierSpaceUserConsentFlowInfo postData](self, "postData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceUserConsentFlowInfo postData](v6, "postData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *webURL;
  id v5;

  webURL = self->_webURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", webURL, CFSTR("webURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postData, CFSTR("postData"));

}

- (CTCarrierSpaceUserConsentFlowInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceUserConsentFlowInfo *v5;
  uint64_t v6;
  NSString *webURL;
  uint64_t v8;
  NSString *postData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCarrierSpaceUserConsentFlowInfo;
  v5 = -[CTCarrierSpaceUserConsentFlowInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    webURL = v5->_webURL;
    v5->_webURL = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postData"));
    v8 = objc_claimAutoreleasedReturnValue();
    postData = v5->_postData;
    v5->_postData = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_storeStrong((id *)&self->_webURL, a3);
}

- (NSString)postData
{
  return self->_postData;
}

- (void)setPostData:(id)a3
{
  objc_storeStrong((id *)&self->_postData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
}

@end
