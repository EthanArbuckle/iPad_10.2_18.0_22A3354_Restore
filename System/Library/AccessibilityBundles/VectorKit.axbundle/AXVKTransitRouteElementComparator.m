@implementation AXVKTransitRouteElementComparator

void __AXVKTransitRouteElementComparator_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_184, "copy");
  v1 = (void *)AXVKTransitRouteElementComparator::_TransitRouteElementComparator;
  AXVKTransitRouteElementComparator::_TransitRouteElementComparator = v0;

}

uint64_t __AXVKTransitRouteElementComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "sortKey");
  v6 = objc_msgSend(v4, "sortKey");
  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

@end
