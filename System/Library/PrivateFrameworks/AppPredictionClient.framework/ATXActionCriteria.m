@implementation ATXActionCriteria

- (ATXActionCriteria)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  ATXActionCriteria *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasStartDate](v5, "hasStartDate"))
      {
        v6 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[NSObject startDate](v5, "startDate");
        v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        v7 = 0;
      }
      if (-[NSObject hasEndDate](v5, "hasEndDate"))
      {
        v9 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[NSObject endDate](v5, "endDate");
        v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        v10 = 0;
      }
      -[NSObject predicate](v5, "predicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v13 = (void *)MEMORY[0x1A85A4F90]();
        v14 = (void *)MEMORY[0x1E0CB3710];
        v15 = objc_opt_class();
        -[NSObject predicate](v5, "predicate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v16, &v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v27;

        objc_autoreleasePoolPop(v13);
        if (v18)
        {
          __atxlog_handle_default();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[ATXActionCriteria initWithProto:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

        }
      }
      else
      {
        v17 = 0;
      }
      self = -[ATXActionCriteria initWithStartDate:endDate:lockScreenEligible:predicate:](self, "initWithStartDate:endDate:lockScreenEligible:predicate:", v7, v10, -[NSObject isLockScreenEligible](v5, "isLockScreenEligible"), v17);

      v8 = self;
    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXActionCriteria initWithProto:].cold.2((uint64_t)self, v5);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (ATXActionCriteria)initWithStartDate:(id)a3 endDate:(id)a4 lockScreenEligible:(BOOL)a5 predicate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  ATXActionCriteria *v14;
  ATXActionCriteria *v15;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *endDate;
  objc_class *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v10 = 0;
    }
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v10 && objc_msgSend(v10, "compare:", v11) == 1)
      {
        __atxlog_handle_default();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v25 = v22;
          v26 = 2112;
          v27 = v10;
          v28 = 2112;
          v29 = v11;
          _os_log_fault_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_FAULT, "%@: tried to initialize startDate must be before endDate %@ : %@", buf, 0x20u);

        }
        v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {

      v11 = 0;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)ATXActionCriteria;
  v15 = -[ATXActionCriteria init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    v18 = objc_msgSend(v11, "copy");
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v18;

    v15->_lockScreenEligible = a5;
    objc_storeStrong((id *)&v15->_predicate, a6);
  }
  self = v15;
  v14 = self;
LABEL_15:

  return v14;
}

- (ATXActionCriteria)init
{
  return -[ATXActionCriteria initWithStartDate:endDate:lockScreenEligible:predicate:](self, "initWithStartDate:endDate:lockScreenEligible:predicate:", 0, 0, 0, 0);
}

+ (id)predicateValidForDNDStatusOn:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("doNotDisturb==%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateValidForAirplaneModeOn:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("airplaneMode==%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDateInterval)dateInterval
{
  id v3;
  NSDate *startDate;
  void *v5;
  void *v6;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  startDate = self->_startDate;
  v5 = startDate;
  if (!startDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_endDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5, v8);

    if (startDate)
      return (NSDateInterval *)v6;
    goto LABEL_5;
  }
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5);
  if (!startDate)
LABEL_5:

  return (NSDateInterval *)v6;
}

- (BOOL)isRelevant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSPredicate *predicate;
  ATXActionCriteriaPredicateChecker *v9;
  BOOL v10;

  v4 = a3;
  -[ATXActionCriteria dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsDate:", v6);

  if (!v7
    || objc_msgSend(v4, "lockScreen")
    && !-[ATXActionCriteria lockScreenEligible](self, "lockScreenEligible"))
  {
    goto LABEL_11;
  }
  predicate = self->_predicate;
  if (!predicate)
    goto LABEL_10;
  if ((-[NSPredicate _allowsEvaluation](predicate, "_allowsEvaluation") & 1) == 0)
  {
    v9 = -[ATXActionCriteriaPredicateChecker initWithObject:]([ATXActionCriteriaPredicateChecker alloc], "initWithObject:", v4);
    if (-[ATXActionCriteriaPredicateChecker isValid:](v9, "isValid:", self->_predicate))
      -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");

  }
  if (-[NSPredicate evaluateWithObject:](self->_predicate, "evaluateWithObject:", v4))
LABEL_10:
    v10 = 1;
  else
LABEL_11:
    v10 = 0;

  return v10;
}

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("startDate");
  dateToJson(self->_startDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("endDate");
  dateToJson(self->_endDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("isLockScreenEligible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lockScreenEligible);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("predicate");
  -[NSPredicate description](self->_predicate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lockScreenEligible, CFSTR("lockScreenEligible"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));

}

- (ATXActionCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ATXActionCriteria *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockScreenEligible"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXActionCriteria initWithStartDate:endDate:lockScreenEligible:predicate:](self, "initWithStartDate:endDate:lockScreenEligible:predicate:", v5, v6, v7, v8);
  return v9;
}

- (ATXActionCriteria)initWithProtoData:(id)a3
{
  id v4;
  ATXPBActionCriteria *v5;
  ATXActionCriteria *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBActionCriteria initWithData:]([ATXPBActionCriteria alloc], "initWithData:", v4);

    self = -[ATXActionCriteria initWithProto:](self, "initWithProto:", v5);
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

  -[ATXActionCriteria proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  ATXPBActionCriteria *v3;
  NSDate *startDate;
  NSDate *endDate;
  uint64_t v6;
  void *v7;
  NSPredicate *predicate;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v3 = objc_alloc_init(ATXPBActionCriteria);
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](startDate, "timeIntervalSinceReferenceDate");
    -[ATXPBActionCriteria setStartDate:](v3, "setStartDate:");
  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](endDate, "timeIntervalSinceReferenceDate");
    -[ATXPBActionCriteria setEndDate:](v3, "setEndDate:");
  }
  v6 = -[ATXPBActionCriteria setIsLockScreenEligible:](v3, "setIsLockScreenEligible:", self->_lockScreenEligible);
  if (self->_predicate)
  {
    v7 = (void *)MEMORY[0x1A85A4F90](v6);
    predicate = self->_predicate;
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", predicate, 1, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    -[ATXPBActionCriteria setPredicate:](v3, "setPredicate:", v9);

    objc_autoreleasePoolPop(v7);
    if (v10)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXActionCriteria proto].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  return v3;
}

- (id)description
{
  id v3;
  NSDate *startDate;
  NSDate *endDate;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  startDate = self->_startDate;
  endDate = self->_endDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lockScreenEligible);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<ATXActionCriteria startDate: %@, endDate: %@, lockScreenEligible: %@, predicate: %@"), startDate, endDate, v6, self->_predicate);

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)lockScreenEligible
{
  return self->_lockScreenEligible;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)initWithProto:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not unarchive predicate via protobufs: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBActionCriteria proto", (uint8_t *)&v5, 0xCu);

}

- (void)proto
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not archive predicate via protobufs: %@", a5, a6, a7, a8, 2u);
}

@end
