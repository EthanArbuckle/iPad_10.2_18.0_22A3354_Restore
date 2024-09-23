@implementation DNDSStateProviderSystemSnapshot

- (DNDSStateProviderSystemSnapshot)init
{
  return (DNDSStateProviderSystemSnapshot *)-[DNDSStateProviderSystemSnapshot _initWithSnapshot:](self, "_initWithSnapshot:", 0);
}

- (id)_initWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAssertionUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDateIntervalByAssertionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "interruptionBehaviorSetting");
  v9 = objc_msgSend(v4, "lostModeState");
  objc_msgSend(v4, "lastUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDSStateProviderSystemSnapshot _initWithAssertions:activeAssertionUUIDs:activeDateIntervalByAssertionUUID:interruptionBehaviorSetting:lostModeState:lastUpdate:](self, "_initWithAssertions:activeAssertionUUIDs:activeDateIntervalByAssertionUUID:interruptionBehaviorSetting:lostModeState:lastUpdate:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)_initWithAssertions:(id)a3 activeAssertionUUIDs:(id)a4 activeDateIntervalByAssertionUUID:(id)a5 interruptionBehaviorSetting:(unint64_t)a6 lostModeState:(unint64_t)a7 lastUpdate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  DNDSStateProviderSystemSnapshot *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)DNDSStateProviderSystemSnapshot;
  v18 = -[DNDSStateProviderSystemSnapshot init](&v30, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E0C9AA60];
    if (v19)
      v22 = (void *)v19;
    else
      v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v18->_assertions, v22);

    v23 = objc_msgSend(v15, "copy");
    v24 = (void *)v23;
    if (v23)
      v25 = (void *)v23;
    else
      v25 = v21;
    objc_storeStrong((id *)&v18->_activeAssertionUUIDs, v25);

    v26 = objc_msgSend(v16, "copy");
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v18->_activeDateIntervalByAssertionUUID, v28);

    v18->_interruptionBehaviorSetting = a6;
    v18->_lostModeState = a7;
    objc_storeStrong((id *)&v18->_lastUpdate, a8);
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
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  -[DNDSStateProviderSystemSnapshot assertions](self, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](self, "activeAssertionUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](self, "activeDateIntervalByAssertionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[DNDSStateProviderSystemSnapshot interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
  v10 = -[DNDSStateProviderSystemSnapshot lostModeState](self, "lostModeState");
  -[DNDSStateProviderSystemSnapshot lastUpdate](self, "lastUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSStateProviderSystemSnapshot *v5;
  DNDSStateProviderSystemSnapshot *v6;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
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

  v5 = (DNDSStateProviderSystemSnapshot *)a3;
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
      -[DNDSStateProviderSystemSnapshot assertions](self, "assertions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSStateProviderSystemSnapshot assertions](v6, "assertions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSStateProviderSystemSnapshot assertions](self, "assertions");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_50;
        }
        v10 = (void *)v9;
        -[DNDSStateProviderSystemSnapshot assertions](v6, "assertions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        -[DNDSStateProviderSystemSnapshot assertions](self, "assertions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSStateProviderSystemSnapshot assertions](v6, "assertions");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v51 = v3;
        v52 = v12;
        v53 = v11;
        v54 = v10;
      }
      -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](self, "activeAssertionUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](v6, "activeAssertionUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](self, "activeAssertionUUIDs");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](v6, "activeAssertionUUIDs");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            v50 = v14;
            -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](self, "activeAssertionUUIDs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](v6, "activeAssertionUUIDs");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v3) & 1) == 0)
            {

              goto LABEL_46;
            }
            v45 = v20;
            v46 = v19;
            v47 = v17;
            goto LABEL_17;
          }

        }
        goto LABEL_46;
      }
      v50 = v14;
