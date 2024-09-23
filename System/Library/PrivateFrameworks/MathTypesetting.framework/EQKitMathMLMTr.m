@implementation EQKitMathMLMTr

- (EQKitMathMLMTr)init
{
  return -[EQKitMathMLMTr initWithChildren:](self, "initWithChildren:", objc_msgSend(MEMORY[0x24BDBCE30], "array"));
}

- (EQKitMathMLMTr)initWithChildren:(id)a3
{
  return -[EQKitMathMLMTr initWithChildren:node:](self, "initWithChildren:node:", a3, 0);
}

- (EQKitMathMLMTr)initWithChildren:(id)a3 node:(_xmlNode *)a4
{
  EQKitMathMLMTr *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)EQKitMathMLMTr;
  v5 = -[EQKitMathMLMTr init](&v16, sel_init, a3, a4);
  if (v5)
  {
    v6 = (NSArray *)a3;
    v5->mChildren = v6;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setParent:", v5);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
  }
  return v5;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v7;

  objc_msgSend(a4, "pushState:", 3);
  v7 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
  objc_msgSend(a4, "popState");
  return -[EQKitMathMLMTr initWithChildren:node:](self, "initWithChildren:node:", v7, a3);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMTr mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMTr mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMTd mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMTr mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMTr;
  -[EQKitMathMLMTr dealloc](&v3, sel_dealloc);
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

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), NSStringFromClass(v4), self, self->mChildren);
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
