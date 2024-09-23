@implementation NSArrayChanges

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSArrayChanges == a1)
    return +[NSArrayChanges allocWithZone:](NSConcreteArrayChanges, "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSArrayChanges;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSArrayChanges)initWithCoder:(id)a3
{
  NSArrayChanges *v4;
  unint64_t i;
  unint64_t v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSArrayChanges;
  v4 = -[NSArrayChanges init](&v8, sel_init);
  if (v4)
  {
    v7 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "Q", &v7, 8);
    if (v7)
    {
      for (i = 0; i < v7; ++i)
        -[NSArrayChanges addChange:](v4, "addChange:", objc_msgSend(a3, "decodeObject"));
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = -[NSArrayChanges changeCount](self, "changeCount");
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "Q", v6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__NSArrayChanges_encodeWithCoder___block_invoke;
  v5[3] = &unk_1E0F4FED0;
  v5[4] = a3;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v5);
}

uint64_t __34__NSArrayChanges_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:", a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArrayChanges *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v4 = -[NSArrayChanges init](+[NSArrayChanges allocWithZone:](NSArrayChanges, "allocWithZone:", a3), "init");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__NSArrayChanges_copyWithZone___block_invoke;
  v6[3] = &unk_1E0F4FED0;
  v6[4] = v4;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v6);
  return v4;
}

uint64_t __31__NSArrayChanges_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChange:", a2);
}

- (unint64_t)changeCount
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)addChange:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)updateObject:(id)a3 atIndex:(unint64_t)a4
{
  NSArrayChange *v5;

  v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 1, a4, a4, a3);
  -[NSArrayChanges addChange:](self, "addChange:", v5);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSArrayChange *v5;

  v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 4, a3, a3, a4);
  -[NSArrayChanges addChange:](self, "addChange:", v5);

}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSArrayChange *v5;

  v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 5, a3, a4, -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:", a3));
  -[NSArrayChanges addChange:](self, "addChange:", v5);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSArrayChange *v4;

  v4 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 3, a3, a3, 0);
  -[NSArrayChanges addChange:](self, "addChange:", v4);

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSArrayChange *v5;

  v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 2, a4, a4, a3);
  -[NSArrayChanges addChange:](self, "addChange:", v5);

}

- (void)applyChangesToArray:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__NSArrayChanges_NSArrayChangeActions__applyChangesToArray___block_invoke;
  v3[3] = &unk_1E0F4FED0;
  v3[4] = a3;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v3);
}

uint64_t __60__NSArrayChanges_NSArrayChangeActions__applyChangesToArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "changeType");
  switch(result)
  {
    case 1:
      return result;
    case 2:
      result = objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", objc_msgSend(a2, "value"), objc_msgSend(a2, "destinationIndex"));
      break;
    case 3:
      result = objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", objc_msgSend(a2, "destinationIndex"));
      break;
    case 4:
      result = objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", objc_msgSend(a2, "destinationIndex"), objc_msgSend(a2, "value"));
      break;
    default:
      result = objc_msgSend(a2, "changeType");
      if (result == 5)
        result = objc_msgSend(*(id *)(a1 + 32), "moveObjectsAtIndexes:toIndex:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(a2, "sourceIndex")), objc_msgSend(a2, "destinationIndex"));
      break;
  }
  return result;
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a3, "firstIndex");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    do
    {
      -[NSArrayChanges moveObjectAtIndex:toIndex:](self, "moveObjectAtIndex:toIndex:", v8, a4);
      v8 = objc_msgSend(a3, "indexGreaterThanIndex:", v8);
      ++a4;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSArrayChange *v11;
  NSArrayChange *v12;

  if (a3 != a4)
  {
    v4 = a4;
    v7 = -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:");
    v8 = -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:", v4);
    if (a3 <= v4)
      v9 = v7;
    else
      v9 = v8;
    if (a3 > v4)
    {
      v10 = a3;
    }
    else
    {
      v7 = v8;
      v10 = v4;
    }
    if (a3 < v4)
      v4 = a3;
    v11 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 5, v4, v10, v9);
    v12 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]([NSArrayChange alloc], "initWithType:sourceIndex:destinationIndex:value:", 5, v10 - 1, v4, v7);
    -[NSArrayChanges addChange:](self, "addChange:", v11);
    -[NSArrayChanges addChange:](self, "addChange:", v12);

  }
}

- (void)addChanges:(id)a3
{
  unint64_t v5;

  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    do
      -[NSArrayChanges addChange:](self, "addChange:", objc_msgSend(a3, "objectAtIndexedSubscript:", v5++));
    while (v5 < objc_msgSend(a3, "count"));
  }
}

- (void)addObject:(id)a3
{
  -[NSArrayChanges insertObject:atIndex:](self, "insertObject:atIndex:", a3, -[NSArrayChanges count](self, "count"));
}

- (void)removeLastObject
{
  uint64_t v3;

  v3 = -[NSArrayChanges count](self, "count");
  if (v3)
    -[NSArrayChanges removeObjectAtIndex:](self, "removeObjectAtIndex:", v3 - 1);
}

- (void)sortUsingFunction:(void *)a3 context:(void *)a4
{
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__NSArrayChanges_NSMutableArrayOverrides__sortUsingFunction_context___block_invoke;
  v4[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v4[4] = a3;
  v4[5] = a4;
  -[NSArrayChanges sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0, v4);
}

uint64_t __69__NSArrayChanges_NSMutableArrayOverrides__sortUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)sortUsingSelector:(SEL)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__NSArrayChanges_NSMutableArrayOverrides__sortUsingSelector___block_invoke;
  v3[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v3[4] = a3;
  -[NSArrayChanges sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0, v3);
}

id __61__NSArrayChanges_NSMutableArrayOverrides__sortUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(a2, *(SEL *)(a1 + 32));
}

@end
