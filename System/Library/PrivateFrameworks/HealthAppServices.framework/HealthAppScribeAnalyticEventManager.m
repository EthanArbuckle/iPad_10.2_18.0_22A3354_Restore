@implementation HealthAppScribeAnalyticEventManager

- (void)submitEventWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10
{
  uint64_t v10;
  id v11;

  LOWORD(v10) = __PAIR16__(a10, a9);
  -[HealthAppScribeAnalyticEventManager createEventPayloadWithDataType:requestCategory:requestType:requestInterval:hourOfDay:userAction:hasHealthDataAuthorization:isFirstInvocation:](self, "createEventPayloadWithDataType:requestCategory:requestType:requestInterval:hourOfDay:userAction:hasHealthDataAuthorization:isFirstInvocation:", a3, a4, a5, a6, a7, a8, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)createEventPayloadWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10
{
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;

  v30 = a3;
  v16 = a4;
  v17 = a7;
  v18 = (objc_class *)MEMORY[0x1E0C99E08];
  v19 = a8;
  v20 = a6;
  v21 = objc_alloc_init(v18);
  v22 = -[HealthAppScribeAnalyticEventManager isImproveHealthAndActivityEnabled](self, "isImproveHealthAndActivityEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("isIHA"));

  v24 = CFSTR("unknown");
  if (a5 == 1)
    v24 = CFSTR("write");
  if (a5)
    v25 = v24;
  else
    v25 = CFSTR("read");
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("requestType"), v30);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("requestInterval"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("userAction"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("isFirstInvocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("isSiriAuthenticated"));

  if (v22)
  {
    objc_msgSend(v31, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("HKDataType"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("requestCategory"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("hourOfDay"));
  }

  return v21;
}

- (void)submitHealthEventWithDescription:(id)a3 requestInterval:(id)a4
{
  id v4;

  -[HealthAppScribeAnalyticEventManager createHealthEventPayloadWithDescription:requestInterval:](self, "createHealthEventPayloadWithDescription:requestInterval:", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)createHealthEventPayloadWithDescription:(id)a3 requestInterval:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v10 = -[HealthAppScribeAnalyticEventManager isImproveHealthAndActivityEnabled](self, "isImproveHealthAndActivityEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("isIHA"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("requestInterval"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("health"), CFSTR("userAction"));
  if (v10)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("HKDataType"));
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "component:fromDate:", 32, v12);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v14);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("hourOfDay"));

  }
  return v9;
}

@end
