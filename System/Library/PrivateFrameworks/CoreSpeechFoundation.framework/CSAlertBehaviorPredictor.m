@implementation CSAlertBehaviorPredictor

+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 recordRoute:(id)a4 playbackRoute:(id)a5
{
  id v7;
  id v8;
  int v9;
  int v10;
  int64_t v11;
  uint64_t v13;

  v7 = a5;
  v8 = a4;
  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  v9 = CSHasAOP_hasAOP;
  if (CSSupportsVibrator_onceToken != -1)
    dispatch_once(&CSSupportsVibrator_onceToken, &__block_literal_global_27);
  v10 = CSSupportsVibrator_hasHaptic;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  LOWORD(v13) = CSIsHorseman_isHorseman;
  v11 = +[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:](CSAlertBehaviorPredictor, "predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:", a3, 0, v9 != 0, v10 != 0, 1, 0, v13, v8, v7);

  return v11;
}

+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 avSystemController:(id)a4 hasAOP:(BOOL)a5 supportVibrator:(BOOL)a6 isiOS:(BOOL)a7 isWatchOS:(BOOL)a8 isHorseman:(BOOL)a9 isBridgeOS:(BOOL)a10 recordRoute:(id)a11 playbackRoute:(id)a12
{
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  id v16;
  id v17;
  int v18;
  int v19;
  int v20;
  int v21;
  _QWORD *v22;
  void *v23;
  char v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  int64_t v31;
  int v33;
  NSObject *v34;
  uint64_t v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v12 = a8;
  v13 = a7;
  v36 = a6;
  v14 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a11;
  v37 = a12;
  v38 = v17;
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C897F0]);
  v19 = v18;
  v20 = !v13 || a9;
  if (v14)
    v21 = (a10 | ~v20) & v18;
  else
    v21 = 0;
  v22 = (_QWORD *)MEMORY[0x1E0D47F10];
  if (v16
    && (objc_msgSend(v16, "attributeForKey:", *MEMORY[0x1E0D47F10]),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "BOOLValue"),
        v23,
        (v24 & 1) != 0))
  {
    v25 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributeForKey:", *v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    v25 = v28 | v21;
  }
  v29 = v37;
  v30 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v40 = "+[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatc"
          "hOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:]";
    v41 = 1026;
    v42 = a3;
    v43 = 2114;
    v44 = v38;
    v45 = 2114;
    v46 = v37;
    v47 = 1026;
    v48 = v19;
    v49 = 1026;
    v50 = v25;
    _os_log_impl(&dword_1B502E000, v30, OS_LOG_TYPE_DEFAULT, "%s Context(%{public}d) recordRoute(%{public}@) playbackRoute(%{public}@) isRouteToBuiltInMic(%{public}d) isZLLAvailable(%{public}d)", buf, 0x32u);
  }
  if (!v12)
  {
    if ((v20 & 1) != 0)
    {
      v31 = a9 - 1;
      goto LABEL_21;
    }
    if ((unint64_t)a3 <= 0x1B)
    {
      if (((1 << a3) & 0xCD09C40) != 0)
        goto LABEL_20;
      if (((1 << a3) & 0x12) != 0)
      {
        if ((objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0C89808]) & 1) != 0)
          v33 = 0;
        else
          v33 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0C89818]) ^ 1;
        v34 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "+[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:"
                "isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:]";
          v41 = 1026;
          v42 = v33;
          v43 = 1026;
          LODWORD(v44) = v36;
          _os_log_impl(&dword_1B502E000, v34, OS_LOG_TYPE_DEFAULT, "%s isHandsFree = %{public}d hasHaptic = %{public}d", buf, 0x18u);
        }
        if ((v36 | v25) == 1)
        {
          v35 = 1;
          if (v33)
            v35 = 2;
          if (v25)
            v31 = 0;
          else
            v31 = v35;
        }
        else
        {
          v31 = 2;
        }
        v29 = v37;
        goto LABEL_21;
      }
      if (a3 == 7)
      {
        if (v25)
          v31 = 0;
        else
          v31 = 2;
        goto LABEL_21;
      }
    }
    v31 = 2;
    goto LABEL_21;
  }
  if ((unint64_t)a3 > 0xF)
  {
LABEL_15:
    v31 = 1;
    goto LABEL_21;
  }
  if (((1 << a3) & 0x8E40) != 0)
  {
LABEL_20:
    v31 = 0;
    goto LABEL_21;
  }
  if (((1 << a3) & 0x1A) == 0 || (objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0C89808]) & 1) != 0)
    goto LABEL_15;
  if (objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0C89818]))
    v31 = 1;
  else
    v31 = 2;
LABEL_21:

  return v31;
}

@end
