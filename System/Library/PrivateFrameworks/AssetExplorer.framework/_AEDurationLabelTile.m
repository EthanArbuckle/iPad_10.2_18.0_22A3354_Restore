@implementation _AEDurationLabelTile

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGSize size;
  CGSize var2;
  char isKindOfClass;
  _OWORD v14[12];
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_AEDurationLabelTile;
  v7 = *(_OWORD *)&a3->var7.height;
  v14[8] = *(_OWORD *)&a3->var6;
  v14[9] = v7;
  v8 = *(_OWORD *)&a3->var8.size.height;
  v14[10] = *(_OWORD *)&a3->var8.origin.y;
  v14[11] = v8;
  v9 = *(_OWORD *)&a3->var3.c;
  v14[4] = *(_OWORD *)&a3->var3.a;
  v14[5] = v9;
  v10 = *(_OWORD *)&a3->var4;
  v14[6] = *(_OWORD *)&a3->var3.tx;
  v14[7] = v10;
  size = a3->var0.size;
  v14[0] = a3->var0.origin;
  v14[1] = size;
  var2 = a3->var2;
  v14[2] = a3->var1;
  v14[3] = var2;
  -[UIView didApplyGeometry:withUserData:](&v15, sel_didApplyGeometry_withUserData_, v14, v6);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v6 || (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    -[_AEDurationLabelTile setDuration:](self, "setDuration:");
  }

}

- (void)setDuration:(double)a3
{
  uint64_t v4;
  id v5;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    if (a3 <= 0.0)
    {
      v4 = 0;
    }
    else
    {
      PXLocalizedVideoDuration();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v4;
    -[_AEDurationLabelTile setText:](self, "setText:", v4);

  }
}

- (double)duration
{
  return self->_duration;
}

@end
