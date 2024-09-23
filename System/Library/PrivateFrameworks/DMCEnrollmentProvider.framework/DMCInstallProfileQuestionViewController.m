@implementation DMCInstallProfileQuestionViewController

- (DMCInstallProfileQuestionViewController)initWithStyle:(int64_t)a3
{
  DMCInstallProfileQuestionViewController *v3;
  DMCInstallProfileQuestionViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCInstallProfileQuestionViewController;
  v3 = -[DMCProfileTableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[DMCInstallProfileQuestionViewController _setup](v3, "_setup");
  return v4;
}

- (DMCInstallProfileQuestionViewController)initWithUserInput:(id)a3
{
  id v4;
  DMCInstallProfileQuestionViewController *v5;
  DMCFieldCollection *v6;
  DMCFieldCollection *fieldCollection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCInstallProfileQuestionViewController;
  v5 = -[DMCProfileTableViewController initWithStyle:](&v9, sel_initWithStyle_, 2);
  if (v5)
  {
    v6 = -[DMCFieldCollection initWithUserInput:]([DMCFieldCollection alloc], "initWithUserInput:", v4);
    fieldCollection = v5->_fieldCollection;
    v5->_fieldCollection = v6;

    -[DMCInstallProfileQuestionViewController _setup](v5, "_setup");
  }

  return v5;
}

- (DMCInstallProfileQuestionViewController)initWithFieldCollection:(id)a3
{
  id v5;
  DMCInstallProfileQuestionViewController *v6;
  DMCInstallProfileQuestionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCInstallProfileQuestionViewController;
  v6 = -[DMCProfileTableViewController initWithStyle:](&v9, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fieldCollection, a3);
    -[DMCInstallProfileQuestionViewController _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCInstallProfileQuestionViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v5, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonTitle:", &stru_24D52F990);

  -[DMCInstallProfileQuestionViewController _showNavButtonsAnimated:](self, "_showNavButtonsAnimated:", 0);
  -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCInstallProfileQuestionViewController;
  -[DMCInstallProfileQuestionViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[DMCInstallProfileQuestionViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)setQuestionsDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_questionsDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_questionsDelegate, obj);
    objc_msgSend(obj, "setCurrentQuestionsController:", self);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fieldDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finePrint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("MCProfileQuestionCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1000, CFSTR("MCProfileQuestionCell"));
  if (!objc_msgSend(v6, "row"))
  {
    objc_msgSend(v7, "setTextFieldOffset:", 0.0);
    objc_msgSend(v7, "setSelectionStyle:", 0);
    objc_msgSend(v7, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__textFieldDidChange, *MEMORY[0x24BDF7F58], 0);

    -[DMCInstallProfileQuestionViewController _configureQuestionField:](self, "_configureQuestionField:", v8);
    -[DMCInstallProfileQuestionViewController setTextField:](self, "setTextField:", v8);

  }
  return v7;
}

- (void)_configureQuestionField:(id)a3
{
  DMCFieldCollection *fieldCollection;
  id v4;
  void *v5;
  void *v6;
  id v7;

  fieldCollection = self->_fieldCollection;
  v4 = a3;
  -[DMCFieldCollection currentField](fieldCollection, "currentField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(v7, "isPassword"));
  objc_msgSend(v4, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));
  objc_msgSend(v4, "setAutocapitalizationType:", objc_msgSend(v7, "capitalizationType"));
  objc_msgSend(v4, "setAutocorrectionType:", 1);
  objc_msgSend(v4, "setClearButtonMode:", 3);
  objc_msgSend(v7, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v7, "placeholderValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v6);

}

- (void)_textFieldDidChange
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  id v10;

  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isRequired"))
  {
    -[DMCInstallProfileQuestionViewController textField](self, "textField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    objc_msgSend(v10, "minimumLength");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v10, "minimumLength");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v5 >= objc_msgSend(v7, "integerValue");

    }
    else
    {
      v8 = 1;
    }

    if (v5)
      v9 = v8;
    else
      v9 = 0;
    -[DMCInstallProfileQuestionViewController _setRightButtonEnabled:](self, "_setRightButtonEnabled:", v9);
  }

}

- (void)_preflightCurrentPayload
{
  void *v3;
  id v4;

  -[DMCInstallProfileQuestionViewController _showProgressIndicator](self, "_showProgressIndicator");
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCFieldCollection responseDictionariesForCurrentPayload](self->_fieldCollection, "responseDictionariesForCurrentPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preflightUserInputResponses:forPayloadIndex:", v3, -[DMCFieldCollection currentPayloadIndex](self->_fieldCollection, "currentPayloadIndex"));

}

- (void)profileConnectionDidFinishPreflightWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[DMCInstallProfileQuestionViewController _hideProgressIndicator](self, "_hideProgressIndicator");
  if (self->_waitingForPasscodePreflight)
  {
    self->_waitingForPasscodePreflight = 0;
    -[DMCInstallProfileQuestionViewController _didFinishPasscodePreflightWithError:](self, "_didFinishPasscodePreflightWithError:", v4);
  }
  else
  {
    -[DMCInstallProfileQuestionViewController _didFinishPreflightWithError:](self, "_didFinishPreflightWithError:", v4);
  }

}

- (void)_didFinishPasscodePreflightWithError:(id)a3
{
  NSString *previousResponseValue;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    previousResponseValue = self->_previousResponseValue;
    self->_previousResponseValue = 0;

    -[DMCInstallProfileQuestionViewController _retryCurrentPasswordFieldWithError:](self, "_retryCurrentPasswordFieldWithError:", v10);
  }
  else
  {
    -[DMCInstallProfileQuestionViewController _showNavButtonsAnimated:](self, "_showNavButtonsAnimated:", 1);
    -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
    -[DMCFieldCollection currentField](self->_fieldCollection, "currentField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "retypeDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_24D52F990;
    objc_msgSend(v5, "setFieldDescription:", v8);

    -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (void)_didFinishPreflightWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    -[DMCInstallProfileQuestionViewController _continueOrFinish](self, "_continueOrFinish");
    goto LABEL_8;
  }
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE63748]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE63750]))
  {

    goto LABEL_7;
  }
  v7 = -[DMCFieldCollection currentFieldIsSinglePasswordField](self->_fieldCollection, "currentFieldIsSinglePasswordField");

  if (!v7)
  {
LABEL_7:
    -[DMCInstallProfileQuestionViewController _showAlertForError:](self, "_showAlertForError:", v8);
    goto LABEL_8;
  }
  -[DMCInstallProfileQuestionViewController _retryCurrentPasswordFieldWithError:](self, "_retryCurrentPasswordFieldWithError:", v8);
