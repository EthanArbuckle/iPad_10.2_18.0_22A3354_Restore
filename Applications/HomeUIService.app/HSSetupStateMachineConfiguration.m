@implementation HSSetupStateMachineConfiguration

- (BOOL)requiresOwnerToPair
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categoryType"));
  if ((objc_msgSend(v4, "isEqualToString:", HMAccessoryCategoryTypeSpeaker) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration category](self, "category"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "categoryType"));
    v5 = objc_msgSend(v7, "isEqualToString:", HMAccessoryCategoryTypeAirPort);

  }
  return v5;
}

- (void)setIsReadyToPair:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  self->_isReadyToPair = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
    v5 = objc_msgSend(v4, "isSetupInitiatedByOtherMatterEcosystem");

    if (v5)
    {
LABEL_3:
      v20 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration delegate](self, "delegate"));
      objc_msgSend(v20, "stateMachineConfigurationIsReadyToPair:", self);
LABEL_12:

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));

    if (v6)
    {
      if (-[HSSetupStateMachineConfiguration requiresOwnerToPair](self, "requiresOwnerToPair")
        && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home")),
            v8 = objc_msgSend(v7, "hf_currentUserIsOwner"),
            v7,
            (v8 & 1) == 0))
      {
        v15 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryInsufficientPrivilegesErrorTitle"));
        v20 = (id)objc_claimAutoreleasedReturnValue(v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v17 = HULocalizedStringWithFormat(CFSTR("HUProximityCardSetupAccessoryAdminInsufficientPrivilegesErrorMessage"), CFSTR("%@"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:title:description:](NSError, "hf_errorWithCode:title:description:", 61, v20, v18, v16));
        -[HSSetupStateMachineConfiguration setPairingError:](self, "setPairingError:", v19);

      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));
        v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

        if ((v10 & 1) != 0)
          goto LABEL_3;
        v11 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryInsufficientPrivilegesErrorTitle"));
        v20 = (id)objc_claimAutoreleasedReturnValue(v11);
        v12 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryUserInsufficientPrivilegesErrorMessage"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:title:description:](NSError, "hf_errorWithCode:title:description:", 61, v20, v13));
        -[HSSetupStateMachineConfiguration setPairingError:](self, "setPairingError:", v14);

      }
      goto LABEL_12;
    }
  }
}

- (void)setPairingError:(id)a3
{
  NSError *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSError *pairingError;
  int v9;
  const char *v10;
  __int16 v11;
  NSError *v12;

  v4 = (NSError *)a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[HSSetupStateMachineConfiguration setPairingError:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s *** Setting pairingError *** = %@", (uint8_t *)&v9, 0x16u);
  }

  pairingError = self->_pairingError;
  self->_pairingError = v4;

}

- (id)updateUserGivenAccessoryName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration validateName:](self, "validateName:", v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A3B0;
  v9[3] = &unk_1000A1838;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v9));

  return v7;
}

- (void)setHome:(id)a3
{
  void *v5;
  HMHome *v6;

  v6 = (HMHome *)a3;
  if (self->_home != v6)
  {
    objc_storeStrong((id *)&self->_home, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration delegate](self, "delegate"));
    objc_msgSend(v5, "stateMachineConfiguration:didUpdateHome:", self, v6);

  }
}

- (HSSetupStateMachineConfiguration)initWithHome:(id)a3
{
  id v5;
  HSSetupStateMachineConfiguration *v6;
  HSSetupStateMachineConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSSetupStateMachineConfiguration;
  v6 = -[HSSetupStateMachineConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_isReadyToPair = 0;
  }

  return v7;
}

- (HSSetupStateMachineConfiguration)initWithAccessory:(id)a3
{
  id v5;
  HSSetupStateMachineConfiguration *v6;
  uint64_t v7;
  HMHome *home;
  uint64_t v9;
  NSString *userGivenAccessoryName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSSetupStateMachineConfiguration;
  v6 = -[HSSetupStateMachineConfiguration init](&v12, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
    home = v6->_home;
    v6->_home = (HMHome *)v7;

    objc_storeStrong((id *)&v6->_addedAccessory, a3);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    userGivenAccessoryName = v6->_userGivenAccessoryName;
    v6->_userGivenAccessoryName = (NSString *)v9;

  }
  return v6;
}

- (HSSetupStateMachineConfiguration)initWithError:(id)a3
{
  id v5;
  HSSetupStateMachineConfiguration *v6;
  HSSetupStateMachineConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSSetupStateMachineConfiguration;
  v6 = -[HSSetupStateMachineConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pairingError, a3);

  return v7;
}

- (HMSetupAccessoryDescription)setupDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMachineConfigurationGetSetupAccessoryDescription:", self));

  return (HMSetupAccessoryDescription *)v4;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMachineConfigurationGetMatterDeviceSetupRequest:", self));

  return (MTSDeviceSetupRequest *)v4;
}

