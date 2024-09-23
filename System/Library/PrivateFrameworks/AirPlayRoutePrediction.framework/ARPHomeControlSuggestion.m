@implementation ARPHomeControlSuggestion

- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 suggestionReason:(id)a8
{
  return -[ARPHomeControlSuggestion initWithHomeUUID:targetUUID:accessoryServiceUUID:type:score:computedScore:suggestionReason:](self, "initWithHomeUUID:targetUUID:accessoryServiceUUID:type:score:computedScore:suggestionReason:", a3, a4, a5, a6, a8, a7, a7);
}

- (ARPHomeControlSuggestion)initWithHomeUUID:(id)a3 targetUUID:(id)a4 accessoryServiceUUID:(id)a5 type:(int64_t)a6 score:(double)a7 computedScore:(double)a8 suggestionReason:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  ARPHomeControlSuggestion *v20;
  uint64_t v21;
  NSString *homeUUID;
  uint64_t v23;
  NSString *targetUUID;
  uint64_t v25;
  NSString *accessoryServiceUUID;
  uint64_t v27;
  NSString *suggestionReason;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ARPHomeControlSuggestion;
  v20 = -[ARPHomeControlSuggestion init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    targetUUID = v20->_targetUUID;
    v20->_targetUUID = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    accessoryServiceUUID = v20->_accessoryServiceUUID;
    v20->_accessoryServiceUUID = (NSString *)v25;

    v20->_type = a6;
    v20->_score = a7;
    v20->_computedScore = a8;
    v27 = objc_msgSend(v19, "copy");
    suggestionReason = v20->_suggestionReason;
    v20->_suggestionReason = (NSString *)v27;

  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = -[ARPHomeControlSuggestion type](self, "type");
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[ARPHomeControlSuggestion score](self, "score");
  v8 = v7;
  NSStringFromSelector(sel_score);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v9, v8);

  -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_homeUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

  -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_targetUUID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

  -[ARPHomeControlSuggestion accessoryServiceUUID](self, "accessoryServiceUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accessoryServiceUUID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v15);

  -[ARPHomeControlSuggestion suggestionReason](self, "suggestionReason");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_suggestionReason);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v16);

}

- (ARPHomeControlSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  ARPHomeControlSuggestion *v22;

  v4 = a3;
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v4, "decodeIntForKey:", v5);

  NSStringFromSelector(sel_score);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v7);
  v9 = v8;

  v10 = objc_opt_class();
  NSStringFromSelector(sel_homeUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_targetUUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_accessoryServiceUUID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  NSStringFromSelector(sel_suggestionReason);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[ARPHomeControlSuggestion initWithHomeUUID:targetUUID:accessoryServiceUUID:type:score:suggestionReason:](self, "initWithHomeUUID:targetUUID:accessoryServiceUUID:type:score:suggestionReason:", v12, v15, v18, v6, v21, v9);
  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_homeUUID, "hash");
  v4 = -[NSString hash](self->_targetUUID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_accessoryServiceUUID, "hash") ^ self->_type;
}

- (BOOL)isEqual:(id)a3
{
  ARPHomeControlSuggestion *v4;
  ARPHomeControlSuggestion *v5;
  ARPHomeControlSuggestion *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;

  v4 = (ARPHomeControlSuggestion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_20;
        v8 = (void *)v7;
        -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[ARPHomeControlSuggestion homeUUID](v6, "homeUUID");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            -[ARPHomeControlSuggestion targetUUID](v6, "targetUUID");
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;
              -[ARPHomeControlSuggestion accessoryServiceUUID](self, "accessoryServiceUUID");
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = (void *)v15;
                -[ARPHomeControlSuggestion accessoryServiceUUID](v6, "accessoryServiceUUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                {
                  -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ARPHomeControlSuggestion homeUUID](v6, "homeUUID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v18, "isEqualToString:", v19))
                  {
                    -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ARPHomeControlSuggestion targetUUID](v6, "targetUUID");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v20, "isEqualToString:", v21))
                    {
                      -[ARPHomeControlSuggestion accessoryServiceUUID](self, "accessoryServiceUUID");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[ARPHomeControlSuggestion accessoryServiceUUID](v6, "accessoryServiceUUID");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v22, "isEqualToString:", v23))
                      {
                        v24 = -[ARPHomeControlSuggestion type](self, "type");
                        v25 = v24 == -[ARPHomeControlSuggestion type](v6, "type");
                      }
                      else
                      {
                        v25 = 0;
                      }

                      goto LABEL_33;
                    }
                    goto LABEL_30;
                  }
                  goto LABEL_28;
                }