LABEL_8:

}

- (void)updateWithUserInput:(id)a3
{
  id v4;
  DMCFieldCollection *v5;
  DMCFieldCollection *fieldCollection;

  v4 = a3;
  v5 = -[DMCFieldCollection initWithUserInput:]([DMCFieldCollection alloc], "initWithUserInput:", v4);

  fieldCollection = self->_fieldCollection;
  self->_fieldCollection = v5;

  -[DMCInstallProfileQuestionViewController _continueWithCurrentField](self, "_continueWithCurrentField");
}

- (void)_processResponseAndContinue
{
  void *v3;
  void *v4;
  int v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *previousResponseValue;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;

  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCInstallProfileQuestionViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v14, "needsRetype"))
  {
    v5 = 0;
    goto LABEL_6;
  }
  if (!self->_previousResponseValue)
  {
    v8 = (NSString *)objc_msgSend(v4, "copy");
    previousResponseValue = self->_previousResponseValue;
    self->_previousResponseValue = v8;

    if (objc_msgSend(v14, "isDevicePasscodeField"))
    {
      objc_msgSend(v14, "setUserResponse:", v4);
      v5 = 0;
      self->_waitingForPasscodePreflight = 1;
      goto LABEL_6;
    }
    objc_msgSend(v14, "retypeDescription");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_24D52F990;
    objc_msgSend(v14, "setFieldDescription:", v13);

    -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
    -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");
    goto LABEL_22;
  }
  if ((objc_msgSend(v4, "isEqualToString:") & 1) == 0)
  {
    v10 = self->_previousResponseValue;
    self->_previousResponseValue = 0;

    if (objc_msgSend(v14, "isDevicePasscodeField"))
      objc_msgSend(v14, "setUserResponse:", 0);
    objc_msgSend(v14, "mismatchDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v5 = objc_msgSend(v14, "isDevicePasscodeField");
  v6 = self->_previousResponseValue;
  self->_previousResponseValue = 0;

LABEL_6:
  if (self->_waitingForPasscodePreflight || (v5 & 1) != 0)
  {
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v14, "setUserResponse:", v4);
    if (-[DMCFieldCollection currentFieldIsLastInPayload](self->_fieldCollection, "currentFieldIsLastInPayload"))
    {
LABEL_9:
      -[DMCInstallProfileQuestionViewController _preflightCurrentPayload](self, "_preflightCurrentPayload");
      -[DMCInstallProfileQuestionViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endEditing:", 1);
LABEL_22:

      goto LABEL_23;
    }
  }
  -[DMCInstallProfileQuestionViewController _continueOrFinish](self, "_continueOrFinish");
LABEL_23:

}

- (void)_setRightButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_showProgressIndicator
{
  void *v3;
  void *v4;

  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:animated:", 0, 0);

  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:animated:", 0, 0);

  -[DMCProfileTableViewController showProgressInNavBar](self, "showProgressInNavBar");
}

- (void)_hideProgressIndicator
{
  -[DMCProfileTableViewController hideProgressInNavBarShowBackButton:](self, "hideProgressInNavBarShowBackButton:", 0);
}

- (void)_showNavButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BDF6860]);
  DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_NEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel__processResponseAndContinue);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelInput);
  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:animated:", v10, v3);

  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:animated:", v7, v3);

}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (-[DMCFieldCollection currentFieldIsFinalField](self->_fieldCollection, "currentFieldIsFinalField")
    && (!objc_msgSend(v9, "needsRetype") || self->_previousResponseValue))
  {
    -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStyle:", 2);

  }
  if (objc_msgSend(v9, "isRequired"))
  {
    objc_msgSend(v9, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
      -[DMCInstallProfileQuestionViewController _setRightButtonEnabled:](self, "_setRightButtonEnabled:", 0);
  }
  objc_msgSend(v9, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCInstallProfileQuestionViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

}

- (void)_tellDelegateDidFinishWithUserInputResponses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCInstallProfileQuestionViewController questionsDelegate](self, "questionsDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "questionsController:didFinishWithResponses:", self, v4);

}

