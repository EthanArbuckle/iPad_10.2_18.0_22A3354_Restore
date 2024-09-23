@implementation MPShuffleableSectionedIdentifierList

- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  objc_super v10;

  v4 = a3;
  -[MPShuffleableSectionedIdentifierList _shuffledListWithExclusiveAccessToken:](self, "_shuffledListWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (id)objc_msgSend(v5, "itemCount");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    v7 = -[MPSectionedIdentifierList _itemCountWithExclusiveAccessToken:](&v10, sel__itemCountWithExclusiveAccessToken_, v4);
  }
  v8 = (int64_t)v7;

  return v8;
}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MPShuffleableSectionedIdentifierList _shuffledListWithExclusiveAccessToken:](self, "_shuffledListWithExclusiveAccessToken:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((a3 & 0x1000000) != 0 || !v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:](&v18, sel_enumeratorWithOptions_startPosition_endPosition_withExclusiveAccessToken_, a3, v12, v11, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "enumeratorWithOptions:startPosition:endPosition:", a3, v12, v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

void __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke(id *a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5[1] = 3221225472;
    v5[2] = __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_2;
    v5[3] = &unk_1E315E1B0;
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v6 = v3;
    v7 = a1[5];
    v8 = a1[6];
    objc_msgSend(v6, "performWithExclusiveAccess:", v5);

    v3 = v4;
  }

}

- (MPShuffleableSectionedIdentifierList)initWithCoder:(id)a3
{
  id v4;
  MPShuffleableSectionedIdentifierList *v5;
  uint64_t v6;
  _MPSSILImplementation *shuffledList;
  uint64_t v8;
  NSString *shuffleStartingSectionIdentifier;
  uint64_t v10;
  NSString *shuffleStartingItemIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPShuffleableSectionedIdentifierList;
  v5 = -[MPSectionedIdentifierList initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shuffleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("st"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sl"));
    v6 = objc_claimAutoreleasedReturnValue();
    shuffledList = v5->_shuffledList;
    v5->_shuffledList = (_MPSSILImplementation *)v6;

    -[MPSectionedIdentifierList setDelegate:](v5->_shuffledList, "setDelegate:", v5);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssi"));
    v8 = objc_claimAutoreleasedReturnValue();
    shuffleStartingSectionIdentifier = v5->_shuffleStartingSectionIdentifier;
    v5->_shuffleStartingSectionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sii"));
    v10 = objc_claimAutoreleasedReturnValue();
    shuffleStartingItemIdentifier = v5->_shuffleStartingItemIdentifier;
    v5->_shuffleStartingItemIdentifier = (NSString *)v10;

  }
  return v5;
}

- (id)_shuffledListWithExclusiveAccessToken:(id)a3
{
  objc_msgSend(a3, "assertHasExclusiveAccessForOwner:", self);
  return self->_shuffledList;
}

- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke;
  v14[3] = &unk_1E315E1B0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  v12 = a5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v14);
  v13.receiver = self;
  v13.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList replaceDataSource:forSection:completion:](&v13, sel_replaceDataSource_forSection_completion_, v10, v11, v12);

}

- (BOOL)hasSection:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;
  _QWORD v9[5];

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("🔀")))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MPShuffleableSectionedIdentifierList_hasSection___block_invoke;
    v9[3] = &unk_1E3153ED8;
    v9[4] = self;
    v5 = -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v9);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPShuffleableSectionedIdentifierList;
    v5 = -[MPSectionedIdentifierList hasSection:](&v8, sel_hasSection_, v4);
  }
  v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPShuffleableSectionedIdentifierList;
  v6 = a4;
  v7 = a3;
  -[MPSectionedIdentifierList encodeWithCoder:withExclusiveAccessToken:](&v8, sel_encodeWithCoder_withExclusiveAccessToken_, v7, v6);
  objc_msgSend(v6, "assertHasExclusiveAccessForOwner:", self, v8.receiver, v8.super_class);

  objc_msgSend(v7, "encodeInteger:forKey:", self->_shuffleType, CFSTR("st"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_shuffledList, CFSTR("sl"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_shuffleStartingSectionIdentifier, CFSTR("ssi"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_shuffleStartingSectionIdentifier, CFSTR("sii"));

}

- (void)setShuffleType:(int64_t)a3
{
  -[MPShuffleableSectionedIdentifierList setShuffleType:startingItem:inSection:randomSource:](self, "setShuffleType:startingItem:inSection:randomSource:", a3, 0, 0, 0);
}

- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5
{
  -[MPShuffleableSectionedIdentifierList setShuffleType:startingItem:inSection:randomSource:](self, "setShuffleType:startingItem:inSection:randomSource:", a3, a4, a5, 0);
}

- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5 randomSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  SEL v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__MPShuffleableSectionedIdentifierList_setShuffleType_startingItem_inSection_randomSource___block_invoke;
  v17[3] = &unk_1E315E110;
  v17[4] = self;
  v18 = v12;
  v19 = v11;
  v20 = v13;
  v21 = a3;
  v22 = a2;
  v14 = v13;
  v15 = v11;
  v16 = v12;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v17);

}

- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__MPShuffleableSectionedIdentifierList_safelyReshuffleAfterItem_inSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5
{
  -[MPShuffleableSectionedIdentifierList addDataSourceAtStart:section:sequentially:completion:](self, "addDataSourceAtStart:section:sequentially:completion:", a3, a4, 0, a5);
}

- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7
{
  -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterItem:inSection:completion:](self, "addDataSource:section:sequentially:afterItem:inSection:completion:", a3, a4, 0, a5, a6, a7);
}

- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6
{
  -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterTailOfSection:completion:](self, "addDataSource:section:sequentially:afterTailOfSection:completion:", a3, a4, 0, a5, a6);
}

- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6
{
  -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:beforeTailOfSection:completion:](self, "addDataSource:section:sequentially:beforeTailOfSection:completion:", a3, a4, 0, a5, a6);
}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5
{
  -[MPShuffleableSectionedIdentifierList addDataSourceAtEnd:section:sequentially:completion:](self, "addDataSourceAtEnd:section:sequentially:completion:", a3, a4, 0, a5);
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__MPShuffleableSectionedIdentifierList_addDataSourceAtStart_section_sequentially_completion___block_invoke;
  v16[3] = &unk_1E3153F00;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = a5;
  v12 = v11;
  v13 = v10;
  v14 = a6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v16);
  v15.receiver = self;
  v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList addDataSourceAtStart:section:completion:](&v15, sel_addDataSourceAtStart_section_completion_, v13, v12, v14);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  objc_super v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterItem_inSection_completion___block_invoke;
  v24[3] = &unk_1E3153F28;
  v24[4] = self;
  v25 = v14;
  v29 = a5;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = a8;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v24);
  v23.receiver = self;
  v23.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](&v23, sel_addDataSource_section_afterItem_inSection_completion_, v21, v20, v19, v18, v22);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterTailOfSection_completion___block_invoke;
  v20[3] = &unk_1E3153F50;
  v20[4] = self;
  v21 = v12;
  v24 = a5;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = a7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v20);
  v19.receiver = self;
  v19.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList addDataSource:section:afterTailOfSection:completion:](&v19, sel_addDataSource_section_afterTailOfSection_completion_, v17, v16, v15, v18);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_beforeTailOfSection_completion___block_invoke;
  v20[3] = &unk_1E3153F50;
  v20[4] = self;
  v21 = v12;
  v24 = a5;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = a7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v20);
  v19.receiver = self;
  v19.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList addDataSource:section:beforeTailOfSection:completion:](&v19, sel_addDataSource_section_beforeTailOfSection_completion_, v17, v16, v15, v18);

}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__MPShuffleableSectionedIdentifierList_addDataSourceAtEnd_section_sequentially_completion___block_invoke;
  v16[3] = &unk_1E3153F00;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = a5;
  v12 = v11;
  v13 = v10;
  v14 = a6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v16);
  v15.receiver = self;
  v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList addDataSourceAtEnd:section:completion:](&v15, sel_addDataSourceAtEnd_section_completion_, v13, v12, v14);

}

- (void)moveItemToStart:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__MPShuffleableSectionedIdentifierList_moveItemToStart_fromSection___block_invoke;
  v11[3] = &unk_1E3153F78;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  if (!-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v11))
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList moveItemToStart:fromSection:](&v10, sel_moveItemToStart_fromSection_, v8, v9);
  }

}

