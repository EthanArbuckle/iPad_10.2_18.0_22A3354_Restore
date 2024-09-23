@implementation HFCameraClipSignificantEventItem

- (HFCameraClipSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HFCameraClipSignificantEventItem *v8;
  uint64_t v9;
  HMCameraProfile *cameraProfile;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraClipSignificantEventItem;
  v8 = -[HFFetchedHomeKitObjectItem initWithHomeKitObject:](&v12, sel_initWithHomeKitObject_, v6);
  if (v8)
  {
    objc_msgSend(v7, "hf_cameraProfileForSignificantEvent:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    cameraProfile = v8->_cameraProfile;
    v8->_cameraProfile = (HMCameraProfile *)v9;

    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCameraClipSignificantEventItem;
  -[HFItem description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HFCameraClipSignificantEventItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ event:%@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFFetchedHomeKitObjectItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_homeKitObjectFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFCameraClipSignificantEventItem cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipSignificantEventItem event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_significantEventWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCameraClipSignificantEventItem;
  -[HFFetchedHomeKitObjectItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HFCameraClipSignificantEventItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__HFCameraClipSignificantEventItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v16;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("HFResultCameraSignificantEventReasonKey"));

  objc_msgSend(*(id *)(a1 + 32), "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("HFResultCameraSignificantEventDateKey"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "confidenceLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("HFResultCameraSignificantEventConfidenceLevelKey"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
  objc_msgSend(*(id *)(a1 + 32), "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "faceClassification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "event");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "faceClassification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("HFResultCameraSignificantEventFaceClassificationKey"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFCameraClipSignificantEventItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipSignificantEventItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSignificantEvent:home:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
