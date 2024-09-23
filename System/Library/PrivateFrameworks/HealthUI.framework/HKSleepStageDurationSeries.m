@implementation HKSleepStageDurationSeries

- (HKSleepStageDurationSeries)init
{
  HKSleepStageDurationSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSNumber *highlightedSleepStageStorage;
  NSArray *sleepStageFillStylesStorage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSleepStageDurationSeries;
  v2 = -[HKSleepDurationSeries init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKSleepStageDurationSeriesLock"));
    highlightedSleepStageStorage = v2->_highlightedSleepStageStorage;
    v2->_highlightedSleepStageStorage = 0;

    sleepStageFillStylesStorage = v2->_sleepStageFillStylesStorage;
    v2->_sleepStageFillStylesStorage = 0;

  }
  return v2;
}

- (NSNumber)highlightedSleepStage
{
  void *v3;
  NSNumber *v4;
  void *v5;

  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedSleepStageStorage;
  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHighlightedSleepStage:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSNumber *highlightedSleepStageStorage;
  void *v7;

  v4 = (NSNumber *)a3;
  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKSleepStageDurationSeries _rebuildFillStyles](self, "_rebuildFillStyles");
}

- (NSArray)sleepStageFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageFillStylesStorage;
  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *sleepStageFillStylesStorage;
  void *v8;

  v4 = a3;
  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  -[HKSleepStageDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[HKSleepStageDurationSeries _rebuildFillStyles](self, "_rebuildFillStyles");
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  HKSleepDurationCoordinate *v40;
  void *v41;
  HKSleepDurationCoordinate *v42;
  void *v43;
  void *v45;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  HKSleepStageDurationSeries *v51;
  void *v52;
  void *v53;
  __int128 v54;
  int64_t resolution;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[4];
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "chartPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDurationSeries.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v48 = v10;
  objc_msgSend(v10, "transform");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  objc_msgSend(v11, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  -[HKSleepStageDurationSeries highlightedSleepStage](self, "highlightedSleepStage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v15)
  {
    v16 = v15;
    v50 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v57 != v50)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v18, "xValueAsGenericType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "coordinateForValue:", v19);
        v21 = v20;

        v22 = v21 + -0.25;
        objc_msgSend(v13, "coordinateForValue:", &unk_1E9CEB588);
        v24 = v23;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        if (v14)
        {
          switch(objc_msgSend(v14, "intValue"))
          {
            case 0u:
            case 1u:
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E0CB5368];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
                -[HKSleepStageDurationSeries coordinatesForBlock:blockPath:xAxis:yAxis:].cold.1(v60, v27, (uint64_t)v51, &v61);
              break;
            case 2u:
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v18, "awakeValue");
              goto LABEL_16;
            case 3u:
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v18, "asleepCoreValue");
              goto LABEL_16;
            case 4u:
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v18, "asleepDeepValue");
              goto LABEL_16;
            case 5u:
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v18, "asleepRemValue");
LABEL_16:
              objc_msgSend(v28, "numberWithDouble:");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "coordinateForValue:", v29);
              v24 = v30;

              break;
            default:
              break;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v31);

        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "totalDurationValue");
        objc_msgSend(v32, "numberWithDouble:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "coordinateForValue:", v33);
        v35 = v34;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v36);

        -[HKSleepStageDurationSeries highlightedSleepStage](v51, "highlightedSleepStage");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = HKSleepChartPointFormatterOptionsForSleepAnalysis(v37);
        objc_msgSend(v18, "userInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAnnotationOptions:", v38);

        v40 = [HKSleepDurationCoordinate alloc];
        objc_msgSend(v18, "userInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:](v40, "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v25, 0, 1, v41);

        objc_msgSend(v52, "addObject:", v42);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v16);
  }

  v54 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v52, &v54);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (BOOL)hideInBedData
{
  return 0;
}

- (BOOL)hideAsleepData
{
  return 0;
}

- (void)_rebuildFillStyles
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D7813000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Asked to create fill style for unsupported sleep category value", (uint8_t *)&v4, 0xCu);

}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, a3);
}

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

- (void)coordinatesForBlock:(uint8_t *)a1 blockPath:(void *)a2 xAxis:(uint64_t)a3 yAxis:(_QWORD *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  objc_class *v7;
  void *v8;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1D7813000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Asked to create coordinate for unsupported sleep category value", a1, 0xCu);

}

@end
