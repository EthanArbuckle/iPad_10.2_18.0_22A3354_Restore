@implementation DrawSilhouetteInContext

uint64_t __DrawSilhouetteInContext_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __DrawSilhouetteInContext_block_invoke_2(uint64_t a1)
{
  CGPathRelease(*(CGPathRef *)(a1 + 32));
}

void __DrawSilhouetteInContext_block_invoke(uint64_t a1)
{
  CGContextRestoreGState(*(CGContextRef *)(a1 + 32));
}

@end
