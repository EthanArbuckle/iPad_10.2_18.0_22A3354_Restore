@implementation FAEligiblityEvaluationRequest

- (FAEligiblityEvaluationRequest)initWithPropertyName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  FAEligiblityEvaluationRequest *v8;
  uint64_t v9;
  NSString *propertyName;
  uint64_t v11;
  NSString *bundleID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAEligiblityEvaluationRequest;
  v8 = -[FAFamilyCircleRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    propertyName = v8->_propertyName;
    v8->_propertyName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;

  }
  return v8;
}

- (void)startRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  -[FAEligiblityEvaluationRequest propertyName](self, "propertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke;
  v12 = &unk_1E8561B00;
  v13 = v5;
  v14 = v4;
  v6 = v4;
  v7 = v5;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchEligibilityForPropertyName:bundleID:completion:", self->_propertyName, self->_bundleID, v6, v9, v10, v11, v12);

}

void __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)fetchEligibilityWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  NSString *propertyName;
  NSString *bundleID;
  NSObject *v9;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__5;
  v19[3] = __Block_byref_object_dispose__5;
  v20 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke;
  v13[3] = &unk_1E85624E0;
  v13[4] = &v18;
  -[FAFamilyCircleRequest synchronousRemoteObjectWithErrorHandler:](self, "synchronousRemoteObjectWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  propertyName = self->_propertyName;
  bundleID = self->_bundleID;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke_2;
  v12[3] = &unk_1E85625F0;
  v12[4] = &v18;
  v12[5] = &v14;
  objc_msgSend(v6, "fetchEligibilityForPropertyName:bundleID:completion:", propertyName, bundleID, v12);
  if (*(_QWORD *)(v19[0] + 40))
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FAEligiblityEvaluationRequest fetchEligibilityWithError:].cold.1((uint64_t)v19, v9);

  }
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(v19[0] + 40));
  v10 = v15[3];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__FAEligiblityEvaluationRequest_fetchEligibilityWithError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

void __60__FAEligiblityEvaluationRequest_startRequestWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "Failed to evaluate eligibility for property %@ with XPC error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)fetchEligibilityWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_ERROR, "FARecommendationRequest - synchronous fetchRecommendation request failed with error: %@", (uint8_t *)&v3, 0xCu);
}

@end
