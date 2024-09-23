@implementation PDFCRGroupRegion

- (PDFCRGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6
{
  id v11;
  id v12;
  id v13;
  PDFCRGroupRegion *v14;
  PDFCRGroupRegion *v15;
  uint64_t v16;
  NSMutableArray *children;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PDFCRGroupRegion;
  v14 = -[PDFCRGroupRegion init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_boundingQuad, a3);
    v15->_layoutDirection = a4;
    objc_storeStrong((id *)&v15->_subregions, a5);
    v16 = objc_opt_new();
    children = v15->_children;
    v15->_children = (NSMutableArray *)v16;

    objc_storeWeak((id *)&v15->_parent, v13);
    v15->_type = 5;
  }

  return v15;
}

- (void)removeSubregion:(id)a3
{
  void *v4;
  NSArray *v5;
  void *subregions;
  id v7;

  v7 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_subregions);
  objc_msgSend(v4, "removeObject:", v7);
  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
    subregions = self->_subregions;
    self->_subregions = v5;
  }
  else
  {
    subregions = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(subregions, "removeChild:", self);
  }

}

- (void)addChild:(id)a3
{
  -[NSMutableArray addObject:](self->_children, "addObject:", a3);
}

- (void)removeChild:(id)a3
{
  -[NSMutableArray removeObject:](self->_children, "removeObject:", a3);
}

- (void)insertChildren:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->_children, "insertObject:atIndex:", a3, a4);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (PDFCRGroupRegion)parent
{
  return (PDFCRGroupRegion *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
