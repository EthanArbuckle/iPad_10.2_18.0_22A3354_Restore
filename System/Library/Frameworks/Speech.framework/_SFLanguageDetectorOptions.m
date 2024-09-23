@implementation _SFLanguageDetectorOptions

- (_SFLanguageDetectorOptions)initWithLanguageConstraints:(id)a3 alternativesCount:(int64_t)a4
{
  id v6;
  _SFLanguageDetectorOptions *v7;
  uint64_t v8;
  NSArray *languageConstraints;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFLanguageDetectorOptions;
  v7 = -[_SFLanguageDetectorOptions init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    languageConstraints = v7->_languageConstraints;
    v7->_languageConstraints = (NSArray *)v8;

    v7->_alternativesCount = a4;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *languageConstraints;
  id v5;

  languageConstraints = self->_languageConstraints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", languageConstraints, CFSTR("_languageConstraints"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alternativesCount, CFSTR("_alternativesCount"));

}

- (_SFLanguageDetectorOptions)initWithCoder:(id)a3
{
  id v4;
  _SFLanguageDetectorOptions *v5;
  uint64_t v6;
  NSArray *languageConstraints;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFLanguageDetectorOptions;
  v5 = -[_SFLanguageDetectorOptions init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_languageConstraints"));
    v6 = objc_claimAutoreleasedReturnValue();
    languageConstraints = v5->_languageConstraints;
    v5->_languageConstraints = (NSArray *)v6;

    v5->_alternativesCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_alternativesCount"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _SFLanguageDetectorOptions *v4;
  _SFLanguageDetectorOptions *v5;
  NSArray *languageConstraints;
  char v7;
  BOOL v8;

  v4 = (_SFLanguageDetectorOptions *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (-[_SFLanguageDetectorOptions isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    languageConstraints = self->_languageConstraints;
    if ((unint64_t)languageConstraints | (unint64_t)v5->_languageConstraints)
      v7 = -[NSArray isEqualToArray:](languageConstraints, "isEqualToArray:");
    else
      v7 = 1;
    if (self->_alternativesCount == v5->_alternativesCount)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)languageConstraints
{
  return self->_languageConstraints;
}

- (int64_t)alternativesCount
{
  return self->_alternativesCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageConstraints, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
