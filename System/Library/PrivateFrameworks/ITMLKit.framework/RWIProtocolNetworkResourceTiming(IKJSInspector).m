@implementation RWIProtocolNetworkResourceTiming(IKJSInspector)

+ (id)ik_networkResourceTimingFromData:()IKJSInspector referenceStartDate:
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;
  double (**v19)(_QWORD, double);
  double (**v20)(_QWORD);
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("IKJSNetworkRequestRecordStartTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v5, "objectForKey:", CFSTR("IKJSNetworkRequestRecordRedirectStartTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v5, "objectForKey:", CFSTR("IKJSNetworkRequestRecordRedirectEndTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = MEMORY[0x1E0C809B0];
  if (v15 > 0.0)
    v17 = v15;
  else
    v17 = v9;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke;
  v45[3] = &unk_1E9F4C040;
  v46 = v6;
  v18 = v6;
  v19 = (double (**)(_QWORD, double))MEMORY[0x1DF092410](v45);
  v44[0] = v16;
  v44[1] = 3221225472;
  v44[2] = __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke_2;
  v44[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v44[4] = v17;
  v20 = (double (**)(_QWORD))MEMORY[0x1DF092410](v44);
  v43 = v19[2](v19, v9);
  v42 = v19[2](v19, v12);
  v21 = v19[2](v19, v15);
  v22 = v21;
  if (v15 <= 0.0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataFetchStart"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v22 = v20[2](v20);

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataDomainLookupStart"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v41 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataDomainLookupEnd"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v40 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataConnectStart"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v27 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataSecureConnectionStart"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v29 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataConnectEnd"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v31 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataRequestStart"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v33 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataResponseStart"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v35 = v20[2](v20);

  objc_msgSend(v5, "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v37 = v20[2](v20);

  objc_msgSend(MEMORY[0x1E0DD9668], "safe_initWithStartTime:redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:", v43, v42, v21, v22, v41, v40, v27, v31, *(_QWORD *)&v29, *(_QWORD *)&v33, *(_QWORD *)&v35, *(_QWORD *)&v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

@end
