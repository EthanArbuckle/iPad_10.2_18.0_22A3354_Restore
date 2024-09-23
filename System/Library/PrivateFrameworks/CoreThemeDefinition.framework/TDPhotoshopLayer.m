@implementation TDPhotoshopLayer

- (id)hierarchicalLayerNames
{
  void *v3;
  id result;

  v3 = (void *)objc_msgSend((id)-[TDPhotoshopLayer parentLayer](self, "parentLayer"), "hierarchicalLayerNames");
  if (objc_msgSend(v3, "count") && objc_msgSend((id)-[TDPhotoshopLayer name](self, "name"), "length"))
    return (id)objc_msgSend(v3, "arrayByAddingObject:", -[TDPhotoshopLayer name](self, "name"));
  result = (id)objc_msgSend((id)-[TDPhotoshopLayer name](self, "name"), "length");
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", -[TDPhotoshopLayer name](self, "name"));
  return result;
}

@end
