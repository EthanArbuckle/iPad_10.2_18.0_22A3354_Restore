@implementation MFModernAtomIconView

- (void)drawRect:(CGRect)a3
{
  uint64_t v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[6];
  BOOL v12;
  _QWORD v13[3];
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MFModernAtomIconView;
  -[MFModernAtomIconView drawRect:](&v15, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = -[MFModernAtomIconView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = v4 == 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = -1;
  if (v4)
  {
    -[MFModernAtomIconView bounds](self, "bounds");
    v7 = v6;
    -[MFModernAtomIconView drawingOffset](self, "drawingOffset");
    v9 = v7 - v8;
  }
  else
  {
    -[MFModernAtomIconView drawingOffset](self, "drawingOffset");
  }
  v14 = *(_QWORD *)&v9;
  -[MFModernAtomIconView iconImages](self, "iconImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__MFModernAtomIconView_drawRect___block_invoke;
  v11[3] = &unk_1E5A69798;
  v12 = v5;
  v11[4] = self;
  v11[5] = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  _Block_object_dispose(v13, 8);
}

void __33__MFModernAtomIconView_drawRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = a2;
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v12 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "drawingOffset");
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "size");
    v8 = v7;
    objc_msgSend(v12, "drawingOffset");
    v6 = -(v8 + v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "drawingOffset");
  objc_msgSend(v12, "drawingOffset");
  objc_msgSend(v12, "size");
  UIRoundToViewScale();
  objc_msgSend(v12, "drawAtPoint:", v4 + v6, v10);
  objc_msgSend(v12, "size");
  objc_msgSend(*(id *)(a1 + 32), "iconPadding");
  UIRoundToViewScale();
  if (!*(_BYTE *)(a1 + 48))
    v11 = -v11;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

- (double)preferredWidth
{
  uint64_t v3;
  void *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = -1;
  -[MFModernAtomIconView drawingOffset](self, "drawingOffset");
  v11 = v3;
  -[MFModernAtomIconView iconImages](self, "iconImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFModernAtomIconView_preferredWidth__block_invoke;
  v7[3] = &unk_1E5A697C0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __38__MFModernAtomIconView_preferredWidth__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "size");
  objc_msgSend(*(id *)(a1 + 32), "iconPadding");
  objc_msgSend(v4, "drawingOffset");
  UIRoundToViewScale();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

- (NSArray)iconImages
{
  return self->_iconImages;
}

- (void)setIconImages:(id)a3
{
  objc_storeStrong((id *)&self->_iconImages, a3);
}

- (double)iconPadding
{
  return self->_iconPadding;
}

- (void)setIconPadding:(double)a3
{
  self->_iconPadding = a3;
}

- (CGPoint)drawingOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_drawingOffset.x;
  y = self->_drawingOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->_drawingOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImages, 0);
}

@end
