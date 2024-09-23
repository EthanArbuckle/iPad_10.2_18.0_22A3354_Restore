@implementation HUAnnouncementsBrowserViewController

- (HUAnnouncementsBrowserViewController)initWithNotificationPayload:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUAnnouncementsBrowserViewController *v9;
  HUAnnouncementsBrowserViewController *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  double v15;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUAnnouncementsBrowserViewController;
  v9 = -[HUAnnouncementsBrowserViewController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_notificationPayload, a3);
    v11 = -[HUAnnouncementsBrowserViewController _isNotificationPayloadValid](v10, "_isNotificationPayloadValid");
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      if (v11)
        v13 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Notification payload is valid = [%@]", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v10->_notificationLaunchTimeInterval = v15;

    -[HUAnnouncementsBrowserViewController _commonInit](v10, "_commonInit");
  }

  return v10;
}

- (void)tearDownAudioActivity
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUAnnouncementsBrowserViewController setIsTearingDown:](self, "setIsTearingDown:", 1);
  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    self->_shouldNotSendCurrentRecording = 1;
    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopRecording");

  }
  -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teardownAnnouncements");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[HUAnnouncementsBrowserViewController setNotificationDismissTimeInterval:](self, "setNotificationDismissTimeInterval:");

  -[HUAnnouncementsBrowserViewController _submitAnalyticsForAnnounceNotificationUsage](self, "_submitAnalyticsForAnnounceNotificationUsage");
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if (v4)
  {
    self->_shouldNotSendCurrentRecording = 1;
    -[HUAnnouncementsBrowserViewController _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:", 1, 1);
    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopRecording");

  }
  -[HUAnnouncementsBrowserViewController _deleteAudioFile](self, "_deleteAudioFile");
  -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teardownAnnouncements");

  v7.receiver = self;
  v7.super_class = (Class)HUAnnouncementsBrowserViewController;
  -[HUAnnouncementsBrowserViewController dealloc](&v7, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAnnouncementsBrowserViewController;
  -[HUAnnouncementsBrowserViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HUAnnouncementsBrowserViewController setIsTearingDown:](self, "setIsTearingDown:", 0);
  -[HUAnnouncementsBrowserViewController _configureSubViewsForValidNotificationPayload](self, "_configureSubViewsForValidNotificationPayload");
  -[HUAnnouncementsBrowserViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAccessoryObserver:", self);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUAnnouncementsBrowserViewController nextAnnouncementButton](self, "nextAnnouncementButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_fastForwardButtonImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v5, 0);

  -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController _waveformColor](self, "_waveformColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWaveformColor:", v7);

  -[HUAnnouncementsBrowserViewController _configureVisualStyleForLightedCircleView](self, "_configureVisualStyleForLightedCircleView");
}

- (void)_commonInit
{
  HFAudioRecorder *v3;
  HFAudioRecorder *audioRecorder;
  UIImpactFeedbackGenerator *v5;
  UIImpactFeedbackGenerator *feedbackGenerator;
  ANAnnounce *v7;
  ANAnnounce *announce;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HUAnnouncementsBrowserViewController *v17;

  v3 = (HFAudioRecorder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B8]), "initWithAudioRecorderDelegate:", self);
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = v3;

  -[HFAudioRecorder setRecordingDurationLimit:](self->_audioRecorder, "setRecordingDurationLimit:", 60.0);
  -[HUAnnouncementsBrowserViewController _setupRecipientInformation](self, "_setupRecipientInformation");
  v5 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA660]);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v5;

  v7 = (ANAnnounce *)objc_alloc_init(MEMORY[0x1E0CF7DD8]);
  announce = self->_announce;
  self->_announce = v7;

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allHomesFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke;
  v15[3] = &unk_1E6F56510;
  v16 = v10;
  v17 = self;
  v13 = v10;
  v14 = (id)objc_msgSend(v12, "addCompletionBlock:", v15);

}

void __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Error fetching HomeKit Homes: %@", buf, 0xCu);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke_2;
    v13[3] = &unk_1E6F564E8;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentHome:", v8);
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "currentHome");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Fetched HomeKit Homes: [%@] currentHome ID = [%@] ANHomeID = [%@]", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateUIBasedOnReachabilityStatus");

    v7 = v14;
  }

}

uint64_t __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_setupRecipientInformation
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSString *recipientTitle;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  id v20;

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D48]);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      do
      {
        if ((unint64_t)objc_msgSend(v4, "count") > 1 && v5 == objc_msgSend(v4, "count") - 1)
        {
          recipientTitle = self->_recipientTitle;
          _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecipientTitle_Concatenator"), CFSTR("HUAnnounceRecipientTitle_Concatenator"), 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingString:](recipientTitle, "stringByAppendingString:", v7);
          v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          v9 = self->_recipientTitle;
          self->_recipientTitle = v8;

        }
        v10 = self->_recipientTitle;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          -[NSString stringByAppendingString:](v10, "stringByAppendingString:", v11);
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = self->_recipientTitle;
          self->_recipientTitle = v13;

        }
        else
        {
          v15 = self->_recipientTitle;
          self->_recipientTitle = v11;
          v12 = v15;
        }

        if (++v5 < objc_msgSend(v4, "count"))
        {
          -[NSString stringByAppendingString:](self->_recipientTitle, "stringByAppendingString:", CFSTR(", "));
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          v17 = self->_recipientTitle;
          self->_recipientTitle = v16;

        }
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
  }
  else
  {
    -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CB0]);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_recipientTitle;
    self->_recipientTitle = v18;

  }
}

