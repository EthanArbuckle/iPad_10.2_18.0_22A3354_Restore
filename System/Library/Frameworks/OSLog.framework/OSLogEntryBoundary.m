@implementation OSLogEntryBoundary

- (OSLogEntryBoundary)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OSLogEntryBoundary;
  return -[OSLogEntry initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
