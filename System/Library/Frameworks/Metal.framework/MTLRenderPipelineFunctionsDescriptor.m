@implementation MTLRenderPipelineFunctionsDescriptor

- (MTLRenderPipelineFunctionsDescriptor)init
{
  MTLRenderPipelineFunctionsDescriptor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPipelineFunctionsDescriptor;
  v2 = -[MTLRenderPipelineFunctionsDescriptor init](&v4, sel_init);
  if (v2)
  {
    v2->_vertexAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_fragmentAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_tileAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_objectAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
    v2->_meshAdditionalBinaryFunctions = (NSArray *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineFunctionsDescriptor;
  -[MTLRenderPipelineFunctionsDescriptor dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  NSArray *vertexAdditionalBinaryFunctions;
  NSArray *fragmentAdditionalBinaryFunctions;
  NSArray *tileAdditionalBinaryFunctions;
  NSArray *objectAdditionalBinaryFunctions;
  NSArray *meshAdditionalBinaryFunctions;
  _QWORD v9[5];

  bzero(v9, 0x28uLL);
  vertexAdditionalBinaryFunctions = self->_vertexAdditionalBinaryFunctions;
  if (vertexAdditionalBinaryFunctions)
    v9[0] = -[NSArray hash](vertexAdditionalBinaryFunctions, "hash");
  fragmentAdditionalBinaryFunctions = self->_fragmentAdditionalBinaryFunctions;
  if (fragmentAdditionalBinaryFunctions)
    v9[1] = -[NSArray hash](fragmentAdditionalBinaryFunctions, "hash");
  tileAdditionalBinaryFunctions = self->_tileAdditionalBinaryFunctions;
  if (tileAdditionalBinaryFunctions)
    v9[2] = -[NSArray hash](tileAdditionalBinaryFunctions, "hash");
  objectAdditionalBinaryFunctions = self->_objectAdditionalBinaryFunctions;
  if (objectAdditionalBinaryFunctions)
    v9[3] = -[NSArray hash](objectAdditionalBinaryFunctions, "hash");
  meshAdditionalBinaryFunctions = self->_meshAdditionalBinaryFunctions;
  if (meshAdditionalBinaryFunctions)
    v9[4] = -[NSArray hash](meshAdditionalBinaryFunctions, "hash");
  return _MTLHashState((int *)v9, 0x28uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  BOOL result;
  int v7;
  int v8;
  int v9;
  int v10;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v7 = MTLCompareArray(self->_vertexAdditionalBinaryFunctions, *((void **)a3 + 1), 1, 0);
  result = 0;
  if (v7)
  {
    v8 = MTLCompareArray(self->_fragmentAdditionalBinaryFunctions, *((void **)a3 + 2), 1, 0);
    result = 0;
    if (v8)
    {
      v9 = MTLCompareArray(self->_tileAdditionalBinaryFunctions, *((void **)a3 + 3), 1, 0);
      result = 0;
      if (v9)
      {
        v10 = MTLCompareArray(self->_objectAdditionalBinaryFunctions, *((void **)a3 + 4), 1, 0);
        result = 0;
        if (v10)
          return MTLCompareArray(self->_meshAdditionalBinaryFunctions, *((void **)a3 + 5), 1, 0);
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v5[1] = -[NSArray copyWithZone:](self->_vertexAdditionalBinaryFunctions, "copyWithZone:", a3);
    v5[2] = -[NSArray copyWithZone:](self->_fragmentAdditionalBinaryFunctions, "copyWithZone:", a3);
    v5[3] = -[NSArray copyWithZone:](self->_tileAdditionalBinaryFunctions, "copyWithZone:", a3);
    v5[4] = -[NSArray copyWithZone:](self->_objectAdditionalBinaryFunctions, "copyWithZone:", a3);
    v5[5] = -[NSArray copyWithZone:](self->_meshAdditionalBinaryFunctions, "copyWithZone:", a3);
  }
  return v5;
}

- (NSArray)vertexAdditionalBinaryFunctions
{
  return self->_vertexAdditionalBinaryFunctions;
}

- (void)setVertexAdditionalBinaryFunctions:(NSArray *)vertexAdditionalBinaryFunctions
{
  objc_setProperty_nonatomic_copy(self, a2, vertexAdditionalBinaryFunctions, 8);
}

- (NSArray)fragmentAdditionalBinaryFunctions
{
  return self->_fragmentAdditionalBinaryFunctions;
}

- (void)setFragmentAdditionalBinaryFunctions:(NSArray *)fragmentAdditionalBinaryFunctions
{
  objc_setProperty_nonatomic_copy(self, a2, fragmentAdditionalBinaryFunctions, 16);
}

- (NSArray)tileAdditionalBinaryFunctions
{
  return self->_tileAdditionalBinaryFunctions;
}

- (void)setTileAdditionalBinaryFunctions:(NSArray *)tileAdditionalBinaryFunctions
{
  objc_setProperty_nonatomic_copy(self, a2, tileAdditionalBinaryFunctions, 24);
}

- (NSArray)objectAdditionalBinaryFunctions
{
  return self->_objectAdditionalBinaryFunctions;
}

- (void)setObjectAdditionalBinaryFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)meshAdditionalBinaryFunctions
{
  return self->_meshAdditionalBinaryFunctions;
}

- (void)setMeshAdditionalBinaryFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
