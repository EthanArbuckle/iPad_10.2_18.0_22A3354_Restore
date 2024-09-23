@implementation HKXMLExtractor

void __80___HKXMLExtractor_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _HKXMLExtractorElement *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%@"), v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_HKXMLExtractorElement initWithElementName:attributes:]([_HKXMLExtractorElement alloc], "initWithElementName:attributes:", v8, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 32), "_matchSpecificationWithAttributes:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    objc_msgSend(*(id *)(a1 + 32), "parser:foundCharacters:", *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeLastObject");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = 0;

  }
}

@end
