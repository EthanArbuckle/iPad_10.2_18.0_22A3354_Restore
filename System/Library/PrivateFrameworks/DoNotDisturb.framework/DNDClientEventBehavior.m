@implementation DNDClientEventBehavior

- (DNDClientEventBehavior)initWithEventDetails:(id)a3 interruptionSuppression:(unint64_t)a4 intelligentBehavior:(int64_t)a5 resolutionReason:(unint64_t)a6 activeModeUUID:(id)a7
{
  id v12;
  id v13;
  DNDClientEventBehavior *v14;
  uint64_t v15;
  DNDClientEventDetails *eventDetails;
  uint64_t v17;
  NSUUID *activeModeUUID;
  objc_super v20;

  v12 = a3;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DNDClientEventBehavior;
  v14 = -[DNDClientEventBehavior init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    eventDetails = v14->_eventDetails;
    v14->_eventDetails = (DNDClientEventDetails *)v15;

    v14->_interruptionSuppression = a4;
    v14->_intelligentBehavior = a5;
    v14->_resolutionReason = a6;
    v17 = objc_msgSend(v13, "copy");
    activeModeUUID = v14->_activeModeUUID;
    v14->_activeModeUUID = (NSUUID *)v17;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[DNDClientEventBehavior eventDetails](self, "eventDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DNDClientEventBehavior interruptionSuppression](self, "interruptionSuppression");
  v6 = v5 ^ -[DNDClientEventBehavior intelligentBehavior](self, "intelligentBehavior") ^ v4;
  v7 = -[DNDClientEventBehavior resolutionReason](self, "resolutionReason");
  -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDClientEventBehavior *v8;
  DNDClientEventBehavior *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = (DNDClientEventBehavior *)a3;
  if (self == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[DNDClientEventBehavior eventDetails](self, "eventDetails");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventBehavior eventDetails](v9, "eventDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[DNDClientEventBehavior eventDetails](self, "eventDetails");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v12;
        -[DNDClientEventBehavior eventDetails](v9, "eventDetails");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
          v13 = 0;
LABEL_24:

          v14 = v13;
          goto LABEL_25;
        }
        -[DNDClientEventBehavior eventDetails](self, "eventDetails");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDClientEventBehavior eventDetails](v9, "eventDetails");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      v15 = -[DNDClientEventBehavior interruptionSuppression](self, "interruptionSuppression");
      if (v15 == -[DNDClientEventBehavior interruptionSuppression](v9, "interruptionSuppression"))
      {
        v16 = -[DNDClientEventBehavior intelligentBehavior](self, "intelligentBehavior");
        if (v16 == -[DNDClientEventBehavior intelligentBehavior](v9, "intelligentBehavior"))
        {
          v17 = -[DNDClientEventBehavior resolutionReason](self, "resolutionReason");
          if (v17 == -[DNDClientEventBehavior resolutionReason](v9, "resolutionReason"))
          {
            -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDClientEventBehavior activeModeUUID](v9, "activeModeUUID");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v18 == (void *)v19)
            {

              v13 = 1;
              v14 = 1;
              goto LABEL_22;
            }
            v27 = (void *)v19;
            -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v26 = (void *)v20;
              -[DNDClientEventBehavior activeModeUUID](v9, "activeModeUUID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v25 = v21;
                -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDClientEventBehavior activeModeUUID](v9, "activeModeUUID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v24, "isEqual:", v23);

                v21 = v25;
              }
              else
              {
                v13 = 0;
              }

              v14 = v13;
LABEL_22:
              if (v10 != v11)
                goto LABEL_23;
LABEL_25:

              goto LABEL_26;
            }

          }
        }
      }
      v13 = 0;
      v14 = 0;
      goto LABEL_22;
    }
    v14 = 0;
  }
LABEL_26:

  return v14;
}

- (id)description
{
  return -[DNDClientEventBehavior _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (NSString)redactedDescription
{
  return (NSString *)-[DNDClientEventBehavior _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[DNDClientEventBehavior eventDetails](self, "eventDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7;
  if (v3)
  {
    objc_msgSend(v7, "redactedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  DNDStringFromInterruptionSuppression(-[DNDClientEventBehavior interruptionSuppression](self, "interruptionSuppression"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDIntelligentInterruptionBehaviorToString(-[DNDClientEventBehavior intelligentBehavior](self, "intelligentBehavior"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DNDResolutionReasonToString(-[DNDClientEventBehavior resolutionReason](self, "resolutionReason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; eventDetails: %@; interruptionSuppression: %@; intelligentBehavior: %@; resolutionReason: %@; activeModeUUID: %@>"),
    v6,
    self,
    v9,
    v10,
    v11,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDClientEventBehavior)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  DNDClientEventBehavior *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDetails"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptionSuppression"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intelligentBehavior"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resolutionReason"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeModeUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDClientEventBehavior initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:](self, "initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DNDClientEventBehavior eventDetails](self, "eventDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventDetails"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior interruptionSuppression](self, "interruptionSuppression"), CFSTR("interruptionSuppression"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior intelligentBehavior](self, "intelligentBehavior"), CFSTR("intelligentBehavior"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventBehavior resolutionReason](self, "resolutionReason"), CFSTR("resolutionReason"));
  -[DNDClientEventBehavior activeModeUUID](self, "activeModeUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeModeUUID"));

}

- (DNDClientEventDetails)eventDetails
{
  return self->_eventDetails;
}

- (unint64_t)interruptionSuppression
{
  return self->_interruptionSuppression;
}

- (int64_t)intelligentBehavior
{
  return self->_intelligentBehavior;
}

- (unint64_t)resolutionReason
{
  return self->_resolutionReason;
}

- (NSUUID)activeModeUUID
{
  return self->_activeModeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModeUUID, 0);
  objc_storeStrong((id *)&self->_eventDetails, 0);
}

@end
