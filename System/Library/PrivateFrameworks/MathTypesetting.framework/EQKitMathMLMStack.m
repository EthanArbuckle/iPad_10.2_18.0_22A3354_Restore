@implementation EQKitMathMLMStack

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  return -[EQKitMathMLMStack initWithChildren:](self, "initWithChildren:", objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3));
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStack mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMStack mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStack mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStack)initWithChildren:(id)a3
{
  EQKitMathMLMStack *v4;
  EQKitMathMLMStack *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  EQKitMathMLMStackGroup *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)EQKitMathMLMStack;
  v4 = -[EQKitMathMLMStack init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mAlign = 0;
    v6 = objc_msgSend(a3, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      for (i = 0; i != v7; ++i)
      {
        v10 = objc_msgSend(a3, "objectAtIndex:", i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v8)
          {
            v8 = (void *)objc_msgSend(a3, "mutableCopy");
            a3 = v8;
          }
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v10, 0);
          v12 = -[EQKitMathMLMStackGroup initWithChildren:]([EQKitMathMLMStackGroup alloc], "initWithChildren:", v11);
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", i, v12);

        }
      }
    }
    else
    {
      v8 = 0;
    }
    v13 = (NSArray *)a3;
    v5->mChildren = v13;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "setParent:", v5);
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStack;
  -[EQKitMathMLMStack dealloc](&v3, sel_dealloc);
}

- (id)schemataChildren
{
  return self->mChildren;
}

- (int)schemataAlign
{
  return self->mAlign;
}

- (BOOL)isBaseFontNameUsed
{
  NSArray *mChildren;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mChildren = self->mChildren;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mChildren);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "isBaseFontNameUsed") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
