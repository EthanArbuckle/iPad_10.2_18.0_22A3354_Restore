@implementation MOEventAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *trends;
  void *v5;
  void *v6;
  id v7;

  trends = self->_trends;
  v7 = a3;
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", trends);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("trends"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_patterns);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("patterns"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_timeAtHomeSubType, CFSTR("timeAtHomeSubtype"));
}

- (MOEventAnalytics)initWithCoder:(id)a3
{
  id v4;
  MOEventAnalytics *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *trends;
  void *v9;
  uint64_t v10;
  NSDictionary *patterns;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventAnalytics;
  v5 = -[MOEventAnalytics init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trends"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    trends = v5->_trends;
    v5->_trends = (NSDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patterns"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    patterns = v5->_patterns;
    v5->_patterns = (NSDictionary *)v10;

    v5->_timeAtHomeSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeAtHomeSubtype"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventAnalytics *v4;

  v4 = objc_alloc_init(MOEventAnalytics);
  objc_storeStrong((id *)&v4->_trends, self->_trends);
  objc_storeStrong((id *)&v4->_patterns, self->_patterns);
  v4->_timeAtHomeSubType = self->_timeAtHomeSubType;
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSDictionary description](self->_trends, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary description](self->_patterns, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("trends data, {%@}, @patterns data, %@"), v4, v5);

  return v6;
}

- (NSDictionary)trends
{
  return self->_trends;
}

- (void)setTrends:(id)a3
{
  objc_storeStrong((id *)&self->_trends, a3);
}

- (NSDictionary)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_patterns, a3);
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_trends, 0);
}

@end
