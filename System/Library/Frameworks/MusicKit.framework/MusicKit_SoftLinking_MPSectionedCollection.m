@implementation MusicKit_SoftLinking_MPSectionedCollection

- (MusicKit_SoftLinking_MPSectionedCollection)initWithUnderlyingSectionedCollection:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPSectionedCollection *v6;
  MusicKit_SoftLinking_MPSectionedCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPSectionedCollection;
  v6 = -[MusicKit_SoftLinking_MPSectionedCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingSectionedCollection, a3);

  return v7;
}

- (id)itemAtIndexPathBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__MusicKit_SoftLinking_MPSectionedCollection_itemAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_24CD1D588;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSectionedCollection, 0);
}

- (void)enumerateItemIdentifiersUsingBlock:(id)a3
{
  id v4;
  MPSectionedCollection *underlyingSectionedCollection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__MusicKit_SoftLinking_MPSectionedCollection_enumerateItemIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_24CD1D5B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPSectionedCollection enumerateItemIdentifiersUsingBlock:](underlyingSectionedCollection, "enumerateItemIdentifiersUsingBlock:", v7);

}

- (MusicKit_SoftLinking_MPSectionedCollection)init
{
  MusicKit_SoftLinking_MPSectionedCollection *v2;
  void *v3;
  objc_class *v4;
  MPSectionedCollection *v5;
  MPSectionedCollection *underlyingSectionedCollection;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPSectionedCollection;
  v2 = -[MusicKit_SoftLinking_MPSectionedCollection init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPSectionedCollectionClass_softClass;
    v13 = getMPSectionedCollectionClass_softClass;
    if (!getMPSectionedCollectionClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getMPSectionedCollectionClass_block_invoke;
      v9[3] = &unk_24CD1CC68;
      v9[4] = &v10;
      __getMPSectionedCollectionClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPSectionedCollection *)objc_alloc_init(v4);
    underlyingSectionedCollection = v2->_underlyingSectionedCollection;
    v2->_underlyingSectionedCollection = v5;

  }
  return v2;
}

- (id)underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (MPSectionedCollection)_underlyingSectionedCollection
{
  return self->_underlyingSectionedCollection;
}

- (int64_t)totalItemCount
{
  return -[MPSectionedCollection totalItemCount](self->_underlyingSectionedCollection, "totalItemCount");
}

- (id)sectionIdentifiersAtIndexBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__MusicKit_SoftLinking_MPSectionedCollection_sectionIdentifiersAtIndexBlock__block_invoke;
  aBlock[3] = &unk_24CD1D560;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (id)sectionItemAtIndexPathBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MusicKit_SoftLinking_MPSectionedCollection_sectionItemAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_24CD1D560;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (id)allSections
{
  return (id)-[MPSectionedCollection allSections](self->_underlyingSectionedCollection, "allSections");
}

- (id)allItems
{
  return (id)-[MPSectionedCollection allItems](self->_underlyingSectionedCollection, "allItems");
}

- (int64_t)numberOfSections
{
  return -[MPSectionedCollection numberOfSections](self->_underlyingSectionedCollection, "numberOfSections");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[MPSectionedCollection numberOfItemsInSection:](self->_underlyingSectionedCollection, "numberOfItemsInSection:", a3);
}

- (id)sectionAtIndex:(int64_t)a3
{
  return (id)-[MPSectionedCollection sectionAtIndex:](self->_underlyingSectionedCollection, "sectionAtIndex:", a3);
}

- (id)itemAtIndexPath:(id)a3
{
  return (id)-[MPSectionedCollection itemAtIndexPath:](self->_underlyingSectionedCollection, "itemAtIndexPath:", a3);
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  return (id)-[MPSectionedCollection identifiersForSectionAtIndex:](self->_underlyingSectionedCollection, "identifiersForSectionAtIndex:", a3);
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  return (id)-[MPSectionedCollection identifiersForItemAtIndexPath:](self->_underlyingSectionedCollection, "identifiersForItemAtIndexPath:", a3);
}

- (void)enumerateSectionIdentifiersUsingBlock:(id)a3
{
  id v4;
  MPSectionedCollection *underlyingSectionedCollection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__MusicKit_SoftLinking_MPSectionedCollection_enumerateSectionIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_24CD1D5D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPSectionedCollection enumerateSectionIdentifiersUsingBlock:](underlyingSectionedCollection, "enumerateSectionIdentifiersUsingBlock:", v7);

}

- (void)enumerateTitledSectionsUsingBlock:(id)a3
{
  id v4;
  MPSectionedCollection *underlyingSectionedCollection;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__MusicKit_SoftLinking_MPSectionedCollection_enumerateTitledSectionsUsingBlock___block_invoke;
  v7[3] = &unk_24CD1D600;
  v8 = v4;
  v6 = v4;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](underlyingSectionedCollection, "enumerateSectionsUsingBlock:", v7);

}

- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  MPSectionedCollection *underlyingSectionedCollection;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __98__MusicKit_SoftLinking_MPSectionedCollection_enumerateItemIdentifiersInSectionAtIndex_usingBlock___block_invoke;
  v9[3] = &unk_24CD1D628;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[MPSectionedCollection enumerateItemIdentifiersInSectionAtIndex:usingBlock:](underlyingSectionedCollection, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a3, v9);

}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  MPSectionedCollection *underlyingSectionedCollection;
  void *v4;

  underlyingSectionedCollection = self->_underlyingSectionedCollection;
  objc_msgSend(a3, "_underlyingSectionedCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(underlyingSectionedCollection) = -[MPSectionedCollection hasSameContentAsSectionedCollection:](underlyingSectionedCollection, "hasSameContentAsSectionedCollection:", v4);

  return (char)underlyingSectionedCollection;
}

- (BOOL)isEqual:(id)a3
{
  MusicKit_SoftLinking_MPSectionedCollection *v4;
  MPSectionedCollection *underlyingSectionedCollection;
  void *v6;
  char v7;

  v4 = (MusicKit_SoftLinking_MPSectionedCollection *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[MusicKit_SoftLinking_MPSectionedCollection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    underlyingSectionedCollection = self->_underlyingSectionedCollection;
    -[MusicKit_SoftLinking_MPSectionedCollection _underlyingSectionedCollection](v4, "_underlyingSectionedCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPSectionedCollection isEqual:](underlyingSectionedCollection, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[MPSectionedCollection hash](self->_underlyingSectionedCollection, "hash");
}

@end
