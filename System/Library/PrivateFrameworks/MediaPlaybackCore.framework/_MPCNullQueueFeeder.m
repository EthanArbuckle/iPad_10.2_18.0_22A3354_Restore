@implementation _MPCNullQueueFeeder

- (_MPCNullQueueFeeder)init
{
  _MPCNullQueueFeeder *v2;
  void *v3;
  uint64_t v4;
  NSString *uniqueIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MPCNullQueueFeeder;
  v2 = -[_MPCNullQueueFeeder init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v4;

  }
  return v2;
}

- (BOOL)containsLiveStream
{
  return 0;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, 0);
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD);
  id v8;
  NSString *v9;
  NSString *uniqueIdentifier;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  _MPCNullQueueFeeder *v18;
  SEL v19;

  v7 = (void (**)(id, _QWORD))a4;
  v8 = a3;
  objc_msgSend(v8, "sectionIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v9;

  objc_msgSend(v8, "itemIdentifiers");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC700], "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", objc_msgSend(v14, "count"), 0, &__block_literal_global_26217, &__block_literal_global_39);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_3;
  v16[3] = &unk_24CAB93A8;
  v18 = self;
  v19 = a2;
  v17 = v11;
  v13 = v11;
  -[_MPCNullQueueFeeder identifierRegistryWithExclusiveAccess:](self, "identifierRegistryWithExclusiveAccess:", v16);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_5;
  v15[3] = &unk_24CAB93D0;
  v15[4] = self;
  v15[5] = a2;
  objc_msgSend(v8, "applyChanges:itemLookupBlock:", v13, v15);

  v7[2](v7, 0);
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return 1;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