- (HMAccessoryCategory)category
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "category"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "category"));

  }
  return (HMAccessoryCategory *)v6;
}

- (HFAccessoryItem)addedAccessoryItem
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = objc_alloc((Class)HFAccessoryItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
  v5 = objc_alloc_init((Class)HFNullValueSource);
  v6 = objc_msgSend(v3, "initWithAccessory:valueSource:", v4, v5);

  return (HFAccessoryItem *)v6;
}

- (void)setIsShareSiriAnalyticsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;

  if (self->_isShareSiriAnalyticsEnabled != a3)
  {
    v3 = a3;
    v5 = HFLogForCategory(58, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[HSSetupStateMachineConfiguration setIsShareSiriAnalyticsEnabled:]";
      v9 = 1024;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s *** Setting the value for  isShareSiriAnalyticsEnabled *** = %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    self->_isShareSiriAnalyticsEnabled = v3;
  }
}

- (HMCameraProfile)cameraProfile
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cameraProfiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return (HMCameraProfile *)v4;
}

- (BOOL)supportsRichConfiguration
{
  void *v2;
  void *v3;
  unsigned int v4;
  unsigned int v5;
  _BOOL4 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration cameraProfile](self, "cameraProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userSettings"));

  if (v3)
  {
    v4 = objc_msgSend(v3, "supportedFeatures");
    v5 = objc_msgSend(v3, "supportedFeatures");
    v6 = v5 & (v4 >> 1) & ((unint64_t)objc_msgSend(v3, "supportedFeatures") >> 2) & 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HSSetupStateMachineConfigurationDelegate)delegate
{
  return (HSSetupStateMachineConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSetupDescription:(id)a3
{
  objc_storeStrong((id *)&self->_setupDescription, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)isReadyToPair
{
  return self->_isReadyToPair;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (NSString)userGivenAccessoryName
{
  return self->_userGivenAccessoryName;
}

- (void)setUserGivenAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_userGivenAccessoryName, a3);
}

- (NSError)pairingError
{
  return self->_pairingError;
}

- (HMAccessory)addedAccessory
{
  return self->_addedAccessory;
}

- (void)setAddedAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_addedAccessory, a3);
}

- (BOOL)isPlaybackInfluencesForYouEnabled
{
  return self->_isPlaybackInfluencesForYouEnabled;
}

- (void)setIsPlaybackInfluencesForYouEnabled:(BOOL)a3
{
  self->_isPlaybackInfluencesForYouEnabled = a3;
}

- (BOOL)isShareSiriAnalyticsEnabled
{
  return self->_isShareSiriAnalyticsEnabled;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_isExplicitContentAllowed;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  self->_isExplicitContentAllowed = a3;
}

- (HMSiriEndpointOnboardingSelections)onboardingSelections
{
  return self->_onboardingSelections;
}

- (void)setOnboardingSelections:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingSelections, a3);
}

- (BOOL)shouldSkipVoiceProfileSetup
{
  return self->_shouldSkipVoiceProfileSetup;
}

- (void)setShouldSkipVoiceProfileSetup:(BOOL)a3
{
  self->_shouldSkipVoiceProfileSetup = a3;
}

- (NSArray)siriEnabledAccessories
{
  return self->_siriEnabledAccessories;
}

- (void)setSiriEnabledAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_siriEnabledAccessories, a3);
}

- (NSArray)availableSiriLanguageValues
{
  return self->_availableSiriLanguageValues;
}

- (void)setAvailableSiriLanguageValues:(id)a3
{
  objc_storeStrong((id *)&self->_availableSiriLanguageValues, a3);
}

- (NSArray)listOfVoices
{
  return self->_listOfVoices;
}

- (void)setListOfVoices:(id)a3
{
  objc_storeStrong((id *)&self->_listOfVoices, a3);
}

- (BOOL)shouldShowSiriRecognitionLanguageSetup
{
  return self->_shouldShowSiriRecognitionLanguageSetup;
}

- (void)setShouldShowSiriRecognitionLanguageSetup:(BOOL)a3
{
  self->_shouldShowSiriRecognitionLanguageSetup = a3;
}

- (BOOL)shouldShowVoiceSelectionSetup
{
  return self->_shouldShowVoiceSelectionSetup;
}

- (void)setShouldShowVoiceSelectionSetup:(BOOL)a3
{
  self->_shouldShowVoiceSelectionSetup = a3;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (void)setRecognitionLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)allowsRandomVoiceSelection
{
  return self->_allowsRandomVoiceSelection;
}

- (void)setAllowsRandomVoiceSelection:(BOOL)a3
{
  self->_allowsRandomVoiceSelection = a3;
}

