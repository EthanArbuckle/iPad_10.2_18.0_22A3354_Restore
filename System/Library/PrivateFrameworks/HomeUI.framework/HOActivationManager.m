@implementation HOActivationManager

+ (id)sharedInstance
{
  if (_MergedGlobals_628 != -1)
    dispatch_once(&_MergedGlobals_628, &__block_literal_global_2_2);
  return (id)qword_1ED580B70;
}

void __37__HOActivationManager_sharedInstance__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED580B70;
  qword_1ED580B70 = v0;

}

- (HOActivationManager)init
{
  HOActivationManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HOActivationManager;
  v2 = -[HOActivationManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HOActivationManager setLastEnteredForegroundDate:](v2, "setLastEnteredForegroundDate:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__enteredForeground_, *MEMORY[0x1E0CEB350], 0);

  }
  return v2;
}

- (void)_enteredForeground:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HOActivationManager setLastEnteredForegroundDate:](self, "setLastEnteredForegroundDate:", v4);

}

- (NSDate)lastEnteredForegroundDate
{
  return self->_lastEnteredForegroundDate;
}

- (void)setLastEnteredForegroundDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastEnteredForegroundDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEnteredForegroundDate, 0);
}

@end
