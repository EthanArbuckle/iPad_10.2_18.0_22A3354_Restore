@implementation CNStringEvaluateWithUCharTest

id __CNStringEvaluateWithUCharTest_block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
