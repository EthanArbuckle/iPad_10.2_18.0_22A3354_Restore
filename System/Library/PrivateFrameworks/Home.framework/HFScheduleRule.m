@implementation HFScheduleRule

+ (id)defaultRuleForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFScheduleRule *v8;
  HFScheduleRule *v9;

  if (a3)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 23, 59);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA960]), "initWithStartTime:endTime:", v5, v6);
      v8 = -[HFScheduleRule initWithWeekDayRule:]([HFScheduleRule alloc], "initWithWeekDayRule:", v7);
    }
    else
    {
      if (a3 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleRule.m"), 44, CFSTR("Unknown schedule type [%@]"), v6);
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hf_startOfDay");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA978]), "initWithValidFrom:validUntil:", v5, v6);
      v8 = -[HFScheduleRule initWithYearDayRule:]([HFScheduleRule alloc], "initWithYearDayRule:", v7);
    }
    v9 = v8;

LABEL_9:
    return v9;
  }
  v9 = 0;
  return v9;
}

- (HFScheduleRule)initWithWeekDayRule:(id)a3
{
  id v6;
  HFScheduleRule *v7;
  HFScheduleRule *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFScheduleRule.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weekDayRule"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleRule;
  v7 = -[HFScheduleRule init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_weekDayRule, a3);

  return v8;
}

- (HFScheduleRule)initWithYearDayRule:(id)a3
{
  id v6;
  HFScheduleRule *v7;
  HFScheduleRule *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFScheduleRule.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("yearDayRule"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleRule;
  v7 = -[HFScheduleRule init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_yearDayRule, a3);

  return v8;
}

- (BOOL)isWeekDayRule
{
  void *v2;
  BOOL v3;

  -[HFScheduleRule weekDayRule](self, "weekDayRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isYearDayRule
{
  void *v2;
  BOOL v3;

  -[HFScheduleRule yearDayRule](self, "yearDayRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAllDayWeekDayRule
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v36;
  NSObject *v37;
  HFScheduleRule *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char *v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const char *aSelector;
  char *aSelectora;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  HFScheduleRule *v59;
  __int16 v60;
  char *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  HFScheduleRule *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  _BOOL4 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = -[HFScheduleRule isWeekDayRule](self, "isWeekDayRule");
  HFLogForCategory(0x45uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      -[HFScheduleRule weekDayRule](self, "weekDayRule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v59 = self;
      v60 = 2112;
      v61 = v7;
      v62 = 2112;
      v63 = v8;
      v64 = 2112;
      v65 = self;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Attempting to determine all-day rule for weekDayRule [%@] from schedule rule [%@].", buf, 0x2Au);

    }
    aSelector = a2;

    objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFScheduleRule weekDayRule](self, "weekDayRule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v11);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject dateComponents](v5, "dateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hour");
    v57 = v12;
    v51 = objc_msgSend(v12, "minute");
    objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFScheduleRule weekDayRule](self, "weekDayRule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "dateComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hour");
    v55 = v18;
    v20 = objc_msgSend(v18, "minute");
    -[NSObject hf_startOfDay](v5, "hf_startOfDay");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hour");

    v54 = v21;
    objc_msgSend(v21, "dateComponents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "minute");

    v56 = v17;
    objc_msgSend(v17, "hf_endOfDay");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateComponents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "hour");

    v53 = v26;
    objc_msgSend(v26, "dateComponents");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "minute");

    v47 = v25;
    v48 = v23;
    v31 = v13 == v23 && v51 == v25;
    v32 = v20;
    v33 = v19;
    v36 = v31 && v19 == v28 && v20 == v30;
    HFLogForCategory(0x45uLL);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
      v38 = (HFScheduleRule *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v30);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414850;
      v59 = self;
      v60 = 2112;
      v61 = aSelectora;
      v62 = 2112;
      v63 = v46;
      v64 = 2112;
      v65 = v38;
      v66 = 2112;
      v67 = v39;
      v68 = 2112;
      v69 = v52;
      v70 = 2112;
      v71 = v40;
      v72 = 2112;
      v73 = v41;
      v74 = 2112;
      v75 = v42;
      v76 = 2112;
      v77 = v43;
      v78 = 1024;
      v79 = v36;
      _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEFAULT, "%@:%@ startHour = [%@], startMinute = [%@], endHour = [%@], endMinute = [%@] | startOfDayHour = [%@], startOfDayMinute = [%@], endOfDayHour = [%@], endOfDayMinute = [%@] | isAllDayRule = %{BOOL}d", buf, 0x6Cu);

    }
  }
  else
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v44 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = self;
      v60 = 2112;
      v61 = v44;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Not a weekDayRule. Unabled to determine if schedule rule is an all-day rule.", buf, 0x16u);

    }
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFScheduleRule weekDayRule](self, "weekDayRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[HFScheduleRule yearDayRule](self, "yearDayRule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HFScheduleRule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HFScheduleRule *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFScheduleRule weekDayRule](v4, "weekDayRule");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFScheduleRule weekDayRule](self, "weekDayRule");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[HFScheduleRule yearDayRule](v4, "yearDayRule");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFScheduleRule yearDayRule](self, "yearDayRule");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HFScheduleRule weekDayRule](self, "weekDayRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HFScheduleRule yearDayRule](self, "yearDayRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFScheduleRule weekDayRule](self, "weekDayRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("weekDayRule"));

  -[HFScheduleRule yearDayRule](self, "yearDayRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("yearDayRule"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMWeekDayScheduleRule)weekDayRule
{
  return self->_weekDayRule;
}

- (void)setWeekDayRule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HMYearDayScheduleRule)yearDayRule
{
  return self->_yearDayRule;
}

- (void)setYearDayRule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearDayRule, 0);
  objc_storeStrong((id *)&self->_weekDayRule, 0);
}

@end
