@implementation MPMediaItem(CarDisplay)

- (id)albumImageWithFallbackForSize:()CarDisplay doubleLineRow:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithSize:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("music.square.stack"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
