@implementation IMDPlainTextTapbackInterpreter

- (IMDPlainTextTapbackInterpreter)init
{
  IMDPlainTextTapbackInterpreter *result;

  sub_1D1631294();
  return result;
}

- (id)interpretMessageItem:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  IMDPlainTextTapbackInterpreter *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  IMDPlainTextTapbackInterpreter.interpretMessageItem(_:in:)(v6, v7);
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
