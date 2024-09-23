@implementation FUUtils

+ (id)testDate
{
  return (id)_testDate;
}

+ (void)setTestDate:(id)a3
{
  objc_storeStrong((id *)&_testDate, a3);
}

+ (void)enumerateFlightCodesInString:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t, _BYTE *);
  uint64_t v7;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  uint64_t SubresultWithType;
  uint64_t v15;
  uint64_t Value;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t, _BYTE *))a4;
  v19 = 0;
  v7 = DDScannerCreate();
  if (v7)
  {
    v8 = (const void *)v7;
    v18 = 0;
    if (DDScannerScanString())
    {
      v9 = (const __CFArray *)DDScannerCopyResultsWithOptions();
      if (v9)
      {
        v10 = v9;
        Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          v12 = Count;
          for (i = 0; i < v12; ++i)
          {
            CFArrayGetValueAtIndex(v10, i);
            if (DDResultHasType())
            {
              SubresultWithType = DDResultGetSubresultWithType();
              v15 = DDResultGetSubresultWithType();
              if (SubresultWithType)
              {
                if (v15)
                {
                  Value = DDResultGetValue();
                  v17 = objc_msgSend((id)DDResultGetValue(), "integerValue");
                  v6[2](v6, Value, v17, &v18);
                  if (v18)
                    break;
                }
              }
            }
          }
        }
        CFRelease(v10);
      }
    }
    CFRelease(v8);
  }

}

+ (id)airportFromSFAirport:(id)a3
{
  id v3;
  FUAirport *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(FUAirport);
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lat");
  v7 = v6;
  objc_msgSend(v3, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lng");
  v10 = CLLocationCoordinate2DMake(v7, v9);
  -[FUAirport setLocation:](v4, "setLocation:", v10.latitude, v10.longitude);

  objc_msgSend(v3, "code");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirport setIATACode:](v4, "setIATACode:", v11);

  objc_msgSend(v3, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirport setName:](v4, "setName:", v12);

  objc_msgSend(v3, "city");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirport setCity:](v4, "setCity:", v13);

  objc_msgSend(v3, "timezone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUAirport setTimeZone:](v4, "setTimeZone:", v14);
  return v4;
}

