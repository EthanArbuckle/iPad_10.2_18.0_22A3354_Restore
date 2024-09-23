@implementation PKDrawingVersionedDocument

+ (unsigned)serializationVersion
{
  return 10;
}

+ (unsigned)minimumSupportedVersion
{
  return 10;
}

- (PKDrawingVersionedDocument)initWithDrawingClass:(Class)a3
{
  PKDrawingVersionedDocument *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDrawingVersionedDocument;
  v4 = -[PKVersionedDocument init](&v6, sel_init);
  objc_storeStrong((id *)&v4->_drawingClass, a3);
  return v4;
}

- (BOOL)loadUnzippedData:(id)a3
{
  id v4;
  _BOOL4 v5;
  PKDrawingConcrete *v6;
  PKDrawingConcrete *drawing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDrawingVersionedDocument;
  v5 = -[PKVersionedDocument loadUnzippedData:](&v9, sel_loadUnzippedData_, v4);
  if (v5 && !self->_drawing)
  {
    v6 = (PKDrawingConcrete *)objc_alloc_init(self->_drawingClass);
    drawing = self->_drawing;
    self->_drawing = v6;

  }
  return v5;
}

- (PKDrawingVersionedDocument)initWithDrawing:(id)a3
{
  id v4;
  PKDrawingVersionedDocument *v5;
  uint64_t v6;
  PKDrawingConcrete *drawing;
  uint64_t v8;
  Class drawingClass;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDrawingVersionedDocument;
  v5 = -[PKVersionedDocument init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    drawing = v5->_drawing;
    v5->_drawing = (PKDrawingConcrete *)v6;

    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
    drawingClass = v5->_drawingClass;
    v5->_drawingClass = (Class)v8;

  }
  return v5;
}

- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  -[PKDrawingVersionedDocument drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mergeWithDrawing:", v6);

  v9.receiver = self;
  v9.super_class = (Class)PKDrawingVersionedDocument;
  -[PKVersionedDocument mergeWithVersionedDocument:](&v9, sel_mergeWithVersionedDocument_, v4);

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  objc_class *drawingClass;
  void *v7;
  void *v8;
  void *drawing;
  PKDrawingConcrete *v10;
  id v11;

  v11 = a4;
  drawingClass = self->_drawingClass;
  if (a3 < 0xA)
    v7 = (void *)objc_msgSend([drawingClass alloc], "initWithLegacyData:", v11);
  else
    v7 = (void *)objc_msgSend([drawingClass alloc], "initWithV1Data:loadNonInkingStrokes:", v11, -[PKDrawingVersionedDocument loadNonInkingStrokes](self, "loadNonInkingStrokes"));
  v8 = v7;
  if (!self->_drawing)
  {
    v10 = v7;
    drawing = self->_drawing;
    self->_drawing = v10;
    goto LABEL_8;
  }
  if (v7)
  {
    -[PKDrawingVersionedDocument drawing](self, "drawing");
    drawing = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(drawing, "mergeWithDrawing:", v8);
LABEL_8:

  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  void *v4;
  void *v5;

  -[PKDrawingVersionedDocument drawing](self, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "v1SerializeWithPathData:toVersion:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKDrawingConcrete)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (BOOL)loadNonInkingStrokes
{
  return self->_loadNonInkingStrokes;
}

- (void)setLoadNonInkingStrokes:(BOOL)a3
{
  self->_loadNonInkingStrokes = a3;
}

- (Class)drawingClass
{
  return self->_drawingClass;
}

- (void)setDrawingClass:(Class)a3
{
  objc_storeStrong((id *)&self->_drawingClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingClass, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
