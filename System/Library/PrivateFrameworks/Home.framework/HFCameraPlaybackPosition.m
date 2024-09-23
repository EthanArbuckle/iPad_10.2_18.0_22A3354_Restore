@implementation HFCameraPlaybackPosition

+ (id)livePosition
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithContentType:clipPlaybackDate:", 0, 0);
}

+ (id)clipPositionWithDate:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFCameraPlaybackPosition.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackDate != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContentType:clipPlaybackDate:", 1, v5);

  return v6;
}

+ (id)clipPositionWithDate:(id)a3 inClip:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFCameraPlaybackPosition.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackDate != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFCameraPlaybackPosition.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clip != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClipPlaybackDate:inClip:", v7, v9);

  return v10;
}

- (HFCameraPlaybackPosition)initWithContentType:(unint64_t)a3 clipPlaybackDate:(id)a4
{
  id v7;
  HFCameraPlaybackPosition *v8;
  HFCameraPlaybackPosition *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCameraPlaybackPosition;
  v8 = -[HFCameraPlaybackPosition init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_contentType = a3;
    objc_storeStrong((id *)&v8->_clipPlaybackDate, a4);
  }

  return v9;
}

- (HFCameraPlaybackPosition)initWithClipPlaybackDate:(id)a3 inClip:(id)a4
{
  id v7;
  id v8;
  HFCameraPlaybackPosition *v9;
  HFCameraPlaybackPosition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraPlaybackPosition;
  v9 = -[HFCameraPlaybackPosition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_contentType = 1;
    objc_storeStrong((id *)&v9->_clipPlaybackDate, a3);
    objc_storeStrong((id *)&v10->_clip, a4);
  }

  return v10;
}

- (BOOL)clipIncludesPlaybackDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  -[HFCameraPlaybackPosition clipPlaybackDate](self, "clipPlaybackDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPlaybackPosition clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = v6;

  -[HFCameraPlaybackPosition clip](self, "clip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  LOBYTE(v3) = v9 - v7 > 0.00000011920929;

  return (char)v3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_221 != -1)
    dispatch_once(&_MergedGlobals_221, &__block_literal_global_9_0);
  return (NAIdentity *)(id)qword_1ED378DB0;
}

void __39__HFCameraPlaybackPosition_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_17_0);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378DB0;
  qword_1ED378DB0 = v3;

}

uint64_t __39__HFCameraPlaybackPosition_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "contentType"));
}

uint64_t __39__HFCameraPlaybackPosition_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clipPlaybackDate");
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
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[HFCameraPlaybackPosition contentType](self, "contentType");
  if (!v3)
    return (NSString *)CFSTR("[Live]");
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPlaybackPosition clipPlaybackDate](self, "clipPlaybackDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("clipPlaybackDate"));

    -[HFCameraPlaybackPosition clipPlaybackDate](self, "clipPlaybackDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraUtilities fullTimeStringFromDate:](HFCameraUtilities, "fullTimeStringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v8, CFSTR("date"));

    -[HFCameraPlaybackPosition clip](self, "clip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("clipUUID"));

    objc_msgSend(v4, "build");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v12;
  }
  else
  {
    HFLogForCategory(0x17uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCameraPlaybackPosition contentType](self, "contentType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v18;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Unknown content type %@", buf, 0xCu);

    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCameraPlaybackPosition contentType](self, "contentType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("[Unknown content type %@]"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v17;
  }
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSDate)clipPlaybackDate
{
  return self->_clipPlaybackDate;
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_clipPlaybackDate, 0);
}

@end
