@implementation TIUIGetProposedMultilingualSetsForAddingInputMode

uint64_t __TIUIGetProposedMultilingualSetsForAddingInputMode_block_invoke(uint64_t a1, void *a2)
{
  return TIUIGetProposedInputModeIsValid(a2) ^ 1;
}

@end
