@implementation FHSmartFeatureDisputeDocumentSuggestion

- (FHSmartFeatureDisputeDocumentSuggestion)initWithRankedValue:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  FHSmartFeatureDisputeDocumentSuggestion *v9;

  v6 = a3;
  objc_msgSend(v6, "featureLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureRank");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FHSmartFeatureDisputeDocumentSuggestion _initWithUUID:rankScore:type:](self, "_initWithUUID:rankScore:type:", v7, v8, a4);
  return v9;
}

- (id)_initWithUUID:(id)a3 rankScore:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  FHSmartFeatureDisputeDocumentSuggestion *v11;
  FHSmartFeatureDisputeDocumentSuggestion *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[FHSmartFeatureDisputeDocumentSuggestion init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_UUID, a3);
    objc_storeStrong((id *)&v12->_rankScore, a4);
    v12->_type = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  FHSmartFeatureDisputeDocumentSuggestion *v4;
  FHSmartFeatureDisputeDocumentSuggestion *v5;
  NSString *UUID;
  void *v7;
  NSDecimalNumber *rankScore;
  void *v9;
  unint64_t type;
  BOOL v11;

  v4 = (FHSmartFeatureDisputeDocumentSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    UUID = self->_UUID;
    -[FHSmartFeatureDisputeDocumentSuggestion UUID](v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](UUID, "isEqualToString:", v7))
    {
      rankScore = self->_rankScore;
      -[FHSmartFeatureDisputeDocumentSuggestion rankScore](v5, "rankScore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDecimalNumber isEqualToNumber:](rankScore, "isEqualToNumber:", v9))
      {
        type = self->_type;
        v11 = type == -[FHSmartFeatureDisputeDocumentSuggestion type](v5, "type");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_UUID, "hash");
  v4 = -[NSDecimalNumber hash](self->_rankScore, "hash");
  return self->_type - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 29791;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\","), self->_UUID);
  -[NSDecimalNumber doubleValue](self->_rankScore, "doubleValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%f\"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%lu\"), self->_type);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rankScore, CFSTR("rankScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (FHSmartFeatureDisputeDocumentSuggestion)initWithCoder:(id)a3
{
  id v4;
  FHSmartFeatureDisputeDocumentSuggestion *v5;
  uint64_t v6;
  NSString *UUID;
  uint64_t v8;
  NSDecimalNumber *rankScore;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHSmartFeatureDisputeDocumentSuggestion;
  v5 = -[FHSmartFeatureDisputeDocumentSuggestion init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rankScore"));
    v8 = objc_claimAutoreleasedReturnValue();
    rankScore = v5->_rankScore;
    v5->_rankScore = (NSDecimalNumber *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)rankScore
{
  return self->_rankScore;
}

- (void)setRankScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankScore, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
