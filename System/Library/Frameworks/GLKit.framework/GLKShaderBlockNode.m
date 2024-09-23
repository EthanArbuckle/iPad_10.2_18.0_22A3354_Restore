@implementation GLKShaderBlockNode

- (GLKShaderBlockNode)init
{
  GLKShaderBlockNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKShaderBlockNode;
  result = -[GLKShaderBlockNode init](&v3, sel_init);
  if (result)
  {
    result->_blockText = 0;
    result->_mask = 0u;
    *(_OWORD *)&result->_parent = 0u;
    *(_OWORD *)&result->_children = 0u;
    result->_loopVar = 0;
    result->_index = 0;
    result->_indexedMask = 1;
    result->_propertyClass = 21;
    *(_QWORD *)&result->_type = 0x100000000;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GLKShaderBlockNode *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_alloc_init(GLKShaderBlockNode);
  v6 = -[GLKShaderBlockNode mask](self, "mask");
  -[GLKShaderBlockNode setMask:](v5, "setMask:", v6, v7);
  -[GLKShaderBlockNode setUnrollCt:](v5, "setUnrollCt:", -[GLKShaderBlockNode unrollCt](self, "unrollCt"));
  -[GLKShaderBlockNode setPropertyClass:](v5, "setPropertyClass:", -[GLKShaderBlockNode propertyClass](self, "propertyClass"));
  -[GLKShaderBlockNode setType:](v5, "setType:", -[GLKShaderBlockNode type](self, "type"));
  -[GLKShaderBlockNode setIndex:](v5, "setIndex:", -[GLKShaderBlockNode index](self, "index"));
  -[GLKShaderBlockNode setIndexedMask:](v5, "setIndexedMask:", -[GLKShaderBlockNode indexedMask](self, "indexedMask"));
  if (-[GLKShaderBlockNode blockText](self, "blockText"))
    -[GLKShaderBlockNode setBlockText:](v5, "setBlockText:", (id)-[NSMutableString mutableCopyWithZone:](-[GLKShaderBlockNode blockText](self, "blockText"), "mutableCopyWithZone:", a3));
  -[GLKShaderBlockNode setLoopVar:](v5, "setLoopVar:", -[GLKShaderBlockNode loopVar](self, "loopVar"));
  -[GLKShaderBlockNode setLabel:](v5, "setLabel:", -[GLKShaderBlockNode label](self, "label"));
  return v5;
}

+ (id)copyTreeWithRoot:(id)a3 parent:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  objc_msgSend(v6, "setParent:", a4);
  if (objc_msgSend(a3, "children"))
    objc_msgSend(v6, "setChildren:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "children"), v6));
  if (objc_msgSend(a3, "next"))
    objc_msgSend(v6, "setNext:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "next"), a4));
  return v6;
}

+ (id)copyTreeWithRootButNotSiblings:(id)a3 parent:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  objc_msgSend(v6, "setParent:", a4);
  if (objc_msgSend(a3, "children"))
    objc_msgSend(v6, "setChildren:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "children"), v6));
  return v6;
}

+ (GLKBigInt_s)maskForLabel:(id)a3 root:(id)a4 index:(int)a5
{
  uint64_t v5;
  unint64_t v8;
  unint64_t v9;
  GLKBigInt_s result;

  v5 = *(_QWORD *)&a5;
  if (objc_msgSend(a4, "index") != a5
    || !objc_msgSend((id)objc_msgSend(a4, "label"), "isEqualToString:", a3))
  {
    if (!objc_msgSend(a4, "children"))
      goto LABEL_9;
    v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", a3, objc_msgSend(a4, "children"), v5);
    if (v8)
      goto LABEL_12;
    if (!v9)
    {
LABEL_9:
      if (!objc_msgSend(a4, "next"))
        goto LABEL_11;
      v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", a3, objc_msgSend(a4, "next"), v5);
      if (v8)
        goto LABEL_12;
      if (!v9)
      {
LABEL_11:
        v8 = 0;
        v9 = 0;
        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  v8 = objc_msgSend(a4, "mask");
LABEL_12:
  result.n1 = v9;
  result.n0 = v8;
  return result;
}

+ (void)setMasksWithRoot:(id)a3 treeRoot:(id)a4 mask:(GLKBigInt_s *)a5
{
  uint64_t v8;
  uint64_t v9;

  v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", objc_msgSend(a3, "label"), a4, objc_msgSend(a3, "index"));
  if (v8 | v9)
  {
    objc_msgSend(a3, "setMask:", v8, v9);
  }
  else
  {
    objc_msgSend(a3, "setMask:", a5->n0, a5->n1);
    *(_OWORD *)a5 *= 2;
  }
  if (objc_msgSend(a3, "children"))
    +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", objc_msgSend(a3, "children"), a4, a5);
  if (objc_msgSend(a3, "next"))
    +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", objc_msgSend(a3, "next"), a4, a5);
}

+ (void)buildUnrollNodeArray:(id)a3 array:(id)a4
{
  if ((int)objc_msgSend(a3, "unrollCt") >= 2)
    objc_msgSend(a4, "addObject:", a3);
  if (objc_msgSend(a3, "children"))
    +[GLKShaderBlockNode buildUnrollNodeArray:array:](GLKShaderBlockNode, "buildUnrollNodeArray:array:", objc_msgSend(a3, "children"), a4);
  if (objc_msgSend(a3, "next"))
    +[GLKShaderBlockNode buildUnrollNodeArray:array:](GLKShaderBlockNode, "buildUnrollNodeArray:array:", objc_msgSend(a3, "next"), a4);
}

+ (void)insertNode:(id)a3 afterSibling:(id)a4
{
  objc_msgSend(a3, "setNext:", objc_msgSend(a4, "next"));
  objc_msgSend(a4, "setNext:", a3);
}

+ (unsigned)nodeCt:(id)a3 nodeCt:(unsigned int *)a4
{
  ++*a4;
  if (objc_msgSend(a3, "children"))
    +[GLKShaderBlockNode nodeCt:nodeCt:](GLKShaderBlockNode, "nodeCt:nodeCt:", objc_msgSend(a3, "children"), a4);
  if (objc_msgSend(a3, "next"))
    +[GLKShaderBlockNode nodeCt:nodeCt:](GLKShaderBlockNode, "nodeCt:nodeCt:", objc_msgSend(a3, "next"), a4);
  return *a4;
}

+ (void)setIndicesForRoot:(id)a3 andReplaceLoopVar:(id)a4 baseLabel:(id)a5 basePropertyClass:(int)a6 usingIndex:(unsigned int)a7 indexString:(id)a8
{
  uint64_t v9;
  uint64_t v10;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  if (objc_msgSend(a3, "indexedMask"))
  {
    objc_msgSend(a3, "setIndex:", v9);
    if (objc_msgSend(a3, "propertyClass") == (_DWORD)v10)
      objc_msgSend(a3, "setPropertyClass:", (v9 + v10));
  }
  else
  {
    objc_msgSend(a3, "setIndex:", 0);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", a5))
  {
    objc_msgSend(a3, "setLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), objc_msgSend(a3, "label"), v9));
    objc_msgSend(a3, "setType:", 1);
  }
  if (objc_msgSend(a3, "blockText"))
    objc_msgSend((id)objc_msgSend(a3, "blockText"), "replaceOccurrencesOfString:withString:options:range:", a4, a8, 0, 0, objc_msgSend((id)objc_msgSend(a3, "blockText"), "length"));
  if (objc_msgSend(a3, "children"))
    +[GLKShaderBlockNode setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:](GLKShaderBlockNode, "setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:", objc_msgSend(a3, "children"), a4, a5, v10, v9, a8);
  if (objc_msgSend(a3, "next"))
    +[GLKShaderBlockNode setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:](GLKShaderBlockNode, "setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:", objc_msgSend(a3, "next"), a4, a5, v10, v9, a8);
}

+ (void)printTree:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (a3)
  {
    v5 = a3;
    do
    {
      v5 = (id)objc_msgSend(v5, "parent");
      objc_msgSend(v4, "appendString:", CFSTR("\t"));
    }
    while (v5);
  }
  NSLog(CFSTR("%p: %@%@ class: %d  index: %d"), a3, v4, objc_msgSend(a3, "label"), objc_msgSend(a3, "propertyClass"), objc_msgSend(a3, "index"));
  v6 = objc_msgSend(a3, "children");
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      +[GLKShaderBlockNode printTree:](GLKShaderBlockNode, "printTree:", v7);
      v7 = (void *)objc_msgSend(v7, "next");
    }
    while (v7);
  }
}

+ (void)printTreeVerbose:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (a3)
  {
    v5 = a3;
    do
    {
      v5 = (id)objc_msgSend(v5, "parent");
      objc_msgSend(v4, "appendString:", CFSTR("\t"));
    }
    while (v5);
  }
  NSLog(CFSTR("%p: %@%@ class: %d  index: %d\n%@"), a3, v4, objc_msgSend(a3, "label"), objc_msgSend(a3, "propertyClass"), objc_msgSend(a3, "index"), objc_msgSend(a3, "blockText"));
  v6 = objc_msgSend(a3, "children");
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      +[GLKShaderBlockNode printTreeVerbose:](GLKShaderBlockNode, "printTreeVerbose:", v7);
      v7 = (void *)objc_msgSend(v7, "next");
    }
    while (v7);
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  GLKShaderBlockNode *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  GLKShaderBlockNode *children;
  GLKShaderBlockNode *i;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("codeblock")))
  {
    v11 = objc_alloc_init(GLKShaderBlockNode);
    v12 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("indexedMask"));
    if (v12 && objc_msgSend(v12, "isEqualToString:", CFSTR("no")))
      -[GLKShaderBlockNode setIndexedMask:](v11, "setIndexedMask:", 0);
    -[GLKShaderBlockNode setLabel:](v11, "setLabel:", objc_msgSend(a7, "valueForKey:", CFSTR("label")));
    v13 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("type"));
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("std")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("cond")) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("loop")))
        goto LABEL_15;
      v14 = 2;
    }
    -[GLKShaderBlockNode setType:](v11, "setType:", v14);
