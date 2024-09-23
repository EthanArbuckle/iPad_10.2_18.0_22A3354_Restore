@implementation EKAvailabilityCachedSpan

- (EKAvailabilityCachedSpan)initWithSpan:(id)a3
{
  id v4;
  EKAvailabilityCachedSpan *v5;
  EKAvailabilityCachedSpan *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKAvailabilityCachedSpan;
  v5 = -[EKAvailabilityCachedSpan init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EKAvailabilityCachedSpan setSpan:](v5, "setSpan:", v4);
    v7 = (void *)objc_opt_new();
    -[EKAvailabilityCachedSpan setCreationDate:](v6, "setCreationDate:", v7);

  }
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v10.receiver = self;
  v10.super_class = (Class)EKAvailabilityCachedSpan;
  -[EKAvailabilityCachedSpan description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  -[EKAvailabilityCachedSpan creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("creationDate"), v6);

  -[EKAvailabilityCachedSpan span](self, "span");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withObject:", CFSTR("span"), v7);

  objc_msgSend(v5, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (EKAvailabilitySpan)span
{
  return self->_span;
}

- (void)setSpan:(id)a3
{
  objc_storeStrong((id *)&self->_span, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_span, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
