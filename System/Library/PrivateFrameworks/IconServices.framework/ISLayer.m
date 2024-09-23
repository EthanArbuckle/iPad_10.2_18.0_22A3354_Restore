@implementation ISLayer

- (ISLayer)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISLayer;
  v2 = -[ISLayer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;

    v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v2 + 88) = v5;
    *((_DWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 7) = 0;
  }
  return (ISLayer *)v2;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = self->_frame.size.width;
  v9 = self->_frame.size.height;
  self->_frame.origin.x = x;
  self->_frame.origin.y = y;
  self->_frame.size.width = a3.size.width;
  self->_frame.size.height = a3.size.height;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeScale(&v22, a3.size.width / v8, a3.size.height / v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ISLayer sublayers](self, "sublayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "frame");
        v17 = v22;
        v26 = CGRectApplyAffineTransform(v25, &v17);
        objc_msgSend(v15, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  -[ISLayer mask](self, "mask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, y, width, height);

}

- (CGRect)frame
{
  unint64_t coordinateSystem;
  void *v4;
  CGFloat v5;
  CGFloat *p_height;
  double v7;
  CGSize *p_size;
  CGFloat v9;
  double x;
  double y;
  void *v12;
  CGFloat v13;
  void *v14;
  CGFloat MaxY;
  double height;
  CGFloat v17;
  void *v18;
  CGFloat MaxX;
  CGSize *v20;
  double width;
  CGFloat v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  coordinateSystem = self->_coordinateSystem;
  switch(coordinateSystem)
  {
    case 3uLL:
      -[ISLayer superlayer](self, "superlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      p_size = &self->_frame.size;
      v13 = CGRectGetMaxX(v26) - self->_frame.size.width;
      -[ISLayer superlayer](self, "superlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      MaxY = CGRectGetMaxY(v27);
      height = self->_frame.size.height;
      p_height = &self->_frame.size.height;
      v17 = MaxY - height;

      x = v13 - *(p_height - 3);
      y = v17 - *(p_height - 2);
      break;
    case 2uLL:
      -[ISLayer superlayer](self, "superlayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      MaxX = CGRectGetMaxX(v28);
      width = self->_frame.size.width;
      v20 = &self->_frame.size;
      v22 = MaxX - width;

      y = v20[-1].height;
      x = v22 - v20[-1].width;
      p_size = v20;
      p_height = &v20->height;
      break;
    case 1uLL:
      -[ISLayer superlayer](self, "superlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v5 = CGRectGetMaxY(v25);
      v7 = self->_frame.size.height;
      p_height = &self->_frame.size.height;
      p_size = (CGSize *)(p_height - 1);
      v9 = v5 - v7;

      x = *(p_height - 3);
      y = v9 - *(p_height - 2);
      break;
    default:
      x = self->_frame.origin.x;
      y = self->_frame.origin.y;
      p_size = &self->_frame.size;
      p_height = &self->_frame.size.height;
      break;
  }
  v23 = *p_height;
  v24 = p_size->width;
  result.size.height = v23;
  result.size.width = v24;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[ISLayer frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
  -[ISLayer setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, a3.width, a3.height);
}

- (void)setPosition:(CGPoint)a3
{
  -[ISLayer setFrame:](self, "setFrame:", a3.x, a3.y, self->_frame.size.width, self->_frame.size.height);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[ISLayer size](self, "size");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  -[ISLayer setSize:](self, "setSize:", a3.size.width, a3.size.height);
}

- (void)removeFromSuperlayer
{
  void *v3;
  id v4;

  -[ISLayer internalSuperlayer](self, "internalSuperlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  -[ISLayer setInternalSuperlayer:](self, "setInternalSuperlayer:", 0);
}

- (void)addSublayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setInternalSuperlayer:", self);
  -[ISLayer internalSublayers](self, "internalSublayers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "setInternalSuperlayer:", self);
  -[ISLayer internalSublayers](self, "internalSublayers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

}

- (NSArray)sublayers
{
  void *v2;
  void *v3;

  -[ISLayer internalSublayers](self, "internalSublayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ISLayer;
  -[ISLayer debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (ISLayer)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
  objc_storeStrong((id *)&self->_mask, a3);
}

- (ISEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (ISLayer)internalSuperlayer
{
  return (ISLayer *)objc_loadWeakRetained((id *)&self->_internalSuperlayer);
}

- (void)setInternalSuperlayer:(id)a3
{
  objc_storeWeak((id *)&self->_internalSuperlayer, a3);
}

- (NSMutableArray)internalSublayers
{
  return self->_internalSublayers;
}

- (unint64_t)coordinateSystem
{
  return self->_coordinateSystem;
}

- (void)setCoordinateSystem:(unint64_t)a3
{
  self->_coordinateSystem = a3;
}

- (unint64_t)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(unint64_t)a3
{
  self->_flipped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSublayers, 0);
  objc_destroyWeak((id *)&self->_internalSuperlayer);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
