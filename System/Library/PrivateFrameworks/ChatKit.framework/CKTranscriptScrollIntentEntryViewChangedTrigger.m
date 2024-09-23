@implementation CKTranscriptScrollIntentEntryViewChangedTrigger

- (CKTranscriptScrollIntentEntryViewChangedTrigger)initWithEntryView:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5 isSendLaterPluginChange:(BOOL)a6
{
  id v9;
  CKTranscriptScrollIntentEntryViewChangedTrigger *v10;

  v9 = a3;
  v10 = (CKTranscriptScrollIntentEntryViewChangedTrigger *)sub_18E51CD58(v9, a4, a5, a6);

  return v10;
}

- (id)updateRequestWithUpdateContext:(id)a3
{
  id v4;
  CKTranscriptScrollIntentEntryViewChangedTrigger *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_18E51C280(v4);

  return v6;
}

- (CKTranscriptScrollIntentEntryViewChangedTrigger)init
{
  CKTranscriptScrollIntentEntryViewChangedTrigger *result;

  result = (CKTranscriptScrollIntentEntryViewChangedTrigger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
