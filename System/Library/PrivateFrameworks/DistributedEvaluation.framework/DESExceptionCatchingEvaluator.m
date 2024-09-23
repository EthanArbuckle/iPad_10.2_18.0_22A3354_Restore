@implementation DESExceptionCatchingEvaluator

- (DESExceptionCatchingEvaluator)initWithEvaluator:(id)a3
{
  id v5;
  DESExceptionCatchingEvaluator *v6;
  DESExceptionCatchingEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DESExceptionCatchingEvaluator;
  v6 = -[DESExceptionCatchingEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_evaluator, a3);

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[DESRecipeEvaluation evaluateRecipe:recordInfo:recordData:attachments:error:](self->_evaluator, "evaluateRecipe:recordInfo:recordData:attachments:error:", v12, v13, v14, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)telemetryWithRecordSet:(id)a3
{
  return (id)-[DESRecipeEvaluation telemetryWithRecordSet:](self->_evaluator, "telemetryWithRecordSet:", a3);
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return -[DESRecipeEvaluation shouldDownloadAttachmentWithURL:recipe:recordInfo:](self->_evaluator, "shouldDownloadAttachmentWithURL:recipe:recordInfo:", a3, a4, a5);
}

- (id)serverSafeRecordInfoWithRecordInfo:(id)a3
{
  return (id)-[DESRecipeEvaluation serverSafeRecordInfoWithRecordInfo:](self->_evaluator, "serverSafeRecordInfoWithRecordInfo:", a3);
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[DESRecipeEvaluation evaluateRecipe:matchingRecordSet:error:](self->_evaluator, "evaluateRecipe:matchingRecordSet:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 binaryResult:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  -[DESRecipeEvaluation evaluateRecipe:matchingRecordSet:binaryResult:error:](self->_evaluator, "evaluateRecipe:matchingRecordSet:binaryResult:error:", v10, v11, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)performEvaluation:(id)a3
{
  id v4;

  v4 = a3;
  -[DESRecipeEvaluation performEvaluation:](self->_evaluator, "performEvaluation:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
}

@end
