@implementation NSMutableSet(CoreDAVExtensions)

- (void)CDVAddItemParserMappingWithNameSpace:()CoreDAVExtensions name:parseClass:
{
  id v8;
  id v9;
  CoreDAVItemParserMapping *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", v9, v8, a5);

  objc_msgSend(a1, "addObject:", v10);
}

@end
