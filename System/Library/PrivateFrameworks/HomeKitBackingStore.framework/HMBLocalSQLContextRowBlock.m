@implementation HMBLocalSQLContextRowBlock

- (HMBLocalSQLContextRowBlock)initWithBlockRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5
{
  id v9;
  HMBLocalSQLContextRowBlock *v10;
  HMBLocalSQLContextRowBlock *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMBLocalSQLContextRowBlock;
  v10 = -[HMBLocalSQLContextRowBlock init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_blockRow = a3;
    v10->_type = a4;
    objc_storeStrong((id *)&v10->_optionsData, a5);
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowBlock blockRow](self, "blockRow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Row"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowBlock type](self, "type", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Type"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBLocalSQLContextRowBlock optionsData](self, "optionsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("<not nil>");
  else
    v11 = CFSTR("<nil>");
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Options Data"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)optionsData
{
  return self->_optionsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsData, 0);
}

@end
