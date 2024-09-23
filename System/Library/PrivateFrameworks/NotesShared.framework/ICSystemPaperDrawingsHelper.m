@implementation ICSystemPaperDrawingsHelper

+ (id)drawingsForAttachment:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  _s11NotesShared27ICSystemPaperDrawingsHelperC21drawingsForAttachmentySay9PencilKit9PKDrawingVGSo12ICAttachmentCFZ_0(v3);

  sub_1BDBFD5A8();
  v4 = (void *)sub_1BDBFD9C8();
  swift_bridgeObjectRelease();
  return v4;
}

- (ICSystemPaperDrawingsHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICSystemPaperDrawingsHelper();
  return -[ICSystemPaperDrawingsHelper init](&v3, sel_init);
}

@end
