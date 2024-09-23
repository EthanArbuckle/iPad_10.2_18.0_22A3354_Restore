@implementation _SFTelephonyNavigationMitigationPolicy

- (void)setDialogPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_dialogPresenter, a3);
}

- (BOOL)policyAppliesToURL:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isTelephonyURL") & 1) != 0
    || (objc_msgSend(v3, "isFaceTimeURL") & 1) != 0
    || (objc_msgSend(v3, "isFaceTimeAudioURL") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isFaceTimeMultiwayURL");
  }

  return v4;
}

- (void)handleNavigationToURL:(id)a3 completionHandler:(id)a4
{
  unint64_t classification;
  id WeakRetained;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  -[_SFTelephonyNavigationMitigationPolicy _checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded](self, "_checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded");
  classification = self->_classification;
  if (classification >= 2)
  {
    if (classification == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
      objc_msgSend(MEMORY[0x1E0D4EC60], "telephonyNavigationDialogWithCompletionHandler:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "presentDialog:sender:", v7, self);

    }
  }
  else
  {
    v8[2](v8, 1);
  }

}

- (void)userAcceptedCallPrompt
{
  -[_SFTelephonyNavigationMitigationPolicy _handleInput:](self, "_handleInput:", 1);
}

- (void)userDeclinedCallPrompt
{
  -[_SFTelephonyNavigationMitigationPolicy _handleInput:](self, "_handleInput:", 0);
}

- (void)_checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSDate *dateUserLastDeclined;

  if (self->_dateUserLastDeclined)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate dateByAddingTimeInterval:](self->_dateUserLastDeclined, "dateByAddingTimeInterval:", 60.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 != -1)
    {
      dateUserLastDeclined = self->_dateUserLastDeclined;
      self->_dateUserLastDeclined = 0;

      -[_SFTelephonyNavigationMitigationPolicy _handleInput:](self, "_handleInput:", 2);
    }
  }
}

- (void)_handleInput:(int64_t)a3
{
  int64_t classification;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  NSDate *v9;
  NSDate *dateUserLastDeclined;

  -[_SFTelephonyNavigationMitigationPolicy _checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded](self, "_checkIfSuspiciousClassificationHasExpiredAndTransitionIfNeeded");
  classification = self->_classification;
  v6 = 2 * ((unint64_t)(a3 - 1) > 1);
  v7 = (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
  if (classification)
    v7 = self->_classification;
  if (classification != 1)
    v6 = v7;
  if (classification == 2)
    v8 = 2 * (a3 != 1);
  else
    v8 = v6;
  self->_classification = v8;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateUserLastDeclined = self->_dateUserLastDeclined;
    self->_dateUserLastDeclined = v9;

  }
}

+ (double)test_suspiciousClassificationExpirationDuration
{
  return 60.0;
}

- (SFDialogPresenting)dialogPresenter
{
  return (SFDialogPresenting *)objc_loadWeakRetained((id *)&self->_dialogPresenter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_storeStrong((id *)&self->_dateUserLastDeclined, 0);
}

@end