- (void)_cancelInput
{
  -[DMCInstallProfileQuestionViewController _tellDelegateDidFinishWithUserInputResponses:](self, "_tellDelegateDidFinishWithUserInputResponses:", 0);
}

- (void)_continueWithCurrentField
{
  id v3;

  -[DMCInstallProfileQuestionViewController _showNavButtonsAnimated:](self, "_showNavButtonsAnimated:", 1);
  -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_retryWithCurrentField
{
  void *v3;
  void *v4;
  id v5;

  -[DMCInstallProfileQuestionViewController _showNavButtonsAnimated:](self, "_showNavButtonsAnimated:", 1);
  -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[DMCInstallProfileQuestionViewController textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

}

- (void)_retryCurrentPasswordFieldWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DMCInstallProfileQuestionViewController _showNavButtonsAnimated:](self, "_showNavButtonsAnimated:", 1);
  -[DMCInstallProfileQuestionViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[DMCFieldCollection currentField](self->_fieldCollection, "currentField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setFieldDescription:", v5);
  objc_msgSend(v8, "localizedRecoverySuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setFinePrint:", v6);
  -[DMCInstallProfileQuestionViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_finishInput
{
  id v3;

  -[DMCFieldCollection userInputResponses](self->_fieldCollection, "userInputResponses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCInstallProfileQuestionViewController _tellDelegateDidFinishWithUserInputResponses:](self, "_tellDelegateDidFinishWithUserInputResponses:", v3);

}

- (void)_continueOrFinish
{
  void *v3;
  void *v4;
  DMCInstallProfileQuestionViewController *v5;

  if (-[DMCFieldCollection currentFieldIsFinalField](self->_fieldCollection, "currentFieldIsFinalField"))
  {
    -[DMCInstallProfileQuestionViewController _finishInput](self, "_finishInput");
  }
  else
  {
    -[DMCFieldCollection moveToNextField](self->_fieldCollection, "moveToNextField");
    -[DMCInstallProfileQuestionViewController _continueWithCurrentField](self, "_continueWithCurrentField");
    v5 = -[DMCInstallProfileQuestionViewController initWithFieldCollection:]([DMCInstallProfileQuestionViewController alloc], "initWithFieldCollection:", self->_fieldCollection);
    -[DMCInstallProfileQuestionViewController questionsDelegate](self, "questionsDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCInstallProfileQuestionViewController setQuestionsDelegate:](v5, "setQuestionsDelegate:", v3);

    -[DMCInstallProfileQuestionViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v5, 1);

  }
}

- (void)_showAlertForError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  DMCInstallProfileQuestionViewController *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = (void *)MEMORY[0x24BDF67F0];
  v5 = a3;
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedRecoverySuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE63748]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE63760]))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_RETRY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCInstallProfileQuestionViewController _addActionForError:title:toAlert:](self, "_addActionForError:title:toAlert:", 0, v10, v17);

    v11 = CFSTR("DMC_GENERAL_SKIP");
