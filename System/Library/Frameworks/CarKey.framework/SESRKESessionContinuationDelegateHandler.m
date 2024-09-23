@implementation SESRKESessionContinuationDelegateHandler

- (void)sesSession:(id)a3 didReceiveContinuationRequestFor:(id)a4 actionIdentifier:(id)a5 arbitraryData:(id)a6 fromVehicle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler *v24;

  if (a6)
  {
    v12 = a3;
    v13 = a4;
    v14 = a5;
    v15 = a7;
    v16 = self;
    v17 = a6;
    v18 = sub_2158FEE88();
    v20 = v19;

  }
  else
  {
    v21 = a3;
    v22 = a4;
    v23 = a5;
    v24 = self;
    v18 = 0;
    v20 = 0xF000000000000000;
  }
  sub_2158FE11C(v18, v20);
  sub_2158FE294(v18, v20);

}

- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler)init
{
  _TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler *result;

  result = (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2158FEC84((uint64_t)self+ OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate, &qword_254DE9C38);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_session));
}

@end
