@implementation MPUEmphasizedText

- (MPUEmphasizedText)init
{
  return -[MPUEmphasizedText initWithString:emphasisRanges:](self, "initWithString:emphasisRanges:", 0, 0);
}

+ (id)attributedStringWithString:(id)a3 emphasisDelimiter:(id)a4 regularTextAttributes:(id)a5 emphasizedTextAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_24DD6E4D8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v14, 0);
    objc_msgSend(v15, "addAttributes:range:", v11, 0, objc_msgSend(v15, "length"));

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __113__MPUEmphasizedText_attributedStringWithString_emphasisDelimiter_regularTextAttributes_emphasizedTextAttributes___block_invoke;
    v18[3] = &unk_24DD6E440;
    v16 = v15;
    v19 = v16;
    v20 = v10;
    objc_msgSend(a1, "_enumerateEmphasisRangesInString:withEmphasisDelimiter:usingBlock:", v13, v12, v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __113__MPUEmphasizedText_attributedStringWithString_emphasisDelimiter_regularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(_QWORD *)(a1 + 40), a2, a3);
}

+ (id)attributedStringWithString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5 regularTextAttributes:(id)a6 emphasizedTextAttributes:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v12 = a7;
  if (a3)
  {
    v13 = (objc_class *)MEMORY[0x24BDD1688];
    v14 = a6;
    v15 = a4;
    v16 = a3;
    v17 = (void *)objc_msgSend([v13 alloc], "initWithString:attributes:", v16, 0);
    objc_msgSend(v17, "addAttributes:range:", v14, 0, objc_msgSend(v17, "length"));

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __121__MPUEmphasizedText_attributedStringWithString_emphasisSubstring_options_regularTextAttributes_emphasizedTextAttributes___block_invoke;
    v20[3] = &unk_24DD6E440;
    v18 = v17;
    v21 = v18;
    v22 = v12;
    objc_msgSend(a1, "_enumerateEmphasisRangesInString:withEmphasisSubstring:options:usingBlock:", v16, v15, a5, v20);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __121__MPUEmphasizedText_attributedStringWithString_emphasisSubstring_options_regularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (MPUEmphasizedText)initWithString:(id)a3 emphasisRanges:(id)a4
{
  id v6;
  id v7;
  MPUEmphasizedText *v8;
  uint64_t v9;
  NSString *string;
  uint64_t v11;
  NSMutableSet *emphasisRangesSet;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPUEmphasizedText;
  v8 = -[MPUEmphasizedText init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    if (objc_msgSend(v7, "count"))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v7);
      emphasisRangesSet = v8->_emphasisRangesSet;
      v8->_emphasisRangesSet = (NSMutableSet *)v11;
    }
    else
    {
      emphasisRangesSet = v8->_emphasisRangesSet;
      v8->_emphasisRangesSet = 0;
    }

  }
  return v8;
}

+ (id)emphasizedTextWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:emphasisRanges:", v3, 0);

  return v4;
}

+ (id)emphasizedTextUsingString:(id)a3 emphasisDelimiter:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", 2);
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_24DD6E4D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__MPUEmphasizedText_emphasizedTextUsingString_emphasisDelimiter___block_invoke;
  v14[3] = &unk_24DD6E468;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "_enumerateEmphasisRangesInString:withEmphasisDelimiter:usingBlock:", v7, v6, v14);

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:emphasisRanges:", v9, v11);
  return v12;
}

void __65__MPUEmphasizedText_emphasizedTextUsingString_emphasisDelimiter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

+ (id)emphasizedTextUsingString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v7 = a3;
  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v9 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__MPUEmphasizedText_emphasizedTextUsingString_emphasisSubstring_options___block_invoke;
  v13[3] = &unk_24DD6E490;
  v13[4] = &v14;
  objc_msgSend(v9, "_enumerateEmphasisRangesInString:withEmphasisSubstring:options:usingBlock:", v7, v8, a5, v13);
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = (void *)objc_msgSend(v10, "initWithString:emphasisRanges:", v7, v15[5]);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __73__MPUEmphasizedText_emphasizedTextUsingString_emphasisSubstring_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a2, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPUEmphasizedText string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUEmphasizedText emphasisRanges](self, "emphasisRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p '%@' emphasisRanges:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_string, "hash");
  return -[NSMutableSet hash](self->_emphasisRangesSet, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  MPUEmphasizedText *v4;
  NSString *string;
  NSMutableSet *emphasisRangesSet;
  char v7;

  v4 = (MPUEmphasizedText *)a3;
  if (self == v4)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (string = self->_string, v4->_string != string) && !-[NSString isEqualToString:](string, "isEqualToString:"))
  {
    v7 = 0;
    goto LABEL_9;
  }
  emphasisRangesSet = v4->_emphasisRangesSet;
  if (emphasisRangesSet == self->_emphasisRangesSet)
LABEL_7:
    v7 = 1;
  else
    v7 = -[NSMutableSet isEqualToSet:](emphasisRangesSet, "isEqualToSet:");
LABEL_9:

  return v7;
}

