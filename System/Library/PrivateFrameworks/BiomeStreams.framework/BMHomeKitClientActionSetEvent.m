@implementation BMHomeKitClientActionSetEvent

- (BMHomeKitClientActionSetEvent)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMHomeKitClientActionSetEvent *v18;
  BMHomeKitClientActionSetEvent *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMHomeKitClientActionSetEvent;
  v18 = -[BMEventBase init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_base, a3);
    objc_storeStrong((id *)&v19->_actionSetUniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_actionSetType, a5);
    objc_storeStrong((id *)&v19->_associatedAccessoryUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v19->_actionSetName, a7);
    objc_storeStrong((id *)&v19->_homeName, a8);
  }

  return v19;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("BMHomeKitClientActionSetEvent event with base: %@, actionSetUniqueIdentifier: %@, actionSetType: %@, associatedAccessoryUniqueIdentifiers: %@, actionSetName: %@, homeName: %@"), self->_base, self->_actionSetUniqueIdentifier, self->_actionSetType, self->_associatedAccessoryUniqueIdentifiers, self->_actionSetName, self->_homeName);
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  if (a4)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[BMHomeKitClientActionSetEvent eventWithData:dataVersion:].cold.1(v7);

    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMHomeKitClientActionSetEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMHomeKitClientActionSetEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  BMHomeKitClientBase *v6;
  void *v7;
  BMHomeKitClientBase *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BMHomeKitClientActionSetEvent *v14;
  NSObject *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BMHomeKitClientActionSetEvent initWithProto:].cold.1((uint64_t)self, v15);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = [BMHomeKitClientBase alloc];
  objc_msgSend(v5, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMHomeKitClientBase initWithProto:](v6, "initWithProto:", v7);
  objc_msgSend(v5, "actionSetUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedAccessoryUniqueIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMHomeKitClientActionSetEvent initWithBase:actionSetUniqueIdentifier:actionSetType:associatedAccessoryUniqueIdentifiers:actionSetName:homeName:](self, "initWithBase:actionSetUniqueIdentifier:actionSetType:associatedAccessoryUniqueIdentifiers:actionSetName:homeName:", v8, v9, v10, v11, v12, v13);
  v14 = self;
LABEL_8:

  return v14;
}

- (BMHomeKitClientActionSetEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBHomeKitClientActionSetEvent *v5;
  BMHomeKitClientActionSetEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBHomeKitClientActionSetEvent initWithData:]([BMPBHomeKitClientActionSetEvent alloc], "initWithData:", v4);

    self = -[BMHomeKitClientActionSetEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientActionSetEvent base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBase:", v5);

  -[BMHomeKitClientActionSetEvent actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionSetUniqueIdentifier:", v6);

  -[BMHomeKitClientActionSetEvent actionSetType](self, "actionSetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionSetType:", v7);

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[BMHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssociatedAccessoryUniqueIdentifiers:", v10);

  -[BMHomeKitClientActionSetEvent actionSetName](self, "actionSetName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionSetName:", v11);

  -[BMHomeKitClientActionSetEvent homeName](self, "homeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeName:", v12);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  char v28;
  char v29;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    -[BMHomeKitClientActionSetEvent base](self, "base");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v10, "base"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMHomeKitClientActionSetEvent base](self, "base");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v4, "isEqual:", v5);

      if (v11)
      {
LABEL_9:

        -[BMHomeKitClientActionSetEvent actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_msgSend(v10, "actionSetUniqueIdentifier"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMHomeKitClientActionSetEvent actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "actionSetUniqueIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v5, "isEqual:", v6);

          if (v13)
          {
LABEL_15:

            -[BMHomeKitClientActionSetEvent actionSetType](self, "actionSetType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 || (objc_msgSend(v10, "actionSetType"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[BMHomeKitClientActionSetEvent actionSetType](self, "actionSetType");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "actionSetType");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v6, "isEqual:", v7);

              if (v14)
              {
LABEL_21:

                -[BMHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16
                  || (objc_msgSend(v10, "associatedAccessoryUniqueIdentifiers"),
                      (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[BMHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiers](self, "associatedAccessoryUniqueIdentifiers");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "associatedAccessoryUniqueIdentifiers");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v7, "isEqual:", v17);

                  if (v16)
                  {
LABEL_27:

                    -[BMHomeKitClientActionSetEvent actionSetName](self, "actionSetName");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v19
                      || (objc_msgSend(v10, "actionSetName"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      -[BMHomeKitClientActionSetEvent actionSetName](self, "actionSetName");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "actionSetName");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = objc_msgSend(v20, "isEqual:", v21);

                      if (v19)
                      {
LABEL_33:

                        -[BMHomeKitClientActionSetEvent homeName](self, "homeName");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v23
                          || (objc_msgSend(v10, "homeName"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[BMHomeKitClientActionSetEvent homeName](self, "homeName");
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v10, "homeName");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          v26 = objc_msgSend(v24, "isEqual:", v25);

                          if (v23)
                          {
LABEL_39:

                            v12 = v29 & v28 & v15 & v18 & v22 & v26;
                            goto LABEL_40;
                          }
                        }
                        else
                        {
                          v26 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      v22 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  v18 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              v15 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          v28 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v29 = 1;
    }

    goto LABEL_9;
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Mismatched BMHomeKitClientActionSetEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBHomeKitClientActionSetEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
