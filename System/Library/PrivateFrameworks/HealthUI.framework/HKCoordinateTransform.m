@implementation HKCoordinateTransform

- (double)coordinateForValue:(id)a3
{
  double result;

  objc_msgSend(a3, "doubleValue");
  return result;
}

- (id)valueForCoordinate:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
}

- (BOOL)isEqual:(id)a3
{
  return -[HKCoordinateTransform isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

@end
