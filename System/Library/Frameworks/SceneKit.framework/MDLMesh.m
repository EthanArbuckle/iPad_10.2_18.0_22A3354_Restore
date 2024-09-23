@implementation MDLMesh

uint64_t __59__MDLMesh_SCNModelIO__meshWithSCNGeometry_bufferAllocator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticVertex"));
}

@end
