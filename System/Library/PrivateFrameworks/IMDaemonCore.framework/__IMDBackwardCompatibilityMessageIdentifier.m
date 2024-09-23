@implementation __IMDBackwardCompatibilityMessageIdentifier

- (__IMDBackwardCompatibilityMessageIdentifier)init
{
  uint64_t v3;
  objc_class *v4;
  __IMDBackwardCompatibilityMessageIdentifier *v5;
  objc_super v7;

  v3 = OBJC_IVAR_____IMDBackwardCompatibilityMessageIdentifier_parser;
  sub_1D141AC58(&qword_1EFC61598);
  v4 = (objc_class *)swift_allocObject();
  *((_QWORD *)v4 + 2) = MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + v3) = v4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BackwardCompatibilityMessageIdentifier();
  v5 = -[__IMDBackwardCompatibilityMessageIdentifier init](&v7, sel_init);
  sub_1D15FAB7C();

  return v5;
}

- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  __IMDBackwardCompatibilityMessageIdentifier *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D15F9738(v6, v7);
  v10 = v9;

  return v10 & 1;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
