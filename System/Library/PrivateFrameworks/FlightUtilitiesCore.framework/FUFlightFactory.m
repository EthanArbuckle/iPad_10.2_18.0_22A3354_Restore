@implementation FUFlightFactory

+ (Class)flightFactoryClassWithProvider:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FUFactoryProvider_Default")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("FUFactoryProvider_Parsec")))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (id)parseFlightData:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (void)loadFlightWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v7)
  {
    if (!v6)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 5)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      +[FUFlight timeFormatterForIdentifier](FUFlight, "timeFormatterForIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateFromString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __62__FUFlightFactory_loadFlightWithIdentifier_completionHandler___block_invoke;
      v16[3] = &unk_24D21BA10;
      v17 = v9;
      v18 = v8;
      objc_msgSend(a1, "loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:", v12, v10, v15, 1, v16);

    }
    else
    {
      NSLog(CFSTR("Wrong flight identifier"));
      v8[2](v8, 0, 0);
    }

  }
}

void __62__FUFlightFactory_loadFlightWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    if (!objc_msgSend(v5, "count"))
      goto LABEL_25;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v31 = v6;
    obj = v6;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v38;
      v34 = a1;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(obj);
          v36 = v7;
          v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 3, v31);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "allLegs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            v13 = 0;
            v14 = 0x7FFFFFFFFFFFFFFFLL;
            do
            {
              objc_msgSend(v8, "allLegs");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v17 = v14;
              if (v14 != 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_14;
              objc_msgSend(v16, "departure");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "airport");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "IATACode");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v9);

              v14 = 0x7FFFFFFFFFFFFFFFLL;
              if (v21)
              {
                v17 = v13;
                if (v13 != 0x7FFFFFFFFFFFFFFFLL)
                {
LABEL_14:
                  objc_msgSend(v16, "arrival");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "airport");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "IATACode");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "isEqualToString:", v10);

                  if ((v25 & 1) != 0)
                  {

                    if (v17 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
                      break;
                    objc_msgSend(v8, "setDepartureLegIndex:arrivalLegIndex:", v17, v13);
                    v28 = v8;

                    v6 = v31;
                    a1 = v34;
                    if (v28)
                    {
                      (*(void (**)(void))(*(_QWORD *)(v34 + 40) + 16))();

                      goto LABEL_26;
                    }
LABEL_25:
                    v29 = *(_QWORD *)(a1 + 40);
                    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FlightUtilities.ParseError"), 1, 0, v31);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

                    goto LABEL_26;
                  }
                  v14 = v17;
                }
              }

              ++v13;
              objc_msgSend(v8, "allLegs");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "count");

            }
            while (v13 < v27);
          }

          v7 = v36 + 1;
          a1 = v34;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v35);
    }

    v6 = v31;
    goto LABEL_25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:

}

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7
{
  objc_msgSend(a1, "loadFlightsWithNumber:airlineCode:date:dateType:userAgent:sessionID:completionHandler:", a3, a4, a5, a6, 0, 0, a7);
}

void __112__FUFlightFactory_Parsec_loadFlightsWithNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v41 = 0;
    +[FUUtils convertFlightModel:withError:](FUUtils, "convertFlightModel:withError:", a2, &v41);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v4;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v6, "flightNumber", v27) != *(_QWORD *)(a1 + 48))
            goto LABEL_10;
          objc_msgSend(v6, "airline");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "IATACode");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

          if ((v10 & 1) == 0)
          {
LABEL_10:
            v31 = i;
            v32 = v6;
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v6, "codeShares");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v34 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                  if (objc_msgSend(v16, "flightNumber") == *(_QWORD *)(a1 + 48))
                  {
                    objc_msgSend(v16, "airline");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "IATACode");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v18, "isEqualToString:", v19);

                    if (v20)
                    {
                      objc_msgSend(v32, "setDisplayFlightNumber:", objc_msgSend(v16, "flightNumber"));
                      objc_msgSend(v16, "airline");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setDisplayAirline:", v21);

                    }
                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
              }
              while (v13);
            }

            i = v31;
            v6 = v32;
          }
          v22 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uppercaseStringWithLocale:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setQueriedAirlineTitle:", v24);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v30);
    }

    if (v27)
    {
      v25 = 0;
      v26 = v27;
    }
    else
    {
      v25 = obj;
      v26 = 0;
    }
    (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v25, v26);

  }
}

void __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  objc_class *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  if (!objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    NSLog(CFSTR("trying to handle flight with invalid airline code"));
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = 0;
LABEL_11:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FlightUtilities.QueryError"), v13, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v21);

    return;
  }
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2)
  {
    NSLog(CFSTR("trying to handle flight with invalid flight number"));
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = 1;
    goto LABEL_11;
  }
  if (*(_QWORD *)(a1 + 80) != 1)
  {
    NSLog(CFSTR("trying to handle flight with unsupported date type, using departure by default"));
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = 2;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%lu"), *(_QWORD *)(a1 + 32), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1FA60], "flightRequestForQuery:date:appBundleId:", v3, *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD2A0]);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v8, "length"))
  {

    v8 = CFSTR("1.0");
  }
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FlightUtilities/%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v10;
  v15 = *(__CFString **)(a1 + 56);
  if (!v15)
    v15 = CFSTR("com.apple.flightutilities");
  v16 = (objc_class *)MEMORY[0x24BE1FA78];
  v17 = v15;
  v18 = (void *)objc_msgSend([v16 alloc], "initWithId:userAgent:", v17, v14);
  objc_msgSend(MEMORY[0x24BE1FA70], "sharedPARSessionWithConfiguration:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke_2;
  v22[3] = &unk_24D21BA88;
  v23 = *(id *)(a1 + 64);
  objc_msgSend(v19, "taskWithRequest:completion:", v6, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resume");

}

void __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "flightResults");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v8 = (id)v5;
    if (v5)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v5, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FlightUtilities.NetworkError"), 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }
}

@end
