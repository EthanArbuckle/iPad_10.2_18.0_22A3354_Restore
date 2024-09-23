@implementation ENXPCTimer

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  double v17;
  ENXPCTimer *v18;

  v14 = a8;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v15, "timeIntervalSinceNow");
  v18 = -[ENXPCTimer initWithName:date:gracePeriod:cadence:priority:options:block:](self, "initWithName:date:gracePeriod:cadence:priority:options:block:", v16, v15, (unint64_t)v17, a6, a7, v14, a5);

  return v18;
}

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  id v16;
  id v17;
  id v18;
  ENXPCTimer *v19;
  ENXPCTimer *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ENXPCTimer;
  v19 = -[ENXPCTimer init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    -[ENXPCTimer setName:](v19, "setName:", v16);
    -[ENXPCTimer setDate:](v20, "setDate:", v17);
    -[ENXPCTimer setGracePeriod:](v20, "setGracePeriod:", a5);
    -[ENXPCTimer setPriority:](v20, "setPriority:", a7);
    -[ENXPCTimer setOptions:](v20, "setOptions:", a8);
    -[ENXPCTimer setCadence:](v20, "setCadence:", a6 & ((int64_t)(-[ENXPCTimer options](v20, "options") << 50) >> 63));
    -[ENXPCTimer setBlock:](v20, "setBlock:", v18);
    -[ENXPCTimer handleActivity](v20, "handleActivity");
  }

  return v20;
}

- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  void *v16;
  id v17;
  id v18;
  void *v19;
  ENXPCTimer *v20;

  v16 = (void *)MEMORY[0x1E0C99D60];
  v17 = a9;
  v18 = a3;
  objc_msgSend(v16, "dateWithTimeIntervalSinceNow:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ENXPCTimer initWithName:date:gracePeriod:cadence:priority:options:block:](self, "initWithName:date:gracePeriod:cadence:priority:options:block:", v18, v19, a6, a7, a8, v17, a5);

  return v20;
}

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return -[ENXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", a3, a4, a5, a6, a7, 0.0);
}

- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  void *v14;
  id v15;
  id v16;
  void *v17;
  ENXPCTimer *v18;

  v14 = (void *)MEMORY[0x1E0C99D60];
  v15 = a8;
  v16 = a3;
  objc_msgSend(v14, "dateWithTimeIntervalSinceNow:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ENXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v16, v17, a6, a7, v15, a5);

  return v18;
}

- (ENXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  ENXPCTimer *v16;

  v12 = (void *)MEMORY[0x1E0C99D60];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "dateWithTimeIntervalSinceNow:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ENXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v14, v15, a5, a6, v13, 0.0);

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3938];
  -[ENXPCTimer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENXPCTimer criteria](self, "criteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EN XPC Activity: %@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)criteria
{
  void *v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  int64_t v9;
  xpc_object_t v10;
  __int16 v11;
  int64_t v12;
  const char **v13;
  uint64_t v14;
  const char *v15;
  int64_t *v16;
  void *v17;
  int64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  const char **v23;
  char v24;
  unint64_t v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  unint64_t v31;

  -[ENXPCTimer date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6 = 0.0;
  if (v5 >= 0.0)
    v6 = v5;
  v7 = (uint64_t)v6;
  -[ENXPCTimer gracePeriod](self, "gracePeriod");
  v9 = (uint64_t)v8;
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80898], (v11 & 0x2000) != 0);
  xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E0C80760], v7);
  xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E0C80790], v9);
  v12 = -[ENXPCTimer priority](self, "priority");
  v13 = (const char **)MEMORY[0x1E0C80888];
  if (v12 != 1)
    v13 = (const char **)MEMORY[0x1E0C80880];
  xpc_dictionary_set_string(v10, (const char *)*MEMORY[0x1E0C80878], *v13);
  v14 = -[ENXPCTimer cadence](self, "cadence");
  if (v14 <= 3599)
  {
    if (v14 <= 299)
    {
      if (!v14)
        goto LABEL_31;
      if (v14 == 60)
      {
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807C8];
        goto LABEL_29;
      }
    }
    else
    {
      switch(v14)
      {
        case 300:
          v15 = (const char *)*MEMORY[0x1E0C807A8];
          v16 = (int64_t *)MEMORY[0x1E0C807E0];
          goto LABEL_29;
        case 900:
          v15 = (const char *)*MEMORY[0x1E0C807A8];
          v16 = (int64_t *)MEMORY[0x1E0C807B0];
          goto LABEL_29;
        case 1800:
          v15 = (const char *)*MEMORY[0x1E0C807A8];
          v16 = (int64_t *)MEMORY[0x1E0C807D0];
          goto LABEL_29;
      }
    }
  }
  else if (v14 > 86399)
  {
    switch(v14)
    {
      case 86400:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807B8];
        goto LABEL_29;
      case 604800:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807E8];
        goto LABEL_29;
      case 2592000:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v17 = v10;
        v18 = 2592000;
LABEL_30:
        xpc_dictionary_set_int64(v17, v15, v18);
        goto LABEL_31;
    }
  }
  else
  {
    switch(v14)
    {
      case 3600:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807C0];
        goto LABEL_29;
      case 14400:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807D8];
        goto LABEL_29;
      case 28800:
        v15 = (const char *)*MEMORY[0x1E0C807A8];
        v16 = (int64_t *)MEMORY[0x1E0C807F0];
