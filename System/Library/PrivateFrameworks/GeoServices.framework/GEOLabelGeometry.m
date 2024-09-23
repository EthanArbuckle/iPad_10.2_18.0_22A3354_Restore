@implementation GEOLabelGeometry

- (GEOLabelGeometry)initWithLabelShape:(id)a3 hasSelectionPolygon:(BOOL)a4
{
  id v6;
  GEOLabelGeometry *v7;
  uint64_t v8;
  NSArray *labelShape;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOLabelGeometry;
  v7 = -[GEOLabelGeometry init](&v11, sel_init);
  if (v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = objc_msgSend(v6, "copy");
      labelShape = v7->_labelShape;
      v7->_labelShape = (NSArray *)v8;

    }
    v7->_hasSelectionPolygon = a4;
  }

  return v7;
}

- (GEOLabelGeometry)initWithGEOPDLabelGeometry:(id)a3
{
  objc_class *v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  GEOLabelGeometry *v10;
  _QWORD v12[4];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = (id *)a3;
  v6 = objc_alloc_init(v4);
  -[GEOPDLabelGeometry labelShapes](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__GEOLabelGeometry_initWithGEOPDLabelGeometry___block_invoke;
  v12[3] = &unk_1E1C15080;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  if (v5)
    v9 = *((_BYTE *)v5 + 24) != 0;
  else
    v9 = 0;

  v10 = -[GEOLabelGeometry initWithLabelShape:hasSelectionPolygon:](self, "initWithLabelShape:hasSelectionPolygon:", v8, v9);
  return v10;
}

void __47__GEOLabelGeometry_initWithGEOPDLabelGeometry___block_invoke(uint64_t a1, id *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  -[GEOPDLineString points](a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (NSArray)labelShape
{
  return self->_labelShape;
}

- (BOOL)hasSelectionPolygon
{
  return self->_hasSelectionPolygon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelShape, 0);
}

@end
