@implementation PHVisualVoicemailManagerFactory

+ (id)getVisualVoiceMailWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  char *v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10028AA18, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  v8 = sub_1001517CC(v7, (uint64_t)sub_100108BB8, v6);

  swift_release(v6);
  return v8;
}

- (PHVisualVoicemailManagerFactory)init
{
  return (PHVisualVoicemailManagerFactory *)sub_1001518A4();
}

@end
