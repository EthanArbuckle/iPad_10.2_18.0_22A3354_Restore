@implementation BLSHBegunUpdateOperation

+ (id)didBeginUpdateToBacklightState:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBacklightState:", a3);
}

@end
