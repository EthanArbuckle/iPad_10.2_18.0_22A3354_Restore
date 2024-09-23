@implementation PKRendererTileProperties

- (PKRendererTileProperties)initWithLevel:(int64_t)a3 offset:(CGPoint)a4 drawingTransform:(CGAffineTransform *)a5 sixChannelMode:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  PKRendererTileProperties *result;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)PKRendererTileProperties;
  result = -[PKRendererTileProperties init](&v14, sel_init);
  if (result)
  {
    result->_level = a3;
    result->_offset.x = x;
    result->_offset.y = y;
    result->_sixChannelMode = a6;
    v12 = *(_OWORD *)&a5->a;
    v13 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_drawingTransform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_drawingTransform.c = v13;
    *(_OWORD *)&result->_drawingTransform.a = v12;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_level ^ ((uint64_t)self->_offset.x << 8) ^ ((uint64_t)self->_offset.y << 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  int v14;
  _OWORD v16[3];
  double v17[6];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = -[PKRendererTileProperties level](self, "level");
  if (v6 == objc_msgSend(v5, "level"))
  {
    objc_msgSend(v5, "offset");
    v8 = v7;
    v10 = v9;
    -[PKRendererTileProperties offset](self, "offset");
    v12 = 0;
    if (v8 != v13 || v10 != v11)
      goto LABEL_7;
    v14 = -[PKRendererTileProperties sixChannelMode](self, "sixChannelMode");
    if (v14 == objc_msgSend(v5, "sixChannelMode"))
    {
      -[PKRendererTileProperties drawingTransform](self, "drawingTransform");
      if (v5)
        objc_msgSend(v5, "drawingTransform");
      else
        memset(v16, 0, sizeof(v16));
      v12 = DKDNearlyEqualTransforms(v17, (double *)v16);
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_7:

LABEL_9:
  return v12;
}

- (int64_t)level
{
  return self->_level;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)sixChannelMode
{
  return self->_sixChannelMode;
}

- (CGAffineTransform)drawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

@end
