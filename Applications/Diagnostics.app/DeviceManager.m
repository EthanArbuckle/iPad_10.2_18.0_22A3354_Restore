@implementation DeviceManager

- (void)device:(id)a3 shouldStartTestWithTestId:(id)a4 fullscreen:(BOOL)a5 response:(id)a6
{
  void *v10;
  id v11;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  swift_unknownObjectRetain(a3);
  v11 = a4;
  swift_retain(self);
  sub_1000A6464(a3, a5, (uint64_t)self, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease(a3);

  swift_release(self);
}

- (void)device:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10013A858, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  swift_unknownObjectRetain(a3);
  v10 = a4;
  swift_retain(self);
  sub_1000A4590((uint64_t)a3, (uint64_t)v10, (uint64_t)sub_1000A6150, v9);
  swift_unknownObjectRelease(a3);

  swift_release(self);
  swift_release(v9);
}

- (void)device:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  void *v8;
  uint64_t v9;
  DARootViewController *v10;
  uint64_t v11;
  SEL v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = _Block_copy(a5);
  v9 = sub_100037118(0, &qword_10016D608, ASTSelfServiceDestination_ptr);
  v10 = (DARootViewController *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = swift_allocObject(&unk_10013A830, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  sub_1000A4770((uint64_t)a3, (uint64_t)v10, (uint64_t)sub_1000A6140, v11);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  swift_bridgeObjectRelease(v10, v12, v13, v14, v15, v16, v17, v18);
  swift_release(v11);
}

- (void)device:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;

  swift_unknownObjectRetain(a3);
  v11 = a4;
  v12 = a5;
  swift_retain(self);
  v13 = a6;
  sub_1000A4920((uint64_t)a3, (uint64_t)v11, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease(a3);

  swift_release(self);
}

@end
