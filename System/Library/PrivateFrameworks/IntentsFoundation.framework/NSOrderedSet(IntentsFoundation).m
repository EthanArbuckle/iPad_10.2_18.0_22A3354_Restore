@implementation NSOrderedSet(IntentsFoundation)

- (id)if_orderedSetByAddingObjectsFromArray:()IntentsFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)if_orderedSetByAddingObjectsFromOrderedSet:()IntentsFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "unionOrderedSet:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)if_orderedSetByAddingObject:()IntentsFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addObject:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)if_map:()IntentsFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__NSOrderedSet_IntentsFoundation__if_map___block_invoke;
  v8[3] = &unk_1E9778728;
  v9 = v4;
  v5 = v4;
  _IFOrderedSetTransform(a1, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)if_compactMap:()IntentsFoundation
{
  return _IFOrderedSetTransform(a1, a3);
}

@end
