@implementation FCUserEventHistoryPruningPolicy

- (FCUserEventHistoryPruningPolicy)initWithType:(int64_t)a3 value:(unint64_t)a4
{
  FCUserEventHistoryPruningPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCUserEventHistoryPruningPolicy;
  result = -[FCUserEventHistoryPruningPolicy init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCUserEventHistoryPruningPolicy type](self, "type");
  if (v4 > 3)
    v5 = CFSTR("MaxTotalSize");
  else
    v5 = off_1E463F720[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("; type: %@"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("; value: %lu"), -[FCUserEventHistoryPruningPolicy value](self, "value"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

@end