- (void)moveItemToEnd:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MPShuffleableSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke;
  v11[3] = &unk_1E3153F78;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  if (!-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v11))
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList moveItemToEnd:fromSection:](&v10, sel_moveItemToEnd_fromSection_, v8, v9);
  }

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke;
  v19[3] = &unk_1E3153FA0;
  v19[4] = self;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  if (!-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v19))
  {
    v18.receiver = self;
    v18.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList moveItem:fromSection:afterItem:inSection:](&v18, sel_moveItem_fromSection_afterItem_inSection_, v14, v15, v16, v17);
  }

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke;
  v16[3] = &unk_1E3153FC8;
  v16[4] = self;
  v12 = v11;
  v17 = v12;
  v20 = a2;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  if (!-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v16))
  {
    v15.receiver = self;
    v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList moveItem:fromSection:afterHeadOfSection:](&v15, sel_moveItem_fromSection_afterHeadOfSection_, v13, v14, v12);
  }

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke;
  v16[3] = &unk_1E3153FC8;
  v16[4] = self;
  v12 = v11;
  v17 = v12;
  v20 = a2;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  if (!-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v16))
  {
    v15.receiver = self;
    v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
    -[MPSectionedIdentifierList moveItem:fromSection:afterTailOfSection:](&v15, sel_moveItem_fromSection_afterTailOfSection_, v13, v14, v12);
  }

}

- (void)removeItem:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__MPShuffleableSectionedIdentifierList_removeItem_fromSection___block_invoke;
  v11[3] = &unk_1E315E1B0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v11);
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList removeItem:fromSection:](&v10, sel_removeItem_fromSection_, v9, v8);

}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 361, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v13[3] = &unk_1E315E1B0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v13);
  v12.receiver = self;
  v12.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList dataSourceInsertItemsAtHead:inSection:](&v12, sel_dataSourceInsertItemsAtHead_inSection_, v10, v9);

}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 369, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v11);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__MPShuffleableSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v17[3] = &unk_1E315E340;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v17);
  v16.receiver = self;
  v16.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList dataSourceInsertItems:afterItem:inSection:](&v16, sel_dataSourceInsertItems_afterItem_inSection_, v14, v13, v12);

}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 377, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v13[3] = &unk_1E315E1B0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v13);
  v12.receiver = self;
  v12.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList dataSourceInsertItemsAtTail:inSection:](&v12, sel_dataSourceInsertItemsAtTail_inSection_, v10, v9);

}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__MPShuffleableSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke;
  v11[3] = &unk_1E315E1B0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v11);
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList dataSourceRemoveItems:fromSection:](&v10, sel_dataSourceRemoveItems_fromSection_, v9, v8);

}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MPShuffleableSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke;
  v11[3] = &unk_1E315E1B0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v11);
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  -[MPSectionedIdentifierList dataSourceReloadItems:inSection:](&v10, sel_dataSourceReloadItems_inSection_, v9, v8);

}

- (void)didDequeueShuffledItemsInSSIL:(id)a3
{
  id v4;

  -[MPSectionedIdentifierList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didDequeueShuffledItemsInSectionedIdentifierList:", self);

}

- (id)_candidateItemsWithExclusiveAccessToken:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MPShuffleableSectionedIdentifierList _shuffledListWithExclusiveAccessToken:](self, "_shuffledListWithExclusiveAccessToken:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4
{
  id v5;

  -[MPShuffleableSectionedIdentifierList _shuffledListWithExclusiveAccessToken:](self, "_shuffledListWithExclusiveAccessToken:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueCandidatesWithQuota:", a3);

}

- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5
{
  -[MPShuffleableSectionedIdentifierList doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (NSString)shuffleStartingSectionIdentifier
{
  return self->_shuffleStartingSectionIdentifier;
}

- (void)setShuffleStartingSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)shuffleStartingItemIdentifier
{
  return self->_shuffleStartingItemIdentifier;
}

- (void)setShuffleStartingItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleStartingItemIdentifier, 0);
  objc_storeStrong((id *)&self->_shuffleStartingSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_shuffledList, 0);
}

