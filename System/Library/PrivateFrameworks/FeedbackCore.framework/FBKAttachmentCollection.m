@implementation FBKAttachmentCollection

- (FBKAttachmentCollection)initWithAttachmentManager:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  FBKAttachmentCollection *v9;
  FBKAttachmentCollection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKAttachmentCollection;
  v9 = -[FBKAttachmentCollection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentManager, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (FBKAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentManager, a3);
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

- (NSString)description
{
  FBKAttachmentCollection *v2;
  void *v3;

  v2 = self;
  FBKAttachmentCollection.description.getter();

  v3 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)state
{
  FBKAttachmentCollection *v2;
  FBKAttachmentManager *v3;
  unint64_t v4;

  v2 = self;
  v3 = -[FBKAttachmentCollection attachmentManager](v2, sel_attachmentManager);
  v4 = -[FBKAttachmentManager state](v3, sel_state);

  return v4;
}

- (DEDBugSession)bugSession
{
  FBKAttachmentCollection *v2;
  FBKAttachmentManager *v3;
  FBKDECollector *v4;
  id v5;

  v2 = self;
  v3 = -[FBKAttachmentCollection attachmentManager](v2, sel_attachmentManager);
  v4 = -[FBKAttachmentManager deCollector](v3, sel_deCollector);
  v5 = -[FBKDECollector bugSession](v4, sel_bugSession);

  return (DEDBugSession *)v5;
}

- (NSArray)attachments
{
  FBKAttachmentCollection *v2;
  FBKAttachmentManager *v3;
  NSArray *v4;
  void *v5;

  v2 = self;
  v3 = -[FBKAttachmentCollection attachmentManager](v2, sel_attachmentManager);
  v4 = -[FBKAttachmentManager attachments](v3, sel_attachments);

  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  sub_21DAC496C();

  v5 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (BOOL)isRequired
{
  FBKAttachmentCollection *v2;
  FBKAttachmentManager *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = self;
  v3 = -[FBKAttachmentCollection attachmentManager](v2, sel_attachmentManager);
  v4 = FBKAttachmentManager.requiredMatcherPredicates.getter();

  if ((v4 & 0xC000000000000001) != 0)
    v5 = sub_21DAC4C30();
  else
    v5 = *(_QWORD *)(v4 + 16);

  swift_bridgeObjectRelease();
  return v5 > 0;
}

- (NSSet)additionalMatchers
{
  FBKAttachmentCollection *v2;
  FBKAttachmentManager *v3;
  void *v4;

  v2 = self;
  v3 = -[FBKAttachmentCollection attachmentManager](v2, sel_attachmentManager);
  FBKAttachmentManager.additionalMatcherPredicates.getter();

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v4 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (BOOL)isAlreadyCollectingThisMatcher:(id)a3 ignoreAdditional:(BOOL)a4
{
  id v6;
  FBKAttachmentCollection *v7;
  char v8;

  v6 = a3;
  v7 = self;
  v8 = sub_21DA73624(v6, a4);

  return v8 & 1;
}

- (id)updateMatcherPredicatesWithUpdatedMatchers:(id)a3 allRequiredMatchers:(id)a4 formPlatform:(id)a5
{
  uint64_t v7;
  void *v8;
  FBKAttachmentCollection *v9;
  void *v10;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v7 = sub_21DAC49D8();
  v8 = (void *)sub_21DAC49D8();
  if (a5)
    sub_21DAC481C();
  v9 = self;
  sub_21DA8C528(v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)replaceEmptyAttachmentsWithAdditionalMatchersWithAdditional:(id)a3
{
  id v4;
  NSArray *v5;
  unint64_t v6;
  FBKAttachmentCollection *v7;
  FBKAttachmentCollection *v8;
  FBKAttachmentCollection *v9;

  v4 = a3;
  v9 = self;
  v5 = -[FBKAttachmentCollection attachments](v9, sel_attachments);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v6 = sub_21DAC496C();

  v7 = (FBKAttachmentCollection *)v4;
  v8 = (FBKAttachmentCollection *)sub_21DA88E4C(v6, v7);
  swift_bridgeObjectRelease();

  if (v8)
  {
    -[FBKAttachmentCollection setRequirement:](v8, sel_setRequirement_, v7);

    v7 = v9;
    v9 = v8;
  }

}

- (BOOL)replacePreviousAdditionalMatchersWithRequiredMatchersIfNeededWithRequired:(id)a3
{
  id v4;
  FBKAttachmentCollection *v5;
  NSArray *v6;
  unint64_t v7;
  FBKAttachmentCollection *v8;
  FBKAttachmentCollection *v9;

  v4 = a3;
  v5 = self;
  v6 = -[FBKAttachmentCollection attachments](v5, sel_attachments);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v7 = sub_21DAC496C();

  v8 = (FBKAttachmentCollection *)v4;
  v9 = (FBKAttachmentCollection *)sub_21DA89058(v7, v8);
  swift_bridgeObjectRelease();

  if (v9)
  {
    -[FBKAttachmentCollection setRequirement:](v9, sel_setRequirement_, v8);

    v8 = v5;
    v5 = v9;
  }

  return v9 != 0;
}

- (BOOL)hasAnyAttachmentCollectedOrCollecting
{
  FBKAttachmentCollection *v2;
  char v3;

  v2 = self;
  v3 = sub_21DA73DBC();

  return v3 & 1;
}

@end
