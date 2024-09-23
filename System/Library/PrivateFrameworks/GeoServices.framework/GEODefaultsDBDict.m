@implementation GEODefaultsDBDict

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)objc_msgSend(self->super.super._value, "objectForKeyedSubscript:", a3);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  objc_msgSend(self->super.super._value, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (unint64_t)count
{
  return objc_msgSend(self->super.super._value, "count");
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  objc_msgSend(self->super.super._value, "setObject:forKeyedSubscript:", a3, a4);
}

+ (id)dbValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithParent:type:value:", v3, CFSTR("dict"), v5);

  return v6;
}

@end
