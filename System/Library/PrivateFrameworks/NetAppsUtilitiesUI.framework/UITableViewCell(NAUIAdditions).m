@implementation UITableViewCell(NAUIAdditions)

+ (id)naui_prototypeCell
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:reuseIdentifier:", 0, 0);
}

+ (uint64_t)naui_supportsAutoLayout
{
  return 0;
}

+ (double)naui_tableRowHeight
{
  int v1;
  double result;

  v1 = objc_msgSend(a1, "naui_supportsAutoLayout");
  result = *MEMORY[0x24BDF7DE0];
  if (!v1)
    return 44.0;
  return result;
}

+ (double)naui_estimatedTableRowHeight
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "naui_prototypeCell");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateConstraintsIfNeeded");
  objc_msgSend(v1, "layoutIfNeeded");
  objc_msgSend(v1, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8));
  v3 = v2;

  return v3;
}

@end
