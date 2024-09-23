@implementation MusicKit_SoftLinking_MPModelStoreBrowseContentItem

- (MusicKit_SoftLinking_MPModelStoreBrowseContentItem)initWithInnerObject:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPModelStoreBrowseContentItem *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MPModelStoreBrowseContentItem *underlyingItem;
  MusicKit_SoftLinking_MPModelStoreBrowseContentItem *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MusicKit_SoftLinking_MPModelStoreBrowseContentItem;
  v5 = -[MusicKit_SoftLinking_MPModelStoreBrowseContentItem init](&v21, sel_init);
  if (v5)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v6 = (void *)getMPModelStoreBrowseContentItemClass_softClass_1;
    v26 = getMPModelStoreBrowseContentItemClass_softClass_1;
    v7 = MEMORY[0x24BDAC760];
    if (!getMPModelStoreBrowseContentItemClass_softClass_1)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __getMPModelStoreBrowseContentItemClass_block_invoke_1;
      v22[3] = &unk_24CD1CC68;
      v22[4] = &v23;
      __getMPModelStoreBrowseContentItemClass_block_invoke_1((uint64_t)v22);
      v6 = (void *)v24[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v23, 8);
    v9 = [v8 alloc];
    objc_msgSend(v4, "underlyingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v17 = 3221225472;
    v18 = __74__MusicKit_SoftLinking_MPModelStoreBrowseContentItem_initWithInnerObject___block_invoke;
    v19 = &unk_24CD1D858;
    v20 = v4;
    v12 = (void *)objc_msgSend(v9, "initWithIdentifiers:block:", v11, &v16);

    if (!objc_msgSend(v12, "itemType", v16, v17, v18, v19))
    {

      v14 = 0;
      goto LABEL_8;
    }
    underlyingItem = v5->_underlyingItem;
    v5->_underlyingItem = (MPModelStoreBrowseContentItem *)v12;

  }
  v14 = v5;
LABEL_8:

  return v14;
}

- (MusicKit_SoftLinking_MPModelObject)innerObject
{
  MusicKit_SoftLinking_MPModelObject *v3;
  void *v4;
  MusicKit_SoftLinking_MPModelObject *v5;

  v3 = [MusicKit_SoftLinking_MPModelObject alloc];
  -[MPModelStoreBrowseContentItem innerObject](self->_underlyingItem, "innerObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MusicKit_SoftLinking_MPModelObject initWithUnderlyingModelObject:](v3, "initWithUnderlyingModelObject:", v4);

  return v5;
}

- (MPModelStoreBrowseContentItem)_underlyingObject
{
  return self->_underlyingItem;
}

- (id)underlyingObject
{
  return self->_underlyingItem;
}

+ (int64_t)_genericObjectTypeForItemType:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return 0;
  else
    return qword_212061158[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItem, 0);
}

@end
