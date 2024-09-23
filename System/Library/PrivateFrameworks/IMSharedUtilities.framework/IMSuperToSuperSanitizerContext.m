@implementation IMSuperToSuperSanitizerContext

- (IMSuperToSuperSanitizerContext)initWithAttributedString:(id)a3 extractAttachments:(BOOL)a4
{
  _BOOL4 v4;
  IMSuperToSuperSanitizerContext *v5;
  NSMutableArray *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IMSuperToSuperSanitizerContext;
  v5 = -[IMFromSuperParserContext initWithAttributedString:](&v8, sel_initWithAttributedString_, a3);
  if (v5)
  {
    if (v4)
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v6 = 0;
    v5->_attachments = v6;
    v5->_extractAttachments = v4;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSuperToSuperSanitizerContext;
  -[IMFromSuperParserContext dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return CFSTR("SuperToSuperSanitizer");
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("sanitizedContent"), 0);
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  void *v6;
  char isKindOfClass;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMSuperToSuperSanitizerContext;
  self->_content = (NSMutableAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", -[NSAttributedString string](-[IMAttributedStringParserContext inString](&v12, sel_inString), "string"));
  self->_offset = 0;
  v6 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D366A8]);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = 0;
  if ((isKindOfClass & 1) != 0)
    v8 = v6;
  self->_backgroundColor = v8;
  v9 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D366B0]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  self->_foregroundColor = v10;
  v11 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36308]);
  self->_hadBaseWritingDirectionAttribute = v11 != 0;
  self->_baseWritingDirection = objc_msgSend(v11, "integerValue");
}

- (void)parserDidEnd:(id)a3
{
  NSString *backgroundColor;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    -[NSMutableAttributedString addAttribute:value:range:](self->_content, "addAttribute:value:range:", *MEMORY[0x1E0D366A8], backgroundColor, 0, -[NSMutableAttributedString length](self->_content, "length", a3));
  if (self->_hadBaseWritingDirectionAttribute)
    -[NSMutableAttributedString addAttribute:value:range:](self->_content, "addAttribute:value:range:", *MEMORY[0x1E0D36308], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_baseWritingDirection), 0, -[NSMutableAttributedString length](self->_content, "length"));
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  void *v34;

  length = a5.length;
  location = a5.location;
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_opt_class();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = sub_19E2EF20C;
  v32 = &unk_1E3FB8550;
  v33 = a4;
  v34 = v12;
  v13 = *MEMORY[0x1E0D36440];
  v14 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36440], MEMORY[0x1E0C809B0], 3221225472);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v14, v13);
  v15 = *MEMORY[0x1E0D36448];
  v16 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36448]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v16, v15);
  v17 = *MEMORY[0x1E0D365E8];
  v18 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D365E8]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v18, v17);
  v19 = *MEMORY[0x1E0D36310];
  v20 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36310]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v20, v19);
  v21 = *MEMORY[0x1E0D368F0];
  v22 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D368F0]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v22, v21);
  v23 = *MEMORY[0x1E0D36858];
  v24 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36858]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v24, v23);
  v25 = *MEMORY[0x1E0D365F0];
  v26 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D365F0]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v26, v25);
  v27 = *MEMORY[0x1E0D36758];
  v28 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D36758]);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setObject:forKey:", v28, v27);
  v29 = *MEMORY[0x1E0D36450];
  sub_19E2EF20C((uint64_t)v30, *MEMORY[0x1E0D36450]);
  sub_19E2EF20C((uint64_t)v30, *MEMORY[0x1E0D36300]);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v31)(v30, *MEMORY[0x1E0D366A8], v10);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v31)(v30, *MEMORY[0x1E0D36308], v11);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v31)(v30, *MEMORY[0x1E0D36320], v10);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v31)(v30, *MEMORY[0x1E0D36328], v11);
  if (!objc_msgSend(a4, "objectForKey:", v29) && -[NSString length](self->_foregroundColor, "length"))
    objc_msgSend(v12, "setObject:forKey:", self->_foregroundColor, v29);
  -[NSMutableAttributedString setAttributes:range:](self->_content, "setAttributes:range:", v12, location - self->_offset, length);

}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  unint64_t v15;

  if (self->_extractAttachments)
  {
    length = a5.length;
    location = a5.location;
    -[NSMutableArray addObject:](self->_attachments, "addObject:", a4);
    if (location < -[NSMutableAttributedString length](self->_content, "length"))
      -[NSMutableAttributedString deleteCharactersInRange:](self->_content, "deleteCharactersInRange:", location, length);
    v14 = -[NSMutableAttributedString length](self->_content, "length");
    v15 = self->_offset + length;
    if (v14 - 1 < v15)
      v15 = v14 - 1;
    self->_offset = v15;
  }
}

- (NSAttributedString)sanitizedContent
{
  return (NSAttributedString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

@end
