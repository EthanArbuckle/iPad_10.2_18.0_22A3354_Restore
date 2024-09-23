@implementation NSSmartPunctuationController

- (NSSmartPunctuationController)init
{
  NSSmartPunctuationController *v2;
  NSSmartPunctuationController *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSSmartPunctuationController;
  v2 = -[NSSmartPunctuationController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_types = 192;
    v2->_options = -[NSSmartQuoteOptions initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:]([NSSmartQuoteOptions alloc], "initWithLeftSingleQuote:rightSingleQuote:apostrophe:leftDoubleQuote:rightDoubleQuote:", CFSTR("‘"), CFSTR("’"), CFSTR("’"), CFSTR("“"), CFSTR("”"));
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->_client = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSmartPunctuationController;
  -[NSSmartPunctuationController dealloc](&v3, sel_dealloc);
}

- (NSSmartQuoteOptions)smartQuoteOptions
{
  return self->_options;
}

- (void)setSmartQuoteOptions:(id)a3
{
  NSSmartQuoteOptions *options;

  options = self->_options;
  if (options != a3)
  {

    self->_options = (NSSmartQuoteOptions *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)smartQuotesEnabled
{
  return (LOBYTE(self->_types) >> 6) & 1;
}

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_types = self->_types & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)smartDashesEnabled
{
  return LOBYTE(self->_types) >> 7;
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_types = self->_types & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (NSSmartPunctuationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  self->_client = (NSSmartPunctuationClient *)a3;
}

- (void)clientDidReplaceRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger location;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  int v17;
  NSUInteger v18;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  NSSmartQuoteOptions *options;
  NSString *v36;
  NSSmartQuoteOptions *v37;
  NSString *v38;
  uint64_t v39;
  NSQuoteCheckingResult *v40;
  NSQuoteCheckingResult *v41;
  void *v42;
  NSCharacterSet *v43;
  NSUInteger v44;
  NSCharacterSet *v45;
  _BOOL4 v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;

  if (a3.location)
    v4 = a3.location - 1;
  else
    v4 = 0;
  v5 = a3.location != 0;
  v49 = *MEMORY[0x1E0C80C00];
  if (a3.location)
    v6 = a3.location - 1;
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 1;
  if (a3.location)
    v7 = 2;
  if (self->_client)
  {
    if (self->_options)
    {
      v9 = a3.length + a4;
      v10 = v7 + a3.length + a4;
      if (v10)
      {
        location = a3.location;
        if (-[NSSmartPunctuationController smartQuotesEnabled](self, "smartQuotesEnabled"))
        {
          v47 = 0;
          v48 = 0;
          v12 = (void *)-[NSSmartPunctuationClient substringForProposedRange:actualRange:](self->_client, "substringForProposedRange:actualRange:", v4, v10, &v47);
          if (v12)
          {
            if (v48)
            {
              v13 = v12;
              v14 = objc_msgSend(v12, "length");
              if (v14 == v48)
              {
                v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v45 = +[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet");
                v43 = +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
                if (!clientDidReplaceRange_changeInLength__openerCharacterSet)
                  clientDidReplaceRange_changeInLength__openerCharacterSet = objc_retain(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("([{</@-=%C%C"), 8211, 8212)));
                if (v48)
                {
                  v15 = 0;
                  v16 = v9 + location;
                  v44 = v9 + location;
                  do
                  {
                    v17 = objc_msgSend(v13, "characterAtIndex:", v15);
                    v18 = v47 + v15;
                    if ((v47 + v15 - v6 >= v5 || v18 < v6) && v18 != v16)
                    {
                      v21 = v17;
                      if (v17 == 39 || v17 == 34)
                      {
                        if (v15)
                        {
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v43, 12, 0, v15);
                          v23 = v22 != 0;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", clientDidReplaceRange_changeInLength__openerCharacterSet, 12, 0, v15);
                          v25 = v24 != 0;
                          objc_msgSend(v13, "rangeOfString:options:range:", -[NSSmartQuoteOptions leftSingleQuote](self->_options, "leftSingleQuote"), 12, 0, v15);
                          v46 = v26 != 0;
                          objc_msgSend(v13, "rangeOfString:options:range:", -[NSSmartQuoteOptions leftDoubleQuote](self->_options, "leftDoubleQuote"), 12, 0, v15);
                          v28 = v27 != 0;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v45, 12, 0, v15);
                          v30 = v29 != 0;
                        }
                        else
                        {
                          v25 = 0;
                          v46 = 0;
                          v28 = 0;
                          v30 = 0;
                          v23 = 0;
                        }
                        if (v15 + 1 >= v48)
                        {
                          v33 = 0;
                        }
                        else
                        {
                          v31 = v30;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v45, 8);
                          v30 = v31;
                          v33 = v32 != 0;
                        }
                        v34 = v23 || v25;
                        if (v21 == 34)
                        {
                          options = self->_options;
                          v16 = v44;
                          if ((v34 | v46) == 1)
                            v36 = -[NSSmartQuoteOptions leftDoubleQuote](options, "leftDoubleQuote");
                          else
                            v36 = -[NSSmartQuoteOptions rightDoubleQuote](options, "rightDoubleQuote");
                        }
                        else
                        {
                          v16 = v44;
                          if ((v34 | v28) == 1)
                          {
                            v36 = -[NSSmartQuoteOptions leftSingleQuote](self->_options, "leftSingleQuote");
                          }
                          else
                          {
                            v37 = self->_options;
                            if (v30 && v33)
                              v36 = -[NSSmartQuoteOptions apostrophe](v37, "apostrophe");
                            else
                              v36 = -[NSSmartQuoteOptions rightSingleQuote](v37, "rightSingleQuote");
                          }
                        }
                        v38 = v36;
                        objc_msgSend(v13, "rangeOfString:options:range:", v36, 8, v15, 1);
                        if (!v39)
                        {
                          v40 = [NSQuoteCheckingResult alloc];
                          v41 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](v40, "initWithRange:replacementString:", v47 + v15, 1, v38);
                          objc_msgSend(v42, "addObject:", v41);

                        }
                      }
                    }
                    ++v15;
                  }
                  while (v15 < v48);
                }
                if (objc_msgSend(v42, "count"))
                  -[NSSmartPunctuationClient applySmartPunctuationResults:](self->_client, "applySmartPunctuationResults:", v42);
              }
            }
          }
        }
      }
    }
  }
}

@end
