@implementation CMPedometer(HealthDaemon)

- (void)hd_beginStreamingFromDatum:()HealthDaemon handler:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke;
    v14[3] = &unk_1E6CF3398;
    v15 = v7;
    objc_msgSend(a1, "_startPedometerUpdatesSinceDataRecord:withHandler:", v6, v14);
    v8 = v15;
  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__196;
    v12[4] = __Block_byref_object_dispose__196;
    objc_msgSend(v6, "hd_datestamp");
    v13 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__CMPedometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke_271;
    v9[3] = &unk_1E6D0F740;
    v10 = v7;
    v11 = v12;
    v9[4] = a1;
    objc_msgSend(a1, "queryPedometerDataSinceDataRecord:withHandler:", v6, v9);

    _Block_object_dispose(v12, 8);
    v8 = (void *)v13;
  }

}

@end
