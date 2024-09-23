@implementation SSHKeyParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  _TtC11ActionKitUI28SSHKeyParameterSummaryEditor *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_21EB76908();

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC11ActionKitUI28SSHKeyParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_21EB762F0((uint64_t)&unk_255478628, v5);
}

- (_TtC11ActionKitUI28SSHKeyParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  _TtC11ActionKitUI28SSHKeyParameterSummaryEditor *result;

  sub_21EB77198(a3, a4, a5);
  return result;
}

- (void).cxx_destruct
{

}

@end
