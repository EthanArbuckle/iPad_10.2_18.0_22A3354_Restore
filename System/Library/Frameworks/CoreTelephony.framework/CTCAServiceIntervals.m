@implementation CTCAServiceIntervals

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCAServiceIntervals startsAt](self, "startsAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", startsAt=%@"), v4);

  -[CTCAServiceIntervals endsAt](self, "endsAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", endsAt=%@"), v5);

  v6 = -[CTCAServiceIntervals atStart](self, "atStart");
  v7 = "out";
  if (v6)
    v7 = "in";
  objc_msgSend(v3, "appendFormat:", CFSTR(", atStart=%s"), v7);
  -[CTCAServiceIntervals changesAt](self, "changesAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", changesAt=%@"), v8);

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
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCAServiceIntervals startsAt](self, "startsAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartsAt:", v7);

  -[CTCAServiceIntervals endsAt](self, "endsAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setEndsAt:", v9);

  objc_msgSend(v5, "setAtStart:", -[CTCAServiceIntervals atStart](self, "atStart"));
  -[CTCAServiceIntervals changesAt](self, "changesAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setChangesAt:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTCAServiceIntervals startsAt](self, "startsAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("startsAt"));

  -[CTCAServiceIntervals endsAt](self, "endsAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("endsAt"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CTCAServiceIntervals atStart](self, "atStart"), CFSTR("atStart"));
  -[CTCAServiceIntervals changesAt](self, "changesAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("changesAt"));

}

- (CTCAServiceIntervals)initWithCoder:(id)a3
{
  id v4;
  CTCAServiceIntervals *v5;
  uint64_t v6;
  NSDate *startsAt;
  uint64_t v8;
  NSDate *endsAt;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *changesAt;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTCAServiceIntervals;
  v5 = -[CTCAServiceIntervals init](&v16, sel_init);
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

    v5->_atStart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("atStart"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("changesAt"));
    v13 = objc_claimAutoreleasedReturnValue();
    changesAt = v5->_changesAt;
    v5->_changesAt = (NSArray *)v13;

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

- (BOOL)atStart
{
  return self->_atStart;
}

- (void)setAtStart:(BOOL)a3
{
  self->_atStart = a3;
}

- (NSArray)changesAt
{
  return self->_changesAt;
}

- (void)setChangesAt:(id)a3
{
  objc_storeStrong((id *)&self->_changesAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesAt, 0);
  objc_storeStrong((id *)&self->_endsAt, 0);
  objc_storeStrong((id *)&self->_startsAt, 0);
}

@end
