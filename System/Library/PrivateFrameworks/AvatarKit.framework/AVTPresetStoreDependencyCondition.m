@implementation AVTPresetStoreDependencyCondition

- (id)displayString
{
  void *v3;
  NSString *specificPresetIdentifier;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  specificPresetIdentifier = self->_specificPresetIdentifier;
  AVTPresetCategoryToString(-[AVTPreset category](self->_presetOfOtherCategory, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPreset identifier](self->_presetOfOtherCategory, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (specificPresetIdentifier)
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ is \"%@\" and self is \"%@\"), v5, v6, self->_specificPresetIdentifier);
  else
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ is \"%@\"), v5, v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AVTPreset)presetOfOtherCategory
{
  return self->_presetOfOtherCategory;
}

- (void)setPresetOfOtherCategory:(id)a3
{
  objc_storeStrong((id *)&self->_presetOfOtherCategory, a3);
}

- (NSString)specificPresetIdentifier
{
  return self->_specificPresetIdentifier;
}

- (void)setSpecificPresetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_specificPresetIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificPresetIdentifier, 0);
  objc_storeStrong((id *)&self->_presetOfOtherCategory, 0);
}

@end
