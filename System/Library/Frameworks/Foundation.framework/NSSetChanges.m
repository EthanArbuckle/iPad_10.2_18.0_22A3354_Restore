@implementation NSSetChanges

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSSetChanges == a1)
    return +[NSSetChanges allocWithZone:](NSConcreteSetChanges, "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSetChanges;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 0;
}

- (void)addChange:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
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

- (void)addObject:(id)a3
{
  NSSetChange *v4;

  v4 = -[NSSetChange initWithType:object:]([NSSetChange alloc], "initWithType:object:", 2, a3);
  -[NSSetChanges addChange:](self, "addChange:", v4);

}

- (void)removeObject:(id)a3
{
  NSSetChange *v4;

  v4 = -[NSSetChange initWithType:object:]([NSSetChange alloc], "initWithType:object:", 3, a3);
  -[NSSetChanges addChange:](self, "addChange:", v4);

}

- (void)applyChangesToSet:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__NSSetChanges_NSSetChangeActions__applyChangesToSet___block_invoke;
  v3[3] = &unk_1E0F51078;
  v3[4] = a3;
  -[NSSetChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v3);
}

uint64_t __54__NSSetChanges_NSSetChangeActions__applyChangesToSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (objc_msgSend(a2, "changeType") == 2)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "value"));
  result = objc_msgSend(a2, "changeType");
  if (result == 3)
    return objc_msgSend(*(id *)(a1 + 32), "removeObject:", objc_msgSend(a2, "value"));
  return result;
}

@end