- (void)_addCommonTranscriptionConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  id *p_announcementGlobeView;
  HUAnnouncementGlobeView *announcementGlobeView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[10];
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  if (_AXSShowAudioTranscriptions())
  {
    -[HUAnnouncementsBrowserViewController announcementProgressLabel](self, "announcementProgressLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[HUAnnouncementsBrowserViewController transcriptionTitleLabel](self, "transcriptionTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v77 = *MEMORY[0x1E0CEA098];
    v9 = v77;
    -[UILabel font](self->_transcriptionTitleLabel, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v8, 3.40282347e38);
    v13 = v12;

    -[UILabel font](self->_transcriptionTitleLabel, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lineHeight");
    v16 = ceil(v13 / v15);

    -[HUAnnouncementsBrowserViewController transcriptionText](self, "transcriptionText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    v75 = v9;
    -[UILabel font](self->_transcriptionText, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 1, v23, 0, v21, 3.40282347e38);
    v25 = v24;

    -[UILabel font](self->_transcriptionText, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lineHeight");
    v28 = ceil(v25 / v27);

    -[UILabel font](self->_transcriptionTitleLabel, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_scaledValueForValue:", 32.0);
    v31 = v30 * (double)(unint64_t)v16;

    -[UILabel font](self->_transcriptionText, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_scaledValueForValue:", 20.0);
    v34 = v33 * (double)(unint64_t)v28;

    v35 = v31 + v34 + 6.0;
    -[UIScrollView heightAnchor](self->_transcriptionScrollView, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v38) = 1132003328;
    objc_msgSend(v37, "setPriority:", v38);
    p_announcementGlobeView = (id *)&self->_announcementGlobeView;
    announcementGlobeView = self->_announcementGlobeView;
    -[UIScrollView topAnchor](self->_transcriptionScrollView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!announcementGlobeView)
      p_announcementGlobeView = (id *)&self->_announcementDeliveryFailureLabel;
    objc_msgSend(*p_announcementGlobeView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 6.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = (void *)MEMORY[0x1E0CB3718];
    v74[0] = v37;
    v74[1] = v73;
    -[UIScrollView leadingAnchor](self->_transcriptionScrollView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "safeAreaLayoutGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v68;
    -[UIScrollView trailingAnchor](self->_transcriptionScrollView, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "safeAreaLayoutGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v63;
    -[UIStackView topAnchor](self->_transcriptionStackView, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView topAnchor](self->_transcriptionScrollView, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v58;
    -[UIStackView leadingAnchor](self->_transcriptionStackView, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView leadingAnchor](self->_transcriptionScrollView, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v74[5] = v55;
    -[UIStackView trailingAnchor](self->_transcriptionStackView, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView trailingAnchor](self->_transcriptionScrollView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v74[6] = v43;
    -[UIStackView bottomAnchor](self->_transcriptionStackView, "bottomAnchor");
    v61 = v37;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bottomAnchor](self->_transcriptionScrollView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v74[7] = v46;
    -[UIStackView heightAnchor](self->_transcriptionStackView, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", v35);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v74[8] = v48;
    -[UIStackView widthAnchor](self->_transcriptionStackView, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView widthAnchor](self->_transcriptionScrollView, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v74[9] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v52);

  }
}

- (void)_addTranscriptionConstraintsForValidNotificationPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HUAnnouncementsBrowserViewController _addCommonTranscriptionConstraints](self, "_addCommonTranscriptionConstraints");
  if (_AXSShowAudioTranscriptions())
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[UIScrollView bottomAnchor](self->_transcriptionScrollView, "bottomAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -20.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithObject:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView topAnchor](self->_announcementGlobeView, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subTitleLabel, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 40.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_safeAddObject:", v9);

    v10 = (void *)MEMORY[0x1E0CB3718];
    v11 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v10, "activateConstraints:", v11);

  }
}

- (void)_configureSubViewsForValidNotificationPayload
{
  void *v3;
  void *v4;
  uint64_t v5;
  UILabel *v6;
  UILabel *largeTitleLabel;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *subTitleLabel;
  void *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  double *v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  UILabel *v36;
  void *v37;
  double v38;
  unint64_t v39;
  UIView *v40;
  UIView *lightedCircleView;
  void *v42;
  void *v43;
  HUAnnouncementGlobeView *v44;
  void *v45;
  HUAnnouncementGlobeView *v46;
  HUAnnouncementGlobeView *announcementGlobeView;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  UILabel *v52;
  UILabel *announcementProgressLabel;
  void *v54;
  void *v55;
  UILabel *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  UIScrollView *v64;
  UIScrollView *transcriptionScrollView;
  void *v66;
  UILabel *v67;
  UILabel *transcriptionTitleLabel;
  void *v69;
  void *v70;
  UILabel *v71;
  void *v72;
  UILabel *v73;
  UILabel *transcriptionText;
  void *v75;
  void *v76;
  void *v77;
  UILabel *v78;
  void *v79;
  id v80;
  UILabel *v81;
  void *v82;
  UIStackView *v83;
  UIStackView *transcriptionStackView;
  void *v85;
  void *v86;
  HUWaveformView *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  HUWaveformView *v94;
  HUWaveformView *audioWaveformView;
  void *v96;
  UILabel *v97;
  UILabel *announcementDeliveryFailureLabel;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  UILongPressGestureRecognizer *v110;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  HURecordingButton *v112;
  void *v113;
  HURecordingButton *v114;
  HURecordingButton *recordButton;
  void *v116;
  void *v117;
  UILabel *v118;
  UILabel *recordButtonLabel;
  uint64_t v120;
  void *v121;
  UILabel *v122;
  void *v123;
  void *v124;
  UIButton *v125;
  UIButton *nextAnnouncementButton;
  UIButton *v127;
  void *v128;
  UIButton *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  UILabel *v143;
  UILabel *errorStatusLabel;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  double v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  NSLayoutConstraint *v216;
  NSLayoutConstraint *audioWaveformViewLeadingConstraint;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  NSLayoutConstraint *v222;
  NSLayoutConstraint *audioWaveformViewTrailingConstraint;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  double v271;
  double v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  uint64_t v300;
  void *v301;
  uint64_t v302;
  void *v303;
  _QWORD v304[4];

  v304[2] = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  largeTitleLabel = self->_largeTitleLabel;
  self->_largeTitleLabel = v6;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  v301 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v9, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_largeTitleLabel, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_largeTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_largeTitleLabel, "setLineBreakMode:", 0);
  v12 = self->_largeTitleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  v14 = self->_largeTitleLabel;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController _announcerNameFromNotificationPayload:](self, "_announcerNameFromNotificationPayload:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v14, "setText:", v16);

  -[UILabel setTextAlignment:](self->_largeTitleLabel, "setTextAlignment:", 1);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "naui_addAutoLayoutSubview:", self->_largeTitleLabel);

  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subTitleLabel = self->_subTitleLabel;
  self->_subTitleLabel = v18;

  v300 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subTitleLabel, "setFont:", v20);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subTitleLabel, "setTextColor:", v21);

  -[UILabel setNumberOfLines:](self->_subTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_subTitleLabel, "setLineBreakMode:", 0);
  v22 = self->_subTitleLabel;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v24);

  -[UILabel setTextAlignment:](self->_subTitleLabel, "setTextAlignment:", 1);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "naui_addAutoLayoutSubview:", self->_subTitleLabel);

  v26 = (double *)MEMORY[0x1E0C9D648];
  if (v5)
  {
    v27 = self->_largeTitleLabel;
    -[HUAnnouncementsBrowserViewController recipientTitle](self, "recipientTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUAnnounceRecipient_Title"), CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v27, "setText:", v35);

    v36 = self->_subTitleLabel;
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSubtitle_Title"), CFSTR("HUAnnounceSubtitle_Title"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v36, "setText:", v37);
    v38 = 1.0;
    v39 = 0x1E0CEA000;
  }
  else
  {
    v40 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    lightedCircleView = self->_lightedCircleView;
    self->_lightedCircleView = v40;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightedCircleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_lightedCircleView, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", 74.0);

    -[HUAnnouncementsBrowserViewController _configureVisualStyleForLightedCircleView](self, "_configureVisualStyleForLightedCircleView");
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "naui_addAutoLayoutSubview:", self->_lightedCircleView);

    v44 = [HUAnnouncementGlobeView alloc];
    -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[HUAnnouncementGlobeView initWithAnnouncementPayload:delegate:](v44, "initWithAnnouncementPayload:delegate:", v45, self);
    announcementGlobeView = self->_announcementGlobeView;
    self->_announcementGlobeView = v46;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49 = objc_msgSend(v48, "CGColor");
    -[HUAnnouncementGlobeView layer](self->_announcementGlobeView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setBackgroundColor:", v49);

    -[HUAnnouncementGlobeView setOpaque:](self->_announcementGlobeView, "setOpaque:", 0);
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "naui_addAutoLayoutSubview:", self->_announcementGlobeView);

    v39 = 0x1E0CEA000uLL;
    v52 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    announcementProgressLabel = self->_announcementProgressLabel;
    self->_announcementProgressLabel = v52;

    -[HUAnnouncementsBrowserViewController _fontForAnnouncementProgressLabel](self, "_fontForAnnouncementProgressLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_announcementProgressLabel, "setFont:", v54);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_announcementProgressLabel, "setTextColor:", v55);

    v56 = self->_announcementProgressLabel;
    HULocalizedStringWithFormat(CFSTR("HUAnnounceProgressLabel_Description"), CFSTR("%lu %lu"), v57, v58, v59, v60, v61, v62, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v56, "setText:", v63);

    -[UILabel setTextAlignment:](self->_announcementProgressLabel, "setTextAlignment:", 1);
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "naui_addAutoLayoutSubview:", self->_announcementProgressLabel);
    v38 = 0.0;
    v10 = 1.0;
  }

  v64 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
  transcriptionScrollView = self->_transcriptionScrollView;
  self->_transcriptionScrollView = v64;

  -[HUAnnouncementsBrowserViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "naui_addAutoLayoutSubview:", self->_transcriptionScrollView);

  v67 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 1792));
  transcriptionTitleLabel = self->_transcriptionTitleLabel;
  self->_transcriptionTitleLabel = v67;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_transcriptionTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_transcriptionTitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_transcriptionTitleLabel, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_transcriptionTitleLabel, "setFont:", v69);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_transcriptionTitleLabel, "setTextColor:", v70);

  -[UILabel setTextAlignment:](self->_transcriptionTitleLabel, "setTextAlignment:", 1);
  v71 = self->_transcriptionTitleLabel;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceTranscript_Title"), CFSTR("HUAnnounceTranscript_Title"), 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v71, "setText:", v72);

  v73 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 1792));
  transcriptionText = self->_transcriptionText;
  self->_transcriptionText = v73;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_transcriptionText, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_transcriptionText, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_transcriptionText, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v300);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_transcriptionText, "setFont:", v75);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_transcriptionText, "setTextColor:", v76);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_transcriptionText, "setBackgroundColor:", v77);

  v78 = self->_transcriptionText;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceTranscript_NoTranscript"), CFSTR("HUAnnounceTranscript_NoTranscript"), 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v78, "setText:", v79);

  -[UILabel setTextAlignment:](self->_transcriptionText, "setTextAlignment:", 1);
  v80 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v81 = self->_transcriptionText;
  v304[0] = self->_transcriptionTitleLabel;
  v304[1] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v304, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (UIStackView *)objc_msgSend(v80, "initWithArrangedSubviews:", v82);
  transcriptionStackView = self->_transcriptionStackView;
  self->_transcriptionStackView = v83;

  -[UIStackView setAxis:](self->_transcriptionStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_transcriptionStackView, "setSpacing:", 6.0);
  -[UIStackView setDistribution:](self->_transcriptionStackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_transcriptionStackView, "setAlignment:", 0);
  -[UIScrollView naui_addAutoLayoutSubview:](self->_transcriptionScrollView, "naui_addAutoLayoutSubview:", self->_transcriptionStackView);
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D78]);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController _applyTranscriptionText:](self, "_applyTranscriptionText:", v86);

  v87 = [HUWaveformView alloc];
  -[HUAnnouncementsBrowserViewController _waveformColor](self, "_waveformColor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *v26;
  v91 = v26[1];
  v92 = v26[2];
  v93 = v26[3];
  v94 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v87, "initWithFrame:waveformColor:backgroundColor:", v88, v89, *v26, v91, v92, v93);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v94;

  -[HUWaveformView setAlpha:](self->_audioWaveformView, "setAlpha:", 0.0);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "naui_addAutoLayoutSubview:", self->_audioWaveformView);

  v97 = (UILabel *)objc_msgSend(objc_alloc(*(Class *)(v39 + 1792)), "initWithFrame:", v90, v91, v92, v93);
  announcementDeliveryFailureLabel = self->_announcementDeliveryFailureLabel;
  self->_announcementDeliveryFailureLabel = v97;

  -[UILabel setAlpha:](self->_announcementDeliveryFailureLabel, "setAlpha:", v38);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_announcementDeliveryFailureLabel, "setFont:", v99);

  -[UILabel setTextAlignment:](self->_announcementDeliveryFailureLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_announcementDeliveryFailureLabel, "setTextColor:", v100);

  -[HUAnnouncementsBrowserViewController recipientTitle](self, "recipientTitle");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUAnnounceNotDeliveredLabel_Description"), CFSTR("%@"), v102, v103, v104, v105, v106, v107, (uint64_t)v101);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_announcementDeliveryFailureLabel, "setText:", v108);

  -[UILabel setNumberOfLines:](self->_announcementDeliveryFailureLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_announcementDeliveryFailureLabel, "setLineBreakMode:", 0);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "naui_addAutoLayoutSubview:", self->_announcementDeliveryFailureLabel);

  v110 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__recordButtonLongPressGesture_);
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v110;

  v112 = [HURecordingButton alloc];
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = -[HURecordingButton initWithSize:state:image:](v112, "initWithSize:state:image:", 0, v113, 64.0, 64.0);
  recordButton = self->_recordButton;
  self->_recordButton = v114;

  -[HURecordingButton addTarget:action:forControlEvents:](self->_recordButton, "addTarget:action:forControlEvents:", self, sel__recordButtonTapped_, 64);
  -[HURecordingButton addGestureRecognizer:](self->_recordButton, "addGestureRecognizer:", self->_longPressGestureRecognizer);
  -[HURecordingButton setIsAccessibilityElement:](self->_recordButton, "setIsAccessibilityElement:", 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton setAccessibilityLabel:](self->_recordButton, "setAccessibilityLabel:", v116);

  -[HUAnnouncementsBrowserViewController view](self, "view");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "naui_addAutoLayoutSubview:", self->_recordButton);

  v118 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 1792));
  recordButtonLabel = self->_recordButtonLabel;
  self->_recordButtonLabel = v118;

  v120 = *MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_recordButtonLabel, "setFont:", v121);

  -[UILabel setTextAlignment:](self->_recordButtonLabel, "setTextAlignment:", 1);
  v122 = self->_recordButtonLabel;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceButton_Title"), CFSTR("HUAnnounceButton_Title"), 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v122, "setText:", v123);

  -[UILabel setIsAccessibilityElement:](self->_recordButtonLabel, "setIsAccessibilityElement:", 0);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "naui_addAutoLayoutSubview:", self->_recordButtonLabel);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v125 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nextAnnouncementButton = self->_nextAnnouncementButton;
  self->_nextAnnouncementButton = v125;

  v127 = self->_nextAnnouncementButton;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v127, "setBackgroundColor:", v128);

  v129 = self->_nextAnnouncementButton;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_fastForwardButtonImage");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v129, "setImage:forState:", v130, 0);

  -[UIButton layer](self->_nextAnnouncementButton, "layer");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setCornerRadius:", 22.0);

  -[UIButton layer](self->_nextAnnouncementButton, "layer");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setMasksToBounds:", 1);

  -[UIButton addTarget:action:forControlEvents:](self->_nextAnnouncementButton, "addTarget:action:forControlEvents:", self, sel__skipToNextAnnouncement_, 64);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceNextButton_AX_Label_Title"), CFSTR("HUAnnounceNextButton_AX_Label_Title"), 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setAccessibilityLabel:](self->_nextAnnouncementButton, "setAccessibilityLabel:", v133);

  -[UIButton setAlpha:](self->_nextAnnouncementButton, "setAlpha:", v10);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "naui_addAutoLayoutSubview:", self->_nextAnnouncementButton);

  -[UILabel text](self->_recordButtonLabel, "text");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "bounds");
  v138 = v137;
  v302 = *MEMORY[0x1E0CEA098];
  -[UILabel font](self->_recordButtonLabel, "font");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v303 = v139;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v303, &v302, 1);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "boundingRectWithSize:options:attributes:context:", 1, v140, 0, v138, 3.40282347e38);
  v142 = v141;

  v143 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 1792));
  errorStatusLabel = self->_errorStatusLabel;
  self->_errorStatusLabel = v143;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v120);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_errorStatusLabel, "setFont:", v145);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_errorStatusLabel, "setTextColor:", v146);

  -[UILabel setTextAlignment:](self->_errorStatusLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_errorStatusLabel, "setNumberOfLines:", 0);
  -[UILabel setAlpha:](self->_errorStatusLabel, "setAlpha:", v38);
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "naui_addAutoLayoutSubview:", self->_errorStatusLabel);

  v148 = (void *)objc_opt_new();
  -[UILabel leadingAnchor](self->_largeTitleLabel, "leadingAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "safeAreaLayoutGuide");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "leadingAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v152, 24.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v153);

  -[UILabel trailingAnchor](self->_largeTitleLabel, "trailingAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "safeAreaLayoutGuide");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "trailingAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:constant:", v157, -24.0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v158);

  -[UILabel topAnchor](self->_largeTitleLabel, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "safeAreaLayoutGuide");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:constant:", v162, 20.0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v163);

  -[UILabel leadingAnchor](self->_subTitleLabel, "leadingAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "safeAreaLayoutGuide");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "leadingAnchor");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "safeAreaInsets");
  objc_msgSend(v164, "constraintEqualToAnchor:constant:", v167, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v170);

  -[UILabel trailingAnchor](self->_subTitleLabel, "trailingAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "safeAreaLayoutGuide");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "trailingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "safeAreaInsets");
  objc_msgSend(v171, "constraintEqualToAnchor:constant:", v174, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v177);

  -[UILabel topAnchor](self->_subTitleLabel, "topAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_largeTitleLabel, "bottomAnchor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:", v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v180);

  if (self->_announcementGlobeView)
  {
    -[UIView centerXAnchor](self->_lightedCircleView, "centerXAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "centerXAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "constraintEqualToAnchor:", v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v184);

    -[UIView topAnchor](self->_lightedCircleView, "topAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subTitleLabel, "bottomAnchor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintEqualToAnchor:constant:", v186, 56.0);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v187);

    -[UIView heightAnchor](self->_lightedCircleView, "heightAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "constraintEqualToConstant:", 148.0);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v189);

    -[UIView widthAnchor](self->_lightedCircleView, "widthAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_lightedCircleView, "heightAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "constraintEqualToAnchor:", v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v192);

    -[HUAnnouncementGlobeView centerXAnchor](self->_announcementGlobeView, "centerXAnchor");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "centerXAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "constraintEqualToAnchor:", v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v196);

    -[HUAnnouncementGlobeView topAnchor](self->_announcementGlobeView, "topAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subTitleLabel, "bottomAnchor");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "constraintEqualToAnchor:constant:", v198, 44.0);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v199);

    -[HUAnnouncementGlobeView heightAnchor](self->_announcementGlobeView, "heightAnchor");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "constraintEqualToConstant:", 176.0);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v201);

    -[HUAnnouncementGlobeView widthAnchor](self->_announcementGlobeView, "widthAnchor");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView heightAnchor](self->_announcementGlobeView, "heightAnchor");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "constraintEqualToAnchor:", v203);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v204);

    -[UILabel centerXAnchor](self->_announcementProgressLabel, "centerXAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "centerXAnchor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "constraintEqualToAnchor:", v207);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v208);

    -[UILabel topAnchor](self->_announcementProgressLabel, "topAnchor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView bottomAnchor](self->_announcementGlobeView, "bottomAnchor");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "constraintEqualToAnchor:constant:", v210, 10.0);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v211);

  }
  -[HUWaveformView leadingAnchor](self->_audioWaveformView, "leadingAnchor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "safeAreaLayoutGuide");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "leadingAnchor");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "constraintEqualToAnchor:constant:", v215, 100.0);
  v216 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  audioWaveformViewLeadingConstraint = self->_audioWaveformViewLeadingConstraint;
  self->_audioWaveformViewLeadingConstraint = v216;

  -[HUWaveformView trailingAnchor](self->_audioWaveformView, "trailingAnchor");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "safeAreaLayoutGuide");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "trailingAnchor");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "constraintEqualToAnchor:constant:", v221, -100.0);
  v222 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  audioWaveformViewTrailingConstraint = self->_audioWaveformViewTrailingConstraint;
  self->_audioWaveformViewTrailingConstraint = v222;

  objc_msgSend(v148, "addObject:", self->_audioWaveformViewLeadingConstraint);
  objc_msgSend(v148, "addObject:", self->_audioWaveformViewTrailingConstraint);
  -[HUWaveformView centerYAnchor](self->_audioWaveformView, "centerYAnchor");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "centerYAnchor");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "constraintEqualToAnchor:", v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v227);

  -[HUWaveformView heightAnchor](self->_audioWaveformView, "heightAnchor");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "constraintEqualToConstant:", 100.0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v229);

  -[UILabel leadingAnchor](self->_announcementDeliveryFailureLabel, "leadingAnchor");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "safeAreaLayoutGuide");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "leadingAnchor");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "constraintEqualToAnchor:", v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v234);

  -[UILabel trailingAnchor](self->_announcementDeliveryFailureLabel, "trailingAnchor");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "safeAreaLayoutGuide");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "trailingAnchor");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "constraintEqualToAnchor:", v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v239);

  -[UILabel centerYAnchor](self->_announcementDeliveryFailureLabel, "centerYAnchor");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "centerYAnchor");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "constraintEqualToAnchor:", v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v243);

  -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_announcementDeliveryFailureLabel, "bottomAnchor");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v245, 1.0);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v246);

  -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_errorStatusLabel, "bottomAnchor");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "constraintEqualToAnchor:constant:", v248, 20.0);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v249);

  -[UILabel centerXAnchor](self->_errorStatusLabel, "centerXAnchor");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "centerXAnchor");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "constraintEqualToAnchor:", v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v253);

  -[UILabel leadingAnchor](self->_errorStatusLabel, "leadingAnchor");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "leadingAnchor");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "constraintEqualToAnchor:", v256);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v257);

  -[UILabel trailingAnchor](self->_errorStatusLabel, "trailingAnchor");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "trailingAnchor");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "constraintEqualToAnchor:", v260);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v261);

  -[HURecordingButton centerXAnchor](self->_recordButton, "centerXAnchor");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "centerXAnchor");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "constraintEqualToAnchor:", v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v265);

  -[HURecordingButton heightAnchor](self->_recordButton, "heightAnchor");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "constraintEqualToConstant:", 64.0);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v267);

  -[HURecordingButton widthAnchor](self->_recordButton, "widthAnchor");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton heightAnchor](self->_recordButton, "heightAnchor");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "constraintEqualToAnchor:", v269);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v270);

  if (_AXSShowAudioTranscriptions())
  {
    -[HUAnnouncementsBrowserViewController _transcriptionStackViewHeight](self, "_transcriptionStackViewHeight");
    v272 = v271 + 132.0;
  }
  else
  {
    v272 = 132.0;
  }
  -[HURecordingButton topAnchor](self->_recordButton, "topAnchor");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "centerYAnchor");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "constraintEqualToAnchor:constant:", v275, v272);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v276);

  -[UILabel centerXAnchor](self->_recordButtonLabel, "centerXAnchor");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton centerXAnchor](self->_recordButton, "centerXAnchor");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "constraintEqualToAnchor:", v278);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v279);

  -[UILabel topAnchor](self->_recordButtonLabel, "topAnchor");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton bottomAnchor](self->_recordButton, "bottomAnchor");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "constraintEqualToAnchor:constant:", v281, 6.0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v282);

  -[UILabel heightAnchor](self->_recordButtonLabel, "heightAnchor");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "constraintEqualToConstant:", v142);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v284);

  -[UILabel bottomAnchor](self->_recordButtonLabel, "bottomAnchor");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "bottomAnchor");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "constraintEqualToAnchor:constant:", v287, -20.0);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v288);

  -[UIButton centerYAnchor](self->_nextAnnouncementButton, "centerYAnchor");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingButton centerYAnchor](self->_recordButton, "centerYAnchor");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "constraintEqualToAnchor:", v290);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v291);

  -[UIButton leadingAnchor](self->_nextAnnouncementButton, "leadingAnchor");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_recordButtonLabel, "trailingAnchor");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "constraintEqualToAnchor:constant:", v293, 48.0);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v294);

  -[UIButton heightAnchor](self->_nextAnnouncementButton, "heightAnchor");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "constraintEqualToConstant:", 44.0);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v296);

  -[UIButton widthAnchor](self->_nextAnnouncementButton, "widthAnchor");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_nextAnnouncementButton, "heightAnchor");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "constraintEqualToAnchor:", v298);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "addObject:", v299);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v148);
  -[HUAnnouncementsBrowserViewController _addTranscriptionConstraintsForValidNotificationPayload](self, "_addTranscriptionConstraintsForValidNotificationPayload");

}

