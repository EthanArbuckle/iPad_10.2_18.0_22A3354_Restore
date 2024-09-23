@implementation EQKitMathMLMStackCarries

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  EQKitMathMLMStackCarries *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  EQKitMathMLMStackCarry *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)EQKitMathMLMStackCarries;
  v6 = -[EQKitMathMLMStackCarries init](&v24, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = objc_msgSend(v7, "objectAtIndex:", v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v11)
            {
              v11 = (void *)objc_msgSend(v7, "mutableCopy");
              v7 = v11;
            }
            v13 = -[EQKitMathMLMStackCarry initWithChild:]([EQKitMathMLMStackCarry alloc], "initWithChild:", v12);
            objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v10, v13);

          }
        }
        ++v10;
      }
      while (v9 != v10);
    }
    else
    {
      v11 = 0;
    }
    v14 = v7;
    v6->mChildren = v14;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "setParent:", v6);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

  }
  return v6;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackCarries;
  -[EQKitMathMLMStackCarries dealloc](&v3, sel_dealloc);
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

- (id)schemataChildren
{
  return self->mChildren;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
