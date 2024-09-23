@implementation DIAttributePicker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributePicker;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickerItems, CFSTR("pickerItems"), v5.receiver, v5.super_class);

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributePicker)initWithCoder:(id)a3
{
  id v4;
  DIAttributePicker *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *pickerItems;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAttributePicker;
  v5 = -[DIAttribute initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("pickerItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v9;

  }
  return v5;
}

- (DIAttributePicker)init
{
  DIAttributePicker *v2;
  DIAttributePicker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributePicker;
  v2 = -[DIAttribute init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 5);
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  -[DIAttribute setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  -[DIAttribute setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (void)setPickerItems:(id)a3
{
  NSArray *v4;
  NSArray *pickerItems;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_pickerItems != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    pickerItems = self->_pickerItems;
    self->_pickerItems = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (DIAttributePickerItem)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (DIAttributePickerItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (DIAttributePickerItem)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (DIAttributePickerItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)pickerItems
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_pickerItems;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)DIAttributePicker;
  -[DIAttribute description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[DIAttributePicker defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v6);

  -[DIAttributePicker getCurrentValue](self, "getCurrentValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: '%@'; "), v8);

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_pickerItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    picker item: '%@'\n"), v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItems, 0);
}

@end