- (void)_applyTranscriptionText:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_AXSShowAudioTranscriptions())
  {
    if (objc_msgSend(v4, "length"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v4);
    else
      _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceTranscript_NoTranscript"), CFSTR("HUAnnounceTranscript_NoTranscript"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_transcriptionText, "setText:", v5);

    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[UILabel text](self->_transcriptionText, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_INFO, "Setting transcript text: %@", buf, 0xCu);

    }
  }

}

- (void)_recordButtonLongPressGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  switch(v5)
  {
    case 4:
      objc_msgSend(v4, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementsBrowserViewController _deleteRecording:](self, "_deleteRecording:", v10);

      v7 = (void *)MEMORY[0x1E0CEABB0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_3;
      v12[3] = &unk_1E6F4D988;
      v12[4] = self;
      v8 = 0.25;
      v9 = v12;
      goto LABEL_7;
    case 3:
      objc_msgSend(v4, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementsBrowserViewController _stopRecordingAndSendReply:](self, "_stopRecordingAndSendReply:", v11);

      v7 = (void *)MEMORY[0x1E0CEABB0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_2;
      v13[3] = &unk_1E6F4D988;
      v13[4] = self;
      v8 = 0.25;
      v9 = v13;
      goto LABEL_7;
    case 1:
      objc_msgSend(v4, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementsBrowserViewController _beginRecordingReply:](self, "_beginRecordingReply:", v6);

      v7 = (void *)MEMORY[0x1E0CEABB0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke;
      v14[3] = &unk_1E6F4D988;
      v14[4] = self;
      v8 = 0.25;
      v9 = v14;
LABEL_7:
      objc_msgSend(v7, "animateWithDuration:animations:", v9, v8);
      break;
  }

}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 1.2, 1.2);
  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (void)_recordButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  int v8;
  HUAnnouncementsBrowserViewController *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[HUAnnouncementsBrowserViewController _recordButtonTapped:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped record button", (uint8_t *)&v8, 0x16u);
  }

  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRecording");

  if ((v7 & 1) != 0)
    -[HUAnnouncementsBrowserViewController _stopRecordingAndSendReply:](self, "_stopRecordingAndSendReply:", v4);
  else
    -[HUAnnouncementsBrowserViewController _beginRecordingReply:](self, "_beginRecordingReply:", v4);

}

