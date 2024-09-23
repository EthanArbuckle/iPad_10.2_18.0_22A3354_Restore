@implementation _HKXMLExtractor

- (_HKXMLExtractor)init
{
  _HKXMLExtractor *v2;
  NSMutableArray *v3;
  NSMutableArray *allTagSpecifications;
  NSMutableArray *v5;
  NSMutableArray *stackOfElements;
  NSString *matchedTagSpecification;
  NSMutableDictionary *v8;
  NSMutableDictionary *resultTagContent;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_HKXMLExtractor;
  v2 = -[_HKXMLExtractor init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allTagSpecifications = v2->_allTagSpecifications;
    v2->_allTagSpecifications = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackOfElements = v2->_stackOfElements;
    v2->_stackOfElements = v5;

    matchedTagSpecification = v2->_matchedTagSpecification;
    v2->_matchedTagSpecification = 0;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultTagContent = v2->_resultTagContent;
    v2->_resultTagContent = v8;

  }
  return v2;
}

- (void)addTagSpecificationForExtraction:(id)a3
{
  id v4;
  _HKXMLExtractorSpecification *v5;

  v4 = a3;
  v5 = -[_HKXMLExtractorSpecification initWithSpecificationString:]([_HKXMLExtractorSpecification alloc], "initWithSpecificationString:", v4);

  -[NSMutableArray addObject:](self->_allTagSpecifications, "addObject:", v5);
}

- (void)parseWithData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3B28];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithData:", v5);

  -[_HKXMLExtractor _parseWithXMLParser:](self, "_parseWithXMLParser:", v6);
}

- (void)parseWithStream:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3B28];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithStream:", v5);

  -[_HKXMLExtractor _parseWithXMLParser:](self, "_parseWithXMLParser:", v6);
}

- (id)getDataForTagSpecification:(id)a3
{
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_resultTagContent, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (void)_parseWithXMLParser:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setShouldProcessNamespaces:", 1);
  objc_msgSend(v4, "setDelegate:", self);
  -[_HKXMLExtractor _resetScanningState](self, "_resetScanningState");
  objc_msgSend(v4, "parse");

}

- (void)_resetScanningState
{
  NSString *matchedTagSpecification;

  -[NSMutableArray removeAllObjects](self->_stackOfElements, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_resultTagContent, "removeAllObjects");
  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;

}

- (id)_matchSpecificationWithAttributes:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_allTagSpecifications;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchesElementStack:", self->_stackOfElements, (_QWORD)v12))
        {
          objc_msgSend(v9, "specificationString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  NSString *matchedTagSpecification;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  NSString *v16;
  _HKXMLExtractorElement *v17;
  _QWORD v18[5];
  id v19;

  v10 = a3;
  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;
  v12 = a7;
  v13 = a4;

  v17 = -[_HKXMLExtractorElement initWithElementName:attributes:]([_HKXMLExtractorElement alloc], "initWithElementName:attributes:", v13, v12);
  -[NSMutableArray addObject:](self->_stackOfElements, "addObject:", v17);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80___HKXMLExtractor_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
  v18[3] = &unk_1E37F53B0;
  v18[4] = self;
  v19 = v10;
  v14 = v10;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);
  -[_HKXMLExtractor _matchSpecificationWithAttributes:](self, "_matchSpecificationWithAttributes:", v12);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  v16 = self->_matchedTagSpecification;
  self->_matchedTagSpecification = v15;

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  NSString *matchedTagSpecification;

  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;

  -[NSMutableArray removeLastObject](self->_stackOfElements, "removeLastObject");
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (v5 && self->_matchedTagSpecification)
  {
    v7 = v5;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_resultTagContent, "objectForKeyedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_resultTagContent, "setObject:forKey:", v6, self->_matchedTagSpecification);
    }
    objc_msgSend(v6, "addObject:", v7);

    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagContent, 0);
  objc_storeStrong((id *)&self->_matchedTagSpecification, 0);
  objc_storeStrong((id *)&self->_stackOfElements, 0);
  objc_storeStrong((id *)&self->_allTagSpecifications, 0);
}

@end
