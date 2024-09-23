@implementation MPMusicPlayerControllerApplicationQueueModifications

- (MPMusicPlayerControllerApplicationQueueModifications)initWithInsertedDescriptors:(id)a3 removedItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  MPMusicPlayerControllerApplicationQueueModifications *v8;
  uint64_t v9;
  NSDictionary *insertedDescriptors;
  uint64_t v11;
  NSArray *removedItemIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPMusicPlayerControllerApplicationQueueModifications;
  v8 = -[MPMusicPlayerControllerApplicationQueueModifications init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    insertedDescriptors = v8->_insertedDescriptors;
    v8->_insertedDescriptors = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    removedItemIdentifiers = v8->_removedItemIdentifiers;
    v8->_removedItemIdentifiers = (NSArray *)v11;

  }
  return v8;
}

- (MPMusicPlayerControllerApplicationQueueModifications)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerControllerApplicationQueueModifications *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *insertedDescriptors;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *removedItemIdentifiers;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMusicPlayerControllerApplicationQueueModifications;
  v5 = -[MPMusicPlayerControllerApplicationQueueModifications init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("inserted"));
    v11 = objc_claimAutoreleasedReturnValue();
    insertedDescriptors = v5->_insertedDescriptors;
    v5->_insertedDescriptors = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("removed"));
    v16 = objc_claimAutoreleasedReturnValue();
    removedItemIdentifiers = v5->_removedItemIdentifiers;
    v5->_removedItemIdentifiers = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *insertedDescriptors;
  id v5;

  insertedDescriptors = self->_insertedDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", insertedDescriptors, CFSTR("inserted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedItemIdentifiers, CFSTR("removed"));

}

- (NSDictionary)insertedDescriptors
{
  return self->_insertedDescriptors;
}

- (NSArray)removedItemIdentifiers
{
  return self->_removedItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_insertedDescriptors, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
