@implementation GEODefaultsDBArray

+ (id)dbValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithParent:type:value:", v3, CFSTR("arr"), v5);

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = 0;
  if (objc_msgSend(v4, "scanInteger:", &v8))
  {
    v6 = v8;
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v6 >= objc_msgSend(self->super.super._value, "count"))
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(self->super.super._value, "objectAtIndexedSubscript:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v5;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id value;
  unint64_t v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (objc_msgSend(v7, "scanInteger:", &v10))
  {
    v8 = v10;
    if ((v10 & 0x8000000000000000) != 0 || v8 >= objc_msgSend(self->super.super._value, "count"))
    {
      if (v6)
        objc_msgSend(self->super.super._value, "addObject:", v6);
    }
    else
    {
      value = self->super.super._value;
      if (v6)
        objc_msgSend(value, "setObject:atIndexedSubscript:", v6, v10);
      else
        objc_msgSend(value, "removeObjectAtIndex:", v10);
    }
  }

}

- (unint64_t)count
{
  return objc_msgSend(self->super.super._value, "count");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  objc_msgSend(self->super.super._value, "enumerateObjectsUsingBlock:", a3);
}

@end
