@implementation AVTPoseRoundingBehaviour

void ___AVTPoseRoundingBehaviour_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 6, 0, 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AVTPoseRoundingBehaviour_behavior;
  _AVTPoseRoundingBehaviour_behavior = v0;

}

@end
