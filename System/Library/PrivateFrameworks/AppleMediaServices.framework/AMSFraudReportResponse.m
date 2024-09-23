@implementation AMSFraudReportResponse

- (AMSFraudReportResponse)initWithURLResult:(id)a3 keyID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  AMSFraudReportResponse *v9;

  v6 = a4;
  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v9 = -[AMSFraudReportResponse initWithDictionary:keyID:](self, "initWithDictionary:keyID:", v8, v6);
  return v9;
}

- (AMSFraudReportResponse)initWithDictionary:(id)a3 keyID:(id)a4
{
  id v6;
  id v7;
  AMSFraudReportResponse *v8;
  void *v9;
  NSString *v10;
  NSString *nameSpace;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSString *v17;
  NSString *evaluatedElement;
  void *v19;
  NSString *v20;
  NSString *finalizedElement;
  void *v22;
  NSString *v23;
  NSString *proof;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AMSFraudReportResponse;
  v8 = -[AMSFraudReportResponse init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("namespace"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    nameSpace = v8->_nameSpace;
    v8->_nameSpace = v10;

    objc_msgSend(v6, "valueForKey:", CFSTR("rs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("rs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_reportedScore = objc_msgSend(v13, "integerValue");

    }
    else
    {
      v8->_reportedScore = -1;
    }

    objc_msgSend(v6, "valueForKey:", CFSTR("ns"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v8->_newScore = (int)objc_msgSend(v15, "intValue");
    objc_msgSend(v6, "valueForKey:", CFSTR("evaluatedElement"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    evaluatedElement = v8->_evaluatedElement;
    v8->_evaluatedElement = v17;

    objc_msgSend(v6, "valueForKey:", CFSTR("finalizedElement"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    finalizedElement = v8->_finalizedElement;
    v8->_finalizedElement = v20;

    objc_msgSend(v6, "valueForKey:", CFSTR("proof"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    proof = v8->_proof;
    v8->_proof = v23;

    objc_storeStrong((id *)&v8->_keyID, a4);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AMSFraudReportResponse nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("namespace"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSFraudReportResponse reportedScore](self, "reportedScore"), CFSTR("rs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSFraudReportResponse newScore](self, "newScore"), CFSTR("ns"));
  -[AMSFraudReportResponse evaluatedElement](self, "evaluatedElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("evaluatedElement"));

  -[AMSFraudReportResponse finalizedElement](self, "finalizedElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("finalizedElement"));

  -[AMSFraudReportResponse proof](self, "proof");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("proof"));

  -[AMSFraudReportResponse keyID](self, "keyID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("keyID"));

}

- (AMSFraudReportResponse)initWithCoder:(id)a3
{
  id v4;
  AMSFraudReportResponse *v5;
  uint64_t v6;
  NSString *nameSpace;
  uint64_t v8;
  NSString *evaluatedElement;
  uint64_t v10;
  NSString *finalizedElement;
  uint64_t v12;
  NSString *proof;
  uint64_t v14;
  NSString *keyID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSFraudReportResponse;
  v5 = -[AMSFraudReportResponse init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
    v6 = objc_claimAutoreleasedReturnValue();
    nameSpace = v5->_nameSpace;
    v5->_nameSpace = (NSString *)v6;

    v5->_reportedScore = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rs"));
    v5->_newScore = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ns"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("evaluatedElement"));
    v8 = objc_claimAutoreleasedReturnValue();
    evaluatedElement = v5->_evaluatedElement;
    v5->_evaluatedElement = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finalizedElement"));
    v10 = objc_claimAutoreleasedReturnValue();
    finalizedElement = v5->_finalizedElement;
    v5->_finalizedElement = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proof"));
    v12 = objc_claimAutoreleasedReturnValue();
    proof = v5->_proof;
    v5->_proof = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyID"));
    v14 = objc_claimAutoreleasedReturnValue();
    keyID = v5->_keyID;
    v5->_keyID = (NSString *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_nameSpace, a3);
}

- (int64_t)reportedScore
{
  return self->_reportedScore;
}

- (void)setReportedScore:(int64_t)a3
{
  self->_reportedScore = a3;
}

- (int64_t)newScore
{
  return self->_newScore;
}

- (void)setNewScore:(int64_t)a3
{
  self->_newScore = a3;
}

- (NSString)proof
{
  return self->_proof;
}

- (void)setProof:(id)a3
{
  objc_storeStrong((id *)&self->_proof, a3);
}

- (NSString)evaluatedElement
{
  return self->_evaluatedElement;
}

- (void)setEvaluatedElement:(id)a3
{
  objc_storeStrong((id *)&self->_evaluatedElement, a3);
}

- (NSString)finalizedElement
{
  return self->_finalizedElement;
}

- (void)setFinalizedElement:(id)a3
{
  objc_storeStrong((id *)&self->_finalizedElement, a3);
}

- (NSString)keyID
{
  return self->_keyID;
}

- (void)setKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_keyID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_finalizedElement, 0);
  objc_storeStrong((id *)&self->_evaluatedElement, 0);
  objc_storeStrong((id *)&self->_proof, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end
