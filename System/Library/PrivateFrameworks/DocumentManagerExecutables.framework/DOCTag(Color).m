@implementation DOCTag(Color)

- (uint64_t)tagColorIfNotClear
{
  return objc_msgSend(a1, "_tagColorWithFallback:", &__block_literal_global_1_0);
}

- (id)_tagColorWithFallback:()Color
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "labelIndex");
  if (v5)
    objc_msgSend(MEMORY[0x24BEBD4B8], "doc_colorForTagColor:", v5);
  else
    v4[2](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)nonClearNoneTagColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "doc_colorForTagColor:", 0);
}

- (uint64_t)tagColor
{
  return objc_msgSend(a1, "_tagColorWithFallback:", &__block_literal_global_4);
}

- (uint64_t)tagBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "doc_secondaryColorForTagColor:", objc_msgSend(a1, "labelIndex"));
}

@end
