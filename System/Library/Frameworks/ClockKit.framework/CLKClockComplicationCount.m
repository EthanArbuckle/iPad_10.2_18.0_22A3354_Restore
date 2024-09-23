@implementation CLKClockComplicationCount

- (CLKClockComplicationCount)initWithApplicationIdentifier:(id)a3 countOnFace:(int64_t)a4 isWidget:(BOOL)a5
{
  id v8;
  CLKClockComplicationCount *v9;
  uint64_t v10;
  NSString *applicationIdentifier;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKClockComplicationCount;
  v9 = -[CLKClockComplicationCount init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    applicationIdentifier = v9->_applicationIdentifier;
    v9->_applicationIdentifier = (NSString *)v10;

    v9->_countOnFace = a4;
    v9->_widget = a5;
  }

  return v9;
}

- (id)mergedWith:(id)a3
{
  _QWORD *v4;
  CLKClockComplicationCount *v5;
  int v6;
  BOOL widget;

  v4 = a3;
  v5 = objc_alloc_init(CLKClockComplicationCount);
  objc_storeStrong((id *)&v5->_applicationIdentifier, self->_applicationIdentifier);
  v5->_countOnFace = self->_countOnFace + v4[3];
  v6 = *((unsigned __int8 *)v4 + 8);

  if (v6)
    widget = 1;
  else
    widget = self->_widget;
  v5->_widget = widget;
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_applicationIdentifier);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_countOnFace);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_widget);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CLKClockComplicationCount *v4;
  BOOL v5;

  v4 = (CLKClockComplicationCount *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_applicationIdentifier, "isEqualToString:", v4->_applicationIdentifier)
      && self->_countOnFace == v4->_countOnFace
      && self->_widget == v4->_widget;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_countOnFace, CFSTR("countOnFace"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_widget, CFSTR("widget"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_countOnFace, CFSTR("countOnFace"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_widget, CFSTR("widget"));

}

- (CLKClockComplicationCount)initWithCoder:(id)a3
{
  id v4;
  CLKClockComplicationCount *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKClockComplicationCount;
  v5 = -[CLKClockComplicationCount init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    v5->_countOnFace = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("countOnFace"));
    v5->_widget = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("widget"));
  }

  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int64_t)countOnFace
{
  return self->_countOnFace;
}

- (BOOL)isWidget
{
  return self->_widget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
