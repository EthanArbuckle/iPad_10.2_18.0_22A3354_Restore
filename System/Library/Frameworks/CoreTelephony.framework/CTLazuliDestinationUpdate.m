@implementation CTLazuliDestinationUpdate

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliDestinationUpdate previous](self, "previous");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", previous = %@"), v4);

  -[CTLazuliDestinationUpdate discovered](self, "discovered");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", discovered = %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isBot = %d"), -[CTLazuliDestinationUpdate isBot](self, "isBot"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliDestinationUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  -[CTLazuliDestinationUpdate previous](self, "previous");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previous");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliDestination:", v6))
  {
    -[CTLazuliDestinationUpdate discovered](self, "discovered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "discovered");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToCTLazuliDestination:", v8))
    {
      v9 = -[CTLazuliDestinationUpdate isBot](self, "isBot");
      v10 = v9 ^ objc_msgSend(v4, "isBot") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliDestinationUpdate *v4;
  CTLazuliDestinationUpdate *v5;
  BOOL v6;

  v4 = (CTLazuliDestinationUpdate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliDestinationUpdate isEqualToCTLazuliDestinationUpdate:](self, "isEqualToCTLazuliDestinationUpdate:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliDestinationUpdate *v4;

  v4 = +[CTLazuliDestinationUpdate allocWithZone:](CTLazuliDestinationUpdate, "allocWithZone:", a3);
  -[CTLazuliDestinationUpdate setPrevious:](v4, "setPrevious:", self->_previous);
  -[CTLazuliDestinationUpdate setDiscovered:](v4, "setDiscovered:", self->_discovered);
  -[CTLazuliDestinationUpdate setIsBot:](v4, "setIsBot:", self->_isBot);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_previous, CFSTR("kPreviousKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_discovered, CFSTR("kDiscoveredKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBot, CFSTR("kIsBotKey"));

}

- (CTLazuliDestinationUpdate)initWithCoder:(id)a3
{
  id v4;
  CTLazuliDestinationUpdate *v5;
  uint64_t v6;
  CTLazuliDestination *previous;
  uint64_t v8;
  CTLazuliDestination *discovered;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliDestinationUpdate;
  v5 = -[CTLazuliDestinationUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPreviousKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    previous = v5->_previous;
    v5->_previous = (CTLazuliDestination *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDiscoveredKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    discovered = v5->_discovered;
    v5->_discovered = (CTLazuliDestination *)v8;

    v5->_isBot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsBotKey"));
  }

  return v5;
}

- (CTLazuliDestinationUpdate)initWithReflection:(const void *)a3
{
  CTLazuliDestinationUpdate *v4;
  CTLazuliDestination *v5;
  CTLazuliDestination *previous;
  CTLazuliDestination *v7;
  CTLazuliDestination *discovered;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliDestinationUpdate;
  v4 = -[CTLazuliDestinationUpdate init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", a3);
    previous = v4->_previous;
    v4->_previous = v5;

    v7 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", (char *)a3 + 112);
    discovered = v4->_discovered;
    v4->_discovered = v7;

    v4->_isBot = *((_BYTE *)a3 + 224);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
  objc_storeStrong((id *)&self->_previous, a3);
}

- (CTLazuliDestination)discovered
{
  return self->_discovered;
}

- (void)setDiscovered:(id)a3
{
  objc_storeStrong((id *)&self->_discovered, a3);
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovered, 0);
  objc_storeStrong((id *)&self->_previous, 0);
}

@end
