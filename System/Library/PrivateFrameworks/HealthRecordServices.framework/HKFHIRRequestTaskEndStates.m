@implementation HKFHIRRequestTaskEndStates

- (HKFHIRRequestTaskEndStates)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKFHIRRequestTaskEndStates)initWithEndStates:(id)a3
{
  id v4;
  HKFHIRRequestTaskEndStates *v5;
  uint64_t v6;
  NSArray *objects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFHIRRequestTaskEndStates;
  v5 = -[HKFHIRRequestTaskEndStates init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    objects = v5->_objects;
    v5->_objects = (NSArray *)v6;

  }
  return v5;
}

- (HKFHIRRequestTaskEndStates)initWithEndState:(id)a3
{
  id v5;
  void *v6;
  HKFHIRRequestTaskEndStates *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRRequestTaskEndState.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endState"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKFHIRRequestTaskEndStates initWithEndStates:](self, "initWithEndStates:", v6);

  return v7;
}

- (HKFHIRRequestTaskEndState)firstObject
{
  return (HKFHIRRequestTaskEndState *)-[NSArray firstObject](self->_objects, "firstObject");
}

- (NSString)eventLoggingDescription
{
  return -[NSArray componentsJoinedByString:](self->_objects, "componentsJoinedByString:", CFSTR("; "));
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_objects, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKFHIRRequestTaskEndStates *v4;
  HKFHIRRequestTaskEndStates *v5;
  HKFHIRRequestTaskEndStates *v6;
  NSArray *objects;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  char v12;

  v4 = (HKFHIRRequestTaskEndStates *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objects = self->_objects;
      -[HKFHIRRequestTaskEndStates objects](v6, "objects");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (objects == v8)
      {
        v12 = 1;
      }
      else
      {
        -[HKFHIRRequestTaskEndStates objects](v6, "objects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_objects;
          -[HKFHIRRequestTaskEndStates objects](v6, "objects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSArray isEqualToArray:](v10, "isEqualToArray:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_objects, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_objects, CFSTR("objects"));
}

- (HKFHIRRequestTaskEndStates)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKFHIRRequestTaskEndStates *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("objects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[HKFHIRRequestTaskEndStates initWithEndStates:](self, "initWithEndStates:", v6);
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
