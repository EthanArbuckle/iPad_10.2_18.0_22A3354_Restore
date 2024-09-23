@implementation DACLifecycleInfo

- (id)_initWithActivity:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 origin:(id)a6 changeMarker:(id)a7
{
  id v13;
  id v14;
  id v15;
  DACLifecycleInfo *v16;
  DACLifecycleInfo *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)DACLifecycleInfo;
  v16 = -[DACLifecycleInfo init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activity, a3);
    v17->_state = a4;
    v17->_reason = a5;
    objc_storeStrong((id *)&v17->_origin, a6);
    objc_storeStrong((id *)&v17->_changeMarker, a7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DACLifecycleInfo activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DACLifecycleInfo state](self, "state");
  v6 = -[DACLifecycleInfo reason](self, "reason");
  -[DACLifecycleInfo origin](self, "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Activity(%@) State(%lu) Reason(%lu) Origin(%@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[DACLifecycleInfo activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activity"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACLifecycleInfo state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACLifecycleInfo reason](self, "reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reason"));

  -[DACLifecycleInfo origin](self, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("origin"));

  -[DACLifecycleInfo changeMarker](self, "changeMarker");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("changeMarker"));

}

- (DACLifecycleInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  DACLifecycleInfo *v12;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    v12 = 0;
    v5 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("origin"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeMarker"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && v6 && v8)
    {
      v12 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](self, "_initWithActivity:state:reason:origin:changeMarker:", v5, v7, v9, v10, v11);
    }
    else
    {

      v12 = 0;
    }

  }
  return v12;
}

- (DACActivityDescriptor)activity
{
  return self->_activity;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (DACActivityDescriptor)origin
{
  return self->_origin;
}

- (DACChangeMarker)changeMarker
{
  return self->_changeMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
