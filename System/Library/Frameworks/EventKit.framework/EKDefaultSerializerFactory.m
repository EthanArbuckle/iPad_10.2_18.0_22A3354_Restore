@implementation EKDefaultSerializerFactory

+ (id)createSerializerWithEventStore:(id)a3 withVersion:(id)a4
{
  id v5;
  id v6;
  EKSecureKeyedArchiverSerializer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[EKSecureKeyedArchiverSerializer initWithEventStore:withVersion:]([EKSecureKeyedArchiverSerializer alloc], "initWithEventStore:withVersion:", v6, v5);

  return v7;
}

@end
