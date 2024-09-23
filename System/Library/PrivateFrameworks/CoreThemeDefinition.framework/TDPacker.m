@implementation TDPacker

- (void)dealloc
{
  objc_super v3;

  -[TDPacker setRoot:](self, "setRoot:", 0);
  -[TDPacker setPackedObjects:](self, "setPackedObjects:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TDPacker;
  -[TDPacker dealloc](&v3, sel_dealloc);
}

- (void)setSizeHandler:(id)a3
{
  id sizeHandler;

  sizeHandler = self->_sizeHandler;
  if (sizeHandler != a3)
  {

    self->_sizeHandler = (id)objc_msgSend(a3, "copy");
  }
}

- (id)sizeHandler
{
  return self->_sizeHandler;
}

- (void)setObjectsToPack:(id)a3
{
  NSArray *objectsToPack;

  objectsToPack = self->_objectsToPack;
  if (objectsToPack != a3)
  {

    self->_objectsToPack = (NSArray *)a3;
    -[TDPacker setPackedObjects:](self, "setPackedObjects:", 0);
    -[TDPacker setRoot:](self, "setRoot:", 0);
  }
}

- (NSArray)objectsToPack
{
  return self->_objectsToPack;
}

- (void)pack
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _TDPackerNode *v17;

  v3 = -[TDPacker objectsToPack](self, "objectsToPack");
  v4 = -[NSArray count](v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
    v17 = objc_alloc_init(_TDPackerNode);
    (*((void (**)(id, id))self->_sizeHandler + 2))(self->_sizeHandler, -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0));
    -[_TDPackerNode setSize:](v17, "setSize:");
    -[TDPacker setRoot:](self, "setRoot:", v17);
    v7 = 0;
    v8 = (void *)*MEMORY[0x24BDBD430];
    do
    {
      v9 = (*((double (**)(id, id))self->_sizeHandler + 2))(self->_sizeHandler, -[NSArray objectAtIndex:](v3, "objectAtIndex:", v7));
      v11 = v10;
      v12 = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", -[TDPacker root](self, "root"), v9, v10);
      if (v12)
        v13 = -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", v12, v9, v11);
      else
        v13 = -[TDPacker _growNodeToSize:](self, "_growNodeToSize:", v9, v11);
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "setFit:", 1);
        objc_msgSend(v14, "setSize:", v9, v11);
        objc_msgSend(v14, "setNode:", -[NSArray objectAtIndex:](v3, "objectAtIndex:", v7));
        v15 = v6;
        v16 = v14;
      }
      else
      {
        v15 = v6;
        v16 = v8;
      }
      objc_msgSend(v15, "addObject:", v16);
      ++v7;
    }
    while (v5 != v7);
    -[TDPacker setPackedObjects:](self, "setPackedObjects:", v6);

  }
  else
  {
    -[TDPacker setRoot:](self, "setRoot:", 0);
    -[TDPacker setPackedObjects:](self, "setPackedObjects:", 0);
  }
}

