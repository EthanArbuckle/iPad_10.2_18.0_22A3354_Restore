@implementation BSMutableIntegerSet

- (BOOL)addValue:(int64_t)a3
{
  BOOL result;

  if (a3)
    return NSHashInsertIfAbsent(self->super._hashTable, (const void *)a3) == 0;
  if (self->super._hasZeroValue)
    return 0;
  result = 1;
  self->super._hasZeroValue = 1;
  return result;
}

- (void)unionSet:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[NSHashTable unionHashTable:](self->super._hashTable, "unionHashTable:", v4[1]);
    v4 = v5;
    if (*((_BYTE *)v5 + 16))
      self->super._hasZeroValue = 1;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  BSIntegerSet *v5;
  void *v6;
  _BYTE *v7;

  v5 = +[BSIntegerSet allocWithZone:](BSIntegerSet, "allocWithZone:");
  v6 = (void *)-[NSHashTable copyWithZone:](self->super._hashTable, "copyWithZone:", a3);
  v7 = -[BSIntegerSet _initWithHashTable:hasZeroValue:](v5, v6, self->super._hasZeroValue);

  return v7;
}

- (void)removeValue:(int64_t)a3
{
  if (a3)
    NSHashRemove(self->super._hashTable, (const void *)a3);
  else
    self->super._hasZeroValue = 0;
}

- (void)removeAllValues
{
  -[NSHashTable removeAllObjects](self->super._hashTable, "removeAllObjects");
  self->super._hasZeroValue = 0;
}

- (void)minusSet:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[NSHashTable minusHashTable:](self->super._hashTable, "minusHashTable:", v4[1]);
    v4 = v5;
    if (*((_BYTE *)v5 + 16))
      self->super._hasZeroValue = 0;
  }

}

@end
