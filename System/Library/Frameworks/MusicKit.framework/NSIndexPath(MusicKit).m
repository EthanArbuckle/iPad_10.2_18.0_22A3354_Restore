@implementation NSIndexPath(MusicKit)

+ (id)musicKit_indexPathForItem:()MusicKit inSection:
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a4;
  v5[1] = a3;
  objc_msgSend((id)objc_opt_class(), "indexPathWithIndexes:length:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
