@implementation AVSecondScreenContentViewConnection

- (void)startUpdates
{
  void *v3;
  AVObservationController *v4;
  void *v5;
  id v6;

  -[AVSecondScreenConnection observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    -[AVSecondScreenConnection setObservationController:](self, "setObservationController:", v4);

    -[AVSecondScreenConnection observationController](self, "observationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "startObserving:keyPath:observationHandler:", self, CFSTR("player.currentItem.asset"), &__block_literal_global_169);

    -[AVSecondScreenConnection _updatePreferredDisplayCriteria](self, "_updatePreferredDisplayCriteria");
  }
}

- (AVSecondScreenContentViewConnection)initWithContentView:(id)a3
{
  id v4;
  AVSecondScreenContentViewConnection *v5;
  AVSecondScreenContentViewConnection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVSecondScreenContentViewConnection;
  v5 = -[AVSecondScreenContentViewConnection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AVSecondScreenConnection setContentView:](v5, "setContentView:", v4);

  return v6;
}

uint64_t __51__AVSecondScreenContentViewConnection_startUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePreferredDisplayCriteria");
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenConnection observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AVSecondScreenContentViewConnection dealloc]";
    v8 = 1024;
    v9 = 380;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVSecondScreenContentViewConnection;
  -[AVSecondScreenConnection dealloc](&v5, sel_dealloc);
}

@end
