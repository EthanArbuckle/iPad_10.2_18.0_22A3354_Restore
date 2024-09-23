@implementation ASDJobSchedulerResponse

- (ASDJobSchedulerResponse)init
{
  return -[ASDJobSchedulerResponse initWithItems:](self, "initWithItems:", MEMORY[0x1E0C9AA60]);
}

- (ASDJobSchedulerResponse)initWithItems:(id)a3
{
  id v5;
  ASDJobSchedulerResponse *v6;
  ASDJobSchedulerResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDJobSchedulerResponse;
  v6 = -[ASDJobSchedulerResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentItems, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSArray copyWithZone:](self->_bucketNames, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSArray copyWithZone:](self->_currentItems, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSArray copyWithZone:](self->_hardFailureItems, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v5[6] = self->_maxItemCount;
  v12 = -[NSArray copyWithZone:](self->_nextItems, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSArray copyWithZone:](self->_skippedItems, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v16 = -[NSArray copyWithZone:](self->_softFailureItems, "copyWithZone:", a3);
  v17 = (void *)v5[9];
  v5[9] = v16;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobSchedulerResponse)initWithCoder:(id)a3
{
  id v4;
  ASDJobSchedulerResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *bucketNames;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *currentItems;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *hardFailureItems;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *nextItems;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *skippedItems;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *softFailureItems;

  v4 = a3;
  v5 = -[ASDJobSchedulerResponse init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bucketNames"));
    v9 = objc_claimAutoreleasedReturnValue();
    bucketNames = v5->_bucketNames;
    v5->_bucketNames = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("currentItems"));
    v14 = objc_claimAutoreleasedReturnValue();
    currentItems = v5->_currentItems;
    v5->_currentItems = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("hardFailures"));
    v19 = objc_claimAutoreleasedReturnValue();
    hardFailureItems = v5->_hardFailureItems;
    v5->_hardFailureItems = (NSArray *)v19;

    v5->_maxItemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxItemCount"));
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("nextItems"));
    v24 = objc_claimAutoreleasedReturnValue();
    nextItems = v5->_nextItems;
    v5->_nextItems = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("skippedItems"));
    v29 = objc_claimAutoreleasedReturnValue();
    skippedItems = v5->_skippedItems;
    v5->_skippedItems = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("softFailures"));
    v34 = objc_claimAutoreleasedReturnValue();
    softFailureItems = v5->_softFailureItems;
    v5->_softFailureItems = (NSArray *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *bucketNames;
  id v5;

  bucketNames = self->_bucketNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bucketNames, CFSTR("bucketNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentItems, CFSTR("currentItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardFailureItems, CFSTR("hardFailures"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxItemCount, CFSTR("maxItemCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextItems, CFSTR("nextItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_skippedItems, CFSTR("skippedItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softFailureItems, CFSTR("softFailures"));

}

- (NSArray)bucketNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBucketNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)currentItems
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)hardFailureItems
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHardFailureItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (int64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxItemCount = a3;
}

- (NSArray)nextItems
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNextItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)skippedItems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSkippedItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)softFailureItems
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSoftFailureItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softFailureItems, 0);
  objc_storeStrong((id *)&self->_skippedItems, 0);
  objc_storeStrong((id *)&self->_nextItems, 0);
  objc_storeStrong((id *)&self->_hardFailureItems, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_bucketNames, 0);
}

@end
