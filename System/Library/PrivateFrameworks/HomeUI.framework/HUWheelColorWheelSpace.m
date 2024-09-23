@implementation HUWheelColorWheelSpace

- (unint64_t)type
{
  return 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3
{
  double var1;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  var1 = a3.var1;
  if (a3.var0 < 0.0 || a3.var0 > 1.0)
    NSLog(CFSTR("Input coordinate angle %f is out of bounds!"), a2, *(_QWORD *)&a3.var0);
  v5 = 0.0;
  if (var1 >= 0.08)
    v5 = (var1 + -0.08) / 0.92;
  pow(v5, 2.2);
  HFConvertHSBToRGB();
  v7 = *((double *)&HUWheelColorInvalid + 1);
  v6 = *(double *)&HUWheelColorInvalid;
  v9 = unk_1B9442BC0;
  v8 = 1.79769313e308;
  result.var3 = v9;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4
{
  double v5;
  double v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  HFConvertRGBToHSB();
  if (a4)
    *a4 = 1;
  v5 = fmax(pow(0.0, 0.454545455), 0.08);
  v6 = 0.0;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

@end
