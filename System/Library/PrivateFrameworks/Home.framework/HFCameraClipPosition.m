@implementation HFCameraClipPosition

+ (HFCameraClipPosition)positionWithClip:(id)a3 offset:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEvent:offset:", v6, a4);

  return (HFCameraClipPosition *)v7;
}

+ (HFCameraClipPosition)positionWithEvent:(id)a3 offset:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEvent:offset:", v6, a4);

  return (HFCameraClipPosition *)v7;
}

- (HFCameraClipPosition)initWithEvent:(id)a3 offset:(double)a4
{
  id v8;
  HFCameraClipPosition *v9;
  HFCameraClipPosition *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HMCameraClipManager+HFAdditions.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HFCameraClipPosition;
  v9 = -[HFCameraClipPosition init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    v10->_offset = a4;
  }

  return v10;
}

- (NSDate)date
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCameraClipPosition event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateOfOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPosition offset](self, "offset");
  objc_msgSend(v4, "dateByAddingTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFCameraClipPosition event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPosition offset](self, "offset");
  v6 = (void *)objc_msgSend(v4, "initWithEvent:offset:", v5);

  return v6;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_323 != -1)
    dispatch_once(&_MergedGlobals_323, &__block_literal_global_7_16);
  return (NAIdentity *)(id)qword_1ED379E40;
}

void __35__HFCameraClipPosition_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_12_16);
  v2 = (id)objc_msgSend(v0, "appendDoubleCharacteristic:", &__block_literal_global_14_15);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379E40;
  qword_1ED379E40 = v3;

}

uint64_t __35__HFCameraClipPosition_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clip");
}

uint64_t __35__HFCameraClipPosition_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offset");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipPosition event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("clip"));

  -[HFCameraClipPosition offset](self, "offset");
  v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("offset"), 3);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (double)offset
{
  return self->_offset;
}

- (HFCameraRecordingEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
