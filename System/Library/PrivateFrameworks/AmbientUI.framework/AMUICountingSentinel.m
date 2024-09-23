@implementation AMUICountingSentinel

- (void)increment
{
  if (a1)
    return (void *)objc_msgSend(a1, "_addToCounter:", 1);
  return a1;
}

- (void)decrement
{
  if (a1)
    return (void *)objc_msgSend(a1, "_addToCounter:", -1);
  return a1;
}

- (void)performWhenCountAtZero:(uint64_t)a1
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v9 = v3;
    if (*(_QWORD *)(a1 + 8))
    {
      v4 = *(void **)(a1 + 16);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v5;

        v4 = *(void **)(a1 + 16);
      }
      v7 = (void *)objc_msgSend(v9, "copy");
      v8 = (void *)MEMORY[0x23B7EA970]();
      objc_msgSend(v4, "addObject:", v8);

    }
    else
    {
      v3[2](v3);
    }
    v3 = (void (**)(_QWORD))v9;
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AMUICountingSentinel *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__AMUICountingSentinel_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_250763400;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __53__AMUICountingSentinel_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  id result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("counter"));
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  if (result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("deferredBlocks"));
  return result;
}

- (void)_addToCounter:(int64_t)a3
{
  int64_t counter;
  BOOL v4;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  counter = self->_counter;
  self->_counter = (counter + a3) & ~((counter + a3) >> 63);
  if (counter)
    v4 = counter + a3 <= 0;
  else
    v4 = 0;
  if (v4)
  {
    v6 = (void *)-[NSMutableArray copy](self->_deferredBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_deferredBlocks, "removeAllObjects");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredBlocks, 0);
}

@end
