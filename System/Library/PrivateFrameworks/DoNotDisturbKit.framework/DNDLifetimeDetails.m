@implementation DNDLifetimeDetails

+ (id)lifetimeDetailsForPlaceInference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  __CFString *v8;
  void *v9;
  void *v10;
  DNDLifetimeDetails *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DND_UNTIL_I_LEAVE_LIFETIME_TITLE"), &stru_24CF51938, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preferredName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "confidence");
    if (v7 < 0.7)
      v8 = CFSTR("DND_UNTIL_I_LEAVE_LIFETIME_WITH_LOW_CONFIDENCE_LOI_METADATA");
    else
      v8 = CFSTR("DND_UNTIL_I_LEAVE_LIFETIME_WITH_HIGH_CONFIDENCE_LOI_METADATA");
    DNDLocalizedStringHelper((uint64_t)CFSTR("%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = -[DNDLifetimeDetails initWithIdentifier:name:metadata:]([DNDLifetimeDetails alloc], "initWithIdentifier:name:metadata:", CFSTR("com.apple.donotdisturb.kit.lifetime.location"), v5, v10);

  return v11;
}

+ (id)lifetimeDetailsForEvent:(id)a3 relativeToDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  DNDLifetimeDetails *v24;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DND_UNTIL_END_THIS_EVENT_TITLE"), &stru_24CF51938, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v9) == -1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DND_UNTIL_END_NEXT_EVENT_TITLE"), &stru_24CF51938, 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    objc_msgSend(v13, "getHour:minute:second:nanosecond:fromDate:", &v29, 0, 0, 0, v9);
    objc_msgSend(v13, "getHour:minute:second:nanosecond:fromDate:", &v28, 0, 0, 0, v10);
    v14 = v29 / 12;
    v15 = v28 / 12;
    objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v26 = v8;
    v27 = v6;
    if (v14 == v15)
      objc_msgSend(v16, "formatDateAsTimeNoAMPM:", v9);
    else
      objc_msgSend(v16, "formatDateAsTimeStyle:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "formatDateAsTimeStyle:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    DNDLocalizedStringHelper((uint64_t)CFSTR("%@%@%@"), CFSTR("DND_UNTIL_END_EVENT_DURATION_DESCRIPTION"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v22, v19, v20, v21);
    v23 = (void *)v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v26;
    v6 = v27;
  }
  else
  {
    v18 = 0;
  }
  v24 = -[DNDLifetimeDetails initWithIdentifier:name:metadata:]([DNDLifetimeDetails alloc], "initWithIdentifier:name:metadata:", CFSTR("com.apple.donotdisturb.kit.lifetime.event"), v8, v18);

  return v24;
}

+ (id)lifetimeDetailsForOneHour
{
  void *v2;
  void *v3;
  DNDLifetimeDetails *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DND_ONE_HOUR_LIFETIME_TITLE"), &stru_24CF51938, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[DNDLifetimeDetails initWithIdentifier:name:metadata:]([DNDLifetimeDetails alloc], "initWithIdentifier:name:metadata:", CFSTR("com.apple.donotdisturb.kit.lifetime.one-hour"), v3, &stru_24CF51938);
  return v4;
}

+ (id)lifetimeDetailsUntilEvening
{
  void *v2;
  void *v3;
  DNDLifetimeDetails *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DND_UNTIL_EVENING_LIFETIME_TITLE"), &stru_24CF51938, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[DNDLifetimeDetails initWithIdentifier:name:metadata:]([DNDLifetimeDetails alloc], "initWithIdentifier:name:metadata:", CFSTR("com.apple.donotdisturb.kit.lifetime.evening"), v3, &stru_24CF51938);
  return v4;
}

+ (id)lifetimeDetailsUntilMorning
{
  void *v2;
  void *v3;
  DNDLifetimeDetails *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "dndk_localizationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DND_UNTIL_MORNING_LIFETIME_TITLE"), &stru_24CF51938, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[DNDLifetimeDetails initWithIdentifier:name:metadata:]([DNDLifetimeDetails alloc], "initWithIdentifier:name:metadata:", CFSTR("com.apple.donotdisturb.kit.lifetime.morning"), v3, &stru_24CF51938);
  return v4;
}

- (DNDLifetimeDetails)initWithIdentifier:(id)a3 name:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDLifetimeDetails *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *metadata;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDLifetimeDetails;
  v11 = -[DNDLifetimeDetails init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    metadata = v11->_metadata;
    v11->_metadata = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DNDLifetimeDetails identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDLifetimeDetails name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDLifetimeDetails metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDLifetimeDetails *v5;
  DNDLifetimeDetails *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (DNDLifetimeDetails *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDLifetimeDetails identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDLifetimeDetails identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDLifetimeDetails identifier](self, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_37;
        }
        v10 = (void *)v9;
        -[DNDLifetimeDetails identifier](v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[DNDLifetimeDetails identifier](self, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDLifetimeDetails identifier](v6, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      -[DNDLifetimeDetails name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDLifetimeDetails name](v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDLifetimeDetails name](self, "name");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDLifetimeDetails name](v6, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v35 = v14;
            -[DNDLifetimeDetails name](self, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDLifetimeDetails name](v6, "name");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v3) & 1) != 0)
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              -[DNDLifetimeDetails metadata](self, "metadata");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDLifetimeDetails metadata](v6, "metadata");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v20 == (void *)v21)
              {

                v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                -[DNDLifetimeDetails metadata](self, "metadata");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[DNDLifetimeDetails metadata](v6, "metadata");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v30 = v25;
                    -[DNDLifetimeDetails metadata](self, "metadata");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDLifetimeDetails metadata](v6, "metadata");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v29, "isEqual:", v26);

                    v25 = v30;
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
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {

              }
LABEL_34:
              v11 = v38;
              v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8)
                goto LABEL_35;
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }

        }
        v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    v13 = 0;
  }
LABEL_38:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[DNDLifetimeDetails identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDLifetimeDetails name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDLifetimeDetails metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@'; name: '%@'; metadata: '%@'>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
