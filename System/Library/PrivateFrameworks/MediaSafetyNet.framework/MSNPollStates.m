@implementation MSNPollStates

void __MSNPollStates_block_invoke(uint64_t a1, int a2)
{
  int v2;

  v2 = a2 == 3;
  if (a2 == 2)
    v2 = 2;
  g_pillState = v2;
}

@end
