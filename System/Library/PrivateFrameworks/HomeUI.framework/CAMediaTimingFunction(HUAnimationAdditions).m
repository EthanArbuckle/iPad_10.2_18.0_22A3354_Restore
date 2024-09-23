@implementation CAMediaTimingFunction(HUAnimationAdditions)

+ (id)hu_functionWithAnimationCurve:()HUAnimationAdditions
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", **((_QWORD **)&unk_1E6F59F98 + a3), v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
