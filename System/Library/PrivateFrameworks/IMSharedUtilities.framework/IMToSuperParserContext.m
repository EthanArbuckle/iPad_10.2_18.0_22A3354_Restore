@implementation IMToSuperParserContext

- (void)dealloc
{
  objc_super v3;

  -[IMToSuperParserContext _clearIvars](self, "_clearIvars");
  v3.receiver = self;
  v3.super_class = (Class)IMToSuperParserContext;
  -[IMXMLParserContext dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  objc_super v3;

  -[IMToSuperParserContext _clearIvars](self, "_clearIvars");
  -[IMToSuperParserContext _initIvars](self, "_initIvars");
  v3.receiver = self;
  v3.super_class = (Class)IMToSuperParserContext;
  -[IMXMLParserContext reset](&v3, sel_reset);
}

- (id)name
{
  return CFSTR("IMToSuperParser");
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("backgroundColor"), CFSTR("foregroundColor"), CFSTR("body"), CFSTR("fileTransferGUIDs"), 0);
}

- (void)_initIvars
{
  NSMutableDictionary *v3;
  uint64_t v4;

  self->_underlineCount = 0;
  self->_boldCount = 0;
  self->_italicCount = 0;
  self->_strikethroughCount = 0;
  self->_messagePartNumber = 0;
  self->_fontFamilyStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_fontSizeStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_linkStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_currentAttributes = v3;
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_messagePartNumber);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, *MEMORY[0x1E0D366B8]);
  self->_backgroundColor = 0;
  self->_foregroundColor = 0;
  self->_body = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  self->_fileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_baseWritingDirection = -1;
}

- (void)_clearIvars
{

}

- (void)_updateFontFamily
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *currentAttributes;

  v3 = (void *)-[NSMutableArray lastObject](self->_fontFamilyStack, "lastObject");
  v4 = objc_msgSend(v3, "length");
  currentAttributes = self->_currentAttributes;
  if (v4)
    -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v3, *MEMORY[0x1E0D36440]);
  else
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D36440]);
}

- (void)_updateFontSize
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *currentAttributes;

  v3 = (void *)-[NSMutableArray lastObject](self->_fontSizeStack, "lastObject");
  v4 = objc_msgSend(v3, "integerValue");
  currentAttributes = self->_currentAttributes;
  if (v4 < 1)
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D36448]);
  else
    -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v3, *MEMORY[0x1E0D36448]);
}

- (void)incrementBoldCount
{
  unint64_t boldCount;

  boldCount = self->_boldCount;
  self->_boldCount = boldCount + 1;
  if (!boldCount)
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D36310]);
}

- (void)decrementBoldCount
{
  unint64_t boldCount;
  unint64_t v3;

  boldCount = self->_boldCount;
  if (boldCount)
  {
    v3 = boldCount - 1;
    self->_boldCount = v3;
    if (!v3)
      -[NSMutableDictionary removeObjectForKey:](self->_currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D36310]);
  }
}

- (void)incrementItalicCount
{
  unint64_t italicCount;

  italicCount = self->_italicCount;
  self->_italicCount = italicCount + 1;
  if (!italicCount)
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D365E8]);
}

- (void)decrementItalicCount
{
  unint64_t italicCount;
  unint64_t v3;

  italicCount = self->_italicCount;
  if (italicCount)
  {
    v3 = italicCount - 1;
    self->_italicCount = v3;
    if (!v3)
      -[NSMutableDictionary removeObjectForKey:](self->_currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D365E8]);
  }
}

- (void)incrementUnderlineCount
{
  unint64_t underlineCount;

  underlineCount = self->_underlineCount;
  self->_underlineCount = underlineCount + 1;
  if (!underlineCount)
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D368F0]);
}

- (void)decrementUnderlineCount
{
  unint64_t underlineCount;
  unint64_t v3;

  underlineCount = self->_underlineCount;
  if (underlineCount)
  {
    v3 = underlineCount - 1;
    self->_underlineCount = v3;
    if (!v3)
      -[NSMutableDictionary removeObjectForKey:](self->_currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D368F0]);
  }
}

- (void)incrementStrikethroughCount
{
  unint64_t strikethroughCount;

  strikethroughCount = self->_strikethroughCount;
  self->_strikethroughCount = strikethroughCount + 1;
  if (!strikethroughCount)
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D36858]);
}

- (void)decrementStrikethroughCount
{
  unint64_t strikethroughCount;
  unint64_t v3;

  strikethroughCount = self->_strikethroughCount;
  if (strikethroughCount)
  {
    v3 = strikethroughCount - 1;
    self->_strikethroughCount = v3;
    if (!v3)
      -[NSMutableDictionary removeObjectForKey:](self->_currentAttributes, "removeObjectForKey:", *MEMORY[0x1E0D36858]);
  }
}

- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5
{
  if (a3)
  {
    objc_msgSend(a4, "addObject:");
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", a3, a5);
  }
}

- (void)_popValueFromStack:(id)a3 attributeName:(id)a4
{
  uint64_t v7;
  NSMutableDictionary *currentAttributes;

  objc_msgSend(a3, "removeLastObject");
  v7 = objc_msgSend(a3, "lastObject");
  currentAttributes = self->_currentAttributes;
  if (v7)
    -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v7, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", a4);
}

