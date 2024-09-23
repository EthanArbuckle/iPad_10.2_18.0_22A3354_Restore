@implementation CTStewieExitContext

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTStewieExitContext reason](self, "reason");
  if ((unint64_t)(v4 - 1) > 3)
    v5 = "CTStewieExitReasonUnknown";
  else
    v5 = off_1E1534730[v4 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieExitContext *v4;
  int64_t v5;
  BOOL v6;

  v4 = (CTStewieExitContext *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CTStewieExitContext reason](self, "reason");
      v6 = v5 == -[CTStewieExitContext reason](v4, "reason");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setReason:", -[CTStewieExitContext reason](self, "reason"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieExitContext reason](self, "reason"), CFSTR("reason"));

}

- (CTStewieExitContext)initWithCoder:(id)a3
{
  id v4;
  CTStewieExitContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieExitContext;
  v5 = -[CTStewieExitContext init](&v7, sel_init);
  if (v5)
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end
