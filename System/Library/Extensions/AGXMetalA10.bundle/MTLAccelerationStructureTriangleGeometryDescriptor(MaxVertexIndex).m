@implementation MTLAccelerationStructureTriangleGeometryDescriptor(MaxVertexIndex)

- (uint64_t)maxVertexIndex
{
  if (!objc_msgSend(a1, "indexBuffer"))
    return 3 * objc_msgSend(a1, "triangleCount") - 1;
  if (objc_msgSend(a1, "indexType") == 1)
    return 0xFFFFFFFFLL;
  return 0xFFFFLL;
}

@end
