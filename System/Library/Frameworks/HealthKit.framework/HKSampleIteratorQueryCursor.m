@implementation HKSampleIteratorQueryCursor

- (HKSampleIteratorQueryCursor)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7
{
  return -[HKSampleIteratorQueryCursor initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:](self, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", a3, a4, a5, a6, a7, 0);
}

- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 state:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKSampleIteratorQueryCursor *v21;
  uint64_t v22;
  NSArray *queryDescriptors;
  uint64_t v24;
  NSArray *sortDescriptors;
  uint64_t v26;
  HKQueryAnchor *followingAnchor;
  uint64_t v28;
  HKQueryAnchor *upToAndIncludingAnchor;
  uint64_t v30;
  NSArray *distinctByKeyPaths;
  uint64_t v32;
  NSData *state;
  void *v35;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleIteratorQueryCursor.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryDescriptors"));

  }
  v36.receiver = self;
  v36.super_class = (Class)HKSampleIteratorQueryCursor;
  v21 = -[HKSampleIteratorQueryCursor init](&v36, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    queryDescriptors = v21->_queryDescriptors;
    v21->_queryDescriptors = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    sortDescriptors = v21->_sortDescriptors;
    v21->_sortDescriptors = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    followingAnchor = v21->_followingAnchor;
    v21->_followingAnchor = (HKQueryAnchor *)v26;

    v28 = objc_msgSend(v18, "copy");
    upToAndIncludingAnchor = v21->_upToAndIncludingAnchor;
    v21->_upToAndIncludingAnchor = (HKQueryAnchor *)v28;

    v30 = objc_msgSend(v19, "copy");
    distinctByKeyPaths = v21->_distinctByKeyPaths;
    v21->_distinctByKeyPaths = (NSArray *)v30;

    v32 = objc_msgSend(v20, "copy");
    state = v21->_state;
    v21->_state = (NSData *)v32;

  }
  return v21;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (HKQueryAnchor)followingAnchor
{
  return self->_followingAnchor;
}

- (HKQueryAnchor)upToAndIncludingAnchor
{
  return self->_upToAndIncludingAnchor;
}

- (NSArray)distinctByKeyPaths
{
  return self->_distinctByKeyPaths;
}

- (NSData)state
{
  return self->_state;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSArray hash](self->_queryDescriptors, "hash");
  v4 = -[NSArray hash](self->_sortDescriptors, "hash") ^ v3;
  v5 = -[HKQueryAnchor hash](self->_followingAnchor, "hash");
  v6 = v4 ^ v5 ^ -[HKQueryAnchor hash](self->_upToAndIncludingAnchor, "hash");
  v7 = -[NSArray hash](self->_distinctByKeyPaths, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_state, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSampleIteratorQueryCursor *v4;
  HKSampleIteratorQueryCursor *v5;
  NSArray *queryDescriptors;
  NSArray *v7;
  NSArray *sortDescriptors;
  NSArray *v9;
  HKQueryAnchor *followingAnchor;
  HKQueryAnchor *v11;
  HKQueryAnchor *upToAndIncludingAnchor;
  HKQueryAnchor *v13;
  NSArray *distinctByKeyPaths;
  NSArray *v15;
  NSData *state;
  NSData *v17;
  BOOL v18;

  v4 = (HKSampleIteratorQueryCursor *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      queryDescriptors = self->_queryDescriptors;
      v7 = v5->_queryDescriptors;
      if (queryDescriptors != v7 && (!v7 || !-[NSArray isEqual:](queryDescriptors, "isEqual:")))
        goto LABEL_24;
      sortDescriptors = self->_sortDescriptors;
      v9 = v5->_sortDescriptors;
      if (sortDescriptors != v9 && (!v9 || !-[NSArray isEqual:](sortDescriptors, "isEqual:")))
        goto LABEL_24;
      followingAnchor = self->_followingAnchor;
      v11 = v5->_followingAnchor;
      if (followingAnchor != v11 && (!v11 || !-[HKQueryAnchor isEqual:](followingAnchor, "isEqual:")))
        goto LABEL_24;
      if (((upToAndIncludingAnchor = self->_upToAndIncludingAnchor,
             v13 = v5->_upToAndIncludingAnchor,
             upToAndIncludingAnchor == v13)
         || v13 && -[HKQueryAnchor isEqual:](upToAndIncludingAnchor, "isEqual:"))
        && ((distinctByKeyPaths = self->_distinctByKeyPaths, v15 = v5->_distinctByKeyPaths, distinctByKeyPaths == v15)
         || v15 && -[NSArray isEqual:](distinctByKeyPaths, "isEqual:"))
        && ((state = self->_state, v17 = v5->_state, state == v17)
         || v17 && -[NSData isEqual:](state, "isEqual:")))
      {
        v18 = 1;
      }
      else
      {
LABEL_24:
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *queryDescriptors;
  id v5;

  queryDescriptors = self->_queryDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", queryDescriptors, CFSTR("queryDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("SortDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_followingAnchor, CFSTR("FollowingAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upToAndIncludingAnchor, CFSTR("UpToAndIncludingAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distinctByKeyPaths, CFSTR("DistinctByKeyPaths"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("State"));

}

- (HKSampleIteratorQueryCursor)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HKSampleIteratorQueryCursor *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v4, CFSTR("queryDescriptors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("SortDescriptors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FollowingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpToAndIncludingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("DistinctByKeyPaths"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("State"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17++), "allowEvaluation");
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v18 = -[HKSampleIteratorQueryCursor initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:](self, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", v5, v13, v8, v9, v11, v12);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_distinctByKeyPaths, 0);
  objc_storeStrong((id *)&self->_upToAndIncludingAnchor, 0);
  objc_storeStrong((id *)&self->_followingAnchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end