void __72__MPShuffleableSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceReloadItems:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __74__MPShuffleableSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceRemoveItems:fromSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceInsertItemsAtTail:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __82__MPShuffleableSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceInsertItems:afterItem:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceInsertItemsAtHead:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __63__MPShuffleableSectionedIdentifierList_removeItem_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItem:fromSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

BOOL __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke_2;
    v13 = &unk_1E315E318;
    v5 = v3;
    v14 = v5;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 32);
    v15 = v6;
    v16 = v8;
    v17 = v7;
    objc_msgSend(v5, "performWithExclusiveAccess:", &v10);
    objc_msgSend(v5, "moveItem:fromSection:afterTailOfSection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v10, v11, v12, v13);

  }
  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("MPShuffleableSectionedIdentifierList.m"), 332, CFSTR("Can only move after a section tail that is in the shuffled SIL: afterSectionIdentifier=%@"), *(_QWORD *)(a1 + 40));

  }
}

BOOL __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke_2;
    v13 = &unk_1E315E318;
    v5 = v3;
    v14 = v5;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 32);
    v15 = v6;
    v16 = v8;
    v17 = v7;
    objc_msgSend(v5, "performWithExclusiveAccess:", &v10);
    objc_msgSend(v5, "moveItem:fromSection:afterHeadOfSection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v10, v11, v12, v13);

  }
  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("MPShuffleableSectionedIdentifierList.m"), 315, CFSTR("Can only move after a section head that is in the shuffled SIL: afterSectionIdentifier=%@"), *(_QWORD *)(a1 + 40));

  }
}

BOOL __81__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "moveItem:fromSection:afterItem:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  return v4 != 0;
}

BOOL __66__MPShuffleableSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "moveItemToEnd:fromSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4 != 0;
}

BOOL __68__MPShuffleableSectionedIdentifierList_moveItemToStart_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "moveItemToStart:fromSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDataSource:", *(_QWORD *)(a1 + 48));
}

void __91__MPShuffleableSectionedIdentifierList_addDataSourceAtEnd_section_sequentially_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSourceAtEnd:section:sequentially:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

void __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_beforeTailOfSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSource:section:sequentially:beforeTailOfSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

void __105__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterTailOfSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSource:section:sequentially:afterTailOfSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

void __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterItem_inSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSource:section:sequentially:afterItem:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __93__MPShuffleableSectionedIdentifierList_addDataSourceAtStart_section_sequentially_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSourceAtStart:section:sequentially:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

BOOL __51__MPShuffleableSectionedIdentifierList_hasSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "_shuffledListWithExclusiveAccessToken:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __75__MPShuffleableSectionedIdentifierList_safelyReshuffleAfterItem_inSection___block_invoke(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  id v4;

  v3 = (_QWORD *)a1[4];
  if (v3[13])
  {
    objc_msgSend(v3, "_shuffledListWithExclusiveAccessToken:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyReshuffleAfterItem:inSection:", a1[5], a1[6]);

  }
}

void __91__MPShuffleableSectionedIdentifierList_setShuffleType_startingItem_inSection_randomSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _MPSSILImplementation *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v27 = v3;
  if (v4[13] == *(_QWORD *)(a1 + 64))
  {
    v5 = (void *)v4[14];
    if (v5 == *(void **)(a1 + 40))
    {
      v6 = objc_msgSend(v5, "isEqual:", v4[14]);
      v4 = *(_QWORD **)(a1 + 32);
      if (v6)
      {
        v7 = (void *)v4[15];
        if (v7 == *(void **)(a1 + 48))
        {
          if ((objc_msgSend(v7, "isEqual:", v4[15]) & 1) != 0)
            goto LABEL_17;
          v4 = *(_QWORD **)(a1 + 32);
        }
      }
    }
  }
  v4[13] = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 64);
  if ((unint64_t)(v8 - 1) < 2)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 96);
    *(_QWORD *)(v15 + 96) = 0;

    v17 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 112);
    *(_QWORD *)(v18 + 112) = v17;

    v20 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 120);
    *(_QWORD *)(v21 + 120) = v20;

    v23 = *(_QWORD *)(a1 + 48);
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v23, *(_QWORD *)(a1 + 40), v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v24 = -[_MPSSILImplementation initWithSectionedIdentifierList:randomSource:startingItemEntry:withExclusiveAccessToken:]([_MPSSILImplementation alloc], "initWithSectionedIdentifierList:randomSource:startingItemEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v14, v27);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 96);
    *(_QWORD *)(v25 + 96) = v24;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
    goto LABEL_16;
  }
  if (v8 == 1000)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MPShuffleableSectionedIdentifierList.m"), 164, CFSTR("Unsupported shuffle type: MPShuffleTypeUserDefault"));
    goto LABEL_16;
  }
  if (!v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 96);
    *(_QWORD *)(v9 + 96) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 120);
    *(_QWORD *)(v11 + 120) = 0;

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 112);
    *(_QWORD *)(v13 + 112) = 0;
