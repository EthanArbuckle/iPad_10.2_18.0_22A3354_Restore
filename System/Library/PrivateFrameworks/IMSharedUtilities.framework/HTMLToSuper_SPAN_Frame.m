@implementation HTMLToSuper_SPAN_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  v10 = IMCreateDictionaryFromCSSString((void *)objc_msgSend(v15, "objectForKey:", CFSTR("style")), 1);
  v11 = objc_msgSend(v10, "objectForKey:", CFSTR("font-family"));
  v12 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("font-style"));
  v13 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("font-weight"));
  v14 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("text-decoration"));
  if (v11)
  {
    objc_msgSend(a4, "pushFontFamily:", v11);
    self->_shouldPopFontFamily = 1;
  }
  if (v13
    && (objc_msgSend(v13, "rangeOfString:options:", CFSTR("bold"), 1) != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v13, "integerValue") >= 700))
  {
    objc_msgSend(a4, "incrementBoldCount");
    self->_shouldDecrementBoldCount = 1;
  }
  if (v12
    && (objc_msgSend(v12, "rangeOfString:options:", CFSTR("italic"), 1) != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v12, "rangeOfString:options:", CFSTR("oblique"), 1) != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(a4, "incrementItalicCount");
    self->_shouldDecrementItalicCount = 1;
  }
  if (v14)
  {
    if (objc_msgSend(v14, "rangeOfString:options:", CFSTR("under"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a4, "incrementUnderlineCount");
      self->_shouldDecrementUnderlineCount = 1;
    }
    if (objc_msgSend(v14, "rangeOfString:options:", CFSTR("line-through"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a4, "incrementStrikethroughCount");
      self->_shouldDecrementStrikeCount = 1;
    }
  }

}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopFontFamily)
    objc_msgSend(a4, "popFontFamily", a3, a4, a5, a6, a7);
  if (self->_shouldDecrementBoldCount)
    objc_msgSend(a4, "decrementBoldCount", a3, a4, a5, a6, a7);
  if (self->_shouldDecrementItalicCount)
    objc_msgSend(a4, "decrementItalicCount", a3, a4, a5, a6, a7);
  if (self->_shouldDecrementUnderlineCount)
    objc_msgSend(a4, "decrementUnderlineCount", a3, a4, a5, a6, a7);
  if (self->_shouldDecrementStrikeCount)
    MEMORY[0x1E0DE7D20](a4, sel_decrementStrikethroughCount);
}

@end
