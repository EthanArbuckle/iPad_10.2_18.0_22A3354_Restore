@implementation _StringAndWidthCache

- (_StringAndWidthCache)init
{
  _StringAndWidthCache *v2;
  NSMutableArray *v3;
  NSMutableArray *attributedStrings;
  NSMutableArray *v5;
  NSMutableArray *boxedSizes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_StringAndWidthCache;
  v2 = -[_StringAndWidthCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    attributedStrings = v2->_attributedStrings;
    v2->_attributedStrings = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    boxedSizes = v2->_boxedSizes;
    v2->_boxedSizes = v5;

  }
  return v2;
}

- (void)addAttributedString:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  NSMutableArray *boxedSizes;
  id v8;

  height = a4.height;
  width = a4.width;
  -[NSMutableArray addObject:](self->_attributedStrings, "addObject:", a3);
  boxedSizes = self->_boxedSizes;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", width, height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](boxedSizes, "addObject:", v8);

}

- (id)attributedStringAndSize:(CGSize *)a3 forMaxWidth:(double)a4
{
  NSMutableArray *boxedSizes;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  boxedSizes = self->_boxedSizes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60___StringAndWidthCache_attributedStringAndSize_forMaxWidth___block_invoke;
  v7[3] = &unk_24CBFAC38;
  *(double *)&v7[6] = a4;
  v7[4] = self;
  v7[5] = &v8;
  v7[7] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](boxedSizes, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)attributedStringForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_attributedStrings, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_attributedStrings, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)attributedStringCount
{
  return -[NSMutableArray count](self->_attributedStrings, "count");
}

- (id)smallestAttributedStringAndSize:(CGSize *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *boxedSizes;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  CGSize *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v18 = 0;
  v19 = (CGSize *)&v18;
  v20 = 0x3010000000;
  v22 = 0;
  v23 = 0;
  v21 = &unk_2115706D6;
  -[NSMutableArray lastObject](self->_boxedSizes, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGSizeValue");
  v22 = v6;
  v23 = v7;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  -[NSMutableArray lastObject](self->_attributedStrings, "lastObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  boxedSizes = self->_boxedSizes;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56___StringAndWidthCache_smallestAttributedStringAndSize___block_invoke;
  v11[3] = &unk_24CBFAC60;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](boxedSizes, "enumerateObjectsUsingBlock:", v11);
  if (a3)
    *a3 = v19[2];
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxedSizes, 0);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
}

@end
