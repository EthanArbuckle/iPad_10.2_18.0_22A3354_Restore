@implementation NSObservationSink

+ (id)handleValuesWithBlock:(id)a3
{
  return -[NSBlockObservationSink initWithBlock:tag:]([NSBlockObservationSink alloc], "initWithBlock:tag:", a3, 1);
}

+ (id)handleErrorsWithBlock:(id)a3
{
  return -[NSBlockObservationSink initWithBlock:tag:]([NSBlockObservationSink alloc], "initWithBlock:tag:", a3, 2);
}

@end
