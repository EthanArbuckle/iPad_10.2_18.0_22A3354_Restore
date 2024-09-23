@implementation ACMutableTrackedSet

- (void)addObject:(id)a3
{
  NSMutableSet *underlyingSet;
  id v5;

  underlyingSet = self->super._underlyingSet;
  v5 = a3;
  -[NSMutableSet addObject:](underlyingSet, "addObject:", v5);
  -[NSMutableDictionary setObject:forKey:](self->super._changesDictionary, "setObject:forKey:", CFSTR("ACChangeTypeAdded"), v5);

}

- (void)removeObject:(id)a3
{
  NSMutableSet *underlyingSet;
  id v5;

  underlyingSet = self->super._underlyingSet;
  v5 = a3;
  -[NSMutableSet removeObject:](underlyingSet, "removeObject:", v5);
  -[NSMutableDictionary setObject:forKey:](self->super._changesDictionary, "setObject:forKey:", CFSTR("ACChangeTypeRemoved"), v5);

}

- (void)addObjectsFromArray:(id)a3
{
  NSMutableSet *underlyingSet;
  id v5;
  _QWORD v6[5];

  underlyingSet = self->super._underlyingSet;
  v5 = a3;
  -[NSMutableSet addObjectsFromArray:](underlyingSet, "addObjectsFromArray:", v5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__ACMutableTrackedSet_addObjectsFromArray___block_invoke;
  v6[3] = &unk_1E4894A60;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __43__ACMutableTrackedSet_addObjectsFromArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", CFSTR("ACChangeTypeAdded"), a2);
}

@end
