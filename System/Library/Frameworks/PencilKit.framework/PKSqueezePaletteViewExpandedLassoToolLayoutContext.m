@implementation PKSqueezePaletteViewExpandedLassoToolLayoutContext

- (id)initWithDrawingTool:(void *)a3 toolAngle:(void *)a4 barButtonItems:(double)a5 previousLayout:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKSqueezePaletteViewExpandedLassoToolLayoutContext;
    v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      *((double *)a1 + 2) = a5;
      v14 = objc_msgSend(v11, "copy");
      v15 = a1[3];
      a1[3] = (id)v14;

      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayout, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
  objc_storeStrong((id *)&self->_drawingTool, 0);
}

@end
