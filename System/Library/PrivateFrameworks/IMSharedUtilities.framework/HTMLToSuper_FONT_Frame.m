@implementation HTMLToSuper_FONT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  id v20;

  v20 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  v10 = objc_msgSend(v20, "objectForKey:", CFSTR("face"));
  v11 = (void *)objc_msgSend(v20, "objectForKey:", CFSTR("absz"));
  v12 = (void *)objc_msgSend(v20, "objectForKey:", CFSTR("size"));
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
LABEL_3:
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    goto LABEL_4;
  }
  v15 = v12;
  v16 = objc_msgSend(v12, "length");
  if (v16 == 1)
  {
    v18 = objc_msgSend(v15, "characterAtIndex:", 0);
  }
  else
  {
    if (v16 == 2)
    {
      v17 = objc_msgSend(v15, "characterAtIndex:", 0);
      v18 = objc_msgSend(v15, "characterAtIndex:", 1);
      goto LABEL_15;
    }
    v18 = 0;
  }
  v17 = 1;
LABEL_15:
  v14 = 0;
  v19 = v17 * v18;
  if (v17 * v18 > 2106)
  {
    if (v19 > 2204)
    {
      switch(v19)
      {
        case 2205:
LABEL_29:
          v13 = 10;
          goto LABEL_3;
        case 2295:
          v13 = 6;
          goto LABEL_3;
        case 2250:
LABEL_26:
          v13 = 8;
          goto LABEL_3;
      }
    }
    else
    {
      switch(v19)
      {
        case 2107:
LABEL_27:
          v13 = 14;
          goto LABEL_3;
        case 2150:
LABEL_28:
          v13 = 18;
          goto LABEL_3;
        case 2193:
LABEL_22:
          v13 = 24;
          goto LABEL_3;
      }
    }
  }
  else
  {
    switch(v19)
    {
      case '1':
        goto LABEL_26;
      case '2':
        goto LABEL_29;
      case '3':
        v13 = 12;
        goto LABEL_3;
      case '4':
        goto LABEL_27;
      case '5':
        goto LABEL_28;
      case '6':
        goto LABEL_22;
      case '7':
        v13 = 36;
        goto LABEL_3;
      default:
        break;
    }
  }
LABEL_4:
  if (v10)
  {
    objc_msgSend(a4, "pushFontFamily:", v10);
    self->_shouldPopFontName = 1;
  }
  if (v14)
  {
    objc_msgSend(a4, "pushFontSize:", v14);
    self->_shouldPopFontSize = 1;
  }

}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopFontName)
    objc_msgSend(a4, "popFontFamily", a3, a4, a5, a6, a7);
  if (self->_shouldPopFontSize)
    MEMORY[0x1E0DE7D20](a4, sel_popFontSize);
}

@end
