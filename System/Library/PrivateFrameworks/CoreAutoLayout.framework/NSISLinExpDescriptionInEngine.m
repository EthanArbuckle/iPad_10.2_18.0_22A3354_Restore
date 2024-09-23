@implementation NSISLinExpDescriptionInEngine

uint64_t __NSISLinExpDescriptionInEngine_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "variableForEngineVarIndex:", a2);
  if (v5)
    v6 = objc_msgSend(v5, "descriptionInEngine:", *(_QWORD *)(a1 + 32));
  else
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2), "description");
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR(" + %g*%@"), NSISLinExpCoefficientForVar(*(_QWORD *)(a1 + 48), v4), v6);
}

@end
