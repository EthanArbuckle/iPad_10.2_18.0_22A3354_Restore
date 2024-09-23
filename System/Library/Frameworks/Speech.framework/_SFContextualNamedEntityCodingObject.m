@implementation _SFContextualNamedEntityCodingObject

- (_SFContextualNamedEntityCodingObject)initWithContent:(id)a3 sourceFramework:(int64_t)a4 score:(id)a5 category:(id)a6 language:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _SFContextualNamedEntityCodingObject *v16;
  uint64_t v17;
  NSString *content;
  uint64_t v19;
  NSNumber *score;
  uint64_t v21;
  NSNumber *category;
  uint64_t v23;
  NSString *language;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_SFContextualNamedEntityCodingObject;
  v16 = -[_SFContextualNamedEntityCodingObject init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    content = v16->_content;
    v16->_content = (NSString *)v17;

    v16->_sourceFramework = a4;
    v19 = objc_msgSend(v13, "copy");
    score = v16->_score;
    v16->_score = (NSNumber *)v19;

    v21 = objc_msgSend(v14, "copy");
    category = v16->_category;
    v16->_category = (NSNumber *)v21;

    v23 = objc_msgSend(v15, "copy");
    language = v16->_language;
    v16->_language = (NSString *)v23;

  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *content;
  id v5;

  content = self->_content;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", content, CFSTR("_content"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceFramework, CFSTR("_sourceFramework"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("_score"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("_category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("_language"));

}

- (_SFContextualNamedEntityCodingObject)initWithCoder:(id)a3
{
  id v4;
  _SFContextualNamedEntityCodingObject *v5;
  uint64_t v6;
  NSString *content;
  uint64_t v8;
  NSNumber *score;
  uint64_t v10;
  NSNumber *category;
  uint64_t v12;
  NSString *language;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFContextualNamedEntityCodingObject;
  v5 = -[_SFContextualNamedEntityCodingObject init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v6;

    v5->_sourceFramework = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sourceFramework"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_score"));
    v8 = objc_claimAutoreleasedReturnValue();
    score = v5->_score;
    v5->_score = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_category"));
    v10 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_language"));
    v12 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v12;

  }
  return v5;
}

- (NSString)content
{
  return self->_content;
}

- (int64_t)sourceFramework
{
  return self->_sourceFramework;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
