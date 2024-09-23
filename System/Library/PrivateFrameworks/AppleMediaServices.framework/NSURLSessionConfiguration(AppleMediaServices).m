@implementation NSURLSessionConfiguration(AppleMediaServices)

- (id)ams_configureWithClientInfo:()AppleMediaServices bag:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  AMSMutableBinaryPromise *v14;
  void *v15;
  uint64_t v16;
  AMSMutableBinaryPromise *v17;
  AMSMutableBinaryPromise *v18;
  void *v19;
  void *v20;
  AMSMutableBinaryPromise *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  AMSMutableBinaryPromise *v28;
  _QWORD v29[5];
  AMSMutableBinaryPromise *v30;
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AMSSetLogKeyIfNeeded();
  objc_msgSend(a1, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(a1, "set_timingDataOptions:", 69);
  objc_msgSend(a1, "set_tlsTrustPinningPolicyName:", *MEMORY[0x1E0CD6F90]);
  if (+[AMSEphemeralDefaults preferEphemeralURLSessions](AMSEphemeralDefaults, "preferEphemeralURLSessions"))
  {
    objc_msgSend(a1, "setURLCache:", 0);
    objc_msgSend(a1, "setURLCredentialStorage:", 0);
    objc_msgSend(a1, "setRequestCachePolicy:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "_URLBagCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setURLCache:", v9);

  }
  v10 = !os_variant_has_internal_content()
     || !+[AMSDefaults QAMode](AMSDefaults, "QAMode")
     && !+[AMSDefaults ignoreServerTrustEvaluation](AMSDefaults, "ignoreServerTrustEvaluation")
     && !+[AMSDefaults ss_ignoreServerTrustEvaluation](AMSDefaults, "ss_ignoreServerTrustEvaluation");
  objc_msgSend(a1, "set_alwaysPerformDefaultTrustEvaluation:", v10);
  objc_msgSend(v6, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:", 1);
  objc_msgSend(v6, "auditTokenData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "auditTokenData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "set_sourceApplicationAuditTokenData:", v13);

    objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:", 1);
  }
  v14 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_msgSend(v7, "doubleForKey:", 0x1E254D360);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleForKey:", 0x1E254D380);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v6;
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke;
  v29[3] = &unk_1E253FB28;
  v29[4] = a1;
  v30 = v14;
  v17 = v14;
  +[AMSDefaults shouldSampleWithPercentageValue:sessionDurationValue:identifier:completion:](AMSDefaults, "shouldSampleWithPercentageValue:sessionDurationValue:identifier:completion:", v25, v15, 0x1E25517A0, v29);
  v18 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_msgSend(v7, "doubleForKey:", 0x1E254D3A0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleForKey:", 0x1E254D3C0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke_2;
  v27[3] = &unk_1E253FB28;
  v27[4] = a1;
  v28 = v18;
  v21 = v18;
  +[AMSDefaults shouldSampleWithPercentageValue:sessionDurationValue:identifier:completion:](AMSDefaults, "shouldSampleWithPercentageValue:sessionDurationValue:identifier:completion:", v19, v20, 0x1E2551780, v27);
  v31[0] = v17;
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithAll:](AMSBinaryPromise, "promiseWithAll:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_URLBagCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NSURLSessionConfiguration_AppleMediaServices___URLBagCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEADA88 != -1)
    dispatch_once(&qword_1ECEADA88, block);
  return (id)_MergedGlobals_162;
}

+ (id)ams_configurationWithProcessInfo:()AppleMediaServices bag:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_configurationWithClientInfo:bag:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resultWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ams_configurationWithClientInfo:()AppleMediaServices bag:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = (void *)MEMORY[0x1E0C92CA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_configureWithClientInfo:bag:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "promiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__NSURLSessionConfiguration_AppleMediaServices__ams_configurationWithClientInfo_bag___block_invoke;
  v14[3] = &unk_1E253E440;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)ams_imageConfiguration
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AMSEphemeralDefaults preferEphemeralImageLoader](AMSEphemeralDefaults, "preferEphemeralImageLoader"))
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
    v1 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v1;
  }
  objc_msgSend(v0, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v0, "setTimeoutIntervalForRequest:", 30.0);
  return v0;
}

- (void)ams_configureWithProcessInfo:()AppleMediaServices bag:
{
  id v1;

  objc_msgSend(a1, "ams_configureWithClientInfo:bag:");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resultWithError:", 0);

}

@end
