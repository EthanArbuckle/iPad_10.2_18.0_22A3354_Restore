@implementation SelectedCheckboxFromIcon__generated__Output

- (SelectedCheckboxFromIcon__generated__Output)initWithLabelProbability:(id)a3 label:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_labelProbability, a3);
    objc_storeStrong((id *)&self->_label, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6289668);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("labelProbability")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithDictionary:error:", self->_labelProbability, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("label")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", self->_label);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSDictionary)labelProbability
{
  return self->_labelProbability;
}

- (void)setLabelProbability:(id)a3
{
  objc_storeStrong((id *)&self->_labelProbability, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelProbability, 0);
}

@end
