@implementation HKStringDrawing

+ (id)stringDrawingWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  HKStringDrawing *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  v11 = a3;
  v12 = -[HKStringDrawing initWithText:inRect:withAttributes:]([HKStringDrawing alloc], "initWithText:inRect:withAttributes:", v11, v10, x, y, width, height);

  return v12;
}

- (HKStringDrawing)initWithText:(id)a3 inRect:(CGRect)a4 withAttributes:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v11;
  id v12;
  HKStringDrawing *v13;
  HKStringDrawing *v14;
  double v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKStringDrawing;
  v13 = -[HKStringDrawing init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[HKStringDrawing setText:](v13, "setText:", v11);
    -[HKStringDrawing setAttributes:](v14, "setAttributes:", v12);
    v14->_rect.origin.x = x;
    v14->_rect.origin.y = y;
    v14->_rect.size.width = width;
    v14->_rect.size.height = height;
    v15 = HKUIFloorToScreenScale(y);
    v14->_rect.origin.y = v15 + HKUIHalfPixel();
  }

  return v14;
}

- (void)draw
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[HKStringDrawing text](self, "text");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HKStringDrawing rect](self, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKStringDrawing attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawInRect:withAttributes:", v11, v4, v6, v8, v10);

}

+ (void)drawStrings:(id)a3 outlineWidth:(double)a4 outlineColor:(id)a5 context:(CGContext *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  CGContextRef c;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (a4 <= 0.0)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "draw");
        }
        v33 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v33);
    }
  }
  else
  {
    CGContextSaveGState(a6);
    v37 = v10;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v14 = objc_claimAutoreleasedReturnValue();

      CGContextSetBlendMode(a6, kCGBlendModeClear);
      v11 = (id)v14;
    }
    v15 = objc_retainAutorelease(v11);
    CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v15, "CGColor"));
    v16 = objc_retainAutorelease(v15);
    CGContextSetStrokeColorWithColor(a6, (CGColorRef)objc_msgSend(v16, "CGColor"));
    CGContextSetLineWidth(a6, fabs(a4));
    CGContextSetLineCap(a6, kCGLineCapRound);
    CGContextSetLineJoin(a6, kCGLineJoinRound);
    c = a6;
    CGContextSetTextDrawingMode(a6, kCGTextFillStroke);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      v21 = *MEMORY[0x1E0DC1140];
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v23, "attributes", c);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

          objc_msgSend(v25, "setValue:forKey:", v16, v21);
          objc_msgSend(v23, "text");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "rect");
          objc_msgSend(v26, "drawInRect:withAttributes:", v25);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v19);
    }

    CGContextRestoreGState(c);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = v17;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "draw", c);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v29);
    }

    v10 = v37;
  }

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
