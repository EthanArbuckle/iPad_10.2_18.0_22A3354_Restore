@implementation _CDPModelTuning

+ (id)f1Score
{
  double v2;

  LODWORD(v2) = 1.0;
  return (id)objc_msgSend(a1, "fScoreWithBeta:", v2);
}

+ (id)f2Score
{
  double v2;

  LODWORD(v2) = 2.0;
  return (id)objc_msgSend(a1, "fScoreWithBeta:", v2);
}

+ (id)fScoreWithBeta:(float)a3
{
  _QWORD v4[4];
  float v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___CDPModelTuning_fScoreWithBeta___block_invoke;
  v4[3] = &__block_descriptor_36_e11_f16__0f8f12l;
  v5 = a3;
  return (id)MEMORY[0x193FEEAF4](v4, a2);
}

- (void)resumeTuningWithState:(id)a3
{
  id v4;
  _CDPModelTuningState *v5;
  _CDPModelTuningState *currentState;
  NSObject *v7;
  int v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, float, float, float, float, float);
  float v26;
  float v27;
  char v28;
  float v29;
  uint8_t buf[4];
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    +[_CDPModelTuningState initialTuningState](_CDPModelTuningState, "initialTuningState");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (_CDPModelTuningState *)objc_msgSend(v4, "copy");
  currentState = self->_currentState;
  self->_currentState = v5;

  -[_CDPModelTuningState setI:](self->_currentState, "setI:", 0);
  if (-[_CDPModelTuningState i](self->_currentState, "i") <= 8)
  {
    v7 = MEMORY[0x1E0C81028];
    while (1)
    {
      v8 = -[_CDPModelTuningState i](self->_currentState, "i");
      -[_CDPModelTuningState setJ:](self->_currentState, "setJ:", 0);
      if (-[_CDPModelTuningState j](self->_currentState, "j") <= 8)
        break;
LABEL_6:
      -[_CDPModelTuningState setI:](self->_currentState, "setI:", -[_CDPModelTuningState i](self->_currentState, "i") + 1);
      if (-[_CDPModelTuningState i](self->_currentState, "i") >= 9)
        goto LABEL_20;
    }
    v9 = (float)((float)v8 * 0.46111) + 0.0;
    v10 = exp(v9);
    while (1)
    {
      -[_CDPModelTuningState progress](self->_currentState, "progress");
      v12 = v11;
      objc_msgSend(v4, "progress");
      if (v12 > v13)
      {
        v14 = (float)((float)-[_CDPModelTuningState j](self->_currentState, "j") * 2.4375) + 0.5;
        *(float *)&v15 = v10;
        *(float *)&v16 = v14;
        -[_CDPSimpleModel setLambda:w0:](self->_model, "setLambda:w0:", v15, v16);
        v29 = 0.0;
        -[_CDPModelTuning _testModelWithThreshold:](self, "_testModelWithThreshold:", &v29);
        v18 = v17;
        -[_CDPModelTuningState bestScore](self->_currentState, "bestScore");
        if (v18 > v19)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            -[_CDPModelTuning resumeTuningWithState:].cold.2(buf, (double *)v31, v18);
          *(float *)&v20 = v9;
          -[_CDPModelTuningState setBestLogLambda:](self->_currentState, "setBestLogLambda:", v20);
          *(float *)&v21 = v14;
          -[_CDPModelTuningState setBestW0:](self->_currentState, "setBestW0:", v21);
          *(float *)&v22 = v29;
          -[_CDPModelTuningState setBestThreshold:](self->_currentState, "setBestThreshold:", v22);
          *(float *)&v23 = v18;
          -[_CDPModelTuningState setBestScore:](self->_currentState, "setBestScore:", v23);
        }
        -[_CDPModelTuning heartBeat](self, "heartBeat");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v28 = 0;
          -[_CDPModelTuning heartBeat](self, "heartBeat");
          v25 = (void (**)(_QWORD, _QWORD, _QWORD, float, float, float, float, float))objc_claimAutoreleasedReturnValue();
          v26 = v29;
          -[_CDPModelTuningState progress](self->_currentState, "progress");
          ((void (**)(_QWORD, _CDPModelTuning *, char *, float, float, float, float, float))v25)[2](v25, self, &v28, v10, v14, v26, v18, v27);

          if (v28)
            break;
        }
      }
      -[_CDPModelTuningState setJ:](self->_currentState, "setJ:", -[_CDPModelTuningState j](self->_currentState, "j") + 1);
      if (-[_CDPModelTuningState j](self->_currentState, "j") >= 9)
        goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[_CDPModelTuning resumeTuningWithState:].cold.1();
  }
LABEL_20:

}

+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 index:(unint64_t)a5 subset:(unsigned int *)a6 subsetLength:(unint64_t)a7 index:(unint64_t)a8 callback:(id)a9
{
  id v16;
  int v17;
  unint64_t v18;
  id v19;

  v16 = a9;
  v19 = v16;
  if (a8 == a7)
  {
    (*((void (**)(id, unsigned int *, unint64_t))v16 + 2))(v16, a6, a8);
  }
  else
  {
    v17 = a4 - a5;
    a6[a8] = a3[a5];
    v18 = a5 + 1;
    objc_msgSend(a1, "_enumerateSubsetsOfSet:setLength:index:subset:subsetLength:index:callback:", a3, a4, v18, a6, a7, a8 + 1, v16);
    if ((int)a7 - (int)a8 < v17)
      objc_msgSend(a1, "_enumerateSubsetsOfSet:setLength:index:subset:subsetLength:index:callback:", a3, a4, v18, a6, a7, a8, v19);
  }

}

