@implementation CNMutableOrderedDictionary

- (CNMutableOrderedDictionary)initWithDictionary:(id)a3 orderedKeys:(id)a4
{
  id v6;
  id v7;
  CNMutableOrderedDictionary *v8;
  CNMutableOrderedDictionary *v9;
  CNMutableOrderedDictionary *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNMutableOrderedDictionary;
  v8 = -[CNOrderedDictionary init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](v8->super._dictionary, "addEntriesFromDictionary:", v6);
    -[NSMutableArray addObjectsFromArray:](v9->super._orderedKeys, "addObjectsFromArray:", v7);
    v10 = v9;
  }

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->super._dictionary, "setObject:forKey:", v8, v6);
    if ((-[NSMutableArray containsObject:](self->super._orderedKeys, "containsObject:", v7) & 1) == 0)
      -[NSMutableArray addObject:](self->super._orderedKeys, "addObject:", v7);
  }
  else
  {
    -[CNMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", v6);
  }

}

- (void)removeObjectForKey:(id)a3
{
  NSMutableDictionary *dictionary;
  id v5;

  dictionary = self->super._dictionary;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", v5);
  -[NSMutableArray removeObject:](self->super._orderedKeys, "removeObject:", v5);

}

@end
