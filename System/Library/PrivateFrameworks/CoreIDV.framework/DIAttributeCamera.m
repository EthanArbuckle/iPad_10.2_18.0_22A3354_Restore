@implementation DIAttributeCamera

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeCamera;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scanRequirements, CFSTR("scanRequirements"), v5.receiver, v5.super_class);

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeCamera)initWithCoder:(id)a3
{
  id v4;
  DIAttributeCamera *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *scanRequirements;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAttributeCamera;
  v5 = -[DIAttribute initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scanRequirements"));
    v9 = objc_claimAutoreleasedReturnValue();
    scanRequirements = v5->_scanRequirements;
    v5->_scanRequirements = (NSArray *)v9;

  }
  return v5;
}

- (DIAttributeCamera)init
{
  DIAttributeCamera *v2;
  DIAttributeCamera *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeCamera;
  v2 = -[DIAttribute init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 9);
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCamera;
  -[DIAttribute setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setScanRequirements:(id)a3
{
  NSArray *v4;
  NSArray *scanRequirements;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_scanRequirements != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    scanRequirements = self->_scanRequirements;
    self->_scanRequirements = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (NSArray)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCamera;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeCamera;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)scanRequirements
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_scanRequirements;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)DIAttributeCamera;
  -[DIAttribute description](&v26, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("scanRequirements: [ \n"));
  os_unfair_lock_lock(&self->super._lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_scanRequirements;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    scanRequirement: '%@'\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: [ \n"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[DIAttributeCamera getCurrentValue](self, "getCurrentValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    image: '%@'\n"), v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanRequirements, 0);
}

@end
