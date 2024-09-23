@implementation BBMaskedSet

- (id)objectAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_maskObjectSets, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BBMaskedSet)initWithMaskBits:(unint64_t)a3
{
  BBMaskedSet *v4;
  BBMaskedSet *v5;
  void *v6;
  unint64_t v7;
  NSMutableArray *maskObjectSets;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BBMaskedSet;
  v4 = -[BBMaskedSet init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maskBits = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBMaskedSet setMaskObjectSets:](v5, "setMaskObjectSets:", v6);

    if (v5->_maskBits)
    {
      v7 = 0;
      do
      {
        maskObjectSets = v5->_maskObjectSets;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](maskObjectSets, "setObject:atIndexedSubscript:", v9, v7);

        ++v7;
      }
      while (v7 < v5->_maskBits);
    }
  }
  return v5;
}

- (void)addObject:(id)a3 withMask:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__BBMaskedSet_addObject_withMask___block_invoke;
  v8[3] = &unk_24C5648F0;
  v9 = v6;
  v7 = v6;
  -[BBMaskedSet _executeUsingMask:block:](self, "_executeUsingMask:block:", a4, v8);

}

uint64_t __34__BBMaskedSet_addObject_withMask___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeObject:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_maskObjectSets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeObject:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)allObjects
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_maskObjectSets;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (id)objectsForMask:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__BBMaskedSet_objectsForMask___block_invoke;
  v9[3] = &unk_24C5648F0;
  v10 = v5;
  v6 = v5;
  -[BBMaskedSet _executeUsingMask:block:](self, "_executeUsingMask:block:", a3, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

uint64_t __30__BBMaskedSet_objectsForMask___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
}

- (void)_executeUsingMask:(unint64_t)a3 block:(id)a4
{
  unint64_t maskBits;
  unint64_t i;
  unint64_t v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  maskBits = self->_maskBits;
  if (maskBits)
  {
    for (i = 0; i < maskBits; ++i)
    {
      v8 = 1 << i;
      if (v8 > a3)
        break;
      if ((v8 & a3) != 0)
      {
        -[NSMutableArray objectAtIndex:](self->_maskObjectSets, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v9);

        maskBits = self->_maskBits;
      }
    }
  }

}

- (NSMutableArray)maskObjectSets
{
  return self->_maskObjectSets;
}

- (void)setMaskObjectSets:(id)a3
{
  objc_storeStrong((id *)&self->_maskObjectSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskObjectSets, 0);
}

@end
