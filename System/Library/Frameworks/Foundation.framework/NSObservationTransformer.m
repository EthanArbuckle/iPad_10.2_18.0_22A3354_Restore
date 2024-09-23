@implementation NSObservationTransformer

+ (id)mapValuesWithBlock:(id)a3
{
  return -[NSMapObservationTransformer initWithBlock:tag:]([NSMapObservationTransformer alloc], "initWithBlock:tag:", a3, 1);
}

+ (id)mapErrorsWithBlock:(id)a3
{
  return -[NSMapObservationTransformer initWithBlock:tag:]([NSMapObservationTransformer alloc], "initWithBlock:tag:", a3, 2);
}

@end