- (void)_beginRecordingReply:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopPlayback");

  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecording");

  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CF7DD8]);
    objc_msgSend(v7, "prewarmWithHandler:", 0);
    -[HUAnnouncementsBrowserViewController feedbackGenerator](self, "feedbackGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepare");

    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playAlertSoundForType:withCompletion:", 0, 0);

    -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearPowerLevels");

    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareRecording");

    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonStopImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:forState:animated:", v13, 4, 1);

    -[HUAnnouncementsBrowserViewController recordButtonLabel](self, "recordButtonLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordingStopLabel_Title"), CFSTR("HUAnnounceRecordingStopLabel_Title"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    v17[4] = self;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke;
    v18[3] = &unk_1E6F4D988;
    v18[4] = self;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_2;
    v17[3] = &unk_1E6F4E300;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v18, v17, 0.25);
    -[HUAnnouncementsBrowserViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

  }
}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  objc_msgSend(*(id *)(a1 + 32), "recordButtonLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "transcriptionStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "largeTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recipientTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUAnnounceRecipient_Title"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v12);

  objc_msgSend(*(id *)(a1 + 32), "subTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceSubtitle_Title"), CFSTR("HUAnnounceSubtitle_Title"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(*(id *)(a1 + 32), "nextAnnouncementButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "announcementProgressLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v26, 0.1, 0.1);
  objc_msgSend(*(id *)(a1 + 32), "announcementGlobeView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v26;
  objc_msgSend(v17, "setTransform:", &v25);

  objc_msgSend(*(id *)(a1 + 32), "announcementGlobeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "lightedCircleView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v24, 0.1, 0.1);
  objc_msgSend(*(id *)(a1 + 32), "lightedCircleView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v24;
  objc_msgSend(v20, "setTransform:", &v23);

  objc_msgSend(*(id *)(a1 + 32), "nextAnnouncementButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIsAccessibilityElement:", 0);

  objc_msgSend(*(id *)(a1 + 32), "announcementDeliveryFailureLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 0.0);

}

uint64_t __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  uint64_t v9;

  if (a2)
  {
    v2 = result;
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopRecordButton_AX_Label_Title"), CFSTR("HUAnnounceStopRecordButton_AX_Label_Title"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "recordButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v3);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceStopRecordButton_AX_Label_Hint"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "recordButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_3;
    v8[3] = &unk_1E6F4D988;
    v9 = *(_QWORD *)(v2 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_4;
    v7[3] = &unk_1E6F4E300;
    v7[4] = v9;
    return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v8, v7, 0.5);
  }
  return result;
}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformViewLeadingConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformViewTrailingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startRecording");

    objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "impactOccurredWithIntensity:", 1.0);

  }
}

