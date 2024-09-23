@implementation UIView

- (void)shake
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.translation.x")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v5, "setTimingFunction:", v3);

  objc_msgSend(v5, "setDuration:", 0.6);
  objc_msgSend(v5, "setValues:", &off_1000EEAC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("shake"));

}

- (id)superviewWithClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v5 = v6;
      if (!v6)
      {
        v7 = 0;
        goto LABEL_8;
      }
    }
    v7 = v5;
    v6 = v7;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
LABEL_8:

  return v7;
}

@end
