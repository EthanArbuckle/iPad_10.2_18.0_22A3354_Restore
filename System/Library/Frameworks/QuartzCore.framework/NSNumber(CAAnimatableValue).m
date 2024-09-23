@implementation NSNumber(CAAnimatableValue)

- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "doubleValue");
  v7 = v6;
  objc_msgSend(a3, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 + v8 * (double)a4);
}

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;

  objc_msgSend(a1, "doubleValue");
  v7 = v6;
  objc_msgSend(a4, "doubleValue");
  v9 = (v8 - v7) * a2;
  v10 = v7 == v8;
  v11 = 0.0;
  if (!v10)
    v11 = v9;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 + v7);
}

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(a1, "doubleValue");
  v11 = v10;
  objc_msgSend(a4, "doubleValue");
  v13 = v12;
  if (!a3)
  {
    v15 = -(v12 + v11 * -2.0);
    if (a5)
      goto LABEL_3;
LABEL_5:
    v16 = -(v11 + v13 * -2.0);
    return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6[2] * v11+ a6[3] * (a6[10] * (v11 - v15) + a6[11] * (v13 - v11))+ a6[4] * v13+ a6[5] * (a6[12] * (v13 - v11) + a6[13] * (v16 - v13)));
  }
  objc_msgSend(a3, "doubleValue");
  v15 = v14;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a5, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6[2] * v11+ a6[3] * (a6[10] * (v11 - v15) + a6[11] * (v13 - v11))+ a6[4] * v13+ a6[5] * (a6[12] * (v13 - v11) + a6[13] * (v16 - v13)));
}

- (uint64_t)CA_roundToIntegerFromValue:()CAAnimatableValue
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "doubleValue");
  v5 = v4;
  objc_msgSend(a3, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v5 - v6) + v6);
}

- (double)CA_distanceToValue:()CAAnimatableValue
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "doubleValue");
  v5 = v4;
  objc_msgSend(a3, "doubleValue");
  return vabdd_f64(v5, v6);
}

@end
