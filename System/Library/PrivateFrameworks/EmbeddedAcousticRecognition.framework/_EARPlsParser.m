@implementation _EARPlsParser

- (_EARPlsParser)initWithData:(id)a3
{
  id v4;
  _EARPlsParser *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *lexemes;
  _EARPlsParser *v8;
  NSXMLParser *parser;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARPlsParser;
  v5 = -[_EARPlsParser init](&v11, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  lexemes = v5->_lexemes;
  v5->_lexemes = v6;

  v8 = (_EARPlsParser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v4);
  parser = v5->_parser;
  v5->_parser = (NSXMLParser *)v8;

  if (v8)
  {
    -[NSXMLParser setDelegate:](v5->_parser, "setDelegate:", v5);
    -[NSXMLParser parse](v5->_parser, "parse");
LABEL_4:
    v8 = v5;
  }

  return v8;
}

- (_EARPlsParser)initWithFilePath:(id)a3
{
  id v4;
  _EARPlsParser *v5;
  void *v6;
  _EARPlsParser *v7;
  void *v8;
  EARLogger *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_EARPlsParser;
  v5 = -[_EARPlsParser init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_EARPlsParser initWithData:](v5, "initWithData:", v6);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (EARLogger *)objc_msgSend(v8, "fileExistsAtPath:", v4);
      if ((_DWORD)v9)
      {
        EARLogger::QuasarOSLogger(v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_EARPlsParser initWithFilePath:].cold.1((uint64_t)v4, v10);

        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  NSMutableString *v8;
  NSMutableString *elementValue;
  NSMutableSet *v10;
  NSMutableSet *currentPhonemes;
  id v12;

  v12 = a4;
  v8 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  elementValue = self->_elementValue;
  self->_elementValue = v8;

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("lexeme")))
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    currentPhonemes = self->_currentPhonemes;
    self->_currentPhonemes = v10;

  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  NSMutableDictionary *lexemes;
  void *currentGrapheme;
  void *v9;
  NSString *v10;
  NSMutableSet *currentPhonemes;
  id v12;

  v12 = a4;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("lexeme")))
  {
    lexemes = self->_lexemes;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_currentPhonemes);
    currentGrapheme = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)-[NSString copy](self->_currentGrapheme, "copy");
    -[NSMutableDictionary setObject:forKey:](lexemes, "setObject:forKey:", currentGrapheme, v9);

LABEL_7:
    goto LABEL_8;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("grapheme")))
  {
    v10 = (NSString *)-[NSMutableString copy](self->_elementValue, "copy");
    currentGrapheme = self->_currentGrapheme;
    self->_currentGrapheme = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("phoneme")))
  {
    currentPhonemes = self->_currentPhonemes;
    currentGrapheme = (void *)-[NSMutableString copy](self->_elementValue, "copy");
    -[NSMutableSet addObject:](currentPhonemes, "addObject:", currentGrapheme);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  NSMutableString *elementValue;
  id v6;

  v6 = a4;
  elementValue = self->_elementValue;
  if (elementValue)
    -[NSMutableString appendString:](elementValue, "appendString:", v6);

}

- (NSMutableDictionary)lexemes
{
  return self->_lexemes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexemes, 0);
  objc_storeStrong((id *)&self->_elementValue, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_currentPhonemes, 0);
  objc_storeStrong((id *)&self->_currentGrapheme, 0);
}

- (void)initWithFilePath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize XML parser for custom prons file at %@", (uint8_t *)&v2, 0xCu);
}

@end