LABEL_29:
        v18 = *v16;
        v17 = v10;
        goto LABEL_30;
    }
  }
  v31 = -[ENXPCTimer cadence](self, "cadence");
  if ((-[ENXPCTimer options](self, "options") & 0x2000) != 0)
  {
    v15 = (const char *)*MEMORY[0x1E0C807A8];
    v17 = v10;
    v18 = v31;
    goto LABEL_30;
  }
LABEL_31:
  v19 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80868], v19 & 1);
  v20 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C808E0], (v20 & 4) != 0);
  v21 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C808F0], (v21 & 2) != 0);
  v22 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80908], (v22 & 8) != 0);
  if ((-[ENXPCTimer options](self, "options") & 0x10) != 0)
  {
    v23 = (const char **)MEMORY[0x1E0C808A8];
  }
  else if ((-[ENXPCTimer options](self, "options") & 0x20) != 0)
  {
    v23 = (const char **)MEMORY[0x1E0C808B0];
  }
  else
  {
    if ((-[ENXPCTimer options](self, "options") & 0x40) == 0)
      goto LABEL_39;
    v23 = (const char **)MEMORY[0x1E0C808B8];
  }
  if (*v23)
    xpc_dictionary_set_BOOL(v10, *v23, 1);
LABEL_39:
  v24 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C808D0], v24 < 0);
  v25 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C808C8], v25 & 0x100);
  v26 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80738], (v26 & 0x200) != 0);
  v27 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80808], (v27 & 0x400) != 0);
  v28 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80758], (v28 & 0x800) != 0);
  v29 = -[ENXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80770], (v29 & 0x1000) != 0);
  return v10;
}

- (void)invalidate
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;

  if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    -[ENXPCTimer name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENXPCTimer name](self, "name", v7);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  xpc_activity_unregister(v4);
  -[ENXPCTimer block](self, "block");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[ENXPCTimer setBlock:](self, "setBlock:", 0);
  -[ENXPCTimer activity](self, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[ENXPCTimer setActivity:](self, "setActivity:", 0);
}

- (id)activityHandler
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  -[ENXPCTimer name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENXPCTimer date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");

  if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    -[ENXPCTimer cadence](self, "cadence");
    -[ENXPCTimer gracePeriod](self, "gracePeriod");
    LogPrintF_safe();
  }
  location = 0;
  objc_initWeak(&location, self);
  -[ENXPCTimer block](self, "block");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__ENXPCTimer_activityHandler__block_invoke;
  v10[3] = &unk_1E87DB340;
  objc_copyWeak(&v13, &location);
  v11 = v3;
  v12 = v5;
  v6 = v5;
  v7 = v3;
  v8 = (void *)MEMORY[0x1D17A7E5C](v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v8;
}

void __29__ENXPCTimer_activityHandler__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  xpc_object_t v4;
  void *v5;
  BOOL v6;
  xpc_activity_state_t state;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _xpc_activity_s *activity;

  activity = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (gLogCategory_ENXPCTimer <= 90 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
      goto LABEL_22;
    goto LABEL_46;
  }
  if (!xpc_activity_get_state(activity))
  {
    objc_msgSend(WeakRetained, "setActivity:", activity);
    v4 = xpc_activity_copy_criteria(activity);
    if (v4)
    {
      objc_msgSend(WeakRetained, "criteria");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = xpc_equal(v5, v4);

      if (v6)
      {
        if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize())
          goto LABEL_45;
        goto LABEL_25;
      }
      objc_msgSend(WeakRetained, "criteria");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_criteria(activity, v16);

      if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize())
        goto LABEL_45;
      objc_msgSend(WeakRetained, "criteria");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
    else
    {
      if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
      {
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "criteria");
        v18 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      objc_msgSend(WeakRetained, "criteria", v18, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_criteria(activity, v17);
    }

    goto LABEL_45;
  }
  if (!xpc_activity_should_defer(activity))
  {
    state = xpc_activity_get_state(activity);
    v4 = xpc_activity_copy_criteria(activity);
    if (state == 2)
    {
      xpc_activity_set_state(activity, 5);
      v8 = (void *)MEMORY[0x1E0CB3938];
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_retainAutorelease(v12);
      objc_msgSend(v13, "UTF8String");
      v14 = (void *)os_transaction_create();
      if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), WeakRetained);

      goto LABEL_45;
    }
    if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize())
    {
LABEL_45:

      goto LABEL_46;
    }
LABEL_25:
    LogPrintF_safe();
    goto LABEL_45;
  }
  if (xpc_activity_set_state(activity, 3))
  {
    if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
LABEL_22:
      LogPrintF_safe();
  }
  else if (gLogCategory_ENXPCTimer <= 90 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_22;
  }
LABEL_46:

}

- (void)handleActivity
{
  const char *v3;
  void *v4;
  void *v5;
  id v6;

  -[ENXPCTimer name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (const char *)objc_msgSend(v6, "utf8ValueSafe");
  v4 = (void *)*MEMORY[0x1E0C80748];
  -[ENXPCTimer activityHandler](self, "activityHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_activity_register(v3, v4, v5);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)cadence
{
  return self->_cadence;
}

- (void)setCadence:(unint64_t)a3
{
  self->_cadence = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
