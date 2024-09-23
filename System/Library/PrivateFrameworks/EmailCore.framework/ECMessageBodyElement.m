@implementation ECMessageBodyElement

- (ECMessageBodyElement)init
{
  ECMessageBodyElement *v2;
  ECMessageBodyElement *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyElement;
  v2 = -[ECMessageBodyElement init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ECMessageBodyElement reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  NSArray *nodes;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ECMessageBodyElement setParser:](self, "setParser:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  nodes = self->_nodes;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(nodes);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v9, "collectDescendanceIntoArray:", v6);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)ECMessageBodyElement;
  -[ECMessageBodyElement dealloc](&v10, sel_dealloc);
}

- (void)reset
{

  self->_validAttributes = 0;
  self->_attributes = 0;
  self->_nodes = 0;
  self->_quoteLevel = 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)getQuoteLevel
{
  return 0;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  NSArray *nodes;

  -[ECMessageBodyElement reset](self, "reset");
  nodes = self->_nodes;
  if (nodes != a3)
  {

    self->_nodes = (NSArray *)a3;
  }
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return 0;
}

- (BOOL)_hasValueForAttributes:(unint64_t)a3
{
  return (a3 & ~self->_validAttributes) == 0;
}

- (void)_setValue:(unint64_t)a3 forAttributes:(unint64_t)a4
{
  unint64_t v4;

  v4 = self->_attributes & ~a4 | a4 & a3;
  self->_validAttributes |= a4;
  self->_attributes = v4;
}

- (unint64_t)valueForAttributes:(unint64_t)a3
{
  id v6;
  void *v7;
  ECMessageBodyElement *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ECMessageBodyElement *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  ECMessageBodyElement *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  ECMessageBodyElement *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  ECMessageBodyElement *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  ECMessageBodyElement *v28;
  uint64_t v29;
  uint64_t v30;

  if ((a3 & 7) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 7))
  {
    v6 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 8, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v6, "appendInnerTextWithConsumableNode:", self);
    v7 = (void *)objc_msgSend(v6, "accumulatedString");
    if (objc_msgSend(v7, "length"))
    {
      if (!objc_msgSend(v7, "ec_isWhitespace"))
      {
        v8 = self;
        v9 = 2;
        v10 = 7;
        goto LABEL_9;
      }
      v8 = self;
      v9 = 6;
    }
    else
    {
      v8 = self;
      v9 = 1;
    }
    v10 = 127;
LABEL_9:
    -[ECMessageBodyElement _setValue:forAttributes:](v8, "_setValue:forAttributes:", v9, v10);

  }
  if ((a3 & 8) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 8))
  {
    v11 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 20, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v11, "appendInnerTextWithConsumableNode:", self);
    if (objc_msgSend((id)objc_msgSend(v11, "accumulatedString"), "ec_isAttribution"))
    {
      v12 = self;
      v13 = 10;
      v14 = 127;
    }
    else
    {
      v12 = self;
      v13 = 0;
      v14 = 8;
    }
    -[ECMessageBodyElement _setValue:forAttributes:](v12, "_setValue:forAttributes:", v13, v14);

  }
  if ((a3 & 0x80) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 128))
  {
    v15 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 20, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v15, "appendInnerTextWithConsumableNode:", self);
    if (objc_msgSend((id)objc_msgSend(v15, "accumulatedString"), "ec_isAttributionPrefix"))
    {
      v16 = self;
      v17 = 130;
      v18 = 131;
    }
    else
    {
      v16 = self;
      v17 = 0;
      v18 = 128;
    }
    -[ECMessageBodyElement _setValue:forAttributes:](v16, "_setValue:forAttributes:", v17, v18);

  }
  if ((a3 & 0x10) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 16))
  {
    v19 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 20, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v19, "appendInnerTextWithConsumableNode:", self);
    if (objc_msgSend((id)objc_msgSend(v19, "accumulatedString"), "ec_isForwardSeparator"))
    {
      v20 = self;
      v21 = 18;
      v22 = 31;
    }
    else
    {
      v20 = self;
      v21 = 0;
      v22 = 16;
    }
    -[ECMessageBodyElement _setValue:forAttributes:](v20, "_setValue:forAttributes:", v21, v22);

  }
  if ((a3 & 0x20) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 32))
  {
    v23 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 20, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v23, "appendInnerTextWithConsumableNode:", self);
    if (objc_msgSend((id)objc_msgSend(v23, "accumulatedString"), "ec_isSignature"))
    {
      v24 = self;
      v25 = 34;
      v26 = 63;
    }
    else
    {
      v24 = self;
      v25 = 0;
      v26 = 32;
    }
    -[ECMessageBodyElement _setValue:forAttributes:](v24, "_setValue:forAttributes:", v25, v26);

  }
  if ((a3 & 0x40) != 0 && !-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", 64))
  {
    v27 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](-[ECMessageBodyElement parser](self, "parser"), "newStringAccumulatorWithOptions:lengthLimit:", 0, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v27, "appendInnerTextWithConsumableNode:", self);
    if (objc_msgSend((id)objc_msgSend(v27, "accumulatedString"), "ec_isHorizontalSeparator"))
    {
      v28 = self;
      v29 = 66;
      v30 = 127;
    }
    else
    {
      v28 = self;
      v29 = 0;
      v30 = 64;
    }
    -[ECMessageBodyElement _setValue:forAttributes:](v28, "_setValue:forAttributes:", v29, v30);

  }
  if (!-[ECMessageBodyElement _hasValueForAttributes:](self, "_hasValueForAttributes:", a3))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECMessageBodyParser.m"), 495, CFSTR("Not all requested attributes have a valid values"));
  return self->_attributes & a3;
}

- (unint64_t)quoteLevel
{
  unint64_t result;
  NSArray *v4;

  result = self->_quoteLevel;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = -[ECMessageBodyElement nodes](self, "nodes");
    result = -[NSArray count](v4, "count");
    if (result)
      result = objc_msgSend(objc_loadWeak((id *)&self->_parser), "quoteLevelForBodyNode:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", 0));
    self->_quoteLevel = result;
  }
  return result;
}

- (id)retainExternally
{
  NSArray *v2;
  NSArray *nodes;
  ECMessageBodyElement *v4;

  ++self->_externalRetainCount;
  v2 = (NSArray *)-[NSArray copy](self->_nodes, "copy");
  nodes = self->_nodes;
  if (v2 == nodes)
  {

    v4 = self;
  }
  else
  {

    v4 = self;
    self->_nodes = v2;
  }
  return v4;
}

- (void)releaseExternally
{
  --self->_externalRetainCount;

}

- (BOOL)isExternallyRetained
{
  return self->_externalRetainCount != 0;
}

- (NSString)description
{
  ECMessageBodyStringAccumulator *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  NSString *v7;

  v3 = -[ECMessageBodyStringAccumulator initWithOptions:lengthLimit:]([ECMessageBodyStringAccumulator alloc], "initWithOptions:lengthLimit:", 0, 81);
  -[ECMessageBodyStringAccumulator appendInnerTextWithConsumableNode:](v3, "appendInnerTextWithConsumableNode:", self);
  v4 = -[ECMessageBodyStringAccumulator accumulatedString](v3, "accumulatedString");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; text=\"%@\">"),
                     NSStringFromClass(v6),
                     self,
                     v4);

  return v7;
}

- (ECMessageBodyParser)parser
{
  return (ECMessageBodyParser *)objc_loadWeak((id *)&self->_parser);
}

- (void)setParser:(id)a3
{
  objc_storeWeak((id *)&self->_parser, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parser);
}

@end
