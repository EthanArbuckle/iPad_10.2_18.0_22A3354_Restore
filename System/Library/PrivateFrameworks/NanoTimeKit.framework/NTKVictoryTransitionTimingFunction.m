@implementation NTKVictoryTransitionTimingFunction

void __NTKVictoryTransitionTimingFunction_block_invoke(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  void *v5;

  LODWORD(a1) = 1051260355;
  LODWORD(a3) = 1059648963;
  LODWORD(a2) = 0;
  LODWORD(a4) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a1, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)NTKVictoryTransitionTimingFunction__function;
  NTKVictoryTransitionTimingFunction__function = v4;

}

@end
