@implementation CTLazuliMessageTypingNotification

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageTypingNotification forTime](self, "forTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", forTime = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageTypingNotification:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v5 = a3;
  -[CTLazuliMessageTypingNotification forTime](self, "forTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "forTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CTLazuliMessageTypingNotification forTime](self, "forTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");
  objc_msgSend(v5, "forTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 == objc_msgSend(v9, "longValue");

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageTypingNotification *v4;
  CTLazuliMessageTypingNotification *v5;
  BOOL v6;

  v4 = (CTLazuliMessageTypingNotification *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageTypingNotification isEqualToCTLazuliMessageTypingNotification:](self, "isEqualToCTLazuliMessageTypingNotification:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageTypingNotification *v4;

  v4 = +[CTLazuliMessageTypingNotification allocWithZone:](CTLazuliMessageTypingNotification, "allocWithZone:", a3);
  -[CTLazuliMessageTypingNotification setForTime:](v4, "setForTime:", self->_forTime);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_forTime, CFSTR("kForTimeKey"));
}

- (CTLazuliMessageTypingNotification)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageTypingNotification *v5;
  uint64_t v6;
  NSNumber *forTime;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageTypingNotification;
  v5 = -[CTLazuliMessageTypingNotification init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kForTimeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    forTime = v5->_forTime;
    v5->_forTime = (NSNumber *)v6;

  }
  return v5;
}

- (CTLazuliMessageTypingNotification)initWithReflection:(const void *)a3
{
  CTLazuliMessageTypingNotification *v4;
  CTLazuliMessageTypingNotification *v5;
  uint64_t v6;
  NSNumber *forTime;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageTypingNotification;
  v4 = -[CTLazuliMessageTypingNotification init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a3);
      v6 = objc_claimAutoreleasedReturnValue();
      forTime = v5->_forTime;
      v5->_forTime = (NSNumber *)v6;
    }
    else
    {
      forTime = v4->_forTime;
      v4->_forTime = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)forTime
{
  return self->_forTime;
}

- (void)setForTime:(id)a3
{
  objc_storeStrong((id *)&self->_forTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forTime, 0);
}

@end
