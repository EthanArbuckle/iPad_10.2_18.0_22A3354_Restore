@implementation ASDInstallationEvent

- (ASDInstallationEvent)initWithPhase:(int64_t)a3 terminalPhase:(int64_t)a4 bundleID:(id)a5 itemID:(id)a6 appType:(int64_t)a7 installType:(int64_t)a8
{
  id v14;
  id v15;
  ASDInstallationEvent *v16;
  ASDInstallationEvent *v17;
  objc_super v19;

  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASDInstallationEvent;
  v16 = -[ASDInstallationEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_phase = a3;
    v16->_terminalPhase = a4;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    objc_storeStrong((id *)&v17->_itemID, a6);
    v17->_installType = a8;
  }

  return v17;
}

- (int64_t)source
{
  return 1;
}

- (int64_t)appType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDInstallationEvent)initWithCoder:(id)a3
{
  id v4;
  ASDInstallationEvent *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = (ASDInstallationEvent *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_phase"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_terminalPhase"));
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_installType"))) != 0)
        {
          self = -[ASDInstallationEvent initWithPhase:terminalPhase:bundleID:itemID:appType:installType:](self, "initWithPhase:terminalPhase:bundleID:itemID:appType:installType:", v5, v7, v8, v9, 1, v10);
          v5 = self;
        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t phase;
  id v5;

  phase = self->_phase;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", phase, CFSTR("_phase"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalPhase, CFSTR("_terminalPhase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("_itemID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installType, CFSTR("_installType"));

}

- (int64_t)phase
{
  return self->_phase;
}

- (int64_t)terminalPhase
{
  return self->_terminalPhase;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)installType
{
  return self->_installType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
