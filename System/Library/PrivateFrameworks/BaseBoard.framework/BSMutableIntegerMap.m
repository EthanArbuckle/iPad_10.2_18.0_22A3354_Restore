@implementation BSMutableIntegerMap

- (id)copyWithZone:(_NSZone *)a3
{
  BSIntegerMap *v5;
  void *v6;
  id *v7;

  v5 = +[BSIntegerMap allocWithZone:](BSIntegerMap, "allocWithZone:");
  v6 = (void *)-[NSMapTable copyWithZone:](self->super._mapTable, "copyWithZone:", a3);
  v7 = -[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&v5->super.isa, v6, self->super._zeroIndexValue);

  return v7;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
  BSIntegerMapSetObjectForKey(self, a3, a4);
}

- (void)removeObjectForKey:(int64_t)a3
{
  BSIntegerMapRemoveObjectForKey(self, a3);
}

@end
