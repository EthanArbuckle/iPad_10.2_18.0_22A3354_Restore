@implementation PDFPageRangePrivate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->page);
}

@end
