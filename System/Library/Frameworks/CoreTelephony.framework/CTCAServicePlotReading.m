@implementation CTCAServicePlotReading

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCAServicePlotReading at](self, "at");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", at=%@"), v4);

  -[CTCAServicePlotReading targets](self, "targets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", targets=%@"), v5);

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
  -[CTCAServicePlotReading at](self, "at");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAt:", v7);

  -[CTCAServicePlotReading targets](self, "targets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargets:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTCAServicePlotReading at](self, "at");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("at"));

  -[CTCAServicePlotReading targets](self, "targets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("targets"));

}

- (CTCAServicePlotReading)initWithCoder:(id)a3
{
  id v4;
  CTCAServicePlotReading *v5;
  uint64_t v6;
  NSDate *at;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *targets;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTCAServicePlotReading;
  v5 = -[CTCAServicePlotReading init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("at"));
    v6 = objc_claimAutoreleasedReturnValue();
    at = v5->_at;
    v5->_at = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("targets"));
    v11 = objc_claimAutoreleasedReturnValue();
    targets = v5->_targets;
    v5->_targets = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)at
{
  return self->_at;
}

- (void)setAt:(id)a3
{
  objc_storeStrong((id *)&self->_at, a3);
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  objc_storeStrong((id *)&self->_targets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_at, 0);
}

@end
