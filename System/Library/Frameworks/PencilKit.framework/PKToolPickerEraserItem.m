@implementation PKToolPickerEraserItem

- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3
{
  return -[PKToolPickerEraserItem initWithEraserType:width:](self, "initWithEraserType:width:", a3, 0.0);
}

- (PKToolPickerEraserItem)initWithEraserType:(int64_t)a3 width:(double)a4
{
  PKEraserTool *v7;
  uint64_t v8;
  void *v9;
  PKToolPickerEraserItem *v10;
  objc_super v12;

  v7 = [PKEraserTool alloc];
  if (a4 > 0.0)
    v8 = -[PKEraserTool initWithEraserType:width:](v7, "initWithEraserType:width:", a3, a4);
  else
    v8 = -[PKEraserTool initWithEraserType:](v7, "initWithEraserType:", a3);
  v9 = (void *)v8;
  v12.receiver = self;
  v12.super_class = (Class)PKToolPickerEraserItem;
  v10 = -[PKToolPickerItem initWithTool:](&v12, sel_initWithTool_, v8);

  return v10;
}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[PKToolPickerEraserItem eraserTool](self, "eraserTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

- (id)_toolCopyWithWidth:(double)a3
{
  PKEraserTool *v5;
  void *v6;
  PKEraserTool *v7;

  v5 = [PKEraserTool alloc];
  -[PKToolPickerEraserItem eraserTool](self, "eraserTool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKEraserTool initWithEraserType:width:](v5, "initWithEraserType:width:", objc_msgSend(v6, "eraserType"), a3);

  return v7;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[PKToolPickerEraserItem eraserTool](self, "eraserTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
