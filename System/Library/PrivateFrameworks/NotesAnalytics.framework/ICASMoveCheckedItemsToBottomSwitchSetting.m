@implementation ICASMoveCheckedItemsToBottomSwitchSetting

- (ICASMoveCheckedItemsToBottomSwitchSetting)initWithMoveCheckedItemsToBottomSwitchSetting:(int64_t)a3
{
  ICASMoveCheckedItemsToBottomSwitchSetting *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASMoveCheckedItemsToBottomSwitchSetting;
  result = -[ICASMoveCheckedItemsToBottomSwitchSetting init](&v5, sel_init);
  if (result)
    result->_moveCheckedItemsToBottomSwitchSetting = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASMoveCheckedItemsToBottomSwitchSetting moveCheckedItemsToBottomSwitchSetting](self, "moveCheckedItemsToBottomSwitchSetting", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("automatic");
  if (v3 == 2)
    return CFSTR("manual");
  else
    return (id)v4;
}

- (int64_t)moveCheckedItemsToBottomSwitchSetting
{
  return self->_moveCheckedItemsToBottomSwitchSetting;
}

@end
