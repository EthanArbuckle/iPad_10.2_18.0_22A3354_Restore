@implementation MDDateFormatter

- (MDDateFormatter)init
{
  MDDateFormatter *v2;
  uint64_t v3;
  NSISO8601DateFormatter *formatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDDateFormatter;
  v2 = -[MDDateFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    formatter = v2->_formatter;
    v2->_formatter = (NSISO8601DateFormatter *)v3;

  }
  return v2;
}

- (id)iso8601StringPlusPrecisionForDate:(id)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_stringFromDate_(self->_formatter, a2, (uint64_t)a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v6;
  if (v4)
    objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%@_%@"), v8, v6, CFSTR("DAY"));
  else
    objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%@_%@"), v8, v6, CFSTR("SECOND"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
