@implementation BMEventTimeElapsingImplementor

- (BMEventTimeElapsingImplementor)init
{
  BMEventTimeElapsingImplementor *v2;
  BMEventTimeElapsingImplementor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMEventTimeElapsingImplementor;
  v2 = -[BMEventBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BMEventTimeElapsingImplementor setAbsoluteTimestamp:](v2, "setAbsoluteTimestamp:", 0.0);
    -[BMEventTimeElapsingImplementor setDuration:](v3, "setDuration:", 0.0);
  }
  return v3;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->absoluteTimestamp = a3;
}

- (double)absoluteTimestamp
{
  return self->absoluteTimestamp;
}

- (double)duration
{
  return self->duration;
}

- (NSDateInterval)dateInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  v4 = (void *)MEMORY[0x1E0C99D68];
  -[BMEventTimeElapsingImplementor absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEventTimeElapsingImplementor duration](self, "duration");
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v5);

  return (NSDateInterval *)v6;
}

- (void)setDateInterval:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[BMEventTimeElapsingImplementor setAbsoluteTimestamp:](self, "setAbsoluteTimestamp:");

  objc_msgSend(v4, "duration");
  v7 = v6;

  -[BMEventTimeElapsingImplementor setDuration:](self, "setDuration:", v7);
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  id v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  BOOL v14;
  NSObject *v15;

  v5 = a3;
  -[BMEventTimeElapsingImplementor absoluteTimestamp](self, "absoluteTimestamp");
  v7 = v6 > 0.0;
  objc_msgSend(v5, "previousEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMEventTimeElapsingImplementor absoluteTimestamp](self, "absoluteTimestamp");
  v10 = v9;
  objc_msgSend(v8, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v10 >= v13 && v7;

  if (!v14)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMEventTimeElapsingImplementor isValidWithContext:error:].cold.1(v15);

  }
  return v14;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  BOOL v5;
  double v6;

  v5 = -[BMEventTimeElapsingImplementor isValidWithContext:error:](self, "isValidWithContext:error:", a3, a4);
  -[BMEventTimeElapsingImplementor duration](self, "duration");
  return v6 > 0.0 && v5;
}

- (void)isValidWithContext:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "TimeElapsing iterator is invalid", v1, 2u);
}

@end
