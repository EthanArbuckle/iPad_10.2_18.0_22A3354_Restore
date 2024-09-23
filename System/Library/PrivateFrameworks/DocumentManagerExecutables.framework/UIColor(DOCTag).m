@implementation UIColor(DOCTag)

+ (uint64_t)doc_colorForTagColor:()DOCTag
{
  return objc_msgSend(a1, "_doc_interfaceColorForTag:withAlphaComponent:", 1.0);
}

+ (id)_doc_interfaceColorForTag:()DOCTag withAlphaComponent:
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a4 <= 1)
    a4 = 1;
  objc_msgSend(MEMORY[0x24BEBD4B8], "_doc_underlyingColorForTagColor:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && UIAccessibilityIsInvertColorsEnabled())
  {
    objc_msgSend(v6, "_doc_invertedColor");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

+ (id)_doc_underlyingColorForTagColor:()DOCTag
{
  unint64_t v4;

  if (_doc_underlyingColorForTagColor__onceToken != -1)
    dispatch_once(&_doc_underlyingColorForTagColor__onceToken, &__block_literal_global_8);
  if (objc_msgSend((id)_doc_underlyingColorForTagColor__colors, "count") <= a3)
    v4 = 0;
  else
    v4 = a3;
  objc_msgSend((id)_doc_underlyingColorForTagColor__colors, "objectAtIndexedSubscript:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)doc_secondaryColorForTagColor:()DOCTag
{
  return objc_msgSend(a1, "_doc_interfaceColorForTag:withAlphaComponent:", 0.2);
}

@end
