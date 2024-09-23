@implementation DMFSetAppRemovabilityRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4DC0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppRemovabilityRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppRemovabilityRequest *v5;
  void *v6;
  uint64_t v7;
  NSNumber *removable;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppRemovabilityRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("removable"));
    v7 = objc_claimAutoreleasedReturnValue();
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppRemovabilityRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFSetAppRemovabilityRequest removable](self, "removable", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("removable"));

}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removable, 0);
}

@end
