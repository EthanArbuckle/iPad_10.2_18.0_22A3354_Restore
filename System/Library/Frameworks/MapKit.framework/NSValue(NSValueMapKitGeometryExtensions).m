@implementation NSValue(NSValueMapKitGeometryExtensions)

+ (id)valueWithMKCoordinate:()NSValueMapKitGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CLLocationCoordinate2D=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithMKCoordinateSpan:()NSValueMapKitGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{?=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)MKCoordinateValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

- (double)MKCoordinateSpanValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

@end
