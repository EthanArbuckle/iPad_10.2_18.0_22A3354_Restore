@implementation FUStepTime

- (FUStepTime)initWithType:(unint64_t)a3 date:(id)a4
{
  id v6;
  FUStepTime *v7;
  FUStepTime *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FUStepTime;
  v7 = -[FUStepTime init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[FUStepTime setType:](v7, "setType:", a3);
    -[FUStepTime setDate:](v8, "setDate:", v6);
  }

  return v8;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[FUStepTime type](self, "type");
  v4 = CFSTR("Unknown type");
  if (v3 == 2)
    v4 = CFSTR("Take off / Touch down");
  if (v3 == 1)
    v5 = CFSTR("Gate");
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[FUStepTime date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%@)"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = -[FUStepTime type](self, "type"), v5 == objc_msgSend(v4, "type")))
  {
    -[FUStepTime date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[FUStepTime date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[FUStepTime type](self, "type"));
  -[FUStepTime date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDate:", v6);

  return v4;
}

- (double)timeIntervalSinceNow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[FUUtils testDate](FUUtils, "testDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUStepTime date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  else
    objc_msgSend(v4, "timeIntervalSinceNow");
  v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[FUStepTime type](self, "type"))
    objc_msgSend(v6, "encodeInteger:forKey:", -[FUStepTime type](self, "type"), CFSTR("type"));
  -[FUStepTime date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUStepTime date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("date"));

  }
}

- (FUStepTime)initWithCoder:(id)a3
{
  id v4;
  FUStepTime *v5;
  void *v6;
  FUStepTime *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FUStepTime;
  v5 = -[FUStepTime init](&v9, sel_init);
  if (v5)
  {
    -[FUStepTime setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUStepTime setDate:](v5, "setDate:", v6);

    v7 = v5;
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
