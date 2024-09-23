@implementation ATXTimeContext

- (ATXTimeContext)initWithType:(int64_t)a3
{
  ATXTimeContext *v4;
  ATXTimeContext *v5;
  ATXTimeContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXTimeContext;
  v4 = -[ATXTimeContext init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_contextType = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeContext)initWithCoder:(id)a3
{
  return -[ATXTimeContext initWithType:](self, "initWithType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXTimeContext contextType](self, "contextType"), CFSTR("type"));

}

- (NSString)title
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[ATXTimeContext contextType](self, "contextType");
  v3 = CFSTR("Unknown");
  if (v2 == 1)
    v3 = CFSTR("Meet Your Goals");
  if (v2)
    return &v3->isa;
  else
    return (NSString *)CFSTR("Relax With Your Favorites");
}

- (BOOL)isEqual:(id)a3
{
  ATXTimeContext *v4;
  ATXTimeContext *v5;
  BOOL v6;

  v4 = (ATXTimeContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTimeContext isEqualToATXTimeContext:](self, "isEqualToATXTimeContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXTimeContext:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "contextType");
  return v4 == -[ATXTimeContext contextType](self, "contextType");
}

- (int64_t)contextType
{
  return self->_contextType;
}

@end
