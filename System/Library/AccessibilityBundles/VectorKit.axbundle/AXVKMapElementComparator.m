@implementation AXVKMapElementComparator

void __AXVKMapElementComparator_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_181, "copy");
  v1 = (void *)AXVKMapElementComparator::_MapElementComparator;
  AXVKMapElementComparator::_MapElementComparator = v0;

}

uint64_t __AXVKMapElementComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "accessibilityActivationPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "accessibilityActivationPoint");
  if (v8 <= v10 && (v8 == v10 ? (v11 = v6 <= v9) : (v11 = 1), v11))
  {
    LODWORD(v12) = v8 == v10;
    if (v6 >= v9)
      LODWORD(v12) = 0;
    if (v8 < v10)
      v12 = 1;
    else
      v12 = v12;
    v13 = v12 << 63 >> 63;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

@end
