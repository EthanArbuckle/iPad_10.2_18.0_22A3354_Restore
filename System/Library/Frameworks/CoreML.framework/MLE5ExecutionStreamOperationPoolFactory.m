@implementation MLE5ExecutionStreamOperationPoolFactory

+ (id)createPoolFromLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 modelConfiguration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __objc2_class **v18;
  int v19;
  void *v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if ((objc_msgSend(v15, "hasEnumeratedShapeInputs") & 1) != 0)
  {
    v18 = off_1E3D41648;
  }
  else
  {
    v19 = objc_msgSend(v15, "hasRangeShapeInputs");
    v18 = off_1E3D41658;
    if (v19)
      v18 = off_1E3D41650;
  }
  v20 = (void *)objc_msgSend(objc_alloc(*v18), "initWithProgramLibrary:functionName:modelDescription:configuration:modelSignpostId:compilerVersionInfo:", v13, v14, v15, v16, a7, v17);

  return v20;
}

@end
