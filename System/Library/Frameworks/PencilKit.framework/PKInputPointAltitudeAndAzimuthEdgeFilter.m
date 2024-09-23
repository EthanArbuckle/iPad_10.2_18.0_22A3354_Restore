@implementation PKInputPointAltitudeAndAzimuthEdgeFilter

- (void)addInputPoint:(id *)a3
{
  id WeakRetained;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  _OWORD v12[8];

  if (self)
  {
    ++self->super._numInputPoints;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    WeakRetained = 0;
  }
  v6 = *(_OWORD *)&a3->var9;
  v12[4] = *(_OWORD *)&a3->var7;
  v12[5] = v6;
  v7 = *(_OWORD *)&a3->var13;
  v12[6] = *(_OWORD *)&a3->var11;
  v12[7] = v7;
  v8 = *(_OWORD *)&a3->var1;
  v12[0] = a3->var0;
  v12[1] = v8;
  v9 = *(_OWORD *)&a3->var5;
  v12[2] = *(_OWORD *)&a3->var3;
  v12[3] = v9;
  objc_msgSend(WeakRetained, "inputPointFilter:distanceToEdge:", self, v12);
  v11 = v10;

  if (self)
  {
    if (v11 >= self->_edgeLimit)
    {
      self->_lastKnownAltitude = a3->var3;
      self->_lastKnownAzimuth = a3->var2;
    }
    else
    {
      a3->var3 = self->_lastKnownAltitude;
      a3->var2 = self->_lastKnownAzimuth;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
  else if (v11 < 0.0)
  {
    a3->var2 = 0.0;
    a3->var3 = 0.0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
