@implementation RWIProtocolDOMNode

BOOL __64__RWIProtocolDOMNode_AirPlayKit__maximumIndexPathFromIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "length");
  v6 = objc_msgSend(v4, "length");

  return v5 < v6;
}

@end
