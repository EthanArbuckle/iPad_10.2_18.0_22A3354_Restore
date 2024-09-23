@implementation CTPendingPlan

- (CTPendingPlan)initWithSmdpURL:(id)a3 matchingID:(id)a4
{
  id v7;
  id v8;
  CTPendingPlan *v9;
  CTPendingPlan *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTPendingPlan;
  v9 = -[CTPendingPlan init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_smdpURL, a3);
    objc_storeStrong((id *)&v10->_matchingID, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", smdpURL=%@"), self->_smdpURL);
  if (self->_matchingID)
    objc_msgSend(v3, "appendFormat:", CFSTR(", matchingID=%@"), self->_matchingID);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPendingPlan;
  if (-[CTPlan isEqual:](&v15, sel_isEqual_, v6))
  {
    -[CTPendingPlan smdpURL](self, "smdpURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "smdpURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[CTPendingPlan smdpURL](self, "smdpURL"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "smdpURL"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[CTPendingPlan matchingID](self, "matchingID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "matchingID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v9 = 1;
      }
      else
      {
        -[CTPendingPlan matchingID](self, "matchingID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "matchingID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v12, "isEqual:", v13);

      }
      if (v7 == v8)
        goto LABEL_11;
    }
    else
    {
      v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSString copyWithZone:](self->_smdpURL, "copyWithZone:", a3);
  v7 = (void *)-[NSString copyWithZone:](self->_matchingID, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithSmdpURL:matchingID:", v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPendingPlan)initWithCoder:(id)a3
{
  id v4;
  CTPendingPlan *v5;
  uint64_t v6;
  NSString *smdpURL;
  uint64_t v8;
  NSString *matchingID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPendingPlan;
  v5 = -[CTPlan initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smdpURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    smdpURL = v5->_smdpURL;
    v5->_smdpURL = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingID"));
    v8 = objc_claimAutoreleasedReturnValue();
    matchingID = v5->_matchingID;
    v5->_matchingID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *matchingID;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CTPendingPlan;
  -[CTPlan encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_smdpURL, CFSTR("smdpURL"));
  matchingID = self->_matchingID;
  if (matchingID)
    objc_msgSend(v4, "encodeObject:forKey:", matchingID, CFSTR("matchingID"));

}

- (NSString)smdpURL
{
  return self->_smdpURL;
}

- (NSString)matchingID
{
  return self->_matchingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingID, 0);
  objc_storeStrong((id *)&self->_smdpURL, 0);
}

@end
