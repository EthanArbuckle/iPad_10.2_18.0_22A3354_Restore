@implementation EKAlarmUtils

+ (void)adjustRelativeAlarmsForEvent:(id)a3 whenConvertingToIsAllDay:(BOOL)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  double v20;
  double v21;
  float v22;
  int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = v5;
  objc_msgSend(v5, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    v25 = v4;
    v24 = v6;
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isAbsolute") & 1) == 0)
        {
          objc_msgSend(v11, "relativeOffset");
          +[EKAlarmUtils adjustedRelativeAlarmOffset:isAllDay:](EKAlarmUtils, "adjustedRelativeAlarmOffset:isAllDay:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v13 = v28;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v14)
            {
              v15 = v14;
              v16 = 0;
              v17 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v30 != v17)
                    objc_enumerationMutation(v13);
                  v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                  objc_msgSend(v19, "relativeOffset");
                  v21 = v20;
                  objc_msgSend(v12, "floatValue");
                  if (v21 == v22)
                  {
                    v23 = objc_msgSend(v19, "isDefaultAlarm");
                    v16 |= v23 ^ objc_msgSend(v11, "isDefaultAlarm") ^ 1;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              }
              while (v15);

              v4 = v25;
              v6 = v24;
              if ((v16 & 1) != 0)
              {
                objc_msgSend(v26, "removeAlarm:", v11);
                goto LABEL_22;
              }
            }
            else
            {

            }
            objc_msgSend(v12, "doubleValue");
            objc_msgSend(v11, "setRelativeOffset:");
            objc_msgSend(v13, "addObject:", v11);
LABEL_22:
            v9 = v27;
          }
          else
          {
            objc_msgSend(v26, "removeAlarm:", v11);
          }

          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

}

+ (id)adjustedRelativeAlarmOffset:(double)a3 isAllDay:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "adjustedRelativeAlarmOffsetFromTimedToAllDay:", a3);
  else
    objc_msgSend(a1, "adjustedRelativeAlarmOffsetFromAllDayToTimed:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)adjustedRelativeAlarmOffsetFromTimedToAllDay:(double)a3
{
  if (a3 >= -43200.0 && a3 < 43200.0)
    return &unk_1E47B4FB8;
  if (a3 >= -129600.0 && a3 < -43200.0)
    return &unk_1E47B4FD0;
  if (a3 >= -216000.0 && a3 < -129600.0)
    return &unk_1E47B4FE8;
  if (a3 >= -561600.0 || a3 < -648000.0)
    return 0;
  else
    return &unk_1E47B5000;
}

+ (id)adjustedRelativeAlarmOffsetFromAllDayToTimed:(double)a3
{
  if (fabs(a3 + -32400.0) < 0.0000001)
    return &unk_1E47B5018;
  if (fabs(a3 + 54000.0) < 0.0000001)
    return &unk_1E47B5030;
  if (fabs(a3 + 140400.0) < 0.0000001)
    return &unk_1E47B5048;
  if (fabs(a3 + 572400.0) >= 0.0000001)
    return 0;
  return &unk_1E47B5060;
}

@end
