@implementation CNMutableMultiDictionary

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNMultiDictionary objectsForKey:](self, "objectsForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](self->super._entries, "setObject:forKey:", v9, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNMultiDictionary initWithEntries:]([CNMultiDictionary alloc], "initWithEntries:", self->super._entries);
}

- (void)setObjects:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->super._entries, "setObject:forKey:", a3, a4);
}

- (void)addNonNilObject:(id)a3 forKey:(id)a4
{
  if (a3)
    -[CNMutableMultiDictionary addObject:forKey:](self, "addObject:forKey:", a3, a4);
}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *entries;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[CNMultiDictionary objectsForKey:](self, "objectsForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CNMutableMultiDictionary_removeObject_forKey___block_invoke;
  v14[3] = &unk_1E29B93D0;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsAtIndexes:", v10);
  v11 = objc_msgSend(v9, "count");
  entries = self->super._entries;
  if (v11)
    -[NSMutableDictionary setObject:forKey:](entries, "setObject:forKey:", v9, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](entries, "removeObjectForKey:", v7);

}

uint64_t __48__CNMutableMultiDictionary_removeObject_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

- (void)removeObjectsForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->super._entries, "removeObjectForKey:", a3);
}

@end
