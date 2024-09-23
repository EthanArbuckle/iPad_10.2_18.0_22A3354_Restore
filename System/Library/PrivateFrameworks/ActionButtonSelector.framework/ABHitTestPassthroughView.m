@implementation ABHitTestPassthroughView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[ABHitTestPassthroughView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__ABHitTestPassthroughView_pointInside_withEvent___block_invoke;
  v11[3] = &unk_25073EF10;
  v14 = x;
  v15 = y;
  v11[4] = self;
  v9 = v7;
  v12 = v9;
  v13 = &v16;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __50__ABHitTestPassthroughView_pointInside_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isHidden") & 1) == 0)
  {
    if (objc_msgSend(v7, "isUserInteractionEnabled"))
    {
      objc_msgSend(v7, "alpha");
      if (v6 >= 0.01)
      {
        objc_msgSend(v7, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
        if (objc_msgSend(v7, "pointInside:withEvent:", *(_QWORD *)(a1 + 40)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }

}

@end