- (void)_stopRecordingAndSendReply:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRecording");

  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playAlertSoundForType:withCompletion:", 0, 0);

}

- (void)_sendAnnouncementReply:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  HUAnnouncementsBrowserViewController *v18;

  v4 = a3;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[HUAnnouncementsBrowserViewController shouldNotSendCurrentRecording](self, "shouldNotSendCurrentRecording");

    if (!v7)
    {
      -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D98]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (v10 == 1)
      {
        -[HUAnnouncementsBrowserViewController _sendAnnouncement:](self, "_sendAnnouncement:", v4);
      }
      else
      {
        -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUAnnouncementsBrowserViewController announce](self, "announce");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke;
        v16[3] = &unk_1E6F5DA00;
        v17 = v12;
        v18 = self;
        v15 = v12;
        objc_msgSend(v13, "broadcastReply:forAnnouncementID:completion:", v14, v15, v16);

      }
    }
  }

}

void __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to reply to announcement with ID - [%@] - [%@]", buf, 0x16u);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke_73;
  v8[3] = &unk_1E6F4C638;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke_73(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewOrDisplayError:", *(_QWORD *)(a1 + 40));
}

- (void)_sendAnnouncement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  HUAnnouncementsBrowserViewController *v21;
  _QWORD v22[4];
  id v23;
  HUAnnouncementsBrowserViewController *v24;
  _QWORD v25[4];
  id v26;

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_opt_new();
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke;
    v25[3] = &unk_1E6F5C608;
    v11 = v9;
    v26 = v11;
    objc_msgSend(v8, "na_each:", v25);
    -[HUAnnouncementsBrowserViewController announce](self, "announce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2;
    v22[3] = &unk_1E6F5DA00;
    v23 = v11;
    v24 = self;
    v15 = v11;
    objc_msgSend(v12, "sendAnnouncement:toRoomsWithIDs:andZonesWithIDs:inHomeWithID:completion:", v13, v15, MEMORY[0x1E0C9AA60], v14, v22);

  }
  else
  {
    -[HUAnnouncementsBrowserViewController announce](self, "announce");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2_78;
    v19[3] = &unk_1E6F5DA00;
    v20 = v7;
    v21 = self;
    objc_msgSend(v16, "sendAnnouncement:toHomeWithID:completion:", v17, v18, v19);

    v15 = v20;
  }

}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", v5);
}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Rooms with IDs [%@] - [%@]", buf, 0x16u);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_77;
  v8[3] = &unk_1E6F4C638;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewOrDisplayError:", *(_QWORD *)(a1 + 40));
}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2_78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Home with ID [%@] - [%@]", buf, 0x16u);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_79;
  v8[3] = &unk_1E6F4C638;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_79(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewOrDisplayError:", *(_QWORD *)(a1 + 40));
}

