@implementation BCSCalendarEventData

- (BCSCalendarEventData)initWithICSString:(id)a3
{
  id v4;
  BCSCalendarEventData *v5;
  uint64_t v6;
  NSString *icsString;
  BCSCalendarEventData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSCalendarEventData;
  v5 = -[BCSCalendarEventData init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    icsString = v5->_icsString;
    v5->_icsString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 7;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSCalendarEventData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSCalendarEventData *v6;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icsString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSCalendarEventData initWithICSString:](self, "initWithICSString:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_icsString, CFSTR("icsString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)icsString
{
  return self->_icsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icsString, 0);
}

@end
