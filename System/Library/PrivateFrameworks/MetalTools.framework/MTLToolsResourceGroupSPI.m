@implementation MTLToolsResourceGroupSPI

- (BOOL)containsResource:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "containsResource:", objc_msgSend(a3, "baseObject"));
}

@end
