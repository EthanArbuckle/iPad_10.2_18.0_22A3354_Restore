@implementation HKSeparatorLineView(HRAtrialFibrillationGateAddition)

+ (id)_hrafibgate_separatorView
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE4A838]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setColor:", v1);

  HKUIFloorToScreenScale();
  objc_msgSend(v0, "setSeparatorThickness:");
  objc_msgSend(v0, "setDashStyle:", 0);
  return v0;
}

@end
