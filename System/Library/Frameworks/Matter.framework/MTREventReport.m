@implementation MTREventReport

- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 eventNumber:(id)a4 priority:(unsigned __int8)a5 timestamp:(const Timestamp *)a6 value:(id)a7
{
  unsigned int v9;
  id v13;
  id v14;
  MTREventReport *v15;
  MTREventPath *v16;
  const char *v17;
  uint64_t v18;
  MTREventPath *path;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSNumber *priority;
  const char *v24;
  uint64_t v25;
  NSNumber *timestampValue;
  const char *v27;
  uint64_t v28;
  MTREventReport *v29;
  uint64_t v30;
  NSDate *timestampDate;
  NSError *error;
  objc_super v34;

  v9 = a5;
  v13 = a4;
  v14 = a7;
  v34.receiver = self;
  v34.super_class = (Class)MTREventReport;
  v15 = -[MTREventReport init](&v34, sel_init);
  if (!v15)
    goto LABEL_14;
  v16 = [MTREventPath alloc];
  v18 = objc_msgSend_initWithPath_(v16, v17, (uint64_t)a3);
  path = v15->_path;
  v15->_path = (MTREventPath *)v18;

  objc_storeStrong((id *)&v15->_eventNumber, a4);
  if (v9 < 3)
  {
    v21 = 1;
    if (v9 != 1)
      v21 = 2;
    if (v9)
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, v21);
    else
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    priority = v15->_priority;
    v15->_priority = (NSNumber *)v22;

    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v24, a6->var1);
    v25 = objc_claimAutoreleasedReturnValue();
    timestampValue = v15->_timestampValue;
    v15->_timestampValue = (NSNumber *)v25;

    if (a6->var0 == 1)
    {
      v15->_eventTimeType = 1;
      objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], v27, v28, (double)(a6->var1 % 0x3E8) / 1000.0 + (double)(a6->var1 / 0x3E8));
      v30 = objc_claimAutoreleasedReturnValue();
      timestampDate = v15->_timestampDate;
      v15->_timestampDate = (NSDate *)v30;

      goto LABEL_13;
    }
    if (!a6->var0)
    {
      v15->_eventTimeType = 0;
      v15->_systemUpTime = (double)(a6->var1 % 0x3E8) / 1000.0 + (double)(a6->var1 / 0x3E8);
LABEL_13:
      objc_storeStrong(&v15->_value, a7);
      error = v15->_error;
      v15->_error = 0;

LABEL_14:
      v29 = v15;
      goto LABEL_15;
    }
  }
  v29 = 0;
LABEL_15:

  return v29;
}

