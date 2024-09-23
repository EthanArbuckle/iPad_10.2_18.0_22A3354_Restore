@implementation PHVisualVoicemailManagerFactory

+ (id)getVisualVoiceMailWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  char *v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10007EFB0, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain(v6);
  v8 = sub_10003D3A0(v7, (uint64_t)sub_10003DBD0, v6);

  swift_release(v6);
  return v8;
}

- (PHVisualVoicemailManagerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisualVoicemailManagerFactory();
  return -[PHVisualVoicemailManagerFactory init](&v3, "init");
}

@end
