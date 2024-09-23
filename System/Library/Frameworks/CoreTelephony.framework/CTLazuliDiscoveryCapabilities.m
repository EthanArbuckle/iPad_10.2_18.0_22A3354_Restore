@implementation CTLazuliDiscoveryCapabilities

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliDiscoveryCapabilities type](self, "type");
  v6 = -[CTLazuliDiscoveryCapabilities type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliDiscoveryCapabilitiesType(&v6));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliDiscoveryCapabilities:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTLazuliDiscoveryCapabilities type](self, "type");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "type");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliDiscoveryCapabilities *v4;
  CTLazuliDiscoveryCapabilities *v5;
  BOOL v6;

  v4 = (CTLazuliDiscoveryCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliDiscoveryCapabilities isEqualToCTLazuliDiscoveryCapabilities:](self, "isEqualToCTLazuliDiscoveryCapabilities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliDiscoveryCapabilities *v4;

  v4 = +[CTLazuliDiscoveryCapabilities allocWithZone:](CTLazuliDiscoveryCapabilities, "allocWithZone:", a3);
  -[CTLazuliDiscoveryCapabilities setType:](v4, "setType:", self->_type);
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

- (CTLazuliDiscoveryCapabilities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliDiscoveryCapabilities *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliDiscoveryCapabilities;
  v5 = -[CTLazuliDiscoveryCapabilities init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

  }
  return v5;
}

- (CTLazuliDiscoveryCapabilities)initWithReflection:(const DiscoveryCapabilities *)a3
{
  CTLazuliDiscoveryCapabilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliDiscoveryCapabilities;
  v4 = -[CTLazuliDiscoveryCapabilities init](&v6, sel_init);
  if (v4)
    v4->_type = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
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
