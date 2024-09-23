@implementation MLSVRLoader

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  MLSVREngine *v8;
  id v9;
  MLSupportVectorRegressor *v10;

  v7 = a4;
  v8 = -[MLSVREngine initWithSpecification:error:]([MLSVREngine alloc], "initWithSpecification:error:", a3, a5);
  if (v8)
  {
    v9 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    v10 = -[MLSupportVectorRegressor initWithEngine:description:configuration:error:]([MLSupportVectorRegressor alloc], "initWithEngine:description:configuration:error:", v8, v9, v7, a5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
