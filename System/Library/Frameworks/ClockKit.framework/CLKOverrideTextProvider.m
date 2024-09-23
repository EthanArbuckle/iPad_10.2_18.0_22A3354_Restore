@implementation CLKOverrideTextProvider

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  void (**overrideBlock)(id, NSString *, unint64_t, id);
  void *v8;
  void *v9;

  v6 = a4;
  overrideBlock = (void (**)(id, NSString *, unint64_t, id))self->_overrideBlock;
  if (overrideBlock)
  {
    overrideBlock[2](overrideBlock, self->_text, a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "_attributedStringWithOtherAttributesFromStyle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKOverrideTextProvider;
  if (-[CLKTextProvider isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CLKOverrideTextProvider text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKOverrideTextProvider;
  v3 = -[CLKTextProvider hash](&v7, sel_hash);
  -[CLKOverrideTextProvider text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "hash");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKOverrideTextProvider *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKOverrideTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4 != self)
  {
    -[CLKOverrideTextProvider text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKOverrideTextProvider setText:](v4, "setText:", v5);

    -[CLKOverrideTextProvider overrideBlock](self, "overrideBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKOverrideTextProvider setOverrideBlock:](v4, "setOverrideBlock:", v6);

  }
  return v4;
}

+ (id)textProviderWithText:(id)a3 overrideBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPrivate");
  objc_msgSend(v7, "setOverrideBlock:", v5);

  objc_msgSend(v7, "setText:", v6);
  return v7;
}

+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4
{
  return (id)objc_msgSend(a1, "_dashTrackingTextProviderWithDashes:tracking:weight:", a3, a4, 1.79769313e308);
}

+ (id)_dashTrackingTextProviderWithDashes:(id)a3 tracking:(double)a4 weight:(double)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__CLKOverrideTextProvider__dashTrackingTextProviderWithDashes_tracking_weight___block_invoke;
  v6[3] = &__block_descriptor_48_e66___NSAttributedString_32__0__NSString_8Q16__CLKTextProviderStyle_24l;
  *(double *)&v6[4] = a5;
  *(double *)&v6[5] = a4;
  +[CLKOverrideTextProvider textProviderWithText:overrideBlock:](CLKOverrideTextProvider, "textProviderWithText:overrideBlock:", a3, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __79__CLKOverrideTextProvider__dashTrackingTextProviderWithDashes_tracking_weight___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = 0;
  if (a2 && !a3)
  {
    v9 = a2;
    objc_msgSend(v7, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CLKFontWithAlternativePunctuation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(double *)(a1 + 32) != 1.79769313e308)
    {
      objc_msgSend(v7, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pointSize");
      +[CLKFont systemFontOfSize:weight:](CLKFont, "systemFontOfSize:weight:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "fontDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BEBE190];
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BEBE190]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fontDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      v29[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fontDescriptorByAddingAttributes:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v19, 0.0);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
    v21 = objc_msgSend(v9, "length");

    v22 = *(double *)(a1 + 40);
    objc_msgSend(v7, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CLKKernValueForDesignSpecTrackingValue(v23, v22);

    v25 = *MEMORY[0x24BEBD280];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v25, v26, 0, v21);

    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BEBD270], v11, 0, v21);
  }

  return v8;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)overrideBlock
{
  return self->_overrideBlock;
}

- (void)setOverrideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overrideBlock, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
