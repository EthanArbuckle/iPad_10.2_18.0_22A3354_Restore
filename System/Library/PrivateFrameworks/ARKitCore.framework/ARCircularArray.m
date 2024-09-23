@implementation ARCircularArray

- (ARCircularArray)initWithCapacity:(int64_t)a3
{
  ARCircularArray *v4;
  ARCircularArray *v5;
  int64_t v6;
  uint64_t v7;
  NSMutableOrderedSet *objects;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARCircularArray;
  v4 = -[ARCircularArray init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1)
      v6 = 1;
    else
      v6 = a3;
    v4->_capacity = v6;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:");
    v7 = objc_claimAutoreleasedReturnValue();
    objects = v5->_objects;
    v5->_objects = (NSMutableOrderedSet *)v7;

  }
  return v5;
}

- (NSArray)allObjects
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_objects, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)addObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableOrderedSet *objects;

  v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_objects, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[NSMutableOrderedSet count](self->_objects, "count");
    objects = self->_objects;
    if (v6 == self->_capacity)
    {
      -[NSMutableOrderedSet firstObject](objects, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet removeObject:](self->_objects, "removeObject:", v5);
      objects = self->_objects;
    }
    else
    {
      v5 = 0;
    }
    -[NSMutableOrderedSet addObject:](objects, "addObject:", v4);
  }

  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_objects, "containsObject:", a3);
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_objects, "count");
}

- (id)firstObject
{
  return (id)-[NSMutableOrderedSet firstObject](self->_objects, "firstObject");
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_objects, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (id)lastObject
{
  return (id)-[NSMutableOrderedSet lastObject](self->_objects, "lastObject");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_objects, "objectAtIndex:", a3);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](self->_objects, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
