@implementation IMAVEmbeddedInterface

- (void)_conferenceWillStart:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IMAVEmbeddedInterface;
  -[IMAVInterface _conferenceWillStart:](&v28, sel__conferenceWillStart_, v4);
  v9 = (void *)qword_25503B8B0;
  if (!qword_25503B8B0)
  {
    v9 = (void *)MEMORY[0x219A282EC](CFSTR("AVSystemController"), CFSTR("Celestial"));
    qword_25503B8B0 = (uint64_t)v9;
  }
  if (!qword_25503B8B8)
  {
    v10 = (void **)MEMORY[0x219A282F8]("AVSystemController_UplinkMuteAttribute", CFSTR("Celestial"));
    if (v10)
      v11 = *v10;
    else
      v11 = 0;
    objc_storeStrong((id *)&qword_25503B8B8, v11);
    v9 = (void *)qword_25503B8B0;
  }
  objc_msgSend_sharedAVSystemController(v9, v5, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributeForKey_(v12, v13, qword_25503B8B8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_BOOLValue(v16, v17, v18, v19, v20))
  {
    objc_msgSend__existingConferenceForAVChat_(self, v21, (uint64_t)v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMicrophoneMuted_(v24, v25, 1, v26, v27);

  }
}

- (void)_conferenceEnded:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "_conferenceEnded: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)IMAVEmbeddedInterface;
  -[IMAVConferenceInterface _conferenceEnded:](&v6, sel__conferenceEnded_, v4);

}

- (void)chatStateUpdated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__nonFinalChat(IMAVChat, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Found non final chat: %@", buf, 0xCu);
  }

  if (!qword_25503B8C0)
    qword_25503B8C0 = MEMORY[0x219A282EC](CFSTR("UIApplication"), CFSTR("UIKit"));
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Disabling system idle timer", buf, 2u);
    }

    objc_msgSend_sharedApplication((void *)qword_25503B8C0, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdleTimerDisabled_(v14, v15, 1, v16, v17);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Enabling system idle timer", buf, 2u);
    }

    objc_msgSend_sharedApplication((void *)qword_25503B8C0, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdleTimerDisabled_(v14, v22, 0, v23, v24);
  }

  sub_218FFFE10(v6 != 0);
  v30.receiver = self;
  v30.super_class = (Class)IMAVEmbeddedInterface;
  -[IMAVConferenceInterface chatStateUpdated](&v30, sel_chatStateUpdated);
  v25 = (void *)objc_opt_class();
  objc_msgSend_updateCriticalState(v25, v26, v27, v28, v29);

}

+ (void)updateCriticalState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int shouldRunACConferences;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const __CFString *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v5, v6, v7, v8, v9))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v10, v11, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v18, v19, v20, v21, v22);

    if (!shouldRunACConferences)
      return;
  }
  objc_msgSend__connectingChats(IMAVChat, v14, v15, v16, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v24, v25, v26, v27, v28))
  {
    v33 = 1;
  }
  else
  {
    objc_msgSend__connectedChats(IMAVChat, v29, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v34, v35, v36, v37, v38))
    {
      v33 = 1;
    }
    else
    {
      objc_msgSend__incomingInvitations(IMAVChat, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v43, v44, v45, v46, v47))
      {
        v33 = 1;
      }
      else
      {
        objc_msgSend__outgoingInvitations(IMAVChat, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_count(v52, v53, v54, v55, v56) != 0;

      }
    }

  }
  sub_2190076D0();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = CFSTR("NO");
    if (v33)
      v58 = CFSTR("YES");
    v67 = 138412290;
    v68 = v58;
    _os_log_impl(&dword_218FEA000, v57, OS_LOG_TYPE_DEFAULT, "Any chats need critical state: %@", (uint8_t *)&v67, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCriticalReliability_(v63, v64, v33, v65, v66);

}

- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int64_t v11;
  NSObject *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Running network check on AVConference, requiresWifi: %@", (uint8_t *)&v14, 0xCu);
  }

  if (!qword_25503B8C8)
    qword_25503B8C8 = MEMORY[0x219A282EC](CFSTR("AVConference"), CFSTR("AVConference"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend_doBlockingConnectionCheck_((void *)qword_25503B8C8, v7, v4, v8, v9);
    if (v10 >= 4)
      v11 = -1;
    else
      v11 = v10;
    sub_2190076D0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      LODWORD(v15) = v11;
      _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, " => returning result: %d", (uint8_t *)&v14, 8u);
    }
  }
  else
  {
    sub_2190076D0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, " => Network check not implemented", (uint8_t *)&v14, 2u);
    }
    v11 = -1;
  }

  return v11;
}

