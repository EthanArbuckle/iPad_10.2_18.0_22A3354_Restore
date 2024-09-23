@implementation BSMutableSettings

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
  -[BSSettings _setObject:forSetting:]((uint64_t)self, a3, a4);
}

- (BOOL)_isMutable
{
  return 1;
}

- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4
{
  -[BSSettings _setFlag:forSetting:]((uint64_t)self, a3, a4);
}

- (void)applySettings:(id)a3
{
  objc_msgSend(a3, "_applyToSettings:", self);
}

@end