+ (void)_enumerateSubsetsOfSet:(unsigned int *)a3 setLength:(unint64_t)a4 withSize:(unint64_t)a5 callback:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
  objc_msgSend(a1, "_enumerateSubsetsOfSet:setLength:index:subset:subsetLength:index:callback:", a3, a4, 0, v11, a5, 0, v10);

  free(v11);
}

+ (unsigned)_newSetDifference:(unsigned int *)a3 setLength:(unint64_t)a4 subset:(unsigned int *)a5 subsetLength:(unint64_t)a6
{
  unint64_t v8;
  unsigned int *result;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;

  v8 = a4;
  result = (unsigned int *)malloc_type_calloc(a4 - a6, 4uLL, 0x100004052888210uLL);
  if (v8)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v14 = *a3++;
      v13 = v14;
      if (v12 < a6 && v13 == a5[v12])
        ++v12;
      else
        result[v11++] = v13;
      --v8;
    }
    while (v8);
  }
  return result;
}

+ (void)_cumulativeSumOfArray:(float *)a3 size:(unint64_t)a4 reverse:(BOOL)a5
{
  uint64_t v5;
  vDSP_Stride v6;
  float *v7;
  float v8;
  float __S;

  v5 = (int)a4 - 1;
  if (a5)
    v6 = -1;
  else
    v6 = 1;
  if (!a5)
    v5 = 0;
  v7 = &a3[v5];
  v8 = *v7;
  v7[v6] = *v7 + v7[v6];
  __S = 1.0;
  vDSP_vrsum(v7, v6, &__S, v7, v6, a4);
  *v7 = v8;
}

+ (void)_addArray:(float *)a3 size:(unint64_t)a4 inArray:(float *)a5
{
  vDSP_vadd(a3, 1, a5, 1, a5, 1, a4);
}

- (float)_testModelWithThreshold:(float *)a3
{
  uint64_t v5;
  float (**v6)(_QWORD, _QWORD);
  void *v7;
  unint64_t v8;
  float *v9;
  float *v10;
  void *v11;
  id v12;
  float v13;
  uint64_t i;
  float v15;
  float v16;
  unsigned int v17;
  float (**v18)(float, float);
  float v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  _CDPModelTuning *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  float *v29;
  unint64_t v30;
  float *v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  _QWORD v37[6];
  _QWORD v38[6];

  v5 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke;
  v38[3] = &__block_descriptor_40_e8_f12__0i8l;
  v38[4] = 0x3F00106400000000;
  v6 = (float (**)(_QWORD, _QWORD))MEMORY[0x193FEEAF4](v38, a2);
  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke_2;
  v37[3] = &__block_descriptor_48_e8_q12__0f8l;
  v37[4] = 2000;
  v37[5] = 0x3F00106400000000;
  v7 = (void *)MEMORY[0x193FEEAF4](v37);
  v8 = -[_CDPSimpleModel nPeople](self->_model, "nPeople");
  v9 = (float *)malloc_type_calloc(0x7D0uLL, 4uLL, 0x100004052888210uLL);
  v10 = (float *)malloc_type_calloc(0x7D0uLL, 4uLL, 0x100004052888210uLL);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  -[_CDPModelTuning testIndices](self, "testIndices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  v22 = 3221225472;
  v23 = __43___CDPModelTuning__testModelWithThreshold___block_invoke_3;
  v24 = &unk_1E26E44E8;
  v25 = self;
  v28 = 2000;
  v12 = v7;
  v29 = v9;
  v30 = v8;
  v32 = 1056968804;
  v31 = v10;
  v26 = v12;
  v27 = &v33;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", &v21);

  v13 = 0.0;
  for (i = 1; i != 2000; ++i)
  {
    v15 = v9[i];
    v16 = v10[i];
    v17 = *((_DWORD *)v34 + 6);
    -[_CDPModelTuning scorer](self, "scorer", v21, v22, v23, v24, v25);
    v18 = (float (**)(float, float))objc_claimAutoreleasedReturnValue();
    v19 = v18[2](v15 / v16, v15 / (float)v17);

    if (v19 > v13)
    {
      *a3 = v6[2](v6, i);
      v13 = v19;
    }
  }
  free(v9);
  free(v10);

  _Block_object_dispose(&v33, 8);
  return v13;
}

- (_CDPModelTuningState)currentState
{
  return self->_currentState;
}

- (id)scorer
{
  return self->_scorer;
}

- (void)setScorer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)heartBeat
{
  return self->_heartBeat;
}

- (void)setHeartBeat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_CDPSimpleModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSIndexSet)testIndices
{
  return self->_testIndices;
}

- (void)setTestIndices:(id)a3
{
  objc_storeStrong((id *)&self->_testIndices, a3);
}

- (int)numberOfGridTests
{
  return self->_numberOfGridTests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testIndices, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_heartBeat, 0);
  objc_storeStrong(&self->_scorer, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)resumeTuningWithState:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[TUNING] interrupted", v0, 2u);
}

- (void)resumeTuningWithState:(float)a3 .cold.2(uint8_t *buf, double *a2, float a3)
{
  *(_DWORD *)buf = 134217984;
  *a2 = a3;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[TUNING] new best score %g", buf, 0xCu);
}

@end
