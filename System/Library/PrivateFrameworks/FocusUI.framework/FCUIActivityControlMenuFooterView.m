@implementation FCUIActivityControlMenuFooterView

void *__99___FCUIActivityControlMenuFooterView__visualStylingProvider_didChangeForCategory_outgoingProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD aBlock[5];

  objc_msgSend(a3, "alpha");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __99___FCUIActivityControlMenuFooterView__visualStylingProvider_didChangeForCategory_outgoingProvider___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  return _Block_copy(aBlock);
}

uint64_t __99___FCUIActivityControlMenuFooterView__visualStylingProvider_didChangeForCategory_outgoingProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

void *__73___FCUIActivityControlMenuFooterView__configureHightlightViewIfNecessary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD aBlock[5];

  objc_msgSend(a3, "alpha");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___FCUIActivityControlMenuFooterView__configureHightlightViewIfNecessary__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  return _Block_copy(aBlock);
}

uint64_t __73___FCUIActivityControlMenuFooterView__configureHightlightViewIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

@end
