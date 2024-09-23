@implementation C3DFXTechniqueCreateSpotShadow

uint64_t __C3DFXTechniqueCreateSpotShadow_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SceneKit-spotShadowDepth"), *(_QWORD *)(a1 + 32));
}

@end
