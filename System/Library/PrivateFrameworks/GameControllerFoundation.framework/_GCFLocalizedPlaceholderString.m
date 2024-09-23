@implementation _GCFLocalizedPlaceholderString

+ (__objc2_class)sharedPlaceholderString
{
  objc_opt_self();
  return &sharedPlaceholderString_PlaceholderString;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (id)_realizedString
{
  return &stru_1EA4D5008;
}

- (id)key
{
  return &stru_1EA4D5008;
}

- (unint64_t)length
{
  return 0;
}

@end
