@implementation AVTFlattenImageWithColor

uint64_t __AVTFlattenImageWithColor_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set");
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
}

@end
