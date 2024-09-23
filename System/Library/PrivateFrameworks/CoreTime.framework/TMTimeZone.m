@implementation TMTimeZone

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMTimeZone;
  -[TMTimeZone dealloc](&v3, sel_dealloc);
}

- (TMTimeZone)initWithDictionary:(id)a3
{
  TMTimeZone *v4;

  v4 = -[TMTimeZone init](self, "init");
  if (v4)
  {
    -[TMTimeZone setSource:](v4, "setSource:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource")));
    -[TMTimeZone setOlsonName:](v4, "setOlsonName:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMTimeZone")));
  }
  return v4;
}

- (TMTimeZone)initWithOlsonName:(id)a3 fromSource:(id)a4
{
  TMTimeZone *v6;
  TMTimeZone *v7;

  v6 = -[TMTimeZone init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[TMTimeZone setSource:](v6, "setSource:", a4);
    -[TMTimeZone setOlsonName:](v7, "setOlsonName:", a3);
  }
  return v7;
}

+ (id)timeZoneWithOlsonName:(id)a3 fromSource:(id)a4
{
  return -[TMTimeZone initWithOlsonName:fromSource:]([TMTimeZone alloc], "initWithOlsonName:fromSource:", a3, a4);
}

- (BOOL)hasSameOlsonNameAs:(id)a3
{
  return -[NSString isEqualToString:](-[TMTimeZone olsonName](self, "olsonName"), "isEqualToString:", objc_msgSend(a3, "olsonName"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p (%@: %@)>"), NSStringFromClass(v4), self, self->_source, self->_olsonName);
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)olsonName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOlsonName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
