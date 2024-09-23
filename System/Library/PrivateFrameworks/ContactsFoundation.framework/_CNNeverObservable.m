@implementation _CNNeverObservable

- (id)subscribe:(id)a3
{
  return objc_alloc_init(CNCancelationToken);
}

- (id)debugPipelineDescription
{
  return CFSTR("Never Observable");
}

@end
