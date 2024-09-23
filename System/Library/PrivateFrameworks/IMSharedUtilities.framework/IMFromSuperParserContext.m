@implementation IMFromSuperParserContext

- (IMFromSuperParserContext)initWithAttributedString:(id)a3
{
  IMFromSuperParserContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMFromSuperParserContext;
  v3 = -[IMAttributedStringParserContext initWithAttributedString:](&v5, sel_initWithAttributedString_, a3);
  if (v3)
  {
    v3->_inlinedFileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_standaloneFileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_foundBreadcrumbText = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMFromSuperParserContext;
  -[IMAttributedStringParserContext dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return CFSTR("IMFromSuper");
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("inlinedFileTransferGUIDs"), CFSTR("standaloneFileTransferGUIDs"), 0);
}

- (void)parserDidStart:(id)a3
{
  NSAttributedString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v5 = -[IMAttributedStringParserContext inString](self, "inString");
  if (-[NSAttributedString length](v5, "length"))
  {
    v6 = *MEMORY[0x1E0D366A8];
    v7 = -[NSAttributedString attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D366A8], 0, 0);
    v8 = *MEMORY[0x1E0D366B0];
    v9 = -[NSAttributedString attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D366B0], 0, 0);
    v10 = *MEMORY[0x1E0D36308];
    v11 = -[NSAttributedString attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36308], 0, 0);
    if (v7)
      objc_msgSend(v12, "setObject:forKey:", v7, v6);
    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, v8);
    if (v11)
      objc_msgSend(v12, "setObject:forKey:", v11, v10);
  }
  -[IMFromSuperParserContext parserDidStart:bodyAttributes:](self, "parserDidStart:bodyAttributes:", a3, v12);

}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSAttributedString *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int *v19;
  uint64_t v20;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    v10 = -[IMAttributedStringParserContext inString](self, "inString");
    v11 = -[NSString characterAtIndex:](-[NSAttributedString string](v10, "string"), "characterAtIndex:", location);
    v12 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36430]);
    v13 = v12;
    if (v11 == 65532 || v12)
    {
      v20 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36438]);
      v14 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36420]);
      v15 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36590]);
      v16 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36588]);
      v17 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D362E0]);
      if (v13)
      {
        if (v16)
          v18 = v15 == 0;
        else
          v18 = 1;
        v19 = &OBJC_IVAR___IMFromSuperParserContext__standaloneFileTransferGUIDs;
        if (!v18)
          v19 = &OBJC_IVAR___IMFromSuperParserContext__inlinedFileTransferGUIDs;
        objc_msgSend(*(id *)((char *)&self->super.super.isa + *v19), "addObject:", v13);
      }
      -[IMFromSuperParserContext parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:](self, "parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:", a3, a4, location, length, v13, v20, v14, v15, v16, v17);
    }
    else if (v11 == 65533)
    {
      if (!self->_foundBreadcrumbText)
      {
        if (objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36320]))
        {
          self->_foundBreadcrumbText = 1;
          objc_msgSend((id)objc_msgSend(a4, "_numberForKey:", *MEMORY[0x1E0D36328]), "intValue");
          MEMORY[0x1E0DE7D20](self, sel_parser_foundBreadcrumbText_withOptions_);
        }
      }
    }
    else
    {
      -[NSString substringWithRange:](-[NSAttributedString string](v10, "string"), "substringWithRange:", location, length);
      MEMORY[0x1E0DE7D20](self, sel_parser_foundAttributes_inRange_characters_);
    }
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
  -[IMFromSuperParserContext parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:](self, "parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:", a3, a4, a5.location, a5.length, a6, a7, a8, a9, a10, 0);
}

- (NSArray)inlinedFileTransferGUIDs
{
  return &self->_inlinedFileTransferGUIDs->super;
}

- (NSArray)standaloneFileTransferGUIDs
{
  return &self->_standaloneFileTransferGUIDs->super;
}

- (BOOL)foundBreadcrumbText
{
  return self->_foundBreadcrumbText;
}

@end
