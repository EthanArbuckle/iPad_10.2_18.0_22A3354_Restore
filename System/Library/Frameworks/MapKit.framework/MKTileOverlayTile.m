@implementation MKTileOverlayTile

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MKTileOverlayTile;
  -[MKTileOverlayTile description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (x:%ld y:%ld z:%ld image:%ld bytes)"), v4, self->_path.x, self->_path.y, self->_path.z, -[NSData length](self->_image, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($4479F518DFD59EF68F6FA14DAF968345)path
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setPath:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_path.z = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_path.x = v3;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)frame
{
  double x;
  double y;
  double width;
  double height;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setFrame:(id)a3
{
  self->_frame = ($8D326A409DE759287A73E3EC6ECA4C4F)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
