@implementation EMFollowUp

- (EMFollowUp)initWithStartDate:(id)a3 endDate:(id)a4 jsonStringForModelEvaluationForSuggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMFollowUp *v11;
  uint64_t v12;
  EFPair *pair;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMFollowUp;
  v11 = -[EMFollowUp init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    pair = v11->_pair;
    v11->_pair = (EFPair *)v12;

    objc_storeStrong((id *)&v11->_jsonStringForModelEvaluationForSuggestions, a5);
  }

  return v11;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[EMFollowUp pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[EMFollowUp pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[EMFollowUp pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isActive
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EMFollowUp containsDate:](self, "containsDate:", v3);

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  EMFollowUp *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (EMFollowUp *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMFollowUp pair](self, "pair");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMFollowUp pair](v4, "pair");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToPair:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMFollowUp pair](self, "pair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMFollowUp startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFollowUp endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("startDate:%@, endDate:%@, isActive:%d"), v4, v5, -[EMFollowUp isActive](self, "isActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMFollowUp)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EMFollowUp *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_jsonStringForModelEvaluationForSuggestions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMFollowUp initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:](self, "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EMFollowUp startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_startDate"));

  -[EMFollowUp endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_endDate"));

  -[EMFollowUp jsonStringForModelEvaluationForSuggestions](self, "jsonStringForModelEvaluationForSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_jsonStringForModelEvaluationForSuggestions"));

}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    -[EMFollowUp startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", v4))
    {
      -[EMFollowUp endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "ef_isEarlierThanOrEqualDate:", v4) ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSString)jsonStringForModelEvaluationForSuggestions
{
  return self->_jsonStringForModelEvaluationForSuggestions;
}

- (EFPair)pair
{
  return self->_pair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pair, 0);
  objc_storeStrong((id *)&self->_jsonStringForModelEvaluationForSuggestions, 0);
}

@end
