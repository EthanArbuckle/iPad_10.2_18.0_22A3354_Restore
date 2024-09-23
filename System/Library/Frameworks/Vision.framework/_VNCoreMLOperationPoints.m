@implementation _VNCoreMLOperationPoints

- (_VNCoreMLOperationPoints)initWithClassLabels:(id)a3 precisionRecallCurves:(id)a4
{
  id v6;
  id v7;
  _VNCoreMLOperationPoints *v8;
  uint64_t v9;
  NSArray *classLabels;
  uint64_t v11;
  NSArray *precisionRecallCurves;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_VNCoreMLOperationPoints;
  v8 = -[_VNCoreMLOperationPoints init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    classLabels = v8->_classLabels;
    v8->_classLabels = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    precisionRecallCurves = v8->_precisionRecallCurves;
    v8->_precisionRecallCurves = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  NSUInteger v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a4;
  v9 = -[NSArray indexOfObject:](self->_classLabels, "indexOfObject:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      objc_msgSend((id)objc_opt_class(), "errorForUnknownClassificationIdentifier:", v8);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    -[NSArray objectAtIndex:](self->_precisionRecallCurves, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC6D08];
    objc_msgSend(v11, "precisionValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "precisionConfidenceThresholds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "curveWithValuesArray:confidencesArray:error:", v13, v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0DC6D08];
      objc_msgSend(v11, "recallValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recallConfidenceThresholds");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "curveWithValuesArray:confidencesArray:error:", v17, v18, a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v19 != 0;
      if (v19)
      {
        v20 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C20]), "initWithPrecisionCurve:recallCurve:", v15, v19));
        *a3 = v20;

      }
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionRecallCurves, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
}

@end
