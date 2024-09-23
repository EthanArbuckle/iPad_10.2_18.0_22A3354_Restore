@implementation PKDetectionQueryItem

- (NSSet)strokeIdentifiers
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (UIBezierPath)baselinePath
{
  return (UIBezierPath *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
}

@end