- (MTSSystemCommissionerPairingManager)pairingManager
{
  return (MTSSystemCommissionerPairingManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPairingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HFSetupPairingObserver)pairingObserver
{
  return (HFSetupPairingObserver *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPairingObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingObserver, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_listOfVoices, 0);
  objc_storeStrong((id *)&self->_availableSiriLanguageValues, 0);
  objc_storeStrong((id *)&self->_siriEnabledAccessories, 0);
  objc_storeStrong((id *)&self->_onboardingSelections, 0);
  objc_storeStrong((id *)&self->_addedAccessory, 0);
  objc_storeStrong((id *)&self->_pairingError, 0);
  objc_storeStrong((id *)&self->_userGivenAccessoryName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_setupDescription, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)validateName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeManager"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100025680;
  v12[3] = &unk_1000A1F58;
  v13 = v6;
  v14 = v4;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));
  v7 = v15;
  v8 = v4;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v12));

  return v10;
}

- (id)validateNames:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025A14;
  v7[3] = &unk_1000A1F80;
  v7[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", v7));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v3, 0, v4));

  return v5;
}

- (id)configureRoom
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  if (-[HSSetupStateMachineConfiguration isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem")&& (v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory")), v4, !v4))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
    if (!v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupStateMachineConfiguration+Helpers.m"), 70, CFSTR("Can't configure a nil accessory"));

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));
    if (!v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupStateMachineConfiguration+Helpers.m"), 73, CFSTR("Can't configure accessory without a home"));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration roomName](self, "roomName"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rooms"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100025CD8;
      v23[3] = &unk_1000A1FA8;
      v9 = v7;
      v24 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", v23));

      if (v10)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100025D18;
        v19[3] = &unk_1000A18D8;
        v20 = v6;
        v21 = v5;
        v22 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v19));

      }
      else
      {
        v12 = objc_msgSend(objc_alloc((Class)HFRoomBuilder), "initWithHome:", v6);
        objc_msgSend(v12, "setName:", v9);
        objc_msgSend(v12, "addAccessory:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "commitItem"));

      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100025D2C;
      v17[3] = &unk_1000A0D90;
      v18 = v9;
      v13 = objc_msgSend(v11, "addCompletionBlock:", v17);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    }

  }
  return v11;
}

- (id)configureAccessoryName
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HSSetupStateMachineConfiguration *v19;
  HSSetupStateMachineConfiguration *v20;
  HSSetupStateMachineConfiguration *v21;
  HSSetupStateMachineConfiguration *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[4];
  id v41;
  HSSetupStateMachineConfiguration *v42;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration userGivenAccessoryName](self, "userGivenAccessoryName"));
  if (v4)
  {
    if (-[HSSetupStateMachineConfiguration isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem")&& (v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory")), v5, !v5))
    {
      v18 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, v6);
      v19 = self;
      v20 = v19;
      if (v19)
      {
        if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;
        if (!v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v18, objc_opt_class(v20, v25));

        }
      }
      else
      {
        v22 = 0;
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration targetEcosystem](v22, "targetEcosystem"));
      v28 = v26;
      if (v26)
      {
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10002609C;
        v40[3] = &unk_1000A19B8;
        v41 = v26;
        v42 = v22;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v40));

        v29 = v41;
      }
      else
      {
        v30 = HFLogForCategory(58, v27);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_10005F054(v31, v32, v33, v34, v35, v36, v37, v38);

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 8));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v29));
      }

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration userGivenAccessoryName](self, "userGivenAccessoryName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration configureAccessoryWithName:](self, "configureAccessoryWithName:", v7));

    }
  }
  else
  {
    v9 = HFLogForCategory(58, v3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005F024(v10, v11, v12, v13, v14, v15, v16, v17);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v8;
}

- (id)configureAccessoryWithName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void **v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, void *);
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration home](self, "home"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration userGivenAccessoryName](self, "userGivenAccessoryName"));
    *(_DWORD *)buf = 138412802;
    v71 = v8;
    v72 = 2112;
    v73 = v9;
    v74 = 2112;
    v75 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to configure %@ in %@, with userGivenAccessoryName %@", buf, 0x20u);

  }
  v12 = (void *)objc_opt_new(NSMutableArray, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v15 = objc_msgSend(v4, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100026620;
    v67[3] = &unk_1000A19B8;
    v16 = v13;
    v68 = v16;
    v17 = v4;
    v69 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v67));
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000266F4;
    v64[3] = &unk_1000A1DA0;
    v65 = v17;
    v66 = v16;
    v19 = objc_msgSend(v18, "addCompletionBlock:", v64);
    objc_msgSend(v12, "addObject:", v18);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_primaryService"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serviceType"));
  v22 = objc_msgSend(v21, "isEqualToString:", HMServiceTypeTelevision);

  if (v22)
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000267D4;
    v61[3] = &unk_1000A19B8;
    v62 = v13;
    v23 = v4;
    v63 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v61));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100026830;
    v59[3] = &unk_1000A0D90;
    v60 = v23;
    v25 = objc_msgSend(v24, "addCompletionBlock:", v59);
    objc_msgSend(v12, "addObject:", v24);

    v26 = v62;
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(v13, "hf_isSingleServiceLikeAccessory"))
  {
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_visibleServices"));
    v28 = objc_claimAutoreleasedReturnValue(-[NSObject anyObject](v27, "anyObject"));
    if (v28)
    {
      v29 = (id)v28;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_primaryService"));
      v31 = v30;
      if (v30)
      {
        v29 = v30;
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_programmableSwitchServices"));
        v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "anyObject"));

      }
      if (v29)
        goto LABEL_15;
      NSLog(CFSTR("Attempted to name a single service accessory without a visible service"));
      v41 = HFLogForCategory(58, v40);
      v27 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10005F084(v27, v42, v43, v44, v45, v46, v47, v48);
      v29 = 0;
    }