- (CGSize)enclosingSize
{
  double v2;
  double v3;
  CGSize result;

  -[_TDPackerNode size](-[TDPacker root](self, "root"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_countOfEmptyNodes:(id)a3 count:(unint64_t *)a4
{
  if ((objc_msgSend(a3, "fit") & 1) != 0)
  {
    if (objc_msgSend(a3, "down"))
      -[TDPacker _countOfEmptyNodes:count:](self, "_countOfEmptyNodes:count:", objc_msgSend(a3, "down"), a4);
    if (objc_msgSend(a3, "right"))
      -[TDPacker _countOfEmptyNodes:count:](self, "_countOfEmptyNodes:count:", objc_msgSend(a3, "right"), a4);
  }
  else
  {
    *a4 = (unint64_t)((double)*a4 + 1.0);
  }
}

- (unint64_t)countOfEmptyNodes
{
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  -[TDPacker _countOfEmptyNodes:count:](self, "_countOfEmptyNodes:count:", -[_TDPackerNode down](-[TDPacker root](self, "root"), "down"), &v5);
  -[TDPacker _countOfEmptyNodes:count:](self, "_countOfEmptyNodes:count:", -[_TDPackerNode right](-[TDPacker root](self, "root"), "right"), &v4);
  return v4 + v5;
}

- (BOOL)objectAtIndexFit:(int64_t)a3
{
  id v3;

  v3 = -[NSArray objectAtIndex:](self->_packedObjects, "objectAtIndex:", a3);
  if (v3 == (id)*MEMORY[0x24BDBD430])
    return 0;
  else
    return objc_msgSend(v3, "fit");
}

- (CGPoint)fitPositionOfObjectAtIndex:(int64_t)a3
{
  id v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = -[NSArray objectAtIndex:](self->_packedObjects, "objectAtIndex:", a3);
  if (v3 == (id)*MEMORY[0x24BDBD430])
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  else
  {
    objc_msgSend(v3, "origin");
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_findNode:(id)a3 ofSize:(CGSize)a4
{
  double height;
  double width;
  id result;
  double v9;
  double v10;

  height = a4.height;
  width = a4.width;
  if (objc_msgSend(a3, "used"))
  {
    result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", objc_msgSend(a3, "right"), width, height);
    if (!result)
      return -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", objc_msgSend(a3, "down"), width, height);
  }
  else
  {
    objc_msgSend(a3, "size");
    if (width > v9)
      return 0;
    objc_msgSend(a3, "size");
    result = a3;
    if (height > v10)
      return 0;
  }
  return result;
}

- (id)_splitNode:(id)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  _TDPackerNode *v7;
  _TDPackerNode *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.height;
  width = a4.width;
  v7 = objc_alloc_init(_TDPackerNode);
  v8 = objc_alloc_init(_TDPackerNode);
  objc_msgSend(a3, "origin");
  v10 = v9;
  objc_msgSend(a3, "origin");
  -[_TDPackerNode setOrigin:](v7, "setOrigin:", v10, height + v11);
  objc_msgSend(a3, "origin");
  v13 = width + v12;
  objc_msgSend(a3, "origin");
  -[_TDPackerNode setOrigin:](v8, "setOrigin:", v13);
  objc_msgSend(a3, "size");
  v15 = v14;
  objc_msgSend(a3, "size");
  -[_TDPackerNode setSize:](v7, "setSize:", v15, v16 - height);
  objc_msgSend(a3, "size");
  -[_TDPackerNode setSize:](v8, "setSize:", v17 - width, height);
  objc_msgSend(a3, "setUsed:", 1);
  objc_msgSend(a3, "setDown:", v7);
  objc_msgSend(a3, "setRight:", v8);

  return a3;
}

- (id)_growNodeToSize:(CGSize)a3
{
  double height;
  double width;
  _TDPackerNode *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;

  height = a3.height;
  width = a3.width;
  v6 = -[TDPacker root](self, "root");
  -[_TDPackerNode size](v6, "size");
  v8 = v7;
  -[_TDPackerNode size](v6, "size");
  v10 = v9;
  if (height > v9)
  {
    if (width > v8)
      return -[TDPacker _growDown:](self, "_growDown:", width, height);
    v14 = 0;
  }
  else
  {
    -[_TDPackerNode size](v6, "size");
    v12 = v11;
    -[_TDPackerNode size](v6, "size");
    v14 = v12 >= width + v13;
    if (width > v8)
      return -[TDPacker _growRight:](self, "_growRight:", width, height);
  }
  -[_TDPackerNode size](v6, "size");
  v16 = v15;
  -[_TDPackerNode size](v6, "size");
  if (v14 || v16 < height + v17 && height <= v10)
    return -[TDPacker _growRight:](self, "_growRight:", width, height);
  return -[TDPacker _growDown:](self, "_growDown:", width, height);
}

- (id)_growRight:(CGSize)a3
{
  double height;
  double width;
  _TDPackerNode *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TDPackerNode *v11;
  _TDPackerNode *v12;
  id result;

  height = a3.height;
  width = a3.width;
  v6 = -[TDPacker root](self, "root");
  -[_TDPackerNode size](v6, "size");
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setDown:](v11, "setDown:", v6);
  -[_TDPackerNode setUsed:](v11, "setUsed:", 1);
  -[_TDPackerNode setOrigin:](v11, "setOrigin:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[_TDPackerNode setSize:](v11, "setSize:", width + v8, v10);
  v12 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setOrigin:](v12, "setOrigin:", v8, 0.0);
  -[_TDPackerNode setSize:](v12, "setSize:", width, v10);
  -[_TDPackerNode setRight:](v11, "setRight:", v12);
  -[TDPacker setRoot:](self, "setRoot:", v11);

  result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", v11, width, height);
  if (result)
    return -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", result, width, height);
  return result;
}

- (id)_growDown:(CGSize)a3
{
  double height;
  double width;
  _TDPackerNode *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TDPackerNode *v11;
  _TDPackerNode *v12;
  id result;

  height = a3.height;
  width = a3.width;
  v6 = -[TDPacker root](self, "root");
  -[_TDPackerNode size](v6, "size");
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setRight:](v11, "setRight:", v6);
  -[_TDPackerNode setUsed:](v11, "setUsed:", 1);
  -[_TDPackerNode setOrigin:](v11, "setOrigin:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[_TDPackerNode setSize:](v11, "setSize:", v8, height + v10);
  v12 = objc_alloc_init(_TDPackerNode);
  -[_TDPackerNode setOrigin:](v12, "setOrigin:", 0.0, v10);
  -[_TDPackerNode setSize:](v12, "setSize:", v8, height);
  -[_TDPackerNode setDown:](v11, "setDown:", v12);
  -[TDPacker setRoot:](self, "setRoot:", v11);

  result = -[TDPacker _findNode:ofSize:](self, "_findNode:ofSize:", v11, width, height);
  if (result)
    return -[TDPacker _splitNode:toSize:](self, "_splitNode:toSize:", result, width, height);
  return result;
}

- (_TDPackerNode)root
{
  return (_TDPackerNode *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRoot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)packedObjects
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPackedObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
