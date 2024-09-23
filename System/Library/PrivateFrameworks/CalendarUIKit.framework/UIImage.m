@implementation UIImage

uint64_t __59__UIImage_CUIKPlatforms__cuik_drawImageWithSize_drawBlock___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "CGContext"));
}

- (void)cuik_drawAtPoint:(double)a3
{
  if (a1)
    return (void *)objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, a3, a4, 1.0);
  return a1;
}

void *__47__UIImage_CUIKPlatforms__cuik_imageWithInsets___block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "drawAtPoint:blendMode:alpha:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
  return result;
}

@end
