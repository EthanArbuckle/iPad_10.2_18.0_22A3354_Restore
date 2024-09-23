@implementation _MKDynamicTileOverlay

- (_MKDynamicTileOverlay)init
{
  _MKDynamicTileOverlay *v2;
  _MKDynamicTileOverlay *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKDynamicTileOverlay;
  v2 = -[_MKDynamicTileOverlay init](&v5, sel_init);
  if (v2)
  {
    v2->_providerID = +[_MKOverlayTileRequester registerDataSource:](_MKOverlayTileRequester, "registerDataSource:", v2);
    *(_OWORD *)&v2->_minimumZ = xmmword_18B2AEF60;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  +[_MKOverlayTileRequester unregisterDataSource:](_MKOverlayTileRequester, "unregisterDataSource:", self->_providerID);
  v3.receiver = self;
  v3.super_class = (Class)_MKDynamicTileOverlay;
  -[_MKDynamicTileOverlay dealloc](&v3, sel_dealloc);
}

- (BOOL)isGeometryFlipped
{
  return 0;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  v2 = 268435456.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 268435456.0;
  result.var1.var1 = v5;
  result.var1.var0 = v2;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  CLLocationCoordinate2D result;

  v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  longitude = v4.longitude;
  latitude = v4.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)loadTileAtPath:(id *)a3 result:(id)a4
{
  void *v5;
  NSString *v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = MKErrorDomain;
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v7, 0, v8);

}

- (void)_cancelLoadingTileAtPath:(id *)a3
{
  __int128 v3;
  _OWORD v4[2];

  v3 = *(_OWORD *)&a3->var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  -[_MKDynamicTileOverlay cancelLoadingTileAtPath:](self, "cancelLoadingTileAtPath:", v4);
}

- (unsigned)_providerID
{
  return self->_providerID;
}

- (int64_t)minimumZ
{
  return self->_minimumZ;
}

- (void)setMinimumZ:(int64_t)a3
{
  self->_minimumZ = a3;
}

- (int64_t)maximumZ
{
  return self->_maximumZ;
}

- (void)setMaximumZ:(int64_t)a3
{
  self->_maximumZ = a3;
}

@end
