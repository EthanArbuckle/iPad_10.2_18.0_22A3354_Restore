@implementation HKBarSeriesFillStyleBezierPaths

- (HKBarSeriesFillStyleBezierPaths)init
{
  HKBarSeriesFillStyleBezierPaths *v2;
  uint64_t v3;
  UIBezierPath *selectedBezierPath;
  uint64_t v5;
  UIBezierPath *unselectedBezierPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKBarSeriesFillStyleBezierPaths;
  v2 = -[HKBarSeriesFillStyleBezierPaths init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    selectedBezierPath = v2->_selectedBezierPath;
    v2->_selectedBezierPath = (UIBezierPath *)v3;

    v5 = objc_opt_new();
    unselectedBezierPath = v2->_unselectedBezierPath;
    v2->_unselectedBezierPath = (UIBezierPath *)v5;

  }
  return v2;
}

- (UIBezierPath)selectedBezierPath
{
  return self->_selectedBezierPath;
}

- (void)setSelectedBezierPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBezierPath, a3);
}

- (UIBezierPath)unselectedBezierPath
{
  return self->_unselectedBezierPath;
}

- (void)setUnselectedBezierPath:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedBezierPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedBezierPath, 0);
  objc_storeStrong((id *)&self->_selectedBezierPath, 0);
}

@end
