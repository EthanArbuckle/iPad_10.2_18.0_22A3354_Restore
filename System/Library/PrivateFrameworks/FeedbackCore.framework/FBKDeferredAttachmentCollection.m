@implementation FBKDeferredAttachmentCollection

- (id)initDevice:(id)a3 matcherPredicates:(id)a4
{
  id v7;
  id v8;
  FBKDeferredAttachmentCollection *v9;
  FBKDeferredAttachmentCollection *v10;
  uint64_t v11;
  NSMutableArray *sortedAttachments;
  NSMutableArray *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FBKDeferredAttachmentCollection;
  v9 = -[FBKDeferredAttachmentCollection init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    sortedAttachments = v10->_sortedAttachments;
    v10->_sortedAttachments = (NSMutableArray *)v11;

    v13 = v10->_sortedAttachments;
    -[FBKDeferredAttachmentCollection deferredAttachmentsFromMatchers:](v10, "deferredAttachmentsFromMatchers:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v14);

  }
  return v10;
}

- (NSSet)allMatchers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[FBKDeferredAttachmentCollection sortedAttachments](self, "sortedAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ded_mapWithBlock:", &__block_literal_global_49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

uint64_t __46__FBKDeferredAttachmentCollection_allMatchers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requirement");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDeferredAttachmentCollection device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBKDeferredAttachmentCollection device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)deferredAttachmentsFromMatchers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__FBKDeferredAttachmentCollection_deferredAttachmentsFromMatchers___block_invoke;
  v9[3] = &unk_24E15AFD0;
  v9[4] = self;
  objc_msgSend(a3, "ded_flatMapWithBlock:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("displayName"), 1);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

FBKAttachment *__67__FBKDeferredAttachmentCollection_deferredAttachmentsFromMatchers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FBKAttachment *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBKAttachment *v11;

  v3 = a2;
  v4 = [FBKAttachment alloc];
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("deferred-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FBKAttachment initWithRequirement:urlExtension:collectorIdentifier:deviceUUID:](v4, "initWithRequirement:urlExtension:collectorIdentifier:deviceUUID:", v3, 0, v8, v10);

  -[FBKAttachment setAttachmentType:](v11, "setAttachmentType:", 1);
  -[FBKAttachment setState:](v11, "setState:", 8);
  return v11;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSMutableArray)sortedAttachments
{
  return self->_sortedAttachments;
}

- (void)setSortedAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_sortedAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAttachments, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
