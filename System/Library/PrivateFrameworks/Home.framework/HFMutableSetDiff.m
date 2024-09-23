@implementation HFMutableSetDiff

- (HFMutableSetDiff)initWithFromSet:(id)a3
{
  id v4;
  HFMutableSetDiff *v5;
  uint64_t v6;
  NSSet *fromSet;
  uint64_t v8;
  NSMutableSet *toSet;
  uint64_t v10;
  NSMutableSet *additions;
  uint64_t v12;
  NSMutableSet *deletions;
  uint64_t v14;
  NSMutableSet *updates;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFMutableSetDiff;
  v5 = -[HFMutableSetDiff init](&v17, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    fromSet = v5->super._fromSet;
    v5->super._fromSet = (NSSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5->super._fromSet);
    v8 = objc_claimAutoreleasedReturnValue();
    toSet = v5->super._toSet;
    v5->super._toSet = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    additions = v5->super._additions;
    v5->super._additions = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    deletions = v5->super._deletions;
    v5->super._deletions = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    updates = v5->super._updates;
    v5->super._updates = (NSMutableSet *)v14;

  }
  return v5;
}

- (void)addObject:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[NSSet containsObject:](self->super._fromSet, "containsObject:", v5)
      && (-[NSMutableSet containsObject:](self->super._deletions, "containsObject:", v5) & 1) == 0)
    {
      NSLog(CFSTR("Attempting to add an object that already exists in set."));
    }
    -[NSMutableSet na_safeAddObject:](self->super._toSet, "na_safeAddObject:", v5);
    if (-[NSSet containsObject:](self->super._fromSet, "containsObject:", v5))
    {
      if (-[NSMutableSet containsObject:](self->super._deletions, "containsObject:", v5))
      {
        -[NSMutableSet removeObject:](self->super._deletions, "removeObject:", v5);
        -[NSMutableSet na_safeAddObject:](self->super._updates, "na_safeAddObject:", v5);
      }
    }
    else
    {
      -[NSMutableSet na_safeAddObject:](self->super._additions, "na_safeAddObject:", v5);
      -[NSMutableSet removeObject:](self->super._updates, "removeObject:", v5);
    }
    -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");
  }
  else
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Ignoring %@ %@ because object is nil", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)deleteObject:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet removeObject:](self->super._toSet, "removeObject:", v4);
  if (-[NSSet containsObject:](self->super._fromSet, "containsObject:", v4))
    -[NSMutableSet na_safeAddObject:](self->super._deletions, "na_safeAddObject:", v4);
  -[NSMutableSet removeObject:](self->super._additions, "removeObject:", v4);
  -[NSMutableSet removeObject:](self->super._updates, "removeObject:", v4);
  -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");

}

- (void)deleteAllObjects
{
  NSMutableSet *v3;
  NSMutableSet *deletions;

  -[NSMutableSet removeAllObjects](self->super._toSet, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->super._additions, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->super._updates, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->super._fromSet);
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  deletions = self->super._deletions;
  self->super._deletions = v3;

  -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");
}

- (void)updateObject:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSSet containsObject:](self->super._fromSet, "containsObject:")
    && (-[NSMutableSet containsObject:](self->super._toSet, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetDiff.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_fromSet containsObject:object] || [_toSet containsObject:object]"));

  }
  if (-[NSSet containsObject:](self->super._fromSet, "containsObject:", v6))
  {
    -[NSMutableSet na_safeAddObject:](self->super._updates, "na_safeAddObject:", v6);
    -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");
  }

}

- (void)addObjects:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    if (-[NSSet intersectsSet:](self->super._fromSet, "intersectsSet:", v8)
      && (-[NSMutableSet intersectsSet:](self->super._deletions, "intersectsSet:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetDiff.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![_fromSet intersectsSet:objects] || [_deletions intersectsSet:objects]"));

    }
    -[NSMutableSet unionSet:](self->super._toSet, "unionSet:", v8);
    -[NSMutableSet na_setByIntersectingWithSet:](self->super._deletions, "na_setByIntersectingWithSet:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](self->super._updates, "minusSet:", v6);
    -[NSMutableSet unionSet:](self->super._additions, "unionSet:", v6);
    -[NSMutableSet minusSet:](self->super._deletions, "minusSet:", v5);
    -[NSMutableSet unionSet:](self->super._updates, "unionSet:", v5);
    -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");

  }
}

- (void)updateObjects:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(v9, "count");
  v6 = v9;
  if (v5)
  {
    if (!-[NSSet intersectsSet:](self->super._fromSet, "intersectsSet:", v9)
      && (-[NSMutableSet intersectsSet:](self->super._toSet, "intersectsSet:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetDiff.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_fromSet intersectsSet:objects] || [_toSet intersectsSet:objects]"));

    }
    -[NSSet na_setByIntersectingWithSet:](self->super._fromSet, "na_setByIntersectingWithSet:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet unionSet:](self->super._updates, "unionSet:", v7);
    if (objc_msgSend(v7, "count"))
      -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");

    v6 = v9;
  }

}

- (void)deleteObjects:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[NSMutableSet minusSet:](self->super._toSet, "minusSet:", v5);
    -[NSSet na_setByIntersectingWithSet:](self->super._fromSet, "na_setByIntersectingWithSet:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet unionSet:](self->super._deletions, "unionSet:", v4);
    -[NSMutableSet minusSet:](self->super._additions, "minusSet:", v5);
    -[NSMutableSet minusSet:](self->super._updates, "minusSet:", v5);
    -[HFMutableSetDiff _updateHasChanges](self, "_updateHasChanges");

  }
}

- (void)_updateHasChanges
{
  BOOL v3;

  v3 = -[NSMutableSet count](self->super._additions, "count")
    || -[NSMutableSet count](self->super._deletions, "count")
    || -[NSMutableSet count](self->super._updates, "count") != 0;
  self->_hasChanges = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFSetDiff *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;

  v4 = [HFSetDiff alloc];
  -[HFSetDiff fromSet](self, "fromSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v16, "copy");
  -[HFSetDiff toSet](self, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HFSetDiff additions](self, "additions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[HFSetDiff deletions](self, "deletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[HFSetDiff updates](self, "updates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = -[HFSetDiff _initWithFromSet:toSet:additions:deletions:updates:](v4, "_initWithFromSet:toSet:additions:deletions:updates:", v5, v7, v9, v11, v13);

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableSetDiff *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;

  v4 = [HFMutableSetDiff alloc];
  -[HFSetDiff fromSet](self, "fromSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v16, "copy");
  -[HFSetDiff toSet](self, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HFSetDiff additions](self, "additions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[HFSetDiff deletions](self, "deletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[HFSetDiff updates](self, "updates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = -[HFSetDiff _initWithFromSet:toSet:additions:deletions:updates:](v4, "_initWithFromSet:toSet:additions:deletions:updates:", v5, v7, v9, v11, v13);

  objc_msgSend(v14, "_updateHasChanges");
  return v14;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

@end
