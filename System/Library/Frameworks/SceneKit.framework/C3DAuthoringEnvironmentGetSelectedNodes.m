@implementation C3DAuthoringEnvironmentGetSelectedNodes

uint64_t __C3DAuthoringEnvironmentGetSelectedNodes_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = objc_msgSend(a2, "authoringEnvironmentCompanionNode");
  v5 = *(void **)(a1 + 32);
  if (v4)
    v2 = (void *)objc_msgSend(v2, "authoringEnvironmentCompanionNode");
  return objc_msgSend(v5, "addObject:", objc_msgSend(v2, "nodeRef"));
}

@end