- (MTREventReport)initWithPath:(const ConcreteEventPath *)a3 error:(id)a4
{
  id v7;
  MTREventReport *v8;
  MTREventPath *v9;
  const char *v10;
  uint64_t v11;
  MTREventPath *path;
  NSNumber *eventNumber;
  NSNumber *priority;
  NSDate *timestampDate;
  id value;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTREventReport;
  v8 = -[MTREventReport init](&v18, sel_init);
  if (v8)
  {
    v9 = [MTREventPath alloc];
    v11 = objc_msgSend_initWithPath_(v9, v10, (uint64_t)a3);
    path = v8->_path;
    v8->_path = (MTREventPath *)v11;

    eventNumber = v8->_eventNumber;
    v8->_eventNumber = (NSNumber *)&unk_250591B30;

    priority = v8->_priority;
    v8->_priority = (NSNumber *)&unk_250591BA8;

    v8->_eventTimeType = 0;
    v8->_systemUpTime = 0.0;
    timestampDate = v8->_timestampDate;
    v8->_timestampDate = 0;

    value = v8->_value;
    v8->_value = 0;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (MTREventReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  MTREventReport *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  MTREventReport *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSNumber *eventNumber;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSNumber *priority;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *timestampDate;
  __CFString *v47;
  uint64_t v48;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  NSError *v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  void *v68;
  uint64_t v69;
  objc_super v70;

  v6 = responseValue;
  v70.receiver = self;
  v70.super_class = (Class)MTREventReport;
  v7 = -[MTREventReport init](&v70, sel_init);
  if (v7)
  {
    v8 = objc_opt_class();
    if (sub_233CEC478(v6, CFSTR("eventPath"), v8, CFSTR("response-value event path is not an MTREventPath."), error))
    {
      objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("eventPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v6, v11, (uint64_t)CFSTR("error"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_opt_class();
        if ((sub_233CEC478(v6, CFSTR("error"), v13, CFSTR("response-value error is not an NSError."), error) & 1) != 0)
        {
          v66 = objc_msgSend__asConcretePath(v10, v14, v15);
          v67 = (int)v16;
          v7 = (MTREventReport *)(id)objc_msgSend_initWithPath_error_(v7, v16, (uint64_t)&v66, v12);
          v17 = v7;
LABEL_26:

          goto LABEL_27;
        }
LABEL_18:
        v17 = 0;
        goto LABEL_26;
      }
      v18 = objc_opt_class();
      if (!sub_233CEC478(v6, CFSTR("data"), v18, CFSTR("response-value data is not a data-value dictionary."), error))goto LABEL_18;
      objc_msgSend_objectForKeyedSubscript_(v6, v19, (uint64_t)CFSTR("data"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      v69 = 0;
      sub_234104468((uint64_t)&v66);
      if ((sub_233CEF678(&v69, &v68, v20, (uint64_t)&v66, error) & 1) == 0)
      {
        v17 = 0;
LABEL_25:
        sub_233C0BB74(&v68);
        sub_233CAF128(&v69);

        goto LABEL_26;
      }
      v23 = objc_msgSend__asConcretePath(v10, v21, v22);
      v65 = v24;
      v62 = xmmword_2504F06A8;
      v63 = 3061;
      v64 = v23;
      sub_2340393CC((uint64_t)&v64, (uint64_t)&v66, (uint64_t)&v62);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v62 == 182)
      {
        v47 = CFSTR("No known schema for decoding event payload.");
        v48 = 12;
      }
      else
      {
        if (!(_DWORD)v62)
        {
          v26 = objc_opt_class();
          if ((sub_233CEC478(v6, CFSTR("eventNumber"), v26, CFSTR("response-value event number is not an NSNumber"), error) & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v6, v27, (uint64_t)CFSTR("eventNumber"));
            v28 = objc_claimAutoreleasedReturnValue();
            eventNumber = v7->_eventNumber;
            v7->_eventNumber = (NSNumber *)v28;

            v30 = objc_opt_class();
            if (sub_233CEC478(v6, CFSTR("eventPriority"), v30, CFSTR("response-value event priority is not an NSNumber"), error))
            {
              objc_msgSend_objectForKeyedSubscript_(v6, v31, (uint64_t)CFSTR("eventPriority"));
              v32 = objc_claimAutoreleasedReturnValue();
              priority = v7->_priority;
              v7->_priority = (NSNumber *)v32;

              v34 = objc_opt_class();
              if (sub_233CEC478(v6, CFSTR("eventTimeType"), v34, CFSTR("response-value event time type is not an NSNumber"), error))
              {
                objc_msgSend_objectForKeyedSubscript_(v6, v35, (uint64_t)CFSTR("eventTimeType"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_unsignedIntegerValue(v36, v37, v38))
                {
                  if (objc_msgSend_unsignedIntegerValue(v36, v39, v40) == 1)
                  {
                    v43 = objc_opt_class();
                    if (sub_233CEC478(v6, CFSTR("eventTimestampDate"), v43, CFSTR("response-value event timestampe is not an NSDate"), error))
                    {
                      objc_msgSend_objectForKeyedSubscript_(v6, v44, (uint64_t)CFSTR("eventTimestampDate"));
                      v45 = objc_claimAutoreleasedReturnValue();
                      timestampDate = v7->_timestampDate;
                      v7->_timestampDate = (NSDate *)v45;
LABEL_30:

                      v7->_eventTimeType = objc_msgSend_unsignedIntegerValue(v36, v55, v56);
                      objc_storeStrong((id *)&v7->_path, v10);
                      objc_storeStrong(&v7->_value, v25);
                      v57 = v7->_error;
                      v7->_error = 0;

                      v17 = v7;
LABEL_33:

                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    v58 = (void *)MEMORY[0x24BDD17C8];
                    v59 = objc_msgSend_unsignedLongValue(v36, v41, v42);
                    objc_msgSend_stringWithFormat_(v58, v60, (uint64_t)CFSTR("Invalid event time type: %lu"), v59);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    sub_233CEC58C(v61, 4, error);

                  }
                }
                else
                {
                  v50 = objc_opt_class();
                  if ((sub_233CEC478(v6, CFSTR("eventSystemUpTime"), v50, CFSTR("response-value event system uptime time is not an NSNumber"), error) & 1) != 0)
                  {
                    objc_msgSend_objectForKeyedSubscript_(v6, v51, (uint64_t)CFSTR("eventSystemUpTime"));
                    timestampDate = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_doubleValue(timestampDate, v52, v53);
                    v7->_systemUpTime = v54;
                    goto LABEL_30;
                  }
                }
                v17 = 0;
                goto LABEL_33;
              }
            }
          }
LABEL_23:
          v17 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v47 = CFSTR("Event payload decoding failed schema check.");
        v48 = 13;
      }
      sub_233CEC58C(v47, v48, error);
      goto LABEL_23;
    }
  }
  v17 = 0;
LABEL_27:

  return v17;
}

- (MTREventPath)path
{
  return self->_path;
}

- (NSNumber)eventNumber
{
  return self->_eventNumber;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (MTREventTimeType)eventTimeType
{
  return self->_eventTimeType;
}

- (NSTimeInterval)systemUpTime
{
  return self->_systemUpTime;
}

- (NSDate)timestampDate
{
  return self->_timestampDate;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_timestampDate, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_eventNumber, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_timestampValue, 0);
}

- (NSNumber)timestamp
{
  return self->_timestampValue;
}

@end
