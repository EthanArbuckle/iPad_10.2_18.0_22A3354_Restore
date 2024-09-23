@implementation PKPaletteShapesViewController

- (void)loadView
{
  void *v3;
  void *v4;
  PKPaletteShapesView *v5;

  v5 = objc_alloc_init(PKPaletteShapesView);
  -[PKPaletteShapesView collectionView](v5, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);

  -[PKPaletteShapesView collectionView](v5, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[PKPaletteShapesViewController setView:](self, "setView:", v5);
}

- (NSArray)shapes
{
  NSArray *shapes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  void *v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  shapes = self->_shapes;
  if (!shapes)
  {
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v15;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v4;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v5;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v6;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v7;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v8;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v9;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[7] = v10;
    +[PKPaletteShape shapeWithType:](PKPaletteShape, "shapeWithType:", 9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[8] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_shapes;
    self->_shapes = v12;

    shapes = self->_shapes;
  }
  return shapes;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 152.0;
  v3 = 184.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKPaletteShapesViewController shapes](self, "shapes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteShapesViewController shapes](self, "shapes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShape:", v13);

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[PKPaletteShapesViewController shapes](self, "shapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteShapesViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shapesViewController:didSelectShapeWithType:", self, objc_msgSend(v9, "shapeType"));

}

- (PKPaletteShapesViewControllerDelegate)delegate
{
  return (PKPaletteShapesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShapes:(id)a3
{
  objc_storeStrong((id *)&self->_shapes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
