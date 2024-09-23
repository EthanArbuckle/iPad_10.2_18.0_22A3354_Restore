@implementation HDBackgroundTask

- (HDBackgroundTask)init
{
  return (HDBackgroundTask *)-[HDBackgroundTask _initWithJob:](self, 0);
}

- (_QWORD)_initWithJob:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  uint8_t v8[16];
  objc_super v9;

  v3 = a2;
  if (!a1)
    goto LABEL_11;
  v9.receiver = a1;
  v9.super_class = (Class)HDBackgroundTask;
  a1 = objc_msgSendSuper2(&v9, sel_init);
  if (!a1)
    goto LABEL_11;
  if (!v3)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
LABEL_10:
    v6 = (void *)a1[1];
    a1[1] = v5;

    objc_msgSend(a1, "setShiftsDatesWithSystemClockChanges:", 0);
    objc_msgSend(a1, "setAllowsPowerOptimizedScheduling:", 0);
    goto LABEL_11;
  }
  if (MEMORY[0x1BCCAD334](v3) == MEMORY[0x1E0C812F8])
  {
    v5 = v3;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "HDBackgroundTask initialized with non-dictionary job. Returning nil.", v8, 2u);
  }

  a1 = 0;
LABEL_11:

  return a1;
}

- (void)setShiftsDatesWithSystemClockChanges:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_job, (const char *)*MEMORY[0x1E0D00EC0], a3);
}

- (void)setAllowsPowerOptimizedScheduling:(BOOL)a3
{
  OS_xpc_object *job;
  int64_t v4;

  job = self->_job;
  if (a3)
    v4 = 2;
  else
    v4 = 1;
  xpc_dictionary_set_int64(job, (const char *)*MEMORY[0x1E0D00ED8], v4);
}

- (void)setStartDate:(id)a3
{
  OS_xpc_object *job;
  const char *v4;
  double v5;

  job = self->_job;
  v4 = (const char *)*MEMORY[0x1E0D00ED0];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(job, v4, v5);
}

- (void)setEndDate:(id)a3
{
  OS_xpc_object *job;
  const char *v4;
  double v5;

  job = self->_job;
  v4 = (const char *)*MEMORY[0x1E0D00EC8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(job, v4, v5);
}

- (NSDate)endDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(self->_job, (const char *)*MEMORY[0x1E0D00EC8]));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job, 0);
}

- (BOOL)taskValid
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E0D00EB8]) != 1;
}

- (BOOL)taskSatisfied
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E0D00EB8]) == 2;
}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(self->_job, (const char *)*MEMORY[0x1E0D00ED0]));
}

- (NSDictionary)userContext
{
  void *v2;
  void *v3;

  xpc_dictionary_get_value(self->_job, (const char *)*MEMORY[0x1E0D00EE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (void)setUserContext:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_value(self->_job, (const char *)*MEMORY[0x1E0D00EE0], v4);
    v4 = v5;
  }

}

- (BOOL)shiftsDatesWithSystemClockChanges
{
  return xpc_dictionary_get_BOOL(self->_job, (const char *)*MEMORY[0x1E0D00EC0]);
}

- (BOOL)allowsPowerOptimizedScheduling
{
  return xpc_dictionary_get_int64(self->_job, (const char *)*MEMORY[0x1E0D00ED8]) == 2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDBackgroundTask startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDBackgroundTask endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDBackgroundTask userContext](self, "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HDBackgroundTask <%p> has start date <%@>, end date <%@>, and user context <%@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)taskExpired
{
  return xpc_dictionary_get_BOOL(self->_job, (const char *)*MEMORY[0x1E0D00EB0]);
}

@end