- (void)_deleteRecording:(id)a3
{
  void *v4;

  -[HUAnnouncementsBrowserViewController _deleteAudioFile](self, "_deleteAudioFile", a3);
  -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearPowerLevels");

  -[HUAnnouncementsBrowserViewController _hideRecordingUI](self, "_hideRecordingUI");
}

- (void)_deleteAudioFile
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v9, "removeItemAtURL:error:", v10, &v13);
      v11 = v13;

      if (v11)
      {
        HFLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v11;
          _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Error deleting audio file [%@]", buf, 0xCu);
        }

      }
    }
  }
}

- (void)_hideRecordingUI
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_2;
    v4[3] = &unk_1E6F4D988;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_3;
    v3[3] = &unk_1E6F4E300;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v4, v3, 0.25);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideRecordingUI");
}

void __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[3];
  _OWORD v29[2];
  __int128 v30;

  objc_msgSend(*(id *)(a1 + 32), "largeTitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "notificationPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_announcerNameFromNotificationPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v5);

  objc_msgSend(*(id *)(a1 + 32), "subTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notificationPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(*(id *)(a1 + 32), "recordButtonLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceButton_Title"), CFSTR("HUAnnounceButton_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(*(id *)(a1 + 32), "recordButtonLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformViewLeadingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", 100.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformViewTrailingConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", -100.0);

  objc_msgSend(*(id *)(a1 + 32), "announcementGlobeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "lightedCircleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "lightedCircleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v29[0] = *MEMORY[0x1E0C9BAA8];
  v26 = v29[0];
  v29[1] = v27;
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v25 = v30;
  objc_msgSend(v16, "setTransform:", v29);

  objc_msgSend(*(id *)(a1 + 32), "announcementGlobeView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  v28[1] = v27;
  v28[2] = v25;
  objc_msgSend(v17, "setTransform:", v28);

  objc_msgSend(*(id *)(a1 + 32), "nextAnnouncementButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "nextAnnouncementButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIsAccessibilityElement:", 1);

  objc_msgSend(*(id *)(a1 + 32), "announcementProgressLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "audioWaveformView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "transcriptionStackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutIfNeeded");

}

void __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recordButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v3);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recordButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v5);

    objc_msgSend(*(id *)(a1 + 32), "recordButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "recordButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:forState:animated:", v9, 0, 1);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
}

- (void)_dismissViewOrDisplayError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;

  if (a3)
  {
    -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[HUAnnouncementsBrowserViewController announcementDeliveryFailureLabel](self, "announcementDeliveryFailureLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

    -[HUAnnouncementsBrowserViewController recordButtonLabel](self, "recordButtonLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceButton_Title"), CFSTR("HUAnnounceButton_Title"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_recordingButtonWaveformImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:forState:animated:", v9, 0, 1);
LABEL_3:

    return;
  }
  -[HUAnnouncementsBrowserViewController delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = (id)v10;
    -[HUAnnouncementsBrowserViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "conformsToProtocol:", &unk_1EF3483F0))
      goto LABEL_3;
    -[HUAnnouncementsBrowserViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[HUAnnouncementsBrowserViewController delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didSendAnnouncementReplyforNotificationPayload:", v9);
      goto LABEL_3;
    }
  }
}

- (void)_skipToNextAnnouncement:(id)a3
{
  id v3;

  -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipToNextAnnouncement");

}

- (double)_transcriptionStackViewHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[UILabel font](self->_transcriptionTitleLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 32.0);
  v5 = v4;

  -[UILabel font](self->_transcriptionText, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 20.0);
  v8 = v7;

  return v5 + v8 + 6.0;
}

- (void)_configureVisualStyleForLightedCircleView
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[HUAnnouncementsBrowserViewController _lightedCircleBackgroundColorForCurrentInterfaceStyle](self, "_lightedCircleBackgroundColorForCurrentInterfaceStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController lightedCircleView](self, "lightedCircleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIView layer](self->_lightedCircleView, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0.5;
  objc_msgSend(v10, "setShadowOpacity:", v5);
  -[HUAnnouncementsBrowserViewController _lightedCircleShadowColorForCurrentInterfaceStyle](self, "_lightedCircleShadowColorForCurrentInterfaceStyle");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v10, "setShadowOffset:", 0.0, 12.0);
  objc_msgSend(v10, "setShadowRadius:", 16.0);
  v7 = (void *)MEMORY[0x1E0CEA390];
  -[HUAnnouncementsBrowserViewController lightedCircleView](self, "lightedCircleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "bezierPathWithOvalInRect:");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setShadowPath:", objc_msgSend(v9, "CGPath"));

}

- (id)_lightedCircleBackgroundColorForCurrentInterfaceStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.31372549, 0.333333333, 0.360784314, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)_lightedCircleShadowColorForCurrentInterfaceStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)_fontForAnnouncementProgressLabel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB548], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CEB518];
  v12[0] = *MEMORY[0x1E0CEB520];
  v12[1] = v3;
  v13[0] = &unk_1E7041B48;
  v13[1] = &unk_1E7041B60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CEB4D0];
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_backgroundColorForNextAnnouncementButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)_waveformColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (BOOL)_isNotificationPayloadValid
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  char v21;
  char v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Received Notification with payload %@", (uint8_t *)&v24, 0xCu);

  }
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A90]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CA0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CB0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v16 = v15 == 0;
  else
    v16 = 1;
  v17 = !v16;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v11);

  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 67109120;
    LODWORD(v25) = v19;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "AudioAssetExistsOnDisk = [%d]", (uint8_t *)&v24, 8u);
  }

  if (v7)
    v21 = v17;
  else
    v21 = 0;
  if (!v9)
    v21 = 0;
  v22 = v21 & v19;

  return v22;
}

- (void)_updateUIBasedOnReachabilityStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v23;
  _BOOL4 v24;
  int v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  _BYTE v34[10];
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[HUAnnouncementsBrowserViewController _isRoomContext](self, "_isRoomContext"))
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Room", (uint8_t *)&v33, 2u);
    }

    -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D48]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
    objc_msgSend(v7, "hf_roomWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "hf_hasAtleastOneHomePod");
    if (v12)
      v13 = objc_msgSend(v11, "hf_hasAtleastOneReachableHomePod");
    else
      v13 = 0;
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      *(_QWORD *)v34 = v21;
      *(_WORD *)&v34[8] = 1024;
      v35 = v12;
      v36 = 1024;
      v37 = v13;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Room ID [%@], hasAtleastOneHomePodInThisRoom:%{BOOL}d, isAtleastOneHomePodOnlineInThisRoom:%{BOOL}d", (uint8_t *)&v33, 0x18u);

    }
    v22 = v12 ^ 1;
    v16 = v13;
  }
  else
  {
    if (-[HUAnnouncementsBrowserViewController _isHomeContext](self, "_isHomeContext"))
    {
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Home", (uint8_t *)&v33, 2u);
      }

      -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hf_hasAtleastOneReachableHomePod");

      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        *(_QWORD *)v34 = v19;
        *(_WORD *)&v34[8] = 1024;
        v35 = v16;
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Home ID [%@], hf_hasAtleastOneReachableHomePod:%{BOOL}d", (uint8_t *)&v33, 0x12u);

      }
      v13 = 0;
    }
    else
    {
      v13 = 0;
      v16 = 0;
    }
    v22 = 1;
  }
  if (-[HUAnnouncementsBrowserViewController _isRoomContext](self, "_isRoomContext"))
    v23 = v13 | v22;
  else
    v23 = 0;
  v24 = -[HUAnnouncementsBrowserViewController _isHomeContext](self, "_isHomeContext");
  v25 = v24 & v16;
  v26 = v23 | v24 & v16;
  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 67109376;
    *(_DWORD *)v34 = v23;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v25;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "shouldAllowRecordingForRoom:%{BOOL}d, shouldAllowRecordingForHome:%{BOOL}d", (uint8_t *)&v33, 0xEu);
  }

  -[HUAnnouncementsBrowserViewController recordedAnnouncementURL](self, "recordedAnnouncementURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v26 & 1) != 0)
  {
    if (!v28)
    {
      -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 1;
LABEL_28:
      objc_msgSend(v29, "setEnabled:", v31);

    }
  }
  else if (!v28)
  {
    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = 0;
    goto LABEL_28;
  }
  -[HUAnnouncementsBrowserViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutIfNeeded");

}

- (BOOL)_isRoomContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = objc_msgSend(v7, "count") != 0;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_isHomeContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = objc_msgSend(v7, "count") == 0;
  else
    v8 = 0;

  return v8;
}

- (id)_announcerNameFromNotificationPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D319D0], "preferredNameFromUserID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A60]);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (void)didUpdateAveragePower:(float)a3
{
  id v4;

  -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendPowerLevel:", a3);

}

- (void)audioRecorderDidStartRecording:(id)a3
{
  void *v4;
  id v5;

  -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  -[HUAnnouncementsBrowserViewController recordButtonLabel](self, "recordButtonLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)audioRecorderFailedToFinishRecording:(id)a3
{
  -[HUAnnouncementsBrowserViewController _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:", 0, 0);
  -[HUAnnouncementsBrowserViewController _hideRecordingUI](self, "_hideRecordingUI");
}

- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[HUAnnouncementsBrowserViewController _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:](self, "_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:interruptedByUser:", 1, 0);
  -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRecordedDuration");
  v7 = v6;

  if (v7 >= 0.5)
  {
    -[HUAnnouncementsBrowserViewController setRecordedAnnouncementURL:](self, "setRecordedAnnouncementURL:", v14);
    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

    -[HUAnnouncementsBrowserViewController audioWaveformView](self, "audioWaveformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[HUAnnouncementsBrowserViewController _sendAnnouncementReply:](self, "_sendAnnouncementReply:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Title"), CFSTR("HUAnnounceRecordButton_AX_Label_Title"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", v10);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), CFSTR("HUAnnounceRecordButton_AX_Label_Hint"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController recordButton](self, "recordButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityHint:", v12);

  }
  else
  {
    -[HUAnnouncementsBrowserViewController _deleteRecording:](self, "_deleteRecording:", 0);
  }

}

- (void)didSelectItemWithInfo:(id)a3 totalNumberOfAnnouncements:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  -[HUAnnouncementsBrowserViewController largeTitleLabel](self, "largeTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController _announcerNameFromNotificationPayload:](self, "_announcerNameFromNotificationPayload:", v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  -[HUAnnouncementsBrowserViewController subTitleLabel](self, "subTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  -[HUAnnouncementsBrowserViewController announcementProgressLabel](self, "announcementProgressLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 + 1;
  HULocalizedStringWithFormat(CFSTR("HUAnnounceProgressLabel_Description"), CFSTR("%lu %lu"), v14, v15, v16, v17, v18, v19, v11 + 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v20);

  -[HUAnnouncementsBrowserViewController announcementProgressLabel](self, "announcementProgressLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", a4 == 1);

  -[HUAnnouncementsBrowserViewController nextAnnouncementButton](self, "nextAnnouncementButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v13 >= a4)
  {
    objc_msgSend(v22, "setEnabled:", 0);
  }
  else
  {
    -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEnabled:", objc_msgSend(v24, "hasActivePlaybackSession"));

  }
  -[HUAnnouncementsBrowserViewController nextAnnouncementButton](self, "nextAnnouncementButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (a4 == 1)
  {
    objc_msgSend(v25, "setHidden:", 1);
  }
  else
  {
    -[HUAnnouncementsBrowserViewController announcementGlobeView](self, "announcementGlobeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", objc_msgSend(v27, "hasActivePlaybackSession") ^ 1);

  }
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D78]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementsBrowserViewController _applyTranscriptionText:](self, "_applyTranscriptionText:", v28);

}

- (void)accessoryDidUpdateReachability:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    objc_msgSend(v7, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
      -[HUAnnouncementsBrowserViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
  }

}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    objc_msgSend(v7, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
      -[HUAnnouncementsBrowserViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
  }

}

- (void)accessoryDidUpdateControllable:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    objc_msgSend(v7, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementsBrowserViewController currentHome](self, "currentHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
      -[HUAnnouncementsBrowserViewController _updateUIBasedOnReachabilityStatus](self, "_updateUIBasedOnReachabilityStatus");
  }

}

- (void)_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "recordingStopSource");

    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentRecordedDuration");
    v11 = v10;

    -[HUAnnouncementsBrowserViewController notificationPayload](self, "notificationPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0D30230]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, *MEMORY[0x1E0D30238]);

    objc_msgSend(v13, "setObject:forKey:", v25, *MEMORY[0x1E0D30228]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 == 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v16, *MEMORY[0x1E0D30260]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)(v8 - 1) < 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, *MEMORY[0x1E0D30258]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 == 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v18, *MEMORY[0x1E0D30250]);

    -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "routeChangeReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[HUAnnouncementsBrowserViewController audioRecorder](self, "audioRecorder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "routeChangeReason");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v22, *MEMORY[0x1E0D30438]);

    }
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30268]);
    v23 = (void *)MEMORY[0x1E0D31170];
    v24 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v23, "sendEvent:withData:", 18, v24);

  }
}

