@implementation NSConcreteOrderedSetChanges

- (NSConcreteOrderedSetChanges)init
{
  NSConcreteOrderedSetChanges *v2;
  objc_class *v3;
  uint64_t v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteOrderedSetChanges;
  v2 = -[NSConcreteOrderedSetChanges init](&v6, sel_init);
  v5 = 0;
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v2->_changes, v3, (uint64_t)&v5, 0);
  }
  return v2;
}

- (NSConcreteOrderedSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  NSConcreteOrderedSetChanges *v6;
  objc_class *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteOrderedSetChanges;
  v6 = -[NSConcreteOrderedSetChanges init](&v9, sel_init);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v6->_changes, v7, (uint64_t)a3, a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _NSOrderedChangesRelease((uint64_t)&self->_changes);
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteOrderedSetChanges;
  -[NSConcreteOrderedSetChanges dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSConcreteOrderedSetChanges *v4;

  v4 = +[NSOrderedSetChanges allocWithZone:](NSConcreteOrderedSetChanges, "allocWithZone:", a3);
  _NSOrderedChangesCopy((uint64_t)&self->_changes, (uint64_t)&v4->_changes);
  return v4;
}

- (unint64_t)count
{
  return -[isMutable count](self->_changes.objects, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[isMutable objectAtIndex:](self->_changes.objects, "objectAtIndex:", a3);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  -[isMutable getObjects:range:](self->_changes.objects, "getObjects:range:", a3, a4.location, a4.length);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[isMutable countByEnumeratingWithState:objects:count:](self->_changes.objects, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  _NSOrderedChangesSort((id *)&self->_changes.objects, a3.location, a3.length);
}

- (unint64_t)changeCount
{
  return self->_changes.list.count;
}

- (void)_enumerateChanges:(unint64_t)a3 stop:(BOOL *)a4 usingBlock:(id)a5
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__NSConcreteOrderedSetChanges__enumerateChanges_stop_usingBlock___block_invoke;
  v5[3] = &unk_1E0F4FEA8;
  v5[4] = a5;
  _NSOrderedChangesEnumerateChanges((uint64_t)&self->_changes, a3, a4, (uint64_t)v5);
}

void __65__NSConcreteOrderedSetChanges__enumerateChanges_stop_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSOrderedSetChange *v10;
  uint64_t v11;
  NSOrderedSetChange *v12;

  v10 = [NSOrderedSetChange alloc];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = a4;
  else
    v11 = a3;
  v12 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:](v10, "initWithType:sourceIndex:destinationIndex:value:", a2, v11, a4, a5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateChangesUsingBlock:(id)a3
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  -[NSConcreteOrderedSetChanges _enumerateChanges:stop:usingBlock:](self, "_enumerateChanges:stop:usingBlock:", 62, &v3, a3);
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  -[NSConcreteOrderedSetChanges _enumerateChanges:stop:usingBlock:](self, "_enumerateChanges:stop:usingBlock:", 1 << a3, &v4, a4);
}

- (void)addChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "sourceIndex");
  v6 = objc_msgSend(a3, "destinationIndex");
  -[NSConcreteOrderedSetChanges willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeCount"));
  v7 = objc_msgSend(a3, "changeType");
  if (v5 == v6)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  _NSOrderedChangesAddChange((uint64_t)&self->_changes, v7, v5, v6, (void *)objc_msgSend(a3, "value"));
  -[NSConcreteOrderedSetChanges didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeCount"));
}

@end
