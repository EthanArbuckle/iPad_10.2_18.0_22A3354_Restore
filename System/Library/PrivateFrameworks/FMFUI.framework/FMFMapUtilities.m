@implementation FMFMapUtilities

+ ($5934897077F541E2EA57917B1DCA15E9)regionForAnnotations:(SEL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  $5934897077F541E2EA57917B1DCA15E9 *result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = -90.0;
    v9 = 180.0;
    v10 = 90.0;
    v11 = -180.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "coordinate");
        v9 = fmin(v9, v14);
        objc_msgSend(v13, "coordinate");
        v8 = fmax(v8, v15);
        objc_msgSend(v13, "coordinate");
        v11 = fmax(v11, v16);
        objc_msgSend(v13, "coordinate");
        v10 = fmin(v10, v17);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return result;
}

+ ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectForCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MKMapPoint v11;
  MKMapPoint v12;
  double v13;
  double v14;
  double x;
  double y;
  CLLocationCoordinate2D v17;
  CLLocationCoordinate2D v18;
  $7A2C3A43EE5A76686BB0A44688CCB5FC result;

  v7 = v4;
  v8 = v3;
  v9 = v5 * 0.5;
  v10 = v6 * 0.5;
  v17 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  v11 = MKMapPointForCoordinate(v17);
  v18 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  v12 = MKMapPointForCoordinate(v18);
  v13 = vabdd_f64(v12.x, v11.x);
  v14 = vabdd_f64(v12.y, v11.y);
  x = v11.x;
  y = v11.y;
  result.var1.var1 = v14;
  result.var1.var0 = v13;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

+ (BOOL)doNotAnimateToNewLocation:(CLLocationCoordinate2D)a3 forMapView:(id)a4
{
  double longitude;
  double latitude;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = (objc_class *)MEMORY[0x24BDBFA80];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithLatitude:longitude:", latitude, longitude);
  v9 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v7, "centerCoordinate");
  v11 = v10;
  objc_msgSend(v7, "centerCoordinate");
  v13 = v12;

  v14 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:", v11, v13);
  objc_msgSend(v14, "distanceFromLocation:", v8);
  LOBYTE(v9) = v15 > 637300.0;

  return (char)v9;
}

@end
