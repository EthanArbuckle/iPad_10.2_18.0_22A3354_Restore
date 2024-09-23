@implementation _NSAttributedStringFromMarkdownCreatorConcrete

- (void)appendString:(id)a3 with:(id)a4
{
  NSAttributedString *v5;

  v5 = -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", a3, a4);
  -[NSMutableAttributedString appendAttributedString:](self->_result, "appendAttributedString:", v5);

}

- (void)finalizeWithLanguageIdentifier:(id)a3
{
  NSMutableAttributedString *result;
  uint64_t v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    result = self->_result;
    v6 = -[NSAttributedString length](result, "length");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81___NSAttributedStringFromMarkdownCreatorConcrete_finalizeWithLanguageIdentifier___block_invoke;
    v7[3] = &unk_1E0F51458;
    v7[4] = self;
    v7[5] = a3;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](result, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSLanguage"), 0, v6, 0x100000, v7);
  }
}

- (id)result
{
  return self->_result;
}

- (_NSAttributedStringFromMarkdownCreatorConcrete)init
{
  _NSAttributedStringFromMarkdownCreatorConcrete *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSAttributedStringFromMarkdownCreatorConcrete;
  v2 = -[_NSAttributedStringFromMarkdownCreatorConcrete init](&v4, sel_init);
  if (v2)
    v2->_result = objc_alloc_init(NSMutableAttributedString);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringFromMarkdownCreatorConcrete;
  -[_NSAttributedStringFromMarkdownCreatorConcrete dealloc](&v3, sel_dealloc);
}

- (unsigned)lastCharacter
{
  NSUInteger v3;

  v3 = -[NSAttributedString length](self->_result, "length");
  if (v3)
    LOWORD(v3) = -[NSString characterAtIndex:](-[NSAttributedString string](self->_result, "string"), "characterAtIndex:", -[NSAttributedString length](self->_result, "length") - 1);
  return v3;
}

- (void)appendString:(id)a3
{
  -[NSMutableString appendString:](-[NSMutableAttributedString mutableString](self->_result, "mutableString"), "appendString:", a3);
}

- (id)parseExtendedAttributesFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id result;
  void *v9;
  const __CFString **v10;
  const __CFString **v11;
  NSError *v12;
  uint64_t v13;
  _QWORD v14[5];
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 24, &v13);
  if (v5)
  {
    v6 = v5;
    if (_NSIsNSDictionary())
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __attributesFromKnownAttributeKeys_block_invoke;
      v14[3] = &unk_1E0F51480;
      v14[4] = v7;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
      return v7;
    }
    if (a4)
    {
      v15 = CFSTR("NSDebugDescription");
      v16 = CFSTR("JSON result was not a dictionary");
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v16;
      v11 = &v15;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v17 = CFSTR("NSUnderlyingError");
    v18[0] = v13;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (const __CFString **)v18;
    v11 = &v17;
LABEL_8:
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1));
    result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

@end
