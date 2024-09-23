@implementation NAUITextStyleDescriptor

+ (id)descriptorWithTextStyle:(id)a3
{
  id v3;
  NAUITextStyleDescriptor *v4;

  v3 = a3;
  v4 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:]([NAUITextStyleDescriptor alloc], "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v3, 0, 1, 1);

  return v4;
}

- (id)descriptorByAddingSymbolicTraits:(unsigned int)a3 removingSymbolicTraits:(unsigned int)a4
{
  uint64_t v5;
  NAUITextStyleDescriptor *v6;
  void *v7;
  NAUITextStyleDescriptor *v8;

  v5 = -[NAUITextStyleDescriptor symbolicTraits](self, "symbolicTraits") & ~a4 | a3;
  v6 = [NAUITextStyleDescriptor alloc];
  -[NAUITextStyleDescriptor textStyle](self, "textStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:](v6, "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v7, v5, -[NAUITextStyleDescriptor allowsAccessibilitySizes](self, "allowsAccessibilitySizes"), -[NAUITextStyleDescriptor allowsSmallSizes](self, "allowsSmallSizes"));

  return v8;
}

- (id)descriptorByDisallowingAccessibilitySizes
{
  NAUITextStyleDescriptor *v3;
  void *v4;
  NAUITextStyleDescriptor *v5;

  v3 = [NAUITextStyleDescriptor alloc];
  -[NAUITextStyleDescriptor textStyle](self, "textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:](v3, "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v4, -[NAUITextStyleDescriptor symbolicTraits](self, "symbolicTraits"), 0, -[NAUITextStyleDescriptor allowsSmallSizes](self, "allowsSmallSizes"));

  return v5;
}

- (id)descriptorByDisallowingSmallSizes
{
  NAUITextStyleDescriptor *v3;
  void *v4;
  NAUITextStyleDescriptor *v5;

  v3 = [NAUITextStyleDescriptor alloc];
  -[NAUITextStyleDescriptor textStyle](self, "textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:](v3, "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v4, -[NAUITextStyleDescriptor symbolicTraits](self, "symbolicTraits"), -[NAUITextStyleDescriptor allowsAccessibilitySizes](self, "allowsAccessibilitySizes"), 0);

  return v5;
}

+ (id)fontWithTextStyleDescriptor:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "allowsAccessibilitySizes") ^ 1;
  if (!objc_msgSend(v3, "allowsSmallSizes"))
    v4 |= 2uLL;
  v5 = (void *)MEMORY[0x24BEBB528];
  objc_msgSend(v3, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "symbolicTraits");

  objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)defaultFontForTextStyleDescriptor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(a3, "textStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultFontForTextStyle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NAUITextStyleDescriptor)init
{

  return 0;
}

- (NAUITextStyleDescriptor)initWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 allowsAccessibilitySizes:(BOOL)a5 allowsSmallSizes:(BOOL)a6
{
  id v11;
  NAUITextStyleDescriptor *v12;
  NAUITextStyleDescriptor *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NAUITextStyleDescriptor;
  v12 = -[NAUITextStyleDescriptor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textStyle, a3);
    v13->_symbolicTraits = a4;
    v13->_allowsAccessibilitySizes = a5;
    v13->_allowsSmallSizes = a6;
  }

  return v13;
}

id __38__NAUITextStyleDescriptor_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_6 != -1)
    dispatch_once(&_block_invoke_na_once_token_6, &__block_literal_global_4);
  return (id)_block_invoke_na_once_object_6;
}

void __38__NAUITextStyleDescriptor_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6B610], "builder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCharacteristic:", &__block_literal_global_7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendCharacteristic:", &__block_literal_global_10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendCharacteristic:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_block_invoke_na_once_object_6;
  _block_invoke_na_once_object_6 = v4;

}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textStyle");
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a2, "symbolicTraits"));
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "allowsAccessibilitySizes"));
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "allowsSmallSizes"));
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE6B600], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAUITextStyleDescriptor textStyle](self, "textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("textStyle"), 0);

  v5 = (id)objc_msgSend(v3, "appendSuper");
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_allowsSmallSizes, CFSTR("allowsSmallSizes"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_allowsAccessibilitySizes, &stru_24D612948);
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_symbolicTraits, CFSTR("custom-traits"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (unsigned)symbolicTraits
{
  return self->_symbolicTraits;
}

- (BOOL)allowsAccessibilitySizes
{
  return self->_allowsAccessibilitySizes;
}

- (BOOL)allowsSmallSizes
{
  return self->_allowsSmallSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
}

@end
