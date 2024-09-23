@implementation NSObject(WFTyping)

- (WFObjectType)wfType
{
  return +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
}

@end
