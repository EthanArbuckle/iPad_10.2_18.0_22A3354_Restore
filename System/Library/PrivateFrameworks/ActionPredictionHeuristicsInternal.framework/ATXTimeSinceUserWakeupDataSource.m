@implementation ATXTimeSinceUserWakeupDataSource

- (ATXTimeSinceUserWakeupDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXTimeSinceUserWakeupDataSource *v6;
  ATXTimeSinceUserWakeupDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeSinceUserWakeupDataSource;
  v6 = -[ATXTimeSinceUserWakeupDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3
{
  objc_class *v4;
  void (**v5)(id, void *, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = (void (**)(id, void *, _QWORD))a3;
  v6 = [v4 alloc];
  v12 = (id)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CF9590]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXHeuristicDevice now](self->_device, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  else
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v11, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
