@implementation _SwiftDiagnosticPatternMatching

- (_SwiftDiagnosticPatternMatching)initWithType:(int)a3
{
  return (_SwiftDiagnosticPatternMatching *)DiagnosticPatternMatching.init(type:)(a3);
}

- (int)getMatcherType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____SwiftDiagnosticPatternMatching_type);
}

- (BOOL)isPatternPayloadAvailable
{
  _SwiftDiagnosticPatternMatching *v3;
  BOOL v4;
  _BYTE v6[24];
  uint64_t v7;

  sub_2390E9690((uint64_t)self + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)v6);
  if (v7)
  {
    v3 = self;
    v4 = sub_2390ED388();
    sub_2390E9450((uint64_t)v6);

  }
  else
  {
    sub_2390E9450((uint64_t)v6);
    return 0;
  }
  return v4;
}

- (BOOL)lookForPattern:(id)a3 :(BOOL)a4
{
  id v5;
  _SwiftDiagnosticPatternMatching *v6;

  v5 = a3;
  v6 = self;
  LOBYTE(self) = _s15CoreDiagnostics25DiagnosticPatternMatchingC07lookForD06report10takeActionSbAA10CriterialsC_SbtF_0(v5);

  return self & 1;
}

- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  _SwiftDiagnosticPatternMatching *v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = self;
  sub_2390E9CA0(v9, (uint64_t)sub_2390E9F74, v8);

  swift_release();
}

- (_SwiftDiagnosticPatternMatching)init
{
  _SwiftDiagnosticPatternMatching *result;

  result = (_SwiftDiagnosticPatternMatching *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2390E9450((uint64_t)self + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher);

}

@end
