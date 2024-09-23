@implementation ESEditScriptDataArray

- (ESEditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v6;
  ESEditScriptDataArray *v7;
  ESEditScriptDataArray *v8;
  unint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *data;
  __objc2_class **p_superclass;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *v27;
  ESEditScriptDataArray *v28;
  unint64_t v29;
  unint64_t v30;
  __objc2_class **v31;
  void *v32;
  NSArray *v33;
  void *v34;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  ESEditScriptDataArray *v39;
  objc_super v40;

  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ESEditScriptDataArray;
  v7 = -[ESEditScriptDataArray init](&v40, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ESEditScriptDataArray setCachedStringValue:](v7, "setCachedStringValue:", v6);
    v9 = objc_msgSend(v6, "length");
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
      v12 = objc_claimAutoreleasedReturnValue();
      data = v8->_data;
      v8->_data = (NSArray *)v12;

      p_superclass = ESEditScriptDataArray.superclass;
      if (!initWithString_chunkSize__whitespaceOrPunctuationCharacterSet)
      {
        objc_msgSend(MEMORY[0x24BDD1690], "whitespaceCharacterSet");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)initWithString_chunkSize__whitespaceOrPunctuationCharacterSet;
        initWithString_chunkSize__whitespaceOrPunctuationCharacterSet = v15;

        v17 = (void *)initWithString_chunkSize__whitespaceOrPunctuationCharacterSet;
        objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "formUnionWithCharacterSet:", v18);

      }
      v37 = 0;
      if (v9)
      {
        v19 = 0;
        v20 = 0;
        v21 = v9 - 1;
        v36 = v6;
        do
        {
          v22 = IsCharacterAtIndexMemberOfCharacterSet(v6, &v37, p_superclass[93]);
          v23 = v22;
          v24 = v37;
          if ((v22 & 1) != 0 || v37 == v21)
          {
            v25 = v19 + v20;
            v26 = (v22 << 63 >> 63) - (v19 + v20) + v37;
            if (v26 >= 0)
            {
              v20 = v26 + 1;
              v27 = v8->_data;
              objc_msgSend(v6, "substringWithRange:", v25, v26 + 1);
              v28 = v8;
              v29 = v21;
              v30 = v9;
              v31 = p_superclass;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v27, "addObject:", v32);

              p_superclass = v31;
              v9 = v30;
              v21 = v29;
              v8 = v28;
              v6 = v36;
              v19 = v25;
            }
            if (v23)
            {
              v33 = v8->_data;
              objc_msgSend(v6, "substringWithRange:", v24, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v33, "addObject:", v34);

              v20 = 1;
              v19 = v24;
            }
          }
          v37 = v24 + 1;
        }
        while (v24 + 1 < v9);
      }
    }
    else if (!a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v8->_data;
      v8->_data = (NSArray *)v10;

      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __50__ESEditScriptDataArray_initWithString_chunkSize___block_invoke;
      v38[3] = &unk_24F475DD8;
      v39 = v8;
      objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v38);

    }
  }

  return v8;
}

uint64_t __50__ESEditScriptDataArray_initWithString_chunkSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", a2);
}

- (ESEditScriptDataArray)initWithArray:(id)a3
{
  id v4;
  ESEditScriptDataArray *v5;
  uint64_t v6;
  NSArray *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ESEditScriptDataArray;
  v5 = -[ESEditScriptDataArray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSArray *)v6;

  }
  return v5;
}

- (NSString)description
{
  return -[NSArray description](self->_data, "description");
}

+ (id)EditScriptDataWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v5;
  ESEditScriptDataArray *v6;

  v5 = a3;
  v6 = -[ESEditScriptDataArray initWithString:chunkSize:]([ESEditScriptDataArray alloc], "initWithString:chunkSize:", v5, a4);

  return v6;
}

+ (id)EditScriptDataWithArray:(id)a3
{
  id v3;
  ESEditScriptDataArray *v4;

  v3 = a3;
  v4 = -[ESEditScriptDataArray initWithArray:]([ESEditScriptDataArray alloc], "initWithArray:", v3);

  return v4;
}

- (int64_t)length
{
  return -[NSArray count](self->_data, "count");
}

- (id)stringAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", a3);
}

- (id)stringValue
{
  NSString *cachedStringValue;
  void *v4;

  cachedStringValue = self->_cachedStringValue;
  if (!cachedStringValue)
  {
    -[NSArray componentsJoinedByString:](self->_data, "componentsJoinedByString:", &stru_24F475E38);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ESEditScriptDataArray setCachedStringValue:](self, "setCachedStringValue:", v4);

    cachedStringValue = self->_cachedStringValue;
  }
  return cachedStringValue;
}

- (int64_t)lengthOfItem:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (int64_t)characterIndexForItem:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;

  if (a3 < 1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[ESEditScriptDataArray lengthOfItem:](self, "lengthOfItem:", v5++);
  while (a3 != v5);
  return v6;
}

- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4 fallsOnWordBoundary:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  int64_t v26;
  unint64_t v28;
  unint64_t v29;
  BOOL *v30;
  uint64_t v31;

  v6 = a4;
  v8 = a3;
  v9 = -[ESEditScriptDataArray length](self, "length");
  v10 = objc_msgSend(v8, "length");
  v11 = v10;
  if (v9 >= v10)
    v12 = v10;
  else
    v12 = v9;
  if (!v12)
  {
    v14 = 0;
    v13 = 0;
    if (!a5)
      goto LABEL_25;
    goto LABEL_19;
  }
  v29 = v9;
  v30 = a5;
  v13 = 0;
  v14 = 0;
  v28 = v10;
  v15 = v10 - 1;
  v16 = v9 - 1;
  while (1)
  {
    v17 = v6 ? v16 : v13;
    v18 = v6 ? v15 : v13;
    -[ESEditScriptDataArray stringAtIndex:](self, "stringAtIndex:", v17, v28, v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringAtIndex:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) == 0)
      break;

    ++v13;
    --v15;
    --v16;
    v14 = v19;
    if (v12 == v13)
    {
      v14 = v19;
      v13 = v12;
      goto LABEL_18;
    }
  }

LABEL_18:
  v9 = v29;
  a5 = v30;
  v11 = v28;
  if (v30)
  {
LABEL_19:
    v21 = objc_msgSend(v14, "length");
    v22 = v21 - 1;
    if (v21 < 1)
    {
      v24 = 1;
    }
    else
    {
      if (v6)
        v22 = 0;
      v31 = v22;
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = IsCharacterAtIndexMemberOfCharacterSet(v14, &v31, v23);

    }
    *a5 = v24;
  }
LABEL_25:
  if (v13 == v12 && v9 == v11)
    v26 = -1;
  else
    v26 = v13;

  return v26;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)cachedStringValue
{
  return self->_cachedStringValue;
}

- (void)setCachedStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStringValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringValue, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
