@implementation ATXEvent

- (ATXEvent)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v10;
  id v11;
  id v12;
  ATXEvent *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ATXEvent;
  v13 = -[ATXEvent init](&v18, sel_init);
  if (v13)
  {
    if (v10)
    {
      if (v11)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("ATXEvent.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

      if (v11)
      {
LABEL_4:
        if (v12)
        {
LABEL_5:
          objc_storeStrong((id *)&v13->_event, a3);
          objc_storeStrong((id *)&v13->_startDate, a4);
          objc_storeStrong((id *)&v13->_endDate, a5);
          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("ATXEvent.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("ATXEvent.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v12)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v13;
}

+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *);
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  unint64_t v27;
  id v28;

  v28 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *))a5;
  v9 = objc_msgSend(v7, "count");
  v10 = v28;
  if (v9)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      if (v12 >= objc_msgSend(v10, "count"))
        goto LABEL_10;
      objc_msgSend(v28, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v16;
      objc_msgSend(v14, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v20 = v19;

      if (v17 < v20)
        goto LABEL_8;
      objc_msgSend(v13, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = v22;
      objc_msgSend(v14, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      v26 = v25;

      if (v23 <= v26)
        break;
      ++v11;
LABEL_9:

      v27 = objc_msgSend(v7, "count");
      v10 = v28;
      if (v11 >= v27)
        goto LABEL_10;
    }
    v8[2](v8, v13, v14);
LABEL_8:
    ++v12;
    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)isEqual:(id)a3
{
  ATXEvent *v4;
  ATXEvent *v5;
  BOOL v6;

  v4 = (ATXEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXEvent isEqualToEvent:](self, "isEqualToEvent:", v5);

  return v6;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[ATXEvent event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATXEvent event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[ATXEvent startDate](self, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToDate:", v10))
      {
        -[ATXEvent endDate](self, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToDate:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSSecureCoding hash](self->_event, "hash");
  v4 = -[NSDate hash](self->_startDate, "hash") - v3 + 32 * v3;
  return -[NSDate hash](self->_endDate, "hash") - v4 + 32 * v4;
}

- (NSSecureCoding)event
{
  return self->_event;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
