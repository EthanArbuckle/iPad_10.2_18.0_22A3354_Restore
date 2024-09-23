@implementation ASTUIDualMatrixCalibrationStrategy

- (ASTUIDualMatrixCalibrationStrategy)init
{
  ASTUIDualMatrixCalibrationStrategy *v2;
  uint64_t v3;
  NSMutableDictionary *storedEnrollments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  v2 = -[ASTUIDualMatrixCalibrationStrategy init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    storedEnrollments = v2->_storedEnrollments;
    v2->_storedEnrollments = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  double y;
  double v5;

  y = a3.y;
  -[ASTUIDualMatrixCalibrationStrategy uncalibratedMiddleLineOfTheScreen](self, "uncalibratedMiddleLineOfTheScreen", a3.x);
  if (y > v5)
    -[ASTUIDualMatrixCalibrationStrategy bottomCalibrationMatrix](self, "bottomCalibrationMatrix");
  else
    -[ASTUIDualMatrixCalibrationStrategy topCalibrationMatrix](self, "topCalibrationMatrix");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)captureGazeEnrollmentPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASTUIDualMatrixCalibrationStrategy storedEnrollments](self, "storedEnrollments");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "positionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (void)learnCalibration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25081BA48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25081BA60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTUIDualMatrixCalibrationStrategy storedEnrollments](self, "storedEnrollments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 5)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v7, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_4;
    v24[3] = &unk_250819A50;
    v25 = v19;
    v21 = v19;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v24);

    -[ASTUIDualMatrixCalibrationStrategy setUncalibratedMiddleLineOfTheScreen:](self, "setUncalibratedMiddleLineOfTheScreen:", -1.0);
    -[ASTUIDualMatrixCalibrationStrategy learnCalibrationForPoints:](self, "learnCalibrationForPoints:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTUIDualMatrixCalibrationStrategy setBottomCalibrationMatrix:](self, "setBottomCalibrationMatrix:", v22);

  }
  else
  {
    v10 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke;
    v35[3] = &unk_250819A00;
    v36 = v5;
    v11 = v3;
    v37 = v11;
    v38 = v6;
    v23 = v4;
    v12 = v4;
    v39 = v12;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v35);
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x2020000000;
    v34 = 0;
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_2;
    v28[3] = &unk_250819A28;
    v15 = v13;
    v29 = v15;
    v30 = &v31;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v28);
    -[ASTUIDualMatrixCalibrationStrategy setUncalibratedMiddleLineOfTheScreen:](self, "setUncalibratedMiddleLineOfTheScreen:", v32[3]);
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_3;
    v26[3] = &unk_250819A50;
    v16 = v14;
    v27 = v16;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);
    -[ASTUIDualMatrixCalibrationStrategy learnCalibrationForPoints:](self, "learnCalibrationForPoints:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTUIDualMatrixCalibrationStrategy setTopCalibrationMatrix:](self, "setTopCalibrationMatrix:", v17);

    -[ASTUIDualMatrixCalibrationStrategy learnCalibrationForPoints:](self, "learnCalibrationForPoints:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTUIDualMatrixCalibrationStrategy setBottomCalibrationMatrix:](self, "setBottomCalibrationMatrix:", v18);

    _Block_object_dispose(&v31, 8);
    v4 = v23;
  }

}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v6))
    objc_msgSend(a1[5], "addObject:", v5);
  if (objc_msgSend(a1[6], "containsObject:", v6))
    objc_msgSend(a1[7], "addObject:", v5);

}

double __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double result;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = a2;
  objc_msgSend(v4, "predictedPoint");
  v18[0] = v5;
  v18[1] = v6;
  objc_msgSend(v3, "valueWithBytes:objCType:", v18, "{CGPoint=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "groundTruthPoint");
  v17[0] = v10;
  v17[1] = v11;
  objc_msgSend(v9, "valueWithBytes:objCType:", v17, "{CGPoint=dd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v12);

  objc_msgSend(v4, "predictedPoint");
  v14 = v13;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = fmax(v14, *(double *)(v15 + 24));
  *(double *)(v15 + 24) = result;
  return result;
}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = a2;
  objc_msgSend(v4, "predictedPoint");
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(v3, "valueWithBytes:objCType:", v16, "{CGPoint=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "groundTruthPoint");
  v11 = v10;
  v13 = v12;

  v15[0] = v11;
  v15[1] = v13;
  objc_msgSend(v9, "valueWithBytes:objCType:", v15, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v14);

}

void __54__ASTUIDualMatrixCalibrationStrategy_learnCalibration__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = a2;
  objc_msgSend(v4, "predictedPoint");
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(v3, "valueWithBytes:objCType:", v16, "{CGPoint=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "groundTruthPoint");
  v11 = v10;
  v13 = v12;

  v15[0] = v11;
  v15[1] = v13;
  objc_msgSend(v9, "valueWithBytes:objCType:", v15, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v14);

}

- (void)reset
{
  id v3;

  v3 = (id)objc_opt_new();
  -[ASTUIDualMatrixCalibrationStrategy setStoredEnrollments:](self, "setStoredEnrollments:", v3);

}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  v5.receiver = self;
  v5.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy calibratedGazePointForGazePoint:](&v5, sel_calibratedGazePointForGazePoint_, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASTUIDualMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy learnCalibrationForPoints:](&v4, sel_learnCalibrationForPoints_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableDictionary)storedEnrollments
{
  return self->_storedEnrollments;
}

- (void)setStoredEnrollments:(id)a3
{
  objc_storeStrong((id *)&self->_storedEnrollments, a3);
}

- (NSArray)topCalibrationMatrix
{
  return self->_topCalibrationMatrix;
}

- (void)setTopCalibrationMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_topCalibrationMatrix, a3);
}

- (NSArray)bottomCalibrationMatrix
{
  return self->_bottomCalibrationMatrix;
}

- (void)setBottomCalibrationMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_bottomCalibrationMatrix, a3);
}

- (double)uncalibratedMiddleLineOfTheScreen
{
  return self->_uncalibratedMiddleLineOfTheScreen;
}

- (void)setUncalibratedMiddleLineOfTheScreen:(double)a3
{
  self->_uncalibratedMiddleLineOfTheScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomCalibrationMatrix, 0);
  objc_storeStrong((id *)&self->_topCalibrationMatrix, 0);
  objc_storeStrong((id *)&self->_storedEnrollments, 0);
}

@end
