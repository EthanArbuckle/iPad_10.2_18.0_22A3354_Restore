@implementation ATXPredictionTimeContext

- (ATXPredictionTimeContext)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  ATXPredictionTimeContext *v11;
  NSObject *v12;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXPredictionTimeContext initWithProto:].cold.1((uint64_t)self, v12);

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E0C99D68];
  v6 = v4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "date");
  v9 = v8;

  v10 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:", v9);
  self = -[ATXPredictionTimeContext initWithDate:](self, "initWithDate:", v10);

  v11 = self;
LABEL_8:

  return v11;
}

- (ATXPredictionTimeContext)initWithDate:(id)a3
{
  id v4;
  ATXPredictionTimeContext *v5;
  ATXPredictionTimeContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXPredictionTimeContext;
  v5 = -[ATXPredictionTimeContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ATXPredictionTimeContext setDate:](v5, "setDate:", v4);

  return v6;
}

- (void)setDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  char v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 544, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  self->_absoluteDate = v7;
  self->_dayOfWeek = objc_msgSend(v6, "weekday") - 1;
  self->_timeOfDay = objc_msgSend(v6, "hour");
  v8 = objc_msgSend(v9, "isDateInWeekend:", v5);

  self->_dateInWeekend = v8;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDate:", self->_absoluteDate);
  return v3;
}

- (NSDate)date
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteDate);
}

- (id)description
{
  void *v2;
  void *v3;

  -[ATXPredictionTimeContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("date");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPredictionTimeContext date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("dayOfWeek");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dayOfWeek);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("timeOfDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeOfDay);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("dateInWeekend");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dateInWeekend);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ATXPredictionTimeContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionTimeContext *v5;
  ATXPredictionTimeContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionTimeContext initWithData:]([ATXPBPredictionTimeContext alloc], "initWithData:", v4);

    self = -[ATXPredictionTimeContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionTimeContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionTimeContext *v4;
  ATXPredictionTimeContext *v5;
  BOOL v6;

  v4 = (ATXPredictionTimeContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionTimeContext isEqualToATXPredictionTimeContext:](self, "isEqualToATXPredictionTimeContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionTimeContext:(id)a3
{
  double *v4;
  double v5;
  BOOL v6;

  v4 = (double *)a3;
  v5 = self->_absoluteDate - v4[1];
  if (v5 < 0.0)
    v5 = -v5;
  v6 = v5 <= 2.22044605e-16
    && self->_dayOfWeek == *((_DWORD *)v4 + 5)
    && self->_timeOfDay == *((_DWORD *)v4 + 6)
    && self->_dateInWeekend == *((unsigned __int8 *)v4 + 16);

  return v6;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
}

- (BOOL)dateInWeekend
{
  return self->_dateInWeekend;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionTimeContext proto", (uint8_t *)&v5, 0xCu);

}

@end
