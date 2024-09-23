@implementation FilterElementDefinition

- (id)initAsRoot:(id)a3
{
  FilterElementDefinition *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)FilterElementDefinition;
  v4 = -[FilterElementDefinition init](&v6, sel_init);
  if (v4)
  {
    v4->_rootName = (NSString *)a3;
    v4->_setOfMatches = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)FilterElementDefinition;
  -[FilterElementDefinition dealloc](&v3, sel_dealloc);
}

- (BOOL)isBottomValue
{
  return !-[NSMutableDictionary count](self->_setOfMatches, "count")
      && !self->_namedLink
      && !self->_wildCard
      && self->_superWildCard == 0;
}

- ($89967B733E8F0E8859294B5D59E7AF0F)encodeInto:(_MDPlistContainer *)a3 auxArray:(id)a4 namedRootMap:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v12;
  void *v13;
  __int16 v14;
  __int16 hasAuxValue;
  __int16 v16;
  unint64_t mask;
  uint64_t v18;
  unint64_t rule;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableDictionary *setOfMatches;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  const void *v43;
  void *v44;
  FilterElementDefinition *wildCard;
  int v46;
  FilterElementDefinition *superWildCard;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t BytePtr;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  int v60;
  char v61;
  unsigned int v62;
  unsigned __int8 v63;
  __int16 v64;
  uint64_t v65;
  int v66;
  __int16 v67;
  __int16 v68;
  __int16 subAuxValueCount;
  unint64_t v70;
  unint64_t v71;
  int8x16_t v72;
  unsigned int v73;
  unsigned __int8 v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = objc_msgSend(a4, "count", _MDPlistContainerBeginArray((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7));
  if (self->_hasAuxValue)
    objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_auxValue));
  if (self->_namedLink)
  {
    v13 = (void *)objc_msgSend(a5, "objectForKey:");
    if (!v13)
      -[FilterElementDefinition encodeInto:auxArray:namedRootMap:].cold.1();
    v14 = objc_msgSend(v13, "intValue") + 1;
  }
  else
  {
    v14 = 0;
  }
  v64 = v14;
  v65 = 0;
  v66 = 0;
  hasAuxValue = self->_hasAuxValue;
  if (self->_hasAuxValue)
    v16 = v12 + 1;
  else
    v16 = 0;
  v67 = v16;
  v68 = hasAuxValue + v12;
  subAuxValueCount = self->_subAuxValueCount;
  mask = self->_mask;
  if (-[FilterElementDefinition isBottomValue](self, "isBottomValue"))
    v18 = 0;
  else
    v18 = 0x4000000000000000;
  v70 = v18 | mask;
  rule = self->_rule;
  if (-[FilterElementDefinition isBottomValue](self, "isBottomValue"))
    v24 = 0;
  else
    v24 = 0x4000000000000000;
  v71 = v24 | rule;
  v72 = vextq_s8(*(int8x16_t *)&self->_subRule, *(int8x16_t *)&self->_subRule, 8uLL);
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  _MDPlistContainerAddDataValue((uint64_t)a3, &v64, 0x34uLL, (uint64_t)&v62, v20, v21, v22, v23);
  if (-[NSMutableDictionary count](self->_setOfMatches, "count"))
  {
    _MDPlistContainerBeginDictionary((uint64_t)a3, v25, v26, v27, v28, v29, v30, v31);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    setOfMatches = self->_setOfMatches;
    v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](setOfMatches, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
    if (v33)
    {
      v40 = v33;
      v41 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v77 != v41)
            objc_enumerationMutation(setOfMatches);
          v43 = *(const void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v44 = (void *)-[NSMutableDictionary objectForKey:](self->_setOfMatches, "objectForKey:", v43);
          _MDPlistContainerAddObject((uint64_t)a3, v43, 0);
          objc_msgSend(v44, "encodeInto:auxArray:namedRootMap:", a3, a4, a5);
        }
        v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](setOfMatches, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      }
      while (v40);
    }
    _MDPlistContainerEndDictionary((uint64_t)a3, (uint64_t)&v60, v34, v35, v36, v37, v38, v39);
  }
  wildCard = self->_wildCard;
  if (wildCard)
    v46 = (int)-[FilterElementDefinition encodeInto:auxArray:namedRootMap:](wildCard, "encodeInto:auxArray:namedRootMap:", a3, a4, a5);
  else
    v46 = 0;
  superWildCard = self->_superWildCard;
  if (superWildCard)
    v48 = (int)-[FilterElementDefinition encodeInto:auxArray:namedRootMap:](superWildCard, "encodeInto:auxArray:namedRootMap:", a3, a4, a5);
  else
    v48 = 0;
  v74 = 0;
  v73 = 0;
  _MDPlistContainerEndArray((uint64_t)a3, (uint64_t)&v73, v26, v27, v28, v29, v30, v31);
  v58 = 0uLL;
  v59 = 0;
  _MDPlistReferenceToPlistObject((unint64_t)a3, v62 | ((unint64_t)v63 << 32), v49, v50, v51, v52, v53, &v58);
  v56 = v58;
  v57 = v59;
  BytePtr = _MDPlistDataGetBytePtr((uint64_t *)&v56, 0);
  *(_DWORD *)(BytePtr + 2) = v60;
  *(_DWORD *)(BytePtr + 6) = v46;
  *(_DWORD *)(BytePtr + 10) = v48;
  return ($89967B733E8F0E8859294B5D59E7AF0F)(v73 | ((unint64_t)v74 << 32));
}

