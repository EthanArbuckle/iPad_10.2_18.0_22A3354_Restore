@implementation HFActionBuilder

- (id)asGeneric
{
  sub_1DD427FC4();
  return HFActionBuilder.asGeneric()();
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

+ (id)actionBuilderForAction:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  void *v8;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = HFCharacteristicWriteActionBuilder;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = HFMediaPlaybackActionBuilder;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = HFShortcutActionBuilder;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = objc_opt_class();
          NSLog(CFSTR("Unknown action type %@!"), v10);
          v8 = 0;
          goto LABEL_10;
        }
        v7 = HFNaturalLightingActionBuilder;
      }
    }
  }
  v8 = (void *)objc_msgSend([v7 alloc], "initWithExistingObject:inHome:", v5, v6);
LABEL_10:

  return v8;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  return 0;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  return 0;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)copyForCreatingNewAction
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 95, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder copyForCreatingNewAction]", objc_opt_class());

  return 0;
}

- (id)getOrCreateAction
{
  void *v3;

  -[HFActionBuilder action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[HFActionBuilder createNewAction](self, "createNewAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)createNewAction
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 112, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder createNewAction]", objc_opt_class());

  return 0;
}

- (BOOL)isAffectedByEndEvents
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0CBA4D0];
  -[HFActionBuilder createNewAction](self, "createNewAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isActionAffectedByEndEvents:", v3);

  return (char)v2;
}

- (BOOL)isEquivalentToAction:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 123, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder isEquivalentToAction:]", objc_opt_class());

  return 0;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 129, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder hasSameTargetAsAction:]", objc_opt_class());

  return 0;
}

- (BOOL)hasSameTargetAsActionBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToArray:", v6);
  return (char)v4;
}

id __48__HFActionBuilder_hasSameTargetAsActionBuilder___block_invoke(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v1 = a1;
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_opt_class();
  v5 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v4)
  {
    objc_msgSend(v4, "lightProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "services");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      v11 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v7, "characteristic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

LABEL_12:
  return v11;
}

- (id)performValidation
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 163, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder performValidation]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)validationError
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 169, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder validationError]", objc_opt_class());

  return 0;
}

- (NSArray)containedAccessoryRepresentables
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 175, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFActionBuilder containedAccessoryRepresentables]", objc_opt_class());

  if (_MergedGlobals_6_1 != -1)
    dispatch_once(&_MergedGlobals_6_1, &__block_literal_global_23_0);
  return (NSArray *)(id)qword_1F03ED278;
}

void __51__HFActionBuilder_containedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1F03ED278;
  qword_1F03ED278 = v0;

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HFActionBuilder description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)compareToObject:(id)a3
{
  id v4;
  HFComparisonResult *v5;
  void *v6;

  v4 = a3;
  v5 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", self, v4);

  if (!v4)
  {
    +[HFDifference difference:priority:](HFDifference, "difference:priority:", CFSTR("comparedToNil"), 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v6);

  }
  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

@end
