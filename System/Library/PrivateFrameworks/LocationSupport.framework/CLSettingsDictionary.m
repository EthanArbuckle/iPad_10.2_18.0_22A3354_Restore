@implementation CLSettingsDictionary

+ (id)settingsWithDictionary:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", a3);
}

- (CLSettingsDictionary)initWithDictionary:(id)a3
{
  CLSettingsDictionary *v4;
  CLSettingsDictionary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSettingsDictionary;
  v4 = -[CLSettingsDictionary init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[CLSettingsDictionary setDictionary:](v4, "setDictionary:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLSettingsDictionary setDictionary:](self, "setDictionary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsDictionary;
  -[CLSettingsDictionary dealloc](&v3, sel_dealloc);
}

- (BOOL)hasValueForKey:(id)a3
{
  return objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3) != 0;
}

- (id)dictionaryForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return +[CLSettingsDictionary settingsWithDictionary:](CLSettingsDictionary, "settingsWithDictionary:", v5);
  else
    return a4;
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return MEMORY[0x1E0DE7D20](v5, sel_BOOLValue);
  else
    return a4;
}

- (signed)shortForKey:(id)a3 defaultValue:(signed __int16)a4
{
  uint64_t v5;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return MEMORY[0x1E0DE7D20](v5, sel_shortValue);
  else
    return a4;
}

- (int)intForKey:(id)a3 defaultValue:(int)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v5, "intValue");
  else
    return a4;
}

- (int64_t)longForKey:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return MEMORY[0x1E0DE7D20](v5, sel_longValue);
  else
    return a4;
}

- (float)floatForKey:(id)a3 defaultValue:(float)a4
{
  uint64_t v5;
  float result;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return a4;
  MEMORY[0x1E0DE7D20](v5, sel_floatValue);
  return result;
}

- (double)doubleForKey:(id)a3 defaultValue:(double)a4
{
  uint64_t v5;
  double result;

  v5 = objc_msgSend(self->_internal, "objectForKeyedSubscript:", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return a4;
  MEMORY[0x1E0DE7D20](v5, sel_doubleValue);
  return result;
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(self->_internal, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0CB3940], sel_stringWithString_);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)MEMORY[0x1E0DE7D20](v5, sel_stringValue);
  return a4;
}

- (id)arrayForKey:(id)a3 defaultValue:(id)a4
{
  objc_msgSend(self->_internal, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0C99D20], sel_arrayWithArray_);
  else
    return a4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->_internal, "isEqual:", objc_msgSend(a3, "dictionary"));
  else
    return 0;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_internal;
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