LABEL_5:
    DMCEnrollmentLocalizedString(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE63758]))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_RETRY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCInstallProfileQuestionViewController _addActionForError:title:toAlert:](self, "_addActionForError:title:toAlert:", 0, v12, v17);

    v11 = CFSTR("DMC_GENERAL_IGNORE");
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE63750]))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_CANCEL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCInstallProfileQuestionViewController _addActionForError:title:toAlert:](self, "_addActionForError:title:toAlert:", 2, v16, v17);

    DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_RETRY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = 0;
  }
  else
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_OK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = 3;
  }
LABEL_6:
  -[DMCInstallProfileQuestionViewController _addActionForError:title:toAlert:](v14, "_addActionForError:title:toAlert:", v15, v13, v17);

  -[DMCInstallProfileQuestionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

- (void)_addActionForError:(unint64_t)a3 title:(id)a4 toAlert:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x24BDF67E8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke;
  v12[3] = &unk_24D52EC08;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v8, a3 == 2, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

void __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3[2];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke_2;
  v2[3] = &unk_24D52EBE0;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(v3);
}

void __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleError:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_handleError:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      -[DMCFieldCollection restartCurrentPayload](self->_fieldCollection, "restartCurrentPayload");
      goto LABEL_3;
    case 1uLL:
      -[DMCInstallProfileQuestionViewController _continueOrFinish](self, "_continueOrFinish");
      break;
    case 2uLL:
      -[DMCInstallProfileQuestionViewController _cancelInput](self, "_cancelInput");
      break;
    case 3uLL:
LABEL_3:
      -[DMCInstallProfileQuestionViewController _retryWithCurrentField](self, "_retryWithCurrentField");
      break;
    default:
      return;
  }
}

- (DMCProfileQuestionsControllerDelegate)questionsDelegate
{
  return (DMCProfileQuestionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_questionsDelegate);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_questionsDelegate);
  objc_storeStrong((id *)&self->_previousResponseValue, 0);
  objc_storeStrong((id *)&self->_fieldCollection, 0);
}

@end
