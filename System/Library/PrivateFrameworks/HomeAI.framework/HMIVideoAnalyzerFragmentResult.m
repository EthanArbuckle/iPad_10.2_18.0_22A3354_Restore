@implementation HMIVideoAnalyzerFragmentResult

- (HMIVideoAnalyzerFragmentResult)initWithFragment:(id)a3 events:(id)a4 frameResults:(id)a5 thumbnails:(id)a6 configuration:(id)a7 outcome:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMIVideoAnalyzerFragmentResult *v18;
  HMIVideoAnalyzerFragmentResult *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMIVideoAnalyzerFragmentResult;
  v18 = -[HMIVideoAnalyzerFragmentResult init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fragment, a3);
    objc_storeStrong((id *)&v19->_events, a4);
    objc_storeStrong((id *)&v19->_frameResults, a5);
    objc_storeStrong((id *)&v19->_thumbnails, a6);
    objc_storeStrong((id *)&v19->_configuration, a7);
    objc_storeStrong((id *)&v19->_outcome, a8);
  }

  return v19;
}

- (id)redactedCopyWithFrameResults:(BOOL)a3 fragment:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  -[HMIVideoAnalyzerFragmentResult frameResults](self, "frameResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFragmentResult thumbnails](self, "thumbnails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMIVideoAnalyzerFragmentResult frameResults](self, "frameResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_29);
    v10 = objc_claimAutoreleasedReturnValue();

    -[HMIVideoAnalyzerFragmentResult thumbnails](self, "thumbnails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_2);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
    v7 = (void *)v10;
  }
  -[HMIVideoAnalyzerFragmentResult fragment](self, "fragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    objc_msgSend(v13, "redactedCopy");
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  v16 = objc_alloc((Class)objc_opt_class());
  -[HMIVideoAnalyzerFragmentResult events](self, "events");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFragmentResult configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFragmentResult outcome](self, "outcome");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithFragment:events:frameResults:thumbnails:configuration:outcome:", v14, v17, v7, v8, v18, v19);

  return v20;
}

uint64_t __72__HMIVideoAnalyzerFragmentResult_redactedCopyWithFrameResults_fragment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "redactedCopy");
}

uint64_t __72__HMIVideoAnalyzerFragmentResult_redactedCopyWithFrameResults_fragment___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "redactedCopy");
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  -[HMIVideoAnalyzerFragmentResult frameResults](self, "frameResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_4_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerFragmentResult events](self, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "na_flatMap:", &__block_literal_global_6_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_3;
  v16[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v16[4] = a3;
  objc_msgSend(v10, "na_filter:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_4;
  v15[3] = &unk_24DBEA4C8;
  v15[4] = &v17;
  objc_msgSend(v12, "na_each:", v15);
  v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v13;
}

id __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allEvents");
}

uint64_t __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

void __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v14 = v4;
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v4, "confidence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "confidence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v13 = v12;

  if (v10 > v13)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

- (id)maxConfidenceEvents
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[HMIVideoAnalyzerEvent eventClasses](HMIVideoAnalyzerEvent, "eventClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__HMIVideoAnalyzerFragmentResult_maxConfidenceEvents__block_invoke;
  v6[3] = &unk_24DBEA4F0;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__HMIVideoAnalyzerFragmentResult_maxConfidenceEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "maxConfidenceEventForEventClass:", a2);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFragmentResult maxConfidenceEvents](self, "maxConfidenceEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Max Confidence Events"), v19);
  v21[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFragmentResult frameResults](self, "frameResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Frame Results"), v6);
  v21[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFragmentResult thumbnails](self, "thumbnails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Thumbnails"), v9);
  v21[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFragmentResult fragment](self, "fragment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Fragment"), v12);
  v21[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerFragmentResult configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Configuration"), v15);
  v21[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerFragmentResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  uint64_t v26;
  void *v27;
  void *v28;
  HMIVideoAnalyzerFragmentResult *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_fragment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_events);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameResults);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDBCF20];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thumbnails);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_opt_class();
  NSStringFromSelector(sel_configuration);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_opt_class();
  NSStringFromSelector(sel_outcome);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = -[HMIVideoAnalyzerFragmentResult initWithFragment:events:frameResults:thumbnails:configuration:outcome:](self, "initWithFragment:events:frameResults:thumbnails:configuration:outcome:", v7, v12, v17, v22, v25, v28);
  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[HMIVideoAnalyzerFragmentResult fragment](self, "fragment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fragment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMIVideoAnalyzerFragmentResult events](self, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_events);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[HMIVideoAnalyzerFragmentResult frameResults](self, "frameResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameResults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[HMIVideoAnalyzerFragmentResult thumbnails](self, "thumbnails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thumbnails);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[HMIVideoAnalyzerFragmentResult configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[HMIVideoAnalyzerFragmentResult outcome](self, "outcome");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_outcome);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (HMIVideoFragment)fragment
{
  return (HMIVideoFragment *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)thumbnails
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMIVideoAnalyzerResultOutcome)outcome
{
  return (HMIVideoAnalyzerResultOutcome *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)frameResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMIVideoAnalyzerDynamicConfiguration)configuration
{
  return (HMIVideoAnalyzerDynamicConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_frameResults, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_thumbnails, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
}

@end
