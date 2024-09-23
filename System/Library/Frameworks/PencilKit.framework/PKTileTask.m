@implementation PKTileTask

- (PKTileTask)initWithStrokes:(id)a3 additionalStrokes:(id)a4 intoTile:(id)a5 completionBlock:(id)a6
{
  PKRendererTile *v10;
  id v11;
  id v12;
  id v13;
  PKTileTask *v14;
  uint64_t v15;
  NSArray *renderStrokes;
  uint64_t v17;
  NSArray *additionalStrokes;
  PKRendererTile *tile;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  id completionBlock;
  objc_super v25;

  v10 = (PKRendererTile *)a5;
  v25.receiver = self;
  v25.super_class = (Class)PKTileTask;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[PKTileTask init](&v25, sel_init);
  v15 = objc_msgSend(v13, "copy", v25.receiver, v25.super_class);

  renderStrokes = v14->_renderStrokes;
  v14->_renderStrokes = (NSArray *)v15;

  v17 = objc_msgSend(v12, "copy");
  additionalStrokes = v14->_additionalStrokes;
  v14->_additionalStrokes = (NSArray *)v17;

  tile = v14->_tile;
  v14->_tile = v10;
  v20 = v10;

  if (v20)
    v21 = atomic_load(v20 + 2);
  else
    v21 = 0;
  v14->_renderCount = v21;
  v22 = _Block_copy(v11);

  completionBlock = v14->_completionBlock;
  v14->_completionBlock = v22;

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  PKRendererTile *v6;
  NSArray *additionalStrokes;
  NSArray *v8;
  uint64_t v9;
  int64_t renderCount;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_tile;
    additionalStrokes = self->_additionalStrokes;
  }
  else
  {
    v6 = 0;
    additionalStrokes = 0;
  }
  v8 = additionalStrokes;
  v9 = -[NSArray count](v8, "count");
  if (self)
    renderCount = self->_renderCount;
  else
    renderCount = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ additionalStrokes:%ld renderCount:%ld>"), v5, self, v6, v9, renderCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_additionalStrokes, 0);
  objc_storeStrong((id *)&self->_renderStrokes, 0);
}

@end
