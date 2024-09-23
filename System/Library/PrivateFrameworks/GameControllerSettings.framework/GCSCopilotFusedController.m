@implementation GCSCopilotFusedController

- (GCSCopilotFusedController)initWithFusedControllerIdentifier:(id)a3 pilotIdentifier:(id)a4 copilotIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  GCSCopilotFusedController *v11;
  uint64_t v12;
  NSString *fusedControllerIdentifier;
  uint64_t v14;
  NSString *pilotIdentifier;
  uint64_t v16;
  NSString *copilotIdentifier;
  uint64_t v18;
  NSDate *modifiedDate;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GCSCopilotFusedController;
  v11 = -[GCSCopilotFusedController init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    fusedControllerIdentifier = v11->_fusedControllerIdentifier;
    v11->_fusedControllerIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    pilotIdentifier = v11->_pilotIdentifier;
    v11->_pilotIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    copilotIdentifier = v11->_copilotIdentifier;
    v11->_copilotIdentifier = (NSString *)v16;

    +[NSDate date](&off_254DF3E30, "date");
    v18 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v11->_modifiedDate;
    v11->_modifiedDate = (NSDate *)v18;

  }
  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSCopilotFusedController '%@' '%@' + '%@'>"), self->_fusedControllerIdentifier, self->_pilotIdentifier, self->_copilotIdentifier);
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)fusedControllerIdentifier
{
  return self->_fusedControllerIdentifier;
}

- (NSString)pilotIdentifier
{
  return self->_pilotIdentifier;
}

- (NSString)copilotIdentifier
{
  return self->_copilotIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copilotIdentifier, 0);
  objc_storeStrong((id *)&self->_pilotIdentifier, 0);
  objc_storeStrong((id *)&self->_fusedControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
}

+ (id)archivalClasses
{
  uint64_t v2;

  v2 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSCopilotFusedController)initWithCoder:(id)a3
{
  id v4;
  GCSCopilotFusedController *v5;
  uint64_t v6;
  NSString *fusedControllerIdentifier;
  uint64_t v8;
  NSString *pilotIdentifier;
  uint64_t v10;
  NSString *copilotIdentifier;
  uint64_t v12;
  NSDate *modifiedDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCSCopilotFusedController;
  v5 = -[GCSCopilotFusedController init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fusedControllerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    fusedControllerIdentifier = v5->_fusedControllerIdentifier;
    v5->_fusedControllerIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pilotIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pilotIdentifier = v5->_pilotIdentifier;
    v5->_pilotIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_copilotIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    copilotIdentifier = v5->_copilotIdentifier;
    v5->_copilotIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modifiedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fusedControllerIdentifier;
  id v5;

  fusedControllerIdentifier = self->_fusedControllerIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fusedControllerIdentifier, CFSTR("_fusedControllerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pilotIdentifier, CFSTR("_pilotIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_copilotIdentifier, CFSTR("_copilotIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedDate, CFSTR("_modifiedDate"));

}

- (GCSCopilotFusedController)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSCopilotFusedController *v6;
  uint64_t v7;
  NSString *fusedControllerIdentifier;
  uint64_t v9;
  NSString *pilotIdentifier;
  uint64_t v11;
  NSString *copilotIdentifier;
  void *v13;
  void *v14;
  NSDate *v15;
  GCSCopilotFusedController *v16;
  NSDate *modifiedDate;
  objc_super v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v19.receiver = self;
    v19.super_class = (Class)GCSCopilotFusedController;
    v6 = -[GCSCopilotFusedController init](&v19, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("fusedControllerIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      fusedControllerIdentifier = v6->_fusedControllerIdentifier;
      v6->_fusedControllerIdentifier = (NSString *)v7;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("pilotIdentifier"));
      v9 = objc_claimAutoreleasedReturnValue();
      pilotIdentifier = v6->_pilotIdentifier;
      v6->_pilotIdentifier = (NSString *)v9;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("copilotIdentifier"));
      v11 = objc_claimAutoreleasedReturnValue();
      copilotIdentifier = v6->_copilotIdentifier;
      v6->_copilotIdentifier = (NSString *)v11;

      objc_msgSend(v5, "_gcs_dateForJSONKey:", CFSTR("modifiedDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        +[NSDate date](&off_254DF3E30, "date");
        v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v15;

    }
    self = v6;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GCSJSONObject)jsonObject
{
  __int128 v3;
  void *v4;
  void *v5;
  NSDate *modifiedDate;
  void *v7;
  _QWORD v9[3];
  __int128 v10;
  NSString *copilotIdentifier;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)&self->_fusedControllerIdentifier;
  v9[0] = CFSTR("fusedControllerIdentifier");
  v9[1] = CFSTR("pilotIdentifier");
  v10 = v3;
  v9[2] = CFSTR("copilotIdentifier");
  copilotIdentifier = self->_copilotIdentifier;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", &v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DF4A00, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  modifiedDate = self->_modifiedDate;
  if (modifiedDate)
  {
    -[NSDate jsonObject](modifiedDate, "jsonObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("modifiedDate"));

  }
  return (GCSJSONObject *)v5;
}

@end
