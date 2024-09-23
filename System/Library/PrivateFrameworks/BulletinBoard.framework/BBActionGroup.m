@implementation BBActionGroup

+ (id)actionGroupWithActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setActions:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BBActionGroup *v4;
  BBActionGroup *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (BBActionGroup *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)BBActionGroup;
      if (-[BBAction isEqual:](&v10, sel_isEqual_, v5))
      {
        -[BBActionGroup actions](self, "actions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBActionGroup actions](v5, "actions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = BSEqualObjects();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BBActionGroup;
  v3 = -[BBAction hash](&v7, sel_hash);
  -[BBActionGroup actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BBActionGroup)initWithCoder:(id)a3
{
  id v4;
  BBActionGroup *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBActionGroup;
  v5 = -[BBAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    BBAllowedClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("actions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBActionGroup setActions:](v5, "setActions:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBActionGroup;
  v4 = a3;
  -[BBAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BBActionGroup actions](self, "actions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
