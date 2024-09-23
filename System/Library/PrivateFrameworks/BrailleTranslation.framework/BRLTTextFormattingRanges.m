@implementation BRLTTextFormattingRanges

- (void)addBoldRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *boldRanges;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  boldRanges = self->_boldRanges;
  if (!boldRanges)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_boldRanges;
    self->_boldRanges = v7;

    boldRanges = self->_boldRanges;
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](boldRanges, "addObject:", v9);

}

- (NSMutableArray)boldRanges
{
  return self->_boldRanges;
}

- (void)addItalicRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *italicRanges;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  italicRanges = self->_italicRanges;
  if (!italicRanges)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_italicRanges;
    self->_italicRanges = v7;

    italicRanges = self->_italicRanges;
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](italicRanges, "addObject:", v9);

}

- (NSMutableArray)italicRanges
{
  return self->_italicRanges;
}

- (void)addUnderlineRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *underlineRanges;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  underlineRanges = self->_underlineRanges;
  if (!underlineRanges)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_underlineRanges;
    self->_underlineRanges = v7;

    underlineRanges = self->_underlineRanges;
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](underlineRanges, "addObject:", v9);

}

- (NSMutableArray)underlineRanges
{
  return self->_underlineRanges;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *underlineRanges;
  id v5;
  void *v6;
  void *v7;
  id v8;

  underlineRanges = self->_underlineRanges;
  v5 = a3;
  v6 = (void *)-[NSMutableArray copy](underlineRanges, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("underlineRanges"));

  v7 = (void *)-[NSMutableArray copy](self->_italicRanges, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("italicRanges"));

  v8 = (id)-[NSMutableArray copy](self->_boldRanges, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("boldRanges"));

}

- (BRLTTextFormattingRanges)initWithCoder:(id)a3
{
  id v3;
  BRLTTextFormattingRanges *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *underlineRanges;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *italicRanges;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *boldRanges;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)BRLTTextFormattingRanges;
  v3 = a3;
  v4 = -[BRLTTextFormattingRanges init](&v21, sel_init);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("underlineRanges"));
  v8 = objc_claimAutoreleasedReturnValue();
  underlineRanges = v4->_underlineRanges;
  v4->_underlineRanges = (NSMutableArray *)v8;

  v10 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("italicRanges"));
  v13 = objc_claimAutoreleasedReturnValue();
  italicRanges = v4->_italicRanges;
  v4->_italicRanges = (NSMutableArray *)v13;

  v15 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("boldRanges"));
  v18 = objc_claimAutoreleasedReturnValue();

  boldRanges = v4->_boldRanges;
  v4->_boldRanges = (NSMutableArray *)v18;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[BRLTTextFormattingRanges underlineRanges](self, "underlineRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUnderlineRanges:", v6);

  -[BRLTTextFormattingRanges italicRanges](self, "italicRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setItalicRanges:", v8);

  -[BRLTTextFormattingRanges boldRanges](self, "boldRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBoldRanges:", v10);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)BRLTTextFormattingRanges;
  -[BRLTTextFormattingRanges description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTextFormattingRanges underlineRanges](self, "underlineRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTextFormattingRanges italicRanges](self, "italicRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTextFormattingRanges boldRanges](self, "boldRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: underline{%@}, italic{%@}, bold{%@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BRLTTextFormattingRanges *v4;
  BRLTTextFormattingRanges *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (BRLTTextFormattingRanges *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BRLTTextFormattingRanges underlineRanges](self, "underlineRanges");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTextFormattingRanges underlineRanges](v5, "underlineRanges");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[BRLTTextFormattingRanges underlineRanges](self, "underlineRanges");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRLTTextFormattingRanges underlineRanges](v5, "underlineRanges");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToArray:", v10);

        if (!v11)
          goto LABEL_11;
      }
      -[BRLTTextFormattingRanges italicRanges](self, "italicRanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTextFormattingRanges italicRanges](v5, "italicRanges");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[BRLTTextFormattingRanges italicRanges](self, "italicRanges");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRLTTextFormattingRanges italicRanges](v5, "italicRanges");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToArray:", v17);

        if (!v18)
        {
LABEL_11:
          v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[BRLTTextFormattingRanges boldRanges](self, "boldRanges");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTTextFormattingRanges boldRanges](v5, "boldRanges");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {
        v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        -[BRLTTextFormattingRanges boldRanges](self, "boldRanges");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRLTTextFormattingRanges boldRanges](v5, "boldRanges");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqualToArray:", v23);

      }
      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (void)setBoldRanges:(id)a3
{
  objc_storeStrong((id *)&self->_boldRanges, a3);
}

- (void)setItalicRanges:(id)a3
{
  objc_storeStrong((id *)&self->_italicRanges, a3);
}

- (void)setUnderlineRanges:(id)a3
{
  objc_storeStrong((id *)&self->_underlineRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineRanges, 0);
  objc_storeStrong((id *)&self->_italicRanges, 0);
  objc_storeStrong((id *)&self->_boldRanges, 0);
}

@end
