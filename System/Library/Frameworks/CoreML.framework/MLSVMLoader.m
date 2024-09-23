@implementation MLSVMLoader

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  MLSVMEngine *v8;
  id v9;
  int v10;
  MLSupportVectorClassifier *v11;

  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
  {
    v8 = -[MLSVMEngine initWithSpecification:error:]([MLSVMEngine alloc], "initWithSpecification:error:", a3, a5);
    if (v8)
    {
      v9 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
      v10 = *(_DWORD *)(*(_QWORD *)a3 + 44);
      if ((v10 - 400) < 5 || v10 == 200)
        v11 = -[MLSupportVectorClassifier initWithEngine:description:configuration:error:]([MLSupportVectorClassifier alloc], "initWithEngine:description:configuration:error:", v8, v9, v7, a5);
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Interface type is not an Support Vector Classifier"));
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
