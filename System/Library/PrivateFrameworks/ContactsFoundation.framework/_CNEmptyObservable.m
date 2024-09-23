@implementation _CNEmptyObservable

- (id)subscribe:(id)a3
{
  objc_msgSend(a3, "observerDidComplete");
  return objc_alloc_init(_CNEmptyObservableCancelationToken);
}

- (id)debugPipelineDescription
{
  return CFSTR("Empty Observable");
}

@end
