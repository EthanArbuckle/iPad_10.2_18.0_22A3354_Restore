@implementation CLKClockComplicationCountSet

- (CLKClockComplicationCountSet)init
{
  CLKClockComplicationCountSet *v2;
  uint64_t v3;
  NSMutableOrderedSet *orderedSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKClockComplicationCountSet;
  v2 = -[CLKClockComplicationCountSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    orderedSet = v2->_orderedSet;
    v2->_orderedSet = (NSMutableOrderedSet *)v3;

  }
  return v2;
}

- (void)appendCount:(id)a3
{
  id v4;
  NSMutableOrderedSet *orderedSet;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  orderedSet = self->_orderedSet;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__CLKClockComplicationCountSet_appendCount___block_invoke;
  v9[3] = &unk_24CBFA928;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  v12 = &v19;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](orderedSet, "enumerateObjectsUsingBlock:", v9);
  v7 = (void *)v14[5];
  if (v7)
  {
    objc_msgSend(v7, "mergedWith:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_orderedSet, "replaceObjectAtIndex:withObject:", v20[3], v8);

  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_orderedSet, "addObject:", v6);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

void __44__CLKClockComplicationCountSet_appendCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (void)mergeSet:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__CLKClockComplicationCountSet_mergeSet___block_invoke;
  v5[3] = &unk_24CBFA950;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __41__CLKClockComplicationCountSet_mergeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendCount:", a2);
}

- (NSOrderedSet)orderedSet
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_orderedSet, "copy");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSMutableOrderedSet isEqual:](self->_orderedSet, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableOrderedSet hash](self->_orderedSet, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKClockComplicationCountSet *v4;
  uint64_t v5;
  NSMutableOrderedSet *orderedSet;

  v4 = -[CLKClockComplicationCountSet init](+[CLKClockComplicationCountSet allocWithZone:](CLKClockComplicationCountSet, "allocWithZone:", a3), "init");
  v5 = -[NSMutableOrderedSet mutableCopy](self->_orderedSet, "mutableCopy");
  orderedSet = v4->_orderedSet;
  v4->_orderedSet = (NSMutableOrderedSet *)v5;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSet, 0);
}

@end
