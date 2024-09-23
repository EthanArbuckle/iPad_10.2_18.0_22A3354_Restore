@implementation FloatingTabAction

- (NSString)description
{
  return (NSString *)sub_1D602EE80(self, (uint64_t)a2, (void (*)(void))sub_1D602EED8);
}

- (_TtC7NewsUI217FloatingTabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = _Block_copy(a6);
  v8 = sub_1D6E26978();
  v10 = v9;
  v11 = sub_1D6E26978();
  v13 = v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v7;
  v15 = a5;
  return (_TtC7NewsUI217FloatingTabAction *)sub_1D602F068(v8, v10, v11, v13, a5, (uint64_t)sub_1D602F30C, v14);
}

@end
