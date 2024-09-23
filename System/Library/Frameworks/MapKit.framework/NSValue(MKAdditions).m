@implementation NSValue(MKAdditions)

- (uint64_t)_mapkit_initWithCGPoint:()MKAdditions
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  return objc_msgSend(a1, "initWithBytes:objCType:", v4, "{CGPoint=dd}");
}

- (uint64_t)_mapkit_initWithCADoublePoint:()MKAdditions
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  return objc_msgSend(a1, "initWithBytes:objCType:", v4, "{CGPoint=dd}");
}

- (double)CADoublePointValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithCADoubleRect:()MKAdditions
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return objc_msgSend(a1, "initWithBytes:objCType:", v6, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

- (double)CADoubleRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 32);
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithCGRect:()MKAdditions
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return objc_msgSend(a1, "initWithBytes:objCType:", v6, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

- (uint64_t)_mapkit_initWithZoomRegion:()MKAdditions
{
  _QWORD v5[3];

  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return objc_msgSend(a1, "initWithBytes:objCType:", v5, "{?=d{CLLocationCoordinate2D=dd}}");
}

- (double)_mapkit_zoomRegionValue
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 24);
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithMKMapRect:()MKAdditions
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return objc_msgSend(a1, "initWithBytes:objCType:", v6, "{?={?=dd}{?=dd}}");
}

- (double)MKMapRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 32);
  return *(double *)v2;
}

@end
