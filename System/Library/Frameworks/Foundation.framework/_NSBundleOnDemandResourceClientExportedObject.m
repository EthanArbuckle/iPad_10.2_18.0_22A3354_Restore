@implementation _NSBundleOnDemandResourceClientExportedObject

- (void)sendLowDiskSpaceNotification
{
  -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("NSBundleResourceRequestLowDiskSpaceNotification"), 0);
}

@end
