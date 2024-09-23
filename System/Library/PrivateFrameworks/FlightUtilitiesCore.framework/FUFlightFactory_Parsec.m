@implementation FUFlightFactory_Parsec

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  unint64_t v22;

  v15 = a4;
  v16 = a9;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __112__FUFlightFactory_Parsec_loadFlightsWithNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke;
  v19[3] = &unk_24D21BA60;
  v21 = v16;
  v22 = a3;
  v20 = v15;
  v17 = v15;
  v18 = v16;
  objc_msgSend(a1, "loadFlightStructuresWithFlightNumber:airlineCode:date:dateType:userAgent:sessionID:completionHandler:", a3, v17, a5, a6, a7, a8, v19);

}

+ (void)loadFlightStructuresWithFlightNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  int64_t v33;
  id v34;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke;
  v26[3] = &unk_24D21BAB0;
  v31 = v19;
  v32 = a3;
  v27 = v15;
  v28 = v16;
  v33 = a6;
  v34 = a1;
  v29 = v17;
  v30 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v19;
  v25 = v15;
  dispatch_async(v20, v26);

}

@end
