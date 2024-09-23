@implementation CXAnswerCallAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  NSSize v9;
  NSSize v10;

  v8.receiver = self;
  v8.super_class = (Class)CXAnswerCallAction;
  -[CXCallAction customDescription](&v8, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAnswerCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  NSStringFromSize(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localLandscapeAspectRatio=%@"), v4);

  -[CXAnswerCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  NSStringFromSize(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localPortraitAspectRatio=%@"), v5);

  -[CXAnswerCallAction dateConnected](self, "dateConnected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateConnected=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" downgradeToAudio=%d"), -[CXAnswerCallAction downgradeToAudio](self, "downgradeToAudio"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" pauseVideoToStart=%d"), -[CXAnswerCallAction pauseVideoToStart](self, "pauseVideoToStart"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screening=%d"), -[CXAnswerCallAction screening](self, "screening"));
  return v3;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXAnswerCallAction fulfillWithDateConnected:](self, "fulfillWithDateConnected:", v3);

}

- (void)fulfillWithDateConnected:(NSDate *)dateConnected
{
  void *v4;
  void *v5;
  NSDate *v6;

  v6 = dateConnected;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXAnswerCallAction fulfillWithDateConnected:]", CFSTR("dateConnected"));
  v4 = (void *)-[CXAnswerCallAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithDateConnected:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (void)updateAsFulfilledWithDateConnected:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXAnswerCallAction setDateConnected:](self, "setDateConnected:", v4);

}

+ (double)timeout
{
  return 60.0;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXAnswerCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v8, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXAnswerCallAction dateConnected](self, "dateConnected", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateConnected:", v7);

}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXAnswerCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  -[CXAnswerCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio", v7.receiver, v7.super_class);
  objc_msgSend(v6, "setLocalLandscapeAspectRatio:");
  -[CXAnswerCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  objc_msgSend(v6, "setLocalPortraitAspectRatio:");
  objc_msgSend(v6, "setDowngradeToAudio:", -[CXAnswerCallAction downgradeToAudio](self, "downgradeToAudio"));
  objc_msgSend(v6, "setPauseVideoToStart:", -[CXAnswerCallAction pauseVideoToStart](self, "pauseVideoToStart"));
  objc_msgSend(v6, "setScreening:", -[CXAnswerCallAction screening](self, "screening"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAnswerCallAction)initWithCoder:(id)a3
{
  id v4;
  CXAnswerCallAction *v5;
  CXAnswerCallAction *v6;
  CGSize *p_localLandscapeAspectRatio;
  void *v8;
  objc_class *v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDate *dateConnected;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CXAnswerCallAction;
  v5 = -[CXCallAction initWithCoder:](&v22, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_localLandscapeAspectRatio = &v5->_localLandscapeAspectRatio;
    NSStringFromSelector(sel_localLandscapeAspectRatio);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v8);
    *(_QWORD *)&p_localLandscapeAspectRatio->width = v9;
    v6->_localLandscapeAspectRatio.height = v10;

    NSStringFromSelector(sel_localPortraitAspectRatio);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v11);
    v6->_localPortraitAspectRatio.width = v12;
    v6->_localPortraitAspectRatio.height = v13;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_dateConnected);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v16;

    NSStringFromSelector(sel_downgradeToAudio);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_downgradeToAudio = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_pauseVideoToStart);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_pauseVideoToStart = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_screening);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_screening = objc_msgSend(v4, "decodeBoolForKey:", v20);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CXAnswerCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  -[CXAnswerCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio", v23.receiver, v23.super_class);
  v6 = v5;
  v8 = v7;
  NSStringFromSelector(sel_localLandscapeAspectRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v9, v6, v8);

  -[CXAnswerCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  v11 = v10;
  v13 = v12;
  NSStringFromSelector(sel_localPortraitAspectRatio);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v14, v11, v13);

  -[CXAnswerCallAction dateConnected](self, "dateConnected");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateConnected);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[CXAnswerCallAction downgradeToAudio](self, "downgradeToAudio");
  NSStringFromSelector(sel_downgradeToAudio);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[CXAnswerCallAction pauseVideoToStart](self, "pauseVideoToStart");
  NSStringFromSelector(sel_pauseVideoToStart);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[CXAnswerCallAction screening](self, "screening");
  NSStringFromSelector(sel_screening);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localPortraitAspectRatio.width;
  height = self->_localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (BOOL)downgradeToAudio
{
  return self->_downgradeToAudio;
}

- (void)setDowngradeToAudio:(BOOL)a3
{
  self->_downgradeToAudio = a3;
}

- (BOOL)pauseVideoToStart
{
  return self->_pauseVideoToStart;
}

- (void)setPauseVideoToStart:(BOOL)a3
{
  self->_pauseVideoToStart = a3;
}

- (BOOL)screening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateConnected, 0);
}

@end
