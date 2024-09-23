@implementation AFDisambiguationInfo

- (AFDisambiguationInfo)init
{
  AFDisambiguationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFDisambiguationInfo;
  result = -[AFDisambiguationInfo init](&v3, sel_init);
  if (result)
    result->_version = 0;
  return result;
}

- (AFDisambiguationInfo)initWithCoder:(id)a3
{
  id v4;
  AFDisambiguationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *history;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDisambiguationInfo;
  v5 = -[AFDisambiguationInfo init](&v12, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_history"));
    v9 = objc_claimAutoreleasedReturnValue();
    history = v5->_history;
    v5->_history = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_history, CFSTR("_history"));

}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
