@implementation IconImageViewControllerCache

- (void)purgeCache
{
  objc_msgSend(*(id *)self->cache, sel_removeAllObjects);
}

@end
