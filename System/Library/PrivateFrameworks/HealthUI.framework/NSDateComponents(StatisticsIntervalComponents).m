@implementation NSDateComponents(StatisticsIntervalComponents)

+ (id)hk_chartStatisticsIntervalComponentsForValue:()StatisticsIntervalComponents forComponent:
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setValue:forComponent:", a3, a4);
  return v6;
}

@end
