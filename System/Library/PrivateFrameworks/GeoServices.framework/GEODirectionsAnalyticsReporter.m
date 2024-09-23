@implementation GEODirectionsAnalyticsReporter

+ (void)reportDirectionsAnalyticsForRequest:(uint64_t)a1
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  uint8_t v23[16];

  v2 = a2;
  objc_opt_self();
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: ! GEOPlatform.isRunningInGeod", v23, 2u);
    }
  }
  else
  {
    objc_msgSend(v2, "routeAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasAutomobileOptions");

    if ((v4 & 1) != 0)
    {
      v5 = 37;
    }
    else
    {
      objc_msgSend(v2, "routeAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasTransitOptions");

      if ((v7 & 1) != 0)
      {
        v5 = 40;
      }
      else
      {
        objc_msgSend(v2, "routeAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasWalkingOptions");

        if ((v9 & 1) != 0)
        {
          v5 = 41;
        }
        else
        {
          objc_msgSend(v2, "routeAttributes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasCyclingOptions");

          if (v11)
          {
            objc_msgSend(v2, "routeAttributes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cyclingOptions");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "cyclingVehicleSpecifications");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEbike");

            if (v15)
              v5 = 38;
            else
              v5 = 36;
          }
          else
          {
            v5 = 0;
          }
        }
      }
    }
    objc_msgSend(v2, "originalWaypointRoute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "purpose");

    if (v17 == 12)
    {
      objc_msgSend(v2, "originalWaypointRoute");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "creationMethod");

      if (v19 == 1)
      {
        v5 = 219;
LABEL_19:
        objc_msgSend(getGEOAPServiceManagerClass(), "sharedManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reportDailyUsageCountType:", v5);

        goto LABEL_20;
      }
      objc_msgSend(v2, "originalWaypointRoute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "creationMethod");

      if (v21 == 2)
      {
        v5 = 218;
        goto LABEL_19;
      }
    }
    if ((_DWORD)v5)
      goto LABEL_19;
  }
LABEL_20:

}

@end
