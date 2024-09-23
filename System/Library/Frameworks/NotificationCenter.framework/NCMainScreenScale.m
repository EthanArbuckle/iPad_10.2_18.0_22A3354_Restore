@implementation NCMainScreenScale

void __NCMainScreenScale_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  NCMainScreenScale___mainScreenScale = v1;

  if (*(double *)&NCMainScreenScale___mainScreenScale <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", *(double *)&NCMainScreenScale___mainScreenScale);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat NCMainScreenScale(void)_block_invoke");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("NCWidgetMetrics.m"), 25, CFSTR("Failed to initialized main screen scale!"));

  }
}

@end
