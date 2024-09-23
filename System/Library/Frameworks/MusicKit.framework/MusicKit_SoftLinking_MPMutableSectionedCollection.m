@implementation MusicKit_SoftLinking_MPMutableSectionedCollection

- (MusicKit_SoftLinking_MPMutableSectionedCollection)init
{
  MusicKit_SoftLinking_MPMutableSectionedCollection *v2;
  void *v3;
  objc_class *v4;
  MPMutableSectionedCollection *v5;
  MPMutableSectionedCollection *underlyingSectionedCollection;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMutableSectionedCollection;
  v2 = -[MusicKit_SoftLinking_MPSectionedCollection init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPMutableSectionedCollectionClass_softClass_0;
    v13 = getMPMutableSectionedCollectionClass_softClass_0;
    if (!getMPMutableSectionedCollectionClass_softClass_0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getMPMutableSectionedCollectionClass_block_invoke_0;
      v9[3] = &unk_24CD1CC68;
      v9[4] = &v10;
      __getMPMutableSectionedCollectionClass_block_invoke_0((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPMutableSectionedCollection *)objc_alloc_init(v4);
    underlyingSectionedCollection = v2->_underlyingSectionedCollection;
    v2->_underlyingSectionedCollection = v5;

  }
  return v2;
}

- (MusicKit_SoftLinking_MPMutableSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPMutableSectionedCollection *v6;
  MusicKit_SoftLinking_MPMutableSectionedCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMutableSectionedCollection;
  v6 = -[MusicKit_SoftLinking_MPSectionedCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingSectionedCollection, a3);

  return v7;
}

- (MPMutableSectionedCollection)_underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (void)appendSection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = v5;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_254B4A0D8))
  {
    objc_msgSend(v5, "underlyingObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MPMutableSectionedCollection appendSection:](self->_underlyingSectionedCollection, "appendSection:", v4);

}

- (void)appendItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = v5;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_254B4A0D8))
  {
    objc_msgSend(v5, "underlyingObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MPMutableSectionedCollection appendItem:](self->_underlyingSectionedCollection, "appendItem:", v4);

}

- (void)appendItems:(id)a3
{
  id v4;

  objc_msgSend(a3, "msv_map:", &__block_literal_global_8);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMutableSectionedCollection appendItems:](self->_underlyingSectionedCollection, "appendItems:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSectionedCollection, 0);
}

@end
