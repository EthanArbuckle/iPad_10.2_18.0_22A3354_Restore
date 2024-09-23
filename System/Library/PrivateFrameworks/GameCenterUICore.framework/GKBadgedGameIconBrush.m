@implementation GKBadgedGameIconBrush

- (GKBadgedGameIconBrush)init
{
  GKBadgedGameIconBrush *v2;
  GKCircleImageBrush *v3;
  GKThemeBrush *badgeBrush;
  GKBadgedGameIconBrush *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKBadgedGameIconBrush;
  v2 = -[GKBadgedGameIconBrush init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GKCircleImageBrush);
    badgeBrush = v2->_badgeBrush;
    v2->_badgeBrush = &v3->super.super;

    v5 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKBadgedGameIconBrush;
  v4 = -[GKThemeBrush copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[GKBadgedGameIconBrush badgeBrush](self, "badgeBrush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeBrush:", v5);

  return v4;
}

- (CGSize)sizeForInput:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8 + 12.0;
    v11 = v10 + 12.0;

  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)scaleForInput:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[GKBadgedGameIconBrush badgeBrush](self, "badgeBrush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaleForInput:", v4);
  v7 = v6;

  return v7;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  v25 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v25;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "count");
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v10 >= 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "size");
    v14 = v13;
    v16 = v15;
    -[GKBadgedGameIconBrush badgeBrush](self, "badgeBrush");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeForInput:", v12);
    v19 = v18;
    v21 = v20;

    v26.origin.x = 6.0;
    v26.origin.y = 6.0;
    v26.size.width = v14;
    v26.size.height = v16;
    v22 = CGRectGetMaxY(v26) - v21 + 6.0;
    UIGraphicsPushContext(a4);
    CGContextSaveGState(a4);
    objc_msgSend(v11, "drawInRect:", 6.0, 6.0, v14, v16);
    -[GKBadgedGameIconBrush badgeBrush](self, "badgeBrush");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "drawnImageForSize:opaque:input:", 0, v12, v19, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "drawInRect:", 0.0, v22, v19, v21);
    CGContextRestoreGState(a4);
    UIGraphicsPopContext();

  }
}

- (GKThemeBrush)badgeBrush
{
  return self->_badgeBrush;
}

- (void)setBadgeBrush:(id)a3
{
  objc_storeStrong((id *)&self->_badgeBrush, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeBrush, 0);
}

@end
