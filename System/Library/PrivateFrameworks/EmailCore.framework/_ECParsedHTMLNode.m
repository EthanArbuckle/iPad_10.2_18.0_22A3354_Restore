@implementation _ECParsedHTMLNode

- (_ECParsedHTMLNode)init
{
  _ECParsedHTMLNode *v2;
  _ECParsedHTMLNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ECParsedHTMLNode;
  v2 = -[_ECParsedHTMLNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_ECParsedHTMLNode setStartLocation:](v2, "setStartLocation:", 0x7FFFFFFFFFFFFFFFLL);
    -[_ECParsedHTMLNode setEndLocation:](v3, "setEndLocation:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_ECParsedHTMLNode setParentNode:](self, "setParentNode:", 0);
  -[_ECParsedHTMLNode setNextSibling:](self, "setNextSibling:", 0);
  -[_ECParsedHTMLNode setHtmlString:](self, "setHtmlString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_ECParsedHTMLNode;
  -[_ECParsedHTMLNode dealloc](&v3, sel_dealloc);
}

- (void)appendChild:(id)a3
{
  NSMutableArray *childNodes;
  NSMutableArray *v6;

  childNodes = self->_childNodes;
  if (childNodes)
  {
    objc_msgSend((id)-[NSMutableArray lastObject](childNodes, "lastObject"), "setNextSibling:", a3);
    v6 = self->_childNodes;
  }
  else
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_childNodes = v6;
  }
  -[NSMutableArray addObject:](v6, "addObject:", a3);
  objc_msgSend(a3, "setParentNode:", self);
}

- (BOOL)hasChildNodes
{
  return -[NSMutableArray count](self->_childNodes, "count") != 0;
}

- (_ECParsedHTMLNode)firstChild
{
  return (_ECParsedHTMLNode *)-[NSMutableArray firstObject](self->_childNodes, "firstObject");
}

- (_ECParsedHTMLNode)lastChild
{
  return (_ECParsedHTMLNode *)-[NSMutableArray lastObject](self->_childNodes, "lastObject");
}

- (NSString)tagName
{
  return 0;
}

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return (id)-[NSMutableArray copy](self->_childNodes, "copy", a3);
}

- (id)copyMutableConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return (id)-[NSMutableArray mutableCopy](self->_childNodes, "mutableCopy", a3);
}

- (void)collectDescendanceIntoArray:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)-[NSMutableArray mutableCopy](self->_childNodes, "mutableCopy");
  v6 = v4;
  while (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v6, "firstObject");
    objc_msgSend(a3, "addObject:", v5);
    objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(v5 + 8));
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    v4 = v6;
  }

}

- (void)addRecursiveDescriptionWithLevel:(unint64_t)a3 toString:(id)a4
{
  unint64_t v7;
  NSMutableArray *childNodes;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    do
    {
      objc_msgSend(a4, "appendString:", CFSTR("| "));
      --v7;
    }
    while (v7);
  }
  objc_msgSend(a4, "appendFormat:", CFSTR("%@\n"), -[_ECParsedHTMLNode description](self, "description"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  childNodes = self->_childNodes;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    v12 = a3 + 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(childNodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "addRecursiveDescriptionWithLevel:toString:", v12, a4);
      }
      while (v10 != v13);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
}

- (id)recursiveDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[_ECParsedHTMLNode addRecursiveDescriptionWithLevel:toString:](self, "addRecursiveDescriptionWithLevel:toString:", 0, v3);
  return v3;
}

- (_ECParsedHTMLNode)parentNode
{
  return (_ECParsedHTMLNode *)objc_loadWeak((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (_ECParsedHTMLNode)nextSibling
{
  return (_ECParsedHTMLNode *)objc_loadWeak((id *)&self->_nextSibling);
}

- (void)setNextSibling:(id)a3
{
  objc_storeWeak((id *)&self->_nextSibling, a3);
}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (unint64_t)endLocation
{
  return self->_endLocation;
}

- (void)setEndLocation:(unint64_t)a3
{
  self->_endLocation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextSibling);
  objc_destroyWeak((id *)&self->_parentNode);
}

@end
