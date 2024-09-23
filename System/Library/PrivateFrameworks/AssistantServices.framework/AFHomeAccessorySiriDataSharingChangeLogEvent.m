@implementation AFHomeAccessorySiriDataSharingChangeLogEvent

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *);
  AFHomeAccessorySiriDataSharingChangeLogEvent *v5;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v6;
  _AFHomeAccessorySiriDataSharingChangeLogEventMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *date;
  void *v11;
  uint64_t v12;
  NSString *changeReason;
  void *v14;
  uint64_t v15;
  NSString *buildVersion;
  void *v17;
  uint64_t v18;
  NSString *productVersion;
  void *v20;
  uint64_t v21;
  NSString *schemaVersion;
  void *v23;
  uint64_t v24;
  NSString *logEventIdentifier;
  objc_super v27;

  v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFHomeAccessorySiriDataSharingChangeLogEvent;
  v5 = -[AFHomeAccessorySiriDataSharingChangeLogEvent init](&v27, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation initWithBase:]([_AFHomeAccessorySiriDataSharingChangeLogEventMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeAccessorySiriDataSharingChangeLogEventMutation isDirty](v7, "isDirty"))
    {
      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getDate](v7, "getDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      v6->_previousOptInStatus = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getPreviousOptInStatus](v7, "getPreviousOptInStatus");
      v6->_newOptInStatus = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getNewOptInStatus](v7, "getNewOptInStatus");
      v6->_changeSource = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getChangeSource](v7, "getChangeSource");
      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getChangeReason](v7, "getChangeReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      changeReason = v6->_changeReason;
      v6->_changeReason = (NSString *)v12;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getBuildVersion](v7, "getBuildVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v15;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getProductVersion](v7, "getProductVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      productVersion = v6->_productVersion;
      v6->_productVersion = (NSString *)v18;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getSchemaVersion](v7, "getSchemaVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      schemaVersion = v6->_schemaVersion;
      v6->_schemaVersion = (NSString *)v21;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getLogEventIdentifier](v7, "getLogEventIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      logEventIdentifier = v6->_logEventIdentifier;
      v6->_logEventIdentifier = (NSString *)v24;

    }
  }

  return v6;
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)init
{
  return -[AFHomeAccessorySiriDataSharingChangeLogEvent initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDate:(id)a3 previousOptInStatus:(int64_t)a4 newOptInStatus:(int64_t)a5 changeSource:(int64_t)a6 changeReason:(id)a7 buildVersion:(id)a8 productVersion:(id)a9 schemaVersion:(id)a10 logEventIdentifier:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v27;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __183__AFHomeAccessorySiriDataSharingChangeLogEvent_initWithDate_previousOptInStatus_newOptInStatus_changeSource_changeReason_buildVersion_productVersion_schemaVersion_logEventIdentifier___block_invoke;
  v31[3] = &unk_1E3A2D250;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v32 = v15;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v37 = v20;
  v21 = v20;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = -[AFHomeAccessorySiriDataSharingChangeLogEvent initWithBuilder:](self, "initWithBuilder:", v31);

  return v27;
}

- (NSString)description
{
  return (NSString *)-[AFHomeAccessorySiriDataSharingChangeLogEvent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t previousOptInStatus;
  __CFString *v7;
  NSDate *date;
  __CFString *v9;
  unint64_t newOptInStatus;
  __CFString *v11;
  __CFString *v12;
  unint64_t changeSource;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  objc_super v18;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)AFHomeAccessorySiriDataSharingChangeLogEvent;
  -[AFHomeAccessorySiriDataSharingChangeLogEvent description](&v18, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  previousOptInStatus = self->_previousOptInStatus;
  if (previousOptInStatus > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A35998[previousOptInStatus];
  date = self->_date;
  v9 = v7;
  newOptInStatus = self->_newOptInStatus;
  if (newOptInStatus > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E3A35998[newOptInStatus];
  v12 = v11;
  changeSource = self->_changeSource;
  if (changeSource > 0xB)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A358B0[changeSource];
  v15 = v14;
  v16 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {date = %@, previousOptInStatus = %@, newOptInStatus = %@, changeSource = %@, changeReason = %@, buildVersion = %@, productVersion = %@, schemaVersion = %@, logEventIdentifier = %@}"), v5, date, v9, v12, v15, self->_changeReason, self->_buildVersion, self->_productVersion, self->_schemaVersion, self->_logEventIdentifier);

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;

  v3 = -[NSDate hash](self->_date, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_previousOptInStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_newOptInStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_changeSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[NSString hash](self->_changeReason, "hash");
  v11 = v10 ^ -[NSString hash](self->_buildVersion, "hash");
  v12 = v11 ^ -[NSString hash](self->_productVersion, "hash");
  v13 = v12 ^ -[NSString hash](self->_schemaVersion, "hash");
  v14 = v9 ^ v13 ^ -[NSString hash](self->_logEventIdentifier, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeAccessorySiriDataSharingChangeLogEvent *v4;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v5;
  int64_t previousOptInStatus;
  int64_t newOptInStatus;
  int64_t changeSource;
  NSDate *v9;
  NSDate *date;
  NSString *v11;
  NSString *changeReason;
  NSString *v13;
  NSString *buildVersion;
  NSString *v15;
  NSString *productVersion;
  NSString *v17;
  NSString *schemaVersion;
  NSString *v19;
  NSString *logEventIdentifier;
  BOOL v21;

  v4 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      previousOptInStatus = self->_previousOptInStatus;
      if (previousOptInStatus == -[AFHomeAccessorySiriDataSharingChangeLogEvent previousOptInStatus](v5, "previousOptInStatus")&& (newOptInStatus = self->_newOptInStatus, newOptInStatus == -[AFHomeAccessorySiriDataSharingChangeLogEvent newOptInStatus](v5, "newOptInStatus"))&& (changeSource = self->_changeSource, changeSource == -[AFHomeAccessorySiriDataSharingChangeLogEvent changeSource](v5, "changeSource")))
      {
        -[AFHomeAccessorySiriDataSharingChangeLogEvent date](v5, "date");
        v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
        date = self->_date;
        if (date == v9 || -[NSDate isEqual:](date, "isEqual:", v9))
        {
          -[AFHomeAccessorySiriDataSharingChangeLogEvent changeReason](v5, "changeReason");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          changeReason = self->_changeReason;
          if (changeReason == v11 || -[NSString isEqual:](changeReason, "isEqual:", v11))
          {
            -[AFHomeAccessorySiriDataSharingChangeLogEvent buildVersion](v5, "buildVersion");
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            buildVersion = self->_buildVersion;
            if (buildVersion == v13 || -[NSString isEqual:](buildVersion, "isEqual:", v13))
            {
              -[AFHomeAccessorySiriDataSharingChangeLogEvent productVersion](v5, "productVersion");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              productVersion = self->_productVersion;
              if (productVersion == v15 || -[NSString isEqual:](productVersion, "isEqual:", v15))
              {
                -[AFHomeAccessorySiriDataSharingChangeLogEvent schemaVersion](v5, "schemaVersion");
                v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                schemaVersion = self->_schemaVersion;
                if (schemaVersion == v17 || -[NSString isEqual:](schemaVersion, "isEqual:", v17))
                {
                  -[AFHomeAccessorySiriDataSharingChangeLogEvent logEventIdentifier](v5, "logEventIdentifier");
                  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
                  logEventIdentifier = self->_logEventIdentifier;
                  v21 = logEventIdentifier == v19
                     || -[NSString isEqual:](logEventIdentifier, "isEqual:", v19);

                }
                else
                {
                  v21 = 0;
                }

              }
              else
              {
                v21 = 0;
              }

            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::previousOptInStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::newOptInStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::changeSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::changeReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::buildVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::productVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::schemaVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::logEventIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AFHomeAccessorySiriDataSharingChangeLogEvent initWithDate:previousOptInStatus:newOptInStatus:changeSource:changeReason:buildVersion:productVersion:schemaVersion:logEventIdentifier:](self, "initWithDate:previousOptInStatus:newOptInStatus:changeSource:changeReason:buildVersion:productVersion:schemaVersion:logEventIdentifier:", v4, v6, v8, v10, v11, v12, v13, v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  date = self->_date;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", date, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::date"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_previousOptInStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::previousOptInStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_newOptInStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::newOptInStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_changeSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::changeSource"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_changeReason, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::changeReason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_buildVersion, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::buildVersion"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_productVersion, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::productVersion"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_schemaVersion, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::schemaVersion"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_logEventIdentifier, CFSTR("AFHomeAccessorySiriDataSharingChangeLogEvent::logEventIdentifier"));

}

- (AFHomeAccessorySiriDataSharingChangeLogEvent)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v6;
    else
      v25 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("previousOptInStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = AFSiriDataSharingOptInStatusGetFromName(v8);
    else
      v24 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("newOptInStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = AFSiriDataSharingOptInStatusGetFromName(v9);
    else
      v23 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("changeSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = AFSiriDataSharingOptInStatusChangeSourceGetFromName(v10);
    else
      v11 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("changeReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("buildVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("productVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("schemaVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("logEventIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    self = -[AFHomeAccessorySiriDataSharingChangeLogEvent initWithDate:previousOptInStatus:newOptInStatus:changeSource:changeReason:buildVersion:productVersion:schemaVersion:logEventIdentifier:](self, "initWithDate:previousOptInStatus:newOptInStatus:changeSource:changeReason:buildVersion:productVersion:schemaVersion:logEventIdentifier:", v25, v24, v23, v11, v13, v15, v17, v19, v21);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *date;
  unint64_t previousOptInStatus;
  __CFString *v7;
  __CFString *v8;
  unint64_t newOptInStatus;
  __CFString *v10;
  __CFString *v11;
  unint64_t changeSource;
  __CFString *v13;
  __CFString *v14;
  NSString *changeReason;
  NSString *buildVersion;
  NSString *productVersion;
  NSString *schemaVersion;
  NSString *logEventIdentifier;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKey:", date, CFSTR("date"));
  previousOptInStatus = self->_previousOptInStatus;
  if (previousOptInStatus > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A35998[previousOptInStatus];
  v8 = v7;
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("previousOptInStatus"));

  newOptInStatus = self->_newOptInStatus;
  if (newOptInStatus > 3)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A35998[newOptInStatus];
  v11 = v10;
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("newOptInStatus"));

  changeSource = self->_changeSource;
  if (changeSource > 0xB)
    v13 = CFSTR("(unknown)");
  else
    v13 = off_1E3A358B0[changeSource];
  v14 = v13;
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("changeSource"));

  changeReason = self->_changeReason;
  if (changeReason)
    objc_msgSend(v4, "setObject:forKey:", changeReason, CFSTR("changeReason"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v4, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  productVersion = self->_productVersion;
  if (productVersion)
    objc_msgSend(v4, "setObject:forKey:", productVersion, CFSTR("productVersion"));
  schemaVersion = self->_schemaVersion;
  if (schemaVersion)
    objc_msgSend(v4, "setObject:forKey:", schemaVersion, CFSTR("schemaVersion"));
  logEventIdentifier = self->_logEventIdentifier;
  if (logEventIdentifier)
    objc_msgSend(v4, "setObject:forKey:", logEventIdentifier, CFSTR("logEventIdentifier"));
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)previousOptInStatus
{
  return self->_previousOptInStatus;
}

- (int64_t)newOptInStatus
{
  return self->_newOptInStatus;
}

- (int64_t)changeSource
{
  return self->_changeSource;
}

- (NSString)changeReason
{
  return self->_changeReason;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)logEventIdentifier
{
  return self->_logEventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_changeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __183__AFHomeAccessorySiriDataSharingChangeLogEvent_initWithDate_previousOptInStatus_newOptInStatus_changeSource_changeReason_buildVersion_productVersion_schemaVersion_logEventIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setDate:", v3);
  objc_msgSend(v4, "setPreviousOptInStatus:", a1[10]);
  objc_msgSend(v4, "setNewOptInStatus:", a1[11]);
  objc_msgSend(v4, "setChangeSource:", a1[12]);
  objc_msgSend(v4, "setChangeReason:", a1[5]);
  objc_msgSend(v4, "setBuildVersion:", a1[6]);
  objc_msgSend(v4, "setProductVersion:", a1[7]);
  objc_msgSend(v4, "setSchemaVersion:", a1[8]);
  objc_msgSend(v4, "setLogEventIdentifier:", a1[9]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *);
  _AFHomeAccessorySiriDataSharingChangeLogEventMutation *v5;
  AFHomeAccessorySiriDataSharingChangeLogEvent *v6;
  void *v7;
  uint64_t v8;
  NSDate *date;
  void *v10;
  uint64_t v11;
  NSString *changeReason;
  void *v13;
  uint64_t v14;
  NSString *buildVersion;
  void *v16;
  uint64_t v17;
  NSString *productVersion;
  void *v19;
  uint64_t v20;
  NSString *schemaVersion;
  void *v22;
  uint64_t v23;
  NSString *logEventIdentifier;

  v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingChangeLogEventMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation initWithBase:]([_AFHomeAccessorySiriDataSharingChangeLogEventMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeAccessorySiriDataSharingChangeLogEventMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeAccessorySiriDataSharingChangeLogEvent);
      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getDate](v5, "getDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      v6->_previousOptInStatus = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getPreviousOptInStatus](v5, "getPreviousOptInStatus");
      v6->_newOptInStatus = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getNewOptInStatus](v5, "getNewOptInStatus");
      v6->_changeSource = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getChangeSource](v5, "getChangeSource");
      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getChangeReason](v5, "getChangeReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      changeReason = v6->_changeReason;
      v6->_changeReason = (NSString *)v11;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getBuildVersion](v5, "getBuildVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v14;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getProductVersion](v5, "getProductVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      productVersion = v6->_productVersion;
      v6->_productVersion = (NSString *)v17;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getSchemaVersion](v5, "getSchemaVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      schemaVersion = v6->_schemaVersion;
      v6->_schemaVersion = (NSString *)v20;

      -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation getLogEventIdentifier](v5, "getLogEventIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      logEventIdentifier = v6->_logEventIdentifier;
      v6->_logEventIdentifier = (NSString *)v23;

    }
    else
    {
      v6 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)-[AFHomeAccessorySiriDataSharingChangeLogEvent copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeAccessorySiriDataSharingChangeLogEvent *)-[AFHomeAccessorySiriDataSharingChangeLogEvent copy](self, "copy");
  }

  return v6;
}

@end
