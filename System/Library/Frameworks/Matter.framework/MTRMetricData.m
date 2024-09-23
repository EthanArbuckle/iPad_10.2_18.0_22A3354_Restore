@implementation MTRMetricData

- (MTRMetricData)init
{
  int v3;
  const char *v4;
  char v5;

  v3 = 2;
  v4 = "";
  v5 = 0;
  return (MTRMetricData *)objc_msgSend_initWithMetricEvent_(self, a2, (uint64_t)&v3);
}

- (MTRMetricData)initWithMetricEvent:(const MetricEvent *)a3
{
  MTRMetricData *v4;
  MTRMetricData *v5;
  unsigned int var0;
  std::chrono::steady_clock::time_point v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  const char *v15;
  NSNumber *errorCode;
  void *v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  MTRMetricData *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTRMetricData;
  v4 = -[MTRMetricData init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    var0 = a3->var0;
    v4->_type = a3->var0;
    if (var0 >= 2)
    {
      if (var0 != 2)
        goto LABEL_7;
      v7.__d_.__rep_ = 0;
    }
    else
    {
      v7.__d_.__rep_ = (*((std::chrono::steady_clock::time_point (__cdecl **)())*off_256157A10 + 3))().__d_.__rep_;
    }
    v5->_timePoint.__rep_ = v7.__d_.__rep_;
LABEL_7:
    v8 = *((unsigned __int8 *)&a3->var2 + 4);
    if (v8 == 3)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = sub_2340D9FB4((uint64_t)a3);
      objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      errorCode = v5->_errorCode;
      v5->_errorCode = (NSNumber *)v20;
    }
    else
    {
      if (v8 == 2)
      {
        v13 = (void *)MEMORY[0x24BDD16E0];
        v14 = sub_2340D9F90((uint64_t)a3);
        objc_msgSend_numberWithUnsignedInteger_(v13, v15, v14);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 != 1)
        {
LABEL_15:
          v21 = v5;
          goto LABEL_16;
        }
        v9 = (void *)MEMORY[0x24BDD16E0];
        v10 = sub_2340D9F6C((uint64_t)a3);
        objc_msgSend_numberWithInteger_(v9, v11, v10);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      errorCode = v5->_value;
      v5->_value = (NSNumber *)v12;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (void)setDurationFromMetricData:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSNumber *v6;
  NSNumber *duration;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v4, v5, (double)(self->_timePoint.__rep_ - v8[1]) / 1000000.0);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  duration = self->_duration;
  self->_duration = v6;

}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t type;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDD17C8];
  type = self->_type;
  objc_msgSend_value(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v13, (uint64_t)CFSTR("<MTRMetricData: Type %d, Value = %@, Error Code = %@, Duration = %@ us>"), type, v6, v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSNumber)value
{
  return self->_value;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
