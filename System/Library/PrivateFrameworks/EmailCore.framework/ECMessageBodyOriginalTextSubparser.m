@implementation ECMessageBodyOriginalTextSubparser

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->_lastTextElements, "makeObjectsPerformSelector:", sel_releaseExternally);

  -[ECMessageBodyElement_Private releaseExternally](self->_lastNonWhitespaceTextElement, "releaseExternally");
  v3.receiver = self;
  v3.super_class = (Class)ECMessageBodyOriginalTextSubparser;
  -[ECMessageBodyOriginalTextSubparser dealloc](&v3, sel_dealloc);
}

- (void)setFoundTextBlock:(id)a3
{
  self->_foundTextBlock = (id)objc_msgSend(a3, "copy");
}

- (void)setFoundWhitespaceBlock:(id)a3
{
  self->_foundWhitespaceBlock = (id)objc_msgSend(a3, "copy");
}

- (void)_consumeTextElement:(id)a3 isAttribution:(BOOL)a4
{
  void (**foundWhitespaceBlock)(id, id);
  BOOL v8;

  if (objc_msgSend(a3, "valueForAttributes:", 4))
  {
    foundWhitespaceBlock = (void (**)(id, id))self->_foundWhitespaceBlock;
    if (foundWhitespaceBlock)
      foundWhitespaceBlock[2](foundWhitespaceBlock, a3);
  }
  else
  {
    if (self->_foundTextBlock)
    {
      if (objc_msgSend(a3, "quoteLevel"))
        v8 = 1;
      else
        v8 = a4;
      if ((self->_foundForwardSeparator || !v8) && !self->_foundText)
        objc_msgSend(a3, "valueForAttributes:", 32);
      (*((void (**)(void))self->_foundTextBlock + 2))();
    }
    self->_foundText = 1;
  }
}

- (void)_consumeAnyLastTextElementAsAttribution:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *lastTextElements;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  lastTextElements = self->_lastTextElements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lastTextElements, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(lastTextElements);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[ECMessageBodyOriginalTextSubparser _consumeTextElement:isAttribution:](self, "_consumeTextElement:isAttribution:", v10, v3);
        objc_msgSend(v10, "releaseExternally");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lastTextElements, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[NSMutableArray removeAllObjects](self->_lastTextElements, "removeAllObjects");
  -[ECMessageBodyElement_Private releaseExternally](self->_lastNonWhitespaceTextElement, "releaseExternally");
  self->_lastNonWhitespaceTextElement = 0;
}

- (void)messageBodyParser:(id)a3 foundMessageBodyElement:(id)a4
{
  unint64_t v6;
  uint64_t v7;

  if (self->_lastNonWhitespaceTextElement)
  {
    v6 = objc_msgSend(a4, "quoteLevel", a3);
    if (v6 > -[ECMessageBodyElement_Private quoteLevel](self->_lastNonWhitespaceTextElement, "quoteLevel"))
    {
      v7 = -[ECMessageBodyElement_Private valueForAttributes:](self->_lastNonWhitespaceTextElement, "valueForAttributes:", 8);
      if (!v7
        && !-[ECMessageBodyElement_Private quoteLevel](self->_lastNonWhitespaceTextElement, "quoteLevel")
        && -[ECMessageBodyElement_Private valueForAttributes:](self->_lastNonWhitespaceTextElement, "valueForAttributes:", 16))
      {
        self->_foundForwardSeparator = 1;
      }
      -[ECMessageBodyOriginalTextSubparser _consumeAnyLastTextElementAsAttribution:](self, "_consumeAnyLastTextElementAsAttribution:", v7 != 0);
    }
  }
  if (self->_foundForwardSeparator)
  {
    -[ECMessageBodyOriginalTextSubparser _consumeTextElement:isAttribution:](self, "_consumeTextElement:isAttribution:", a4, 0);
  }
  else if (objc_msgSend(a4, "valueForAttributes:", 2))
  {
    if (!objc_msgSend(a4, "valueForAttributes:", 4))
    {
      -[ECMessageBodyOriginalTextSubparser _consumeAnyLastTextElementAsAttribution:](self, "_consumeAnyLastTextElementAsAttribution:", 0);
      self->_lastNonWhitespaceTextElement = (ECMessageBodyElement_Private *)objc_msgSend(a4, "retainExternally");
    }
    if (!self->_lastTextElements)
      self->_lastTextElements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a4, "retainExternally");
    -[NSMutableArray addObject:](self->_lastTextElements, "addObject:", a4);
  }
}

- (void)messageBodyParserDidFinishParsing:(id)a3
{
  -[ECMessageBodyOriginalTextSubparser _consumeAnyLastTextElementAsAttribution:](self, "_consumeAnyLastTextElementAsAttribution:", 0);
}

@end
