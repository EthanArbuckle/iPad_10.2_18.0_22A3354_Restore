@implementation DMFFetchAvailableOSUpdatesResultObject

- (DMFFetchAvailableOSUpdatesResultObject)init
{
  return -[DMFFetchAvailableOSUpdatesResultObject initWithUpdate:](self, "initWithUpdate:", 0);
}

- (DMFFetchAvailableOSUpdatesResultObject)initWithUpdate:(id)a3
{
  id v4;
  DMFFetchAvailableOSUpdatesResultObject *v5;
  uint64_t v6;
  DMFOSUpdate *update;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    update = v5->_update;
    v5->_update = (DMFOSUpdate *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAvailableOSUpdatesResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchAvailableOSUpdatesResultObject *v5;
  void *v6;
  uint64_t v7;
  DMFOSUpdate *update;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("update"));
    v7 = objc_claimAutoreleasedReturnValue();
    update = v5->_update;
    v5->_update = (DMFOSUpdate *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchAvailableOSUpdatesResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchAvailableOSUpdatesResultObject update](self, "update", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("update"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DMFFetchAvailableOSUpdatesResultObject update](self, "update");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[DMFFetchAvailableOSUpdatesResultObject update](self, "update");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (DMFOSUpdate)update
{
  return self->_update;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_update, 0);
}

@end
