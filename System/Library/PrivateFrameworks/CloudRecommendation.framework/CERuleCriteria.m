@implementation CERuleCriteria

- (CERuleCriteria)initWithDictionary:(id)a3
{
  id v4;
  CERuleCriteria *v5;
  CERuleCriteria *v6;
  void *v7;
  NSNumber *v8;
  NSObject *p_super;
  void *v10;
  NSNumber *v11;
  NSObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CERuleCriteria;
  v5 = -[CERuleCriteria init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      p_super = &v6->_min->super.super;
      v6->_min = v8;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERuleCriteria initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v12 = &v6->_max->super.super;
      v6->_max = v11;
    }
    else
    {
      _CELogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CERuleCriteria initWithDictionary:].cold.1();
    }

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CERuleCriteria min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("min"));

  -[CERuleCriteria max](self, "max");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("max"));

}

- (CERuleCriteria)initWithCoder:(id)a3
{
  id v4;
  CERuleCriteria *v5;
  CERuleCriteria *v6;
  uint64_t v7;
  NSNumber *min;
  uint64_t v9;
  NSNumber *max;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CERuleCriteria;
  v5 = -[CERuleCriteria init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("min"));
    v7 = objc_claimAutoreleasedReturnValue();
    min = v6->_min;
    v6->_min = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("max"));
    v9 = objc_claimAutoreleasedReturnValue();
    max = v6->_max;
    v6->_max = (NSNumber *)v9;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERuleCriteria *v4;
  void *v5;
  void *v6;

  v4 = -[CERuleCriteria init](+[CERuleCriteria allocWithZone:](CERuleCriteria, "allocWithZone:", a3), "init");
  v4->_lock._os_unfair_lock_opaque = 0;
  -[CERuleCriteria min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleCriteria setMin:](v4, "setMin:", v5);

  -[CERuleCriteria max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleCriteria setMax:](v4, "setMax:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CERuleCriteria min](self, "min");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleCriteria max](self, "max");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Criteria with min: %@, max: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)min
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_min;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)max
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_max;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMin:(id)a3
{
  NSNumber *v4;
  NSNumber *min;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  min = self->_min;
  self->_min = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMax:(id)a3
{
  NSNumber *v4;
  NSNumber *max;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  max = self->_max;
  self->_max = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ unable to parse max from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ unable to parse min from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
