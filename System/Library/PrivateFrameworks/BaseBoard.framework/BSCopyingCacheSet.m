@implementation BSCopyingCacheSet

- (id)immutableSet
{
  NSSet *immutable;
  NSSet *v4;
  NSSet *v5;

  immutable = self->_immutable;
  if (!immutable)
  {
    v4 = (NSSet *)-[NSMutableSet copy](self->_mutable, "copy");
    v5 = self->_immutable;
    self->_immutable = v4;

    immutable = self->_immutable;
  }
  return immutable;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (v4)
    v5 = -[NSMutableSet containsObject:](self->_mutable, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)addObject:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSSet *immutable;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4 && (-[NSMutableSet containsObject:](self->_mutable, "containsObject:", v4) & 1) == 0)
  {
    v5 = self->_mutable;
    if (v5)
    {
      -[NSMutableSet addObject:](v5, "addObject:", v4);
    }
    else
    {
      v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v9, 1);
      v7 = self->_mutable;
      self->_mutable = v6;

    }
    immutable = self->_immutable;
    self->_immutable = 0;

    v4 = v9;
  }

}

- (void)removeObject:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  NSMutableSet *v7;
  NSSet *immutable;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSMutableSet containsObject:](self->_mutable, "containsObject:", v4);
    v4 = v9;
    if (v5)
    {
      v6 = -[NSMutableSet count](self->_mutable, "count");
      v7 = self->_mutable;
      if (v6 == 1)
      {
        self->_mutable = 0;

      }
      else
      {
        -[NSMutableSet removeObject:](v7, "removeObject:", v9);
      }
      immutable = self->_immutable;
      self->_immutable = 0;

      v4 = v9;
    }
  }

}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_mutable, "count");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> -> %@"), objc_opt_class(), self, self->_mutable);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutable, 0);
  objc_storeStrong((id *)&self->_mutable, 0);
}

@end
