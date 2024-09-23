@implementation GEOMapItemOpenState

+ (unint64_t)_geoMapItemOpeningHoursOptionsForBusinessHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "hoursType") == 4)
  {
    v10 = 128;
  }
  else if (objc_msgSend(v7, "hoursType") == 3)
  {
    v10 = 256;
  }
  else
  {
    objc_msgSend(v7, "placeDailyNormalizedHours");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v7, "placeDailyNormalizedHours");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForNormalizedHours:compareDate:timeZone:](GEOMapItemOpenState, "_geoMapItemOpeningHoursOptionsForNormalizedHours:compareDate:timeZone:", v13, v8, v9);

    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

+ (unint64_t)_geoMapItemOpeningHoursOptionsForNormalizedHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  double v42;
  unint64_t v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  double v68;
  double v69;
  double v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v9;
    objc_msgSend(v10, "setTimeZone:", v9);
    v78 = v10;
    objc_msgSend(v10, "components:fromDate:", 736, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "weekday");
    v13 = v12;
    v93 = 0u;
    v94 = 0u;
    if ((unint64_t)(v12 + 1) <= 7)
      v14 = v12 + 1;
    else
      v14 = 1;
    v95 = 0uLL;
    v96 = 0uLL;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    if (v16)
    {
      v17 = v16;
      v76 = v7;
      v77 = v11;
      v75 = v8;
      LOBYTE(v7) = 0;
      v80 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v94 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          if (objc_msgSend(v21, "weekday", v75, v76) == v13)
          {
            v22 = v21;

            v18 = v22;
          }
          if (objc_msgSend(v21, "weekday") == v14)
          {
            v23 = v21;

            v80 = v23;
          }
          if ((v7 & 1) != 0)
          {
            LODWORD(v7) = 1;
          }
          else
          {
            objc_msgSend(v21, "localTimeIntervals");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v7) = objc_msgSend(v24, "count") != 0;

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
      }
      while (v17);

      if ((_DWORD)v7)
      {
        v11 = v77;
        v25 = 3600 * objc_msgSend(v77, "hour");
        v26 = objc_msgSend(v77, "minute");
        v27 = objc_msgSend(v77, "second");
        objc_msgSend(v18, "openingSoonThresholdSeconds");
        v28 = 0.0;
        v29 = 0.0;
        if (v30 > 1.0)
        {
          objc_msgSend(v18, "openingSoonThresholdSeconds");
          v29 = v31;
        }
        v32 = v25 + 60 * v26;
        objc_msgSend(v18, "closingSoonThresholdSeconds");
        if (v33 > 1.0)
        {
          objc_msgSend(v18, "closingSoonThresholdSeconds");
          v28 = v34;
        }
        v35 = v32 + v27;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v80, "localTimeIntervals");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
        v38 = 0.0;
        if (v37)
        {
          v39 = *(_QWORD *)v90;
          while (2)
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v90 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
              objc_msgSend(v41, "startTime");
              if (v42 == 0.0)
              {
                objc_msgSend(v41, "endTime");
                v38 = v45;
                v37 = 1;
                goto LABEL_39;
              }
            }
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
            if (v37)
              continue;
            break;
          }
        }
LABEL_39:
        v46 = (double)v35;

        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        objc_msgSend(v18, "localTimeIntervals");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v86;
          v43 = 18;
          while (2)
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v86 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
              objc_msgSend(v52, "endTime");
              if (v53 >= v46)
              {
                objc_msgSend(v52, "endTime");
                v55 = v54;
                objc_msgSend(v52, "startTime");
                if (v55 - v56 >= 86400.0)
                {
                  objc_msgSend(v52, "startTime");
                  if (v57 == 0.0)
                    goto LABEL_63;
                }
                objc_msgSend(v52, "startTime");
                v59 = v58;
                objc_msgSend(v52, "endTime");
                v61 = +[GEOMapItemOpenState _checkForStateWithStartTime:endtime:compareTimeInSeconds:openingSoonThreshold:closingSoonThreshold:secondsOverMidnightForTomorrow:isTodaysNormalizedHours:tomorrowsHoursBeginAtMidnight:](GEOMapItemOpenState, "_checkForStateWithStartTime:endtime:compareTimeInSeconds:openingSoonThreshold:closingSoonThreshold:secondsOverMidnightForTomorrow:isTodaysNormalizedHours:tomorrowsHoursBeginAtMidnight:", 1, v37, v59, v60, v46, v29, v28, v38);
                if (v61 != 1)
                {
                  v43 = v61;
LABEL_63:

                  goto LABEL_64;
                }
              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
            v11 = v77;
            if (v49)
              continue;
            break;
          }
        }

        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        objc_msgSend(v80, "localTimeIntervals");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v82;
          while (2)
          {
            for (m = 0; m != v64; ++m)
            {
              if (*(_QWORD *)v82 != v65)
                objc_enumerationMutation(v62);
              v67 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * m);
              objc_msgSend(v67, "startTime");
              v69 = v68;
              objc_msgSend(v67, "endTime");
              if (v70 + 86400.0 >= v46)
              {
                v71 = +[GEOMapItemOpenState _checkForStateWithStartTime:endtime:compareTimeInSeconds:openingSoonThreshold:closingSoonThreshold:secondsOverMidnightForTomorrow:isTodaysNormalizedHours:tomorrowsHoursBeginAtMidnight:](GEOMapItemOpenState, "_checkForStateWithStartTime:endtime:compareTimeInSeconds:openingSoonThreshold:closingSoonThreshold:secondsOverMidnightForTomorrow:isTodaysNormalizedHours:tomorrowsHoursBeginAtMidnight:", 0, v37, v69 + 86400.0, v70 + 86400.0, v46, v29, v28, v38);
                if (v71 != 1)
                {
                  v43 = v71;

                  goto LABEL_69;
                }
              }
            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
            if (v64)
              continue;
            break;
          }
        }

        objc_msgSend(v18, "localTimeIntervals");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "count");

        if (v73)
          v43 = 4;
        else
          v43 = 12;
LABEL_69:
        v8 = v75;
        v7 = v76;
        v10 = v78;
        v9 = v79;
      }
      else
      {
        v43 = 1;
LABEL_64:
        v8 = v75;
        v7 = v76;
        v10 = v78;
        v9 = v79;
        v11 = v77;
      }
      v44 = v80;
    }
    else
    {

      v18 = 0;
      v44 = 0;
      v43 = 1;
    }

  }
  else
  {
    v43 = 1;
  }

  return v43;
}

+ (unint64_t)_checkForStateWithStartTime:(double)a3 endtime:(double)a4 compareTimeInSeconds:(double)a5 openingSoonThreshold:(double)a6 closingSoonThreshold:(double)a7 secondsOverMidnightForTomorrow:(double)a8 isTodaysNormalizedHours:(BOOL)a9 tomorrowsHoursBeginAtMidnight:(BOOL)a10
{
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  BOOL v16;
  BOOL v17;

  v10 = a3 - a5;
  v11 = a4 - a5;
  v12 = a4 == 86400.0 && a10;
  v13 = -0.0;
  if (v12 && a9)
    v13 = a8;
  v14 = v11 + v13;
  if (v10 > 0.0 || v14 <= 0.0)
  {
    if (v14 > 0.0)
    {
      v17 = v10 == a6;
      v16 = v10 >= a6;
    }
    else
    {
      v16 = 1;
      v17 = 0;
    }
    if (!v17 && v16)
      return 1;
    else
      return 36;
  }
  else if (v14 <= a7)
  {
    return 66;
  }
  else
  {
    return 2;
  }
}

@end