- (void)pushFontFamily:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_fontFamilyStack, "addObject:");
    MEMORY[0x1E0DE7D20](self, sel__updateFontFamily);
  }
}

- (void)popFontFamily
{
  -[NSMutableArray removeLastObject](self->_fontFamilyStack, "removeLastObject");
  MEMORY[0x1E0DE7D20](self, sel__updateFontFamily);
}

- (void)pushFontSize:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_fontSizeStack, "addObject:");
    MEMORY[0x1E0DE7D20](self, sel__updateFontSize);
  }
}

- (void)popFontSize
{
  -[NSMutableArray removeLastObject](self->_fontSizeStack, "removeLastObject");
  MEMORY[0x1E0DE7D20](self, sel__updateFontSize);
}

- (void)pushLink:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__pushValue_ontoStack_attributeName_);
}

- (void)popLink
{
  MEMORY[0x1E0DE7D20](self, sel__popValueFromStack_attributeName_);
}

- (void)pushBackgroundColor:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__pushValue_ontoStack_attributeName_);
}

- (void)popBackgroundColor
{
  MEMORY[0x1E0DE7D20](self, sel__popValueFromStack_attributeName_);
}

- (void)pushForegroundColor:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__pushValue_ontoStack_attributeName_);
}

- (void)popForegroundColor
{
  MEMORY[0x1E0DE7D20](self, sel__popValueFromStack_attributeName_);
}

- (void)_incrementMessagePartNumber
{
  NSMutableDictionary *currentAttributes;
  uint64_t v3;

  ++self->_messagePartNumber;
  currentAttributes = self->_currentAttributes;
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v3, *MEMORY[0x1E0D366B8]);
}

- (void)appendString:(id)a3
{
  id v5;

  if (objc_msgSend(a3, "length"))
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", a3, self->_currentAttributes);
    -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v5);

  }
}

- (void)appendFileTransferWithGUID:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_appendInlineImageWithGUID_filename_width_height_isAnimoji_isAdaptiveImageGlyph_);
}

- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6
{
  MEMORY[0x1E0DE7D20](self, sel_appendInlineImageWithGUID_filename_width_height_isAnimoji_isAdaptiveImageGlyph_);
}

- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6 isAnimoji:(int64_t)a7 isAdaptiveImageGlyph:(BOOL)a8
{
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  if (!a8)
    -[IMToSuperParserContext _incrementMessagePartNumber](self, "_incrementMessagePartNumber");
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_messagePartNumber);
  objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0D366B8]);
  objc_msgSend(v15, "setObject:forKey:", a3, *MEMORY[0x1E0D36430]);
  if (a4 && a5 >= 1 && a6 >= 1)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a5);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a6);
    objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x1E0D36590]);
    objc_msgSend(v15, "setObject:forKey:", v18, *MEMORY[0x1E0D36588]);
    objc_msgSend(v15, "setObject:forKey:", a4, *MEMORY[0x1E0D36438]);

  }
  if (a7 >= 1)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a7);
    objc_msgSend(v15, "setObject:forKey:", v19, *MEMORY[0x1E0D362E0]);

  }
  v22 = -4;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v22, 1);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v20, v15);
  -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v21);
  -[NSMutableArray addObject:](self->_fileTransferGUIDs, "addObject:", a3);
  if (!a8)
    -[IMToSuperParserContext _incrementMessagePartNumber](self, "_incrementMessagePartNumber");

}

- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D36328];
  v9[0] = *MEMORY[0x1E0D36320];
  v9[1] = v5;
  v10[0] = a3;
  v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v8 = (void *)objc_msgSend(v7, "initWithString:attributes:", *MEMORY[0x1E0D36318], v6);
  -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v8);

}

- (void)appendRichCards:(id)a3 transferGuids:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\uFFFE"), a3);
    -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v6);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(a4);
          -[NSMutableArray addObject:](self->_fileTransferGUIDs, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)appendChipList:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\uFFFF"), a3);
    -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v4);

  }
}

- (NSAttributedString)body
{
  uint64_t v3;
  uint64_t v5;
  NSString *backgroundColor;
  NSString *foregroundColor;
  void *v8;

  v3 = -[NSMutableAttributedString length](self->_body, "length");
  if (!self->_didAddBodyAttributes && v3 != 0)
  {
    v5 = v3;
    backgroundColor = self->_backgroundColor;
    if (backgroundColor)
      -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E0D366A8], backgroundColor, 0, v3);
    foregroundColor = self->_foregroundColor;
    if (foregroundColor)
      -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E0D366B0], foregroundColor, 0, v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", self->_baseWritingDirection);
    -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E0D36308], v8, 0, v5);

    self->_didAddBodyAttributes = 1;
  }
  return &self->_body->super;
}

- (NSArray)fileTransferGUIDs
{
  return &self->_fileTransferGUIDs->super;
}

- (void)setFileTransferGUIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)baseWritingDirection
{
  return self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_baseWritingDirection = a3;
}

@end
