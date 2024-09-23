@implementation _EARUserProfileContainer(SFUtilitiesAdditions)

- (id)loadDate
{
  return objc_getAssociatedObject(a1, &kEARUserProfileContainerLoadDateKey);
}

- (void)setLoadDate:()SFUtilitiesAdditions
{
  objc_setAssociatedObject(a1, &kEARUserProfileContainerLoadDateKey, a3, (void *)3);
}

@end
