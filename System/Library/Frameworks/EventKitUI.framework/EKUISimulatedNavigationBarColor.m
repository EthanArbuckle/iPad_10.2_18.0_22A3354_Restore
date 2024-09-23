@implementation EKUISimulatedNavigationBarColor

id __EKUISimulatedNavigationBarColor_block_invoke(uint64_t a1, void *a2)
{
  double v2;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    v2 = 0.0705882353;
  else
    v2 = 0.968627451;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v2, v2, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
