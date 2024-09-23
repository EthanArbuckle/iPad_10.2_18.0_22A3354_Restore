@implementation MRUViewServiceProvider

+ (id)viewControllerForConfiguration:(id)a3
{
  id v3;
  MRUSessionsContainerViewController *v4;

  v3 = a3;
  if (+[MRUFeatureFlagProvider isCayenneEnabled](MRUFeatureFlagProvider, "isCayenneEnabled"))
  {
    v4 = objc_alloc_init(MRUSessionsContainerViewController);
    -[MRUSessionsContainerViewController setConfiguration:](v4, "setConfiguration:", v3);
  }
  else
  {
    v4 = objc_alloc_init(MRUViewServiceContainerViewController);
  }

  return v4;
}

@end
