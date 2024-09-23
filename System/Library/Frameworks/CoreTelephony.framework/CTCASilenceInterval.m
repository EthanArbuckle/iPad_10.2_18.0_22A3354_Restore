@implementation CTCASilenceInterval

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCASilenceInterval startsAt](self, "startsAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", startsAt=%@"), v4);

  -[CTCASilenceInterval endsAt](self, "endsAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", endsAt=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCASilenceInterval startsAt](self, "startsAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartsAt:", v7);

  -[CTCASilenceInterval endsAt](self, "endsAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setEndsAt:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTCASilenceInterval startsAt](self, "startsAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("startsAt"));

  -[CTCASilenceInterval endsAt](self, "endsAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("endsAt"));

}

- (CTCASilenceInterval)initWithCoder:(id)a3
{
  id v4;
  CTCASilenceInterval *v5;
  uint64_t v6;
  NSDate *startsAt;
  uint64_t v8;
  NSDate *endsAt;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCASilenceInterval;
  v5 = -[CTCASilenceInterval init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startsAt"));
    v6 = objc_claimAutoreleasedReturnValue();
    startsAt = v5->_startsAt;
    v5->_startsAt = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endsAt"));
    v8 = objc_claimAutoreleasedReturnValue();
    endsAt = v5->_endsAt;
    v5->_endsAt = (NSDate *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)startsAt
{
  return self->_startsAt;
}

- (void)setStartsAt:(id)a3
{
  objc_storeStrong((id *)&self->_startsAt, a3);
}

- (NSDate)endsAt
{
  return self->_endsAt;
}

- (void)setEndsAt:(id)a3
{
  objc_storeStrong((id *)&self->_endsAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endsAt, 0);
  objc_storeStrong((id *)&self->_startsAt, 0);
}

@end