- (void)addRuleField:(int)a3 value:(int)a4 hasAuxValue:(BOOL)a5 auxValue:(unint64_t)a6 inside:(BOOL)a7 forPathComponents:(id)a8 permitLink:(BOOL)a9 componentIndex:(int)a10 parentElement:(id)a11 copyParentWildcardLink:(BOOL)a12
{
  _BOOL8 v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSString *namedLink;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  FilterElementDefinition *wildCard;
  int v30;
  id v31;

  v13 = a7;
  v14 = a5;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v18 = objc_msgSend(a8, "count");
  if (v18 > a10)
  {
    v19 = v18;
    v20 = (void *)objc_msgSend(a8, "objectAtIndex:", a10);
    v21 = v20;
    v31 = v20;
    if (a9)
    {
      if (objc_msgSend(v20, "hasPrefix:", CFSTR("<"))
        && objc_msgSend(v31, "hasSuffix:", CFSTR(">")))
      {
        v22 = v31;
        namedLink = self->_namedLink;
        if (namedLink && !-[NSString isEqualToString:](namedLink, "isEqualToString:", v22) || v19 - 1 != a10 || v13)
        {
          CFLog();
          __break(1u);
        }
        if ((_DWORD)v16 != 196607)
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:].cold.1();

        self->_namedLink = (NSString *)v22;
        return;
      }
      if (objc_msgSend(v31, "isEqualToString:", CFSTR("*")))
      {
        wildCard = self->_wildCard;
        if (!wildCard)
        {
          wildCard = -[FilterElementDefinition initAsRoot:]([FilterElementDefinition alloc], "initAsRoot:", 0);
          self->_wildCard = wildCard;
        }
        if (a10
          && objc_msgSend((id)objc_msgSend(a8, "objectAtIndex:", a10 - 1), "isEqualToString:", CFSTR("**")))
        {
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:].cold.2();
        }
LABEL_37:
        if (v14)
          ++self->_subAuxValueCount;
        -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:](wildCard, "addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:", v16, v15, v14, a6, v13, a8);
        return;
      }
      v30 = objc_msgSend(v31, "isEqualToString:", CFSTR("**"));
      v21 = v31;
      if (v30)
      {
        wildCard = self->_superWildCard;
        if (!wildCard)
        {
          wildCard = -[FilterElementDefinition initAsRoot:]([FilterElementDefinition alloc], "initAsRoot:", 0);
          self->_superWildCard = wildCard;
        }
        if (a10
          && objc_msgSend((id)objc_msgSend(a8, "objectAtIndex:", a10 - 1), "isEqualToString:", CFSTR("**")))
        {
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:].cold.3();
        }
        goto LABEL_37;
      }
    }
    wildCard = (FilterElementDefinition *)-[NSMutableDictionary objectForKey:](self->_setOfMatches, "objectForKey:", v21);
    if (!wildCard)
    {
      wildCard = -[FilterElementDefinition initAsRoot:]([FilterElementDefinition alloc], "initAsRoot:", 0);
      -[NSMutableDictionary setObject:forKey:](self->_setOfMatches, "setObject:forKey:", wildCard, v31);

    }
    goto LABEL_37;
  }
  if ((_DWORD)v16 == 196607)
    -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:].cold.4();
  v24 = -1 << (v16 >> 6);
  v25 = ~v24 << v16;
  v26 = ((int)v15 & (unint64_t)~v24) << v16;
  v27 = 16;
  if (v13)
    v27 = 32;
  *(Class *)((char *)&self->super.isa + v27) = (Class)(v26 | *(uint64_t *)((_BYTE *)&self->super.isa + v27) & ~v25 | 0x8000000000000000);
  if (v13)
    v28 = 40;
  else
    v28 = 24;
  *(Class *)((char *)&self->super.isa + v28) = (Class)(*(uint64_t *)((char *)&self->super.isa + v28) | v25);
  if (v14)
  {
    self->_hasAuxValue = v14;
    self->_auxValue = a6;
    if (a11)
    {
      if (*((_QWORD *)a11 + 10) && a12)
      {

        self->_namedLink = (NSString *)*(id *)(*((_QWORD *)a11 + 10) + 72);
      }
    }
  }
}

- (void)dumpAttributesInto:(char *)a3 forLevel:(int)a4
{
  NSString *rootName;
  uint64_t v7;
  unint64_t rule;
  unint64_t mask;
  unint64_t v10;
  unint64_t v11;

  rootName = self->_rootName;
  if (rootName)
  {
    v7 = -[NSString UTF8String](rootName, "UTF8String");
    rule = self->_rule;
    mask = self->_mask;
    -[FilterElementDefinition isBottomValue](self, "isBottomValue");
    sprintf(a3, "--| (name:%s rule:%llX %llX %s sub:%llX %llX bottom:%d auxValue:%lld count:%d %d)", v7, rule, mask);
  }
  else
  {
    v10 = self->_rule;
    v11 = self->_mask;
    -[FilterElementDefinition isBottomValue](self, "isBottomValue");
    sprintf(a3, "  (rule:%llX %llX %s sub:%llX %llX bottom:%d auxValue:%lld count:%d %d)", v10, v11);
  }
}

- (void)encodeInto:auxArray:namedRootMap:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

@end