LABEL_17:
      -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](self, "activeDateIntervalByAssertionUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](v6, "activeDateIntervalByAssertionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {
        v48 = v21;
        v49 = v3;
        goto LABEL_25;
      }
      -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](self, "activeDateIntervalByAssertionUUID");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](v6, "activeDateIntervalByAssertionUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v48 = v21;
          v49 = v3;
          v44 = v25;
          -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](self, "activeDateIntervalByAssertionUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](v6, "activeDateIntervalByAssertionUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqual:", v26) & 1) != 0)
          {
            v42 = v26;
            v43 = v24;
LABEL_25:
            v27 = -[DNDSStateProviderSystemSnapshot interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
            if (v27 == -[DNDSStateProviderSystemSnapshot interruptionBehaviorSetting](v6, "interruptionBehaviorSetting")&& (v28 = -[DNDSStateProviderSystemSnapshot lostModeState](self, "lostModeState"), v28 == -[DNDSStateProviderSystemSnapshot lostModeState](v6, "lostModeState")))
            {
              -[DNDSStateProviderSystemSnapshot lastUpdate](self, "lastUpdate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSStateProviderSystemSnapshot lastUpdate](v6, "lastUpdate");
              v30 = objc_claimAutoreleasedReturnValue();
              if (v29 != (void *)v30)
              {
                v41 = (void *)v30;
                -[DNDSStateProviderSystemSnapshot lastUpdate](self, "lastUpdate");
                v31 = objc_claimAutoreleasedReturnValue();
                v32 = v49;
                if (v31)
                {
                  v40 = (void *)v31;
                  -[DNDSStateProviderSystemSnapshot lastUpdate](v6, "lastUpdate");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v33)
                  {
                    v39 = v33;
                    -[DNDSStateProviderSystemSnapshot lastUpdate](self, "lastUpdate");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSStateProviderSystemSnapshot lastUpdate](v6, "lastUpdate");
                    v34 = v29;
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v38, "isEqual:", v35);

                    v29 = v34;
                    v32 = v49;

                    v33 = v39;
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
                v36 = v48;
                goto LABEL_33;
              }

              v13 = 1;
            }
            else
            {
              v13 = 0;
            }
            v36 = v48;
            v32 = v49;
LABEL_33:
            if (v36 != v22)
            {

            }
            if (v50 != v15)
            {

            }
LABEL_47:
            v11 = v53;
            v10 = v54;
            v12 = v52;
            v3 = v51;
            if (v7 != v8)
              goto LABEL_48;
LABEL_50:

            goto LABEL_51;
          }

          v25 = v44;
          v21 = v48;
          v3 = v49;
        }

      }
      if (v50 != v15)
      {

      }
LABEL_46:
      v13 = 0;
      goto LABEL_47;
    }
    v13 = 0;
  }
LABEL_51:

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
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSStateProviderSystemSnapshot assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProviderSystemSnapshot activeAssertionUUIDs](self, "activeAssertionUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProviderSystemSnapshot activeDateIntervalByAssertionUUID](self, "activeDateIntervalByAssertionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProviderSystemSnapshot interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
  DNDStringFromInterruptionBehaviorSetting();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSStringFromLostModeState(-[DNDSStateProviderSystemSnapshot lostModeState](self, "lostModeState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProviderSystemSnapshot lastUpdate](self, "lastUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; assertions: %@; activeAssertionUUIDs: %@; activeDateIntervalByAssertionUUID: %@; interruptionBehaviorSetting: %@; lostModeState: %@; lastUpdate: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSStateProviderSystemSnapshot _initWithSnapshot:]([DNDSMutableStateProviderSystemSnapshot alloc], "_initWithSnapshot:", self);
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)activeAssertionUUIDs
{
  return self->_activeAssertionUUIDs;
}

- (NSDictionary)activeDateIntervalByAssertionUUID
{
  return self->_activeDateIntervalByAssertionUUID;
}

- (unint64_t)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

- (unint64_t)lostModeState
{
  return self->_lostModeState;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_activeDateIntervalByAssertionUUID, 0);
  objc_storeStrong((id *)&self->_activeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
