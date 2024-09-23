@implementation FMHairlineConstraint

- (double)pixelHeight
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  -[FMHairlineConstraint constant](self, "constant");
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v3 * v5;

  return v6;
}

- (void)setPixelHeight:(double)a3
{
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  -[FMHairlineConstraint setConstant:](self, "setConstant:", a3 / v5);

}

@end
