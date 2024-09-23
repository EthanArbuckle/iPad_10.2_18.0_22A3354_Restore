@implementation CTSimDeactivationInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSimDeactivationInfo homePlmn](self, "homePlmn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", homePlmn=%@"), v4);

  -[CTSimDeactivationInfo events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", events=%@"), v5);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *homePlmn;
  id v5;

  homePlmn = self->_homePlmn;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homePlmn, CFSTR("homePlmn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_events, CFSTR("events"));

}

- (CTSimDeactivationInfo)initWithCoder:(id)a3
{
  id v4;
  CTSimDeactivationInfo *v5;
  uint64_t v6;
  NSString *homePlmn;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *events;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSimDeactivationInfo;
  v5 = -[CTSimDeactivationInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homePlmn"));
    v6 = objc_claimAutoreleasedReturnValue();
    homePlmn = v5->_homePlmn;
    v5->_homePlmn = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("events"));
    v11 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSMutableArray *)v11;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTSimDeactivationInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CTSimDeactivationInfo *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[CTSimDeactivationInfo events](v4, "events"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[CTSimDeactivationInfo homePlmn](self, "homePlmn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSimDeactivationInfo homePlmn](v4, "homePlmn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[CTSimDeactivationInfo events](self, "events");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSimDeactivationInfo events](v4, "events");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToArray:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)homePlmn
{
  return self->_homePlmn;
}

- (void)setHomePlmn:(id)a3
{
  objc_storeStrong((id *)&self->_homePlmn, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_homePlmn, 0);
}

@end
