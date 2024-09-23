@implementation IMXMLReparser

- (BOOL)parseWithContext:(id)a3
{
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSMutableString *output;

  v5 = (void *)MEMORY[0x1A1AE8394](self, a2);
  v6 = objc_msgSend((id)objc_msgSend(a3, "_inContent"), "dataUsingEncoding:", 4);
  self->_context = (IMXMLReparserContext *)a3;
  self->_parser = (NSXMLParser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v6);
  self->_output = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  self->_depth = 0;
  -[NSXMLParser setDelegate:](self->_parser, "setDelegate:", self);
  v7 = -[NSXMLParser parse](self->_parser, "parse");
  if (!v7 || self->_error)
    output = 0;
  else
    output = self->_output;
  -[IMXMLReparserContext _setOutContent:error:](self->_context, "_setOutContent:error:", output);

  self->_output = 0;
  self->_parser = 0;

  self->_context = 0;
  self->_error = 0;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableString appendFormat:](self->_output, "appendFormat:", CFSTR("<%@"), a4, a5, a6, a4);
  if (self->_depth)
  {
    v9 = a7;
  }
  else
  {
    v10 = -[IMXMLReparserContext attributesToPreserve](self->_context, "attributesToPreserve");
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(a7);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (-[NSArray containsObject:](v10, "containsObject:", v15))
            objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a7, "objectForKey:", v15), v15);
        }
        v12 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }
    objc_msgSend(v9, "addEntriesFromDictionary:", -[IMXMLReparserContext attributesToMerge](self->_context, "attributesToMerge"));
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v9);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        v21 = (void *)IMCreateEscapedAttributeValueFromString((void *)objc_msgSend(v9, "objectForKey:", v20));
        -[NSMutableString appendFormat:](self->_output, "appendFormat:", CFSTR(" %@=\"%@\"), v20, v21);

      }
      v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
  -[NSMutableString appendFormat:](self->_output, "appendFormat:", CFSTR(">"));
  ++self->_depth;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  -[NSMutableString appendFormat:](self->_output, "appendFormat:", CFSTR("</%@>"), a4, a5, a6, a4);
  --self->_depth;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;

  v5 = (id)IMCreateEscapedStringFromString(a4, CFSTR(" "), CFSTR(" "), CFSTR("'"), CFSTR("\"));
  -[NSMutableString appendString:](self->_output, "appendString:", v5);

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  NSError *v5;

  if (self->_error != a4)
  {
    v5 = (NSError *)a4;
    self->_error = v5;

  }
  MEMORY[0x1E0DE7D20](self->_parser, sel_abortParsing);
}

@end