+ (void)extractTimeForFlightStep:(id)a3 fromLeg:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  FUStepTime *v14;
  FUStepTime *v15;
  FUStepTime *v16;
  FUStepTime *v17;
  id v18;

  v18 = a3;
  v5 = a4;
  if ((objc_msgSend(v18, "departure") & 1) != 0)
  {
    objc_msgSend(v5, "departurePublishedTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "departureActualTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "departureGateClosedTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "departureRunwayTime");
  }
  else
  {
    objc_msgSend(v5, "arrivalPublishedTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalActualTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalGateTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrivalRunwayTime");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSince1970");
  if (v10 <= 0.0)
  {

    v6 = 0;
  }
  objc_msgSend(v7, "timeIntervalSince1970");
  if (v11 <= 0.0)
  {

    v7 = 0;
  }
  objc_msgSend(v8, "timeIntervalSince1970");
  if (v12 <= 0.0)
  {

    v8 = 0;
  }
  objc_msgSend(v9, "timeIntervalSince1970");
  if (v13 <= 0.0)
  {

    v9 = 0;
  }
  if (v6)
  {
    v14 = -[FUStepTime initWithType:date:]([FUStepTime alloc], "initWithType:date:", 1, v6);
    objc_msgSend(v18, "setScheduledTime:", v14);

  }
  if (v7)
  {
    v15 = -[FUStepTime initWithType:date:]([FUStepTime alloc], "initWithType:date:", 1, v7);
    objc_msgSend(v18, "setEstimatedTime:", v15);

  }
  if (v8)
  {
    v16 = -[FUStepTime initWithType:date:]([FUStepTime alloc], "initWithType:date:", 1, v8);
    objc_msgSend(v18, "setActualTime:", v16);

  }
  if (v9)
  {
    v17 = -[FUStepTime initWithType:date:]([FUStepTime alloc], "initWithType:date:", 2, v9);
    objc_msgSend(v18, "setRunwayTime:", v17);

  }
  objc_msgSend(v18, "setPlannedTime:", 0);

}

+ (id)convertFlightModel:(id)a3 withError:(id *)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  FUFlightStep *v17;
  FUFlightStep *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  FUFlight *v50;
  void *v51;
  void *v52;
  void *v53;
  FUAirline *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  int v71;
  void *v72;
  FUFlightLeg *v73;
  uint64_t v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v63 = (id)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v4;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v81;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v81 != v62)
          objc_enumerationMutation(obj);
        v66 = v5;
        v6 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v5);
        v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v65 = v6;
        objc_msgSend(v6, "legs");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        if (v70)
        {
          v68 = *(_QWORD *)v77;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v77 != v68)
                objc_enumerationMutation(v67);
              v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v7);
              v9 = 0;
              v10 = 0;
              v73 = objc_alloc_init(FUFlightLeg);
              v74 = v7;
              v11 = 0;
              v13 = objc_msgSend(v8, "status") - 1;
              v12 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              switch(v13)
              {
                case 0:
                  v10 = 0;
                  v11 = 0;
                  v14 = 0;
                  v15 = 0;
                  v12 = 1;
                  v9 = 2;
                  v16 = 2;
                  break;
                case 1:
                  v10 = 0;
                  v11 = 0;
                  v12 = 0;
                  v14 = 0;
                  v15 = 0;
                  v9 = 6;
                  v16 = 6;
                  break;
                case 2:
                  v10 = 0;
                  v11 = 0;
                  v12 = 0;
                  v14 = 0;
                  v15 = 1;
                  v9 = 3;
                  v16 = 5;
                  break;
                case 3:
                case 5:
                  break;
                case 4:
                  v10 = 0;
                  v12 = 0;
                  v14 = 0;
                  v15 = 0;
                  v11 = 1;
                  v9 = 4;
                  v16 = 4;
                  break;
                case 6:
                  v10 = 0;
                  v11 = 0;
                  v12 = 0;
                  v15 = 0;
                  v14 = 1;
                  v9 = 3;
                  v16 = 3;
                  break;
                case 7:
                case 8:
                  v11 = 0;
                  v12 = 0;
                  v14 = 0;
                  v15 = 0;
                  v10 = 1;
                  v9 = 1;
                  v16 = 1;
                  break;
                default:
                  v12 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  break;
              }
              v71 = v15;
              v17 = objc_alloc_init(FUFlightStep);
              -[FUFlightStep setDeparture:](v17, "setDeparture:", 1);
              objc_msgSend(a1, "extractTimeForFlightStep:fromLeg:", v17, v8);
              v18 = objc_alloc_init(FUFlightStep);
              -[FUFlightStep setDeparture:](v18, "setDeparture:", 0);
              objc_msgSend(a1, "extractTimeForFlightStep:fromLeg:", v18, v8);
              -[FUFlightStep time](v17, "time");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "timeIntervalSinceNow");
              v21 = v20;

              -[FUFlightStep time](v18, "time");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "timeIntervalSinceNow");
              v24 = v23;

              if (v24 >= 0.0)
              {
                if (v21 <= 0.0)
                {
                  v27 = 2;
                  if (!(v10 | v11))
                    v27 = v9;
                  if (v24 < 0.0)
                    v27 = v16;
                  if (v21 <= 0.0)
                    v26 = v27;
                  else
                    v26 = v16;
                }
                else if (v11 | v12 | v14 | v71)
                {
                  v26 = 1;
                }
                else
                {
                  v26 = v16;
                }
              }
              else
              {
                v25 = 5;
                if (!v14)
                  v25 = v16;
                if (v10 | v12)
                  v26 = 4;
                else
                  v26 = v25;
              }
              -[FUFlightLeg setStatus:](v73, "setStatus:", v26);
              -[FUFlightStep setLegStatus:](v17, "setLegStatus:", v26);
              -[FUFlightStep setLegStatus:](v18, "setLegStatus:", v26);
              objc_msgSend(v8, "departureGate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setGate:](v17, "setGate:", v28);

              objc_msgSend(v8, "departureTerminal");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setTerminal:](v17, "setTerminal:", v29);

              objc_msgSend(v8, "departureAirport");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "airportFromSFAirport:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setAirport:](v17, "setAirport:", v31);

              -[FUFlightLeg setDeparture:](v73, "setDeparture:", v17);
              objc_msgSend(v8, "arrivalGate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setGate:](v18, "setGate:", v32);

              objc_msgSend(v8, "arrivalTerminal");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setTerminal:](v18, "setTerminal:", v33);

              if (v26 == 5 || v26 == 3)
              {
                objc_msgSend(v8, "divertedAirport");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34 != 0;
              }
              else
              {
                v35 = 0;
                v34 = v72;
              }
              if (v26 == 5 || v26 == 3)

              v72 = v34;
              if (v35)
                objc_msgSend(v8, "divertedAirport");
              else
                objc_msgSend(v8, "arrivalAirport");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "airportFromSFAirport:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightStep setAirport:](v18, "setAirport:", v37);

              -[FUFlightLeg setArrival:](v73, "setArrival:", v18);
              -[FUFlightStep scheduledTime](v18, "scheduledTime");
              v38 = objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                v39 = (void *)v38;
                -[FUFlightStep scheduledTime](v17, "scheduledTime");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40)
                {
                  -[FUFlightStep scheduledTime](v18, "scheduledTime");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "date");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FUFlightStep scheduledTime](v17, "scheduledTime");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
                  v47 = v43;
                  objc_msgSend(v43, "date");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "timeIntervalSinceDate:", v48);
                  -[FUFlightLeg setDuration:](v73, "setDuration:");

                  goto LABEL_53;
                }
              }
              -[FUFlightStep actualTime](v18, "actualTime");
              v44 = objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                v45 = (void *)v44;
                -[FUFlightStep actualTime](v17, "actualTime");
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  -[FUFlightStep actualTime](v18, "actualTime");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "date");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FUFlightStep actualTime](v17, "actualTime");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_52;
                }
              }
