@implementation CNMakeErrorHelper

id __CNMakeErrorHelper_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  result = (id)objc_claimAutoreleasedReturnValue();
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
