@implementation CTLazuliSuggestedActionDevice

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliSuggestedActionDevice type](self, "type");
  v6 = -[CTLazuliSuggestedActionDevice type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliDeviceActionType(&v6));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDevice:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTLazuliSuggestedActionDevice type](self, "type");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "type");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionDevice *v4;
  CTLazuliSuggestedActionDevice *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionDevice *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionDevice isEqualToCTLazuliSuggestedActionDevice:](self, "isEqualToCTLazuliSuggestedActionDevice:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionDevice *v4;

  v4 = +[CTLazuliSuggestedActionDevice allocWithZone:](CTLazuliSuggestedActionDevice, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionDevice setType:](v4, "setType:", self->_type);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kTypeKey"));

}

- (CTLazuliSuggestedActionDevice)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionDevice *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliSuggestedActionDevice;
  v5 = -[CTLazuliSuggestedActionDevice init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

  }
  return v5;
}

- (CTLazuliSuggestedActionDevice)initWithReflection:(const SuggestedActionDevice *)a3
{
  CTLazuliSuggestedActionDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliSuggestedActionDevice;
  v4 = -[CTLazuliSuggestedActionDevice init](&v6, sel_init);
  if (v4)
    v4->_type = encode_CTLazuliChatBotMediaLabelType(a3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
