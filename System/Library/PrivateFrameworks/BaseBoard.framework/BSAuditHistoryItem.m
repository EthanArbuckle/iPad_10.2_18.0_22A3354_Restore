@implementation BSAuditHistoryItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)itemWithString:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[BSAuditHistoryItem _initWithString:](objc_alloc((Class)a1), v4);

  return v5;
}

- (_QWORD)_initWithString:(_QWORD *)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSAuditHistoryItem;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      v5 = (void *)a1[1];
      a1[1] = v4;

      v6 = objc_msgSend(v3, "copy");
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

+ (id)itemWithWithFormat:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v8);
  v6 = -[BSAuditHistoryItem _initWithString:](objc_alloc((Class)a1), v5);

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  if (self)
  {
    if (qword_1ECD39810 != -1)
      dispatch_once(&qword_1ECD39810, &__block_literal_global_4);
    v3 = (id)_MergedGlobals_7;
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "stringFromDate:", self->_date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TIME: %@; DESCRIPTION: %@"), v4, self->_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __36__BSAuditHistoryItem__timeFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_7, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
}

- (BSAuditHistoryItem)initWithXPCDictionary:(id)a3
{
  id v4;
  BSAuditHistoryItem *v5;
  uint64_t v6;
  NSDate *date;
  const char *v8;
  NSString *description;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSAuditHistoryItem;
  v5 = -[BSAuditHistoryItem init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "date"));
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "desc");
    description = v5->_description;
    v5->_description = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  BSSerializeDoubleToXPCDictionaryWithKey(v5, "date", v4);
  BSSerializeStringToXPCDictionaryWithKey(self->_description, v5, "desc");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAuditHistoryItem)initWithCoder:(id)a3
{
  id v4;
  BSAuditHistoryItem *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSString *description;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSAuditHistoryItem;
  v5 = -[BSAuditHistoryItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desc"));
    v8 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_description, CFSTR("desc"));

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)value
{
  return self->_description;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
