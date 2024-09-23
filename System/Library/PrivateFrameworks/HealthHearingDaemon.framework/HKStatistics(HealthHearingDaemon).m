@implementation HKStatistics(HealthHearingDaemon)

- (id)statisticsByCombiningWithNoiseLevelStatistics:()HealthHearingDaemon error:
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKStatistics+HealthHearingDaemon.mm"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statistics"));

  }
  objc_msgSend(a1, "quantityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKHeadphoneAudioExposureType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v33 = CFSTR("invalid quantityType");
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, v33);
LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a1, "quantityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quantityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    v33 = CFSTR("quantityType mismatch");
    goto LABEL_10;
  }
  v37[0] = 0;
  v37[1] = 0;
  if (!populateNoiseLevelWithStatistics(v37, a1, a4))
    goto LABEL_11;
  v36[0] = 0;
  v36[1] = 0;
  if (!populateNoiseLevelWithStatistics(v36, v7, a4))
    goto LABEL_11;
  combineNoiseLevelDatums();
  v15 = v14;
  v17 = v16;
  v18 = objc_alloc(MEMORY[0x24BDD3FF0]);
  objc_msgSend(a1, "quantityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMin();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMax();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v18, "initWithDataType:startDate:endDate:", v19, v22, v25);

  v27 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAverageQuantity:", v29);

  v30 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "quantityWithUnit:doubleValue:", v31, v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDuration:", v32);

LABEL_12:
  return v26;
}

@end