- (int64_t)_runPingTestForChat:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  BOOL v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  double v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  void *v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint8_t buf[4];
  _DWORD v104[7];

  *(_QWORD *)&v104[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend__localNetworkConnectionType(v3, v4, v5, v6, v7) == 2)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50398], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_myGatewayAddress(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v17, v18, v19, v20, v21))
    {
      sub_2190076D0();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v104[0] = 2;
        LOWORD(v104[1]) = 2112;
        *(_QWORD *)((char *)&v104[1] + 2) = v17;
        _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Running ping test: connection type %d - gateway IP %@", buf, 0x12u);
      }

      v23 = (void *)MEMORY[0x219A284CC]();
      IMPerformPingTest();
      v24 = 0;
      v29 = objc_msgSend_packetsSuccessfullySent(v24, v25, v26, v27, v28);
      v30 = 4 * (v29 < 1);
      objc_autoreleasePoolPop(v23);
      objc_msgSend__setPingTestResult_(v3, v31, v30, v32, v33);
      sub_2190076D0();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v29 < 1)
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v104 = CFSTR("Failed to run");
          _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "Ping test ended with error: %@", buf, 0xCu);
        }
      }
      else
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v104 = v24;
          _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "Ping results: %@", buf, 0xCu);
        }

        v36 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_minRoundtripTime(v24, v37, v38, v39, v40);
        v45 = 0.0;
        v46 = v47 <= 0.0;
        LODWORD(v47) = 0;
        if (!v46)
        {
          objc_msgSend_minRoundtripTime(v24, v41, v42, v43, v44, v47);
          *(float *)&v47 = v47;
        }
        objc_msgSend_numberWithFloat_(v36, v41, v42, v43, v44, v47);
        v34 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_maxRoundtripTime(v24, v49, v50, v51, v52);
        if (v57 > 0.0)
        {
          objc_msgSend_maxRoundtripTime(v24, v53, v54, v55, v56);
          v45 = v57;
        }
        *(float *)&v57 = v45;
        objc_msgSend_numberWithFloat_(v48, v53, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_averageRoundtripTime(v24, v60, v61, v62, v63);
        v68 = 0.0;
        v46 = v69 <= 0.0;
        LODWORD(v69) = 0;
        if (!v46)
        {
          objc_msgSend_averageRoundtripTime(v24, v64, v65, v66, v67, v69);
          *(float *)&v69 = v69;
        }
        objc_msgSend_numberWithFloat_(v59, v64, v65, v66, v67, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_standardDeviationRoundtripTime(v24, v72, v73, v74, v75);
        if (v80 > 0.0)
        {
          objc_msgSend_standardDeviationRoundtripTime(v24, v76, v77, v78, v79);
          v68 = v80;
        }
        *(float *)&v80 = v68;
        objc_msgSend_numberWithFloat_(v71, v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_packetLossRate(v24, v83, v84, v85, v86);
        v91 = v92;
        LODWORD(v92) = 0;
        if (v91 > 0.0)
        {
          objc_msgSend_packetLossRate(v24, v87, v88, v89, v90, v92);
          *(float *)&v92 = v92;
        }
        objc_msgSend_numberWithFloat_(v82, v87, v88, v89, v90, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_alloc(MEMORY[0x24BDBCE70]);
        v98 = (void *)objc_msgSend_initWithObjectsAndKeys_(v94, v95, (uint64_t)v34, v96, v97, CFSTR("AVPingTestMin"), v58, CFSTR("AVPingTestMax"), v70, CFSTR("AVPingTestAvg"), v81, CFSTR("AVPingTestStdDeviation"), v93, CFSTR("AVPingTestPacketLoss"), 0);
        objc_msgSend__setPingTestResults_(v3, v99, (uint64_t)v98, v100, v101);

      }
    }
    else
    {
      v30 = 4;
    }

  }
  else
  {
    v30 = -1;
  }

  return v30;
}

@end
