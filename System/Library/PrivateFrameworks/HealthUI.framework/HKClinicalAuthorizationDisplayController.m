@implementation HKClinicalAuthorizationDisplayController

- (HKClinicalAuthorizationDisplayController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalAuthorizationDisplayController)initWithAuthorizationController:(id)a3
{
  id v5;
  HKClinicalAuthorizationDisplayController *v6;
  HKClinicalAuthorizationDisplayController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAuthorizationDisplayController;
  v6 = -[HKClinicalAuthorizationDisplayController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authorizationController, a3);

  return v7;
}

- (id)_displayReadAuthorizationDateForMode:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (a3 == 1)
  {
    -[HKClinicalAuthorizationDisplayController authorizationController](self, "authorizationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedTypesForReading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "displayReadAuthorizationAnchorDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = v6;
      else
        v8 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      v3 = v8;

    }
    else
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKClinicalAuthorizationDisplayController _displayReadAuthorizationDateForMode:].cold.1(v9, v4);
      v3 = 0;
    }

  }
  else if (!a3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  }
  return v3;
}

- (id)_displayStringForReadAuthorizationDate:(id)a3
{
  return HKLocalizedStringForDateAndTemplateWithFormattingContext(a3, 34, 1);
}

- (id)currentTimeDisplayStringForReadAuthorizationFooter
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[HKClinicalAuthorizationDisplayController _displayStringForReadAuthorizationDate:](self, "_displayStringForReadAuthorizationDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)committedTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4
{
  void (**v6)(id, void *, int64_t, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void (**)(id, void *, int64_t, void *))a4;
  -[HKClinicalAuthorizationDisplayController _displayReadAuthorizationDateForMode:](self, "_displayReadAuthorizationDateForMode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HKClinicalAuthorizationDisplayController _displayStringForReadAuthorizationDate:](self, "_displayStringForReadAuthorizationDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationDisplayController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4
{
  void (**v6)(id, void *, int64_t, void *);
  void *v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, void *, int64_t, void *))a4;
  -[HKClinicalAuthorizationDisplayController currentTimeDisplayStringForReadAuthorizationFooter](self, "currentTimeDisplayStringForReadAuthorizationFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationDisplayController source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKSource)source
{
  void *v2;
  void *v3;

  -[HKClinicalAuthorizationDisplayController authorizationController](self, "authorizationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSource *)v3;
}

- (HKClinicalSourceAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationController, 0);
}

- (void)_displayReadAuthorizationDateForMode:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "fetchError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "Missing date for read authorization: last authorization controller fetch failed with error %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
