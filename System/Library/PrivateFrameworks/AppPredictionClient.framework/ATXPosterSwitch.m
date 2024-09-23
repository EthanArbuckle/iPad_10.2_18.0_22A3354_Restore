@implementation ATXPosterSwitch

- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4
{
  return -[ATXPosterSwitch initWithLockscreenId:switchMechanism:outcome:duration:](self, "initWithLockscreenId:switchMechanism:outcome:duration:", a3, a4, CFSTR("unknown"), -1);
}

- (ATXPosterSwitch)initWithLockscreenId:(id)a3 switchMechanism:(id)a4 outcome:(id)a5 duration:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  ATXPosterSwitch *v13;
  uint64_t v14;
  NSString *lockscreenId;
  uint64_t v16;
  NSString *switchMechanism;
  uint64_t v18;
  NSString *outcome;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXPosterSwitch;
  v13 = -[ATXPosterSwitch init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    lockscreenId = v13->_lockscreenId;
    v13->_lockscreenId = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    switchMechanism = v13->_switchMechanism;
    v13->_switchMechanism = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    outcome = v13->_outcome;
    v13->_outcome = (NSString *)v18;

    v13->_duration = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterSwitch)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ATXPosterSwitch *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockscreenId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("switchMechanism"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outcome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("duration"));

  v9 = -[ATXPosterSwitch initWithLockscreenId:switchMechanism:outcome:duration:](self, "initWithLockscreenId:switchMechanism:outcome:duration:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ATXPosterSwitch lockscreenId](self, "lockscreenId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("lockscreenId"));

  -[ATXPosterSwitch switchMechanism](self, "switchMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("switchMechanism"));

  -[ATXPosterSwitch outcome](self, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("outcome"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXPosterSwitch duration](self, "duration"), CFSTR("duration"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXPosterSwitch *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXPosterSwitch *v10;

  v3 = self;
  -[ATXPosterSwitch lockscreenId](v3, "lockscreenId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[ATXPosterSwitch switchMechanism](v3, "switchMechanism");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[ATXPosterSwitch outcome](v3, "outcome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = -[ATXPosterSwitch initWithLockscreenId:switchMechanism:outcome:duration:](v3, "initWithLockscreenId:switchMechanism:outcome:duration:", v5, v7, v9, -[ATXPosterSwitch duration](v3, "duration"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ATXPosterSwitch *v4;
  ATXPosterSwitch *v5;
  BOOL v6;

  v4 = (ATXPosterSwitch *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPosterSwitch isEqualToATXPosterSwitch:](self, "isEqualToATXPosterSwitch:", v5);

  return v6;
}

- (BOOL)isEqualToATXPosterSwitch:(id)a3
{
  id *v4;
  NSString *lockscreenId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *switchMechanism;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *outcome;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  BOOL v20;
  int64_t duration;

  v4 = (id *)a3;
  lockscreenId = self->_lockscreenId;
  v6 = (NSString *)v4[1];
  if (lockscreenId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = lockscreenId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  switchMechanism = self->_switchMechanism;
  v11 = (NSString *)v4[2];
  if (switchMechanism == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = switchMechanism;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  outcome = self->_outcome;
  v16 = (NSString *)v4[3];
  if (outcome == v16)
  {

    goto LABEL_13;
  }
  v17 = v16;
  v18 = outcome;
  v19 = -[NSString isEqual:](v18, "isEqual:", v17);

  if ((v19 & 1) != 0)
  {
LABEL_13:
    duration = self->_duration;
    v20 = duration == objc_msgSend(v4, "duration");
    goto LABEL_14;
  }
LABEL_11:
  v20 = 0;
LABEL_14:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[ATXPosterSwitch lockscreenId](self, "lockscreenId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXPosterSwitch switchMechanism](self, "switchMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ATXPosterSwitch outcome](self, "outcome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  return -[ATXPosterSwitch duration](self, "duration") - v8 + 32 * v8;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (NSString)switchMechanism
{
  return self->_switchMechanism;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_switchMechanism, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
