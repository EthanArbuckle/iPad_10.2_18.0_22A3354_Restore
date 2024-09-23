@implementation ICPaperSynapseContentItemProvider

+ (id)contentItemsForAttachment:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  _s11NotesShared33ICPaperSynapseContentItemProviderC12contentItems13forAttachmentSaySo09SYContentF0CGSo12ICAttachmentC_tFZ_0(v3);

  sub_1BDBB6CC8();
  v4 = (void *)sub_1BDBFD9C8();
  swift_bridgeObjectRelease();
  return v4;
}

- (ICPaperSynapseContentItemProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICPaperSynapseContentItemProvider();
  return -[ICPaperSynapseContentItemProvider init](&v3, sel_init);
}

@end
