@implementation _CDDiagnosticDataReporter

+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  slADClientAddValueForScalarKey((uint64_t)a4, a3);
}

+ (void)pushValue:(double)a3 forDistributionKey:(id)a4
{
  slADClientPushValueForDistributionKey((uint64_t)a4, a3);
}

+ (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  slADClientSetValueForScalarKey((uint64_t)a4, a3);
}

+ (void)clearScalarKey:(id)a3
{
  slADClientClearScalarKey((uint64_t)a3);
}

+ (void)setValue:(int64_t)a3 forScalarKey:(id)a4 limitingSigDigs:(unint64_t)a5
{
  id v8;

  v8 = a4;
  objc_msgSend(a1, "setValue:forScalarKey:", significantFigureRound(a3, a5), v8);

}

+ (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  slADClientSetValueForDistributionKey((uint64_t)a4, a3);
}

+ (void)clearDistributionKey:(id)a3
{
  slADClientClearDistributionKey((uint64_t)a3);
}

@end
