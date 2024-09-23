@implementation objcDiagnosticPatternMatching

- (objcDiagnosticPatternMatching)initWithType:(int)a3
{
  _SwiftDiagnosticPatternMatching *v4;
  _SwiftDiagnosticPatternMatching *swiftDiagnosticPatternMatching;

  v4 = -[_SwiftDiagnosticPatternMatching initWithType:]([_SwiftDiagnosticPatternMatching alloc], "initWithType:", *(_QWORD *)&a3);
  swiftDiagnosticPatternMatching = self->_swiftDiagnosticPatternMatching;
  self->_swiftDiagnosticPatternMatching = v4;

  return self;
}

- (objcDiagnosticPatternMatching)initWithSwiftDiagnosticPatternMatching:(id)a3
{
  id v5;
  objcDiagnosticPatternMatching *v6;
  objcDiagnosticPatternMatching *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)objcDiagnosticPatternMatching;
  v6 = -[objcDiagnosticPatternMatching init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_swiftDiagnosticPatternMatching, a3);

  return v7;
}

- (int)getMatcherType
{
  return -[_SwiftDiagnosticPatternMatching getMatcherType](self->_swiftDiagnosticPatternMatching, "getMatcherType");
}

- (BOOL)isPatternPayloadAvailable
{
  return -[_SwiftDiagnosticPatternMatching isPatternPayloadAvailable](self->_swiftDiagnosticPatternMatching, "isPatternPayloadAvailable");
}

- (BOOL)lookForPattern:(id)a3 :(BOOL)a4
{
  return -[_SwiftDiagnosticPatternMatching lookForPattern::](self->_swiftDiagnosticPatternMatching, "lookForPattern::", a3, a4);
}

- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5
{
  -[_SwiftDiagnosticPatternMatching lookForPatternAsync:::](self->_swiftDiagnosticPatternMatching, "lookForPatternAsync:::", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftDiagnosticPatternMatching, 0);
}

@end