LABEL_53:
              objc_msgSend(v8, "baggageClaim");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[FUFlightLeg setBaggageClaim:](v73, "setBaggageClaim:", v49);

              objc_msgSend(v69, "addObject:", v73);
              v7 = v74 + 1;
            }
            while (v70 != v74 + 1);
            v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          }
          while (v70);
        }

        v50 = objc_alloc_init(FUFlight);
        -[FUFlight setAllLegs:](v50, "setAllLegs:", v69);
        objc_msgSend(v65, "flightNumber");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlight setFlightNumber:](v50, "setFlightNumber:", objc_msgSend(v51, "integerValue"));

        -[FUFlight setDisplayFlightNumber:](v50, "setDisplayFlightNumber:", -[FUFlight flightNumber](v50, "flightNumber"));
        objc_msgSend(v65, "flightID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlight setFlightIdentifier:](v50, "setFlightIdentifier:", v52);

        objc_msgSend(v65, "carrierCode");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          v54 = objc_alloc_init(FUAirline);
          objc_msgSend(v65, "carrierCode");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[FUAirline setIATACode:](v54, "setIATACode:", v55);

          objc_msgSend(v65, "carrierName");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[FUAirline setName:](v54, "setName:", v56);

          -[FUFlight setAirline:](v50, "setAirline:", v54);
          -[FUFlight airline](v50, "airline");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[FUFlight setDisplayAirline:](v50, "setDisplayAirline:", v57);

          -[FUFlight displayAirline](v50, "displayAirline");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "IATACode");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[FUFlight setQueriedAirlineTitle:](v50, "setQueriedAirlineTitle:", v59);

        }
        objc_msgSend(v63, "addObject:", v50);

        v5 = v66 + 1;
      }
      while (v66 + 1 != v64);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    }
    while (v64);
  }

  return v63;
}

@end
