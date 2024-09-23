@implementation ICNestedContentInfo

- (ICNestedContentInfo)init
{
  _OWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;
  objc_super v9;

  v2 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_frame);
  *v2 = 0u;
  v2[1] = 0u;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICNestedContentInfo_contentSize);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICNestedContentInfo_contentOffset);
  *v4 = 0;
  v4[1] = 0;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_scrollBounds);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_adjustedContentInset);
  v7 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v6 = *MEMORY[0x1E0DC49E8];
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NestedContentInfo();
  return -[ICNestedContentInfo init](&v9, sel_init);
}

@end