LABEL_15:
    v15 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("unrollCt"));
    if (v15)
      -[GLKShaderBlockNode setUnrollCt:](v11, "setUnrollCt:", objc_msgSend(v15, "intValue"));
    v16 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("class"));
    -[GLKShaderBlockNode setLoopVar:](v11, "setLoopVar:", objc_msgSend(a7, "valueForKey:", CFSTR("loopVar")));
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("STATIC_BLOCK")) & 1) != 0)
    {
      v17 = 21;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("EFFECT")) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("LIGHT")) & 1) != 0)
    {
      v17 = 2;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MATERIAL")) & 1) != 0)
    {
      v17 = 10;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TEXTURE")) & 1) != 0)
    {
      v17 = 11;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FOG")) & 1) != 0)
    {
      v17 = 19;
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("CONSTANT_COLOR")))
      {
LABEL_32:
        -[GLKShaderBlockNode setParent:](v11, "setParent:", self);
        children = self->_children;
        if (children)
        {
          for (i = self->_children; -[GLKShaderBlockNode next](i, "next"); children = i)
            i = -[GLKShaderBlockNode next](children, "next");
          -[GLKShaderBlockNode setNext:](children, "setNext:", v11);
        }
        else
        {
          -[GLKShaderBlockNode setChildren:](self, "setChildren:", v11);
        }
        objc_msgSend(a3, "setDelegate:", v11);
        return;
      }
      v17 = 20;
    }
    -[GLKShaderBlockNode setPropertyClass:](v11, "setPropertyClass:", v17);
    goto LABEL_32;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("codeblocks")))
  {
    -[GLKShaderBlockNode setLabel:](self, "setLabel:", objc_msgSend(a7, "valueForKey:", CFSTR("label")));
    self->_type = 0;
    self->_propertyClass = 21;
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  _BYTE *v6;
  char v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  GLKShaderBlockNode *v11;
  GLKShaderBlockNode *children;
  GLKShaderBlockNode *i;

  v6 = (_BYTE *)objc_msgSend(a4, "UTF8String", a3);
  v7 = *v6;
  if (*v6)
  {
    v8 = v6 + 1;
    v9 = MEMORY[0x24BDAC740];
    do
    {
      if (v7 < 0)
      {
        if (!__maskrune(v7, 0x4000uLL))
        {
LABEL_9:
          v11 = objc_alloc_init(GLKShaderBlockNode);
          -[GLKShaderBlockNode setLabel:](v11, "setLabel:", -[GLKShaderBlockNode label](self, "label"));
          -[GLKShaderBlockNode setParent:](v11, "setParent:", self);
          -[GLKShaderBlockNode setBlockText:](v11, "setBlockText:", objc_alloc_init(MEMORY[0x24BDD16A8]));
          -[NSMutableString appendString:](-[GLKShaderBlockNode blockText](v11, "blockText"), "appendString:", a4);
          children = self->_children;
          if (children)
          {
            for (i = self->_children; -[GLKShaderBlockNode next](i, "next"); children = i)
              i = -[GLKShaderBlockNode next](children, "next");
            -[GLKShaderBlockNode setNext:](children, "setNext:", v11);
          }
          else
          {
            -[GLKShaderBlockNode setChildren:](self, "setChildren:", v11);
          }
          return;
        }
      }
      else if ((*(_DWORD *)(v9 + 4 * v7 + 60) & 0x4000) == 0)
      {
        goto LABEL_9;
      }
      v10 = *v8++;
      v7 = v10;
    }
    while (v10);
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  objc_msgSend(a3, "setDelegate:", self->_parent, a4, a5, a6);
}

- (NSString)description
{
  const __CFString *loopVar;

  if (self->_loopVar)
    loopVar = (const __CFString *)self->_loopVar;
  else
    loopVar = CFSTR("nil");
  return (NSString *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("label:\t\t%@\ntype:\t\t%d\nclass:\t\t%d\nloopVar:\t\t%@\nchildren:\t%p\nparent:\t\t%p\nnext:\t\t%p\nmask:\t\t%@\nunrollCt:\t%d\nindex:\t\t%d\nblockText:\t%p"), self->_label, self->_type, self->_propertyClass, loopVar, self->_children, self->_parent, self->_next, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llX%016llx"), self->_mask.n1, self->_mask.n0), self->_unrollCt, self->_index, self->_blockText);
}

- (void)dealloc
{
  GLKShaderBlockNode *children;
  uint64_t v4;
  objc_super v5;

  children = self->_children;
  if (children)
  {
    do
    {
      v4 = -[GLKShaderBlockNode next](children, "next");

      children = (GLKShaderBlockNode *)v4;
    }
    while (v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)GLKShaderBlockNode;
  -[GLKShaderBlockNode dealloc](&v5, sel_dealloc);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)loopVar
{
  return self->_loopVar;
}

- (void)setLoopVar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (GLKShaderBlockNode)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  self->_parent = (GLKShaderBlockNode *)a3;
}

- (GLKShaderBlockNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  self->_next = (GLKShaderBlockNode *)a3;
}

- (GLKShaderBlockNode)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  self->_children = (GLKShaderBlockNode *)a3;
}

- (GLKBigInt_s)mask
{
  unint64_t n1;
  unint64_t n0;
  GLKBigInt_s result;

  n1 = self->_mask.n1;
  n0 = self->_mask.n0;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

- (void)setMask:(GLKBigInt_s)a3
{
  self->_mask = a3;
}

- (int)unrollCt
{
  return self->_unrollCt;
}

- (void)setUnrollCt:(int)a3
{
  self->_unrollCt = a3;
}

- (NSMutableString)blockText
{
  return self->_blockText;
}

- (void)setBlockText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int)propertyClass
{
  return self->_propertyClass;
}

- (void)setPropertyClass:(int)a3
{
  self->_propertyClass = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (BOOL)indexedMask
{
  return self->_indexedMask;
}

- (void)setIndexedMask:(BOOL)a3
{
  self->_indexedMask = a3;
}

@end
