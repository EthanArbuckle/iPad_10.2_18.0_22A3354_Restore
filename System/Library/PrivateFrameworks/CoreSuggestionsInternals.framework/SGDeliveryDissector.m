@implementation SGDeliveryDissector

- (id)createEnrichmentWithMatch:(id)a3 onParentEntity:(id)a4 foundInString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGPipelineEnrichment *v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  uint64_t v20;
  void *v21;
  NSRange v23;
  NSRange v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "valueString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_2;
  objc_msgSend(v7, "valueRange");
  if (!v16)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v17 = objc_msgSend(v9, "length");
  v24.location = objc_msgSend(v7, "valueRange");
  v24.length = v18;
  v23.location = 0;
  v23.length = v17;
  v19 = NSIntersectionRange(v23, v24);
  v15 = 0;
  if (v19.location == objc_msgSend(v7, "valueRange") && v19.length == v20)
  {
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v9, "substringWithRange:", v19.location, v19.length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v21);
    if (v10)
    {
LABEL_2:
      objc_msgSend(v7, "labelString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "duplicateKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGDuplicateKey duplicateKeyForDeliveryWithProviderString:trackingNumber:parentKey:](SGDuplicateKey, "duplicateKeyForDeliveryWithProviderString:trackingNumber:parentKey:", v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:]([SGPipelineEnrichment alloc], "initWithDuplicateKey:title:parent:", v14, CFSTR("DTN"), v8);
      objc_msgSend(v8, "creationTimestamp");
      -[SGPipelineEnrichment setCreationTimestamp:](v15, "setCreationTimestamp:");

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v15;
}

- (id)_createEnrichmentsForDetections:(id)a3 entity:(id)a4 foundInString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__SGDeliveryDissector__createEnrichmentsForDetections_entity_foundInString___block_invoke;
    v13[3] = &unk_1E7DA8790;
    v13[4] = self;
    v14 = v9;
    v15 = v10;
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v28, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v28, "messageSubjectDetectedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDeliveryDissector _createEnrichmentsForDetections:entity:foundInString:](self, "_createEnrichmentsForDetections:entity:foundInString:", v12, v8, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v8, "addEnrichments:", v13);
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGDelivery_ctEmlSub_%lu"), objc_msgSend(v13, "count"));
  objc_msgSend(v14, "logAggregateSummaryForInteraction:", v15);

  objc_autoreleasePoolPop(v10);
  v16 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v28, "textContent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v28, "plainTextDetectedData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDeliveryDissector _createEnrichmentsForDetections:entity:foundInString:](self, "_createEnrichmentsForDetections:entity:foundInString:", v18, v8, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v8, "addEnrichments:", v19);
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGDelivery_ctEmlBod_%lu"), objc_msgSend(v19, "count"));
  objc_msgSend(v20, "logAggregateSummaryForInteraction:", v21);

  objc_autoreleasePoolPop(v16);
  v22 = (void *)MEMORY[0x1C3BD4F6C]();
  v23 = objc_msgSend(v13, "count");
  if (v23 + objc_msgSend(v19, "count"))
  {
    objc_msgSend(v28, "senderDomain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v28, "senderDomain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDeliveryDissector _logDeliverySenderForSenderDomain:](self, "_logDeliverySenderForSenderDomain:", v25);

    }
  }
  objc_autoreleasePoolPop(v22);
  v26 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDeliveryDissector _logUniqueEnrichments:](self, "_logUniqueEnrichments:", v27);

  objc_autoreleasePoolPop(v26);
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_msgSend(v7, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v14, "plainTextDetectedData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDeliveryDissector _createEnrichmentsForDetections:entity:foundInString:](self, "_createEnrichmentsForDetections:entity:foundInString:", v10, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_msgSend(v7, "addEnrichments:", v11);
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGDelivery_ctTxtMsg_%lu"), objc_msgSend(v11, "count"));
  objc_msgSend(v12, "logAggregateSummaryForInteraction:", v13);

  -[SGDeliveryDissector _logUniqueEnrichments:](self, "_logUniqueEnrichments:", v11);
}

- (void)_logDeliverySenderForSenderDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", CFSTR("com.apple.suggestions.deliveries.domain"));
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record:", v6);

  }
}

- (void)_logUniqueEnrichments:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "_pas_leftFoldWithInitialObject:accumulate:", v4, &__block_literal_global_3279);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v9, "count");
  if (v5 >= 0xA)
    v6 = 10;
  else
    v6 = v5;
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGDelivery_ctNumUniq_%lu"), v6);
  objc_msgSend(v7, "logAggregateSummaryForInteraction:", v8);

}

id __45__SGDeliveryDissector__logUniqueEnrichments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char IsDelivery;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityType");
  IsDelivery = SGEntityTypeIsDelivery();

  if ((IsDelivery & 1) != 0)
  {
    objc_msgSend(v5, "duplicateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deliveryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "externalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v9, "externalIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setByAddingObject:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0D197D0], "stringForProvider:", objc_msgSend(v9, "provider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("SGDelivery_pr_%@"), v16);
      objc_msgSend(v14, "logAggregateSummaryForInteraction:", v17);

      v4 = (id)v13;
    }
    v18 = v4;

  }
  else
  {
    v18 = v4;
  }

  return v18;
}

id __76__SGDeliveryDissector__createEnrichmentsForDetections_entity_foundInString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "matchType") == 7)
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "createEnrichmentWithMatch:onParentEntity:foundInString:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
