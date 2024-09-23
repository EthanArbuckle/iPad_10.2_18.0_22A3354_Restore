@implementation IMDBackwardCompatibilityMessageIdentifier

+ (IMDBackwardCompatibilityMessageIdentifier)sharedIdentifier
{
  if (qword_1EFC63CA8 != -1)
    dispatch_once(&qword_1EFC63CA8, &unk_1E9228D20);
  return (IMDBackwardCompatibilityMessageIdentifier *)(id)qword_1EFC63CA0;
}

- (IMDBackwardCompatibilityMessageIdentifier)init
{
  IMDBackwardCompatibilityMessageIdentifier *v2;
  __IMDBackwardCompatibilityMessageIdentifier *v3;
  __IMDBackwardCompatibilityMessageIdentifier *swiftImplementation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDBackwardCompatibilityMessageIdentifier;
  v2 = -[IMDBackwardCompatibilityMessageIdentifier init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(__IMDBackwardCompatibilityMessageIdentifier);
    swiftImplementation = v2->_swiftImplementation;
    v2->_swiftImplementation = v3;

  }
  return v2;
}

- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4
{
  return -[__IMDBackwardCompatibilityMessageIdentifier isIgnorableBackwardCompatibilityMessage:inChat:](self->_swiftImplementation, "isIgnorableBackwardCompatibilityMessage:inChat:", a3, a4);
}

- (__IMDBackwardCompatibilityMessageIdentifier)swiftImplementation
{
  return self->_swiftImplementation;
}

- (void)setSwiftImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_swiftImplementation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftImplementation, 0);
}

@end
