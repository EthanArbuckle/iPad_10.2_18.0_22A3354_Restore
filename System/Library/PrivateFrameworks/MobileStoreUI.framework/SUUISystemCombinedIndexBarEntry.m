@implementation SUUISystemCombinedIndexBarEntry

- (SUUISystemCombinedIndexBarEntry)init
{
  SUUISystemCombinedIndexBarEntry *v2;
  SUUISystemCombinedIndexBarEntry *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISystemCombinedIndexBarEntry;
  v2 = -[SUUISystemCombinedIndexBarEntry init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUUIIndexBarEntry setEntryType:](v2, "setEntryType:", 3);
  return v3;
}

- (CGSize)_calculatedContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_dotDiameter");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIIndexBarEntry tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", x, y, width, height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fill");

}

+ (double)_dotDiameter
{
  return 4.0;
}

@end
