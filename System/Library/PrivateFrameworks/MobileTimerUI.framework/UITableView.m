@implementation UITableView

uint64_t __47__UITableView_MTUIUtil__wordWrapParagraphStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDF6748]);
  v1 = (void *)wordWrapParagraphStyle_style;
  wordWrapParagraphStyle_style = (uint64_t)v0;

  return objc_msgSend((id)wordWrapParagraphStyle_style, "setLineBreakMode:", 0);
}

@end
