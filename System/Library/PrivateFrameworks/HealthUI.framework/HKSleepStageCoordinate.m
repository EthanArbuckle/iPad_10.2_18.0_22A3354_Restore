@implementation HKSleepStageCoordinate

- (HKSleepStageCoordinate)initWithXValue:(double)a3 asleepUnspecifiedYValues:(id)a4 asleepDeepYValues:(id)a5 asleepCoreYValues:(id)a6 asleepRemYValues:(id)a7 awakeValues:(id)a8 inBedYValues:(id)a9 yValues:(id)a10 highlighted:(BOOL)a11 userInfo:(id)a12
{
  HKSleepStageCoordinate *v20;
  HKSleepStageCoordinate *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HKSleepStageCoordinate;
  v23 = a8;
  v20 = -[HKSleepPeriodCoordinate initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:](&v28, sel_initWithXValue_asleepYValues_inBedYValues_yValues_upperGoalYValue_lowerGoalYValue_highlighted_userInfo_, MEMORY[0x1E0C9AA60], a9, a10, 0, 0, a11, a3, a12);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_awakeValues, a8);
    objc_storeStrong((id *)&v21->_asleepUnspecifiedYValues, a4);
    objc_storeStrong((id *)&v21->_asleepDeepYValues, a5);
    objc_storeStrong((id *)&v21->_asleepCoreYValues, a6);
    objc_storeStrong((id *)&v21->_asleepRemYValues, a7);
  }

  return v21;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  CGAffineTransform *v4;
  uint64_t v6;
  __int128 v7;
  void *v8;
  NSArray *asleepUnspecifiedYValues;
  uint64_t v10;
  id v11;
  NSArray *asleepRemYValues;
  uint64_t v13;
  id v14;
  NSArray *asleepCoreYValues;
  id v16;
  NSArray *asleepDeepYValues;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  void *v28;
  double v29;
  CGFloat v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_OWORD *)&a3->c;
  v57 = *(_OWORD *)&a3->a;
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke;
  aBlock[3] = &unk_1E9C44220;
  aBlock[4] = self;
  v58 = v7;
  v59 = *(_OWORD *)&a3->tx;
  v8 = _Block_copy(aBlock);
  asleepUnspecifiedYValues = self->_asleepUnspecifiedYValues;
  v54[0] = v6;
  v10 = v6;
  v54[1] = 3221225472;
  v54[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_2;
  v54[3] = &unk_1E9C44248;
  v11 = v8;
  v55 = v11;
  -[NSArray hk_map:](asleepUnspecifiedYValues, "hk_map:", v54);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  asleepRemYValues = self->_asleepRemYValues;
  v52[0] = v10;
  v13 = v10;
  v52[1] = 3221225472;
  v52[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_3;
  v52[3] = &unk_1E9C44248;
  v14 = v11;
  v53 = v14;
  -[NSArray hk_map:](asleepRemYValues, "hk_map:", v52);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  asleepCoreYValues = self->_asleepCoreYValues;
  v50[0] = v13;
  v50[1] = 3221225472;
  v50[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_4;
  v50[3] = &unk_1E9C44248;
  v16 = v14;
  v51 = v16;
  -[NSArray hk_map:](asleepCoreYValues, "hk_map:", v50);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  asleepDeepYValues = self->_asleepDeepYValues;
  v48[0] = v13;
  v18 = v13;
  v48[1] = 3221225472;
  v48[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_5;
  v48[3] = &unk_1E9C44248;
  v19 = v16;
  v49 = v19;
  -[NSArray hk_map:](asleepDeepYValues, "hk_map:", v48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageCoordinate awakeValues](self, "awakeValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v13;
  v46[1] = 3221225472;
  v46[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_6;
  v46[3] = &unk_1E9C44248;
  v22 = v19;
  v47 = v22;
  objc_msgSend(v21, "hk_map:", v46);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepPeriodCoordinate inBedYValues](self, "inBedYValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v13;
  v44[1] = 3221225472;
  v44[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_7;
  v44[3] = &unk_1E9C44248;
  v45 = v22;
  v38 = v22;
  objc_msgSend(v24, "hk_map:", v44);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepPeriodCoordinate yValues](self, "yValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v18;
  v40[1] = 3221225472;
  v40[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_8;
  v40[3] = &unk_1E9C44270;
  v40[4] = self;
  v27 = *(_OWORD *)&v4->c;
  v41 = *(_OWORD *)&v4->a;
  v42 = v27;
  v43 = *(_OWORD *)&v4->tx;
  objc_msgSend(v26, "hk_map:", v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepPeriodCoordinate xValue](self, "xValue");
  v30 = v4->tx + v4->c * 0.0 + v4->a * v29;
  v31 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v4) = -[HKSleepPeriodCoordinate highlighted](self, "highlighted");
  -[HKSleepPeriodCoordinate userInfo](self, "userInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = (_BYTE)v4;
  v33 = (void *)objc_msgSend(v31, "initWithXValue:asleepUnspecifiedYValues:asleepDeepYValues:asleepCoreYValues:asleepRemYValues:awakeValues:inBedYValues:yValues:highlighted:userInfo:", v39, v20, v36, v37, v23, v25, v30, v28, v35, v32);

  return v33;
}

id __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "xValue");
  v6 = v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80) + v9 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "continuation");

  +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "xValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80) + v8 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v6);
}

- (NSArray)awakeValues
{
  return self->_awakeValues;
}

- (NSArray)asleepUnspecifiedYValues
{
  return self->_asleepUnspecifiedYValues;
}

- (NSArray)asleepDeepYValues
{
  return self->_asleepDeepYValues;
}

- (NSArray)asleepCoreYValues
{
  return self->_asleepCoreYValues;
}

- (NSArray)asleepRemYValues
{
  return self->_asleepRemYValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asleepRemYValues, 0);
  objc_storeStrong((id *)&self->_asleepCoreYValues, 0);
  objc_storeStrong((id *)&self->_asleepDeepYValues, 0);
  objc_storeStrong((id *)&self->_asleepUnspecifiedYValues, 0);
  objc_storeStrong((id *)&self->_awakeValues, 0);
}

@end
