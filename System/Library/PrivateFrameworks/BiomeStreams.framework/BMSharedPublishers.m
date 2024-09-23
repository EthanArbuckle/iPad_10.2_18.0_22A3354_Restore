@implementation BMSharedPublishers

- (BMSharedPublishers)initWithPublishers:(id)a3
{
  id v4;
  BMSharedPublishers *v5;
  uint64_t v6;
  NSArray *publishers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSharedPublishers;
  v5 = -[BMSharedPublishers init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    publishers = v5->_publishers;
    v5->_publishers = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishers, 0);
}

- (id)merge
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D02460]);
  -[BMSharedPublishers publishers](self, "publishers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPublishers:", v4);

  return v5;
}

@end
