@implementation DNDSEventBehaviorResolution

+ (id)resolutionForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5 outcome:(unint64_t)a6 reason:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "_initWithUUID:date:eventBehavior:clientIdentifier:outcome:reason:", v16, v14, v13, v12, a6, a7);

  return v17;
}

- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6 outcome:(unint64_t)a7 reason:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  DNDSEventBehaviorResolution *v18;
  uint64_t v19;
  NSUUID *UUID;
  uint64_t v21;
  NSDate *date;
  uint64_t v23;
  DNDClientEventBehavior *eventBehavior;
  uint64_t v25;
  NSString *clientIdentifier;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DNDSEventBehaviorResolution;
  v18 = -[DNDSEventBehaviorResolution init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    UUID = v18->_UUID;
    v18->_UUID = (NSUUID *)v19;

    v21 = objc_msgSend(v15, "copy");
    date = v18->_date;
    v18->_date = (NSDate *)v21;

    v23 = objc_msgSend(v16, "copy");
    eventBehavior = v18->_eventBehavior;
    v18->_eventBehavior = (DNDClientEventBehavior *)v23;

    v25 = objc_msgSend(v17, "copy");
    clientIdentifier = v18->_clientIdentifier;
    v18->_clientIdentifier = (NSString *)v25;

    v18->_outcome = a7;
    v18->_reason = a8;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[DNDSEventBehaviorResolution UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSEventBehaviorResolution date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSEventBehaviorResolution eventBehavior](self, "eventBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSEventBehaviorResolution clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[DNDSEventBehaviorResolution outcome](self, "outcome");
  v12 = v10 ^ v11 ^ -[DNDSEventBehaviorResolution reason](self, "reason");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DNDSEventBehaviorResolution *v6;
  DNDSEventBehaviorResolution *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v6 = (DNDSEventBehaviorResolution *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[DNDSEventBehaviorResolution UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSEventBehaviorResolution UUID](v7, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[DNDSEventBehaviorResolution UUID](self, "UUID");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
          goto LABEL_65;
        }
        v3 = (void *)v10;
        -[DNDSEventBehaviorResolution UUID](v7, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_64:

          goto LABEL_65;
        }
        -[DNDSEventBehaviorResolution UUID](self, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSEventBehaviorResolution UUID](v7, "UUID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v4))
        {
          v13 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v57 = v3;
        v54 = v4;
        v55 = v12;
        v56 = v11;
      }
      -[DNDSEventBehaviorResolution date](self, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSEventBehaviorResolution date](v7, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSEventBehaviorResolution date](self, "date");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v58 = v14;
          -[DNDSEventBehaviorResolution date](v7, "date");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDSEventBehaviorResolution date](self, "date");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSEventBehaviorResolution date](v7, "date");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
            {
              v47 = v19;
              v48 = v17;
              goto LABEL_17;
            }

          }
        }
        else
        {

        }
LABEL_45:
        v13 = 0;
        goto LABEL_62;
      }
      v58 = v14;
LABEL_17:
      -[DNDSEventBehaviorResolution eventBehavior](self, "eventBehavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSEventBehaviorResolution eventBehavior](v7, "eventBehavior");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v50 = v20;
        v51 = v4;
        v53 = v3;
LABEL_26:
        -[DNDSEventBehaviorResolution clientIdentifier](self, "clientIdentifier");
        v26 = objc_claimAutoreleasedReturnValue();
        -[DNDSEventBehaviorResolution clientIdentifier](v7, "clientIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)v26;
        if ((void *)v26 == v27)
        {
          v44 = v20;
        }
        else
        {
          -[DNDSEventBehaviorResolution clientIdentifier](self, "clientIdentifier");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v20;
          if (!v28)
          {

            v13 = 0;
            goto LABEL_53;
          }
          v43 = (void *)v28;
          -[DNDSEventBehaviorResolution clientIdentifier](v7, "clientIdentifier");
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v13 = 0;
LABEL_52:

LABEL_53:
            v37 = v50;
            if (v50 != v21)
            {
              v39 = v45;
LABEL_58:

            }
LABEL_59:

            if (v58 != v15)
            {

            }
LABEL_62:
            v11 = v56;
            v3 = v57;
            v4 = v54;
            v12 = v55;
            if (v8 != v9)
              goto LABEL_63;
LABEL_65:

            goto LABEL_66;
          }
          v42 = (void *)v30;
          -[DNDSEventBehaviorResolution clientIdentifier](self, "clientIdentifier");
          v31 = objc_claimAutoreleasedReturnValue();
          -[DNDSEventBehaviorResolution clientIdentifier](v7, "clientIdentifier");
          v32 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v31;
          v33 = (void *)v31;
          v20 = (void *)v32;
          if (!objc_msgSend(v33, "isEqual:", v32))
          {
            v13 = 0;
LABEL_51:

            goto LABEL_52;
          }
          v44 = v29;
        }
        v34 = -[DNDSEventBehaviorResolution outcome](self, "outcome");
        if (v34 != -[DNDSEventBehaviorResolution outcome](v7, "outcome"))
        {
          if (v52 != v27)
          {

            v13 = 0;
            v37 = v50;
            v38 = v50 == v21;
            v29 = v44;
            goto LABEL_57;
          }
          v13 = 0;
          v29 = v44;
LABEL_56:

          v37 = v50;
          v38 = v50 == v21;
LABEL_57:
          v39 = v45;
          if (!v38)
            goto LABEL_58;
          goto LABEL_59;
        }
        v35 = -[DNDSEventBehaviorResolution reason](self, "reason");
        v13 = v35 == -[DNDSEventBehaviorResolution reason](v7, "reason");
        v29 = v44;
        if (v52 == v27)
          goto LABEL_56;
        goto LABEL_51;
      }
      -[DNDSEventBehaviorResolution eventBehavior](self, "eventBehavior");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v49 = (void *)v22;
        -[DNDSEventBehaviorResolution eventBehavior](v7, "eventBehavior");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v51 = v4;
          v53 = v3;
          v46 = (void *)v23;
          -[DNDSEventBehaviorResolution eventBehavior](self, "eventBehavior");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSEventBehaviorResolution eventBehavior](v7, "eventBehavior");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
          {
            v50 = v20;
            v20 = v24;
            v45 = v25;
            goto LABEL_26;
          }

          v36 = v58;
          if (v58 != v15)
          {

            goto LABEL_42;
          }
          goto LABEL_43;
        }

      }
      v36 = v58;
      if (v58 != v15)
      {

LABEL_42:
LABEL_44:

        goto LABEL_45;
      }
LABEL_43:

      goto LABEL_44;
    }
    v13 = 0;
  }
LABEL_66:

  return v13;
}

- (id)description
{
  return -[DNDSEventBehaviorResolution _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDSEventBehaviorResolution _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v3 = a3;
  v16 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[DNDSEventBehaviorResolution UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSEventBehaviorResolution date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSEventBehaviorResolution eventBehavior](self, "eventBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v8;
  if (v3)
  {
    objc_msgSend(v8, "redactedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[DNDSEventBehaviorResolution clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSResolutionOutcomeToString(-[DNDSEventBehaviorResolution outcome](self, "outcome"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSEventBehaviorResolution reason](self, "reason");
  DNDResolutionReasonToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; UUID: %@; date: %@; eventBehavior: %@; clientIdentifier: '%@'; outcome: %@; reason: %@>"),
    v5,
    self,
    v6,
    v7,
    v10,
    v11,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)date
{
  return self->_date;
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)outcome
{
  return self->_outcome;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