LABEL_15:
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10002690C;
    v55[3] = &unk_1000A18D8;
    v56 = v29;
    v33 = v4;
    v57 = v33;
    v34 = v13;
    v58 = v34;
    v26 = v29;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v55));
    v49 = _NSConcreteStackBlock;
    v50 = 3221225472;
    v51 = sub_1000269DC;
    v52 = &unk_1000A1DA0;
    v53 = v33;
    v54 = v34;
    v36 = objc_msgSend(v35, "addCompletionBlock:", &v49);
    objc_msgSend(v12, "addObject:", v35, v49, v50, v51, v52);

    goto LABEL_16;
  }
LABEL_17:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v37));

  return v38;
}

- (id)configureAccessoryDateAdded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_dateAdded"));

    if (!v5)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100026C3C;
      v13[3] = &unk_1000A16F0;
      v14 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture lazyFutureWithBlock:](NAFuture, "lazyFutureWithBlock:", v13));

      goto LABEL_8;
    }
    v7 = HFLogForCategory(58, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration addedAccessory](self, "addedAccessory"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_dateAdded"));
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating date added for %@ because it is already set to %@", buf, 0x16u);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_8:

  return v11;
}

+ (id)configureService:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultName"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100026F78;
    v11[3] = &unk_1000A19B8;
    v12 = v5;
    v13 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v11));

  }
  return v9;
}

+ (id)configureServices:(id)a3 withNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_opt_new(NSMutableArray, v8);
    if (objc_msgSend(v5, "count"))
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration configureService:withName:](HSSetupStateMachineConfiguration, "configureService:withName:", v11, v12));
        objc_msgSend(v9, "na_safeAddObject:", v13);

        ++v10;
      }
      while (v10 < (unint64_t)objc_msgSend(v5, "count"));
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v9, 1, v14));

  }
  else
  {
    v16 = HFLogForCategory(58, v8);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10005F268(v5, v6, v17);

    NSLog(CFSTR("%s passed different count services [%ld] and names [%ld]"), "+[HSSetupStateMachineConfiguration(Helpers) configureServices:withNames:]", objc_msgSend(v5, "count"), objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v15;
}

+ (id)enableServices:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", &stru_1000A1FE8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v4, 1, v5));

  return v6;
}

+ (id)disableServices:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", &stru_1000A2008));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v4, 1, v5));

  return v6;
}

+ (id)writeVisibilityState:(id)a3 toInputSourceService:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = HMServiceTypeInputSource;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_characteristicEqualToType:forServiceType:", HMCharacteristicTypeTargetVisibilityState, HMServiceTypeInputSource));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_characteristicEqualToType:forServiceType:", HMCharacteristicTypeCurrentVisibilityState, v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    v13 = v12;
    if (v12 && objc_msgSend(v12, "isEqualToNumber:", v6))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    }
    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10002762C;
      v24[3] = &unk_1000A19B8;
      v25 = v10;
      v15 = v6;
      v26 = v15;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v24));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10002763C;
      v21[3] = &unk_1000A2030;
      v22 = v15;
      v23 = a1;
      v16 = objc_msgSend(v14, "addCompletionBlock:", v21);

    }
  }
  else
  {
    v17 = HFLogForCategory(58, v9);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10005F324((uint64_t)a1, v18, v19);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v14;
}

+ (id)writeConfigurationState:(int64_t)a3 toService:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000277B4;
  v8[3] = &unk_1000A2058;
  v9 = a4;
  v10 = a3;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v8));

  return v6;
}

- (BOOL)isSetupInitiatedByOtherMatterEcosystem
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachineConfiguration setupDescription](self, "setupDescription"));
  v3 = objc_msgSend(v2, "isSetupInitiatedByOtherMatterEcosystem");

  return v3;
}

@end
