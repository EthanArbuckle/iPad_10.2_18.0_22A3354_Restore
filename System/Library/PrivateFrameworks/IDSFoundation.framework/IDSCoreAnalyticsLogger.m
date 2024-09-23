@implementation IDSCoreAnalyticsLogger

- (IDSCoreAnalyticsLogger)initWithDomain:(id)a3
{
  id v5;
  IDSCoreAnalyticsLogger *v6;
  IDSCoreAnalyticsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCoreAnalyticsLogger;
  v6 = -[IDSCoreAnalyticsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_domain, a3);

  return v7;
}

+ (id)defaultLogger
{
  id v2;
  const char *v3;
  double v4;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithDomain_(v2, v3, (uint64_t)CFSTR("com.apple.IDS"), v4);
}

- (void)logMetric:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void (*v19)(void *, void *);
  void *v20;
  id v21;

  v21 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_domain(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v21, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v13, (uint64_t)CFSTR("%@.%@"), v14, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EE40AC80 != -1)
    dispatch_once(&qword_1EE40AC80, &unk_1E3C1B9B0);
  v19 = (void (*)(void *, void *))off_1EE40ACA8;
  if (off_1EE40ACA8)
  {
    objc_msgSend_dictionaryRepresentation(v21, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19(v15, v20);

  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
