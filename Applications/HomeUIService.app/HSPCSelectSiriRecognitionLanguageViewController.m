@implementation HSPCSelectSiriRecognitionLanguageViewController

- (id)hu_preloadContent
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016718;
  v3[3] = &unk_1000A16F0;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v3));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSPCSelectSiriRecognitionLanguageViewController;
  -[HSPCSelectSiriRecognitionLanguageViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickerView"));
  objc_msgSend(v5, "selectRow:inComponent:animated:", 0, 0, 0);

}

- (id)selectedSiriRecognitionLanguage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pickerView"));
  v5 = objc_msgSend(v4, "selectedRowInComponent:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController recognitionLanguages](self, "recognitionLanguages"));
  v7 = 0;
  if (v5 < objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController recognitionLanguages](self, "recognitionLanguages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController localizedLanguageToLanguageCodeMap](self, "localizedLanguageToLanguageCodeMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  return v10;
}

- (HSPCSelectSiriRecognitionLanguageViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCSelectSiriRecognitionLanguageViewController *v9;
  HSPCSelectSiriRecognitionLanguageViewController *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HSPCSelectSiriRecognitionLanguageViewController;
  v9 = -[HSPCSelectSiriRecognitionLanguageViewController init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SelectSiriRecognitionLanguage_Title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCSelectSiriRecognitionLanguageViewController setTitle:](v10, "setTitle:", v12);

    v13 = -[HSPCSelectSiriRecognitionLanguageViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController selectedSiriRecognitionLanguage](self, "selectedSiriRecognitionLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController config](self, "config"));
  objc_msgSend(v4, "setRecognitionLanguage:", v3);

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8068);
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController recognitionLanguages](self, "recognitionLanguages", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSelectSiriRecognitionLanguageViewController recognitionLanguages](self, "recognitionLanguages", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  return v7;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionLanguages, a3);
}

- (NSDictionary)localizedLanguageToLanguageCodeMap
{
  return self->_localizedLanguageToLanguageCodeMap;
}

- (void)setLocalizedLanguageToLanguageCodeMap:(id)a3
{
  objc_storeStrong((id *)&self->_localizedLanguageToLanguageCodeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLanguageToLanguageCodeMap, 0);
  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
