@implementation PDFPageBackgroundManagerPrivate

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->workQueue, 0);
  for (i = 48; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_destroyWeak((id *)&self->renderingProperties);
  objc_destroyWeak((id *)&self->documentDelegate);
}

@end