LABEL_20:
                -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
                v26 = objc_claimAutoreleasedReturnValue();
                if (!v26)
                  goto LABEL_27;
                v18 = (void *)v26;
                -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
                v27 = objc_claimAutoreleasedReturnValue();
                if (!v27)
                {
                  v25 = 0;
LABEL_35:

                  goto LABEL_36;
                }
                v19 = (void *)v27;
                -[ARPHomeControlSuggestion homeUUID](v6, "homeUUID");
                v28 = objc_claimAutoreleasedReturnValue();
                if (!v28)
                  goto LABEL_28;
                v29 = (void *)v28;
                -[ARPHomeControlSuggestion targetUUID](v6, "targetUUID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v30)
                {
LABEL_27:
                  v25 = 0;
LABEL_36:

                  goto LABEL_37;
                }
                -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[ARPHomeControlSuggestion homeUUID](v6, "homeUUID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v18, "isEqualToString:", v19))
                {
                  -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ARPHomeControlSuggestion targetUUID](v6, "targetUUID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v20, "isEqualToString:", v21))
                  {
                    v31 = -[ARPHomeControlSuggestion type](self, "type");
                    v25 = v31 == -[ARPHomeControlSuggestion type](v6, "type");
LABEL_33:

                    goto LABEL_34;
                  }
LABEL_30:
                  v25 = 0;
                  goto LABEL_33;
                }
LABEL_28:
                v25 = 0;
LABEL_34:

                goto LABEL_35;
              }

            }
          }

        }
        goto LABEL_20;
      }
    }
    v25 = 0;
  }
LABEL_37:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ARPHomeControlSuggestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[ARPHomeControlSuggestion init](+[ARPHomeControlSuggestion allocWithZone:](ARPHomeControlSuggestion, "allocWithZone:", a3), "init");
  -[ARPHomeControlSuggestion setType:](v4, "setType:", -[ARPHomeControlSuggestion type](self, "type"));
  -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion setHomeUUID:](v4, "setHomeUUID:", v5);

  -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion setTargetUUID:](v4, "setTargetUUID:", v6);

  -[ARPHomeControlSuggestion accessoryServiceUUID](self, "accessoryServiceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion setAccessoryServiceUUID:](v4, "setAccessoryServiceUUID:", v7);

  -[ARPHomeControlSuggestion score](self, "score");
  -[ARPHomeControlSuggestion setScore:](v4, "setScore:");
  -[ARPHomeControlSuggestion suggestionReason](self, "suggestionReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion setSuggestionReason:](v4, "setSuggestionReason:", v8);

  return v4;
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
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ARPHomeControlSuggestion suggestionReason](self, "suggestionReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion targetUUID](self, "targetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlSuggestion accessoryServiceUUID](self, "accessoryServiceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ARPHomeControlSuggestion type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ARPHomeControlSuggestion score](self, "score");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> reason: %@, homeUUID: %@, targetUUID: %@, accessoryServiceUUID: %@, type: %@, score: %@"), v4, self, v5, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)targetUUID
{
  return self->_targetUUID;
}

- (void)setTargetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accessoryServiceUUID
{
  return self->_accessoryServiceUUID;
}

- (void)setAccessoryServiceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)computedScore
{
  return self->_computedScore;
}

- (void)setComputedScore:(double)a3
{
  self->_computedScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_accessoryServiceUUID, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end