- (void)_submitAnalyticsForAnnounceNotificationUsage
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_opt_new();
  -[HUAnnouncementsBrowserViewController notificationDismissTimeInterval](self, "notificationDismissTimeInterval");
  v4 = v3;
  -[HUAnnouncementsBrowserViewController notificationLaunchTimeInterval](self, "notificationLaunchTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 - v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, *MEMORY[0x1E0D301E8]);

  v7 = (void *)MEMORY[0x1E0D31170];
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "sendEvent:withData:", 20, v8);

}

- (NSDictionary)notificationPayload
{
  return self->_notificationPayload;
}

- (void)setNotificationPayload:(id)a3
{
  objc_storeStrong((id *)&self->_notificationPayload, a3);
}

- (BOOL)isTearingDown
{
  return self->_isTearingDown;
}

- (void)setIsTearingDown:(BOOL)a3
{
  self->_isTearingDown = a3;
}

- (UILabel)largeTitleLabel
{
  return self->_largeTitleLabel;
}

- (void)setLargeTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleLabel, a3);
}

- (UIVisualEffectView)largeTitleVisualEffectView
{
  return self->_largeTitleVisualEffectView;
}

- (void)setLargeTitleVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleVisualEffectView, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (UIVisualEffectView)subTitleVisualEffectView
{
  return self->_subTitleVisualEffectView;
}

- (void)setSubTitleVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleVisualEffectView, a3);
}

- (HUWaveformView)audioWaveformView
{
  return self->_audioWaveformView;
}

- (void)setAudioWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_audioWaveformView, a3);
}

- (UILabel)announcementDeliveryFailureLabel
{
  return self->_announcementDeliveryFailureLabel;
}

- (void)setAnnouncementDeliveryFailureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, a3);
}

- (HURecordingButton)recordButton
{
  return self->_recordButton;
}

- (void)setRecordButton:(id)a3
{
  objc_storeStrong((id *)&self->_recordButton, a3);
}

- (UILabel)recordButtonLabel
{
  return self->_recordButtonLabel;
}

- (void)setRecordButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_recordButtonLabel, a3);
}

- (UIVisualEffectView)recordButtonLabelVisualEffectView
{
  return self->_recordButtonLabelVisualEffectView;
}

- (void)setRecordButtonLabelVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_recordButtonLabelVisualEffectView, a3);
}

- (UIScrollView)transcriptionScrollView
{
  return self->_transcriptionScrollView;
}

- (void)setTranscriptionScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionScrollView, a3);
}

- (UIStackView)transcriptionStackView
{
  return self->_transcriptionStackView;
}

- (void)setTranscriptionStackView:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionStackView, a3);
}

- (UILabel)transcriptionText
{
  return self->_transcriptionText;
}

- (void)setTranscriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionText, a3);
}

- (UILabel)transcriptionTitleLabel
{
  return self->_transcriptionTitleLabel;
}

- (void)setTranscriptionTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionTitleLabel, a3);
}

- (UILabel)errorStatusLabel
{
  return self->_errorStatusLabel;
}

- (void)setErrorStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorStatusLabel, a3);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_storeStrong((id *)&self->_senderName, a3);
}

- (HFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecorder, a3);
}

- (double)recordedDuration
{
  return self->_recordedDuration;
}

- (void)setRecordedDuration:(double)a3
{
  self->_recordedDuration = a3;
}

- (NSURL)recordedAnnouncementURL
{
  return self->_recordedAnnouncementURL;
}

- (void)setRecordedAnnouncementURL:(id)a3
{
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, a3);
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (HUAnnouncementsBrowserViewControllerDelegate)delegate
{
  return (HUAnnouncementsBrowserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)lightedCircleView
{
  return self->_lightedCircleView;
}

- (void)setLightedCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_lightedCircleView, a3);
}

- (HUAnnouncementGlobeView)announcementGlobeView
{
  return self->_announcementGlobeView;
}

- (void)setAnnouncementGlobeView:(id)a3
{
  objc_storeStrong((id *)&self->_announcementGlobeView, a3);
}

- (UILabel)announcementProgressLabel
{
  return self->_announcementProgressLabel;
}

- (void)setAnnouncementProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_announcementProgressLabel, a3);
}

- (UIButton)nextAnnouncementButton
{
  return self->_nextAnnouncementButton;
}

- (void)setNextAnnouncementButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextAnnouncementButton, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (NSLayoutConstraint)audioWaveformViewLeadingConstraint
{
  return self->_audioWaveformViewLeadingConstraint;
}

- (void)setAudioWaveformViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_audioWaveformViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)audioWaveformViewTrailingConstraint
{
  return self->_audioWaveformViewTrailingConstraint;
}

- (void)setAudioWaveformViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_audioWaveformViewTrailingConstraint, a3);
}

- (NSString)recipientTitle
{
  return self->_recipientTitle;
}

- (void)setRecipientTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)shouldNotSendCurrentRecording
{
  return self->_shouldNotSendCurrentRecording;
}

- (void)setShouldNotSendCurrentRecording:(BOOL)a3
{
  self->_shouldNotSendCurrentRecording = a3;
}

- (double)notificationLaunchTimeInterval
{
  return self->_notificationLaunchTimeInterval;
}

- (void)setNotificationLaunchTimeInterval:(double)a3
{
  self->_notificationLaunchTimeInterval = a3;
}

- (double)notificationDismissTimeInterval
{
  return self->_notificationDismissTimeInterval;
}

- (void)setNotificationDismissTimeInterval:(double)a3
{
  self->_notificationDismissTimeInterval = a3;
}

- (ANAnnounce)announce
{
  return self->_announce;
}

- (void)setAnnounce:(id)a3
{
  objc_storeStrong((id *)&self->_announce, a3);
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
  objc_storeStrong((id *)&self->_currentHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_announce, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_recipientTitle, 0);
  objc_storeStrong((id *)&self->_audioWaveformViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_audioWaveformViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_nextAnnouncementButton, 0);
  objc_storeStrong((id *)&self->_announcementProgressLabel, 0);
  objc_storeStrong((id *)&self->_announcementGlobeView, 0);
  objc_storeStrong((id *)&self->_lightedCircleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_errorStatusLabel, 0);
  objc_storeStrong((id *)&self->_transcriptionTitleLabel, 0);
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_transcriptionStackView, 0);
  objc_storeStrong((id *)&self->_transcriptionScrollView, 0);
  objc_storeStrong((id *)&self->_recordButtonLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_recordButtonLabel, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_subTitleVisualEffectView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_largeTitleVisualEffectView, 0);
  objc_storeStrong((id *)&self->_largeTitleLabel, 0);
  objc_storeStrong((id *)&self->_notificationPayload, 0);
}

@end
