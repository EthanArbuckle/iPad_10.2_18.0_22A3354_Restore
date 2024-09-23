@implementation MUTextPairViewModel

+ (id)textPairViewModelsFromStrings:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  MUTextPairViewModel *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      v6 = objc_alloc_init(MUTextPairViewModel);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUTextPairViewModel setLeftText:](v6, "setLeftText:", v7);

      if (objc_msgSend(v3, "count") <= v5 + 1)
      {
        -[MUTextPairViewModel setRightText:](v6, "setRightText:", 0);
      }
      else
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUTextPairViewModel setRightText:](v6, "setRightText:", v8);

      }
      objc_msgSend(v4, "addObject:", v6);

      v5 += 2;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSString)leftText
{
  return self->_leftText;
}

- (void)setLeftText:(id)a3
{
  objc_storeStrong((id *)&self->_leftText, a3);
}

- (NSString)rightText
{
  return self->_rightText;
}

- (void)setRightText:(id)a3
{
  objc_storeStrong((id *)&self->_rightText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightText, 0);
  objc_storeStrong((id *)&self->_leftText, 0);
}

@end