- (MPUEmphasizedText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MPUEmphasizedText *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPUEmphasizedTextString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPUEmphasizedTextEmphasisRanges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_13:
    v15 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }

    self = -[MPUEmphasizedText initWithString:emphasisRanges:](self, "initWithString:emphasisRanges:", v5, v10);
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MPUEmphasizedText string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("MPUEmphasizedTextString"));
  -[MPUEmphasizedText emphasisRanges](self, "emphasisRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("MPUEmphasizedTextEmphasisRanges"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)emphasisRanges
{
  return (NSArray *)-[NSMutableSet allObjects](self->_emphasisRangesSet, "allObjects");
}

- (NSString)string
{
  return (NSString *)(id)-[NSString copy](self->_string, "copy");
}

- (void)enumerateEmphasisRangesUsingBlock:(id)a3
{
  id v4;
  NSMutableSet *emphasisRangesSet;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    emphasisRangesSet = self->_emphasisRangesSet;
    v7[1] = 3221225472;
    v7[2] = __55__MPUEmphasizedText_enumerateEmphasisRangesUsingBlock___block_invoke;
    v7[3] = &unk_24DD6E4B8;
    v6 = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    -[NSMutableSet enumerateObjectsUsingBlock:](emphasisRangesSet, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

uint64_t __55__MPUEmphasizedText_enumerateEmphasisRangesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(a2, "rangeValue");
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, v6, a3);
}

- (id)newAttributedStringWithRegularTextAttributes:(id)a3 emphasizedTextAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[MPUEmphasizedText string](self, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v8, 0);
    objc_msgSend(v9, "addAttributes:range:", v6, 0, objc_msgSend(v9, "length"));
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __91__MPUEmphasizedText_newAttributedStringWithRegularTextAttributes_emphasizedTextAttributes___block_invoke;
    v14[3] = &unk_24DD6E440;
    v10 = v9;
    v15 = v10;
    v16 = v7;
    -[MPUEmphasizedText enumerateEmphasisRangesUsingBlock:](self, "enumerateEmphasisRangesUsingBlock:", v14);
    v11 = v16;
    v12 = v10;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __91__MPUEmphasizedText_newAttributedStringWithRegularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)newAttributedStringWithTextAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MPUEmphasizedText string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v4);
  else
    v6 = 0;

  return v6;
}

+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisSubstring:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, uint64_t, char *);
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, uint64_t, char *))a6;
  v18 = 0;
  if (objc_msgSend(v10, "length"))
  {
    v12 = objc_msgSend(v9, "length");
    v13 = 0;
    do
    {
      if (v12 <= v13)
        break;
      v14 = objc_msgSend(v9, "rangeOfString:options:range:", v10, a5);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v16 = v14;
      v17 = v15;
      v11[2](v11, v14, v15, &v18);
      v13 = v16 + v17;
    }
    while (!v18);
  }

}

+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisDelimiter:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, unint64_t, char *);
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, unint64_t, char *))a5;
  if ((unint64_t)objc_msgSend(v7, "length") < 2)
    goto LABEL_18;
  v22 = 0;
  v10 = objc_msgSend(v7, "rangeOfString:", v8);
  if (v10 >= 1)
  {
    v11 = objc_msgSend(v7, "length");
    v12 = v10 >= v11 ? v11 : v10;
    v9[2](v9, 0, v12, &v22);
    if (v22)
      goto LABEL_18;
  }
  if (v10 >= (unint64_t)(objc_msgSend(v7, "length") - 2))
    goto LABEL_18;
  objc_msgSend(v7, "substringFromIndex:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsSeparatedByString:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (!v14)
    goto LABEL_17;
  v15 = v14;
  v16 = 0;
  v17 = 0;
  while (1)
  {
    objc_msgSend(v13, "objectAtIndex:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    if (v19)
      break;
LABEL_14:

    if (v15 == ++v16)
      goto LABEL_17;
  }
  v20 = v19;
  if ((v17 & 1) != 0 || (v9[2](v9, v10, v19, &v22), !v22))
  {
    v10 += v20;
    ++v17;
    goto LABEL_14;
  }

LABEL_17:
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_emphasisRangesSet, 0);
}

@end
