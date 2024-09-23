@implementation NSLayoutConstraintDiffConstraints

uint64_t ___NSLayoutConstraintDiffConstraints_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  double v8;
  double v9;
  double v10;

  if (a2 == a3)
    return 0;
  v5 = objc_msgSend(a2, "_constraintValueHashIncludingConstant:includeOtherMutableProperties:", 0, 0);
  v6 = objc_msgSend(a3, "_constraintValueHashIncludingConstant:includeOtherMutableProperties:", 0, 0);
  if (v5 < v6)
    return -2;
  if (v5 > v6)
    return 2;
  if ((objc_msgSend(a2, "_isEqualToConstraintValue:includingConstant:includeOtherMutableProperties:", a3, 0, 0) & 1) != 0)
  {
    objc_msgSend(a2, "constant");
    v9 = v8;
    objc_msgSend(a3, "constant");
    if (v9 < v10)
      return -1;
    else
      return v9 > v10;
  }
  else if (a2 < a3)
  {
    return -2;
  }
  else
  {
    return 2;
  }
}

@end
