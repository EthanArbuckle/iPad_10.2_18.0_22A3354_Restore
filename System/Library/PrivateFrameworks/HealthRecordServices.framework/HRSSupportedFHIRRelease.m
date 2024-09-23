@implementation HRSSupportedFHIRRelease

- (HRSSupportedFHIRRelease)initWithFHIRRelease:(id)a3 resourceTypes:(id)a4
{
  id v7;
  id v8;
  HRSSupportedFHIRRelease *v9;
  HRSSupportedFHIRRelease *v10;
  uint64_t v11;
  NSSet *resourceTypes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HRSSupportedFHIRRelease;
  v9 = -[HRSSupportedFHIRRelease init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_FHIRRelease, a3);
    v11 = objc_msgSend(v8, "copy");
    resourceTypes = v10->_resourceTypes;
    v10->_resourceTypes = (NSSet *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HRSSupportedFHIRRelease *v4;
  HRSSupportedFHIRRelease *v5;
  HRSSupportedFHIRRelease *v6;
  NSString *FHIRRelease;
  NSString *v8;
  char v9;
  NSSet *resourceTypes;
  void *v11;

  v4 = (HRSSupportedFHIRRelease *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      FHIRRelease = self->_FHIRRelease;
      -[HRSSupportedFHIRRelease FHIRRelease](v6, "FHIRRelease");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (FHIRRelease == v8)
      {
        resourceTypes = self->_resourceTypes;
        -[HRSSupportedFHIRRelease resourceTypes](v6, "resourceTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSSet isEqualToSet:](resourceTypes, "isEqualToSet:", v11);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_FHIRRelease, "hash");
  return -[NSSet hash](self->_resourceTypes, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *FHIRRelease;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FHIRRelease = self->_FHIRRelease;
  -[NSSet allObjects](self->_resourceTypes, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p \"%@\", %@>"), v5, self, FHIRRelease, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *FHIRRelease;
  id v5;

  FHIRRelease = self->_FHIRRelease;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", FHIRRelease, CFSTR("FHIRRelease"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceTypes, CFSTR("FHIRResourceTypes"));

}

- (HRSSupportedFHIRRelease)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HRSSupportedFHIRRelease *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRRelease"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    HKFHIRReleaseFromNSString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForSetOf:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("FHIRResourceTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    self = -[HRSSupportedFHIRRelease initWithFHIRRelease:resourceTypes:](self, "initWithFHIRRelease:resourceTypes:", v6, v8);
    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (NSSet)resourceTypes
{
  return self->_resourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceTypes, 0);
  objc_storeStrong((id *)&self->_FHIRRelease, 0);
}

@end
