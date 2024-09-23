@implementation CKLStreamTrafficConsoleLogObserver

- (CKLStreamTrafficConsoleLogObserver)initWithLogTypes:(unint64_t)a3
{
  CKLStreamTrafficConsoleLogObserver *v3;
  const char *v4;
  CKLStreamTrafficConsoleLogObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLStreamTrafficConsoleLogObserver;
  v3 = -[CKLStreamTrafficObserver initWithLogTypes:](&v7, sel_initWithLogTypes_, a3);
  v5 = v3;
  if (v3)
    objc_msgSend_setRequestParsedBlock_(v3, v4, (uint64_t)&unk_1E78337D8);
  return v5;
}

@end