LABEL_16:

  }
LABEL_17:

}

+ (int64_t)initialCandidateDequeueQuota
{
  return __MPSSIL_initialCandidateDequeueQuota;
}

+ (void)setInitialCandidateDequeueQuota:(int64_t)a3
{
  __MPSSIL_initialCandidateDequeueQuota = a3;
}

+ (int64_t)enumerationCandidateDequeueQuota
{
  return __MPSSIL_enumerationCandidateDequeueQuota;
}

+ (void)setEnumerationCandidateDequeueQuota:(int64_t)a3
{
  __MPSSIL_enumerationCandidateDequeueQuota = a3;
}

- (NSString)debugDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24972;
  v9 = __Block_byref_object_dispose__24973;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPSectionedIdentifierList _performWithoutRequiringExclusivity:](MPSectionedIdentifierList, "_performWithoutRequiringExclusivity:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *context;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v1 = a1;
  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "enumeratorWithOptions:", 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = 0;
  objc_msgSend(*(id *)(v1 + 32), "_debugDescriptionWithEnumerator:lengths:", v2, &v45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(v1 + 32);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke_2;
  v44[3] = &unk_1E315E228;
  v44[4] = v7;
  objc_msgSend(v7, "performWithExclusiveAccessAndReturnObject:", v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v33 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "appendString:", CFSTR("\n┏◀ 🔀 Candidates"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v32 = v8;
    obj = v8;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v41;
      v9 = &stru_1E3163D10;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
          context = (void *)MEMORY[0x19403A624]();
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "itemIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("- %@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v1 + 32), "annotationDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v9;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "itemIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sectionIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "debugDescriptionForItem:inSection:", v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
              v16 = v19;
            else
              v16 = v9;

          }
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40);
          objc_msgSend(CFSTR("┣◉ ITEM"), "stringByPaddingToLength:withString:startingAtIndex:", (int)v45, CFSTR(" "), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sectionIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByPaddingToLength:withString:startingAtIndex:", SHIDWORD(v45), CFSTR(" "), 0);
          v38 = v15;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByPaddingToLength:withString:startingAtIndex:", (int)v46, CFSTR(" "), 0);
          v37 = v14;
          v24 = v1;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v9, "stringByPaddingToLength:withString:startingAtIndex:", SHIDWORD(v46), CFSTR(" "), 0);
          v26 = v9;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendFormat:", CFSTR("\n%@ %@ %@ %@ %@"), v21, v23, v25, v27, v16, 0);

          v9 = v26;
          v1 = v24;

          objc_autoreleasePoolPop(context);
          ++v10;
        }
        while (v36 != v10);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v36);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "appendString:", CFSTR("\n┗◁ 🔀 Candidates"));
    v8 = v32;
    v2 = v33;
  }
  if (objc_msgSend(*(id *)(v1 + 32), "shuffleType"))
  {
    objc_msgSend(*(id *)(v1 + 32), "enumeratorWithOptions:", 16777239);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "appendString:", CFSTR("\n"));
    v29 = *(void **)(v1 + 32);
    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40);
    objc_msgSend(v29, "_debugDescriptionWithEnumerator:lengths:", v28, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appendString:", v31);

  }
}

uint64_t __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_candidateItemsWithExclusiveAccessToken:", a2);
}

@end
