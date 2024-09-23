@implementation ATXFlightStatusDataSource

- (ATXFlightStatusDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXFlightStatusDataSource *v6;
  ATXFlightStatusDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFlightStatusDataSource;
  v6 = -[ATXFlightStatusDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (BOOL)_flightIDIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  NSObject *v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("airlineCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    __atxlog_handle_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource _flightIDIsValid:].cold.1();
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("airlineCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E82C5A18);

  if (v6)
    goto LABEL_11;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalAirportCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    __atxlog_handle_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource _flightIDIsValid:].cold.2();
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalAirportCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", &stru_1E82C5A18);

  if (v9)
    goto LABEL_14;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_17:
    __atxlog_handle_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource _flightIDIsValid:].cold.3();
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", &unk_1E82D5680);

  if (v12)
    goto LABEL_17;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expectedDepartureTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_20:
    __atxlog_handle_heuristic();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource _flightIDIsValid:].cold.4();
LABEL_22:

    v16 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expectedDepartureTimestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", &unk_1E82D5680);

  if (v15)
    goto LABEL_20;
  v16 = 1;
LABEL_23:

  return v16;
}

- (void)flightStatusForFlight:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  __atxlog_handle_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXFlightStatusDataSource flightStatusForFlight:callback:].cold.3((uint64_t)v6, v8);

  if (!-[ATXFlightStatusDataSource _flightIDIsValid:](self, "_flightIDIsValid:", v6))
  {
    __atxlog_handle_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource flightStatusForFlight:callback:].cold.2();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = 2048;
    goto LABEL_12;
  }
  if (!objc_opt_class())
  {
    __atxlog_handle_heuristic();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXFlightStatusDataSource flightStatusForFlight:callback:].cold.1();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = 3328;
LABEL_12:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
    goto LABEL_13;
  }
  v9 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expectedDepartureTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v11 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");

  v12 = (void *)objc_msgSend(MEMORY[0x1E0D222A0], "flightFactoryClassWithProvider:", *MEMORY[0x1E0D22298]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("airlineCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke;
  v21[3] = &unk_1E82C4E08;
  v23 = v7;
  v22 = v6;
  objc_msgSend(v12, "loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:", v14, v15, v11, 1, v21);

LABEL_13:
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
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
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[6];
  _QWORD v72[6];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6 && objc_msgSend(v5, "count"))
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v9 = v5;
    v52 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v52)
    {
      v10 = *(_QWORD *)v64;
      v56 = v5;
      v57 = a1;
      v55 = v9;
      v51 = *(_QWORD *)v64;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v64 != v10)
            objc_enumerationMutation(v9);
          v53 = v11;
          v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v11);
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          objc_msgSend(v12, "legs", v51);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v60;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v60 != v15)
                  objc_enumerationMutation(obj);
                v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                objc_msgSend(v17, "arrival");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "airport");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "IATACode");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("arrivalAirportCode"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v20, "isEqualToString:", v21);

                  if (v22)
                  {
                    objc_msgSend(v17, "departure");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "time");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "date");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v17, "departure");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "delayFromSchedule");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v17, "arrival");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "time");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "date");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v17, "arrival");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "delayFromSchedule");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v17, "arrival");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "airport");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "location");
                    v36 = v35;
                    v38 = v37;

                    if (v25 && v27 && v30 && v32)
                    {
                      v71[0] = CFSTR("estimatedDepartureTimestamp");
                      v41 = (void *)MEMORY[0x1E0CB37E8];
                      v54 = v25;
                      objc_msgSend(v25, "timeIntervalSinceReferenceDate");
                      objc_msgSend(v41, "numberWithDouble:");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v72[0] = v42;
                      v72[1] = v27;
                      v71[1] = CFSTR("departureDelay");
                      v71[2] = CFSTR("arrivalAirport");
                      v72[2] = v20;
                      v71[3] = CFSTR("estimatedArrivalTimestamp");
                      v43 = (void *)MEMORY[0x1E0CB37E8];
                      v44 = v30;
                      objc_msgSend(v30, "timeIntervalSinceReferenceDate");
                      objc_msgSend(v43, "numberWithDouble:");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v72[3] = v45;
                      v72[4] = v32;
                      v71[4] = CFSTR("arrivalDelay");
                      v71[5] = CFSTR("arrivalAirportLocation");
                      v69[0] = CFSTR("lat");
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v69[1] = CFSTR("lon");
                      v70[0] = v46;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v70[1] = v47;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v72[5] = v48;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 6);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      __atxlog_handle_heuristic();
                      v50 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v68 = v49;
                        _os_log_impl(&dword_1C99DF000, v50, OS_LOG_TYPE_INFO, "Received metadata about the flight from FlightUtilities. Flight card: %@", buf, 0xCu);
                      }

                      (*(void (**)(void))(*(_QWORD *)(v57 + 40) + 16))();
                      v6 = 0;
                      v5 = v56;
                      goto LABEL_35;
                    }

                    a1 = v57;
                  }
                }

              }
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
              if (v14)
                continue;
              break;
            }
          }

          v11 = v53 + 1;
          v6 = 0;
          v5 = v56;
          v9 = v55;
          v10 = v51;
        }
        while (v53 + 1 != v52);
        v52 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v52);
    }

    __atxlog_handle_heuristic();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_2();

    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_31;
  }
  __atxlog_handle_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_1((uint64_t)v6, v7);

  v8 = *(_QWORD *)(a1 + 40);
  if (!v6)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v40);

    goto LABEL_35;
  }
  (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(*(_QWORD *)(a1 + 40), 0, v6);
LABEL_35:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_flightIDIsValid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Flight ID: airlineCode is not valid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_flightIDIsValid:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Flight ID: arrivalAirportCode is not valid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_flightIDIsValid:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Flight ID: flightNumber is not valid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_flightIDIsValid:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Flight ID: expectedDepartureTimestamp is not a number.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)flightStatusForFlight:callback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Failed to load the FlightUtilitiesCore Framework.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)flightStatusForFlight:callback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Requested flight status, but the flightID is not valid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)flightStatusForFlight:(uint64_t)a1 callback:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "Requested flight status with flightID: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Encountered an error, or got back no flights -- Error: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "Flight ID was found to be invalid or incomplete from the Flight Status Data Source.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
