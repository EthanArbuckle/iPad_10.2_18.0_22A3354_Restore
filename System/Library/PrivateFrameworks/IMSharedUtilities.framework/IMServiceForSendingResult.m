@implementation IMServiceForSendingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initAsFinalResult:(BOOL)a3 bestResult:(id)a4 resultsByAccountID:(id)a5
{
  id v9;
  id v10;
  IMServiceForSendingResult *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMServiceForSendingResult;
  v11 = -[IMServiceForSendingResult init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_final = a3;
    objc_storeStrong((id *)&v11->_bestResult, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (IMServiceForSendingResult)initWithCoder:(id)a3
{
  id v4;
  IMServiceForSendingResult *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *resultsByAccountID;
  void *v9;
  uint64_t v10;
  IMServiceReachabilityResult *bestResult;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMServiceForSendingResult;
  v5 = -[IMServiceForSendingResult init](&v13, sel_init);
  if (v5)
  {
    v5->_final = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("final"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("resultsByAccountID"));
    v7 = objc_claimAutoreleasedReturnValue();
    resultsByAccountID = v5->_resultsByAccountID;
    v5->_resultsByAccountID = (NSDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bestResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSDictionary objectForKeyedSubscript:](v5->_resultsByAccountID, "objectForKeyedSubscript:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      bestResult = v5->_bestResult;
      v5->_bestResult = (IMServiceReachabilityResult *)v10;

    }
  }

  return v5;
}

- (id)resultsForServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IMServiceForSendingResult resultsByAccountID](self, "resultsByAccountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19E27CD5C;
  v10[3] = &unk_1E3FB59B0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", self->_final, CFSTR("final"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_resultsByAccountID, CFSTR("resultsByAccountID"));
  if (self->_bestResult)
  {
    -[NSDictionary allKeysForObject:](self->_resultsByAccountID, "allKeysForObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("bestResult"));

  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[IMServiceForSendingResult isFinal](self, "isFinal"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[IMServiceForSendingResult bestResult](self, "bestResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceForSendingResult resultsByAccountID](self, "resultsByAccountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [isFinal: %@ bestResult: %@ resultsByAccountID: %@]>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (IMServiceReachabilityResult)bestResult
{
  return self->_bestResult;
}

- (NSDictionary)resultsByAccountID
{
  return self->_resultsByAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByAccountID, 0);
  objc_storeStrong((id *)&self->_bestResult, 0);
}

@end
