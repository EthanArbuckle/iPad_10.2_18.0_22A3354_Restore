void FTAWDLogRegistrationGetHandles(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067C6C84;
  block[3] = &unk_24BFDEE10;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_2067C6C34(block);
}

const __CFString *sub_2067C6890(int a1)
{
  const __CFString *result;

  result = CFSTR("Unknown");
  switch(a1)
  {
    case 5312513:
      result = CFSTR("AWDMetricTypeFaceTimeCallStarted");
      break;
    case 5312514:
      result = CFSTR("AWDMetricTypeFaceTimeCallConnected");
      break;
    case 5312515:
      result = CFSTR("AWDMetricTypeFaceTimeCallEnded");
      break;
    case 5312516:
      result = CFSTR("AWDMetricTypeFaceTimeCallInterruptionBegan");
      break;
    case 5312517:
      result = CFSTR("AWDMetricTypeFaceTimeCallInterruptionEnded");
      break;
    case 5312518:
      result = CFSTR("AWDMetricTypeFaceTimeCallInvitationSent");
      break;
    case 5312519:
      result = CFSTR("AWDMetricTypeFaceTimeCallInvitationReceived");
      break;
    case 5312520:
      result = CFSTR("AWDMetricTypeFaceTimeCallCancelSent");
      break;
    case 5312521:
      result = CFSTR("AWDMetricTypeFaceTimeCallAcceptReceived");
      break;
    case 5312522:
      result = CFSTR("AWDMetricTypeFaceTimeCallDeclineSent");
      break;
    case 5312523:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayInitiateSent");
      break;
    case 5312524:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayInitiateReceived");
      break;
    case 5312525:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayUpdateSent");
      break;
    case 5312526:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayUpdateReceived");
      break;
    case 5312527:
      result = CFSTR("AWDMetricTypeFaceTimeCallAcceptSent");
      break;
    case 5312528:
    case 5312545:
    case 5312546:
    case 5312547:
    case 5312548:
    case 5312549:
    case 5312550:
    case 5312551:
    case 5312552:
    case 5312553:
    case 5312554:
    case 5312555:
    case 5312556:
    case 5312557:
    case 5312558:
    case 5312559:
      return result;
    case 5312529:
      result = CFSTR("AWDMetricTypeFaceTimeCallStartedHotShip");
      break;
    case 5312530:
      result = CFSTR("AWDMetricTypeFaceTimeCallConnectedHotShip");
      break;
    case 5312531:
      result = CFSTR("AWDMetricTypeFaceTimeCallEndedHotShip");
      break;
    case 5312532:
      result = CFSTR("AWDMetricTypeFaceTimeCallInterruptionBeganHotShip");
      break;
    case 5312533:
      result = CFSTR("AWDMetricTypeFaceTimeCallInterruptionEndedHotShip");
      break;
    case 5312534:
      result = CFSTR("AWDMetricTypeFaceTimeCallInvitationSentHotShip");
      break;
    case 5312535:
      result = CFSTR("AWDMetricTypeFaceTimeCallInvitationReceivedHotShip");
      break;
    case 5312536:
      result = CFSTR("AWDMetricTypeFaceTimeCallCancelSentHotShip");
      break;
    case 5312537:
      result = CFSTR("AWDMetricTypeFaceTimeCallAcceptSentHotShip");
      break;
    case 5312538:
      result = CFSTR("AWDMetricTypeFaceTimeCallAcceptReceivedHotShip");
      break;
    case 5312539:
      result = CFSTR("AWDMetricTypeFaceTimeCallDeclineSentHotShip");
      break;
    case 5312540:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayInitiateSentHotShip");
      break;
    case 5312541:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayInitiateReceivedHotShip");
      break;
    case 5312542:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayUpdateSentHotShip");
      break;
    case 5312543:
      result = CFSTR("AWDMetricTypeFaceTimeCallRelayUpdateReceivedHotShip");
      break;
    case 5312544:
      result = CFSTR("AWDMetricTypeFaceTimeCallFailed");
      break;
    case 5312560:
      result = CFSTR("AWDMetricTypeFaceTimeCallFailedHotShip");
      break;
    default:
      switch(a1)
      {
        case 5308417:
          result = CFSTR("AWDMetricTypeIMessageAttachmentDownload");
          break;
        case 5308418:
          result = CFSTR("AWDMetricTypeIMessageAttachmentUpload");
          break;
        case 5308419:
          result = CFSTR("AWDMetricTypeIMessageSent");
          break;
        case 5308420:
          result = CFSTR("AWDMetricTypeIMessageDelivered");
          break;
        case 5308421:
        case 5308422:
        case 5308423:
        case 5308424:
        case 5308425:
        case 5308426:
        case 5308427:
        case 5308428:
        case 5308429:
        case 5308430:
        case 5308431:
        case 5308432:
        case 5308436:
        case 5308437:
        case 5308438:
        case 5308439:
        case 5308443:
        case 5308444:
        case 5308445:
        case 5308446:
        case 5308447:
        case 5308448:
          return result;
        case 5308433:
          result = CFSTR("AWDMetricTypeSMSReceived");
          break;
        case 5308434:
          result = CFSTR("AWDMetricTypeSMSSent");
          break;
        case 5308435:
          result = CFSTR("AWDMetricTypeIMessageReceived");
          break;
        case 5308440:
          result = CFSTR("AWDMetricTypeIMessageDowngrade");
          break;
        case 5308441:
          result = CFSTR("AWDMetricTypeIMessageQueryFinished");
          break;
        case 5308442:
          result = CFSTR("AWDMetricTypeIMessageDeduplicated");
          break;
        case 5308449:
          result = CFSTR("AWDMetricTypeSMSReceivedHotShip");
          break;
        case 5308450:
          result = CFSTR("AWDMetricTypeSMSSentHotShip");
          break;
        case 5308451:
          result = CFSTR("AWDMetricTypeIMessageReceivedHotShip");
          break;
        case 5308452:
          result = CFSTR("AWDMetricTypeIMessageSentHotShip");
          break;
        case 5308453:
          result = CFSTR("AWDMetricTypeIMessageAttachmentDownloadHotShip");
          break;
        case 5308454:
          result = CFSTR("AWDMetricTypeIMessageAttachmentUploadHotShip");
          break;
        case 5308455:
          result = CFSTR("AWDMetricTypeIMessageDeliveredHotShip");
          break;
        case 5308456:
          result = CFSTR("AWDMetricTypeIMessageDowngradeHotShip");
          break;
        case 5308457:
          result = CFSTR("AWDMetricTypeIMessageQueryFinishedHotShip");
          break;
        case 5308458:
          result = CFSTR("AWDMetricTypeIMessageDeduplicatedHotShip");
          break;
        case 5308459:
          result = CFSTR("AWDMetricTypeIMessageHealthCheckPerformed");
          break;
        case 5308460:
          result = CFSTR("AWDIMessageCloudKitSyncFailed");
          break;
        case 5308461:
          result = CFSTR("AWDIMessageCloudKitValidatePurgeableAttachment");
          break;
        default:
          switch(a1)
          {
            case 5316608:
              result = CFSTR("AWDMetricTypeRegistrationPhoneNumberValidationFinished");
              break;
            case 5316609:
              result = CFSTR("AWDMetricTypeRegistrationPhoneNumberReceivedSMS");
              break;
            case 5316610:
              result = CFSTR("AWDMetricTypeRegistrationProfileAuthenticate");
              break;
            case 5316611:
              result = CFSTR("AWDMetricTypeRegistrationProfileLinkHandles");
              break;
            case 5316612:
              result = CFSTR("AWDMetricTypeRegistrationProfileUnLinkHandles");
              break;
            case 5316613:
              result = CFSTR("AWDMetricTypeRegistrationProfileValidateHandle");
              break;
            case 5316614:
              result = CFSTR("AWDMetricTypeRegistrationProfileValidateInvitationContext");
              break;
            case 5316615:
              result = CFSTR("AWDMetricTypeRegistrationAuthenticate");
              break;
            case 5316616:
              result = CFSTR("AWDMetricTypeRegistrationRegister");
              break;
            case 5316617:
              result = CFSTR("AWDMetricTypeRegistrationGetHandles");
              break;
            case 5316618:
              result = CFSTR("AWDMetricTypeRegistrationGetDependentRegistrations");
              break;
            case 5316622:
              result = CFSTR("AWDMetricTypeRegistrationRenewCredentialsCompleted");
              break;
            default:
              return result;
          }
          break;
      }
      break;
  }
  return result;
}

void sub_2067C6C34(dispatch_block_t block)
{
  if (qword_253E6C558 != -1)
    dispatch_once(&qword_253E6C558, &unk_24BFDEA78);
  dispatch_async((dispatch_queue_t)qword_253E6C570, block);
}

void sub_2067C6C84(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogRegistrationGetHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResult"
          "Code, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = sub_2067C72A4(5316617);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "registrationError");
      v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "resultCode");
      v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "genericError");
      v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "uRLError");
      v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "pOSIXError");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogIMessageQueryFinished(uint64_t a1, char a2, int a3, uint64_t a4, char a5, char a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  _QWORD v11[8];
  int v12;
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_2067CC3B0;
  v11[3] = &unk_24BFDEC18;
  v14 = a2;
  v15 = a5;
  v16 = a6;
  v12 = a3;
  v13 = a7;
  v11[4] = a4;
  v11[5] = a8;
  v11[6] = a9;
  v11[7] = a10;
  v17 = a11;
  sub_2067C6C34(v11);
}

id sub_2067C72A4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDMetricContainerForMetricType", (uint8_t *)&v14, 2u);
  }
  if (!qword_253E6C578)
    sub_2067C8044();
  v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  v4 = objc_msgSend((id)qword_253E6C578, "newMetricContainerWithIdentifier:", a1);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v3);
      v14 = 134217984;
      v15 = v8;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, "It took %f seconds to get a metric container", (uint8_t *)&v14, 0xCu);
    }

    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sub_2067C6890(a1);
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "%@ is enabled on this config", (uint8_t *)&v14, 0xCu);
    }
    return v5;
  }
  else
  {

    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = sub_2067C6890(a1);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "Configuration doesn't allow for %@ to be submitted to AWD", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
}

void FTAWDLogRegistrationProfileAuthenticate(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067C78C0;
  block[3] = &unk_24BFDEE10;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_2067C6C34(block);
}

void sub_2067C7590(void *a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v4 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = a1;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_2067C5000, v4, OS_LOG_TYPE_DEFAULT, "__SubmitMetricToAWDWithContainer -- metric %p   metric container %p", (uint8_t *)&v10, 0x16u);
  }
  if (a1)
  {
    if (a2)
    {
      if (!qword_253E6C578)
        sub_2067C8044();
      objc_msgSend(a2, "setMetric:", a1);
      if ((objc_msgSend((id)qword_253E6C578, "submitMetric:", a2) & 1) != 0)
      {
        if (qword_253E6C568 != -1)
          dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
        v5 = qword_253E6C560;
        if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v10) = 0;
          v6 = "***** Metric was submitted !! *****";
LABEL_22:
          v7 = v5;
          v8 = 2;
LABEL_23:
          _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
        }
      }
      else
      {
        if (qword_253E6C568 != -1)
          dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
        v9 = qword_253E6C560;
        if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 138412290;
          v11 = a2;
          v6 = "Failed to submit AWD metric %@";
          v7 = v9;
          v8 = 12;
          goto LABEL_23;
        }
      }
    }
    else
    {
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
      v5 = qword_253E6C560;
      if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        v6 = "No metric container";
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v5 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v6 = "No metric to submit";
      goto LABEL_22;
    }
  }
}

void FTAWDLogRegistrationGetDependentRegistrations(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067DABCC;
  block[3] = &unk_24BFDEE10;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_2067C6C34(block);
}

void FTAWDLogRegistrationRenewCredentialsCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067DB17C;
  block[3] = &unk_24BFDEEB0;
  block[4] = a2;
  block[5] = a1;
  block[6] = a3;
  sub_2067C6C34(block);
}

void sub_2067C78C0(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogRegistrationProfileAuthenticate(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMess"
          "ageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = sub_2067C72A4(5316610);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "genericError");
      v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "uRLError");
      v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "pOSIXError");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void sub_2067C7E70()
{
  if (qword_253E6C550 != -1)
    dispatch_once(&qword_253E6C550, &unk_24BFDEA58);
}

uint64_t sub_2067C7E98()
{
  NSObject *v0;
  uint8_t v2[16];

  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v0 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2067C5000, v0, OS_LOG_TYPE_DEFAULT, "Registering submission date notify token", v2, 2u);
  }
  return notify_register_check("kFTAWDDateChanged", &dword_253E6C580);
}

void FTAWDSetSubmissionDate()
{
  sub_2067C6C34(&unk_24BFDEAB8);
}

uint64_t sub_2067C7F40()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)qword_253E6C578;
  if (!qword_253E6C578)
  {
    sub_2067C8044();
    v0 = (void *)qword_253E6C578;
  }
  v1 = (((unint64_t)objc_msgSend(v0, "getAWDTimestamp") >> 3) * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64;
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = v1 >> 4;
  v3 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v2;
    _os_log_impl(&dword_2067C5000, v3, OS_LOG_TYPE_DEFAULT, "Setting submission date -- Timestamp %llu", (uint8_t *)&v5, 0xCu);
  }
  return notify_set_state(dword_253E6C580, v2);
}

void sub_2067C8044()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *global_queue;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!qword_253E6C578)
  {
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v0 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = CUTGetMainBundleIdentifier();
      _os_log_impl(&dword_2067C5000, v0, OS_LOG_TYPE_DEFAULT, "Creating server connection for bundle %@", (uint8_t *)&v4, 0xCu);
    }
    qword_253E6C578 = objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithComponentId:andBlockOnConfiguration:", 81, 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v1 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = 81;
      _os_log_impl(&dword_2067C5000, v1, OS_LOG_TYPE_DEFAULT, "Creating AWD server connection with component ID 0x%lx", (uint8_t *)&v4, 0xCu);
    }
    if (!qword_253E6C570)
    {
      v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(-32768, 0);
      qword_253E6C570 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.ftawd.awd-queue", v2, global_queue);
    }
    if (qword_253E6C550 != -1)
      dispatch_once(&qword_253E6C550, &unk_24BFDEA58);
  }
}

id sub_2067C821C()
{
  id v0;
  void *v1;
  NSObject *v2;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(dword_253E6C580, &state64);
  v0 = objc_alloc(MEMORY[0x24BDBCE60]);
  v1 = (void *)objc_msgSend(v0, "initWithTimeIntervalSince1970:", (double)state64);
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v6 = state64;
    v7 = 2112;
    v8 = v1;
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "Getting submission date -- Timestamp %llu, submission Date: %@", buf, 0x16u);
  }
  return v1;
}

dispatch_queue_t sub_2067C8324()
{
  NSObject *v0;
  NSObject *global_queue;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  global_queue = dispatch_get_global_queue(-32768, 0);
  result = dispatch_queue_create_with_target_V2("com.apple.ftawd.awd-queue", v0, global_queue);
  qword_253E6C570 = (uint64_t)result;
  return result;
}

void FTAWDLogSMSReceived(uint64_t a1, int a2, uint64_t a3, char a4, char a5, char a6, char a7)
{
  _QWORD v7[5];
  int v8;
  char v9;
  char v10;
  char v11;
  char v12;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2067C83D8;
  v7[3] = &unk_24BFDEAE0;
  v8 = a2;
  v7[4] = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a7;
  sub_2067C6C34(v7);
}

void sub_2067C83D8(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  const __CFString *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDLogSMSReceved", (uint8_t *)&v25, 2u);
  }
  v3 = (unint64_t)sub_2067C72A4(5308433);
  v4 = (unint64_t)sub_2067C72A4(5308449);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setFzError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setCtError:", objc_msgSend(v7, "intValue"));
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setIsGroupMessage:", 1);
    if (*(_BYTE *)(a1 + 45))
      objc_msgSend(v6, "setIsFromPhoneNumber:", 1);
    if (*(_BYTE *)(a1 + 46))
      objc_msgSend(v6, "setIsFromEmail:", 1);
    if (*(_BYTE *)(a1 + 47))
      objc_msgSend(v6, "setHasAttachments:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 134217984;
      v26 = (uint64_t)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v25 = 138412290;
      v26 = v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v25 = 134217984;
      v26 = v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "fzError");
      v25 = 67109120;
      LODWORD(v26) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v25, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v6, "ctError");
      v25 = 67109120;
      LODWORD(v26) = v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "           ctError: %d", (uint8_t *)&v25, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "isGroupMessage") ? CFSTR("YES") : CFSTR("NO");
      v25 = 138412290;
      v26 = (uint64_t)v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "isFromPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v25 = 138412290;
      v26 = (uint64_t)v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, " isFromPhoneNumber: %@", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "isFromEmail") ? CFSTR("YES") : CFSTR("NO");
      v25 = 138412290;
      v26 = (uint64_t)v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "       isFromEmail: %@", (uint8_t *)&v25, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "hasAttachments"))
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v25 = 138412290;
      v26 = (uint64_t)v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v25, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

BOOL sub_2067C8A0C()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableAWDHotShip"), CFSTR("com.apple.Messages"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 1;
  return !v1 || arc4random_uniform(0x64u) == 1;
}

void FTAWDLogSMSSent(uint64_t a1, int a2, uint64_t a3, char a4, char a5, char a6, char a7, uint64_t a8)
{
  _QWORD block[6];
  int v9;
  char v10;
  char v11;
  char v12;
  char v13;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067C8ACC;
  block[3] = &unk_24BFDEB08;
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  block[4] = a3;
  block[5] = a8;
  sub_2067C6C34(block);
}

void sub_2067C8ACC(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogSMSSent(NSString *, FTAWDFZError, NSNumber *, BOOL, BOOL, BOOL, BOOL, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308434);
  v4 = (unint64_t)sub_2067C72A4(5308450);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 48))
      objc_msgSend(v6, "setFzError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setCtError:", objc_msgSend(v7, "intValue"));
    if (*(_BYTE *)(a1 + 52))
      objc_msgSend(v6, "setIsGroupMessage:", 1);
    if (*(_BYTE *)(a1 + 53))
      objc_msgSend(v6, "setIsToPhoneNumber:", 1);
    if (*(_BYTE *)(a1 + 54))
      objc_msgSend(v6, "setIsToEmail:", 1);
    if (*(_BYTE *)(a1 + 55))
      objc_msgSend(v6, "setHasAttachments:", 1);
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v8, "unsignedIntValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "timestamp");
      v28 = 134217984;
      v29 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "fzError");
      v28 = 67109120;
      LODWORD(v29) = v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "ctError");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "           ctError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "isGroupMessage") ? CFSTR("YES") : CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "isToPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "isToEmail") ? CFSTR("YES") : CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "hasAttachments") ? CFSTR("YES") : CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "sendDuration");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "      sendDuration: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageReceived(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8)
{
  _QWORD v8[4];
  int v9;
  int v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2067C9200;
  v8[3] = &unk_24BFDEB28;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  sub_2067C6C34(v8);
}

void sub_2067C9200(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  const __CFString *v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136446210;
    v27 = "void FTAWDLogIMessageReceived(NSString *, FTAWDFZError, FTAWDMessageError, BOOL, BOOL, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308435);
  v4 = (unint64_t)sub_2067C72A4(5308451);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 32))
      objc_msgSend(v6, "setFzError:");
    if (*(_DWORD *)(a1 + 36))
      objc_msgSend(v6, "setMessageError:");
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v6, "setIsTypingIndicator:", 1);
    if (*(_BYTE *)(a1 + 41))
      objc_msgSend(v6, "setIsGroupMessage:", 1);
    if (*(_BYTE *)(a1 + 42))
      objc_msgSend(v6, "setIsFromPhoneNumber:", 1);
    if (*(_BYTE *)(a1 + 43))
      objc_msgSend(v6, "setIsFromEmail:", 1);
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setHasAttachments:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v26 = 138412290;
      v27 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v26 = 134217984;
      v27 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "fzError");
      v26 = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "messageError");
      v26 = 67109120;
      LODWORD(v27) = v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "isTypingIndicator") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, " isTypingIndicator: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "isGroupMessage") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "isFromPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " isFromPhoneNumber: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "isFromEmail") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "       isFromEmail: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "hasAttachments"))
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageSentWithConnectionType(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, uint64_t a9, int a10)
{
  _QWORD v10[5];
  int v11;
  int v12;
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2067C9940;
  v10[3] = &unk_24BFDEB50;
  v11 = a2;
  v12 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v10[4] = a9;
  v13 = a10;
  sub_2067C6C34(v10);
}

void sub_2067C9940(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  NSObject *v25;
  __CFString *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  unsigned int v30;
  const __CFString *v31;
  int v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 136446210;
    v33 = "void FTAWDLogIMessageSentWithConnectionType(NSString *, FTAWDFZError, FTAWDMessageError, BOOL, BOOL, BOOL, BOO"
          "L, BOOL, NSNumber *, FTAWDiMessageConnectionType)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v32, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308419);
  v4 = (unint64_t)sub_2067C72A4(5308452);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setFzError:");
    if (*(_DWORD *)(a1 + 44))
      objc_msgSend(v6, "setMessageError:");
    if (*(_BYTE *)(a1 + 52))
      objc_msgSend(v6, "setIsTypingIndicator:", 1);
    if (*(_BYTE *)(a1 + 53))
      objc_msgSend(v6, "setIsGroupMessage:", 1);
    if (*(_BYTE *)(a1 + 54))
      objc_msgSend(v6, "setIsToPhoneNumber:", 1);
    if (*(_BYTE *)(a1 + 55))
      objc_msgSend(v6, "setIsToEmail:", 1);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v6, "setHasAttachments:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_DWORD *)(a1 + 48))
      objc_msgSend(v6, "setConnectionType:");
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 134217984;
      v33 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v32 = 138412290;
      v33 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v32 = 134217984;
      v33 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "fzError");
      v32 = 67109120;
      LODWORD(v33) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v6, "messageError");
      v32 = 67109120;
      LODWORD(v33) = v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "isTypingIndicator") ? CFSTR("YES") : CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, " isTypingIndicator: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "isGroupMessage") ? CFSTR("YES") : CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "isToPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "isToEmail") ? CFSTR("YES") : CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v6, "hasAttachments") ? CFSTR("YES") : CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v27 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v6, "sendDuration");
      v32 = 67109120;
      LODWORD(v33) = v28;
      _os_log_impl(&dword_2067C5000, v27, OS_LOG_TYPE_DEFAULT, "      sendDuration: %d", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v6, "connectionType");
      if (v30 > 8)
        v31 = CFSTR("Unknown");
      else
        v31 = *(&off_24BFDEEF0 + (int)v30);
      v32 = 138412290;
      v33 = (const char *)v31;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "      connectionType: %@", (uint8_t *)&v32, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

const __CFString *sub_2067CA134(unsigned int a1)
{
  if (a1 > 8)
    return CFSTR("Unknown");
  else
    return *(&off_24BFDEEF0 + (int)a1);
}

void FTAWDLogIMessageSent(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, uint64_t a9)
{
  _QWORD v9[5];
  int v10;
  int v11;
  int v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2067C9940;
  v9[3] = &unk_24BFDEB50;
  v10 = a2;
  v11 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v9[4] = a9;
  v12 = 0;
  sub_2067C6C34(v9);
}

void FTAWDLogIMessageAttachmentDownload(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  _QWORD v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  int v15;
  int v16;
  int v17;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2067CA2B4;
  v9[3] = &unk_24BFDEB78;
  v14 = a2;
  v15 = a3;
  v9[4] = a5;
  v9[5] = a6;
  v16 = a4;
  v17 = a8;
  v9[6] = a7;
  v9[7] = a9;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  sub_2067C6C34(v9);
}

void FTAWDLogIMessageAttachmentDownloadNew(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _QWORD v17[16];
  int v18;
  int v19;
  int v20;
  int v21;

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_2067CA2B4;
  v17[3] = &unk_24BFDEB78;
  v18 = a2;
  v19 = a3;
  v17[4] = a5;
  v17[5] = a6;
  v20 = a4;
  v21 = a8;
  v17[6] = a7;
  v17[7] = a9;
  v17[8] = a11;
  v17[9] = a13;
  v17[10] = a15;
  v17[11] = a17;
  v17[12] = a10;
  v17[13] = a12;
  v17[14] = a14;
  v17[15] = a16;
  sub_2067C6C34(v17);
}

void sub_2067CA2B4(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  int v51;
  int v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v52 = 136446210;
    v53 = "void FTAWDLogIMessageAttachmentDownloadNew(NSString *, FTAWDFZError, FTAWDMessageError, FTAWDMMCSError, NSNumb"
          "er *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, NSNumber *, NSString *, NSNumber *, NSString *, NSNu"
          "mber *, NSString *, NSNumber *, NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v52, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308417);
  v4 = (unint64_t)sub_2067C72A4(5308453);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 128))
      objc_msgSend(v6, "setFzError:");
    if (*(_DWORD *)(a1 + 132))
      objc_msgSend(v6, "setMessageError:");
    if (*(_DWORD *)(a1 + 136))
      objc_msgSend(v6, "setTokenError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setDownloadDuration:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    if (*(_DWORD *)(a1 + 140))
      objc_msgSend(v6, "setConnectionType:");
    v10 = *(void **)(a1 + 56);
    if (v10)
      objc_msgSend(v6, "setAttachmentSize:", objc_msgSend(v10, "unsignedIntValue") / 0x3E8uLL);
    v11 = *(void **)(a1 + 64);
    if (v11)
      objc_msgSend(v6, "setFirstLevelMMCSError:", objc_msgSend(v11, "intValue"));
    v12 = *(void **)(a1 + 72);
    if (v12)
      objc_msgSend(v6, "setSecondLevelMMCSError:", objc_msgSend(v12, "intValue"));
    v13 = *(void **)(a1 + 80);
    if (v13)
      objc_msgSend(v6, "setThirdLevelMMCSError:", objc_msgSend(v13, "intValue"));
    v14 = *(void **)(a1 + 88);
    if (v14)
      objc_msgSend(v6, "setFourthLevelMMCSError:", objc_msgSend(v14, "intValue"));
    if (*(_QWORD *)(a1 + 96))
      objc_msgSend(v6, "setFirstLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 104))
      objc_msgSend(v6, "setSecondLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 112))
      objc_msgSend(v6, "setThirdLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 120))
      objc_msgSend(v6, "setFourthLevelMMCSErrorDomain:");
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v6, "firstLevelMMCSError");
      v52 = 67109120;
      LODWORD(v53) = v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "firstLevelMMCSErrorDomain");
      v52 = 138412290;
      v53 = (const char *)v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "secondLevelMMCSError");
      v52 = 67109120;
      LODWORD(v53) = v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "secondLevelMMCSErrorDomain");
      v52 = 138412290;
      v53 = (const char *)v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "thirdLevelMMCSError");
      v52 = 67109120;
      LODWORD(v53) = v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v6, "thirdLevelMMCSErrorDomain");
      v52 = 138412290;
      v53 = (const char *)v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v27 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v6, "fourthLevelMMCSError");
      v52 = 67109120;
      LODWORD(v53) = v28;
      _os_log_impl(&dword_2067C5000, v27, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v6, "fourthLevelMMCSErrorDomain");
      v52 = 138412290;
      v53 = (const char *)v30;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 134217984;
      v53 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v32 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v6, "guid");
      v52 = 138412290;
      v53 = (const char *)v33;
      _os_log_impl(&dword_2067C5000, v32, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v34 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v6, "timestamp");
      v52 = 134217984;
      v53 = (const char *)v35;
      _os_log_impl(&dword_2067C5000, v34, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v52, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v36 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v6, "fzError");
      v52 = 67109120;
      LODWORD(v53) = v37;
      _os_log_impl(&dword_2067C5000, v36, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v38 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v6, "messageError");
      v52 = 67109120;
      LODWORD(v53) = v39;
      _os_log_impl(&dword_2067C5000, v38, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v40 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v6, "tokenError");
      v52 = 67109120;
      LODWORD(v53) = v41;
      _os_log_impl(&dword_2067C5000, v40, OS_LOG_TYPE_DEFAULT, "        tokenError: %u", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v42 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v6, "genericError");
      v52 = 67109120;
      LODWORD(v53) = v43;
      _os_log_impl(&dword_2067C5000, v42, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v44 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v6, "downloadDuration");
      v52 = 67109120;
      LODWORD(v53) = v45;
      _os_log_impl(&dword_2067C5000, v44, OS_LOG_TYPE_DEFAULT, "  downloadDuration: %u", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v46 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v6, "linkQuality");
      v52 = 67109120;
      LODWORD(v53) = v47;
      _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "       linkQuality: %d", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v48 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_msgSend(v6, "connectionType");
      v52 = 67109120;
      LODWORD(v53) = v49;
      _os_log_impl(&dword_2067C5000, v48, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v52, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v50 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v6, "attachmentSize");
      v52 = 67109120;
      LODWORD(v53) = v51;
      _os_log_impl(&dword_2067C5000, v50, OS_LOG_TYPE_DEFAULT, "    attachmentSize: %u", (uint8_t *)&v52, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageAttachmentUpload(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  _QWORD v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2067CAF08;
  v9[3] = &unk_24BFDEBA0;
  v15 = a2;
  v16 = a3;
  v9[4] = a5;
  v9[5] = a6;
  v17 = a4;
  v18 = a8;
  v9[6] = a7;
  v9[7] = a9;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sub_2067C6C34(v9);
}

__n128 FTAWDLogIMessageAttachmentUploadNew(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  __n128 result;
  _QWORD v19[7];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_2067CAF08;
  v19[3] = &unk_24BFDEBA0;
  v30 = a2;
  v31 = a3;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v32 = a4;
  v33 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a12;
  v23 = a14;
  v24 = a16;
  v25 = a18;
  v26 = a11;
  v27 = a13;
  v28 = a15;
  v29 = a17;
  sub_2067C6C34(v19);
  return result;
}

void sub_2067CAF08(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
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
  NSObject *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  int v57;
  int v58;
  const char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v58 = 136446210;
    v59 = "void FTAWDLogIMessageAttachmentUploadNew(NSString *, FTAWDFZError, FTAWDMessageError, FTAWDMMCSError, NSNumber"
          " *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, NSNumber *, NSNumber *, NSNumber *, NSString *, NSNumb"
          "er *, NSString *, NSNumber *, NSString *, NSNumber *, NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v58, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308418);
  v4 = (unint64_t)sub_2067C72A4(5308454);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 144))
      objc_msgSend(v6, "setFzError:");
    if (*(_DWORD *)(a1 + 148))
      objc_msgSend(v6, "setMessageError:");
    if (*(_DWORD *)(a1 + 152))
      objc_msgSend(v6, "setTokenError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setUploadDuration:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    if (*(_DWORD *)(a1 + 156))
      objc_msgSend(v6, "setConnectionType:");
    v10 = *(void **)(a1 + 56);
    if (v10)
      objc_msgSend(v6, "setAttachmentSize:", objc_msgSend(v10, "unsignedIntValue") / 0x3E8uLL);
    v11 = *(void **)(a1 + 64);
    if (v11)
      objc_msgSend(v6, "setTimeFromLastPrewarm:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = *(void **)(a1 + 72);
    if (v12)
      objc_msgSend(v6, "setLastPrewarmDuration:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = *(void **)(a1 + 80);
    if (v13)
      objc_msgSend(v6, "setFirstLevelMMCSError:", objc_msgSend(v13, "intValue"));
    v14 = *(void **)(a1 + 88);
    if (v14)
      objc_msgSend(v6, "setSecondLevelMMCSError:", objc_msgSend(v14, "intValue"));
    v15 = *(void **)(a1 + 96);
    if (v15)
      objc_msgSend(v6, "setThirdLevelMMCSError:", objc_msgSend(v15, "intValue"));
    v16 = *(void **)(a1 + 104);
    if (v16)
      objc_msgSend(v6, "setFourthLevelMMCSError:", objc_msgSend(v16, "intValue"));
    if (*(_QWORD *)(a1 + 112))
      objc_msgSend(v6, "setFirstLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 120))
      objc_msgSend(v6, "setSecondLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 128))
      objc_msgSend(v6, "setThirdLevelMMCSErrorDomain:");
    if (*(_QWORD *)(a1 + 136))
      objc_msgSend(v6, "setFourthLevelMMCSErrorDomain:");
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "firstLevelMMCSError");
      v58 = 67109120;
      LODWORD(v59) = v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "firstLevelMMCSErrorDomain");
      v58 = 138412290;
      v59 = (const char *)v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "secondLevelMMCSError");
      v58 = 67109120;
      LODWORD(v59) = v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "secondLevelMMCSErrorDomain");
      v58 = 138412290;
      v59 = (const char *)v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v6, "thirdLevelMMCSError");
      v58 = 67109120;
      LODWORD(v59) = v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v27 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v6, "thirdLevelMMCSErrorDomain");
      v58 = 138412290;
      v59 = (const char *)v28;
      _os_log_impl(&dword_2067C5000, v27, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v6, "fourthLevelMMCSError");
      v58 = 67109120;
      LODWORD(v59) = v30;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v6, "fourthLevelMMCSErrorDomain");
      v58 = 138412290;
      v59 = (const char *)v32;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v33 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v58 = 134217984;
      v59 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v33, OS_LOG_TYPE_DEFAULT, "      Metric Object: %p", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v34 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v6, "guid");
      v58 = 138412290;
      v59 = (const char *)v35;
      _os_log_impl(&dword_2067C5000, v34, OS_LOG_TYPE_DEFAULT, "               GUID: %@", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v36 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v6, "timestamp");
      v58 = 134217984;
      v59 = (const char *)v37;
      _os_log_impl(&dword_2067C5000, v36, OS_LOG_TYPE_DEFAULT, "          Timestamp: %llu", (uint8_t *)&v58, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v38 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v6, "fzError");
      v58 = 67109120;
      LODWORD(v59) = v39;
      _os_log_impl(&dword_2067C5000, v38, OS_LOG_TYPE_DEFAULT, "            fzError: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v40 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v6, "messageError");
      v58 = 67109120;
      LODWORD(v59) = v41;
      _os_log_impl(&dword_2067C5000, v40, OS_LOG_TYPE_DEFAULT, "       messageError: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v42 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v6, "tokenError");
      v58 = 67109120;
      LODWORD(v59) = v43;
      _os_log_impl(&dword_2067C5000, v42, OS_LOG_TYPE_DEFAULT, "         tokenError: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v44 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v6, "genericError");
      v58 = 67109120;
      LODWORD(v59) = v45;
      _os_log_impl(&dword_2067C5000, v44, OS_LOG_TYPE_DEFAULT, "       genericError: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v46 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v6, "uploadDuration");
      v58 = 67109120;
      LODWORD(v59) = v47;
      _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "     uploadDuration: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v48 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_msgSend(v6, "linkQuality");
      v58 = 67109120;
      LODWORD(v59) = v49;
      _os_log_impl(&dword_2067C5000, v48, OS_LOG_TYPE_DEFAULT, "        linkQuality: %d", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v50 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v6, "connectionType");
      v58 = 67109120;
      LODWORD(v59) = v51;
      _os_log_impl(&dword_2067C5000, v50, OS_LOG_TYPE_DEFAULT, "     connectionType: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v52 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v53 = objc_msgSend(v6, "attachmentSize");
      v58 = 67109120;
      LODWORD(v59) = v53;
      _os_log_impl(&dword_2067C5000, v52, OS_LOG_TYPE_DEFAULT, "     attachmentSize: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v54 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(v6, "timeFromLastPrewarm");
      v58 = 67109120;
      LODWORD(v59) = v55;
      _os_log_impl(&dword_2067C5000, v54, OS_LOG_TYPE_DEFAULT, "timeFromLastPrewarm: %u", (uint8_t *)&v58, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v56 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend(v6, "lastPrewarmDuration");
      v58 = 67109120;
      LODWORD(v59) = v57;
      _os_log_impl(&dword_2067C5000, v56, OS_LOG_TYPE_DEFAULT, "lastPrewarmDuration: %u", (uint8_t *)&v58, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageDelivered(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067CBBB8;
  block[3] = &unk_24BFDEBC8;
  block[4] = a2;
  sub_2067C6C34(block);
}

void sub_2067CBBB8(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446210;
    v16 = "void FTAWDLogIMessageDelivered(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v15, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308420);
  v4 = (unint64_t)sub_2067C72A4(5308455);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setDeliveryDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v15 = 138412290;
      v16 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v15 = 134217984;
      v16 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "deliveryDuration");
      v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "  deliveryDuration: %u", (uint8_t *)&v15, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageDowngrade(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_2067CBF90;
  v3[3] = &unk_24BFDEBF0;
  v3[4] = a2;
  v4 = a3;
  sub_2067C6C34(v3);
}

void sub_2067CBF90(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136446210;
    v18 = "void FTAWDLogIMessageDowngrade(NSString *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v17, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308440);
  v4 = (unint64_t)sub_2067C72A4(5308456);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setDurationBeforeDowngrade:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v6, "setIsManualDowngrade:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "          Metric Object: %p", (uint8_t *)&v17, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v17 = 138412290;
      v18 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "                   GUID: %@", (uint8_t *)&v17, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v17 = 134217984;
      v18 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              Timestamp: %llu", (uint8_t *)&v17, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "durationBeforeDowngrade");
      v17 = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "durationBeforeDowngrade: %u", (uint8_t *)&v17, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 40))
        v16 = CFSTR("NO");
      v17 = 138412290;
      v18 = (const char *)v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "      isManualDowngrade: %@", (uint8_t *)&v17, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void sub_2067CC3B0(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  int v33;
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136446210;
    v35 = "void FTAWDLogIMessageQueryFinished(NSString *, BOOL, FTAWDNetworkConnectionType, NSNumber *, BOOL, BOOL, FTAWD"
          "ConferenceMessageResultCode, NSNumber *, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v34, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308441);
  v4 = (unint64_t)sub_2067C72A4(5308457);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v6, "setSuccess:", 1);
    if (*(_DWORD *)(a1 + 64))
      objc_msgSend(v6, "setConnectionType:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setQueryDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 73))
      objc_msgSend(v6, "setIsPhoneNumber:", 1);
    if (*(_BYTE *)(a1 + 74))
      objc_msgSend(v6, "setIsEmail:", 1);
    if (*(_DWORD *)(a1 + 68))
      objc_msgSend(v6, "setResultCode:");
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v9, "intValue"));
    v10 = *(void **)(a1 + 56);
    if (v10)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v10, "intValue"));
    if ((objc_opt_respondsToSelector() & 1) != 0 && *(_BYTE *)(a1 + 75))
      objc_msgSend(v6, "setWasReversePushAttempted:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 134217984;
      v35 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "guid");
      v34 = 138412290;
      v35 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "timestamp");
      v34 = 134217984;
      v35 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "success") ? CFSTR("YES") : CFSTR("NO");
      v34 = 138412290;
      v35 = (const char *)v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "connectionType");
      v34 = 67109120;
      LODWORD(v35) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v34, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "queryDuration");
      v34 = 67109120;
      LODWORD(v35) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "     queryDuration: %u", (uint8_t *)&v34, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "isPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v34 = 138412290;
      v35 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "     isPhoneNumber: %@", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "isEmail") ? CFSTR("YES") : CFSTR("NO");
      v34 = 138412290;
      v35 = (const char *)v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "           isEmail: %@", (uint8_t *)&v34, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "resultCode");
      v34 = 67109120;
      LODWORD(v35) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v34, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "genericError");
      v34 = 67109120;
      LODWORD(v35) = v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v34, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v30 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v6, "uRLError");
      v34 = 67109120;
      LODWORD(v35) = v31;
      _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v34, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v32 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v6, "pOSIXError");
      v34 = 67109120;
      LODWORD(v35) = v33;
      _os_log_impl(&dword_2067C5000, v32, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v34, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageDeduplicated(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067CCBFC;
  block[3] = &unk_24BFDEBC8;
  block[4] = a2;
  sub_2067C6C34(block);
}

void sub_2067CCBFC(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446210;
    v16 = "void FTAWDLogIMessageDeduplicated(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v15, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5308442);
  v4 = (unint64_t)sub_2067C72A4(5308458);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setDeduplicationInterval:", objc_msgSend(v7, "unsignedIntValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v15 = 138412290;
      v16 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "                 GUID: %@", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v15 = 134217984;
      v16 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", (uint8_t *)&v15, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "deduplicationInterval");
      v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "deduplicationInterval: %u", (uint8_t *)&v15, 8u);
    }
    sub_2067C7590(v6, (void *)v3);
    if (sub_2067C8A0C())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogIMessageHealthCheckPerformed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD block[11];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067CCFD8;
  block[3] = &unk_24BFDEC40;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  block[9] = a6;
  block[10] = a7;
  sub_2067C6C34(block);
}

void sub_2067CCFD8(_QWORD *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v53 = "void FTAWDLogIMessageHealthCheckPerformed(NSNumber *, NSNumber *, NSNumber *, NSArray<NSNumber *> *, NSArray<N"
          "SNumber *> *, NSArray<NSNumber *> *, NSArray<NSNumber *> *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v3 = sub_2067C72A4(5308459);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    v6 = (void *)a1[4];
    if (v6)
      objc_msgSend(v5, "setNumberOfRequests:", objc_msgSend(v6, "unsignedIntValue"));
    v7 = (void *)a1[5];
    if (v7)
      objc_msgSend(v5, "setNumberOfResponses:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = (void *)a1[6];
    if (v8)
      objc_msgSend(v5, "setNumMessages:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = (void *)a1[7];
    if (v9)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v45 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v5, "addNumOutOfOrder:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "unsignedIntValue"));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v11);
      }
    }
    v14 = (void *)a1[8];
    if (v14)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v5, "addNumMissed:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "unsignedIntValue"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v16);
      }
    }
    v19 = (void *)a1[9];
    if (v19)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(v5, "addAliasesMatched:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "unsignedIntValue"));
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        }
        while (v21);
      }
    }
    v24 = (void *)a1[10];
    if (v24)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v33;
        do
        {
          for (m = 0; m != v26; ++m)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(v5, "addCoarseMatched:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * m), "unsignedIntValue"));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        }
        while (v26);
      }
    }
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v30 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v5, "timestamp");
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v31;
      _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", buf, 0xCu);
    }
    sub_2067C7590(v5, v4);

  }
}

void FTAWDLogIMessageCloudKitSyncFailed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD v6[10];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2067CD4F4;
  v6[3] = &unk_24BFDEC68;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = a4;
  v6[8] = a5;
  v6[9] = a6;
  sub_2067C6C34(v6);
}

void sub_2067CD4F4(_QWORD *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446210;
    v13 = "void FTAWDLogIMessageCloudKitSyncFailed(NSString *, NSString *, NSNumber *, NSString *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  v3 = sub_2067C72A4(5308460);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[4])
      objc_msgSend(v5, "setSyncType:");
    if (a1[5])
      objc_msgSend(v5, "setTopLevelErrorDomain:");
    v6 = (void *)a1[6];
    if (v6)
      objc_msgSend(v5, "setTopLevelErrorCode:", objc_msgSend(v6, "intValue"));
    if (a1[7])
      objc_msgSend(v5, "setNestedErrorDomain:");
    v7 = (void *)a1[8];
    if (v7)
      objc_msgSend(v5, "setNestedErrorCode:", objc_msgSend(v7, "intValue"));
    v8 = (void *)a1[9];
    if (v8)
      objc_msgSend(v5, "setLinkQuality:", objc_msgSend(v8, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", (uint8_t *)&v12, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v5, "timestamp");
      v12 = 134217984;
      v13 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", (uint8_t *)&v12, 0xCu);
    }
    sub_2067C7590(v5, v4);

  }
}

void FTAWDLogIMessageCloudKitValidatePurgeableAttachment(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v8[11];
  char v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2067CD7E4;
  v8[3] = &unk_24BFDEC90;
  v9 = a1;
  v8[4] = a2;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = a6;
  v8[9] = a7;
  v8[10] = a8;
  sub_2067C6C34(v8);
}

void sub_2067CD7E4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136446210;
    v31 = "void FTAWDLogIMessageCloudKitValidatePurgeableAttachment(BOOL, NSNumber *, NSString *, NSNumber *, NSString *,"
          " NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  v3 = sub_2067C72A4(5308461);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 88))
      objc_msgSend(v5, "setValidatedAttachment:", 1);
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v5, "setAttachmentSize:", objc_msgSend(v6, "unsignedIntValue"));
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v5, "setOperationalErrorDomain:");
    v7 = *(void **)(a1 + 48);
    if (v7)
      objc_msgSend(v5, "setOperationalErrorCode:", objc_msgSend(v7, "intValue"));
    if (*(_QWORD *)(a1 + 56))
      objc_msgSend(v5, "setValidationErrorDomain:");
    v8 = *(void **)(a1 + 64);
    if (v8)
      objc_msgSend(v5, "setValidationErrorCode:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 72);
    if (v9)
      objc_msgSend(v5, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    v10 = *(void **)(a1 + 80);
    if (v10)
      objc_msgSend(v5, "setConnectionType:", objc_msgSend(v10, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134217984;
      v31 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "          Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v5, "timestamp");
      v30 = 134217984;
      v31 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "              Timestamp: %llu", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v5, "validatedAttachment");
      v30 = 67109120;
      LODWORD(v31) = v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "    validatedAttachment: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v5, "attachmentSize");
      v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "         attachmentSize: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v5, "validationErrorDomain");
      v30 = 138412290;
      v31 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, " operationalErrorDomain: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v5, "validationErrorCode");
      v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "   operationalErrorCode: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v5, "operationalErrorDomain");
      v30 = 138412290;
      v31 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "  validationErrorDomain: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v5, "operationalErrorCode");
      v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "    validationErrorCode: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v5, "linkQuality");
      v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "            linkQuality: %d", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v5, "connectionType");
      v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "         connectionType: %u", (uint8_t *)&v30, 8u);
    }
    sub_2067C7590(v5, v4);

  }
}

void FTAWDLogCallStarted(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  _QWORD block[4];
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067CDE9C;
  block[3] = &unk_24BFDECB0;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = a2;
  sub_2067C6C34(block);
}

void sub_2067CDE9C(_BYTE *a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  id v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446210;
    v25 = "void FTAWDLogCallStarted(NSString *, BOOL, BOOL, BOOL, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v24, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312513);
  v4 = (unint64_t)sub_2067C72A4(5312529);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[32])
      objc_msgSend(v6, "setIsVideo:", 1);
    if (a1[33])
      objc_msgSend(v6, "setIsToPhoneNumber:", 1);
    if (a1[34])
      objc_msgSend(v6, "setIsToEmail:", 1);
    if (a1[35])
      objc_msgSend(v6, "setIsCallUpgrade:", 1);
    if (a1[36])
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v24 = 138412290;
      v25 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v24 = 134217984;
      v25 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "           isVideo: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isToPhoneNumber") ? CFSTR("YES") : CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "isToEmail") ? CFSTR("YES") : CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "isCallUpgrade") ? CFSTR("YES") : CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "     isCallUpgrade: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "      onLockScreen: %@", (uint8_t *)&v24, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v22 = a1[37];
    v23 = sub_2067C821C();
    if (sub_2067CE474(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

BOOL sub_2067CE474(int a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("GMT"));
  objc_msgSend(v5, "setTimeZone:", v6);
  v7 = (void *)objc_msgSend(v5, "components:fromDate:", 112, a2);
  v8 = objc_msgSend(v7, "day");
  v9 = objc_msgSend(v7, "hour");
  v10 = objc_msgSend(v7, "minute");

  if (v9 == 23 && v10 > 54)
    return 0;
  if (!v9 && v10 < 6)
    return 0;
  if (a1)
    return (v8 & 0x8000000000000001) == 1;
  else
    return (v8 & 1) == 0;
}

__n128 FTAWDLogCallConnected(uint64_t a1, char a2, char a3, uint64_t a4, int a5, int a6, int a7, char a8, __int128 a9, uint64_t a10, char a11)
{
  __n128 result;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_2067CE5E0;
  v12[3] = &unk_24BFDECD8;
  v18 = a3;
  v12[4] = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v19 = a8;
  v13 = a9;
  v14 = a10;
  v20 = a11;
  v21 = a2;
  sub_2067C6C34(v12);
  return result;
}

void sub_2067CE5E0(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  __CFString *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  const __CFString *v36;
  int v37;
  id v38;
  int v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 136446210;
    v40 = "void FTAWDLogCallConnected(NSString *, BOOL, BOOL, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnect"
          "ionType, FTAWDConnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v39, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312514);
  v4 = (unint64_t)sub_2067C72A4(5312530);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 76))
      objc_msgSend(v6, "setIsVideo:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_DWORD *)(a1 + 64))
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    if (*(_DWORD *)(a1 + 68))
      objc_msgSend(v6, "setLocalNetworkConnection:");
    if (*(_DWORD *)(a1 + 72))
      objc_msgSend(v6, "setConnectionType:");
    if (*(_BYTE *)(a1 + 77))
      objc_msgSend(v6, "setUsesRelay:", 1);
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = *(void **)(a1 + 56);
    if (v10)
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v10, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 78))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 134217984;
      v40 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              Metric Object: %p", (uint8_t *)&v39, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "guid");
      v39 = 138412290;
      v40 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "                       GUID: %@", (uint8_t *)&v39, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "timestamp");
      v39 = 134217984;
      v40 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "                  Timestamp: %llu", (uint8_t *)&v39, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "                      ", (uint8_t *)&v39, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v39 = 138412290;
      v40 = (const char *)v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "                    isVideo: %@", (uint8_t *)&v39, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "connectDuration");
      v39 = 67109120;
      LODWORD(v40) = v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "            connectDuration: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "remoteNetworkConnection");
      v39 = 67109120;
      LODWORD(v40) = v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "remoteNetworkConnectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "localNetworkConnection");
      v39 = 67109120;
      LODWORD(v40) = v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, " localNetworkConnectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v6, "connectionType");
      v39 = 67109120;
      LODWORD(v40) = v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "             connectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v27 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v6, "usesRelay") ? CFSTR("YES") : CFSTR("NO");
      v39 = 138412290;
      v40 = (const char *)v28;
      _os_log_impl(&dword_2067C5000, v27, OS_LOG_TYPE_DEFAULT, "                  usesRelay: %@", (uint8_t *)&v39, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v6, "currentNatType");
      v39 = 67109120;
      LODWORD(v40) = v30;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "             currentNatType: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v6, "remoteNatType");
      v39 = 67109120;
      LODWORD(v40) = v32;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "              remoteNatType: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v33 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(v6, "relayConnectDuration");
      v39 = 67109120;
      LODWORD(v40) = v34;
      _os_log_impl(&dword_2067C5000, v33, OS_LOG_TYPE_DEFAULT, "       relayConnectDuration: %u", (uint8_t *)&v39, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v35 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v36 = CFSTR("YES");
      else
        v36 = CFSTR("NO");
      v39 = 138412290;
      v40 = (const char *)v36;
      _os_log_impl(&dword_2067C5000, v35, OS_LOG_TYPE_DEFAULT, "               onLockScreen: %@", (uint8_t *)&v39, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v37 = *(unsigned __int8 *)(a1 + 79);
    v38 = sub_2067C821C();
    if (sub_2067CE474(v37, (uint64_t)v38))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

__n128 FTAWDLogCallEnded(uint64_t a1, char a2, char a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10, __int128 a11, uint64_t a12, char a13, char a14, char a15, int a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,int a21,char a22,__int128 a23,uint64_t a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  __n128 result;
  _QWORD block[4];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  __int128 v47;
  int v48;
  uint64_t v49;
  int v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067CEFC8;
  block[3] = &unk_24BFDED00;
  v51 = a3;
  v42 = a4;
  v43 = a5;
  v44 = a6;
  v45 = a7;
  v46 = a8;
  v47 = a9;
  v32 = a10;
  v33 = a11;
  v34 = a12;
  v52 = a13;
  v53 = a14;
  v54 = a15;
  v48 = a16;
  v35 = a17;
  v36 = a18;
  v37 = a19;
  v49 = a20;
  v50 = a21;
  v55 = a22;
  v38 = a23;
  v56 = a2;
  v57 = a25;
  v58 = a26;
  v59 = a27;
  v39 = a24;
  v40 = a28;
  v41 = a29;
  v60 = a30;
  sub_2067C6C34(block);
  return result;
}

void sub_2067CEFC8(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  int v63;
  const __CFString *v64;
  NSObject *v65;
  int v66;
  const __CFString *v67;
  NSObject *v68;
  int v69;
  const __CFString *v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  int v76;
  NSObject *v77;
  int v78;
  NSObject *v79;
  int v80;
  NSObject *v81;
  int v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  int v86;
  NSObject *v87;
  int v88;
  NSObject *v89;
  int v90;
  const __CFString *v91;
  NSObject *v92;
  int v93;
  NSObject *v94;
  int v95;
  NSObject *v96;
  int v97;
  NSObject *v98;
  int v99;
  const __CFString *v100;
  NSObject *v101;
  int v102;
  const __CFString *v103;
  NSObject *v104;
  int v105;
  const __CFString *v106;
  NSObject *v107;
  int v108;
  const __CFString *v109;
  NSObject *v110;
  int v111;
  NSObject *v112;
  int v113;
  NSObject *v114;
  int v115;
  const __CFString *v116;
  int v117;
  id v118;
  int v119;
  const char *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v119 = 136446210;
    v120 = "void FTAWDLogCallEnded(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDConfere"
           "nceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscError, "
           "FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNumber "
           "*, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *, NSN"
           "umber *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTAWDCon"
           "nectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v119, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312515);
  v4 = (unint64_t)sub_2067C72A4(5312531);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 204))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 152))
      objc_msgSend(v6, "setEndedReason:");
    if (*(_DWORD *)(a1 + 156))
      objc_msgSend(v6, "setGenericError:");
    if (*(_DWORD *)(a1 + 160))
      objc_msgSend(v6, "setViceroyError:");
    if (*(_DWORD *)(a1 + 164))
      objc_msgSend(v6, "setGameKitError:");
    if (*(_DWORD *)(a1 + 168))
      objc_msgSend(v6, "setMessageDeliveryError:");
    if (*(_DWORD *)(a1 + 172))
      objc_msgSend(v6, "setConferenceMiscError:");
    if (*(_DWORD *)(a1 + 176))
      objc_msgSend(v6, "setRegistrationError:");
    if (*(_DWORD *)(a1 + 180))
      objc_msgSend(v6, "setRelayError:");
    if (*(_DWORD *)(a1 + 184))
      objc_msgSend(v6, "setInvitationServiceError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v6, "setCallDuration:", (ceil(v8 / 10.0) * 10.0));
    }
    v9 = *(void **)(a1 + 40);
    if (v9)
      objc_msgSend(v6, "setDiagnosticPingMin:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = *(void **)(a1 + 48);
    if (v10)
      objc_msgSend(v6, "setDiagnosticPingAvg:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = *(void **)(a1 + 56);
    if (v11)
      objc_msgSend(v6, "setDiagnosticPingMax:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = *(void **)(a1 + 64);
    if (v12)
      objc_msgSend(v6, "setDiagnosticPingPacketLoss:", objc_msgSend(v12, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 205))
      objc_msgSend(v6, "setIsNetworkEnabled:", 1);
    if (*(_BYTE *)(a1 + 206))
      objc_msgSend(v6, "setIsNetworkActive:", 1);
    if (*(_BYTE *)(a1 + 207))
      objc_msgSend(v6, "setIsNetworkReachable:", 1);
    if (*(_DWORD *)(a1 + 188))
      objc_msgSend(v6, "setNetworkCheckResult:");
    v13 = *(void **)(a1 + 72);
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(v6, "setFrontCameraCaptureDuration:", (ceil(v14 / 10.0) * 10.0));
    }
    v15 = *(void **)(a1 + 80);
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      objc_msgSend(v6, "setBackCameraCaptureDuration:", (ceil(v16 / 10.0) * 10.0));
    }
    v17 = *(void **)(a1 + 88);
    if (v17)
      objc_msgSend(v6, "setDataRate:", 7 * objc_msgSend(v17, "unsignedIntValue") + 931);
    v18 = *(void **)(a1 + 96);
    if (v18)
      objc_msgSend(v6, "setGksError:", objc_msgSend(v18, "intValue"));
    v19 = *(void **)(a1 + 104);
    if (v19)
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v19, "unsignedIntValue"));
    if (*(_DWORD *)(a1 + 192))
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    if (*(_DWORD *)(a1 + 196))
      objc_msgSend(v6, "setLocalNetworkConnection:");
    if (*(_DWORD *)(a1 + 200))
      objc_msgSend(v6, "setConnectionType:");
    if (*(_BYTE *)(a1 + 208))
      objc_msgSend(v6, "setUsesRelay:", 1);
    v20 = *(void **)(a1 + 112);
    if (v20)
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v20, "unsignedIntValue"));
    v21 = *(void **)(a1 + 120);
    if (v21)
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v21, "unsignedIntValue"));
    v22 = *(void **)(a1 + 128);
    if (v22)
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v22, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 209))
      objc_msgSend(v6, "setIsInitiator:", 1);
    if (*(_BYTE *)(a1 + 210))
      objc_msgSend(v6, "setIsVideoInterrupted:", 1);
    if (*(_BYTE *)(a1 + 211))
      objc_msgSend(v6, "setIsAudioInterrupted:", 1);
    if (*(_BYTE *)(a1 + 212))
      objc_msgSend(v6, "setIsCallUpgrade:", 1);
    v23 = *(void **)(a1 + 136);
    if (v23)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v23, "intValue"));
    v24 = *(void **)(a1 + 144);
    if (v24)
      objc_msgSend(v6, "setGksReturnCode:", objc_msgSend(v24, "intValue"));
    if (*(_BYTE *)(a1 + 213))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v119 = 134217984;
      v120 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "guid");
      v119 = 138412290;
      v120 = (const char *)v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "timestamp");
      v119 = 134217984;
      v120 = (const char *)v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v30 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v119) = 0;
      _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v119, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v6, "isVideo");
      v33 = CFSTR("YES");
      if (!v32)
        v33 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v33;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v34 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v6, "endedReason");
      v119 = 67109120;
      LODWORD(v120) = v35;
      _os_log_impl(&dword_2067C5000, v34, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v36 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v6, "genericError");
      v119 = 67109120;
      LODWORD(v120) = v37;
      _os_log_impl(&dword_2067C5000, v36, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v38 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v6, "viceroyError");
      v119 = 67109120;
      LODWORD(v120) = v39;
      _os_log_impl(&dword_2067C5000, v38, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v40 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v6, "gameKitError");
      v119 = 67109120;
      LODWORD(v120) = v41;
      _os_log_impl(&dword_2067C5000, v40, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v42 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v6, "messageDeliveryError");
      v119 = 67109120;
      LODWORD(v120) = v43;
      _os_log_impl(&dword_2067C5000, v42, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v44 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v6, "conferenceMiscError");
      v119 = 67109120;
      LODWORD(v120) = v45;
      _os_log_impl(&dword_2067C5000, v44, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v46 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v6, "registrationError");
      v119 = 67109120;
      LODWORD(v120) = v47;
      _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v48 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_msgSend(v6, "relayError");
      v119 = 67109120;
      LODWORD(v120) = v49;
      _os_log_impl(&dword_2067C5000, v48, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v50 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v6, "invitationServiceError");
      v119 = 67109120;
      LODWORD(v120) = v51;
      _os_log_impl(&dword_2067C5000, v50, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v52 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v53 = objc_msgSend(v6, "callDuration");
      v119 = 67109120;
      LODWORD(v120) = v53;
      _os_log_impl(&dword_2067C5000, v52, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v54 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(v6, "diagnosticPingMin");
      v119 = 67109120;
      LODWORD(v120) = v55;
      _os_log_impl(&dword_2067C5000, v54, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v56 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend(v6, "diagnosticPingAvg");
      v119 = 67109120;
      LODWORD(v120) = v57;
      _os_log_impl(&dword_2067C5000, v56, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v58 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend(v6, "diagnosticPingMax");
      v119 = 67109120;
      LODWORD(v120) = v59;
      _os_log_impl(&dword_2067C5000, v58, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v60 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v61 = objc_msgSend(v6, "diagnosticPingPacketLoss");
      v119 = 67109120;
      LODWORD(v120) = v61;
      _os_log_impl(&dword_2067C5000, v60, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v62 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_msgSend(v6, "isNetworkEnabled");
      v64 = CFSTR("YES");
      if (!v63)
        v64 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v64;
      _os_log_impl(&dword_2067C5000, v62, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v65 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v66 = objc_msgSend(v6, "isNetworkActive");
      v67 = CFSTR("YES");
      if (!v66)
        v67 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v67;
      _os_log_impl(&dword_2067C5000, v65, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v68 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_msgSend(v6, "isNetworkReachable");
      v70 = CFSTR("YES");
      if (!v69)
        v70 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v70;
      _os_log_impl(&dword_2067C5000, v68, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v71 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v72 = objc_msgSend(v6, "networkCheckResult");
      v119 = 67109120;
      LODWORD(v120) = v72;
      _os_log_impl(&dword_2067C5000, v71, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v73 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v74 = objc_msgSend(v6, "frontCameraCaptureDuration");
      v119 = 67109120;
      LODWORD(v120) = v74;
      _os_log_impl(&dword_2067C5000, v73, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v75 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v76 = objc_msgSend(v6, "backCameraCaptureDuration");
      v119 = 67109120;
      LODWORD(v120) = v76;
      _os_log_impl(&dword_2067C5000, v75, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v77 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v78 = objc_msgSend(v6, "dataRate");
      v119 = 67109120;
      LODWORD(v120) = v78;
      _os_log_impl(&dword_2067C5000, v77, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v79 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v80 = objc_msgSend(v6, "gksError");
      v119 = 67109120;
      LODWORD(v120) = v80;
      _os_log_impl(&dword_2067C5000, v79, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v81 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v82 = objc_msgSend(v6, "connectDuration");
      v119 = 67109120;
      LODWORD(v120) = v82;
      _os_log_impl(&dword_2067C5000, v81, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v83 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v84 = objc_msgSend(v6, "remoteNetworkConnection");
      v119 = 67109120;
      LODWORD(v120) = v84;
      _os_log_impl(&dword_2067C5000, v83, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v85 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_msgSend(v6, "localNetworkConnection");
      v119 = 67109120;
      LODWORD(v120) = v86;
      _os_log_impl(&dword_2067C5000, v85, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v87 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v88 = objc_msgSend(v6, "connectionType");
      v119 = 67109120;
      LODWORD(v120) = v88;
      _os_log_impl(&dword_2067C5000, v87, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v89 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v90 = objc_msgSend(v6, "usesRelay");
      v91 = CFSTR("YES");
      if (!v90)
        v91 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v91;
      _os_log_impl(&dword_2067C5000, v89, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v92 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v93 = objc_msgSend(v6, "currentNatType");
      v119 = 67109120;
      LODWORD(v120) = v93;
      _os_log_impl(&dword_2067C5000, v92, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v94 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v95 = objc_msgSend(v6, "remoteNatType");
      v119 = 67109120;
      LODWORD(v120) = v95;
      _os_log_impl(&dword_2067C5000, v94, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v96 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v97 = objc_msgSend(v6, "relayConnectDuration");
      v119 = 67109120;
      LODWORD(v120) = v97;
      _os_log_impl(&dword_2067C5000, v96, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v98 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v99 = objc_msgSend(v6, "isInitiator");
      v100 = CFSTR("YES");
      if (!v99)
        v100 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v100;
      _os_log_impl(&dword_2067C5000, v98, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v101 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v102 = objc_msgSend(v6, "isVideoInterrupted");
      v103 = CFSTR("YES");
      if (!v102)
        v103 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v103;
      _os_log_impl(&dword_2067C5000, v101, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v104 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v105 = objc_msgSend(v6, "isAudioInterrupted");
      v106 = CFSTR("YES");
      if (!v105)
        v106 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v106;
      _os_log_impl(&dword_2067C5000, v104, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v107 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v108 = objc_msgSend(v6, "isCallUpgrade");
      v109 = CFSTR("YES");
      if (!v108)
        v109 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v109;
      _os_log_impl(&dword_2067C5000, v107, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v110 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v111 = objc_msgSend(v6, "linkQuality");
      v119 = 67109120;
      LODWORD(v120) = v111;
      _os_log_impl(&dword_2067C5000, v110, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v112 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v113 = objc_msgSend(v6, "gksReturnCode");
      v119 = 67109120;
      LODWORD(v120) = v113;
      _os_log_impl(&dword_2067C5000, v112, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v114 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v115 = objc_msgSend(v6, "onLockScreen");
      v116 = CFSTR("YES");
      if (!v115)
        v116 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v116;
      _os_log_impl(&dword_2067C5000, v114, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v119, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v117 = *(unsigned __int8 *)(a1 + 209);
    v118 = sub_2067C821C();
    if (sub_2067CE474(v117, (uint64_t)v118))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

__n128 FTAWDLogCallFailed(uint64_t a1, char a2, char a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10, __int128 a11, uint64_t a12, char a13, char a14, char a15, int a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,int a21,char a22,__int128 a23,uint64_t a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  __n128 result;
  _QWORD block[4];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  __int128 v47;
  int v48;
  uint64_t v49;
  int v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D08D0;
  block[3] = &unk_24BFDED00;
  v51 = a3;
  v42 = a4;
  v43 = a5;
  v44 = a6;
  v45 = a7;
  v46 = a8;
  v47 = a9;
  v32 = a10;
  v33 = a11;
  v34 = a12;
  v52 = a13;
  v53 = a14;
  v54 = a15;
  v48 = a16;
  v35 = a17;
  v36 = a18;
  v37 = a19;
  v49 = a20;
  v50 = a21;
  v55 = a22;
  v38 = a23;
  v56 = a2;
  v57 = a25;
  v58 = a26;
  v59 = a27;
  v39 = a24;
  v40 = a28;
  v41 = a29;
  v60 = a30;
  sub_2067C6C34(block);
  return result;
}

void sub_2067D08D0(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  int v63;
  const __CFString *v64;
  NSObject *v65;
  int v66;
  const __CFString *v67;
  NSObject *v68;
  int v69;
  const __CFString *v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  int v76;
  NSObject *v77;
  int v78;
  NSObject *v79;
  int v80;
  NSObject *v81;
  int v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  int v86;
  NSObject *v87;
  int v88;
  NSObject *v89;
  int v90;
  const __CFString *v91;
  NSObject *v92;
  int v93;
  NSObject *v94;
  int v95;
  NSObject *v96;
  int v97;
  NSObject *v98;
  int v99;
  const __CFString *v100;
  NSObject *v101;
  int v102;
  const __CFString *v103;
  NSObject *v104;
  int v105;
  const __CFString *v106;
  NSObject *v107;
  int v108;
  const __CFString *v109;
  NSObject *v110;
  int v111;
  NSObject *v112;
  int v113;
  NSObject *v114;
  int v115;
  const __CFString *v116;
  int v117;
  id v118;
  int v119;
  const char *v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v119 = 136446210;
    v120 = "void FTAWDLogCallFailed(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDConfer"
           "enceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscError,"
           " FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNumber"
           " *, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *, NS"
           "Number *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTAWDCo"
           "nnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v119, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312544);
  v4 = (unint64_t)sub_2067C72A4(5312560);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 204))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 152))
      objc_msgSend(v6, "setEndedReason:");
    if (*(_DWORD *)(a1 + 156))
      objc_msgSend(v6, "setGenericError:");
    if (*(_DWORD *)(a1 + 160))
      objc_msgSend(v6, "setViceroyError:");
    if (*(_DWORD *)(a1 + 164))
      objc_msgSend(v6, "setGameKitError:");
    if (*(_DWORD *)(a1 + 168))
      objc_msgSend(v6, "setMessageDeliveryError:");
    if (*(_DWORD *)(a1 + 172))
      objc_msgSend(v6, "setConferenceMiscError:");
    if (*(_DWORD *)(a1 + 176))
      objc_msgSend(v6, "setRegistrationError:");
    if (*(_DWORD *)(a1 + 180))
      objc_msgSend(v6, "setRelayError:");
    if (*(_DWORD *)(a1 + 184))
      objc_msgSend(v6, "setInvitationServiceError:");
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v6, "setCallDuration:", (ceil(v8 / 10.0) * 10.0));
    }
    v9 = *(void **)(a1 + 40);
    if (v9)
      objc_msgSend(v6, "setDiagnosticPingMin:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = *(void **)(a1 + 48);
    if (v10)
      objc_msgSend(v6, "setDiagnosticPingAvg:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = *(void **)(a1 + 56);
    if (v11)
      objc_msgSend(v6, "setDiagnosticPingMax:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = *(void **)(a1 + 64);
    if (v12)
      objc_msgSend(v6, "setDiagnosticPingPacketLoss:", objc_msgSend(v12, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 205))
      objc_msgSend(v6, "setIsNetworkEnabled:", 1);
    if (*(_BYTE *)(a1 + 206))
      objc_msgSend(v6, "setIsNetworkActive:", 1);
    if (*(_BYTE *)(a1 + 207))
      objc_msgSend(v6, "setIsNetworkReachable:", 1);
    if (*(_DWORD *)(a1 + 188))
      objc_msgSend(v6, "setNetworkCheckResult:");
    v13 = *(void **)(a1 + 72);
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(v6, "setFrontCameraCaptureDuration:", (ceil(v14 / 10.0) * 10.0));
    }
    v15 = *(void **)(a1 + 80);
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      objc_msgSend(v6, "setBackCameraCaptureDuration:", (ceil(v16 / 10.0) * 10.0));
    }
    v17 = *(void **)(a1 + 88);
    if (v17)
      objc_msgSend(v6, "setDataRate:", 7 * objc_msgSend(v17, "unsignedIntValue") + 931);
    v18 = *(void **)(a1 + 96);
    if (v18)
      objc_msgSend(v6, "setGksError:", objc_msgSend(v18, "intValue"));
    v19 = *(void **)(a1 + 104);
    if (v19)
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v19, "unsignedIntValue"));
    if (*(_DWORD *)(a1 + 192))
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    if (*(_DWORD *)(a1 + 196))
      objc_msgSend(v6, "setLocalNetworkConnection:");
    if (*(_DWORD *)(a1 + 200))
      objc_msgSend(v6, "setConnectionType:");
    if (*(_BYTE *)(a1 + 208))
      objc_msgSend(v6, "setUsesRelay:", 1);
    v20 = *(void **)(a1 + 112);
    if (v20)
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v20, "unsignedIntValue"));
    v21 = *(void **)(a1 + 120);
    if (v21)
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v21, "unsignedIntValue"));
    v22 = *(void **)(a1 + 128);
    if (v22)
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v22, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 209))
      objc_msgSend(v6, "setIsInitiator:", 1);
    if (*(_BYTE *)(a1 + 210))
      objc_msgSend(v6, "setIsVideoInterrupted:", 1);
    if (*(_BYTE *)(a1 + 211))
      objc_msgSend(v6, "setIsAudioInterrupted:", 1);
    if (*(_BYTE *)(a1 + 212))
      objc_msgSend(v6, "setIsCallUpgrade:", 1);
    v23 = *(void **)(a1 + 136);
    if (v23)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v23, "intValue"));
    v24 = *(void **)(a1 + 144);
    if (v24)
      objc_msgSend(v6, "setGksReturnCode:", objc_msgSend(v24, "intValue"));
    if (*(_BYTE *)(a1 + 213))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v119 = 134217984;
      v120 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "guid");
      v119 = 138412290;
      v120 = (const char *)v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "timestamp");
      v119 = 134217984;
      v120 = (const char *)v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v30 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v119) = 0;
      _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v119, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v6, "isVideo");
      v33 = CFSTR("YES");
      if (!v32)
        v33 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v33;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v34 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v6, "endedReason");
      v119 = 67109120;
      LODWORD(v120) = v35;
      _os_log_impl(&dword_2067C5000, v34, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v36 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v6, "genericError");
      v119 = 67109120;
      LODWORD(v120) = v37;
      _os_log_impl(&dword_2067C5000, v36, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v38 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v6, "viceroyError");
      v119 = 67109120;
      LODWORD(v120) = v39;
      _os_log_impl(&dword_2067C5000, v38, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v40 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v6, "gameKitError");
      v119 = 67109120;
      LODWORD(v120) = v41;
      _os_log_impl(&dword_2067C5000, v40, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v42 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v6, "messageDeliveryError");
      v119 = 67109120;
      LODWORD(v120) = v43;
      _os_log_impl(&dword_2067C5000, v42, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v44 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v6, "conferenceMiscError");
      v119 = 67109120;
      LODWORD(v120) = v45;
      _os_log_impl(&dword_2067C5000, v44, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v46 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v6, "registrationError");
      v119 = 67109120;
      LODWORD(v120) = v47;
      _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v48 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_msgSend(v6, "relayError");
      v119 = 67109120;
      LODWORD(v120) = v49;
      _os_log_impl(&dword_2067C5000, v48, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v50 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v6, "invitationServiceError");
      v119 = 67109120;
      LODWORD(v120) = v51;
      _os_log_impl(&dword_2067C5000, v50, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v52 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v53 = objc_msgSend(v6, "callDuration");
      v119 = 67109120;
      LODWORD(v120) = v53;
      _os_log_impl(&dword_2067C5000, v52, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v54 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(v6, "diagnosticPingMin");
      v119 = 67109120;
      LODWORD(v120) = v55;
      _os_log_impl(&dword_2067C5000, v54, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v56 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend(v6, "diagnosticPingAvg");
      v119 = 67109120;
      LODWORD(v120) = v57;
      _os_log_impl(&dword_2067C5000, v56, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v58 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend(v6, "diagnosticPingMax");
      v119 = 67109120;
      LODWORD(v120) = v59;
      _os_log_impl(&dword_2067C5000, v58, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v60 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v61 = objc_msgSend(v6, "diagnosticPingPacketLoss");
      v119 = 67109120;
      LODWORD(v120) = v61;
      _os_log_impl(&dword_2067C5000, v60, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v62 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_msgSend(v6, "isNetworkEnabled");
      v64 = CFSTR("YES");
      if (!v63)
        v64 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v64;
      _os_log_impl(&dword_2067C5000, v62, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v65 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v66 = objc_msgSend(v6, "isNetworkActive");
      v67 = CFSTR("YES");
      if (!v66)
        v67 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v67;
      _os_log_impl(&dword_2067C5000, v65, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v68 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_msgSend(v6, "isNetworkReachable");
      v70 = CFSTR("YES");
      if (!v69)
        v70 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v70;
      _os_log_impl(&dword_2067C5000, v68, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v71 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v72 = objc_msgSend(v6, "networkCheckResult");
      v119 = 67109120;
      LODWORD(v120) = v72;
      _os_log_impl(&dword_2067C5000, v71, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v73 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v74 = objc_msgSend(v6, "frontCameraCaptureDuration");
      v119 = 67109120;
      LODWORD(v120) = v74;
      _os_log_impl(&dword_2067C5000, v73, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v75 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v76 = objc_msgSend(v6, "backCameraCaptureDuration");
      v119 = 67109120;
      LODWORD(v120) = v76;
      _os_log_impl(&dword_2067C5000, v75, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v77 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v78 = objc_msgSend(v6, "dataRate");
      v119 = 67109120;
      LODWORD(v120) = v78;
      _os_log_impl(&dword_2067C5000, v77, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v79 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v80 = objc_msgSend(v6, "gksError");
      v119 = 67109120;
      LODWORD(v120) = v80;
      _os_log_impl(&dword_2067C5000, v79, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v81 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v82 = objc_msgSend(v6, "connectDuration");
      v119 = 67109120;
      LODWORD(v120) = v82;
      _os_log_impl(&dword_2067C5000, v81, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v83 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v84 = objc_msgSend(v6, "remoteNetworkConnection");
      v119 = 67109120;
      LODWORD(v120) = v84;
      _os_log_impl(&dword_2067C5000, v83, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v85 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_msgSend(v6, "localNetworkConnection");
      v119 = 67109120;
      LODWORD(v120) = v86;
      _os_log_impl(&dword_2067C5000, v85, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v87 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v88 = objc_msgSend(v6, "connectionType");
      v119 = 67109120;
      LODWORD(v120) = v88;
      _os_log_impl(&dword_2067C5000, v87, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v89 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v90 = objc_msgSend(v6, "usesRelay");
      v91 = CFSTR("YES");
      if (!v90)
        v91 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v91;
      _os_log_impl(&dword_2067C5000, v89, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v92 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v93 = objc_msgSend(v6, "currentNatType");
      v119 = 67109120;
      LODWORD(v120) = v93;
      _os_log_impl(&dword_2067C5000, v92, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v94 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v95 = objc_msgSend(v6, "remoteNatType");
      v119 = 67109120;
      LODWORD(v120) = v95;
      _os_log_impl(&dword_2067C5000, v94, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v96 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v97 = objc_msgSend(v6, "relayConnectDuration");
      v119 = 67109120;
      LODWORD(v120) = v97;
      _os_log_impl(&dword_2067C5000, v96, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v98 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v99 = objc_msgSend(v6, "isInitiator");
      v100 = CFSTR("YES");
      if (!v99)
        v100 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v100;
      _os_log_impl(&dword_2067C5000, v98, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v101 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v102 = objc_msgSend(v6, "isVideoInterrupted");
      v103 = CFSTR("YES");
      if (!v102)
        v103 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v103;
      _os_log_impl(&dword_2067C5000, v101, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v104 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v105 = objc_msgSend(v6, "isAudioInterrupted");
      v106 = CFSTR("YES");
      if (!v105)
        v106 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v106;
      _os_log_impl(&dword_2067C5000, v104, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v107 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v108 = objc_msgSend(v6, "isCallUpgrade");
      v109 = CFSTR("YES");
      if (!v108)
        v109 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v109;
      _os_log_impl(&dword_2067C5000, v107, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v119, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v110 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v111 = objc_msgSend(v6, "linkQuality");
      v119 = 67109120;
      LODWORD(v120) = v111;
      _os_log_impl(&dword_2067C5000, v110, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v112 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v113 = objc_msgSend(v6, "gksReturnCode");
      v119 = 67109120;
      LODWORD(v120) = v113;
      _os_log_impl(&dword_2067C5000, v112, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v119, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v114 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v115 = objc_msgSend(v6, "onLockScreen");
      v116 = CFSTR("YES");
      if (!v115)
        v116 = CFSTR("NO");
      v119 = 138412290;
      v120 = (const char *)v116;
      _os_log_impl(&dword_2067C5000, v114, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v119, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v117 = *(unsigned __int8 *)(a1 + 209);
    v118 = sub_2067C821C();
    if (sub_2067CE474(v117, (uint64_t)v118))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

id FTAWDLogCallEndedViceroy(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, unsigned int a10, unsigned int a11, unsigned int a12, void *a13, void *a14, void *a15, void *a16, void *a17, char a18, char a19, char a20,unsigned int a21,void *a22,void *a23,void *a24,void *a25,void *a26,unsigned int a27,unsigned int a28,unsigned int a29,char a30,void *a31,void *a32,void *a33,char a34,char a35,char a36,void *a37,void *a38,char a39)
{
  NSObject *v46;
  id v47;
  double v48;
  double v49;
  double v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  __CFString *v58;
  NSObject *v59;
  int v60;
  NSObject *v61;
  int v62;
  NSObject *v63;
  int v64;
  NSObject *v65;
  int v66;
  NSObject *v67;
  int v68;
  NSObject *v69;
  int v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  int v76;
  NSObject *v77;
  int v78;
  NSObject *v79;
  int v80;
  NSObject *v81;
  int v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  int v86;
  NSObject *v87;
  __CFString *v88;
  NSObject *v89;
  __CFString *v90;
  NSObject *v91;
  __CFString *v92;
  NSObject *v93;
  int v94;
  NSObject *v95;
  int v96;
  NSObject *v97;
  int v98;
  NSObject *v99;
  int v100;
  NSObject *v101;
  int v102;
  NSObject *v103;
  int v104;
  NSObject *v105;
  int v106;
  NSObject *v107;
  int v108;
  NSObject *v109;
  int v110;
  NSObject *v111;
  __CFString *v112;
  NSObject *v113;
  int v114;
  NSObject *v115;
  int v116;
  NSObject *v117;
  int v118;
  NSObject *v119;
  __CFString *v120;
  NSObject *v121;
  __CFString *v122;
  NSObject *v123;
  __CFString *v124;
  NSObject *v125;
  __CFString *v126;
  NSObject *v127;
  int v128;
  NSObject *v129;
  int v130;
  NSObject *v131;
  const __CFString *v132;
  int v134;
  const char *v135;
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v46 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v134 = 136446210;
    v135 = "id FTAWDLogCallEndedViceroy(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDCo"
           "nferenceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscEr"
           "ror, FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNu"
           "mber *, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *"
           ", NSNumber *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTA"
           "WDConnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)";
    _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v134, 0xCu);
  }
  v47 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v47, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
  if (a3)
    objc_msgSend(v47, "setIsVideo:", 1);
  if ((_DWORD)a4)
    objc_msgSend(v47, "setEndedReason:", a4);
  if ((_DWORD)a5)
    objc_msgSend(v47, "setGenericError:", a5);
  if ((_DWORD)a6)
    objc_msgSend(v47, "setViceroyError:", a6);
  if ((_DWORD)a7)
    objc_msgSend(v47, "setGameKitError:", a7);
  if ((_DWORD)a8)
    objc_msgSend(v47, "setMessageDeliveryError:", a8);
  if (a9)
    objc_msgSend(v47, "setConferenceMiscError:", a9);
  if (a10)
    objc_msgSend(v47, "setRegistrationError:", a10);
  if (a11)
    objc_msgSend(v47, "setRelayError:", a11);
  if (a12)
    objc_msgSend(v47, "setInvitationServiceError:", a12);
  if (a13)
  {
    objc_msgSend(a13, "doubleValue");
    objc_msgSend(v47, "setCallDuration:", (ceil(v48 / 10.0) * 10.0));
  }
  if (a14)
    objc_msgSend(v47, "setDiagnosticPingMin:", objc_msgSend(a14, "unsignedIntValue"));
  if (a15)
    objc_msgSend(v47, "setDiagnosticPingAvg:", objc_msgSend(a15, "unsignedIntValue"));
  if (a16)
    objc_msgSend(v47, "setDiagnosticPingMax:", objc_msgSend(a16, "unsignedIntValue"));
  if (a17)
    objc_msgSend(v47, "setDiagnosticPingPacketLoss:", objc_msgSend(a17, "unsignedIntValue"));
  if (a18)
    objc_msgSend(v47, "setIsNetworkEnabled:", 1);
  if (a19)
    objc_msgSend(v47, "setIsNetworkActive:", 1);
  if (a20)
    objc_msgSend(v47, "setIsNetworkReachable:", 1);
  if (a21)
    objc_msgSend(v47, "setNetworkCheckResult:", a21);
  if (a22)
  {
    objc_msgSend(a22, "doubleValue");
    objc_msgSend(v47, "setFrontCameraCaptureDuration:", (ceil(v49 / 10.0) * 10.0));
  }
  if (a23)
  {
    objc_msgSend(a23, "doubleValue");
    objc_msgSend(v47, "setBackCameraCaptureDuration:", (ceil(v50 / 10.0) * 10.0));
  }
  if (a24)
    objc_msgSend(v47, "setDataRate:", 7 * objc_msgSend(a24, "unsignedIntValue") + 931);
  if (a25)
    objc_msgSend(v47, "setGksError:", objc_msgSend(a25, "intValue"));
  if (a26)
    objc_msgSend(v47, "setConnectDuration:", objc_msgSend(a26, "unsignedIntValue"));
  if (a27)
    objc_msgSend(v47, "setRemoteNetworkConnection:", a27);
  if (a28)
    objc_msgSend(v47, "setLocalNetworkConnection:", a28);
  if (a29)
    objc_msgSend(v47, "setConnectionType:", a29);
  if (a30)
    objc_msgSend(v47, "setUsesRelay:", 1);
  if (a31)
    objc_msgSend(v47, "setCurrentNatType:", objc_msgSend(a31, "unsignedIntValue"));
  if (a32)
    objc_msgSend(v47, "setRemoteNatType:", objc_msgSend(a32, "unsignedIntValue"));
  if (a33)
    objc_msgSend(v47, "setRelayConnectDuration:", objc_msgSend(a33, "unsignedIntValue"));
  if (a2)
    objc_msgSend(v47, "setIsInitiator:", 1);
  if (a34)
    objc_msgSend(v47, "setIsVideoInterrupted:", 1);
  if (a35)
    objc_msgSend(v47, "setIsAudioInterrupted:", 1);
  if (a36)
    objc_msgSend(v47, "setIsCallUpgrade:", 1);
  if (a37)
    objc_msgSend(v47, "setLinkQuality:", objc_msgSend(a37, "intValue"));
  if (a38)
    objc_msgSend(v47, "setGksReturnCode:", objc_msgSend(a38, "intValue"));
  if (a39)
    objc_msgSend(v47, "setOnLockScreen:", 1);
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v51 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v134 = 134217984;
    v135 = (const char *)v47;
    _os_log_impl(&dword_2067C5000, v51, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v52 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v53 = objc_msgSend(v47, "guid");
    v134 = 138412290;
    v135 = (const char *)v53;
    _os_log_impl(&dword_2067C5000, v52, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v54 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v55 = objc_msgSend(v47, "timestamp");
    v134 = 134217984;
    v135 = (const char *)v55;
    _os_log_impl(&dword_2067C5000, v54, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v56 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v134) = 0;
    _os_log_impl(&dword_2067C5000, v56, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v134, 2u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v57 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v58 = objc_msgSend(v47, "isVideo") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v58;
    _os_log_impl(&dword_2067C5000, v57, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v59 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v60 = objc_msgSend(v47, "endedReason");
    v134 = 67109120;
    LODWORD(v135) = v60;
    _os_log_impl(&dword_2067C5000, v59, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v61 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend(v47, "genericError");
    v134 = 67109120;
    LODWORD(v135) = v62;
    _os_log_impl(&dword_2067C5000, v61, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v63 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v64 = objc_msgSend(v47, "viceroyError");
    v134 = 67109120;
    LODWORD(v135) = v64;
    _os_log_impl(&dword_2067C5000, v63, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v65 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v66 = objc_msgSend(v47, "gameKitError");
    v134 = 67109120;
    LODWORD(v135) = v66;
    _os_log_impl(&dword_2067C5000, v65, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v67 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v68 = objc_msgSend(v47, "messageDeliveryError");
    v134 = 67109120;
    LODWORD(v135) = v68;
    _os_log_impl(&dword_2067C5000, v67, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v69 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v70 = objc_msgSend(v47, "conferenceMiscError");
    v134 = 67109120;
    LODWORD(v135) = v70;
    _os_log_impl(&dword_2067C5000, v69, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v71 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v72 = objc_msgSend(v47, "registrationError");
    v134 = 67109120;
    LODWORD(v135) = v72;
    _os_log_impl(&dword_2067C5000, v71, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v73 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v74 = objc_msgSend(v47, "relayError");
    v134 = 67109120;
    LODWORD(v135) = v74;
    _os_log_impl(&dword_2067C5000, v73, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v75 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v76 = objc_msgSend(v47, "invitationServiceError");
    v134 = 67109120;
    LODWORD(v135) = v76;
    _os_log_impl(&dword_2067C5000, v75, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v77 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v78 = objc_msgSend(v47, "callDuration");
    v134 = 67109120;
    LODWORD(v135) = v78;
    _os_log_impl(&dword_2067C5000, v77, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v79 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v80 = objc_msgSend(v47, "diagnosticPingMin");
    v134 = 67109120;
    LODWORD(v135) = v80;
    _os_log_impl(&dword_2067C5000, v79, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v81 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v82 = objc_msgSend(v47, "diagnosticPingAvg");
    v134 = 67109120;
    LODWORD(v135) = v82;
    _os_log_impl(&dword_2067C5000, v81, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v83 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v84 = objc_msgSend(v47, "diagnosticPingMax");
    v134 = 67109120;
    LODWORD(v135) = v84;
    _os_log_impl(&dword_2067C5000, v83, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v85 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v86 = objc_msgSend(v47, "diagnosticPingPacketLoss");
    v134 = 67109120;
    LODWORD(v135) = v86;
    _os_log_impl(&dword_2067C5000, v85, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v87 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v88 = objc_msgSend(v47, "isNetworkEnabled") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v88;
    _os_log_impl(&dword_2067C5000, v87, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v89 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v90 = objc_msgSend(v47, "isNetworkActive") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v90;
    _os_log_impl(&dword_2067C5000, v89, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v91 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v92 = objc_msgSend(v47, "isNetworkReachable") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v92;
    _os_log_impl(&dword_2067C5000, v91, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v93 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v94 = objc_msgSend(v47, "networkCheckResult");
    v134 = 67109120;
    LODWORD(v135) = v94;
    _os_log_impl(&dword_2067C5000, v93, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v95 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v96 = objc_msgSend(v47, "frontCameraCaptureDuration");
    v134 = 67109120;
    LODWORD(v135) = v96;
    _os_log_impl(&dword_2067C5000, v95, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v97 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v98 = objc_msgSend(v47, "backCameraCaptureDuration");
    v134 = 67109120;
    LODWORD(v135) = v98;
    _os_log_impl(&dword_2067C5000, v97, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v99 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v100 = objc_msgSend(v47, "dataRate");
    v134 = 67109120;
    LODWORD(v135) = v100;
    _os_log_impl(&dword_2067C5000, v99, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v101 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v102 = objc_msgSend(v47, "gksError");
    v134 = 67109120;
    LODWORD(v135) = v102;
    _os_log_impl(&dword_2067C5000, v101, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v103 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v104 = objc_msgSend(v47, "connectDuration");
    v134 = 67109120;
    LODWORD(v135) = v104;
    _os_log_impl(&dword_2067C5000, v103, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v105 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v106 = objc_msgSend(v47, "remoteNetworkConnection");
    v134 = 67109120;
    LODWORD(v135) = v106;
    _os_log_impl(&dword_2067C5000, v105, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v107 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v108 = objc_msgSend(v47, "localNetworkConnection");
    v134 = 67109120;
    LODWORD(v135) = v108;
    _os_log_impl(&dword_2067C5000, v107, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v109 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v110 = objc_msgSend(v47, "connectionType");
    v134 = 67109120;
    LODWORD(v135) = v110;
    _os_log_impl(&dword_2067C5000, v109, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v111 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v112 = objc_msgSend(v47, "usesRelay") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v112;
    _os_log_impl(&dword_2067C5000, v111, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v113 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v114 = objc_msgSend(v47, "currentNatType");
    v134 = 67109120;
    LODWORD(v135) = v114;
    _os_log_impl(&dword_2067C5000, v113, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v115 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v116 = objc_msgSend(v47, "remoteNatType");
    v134 = 67109120;
    LODWORD(v135) = v116;
    _os_log_impl(&dword_2067C5000, v115, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v117 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v118 = objc_msgSend(v47, "relayConnectDuration");
    v134 = 67109120;
    LODWORD(v135) = v118;
    _os_log_impl(&dword_2067C5000, v117, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v119 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v120 = objc_msgSend(v47, "isInitiator") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v120;
    _os_log_impl(&dword_2067C5000, v119, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v121 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v122 = objc_msgSend(v47, "isVideoInterrupted") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v122;
    _os_log_impl(&dword_2067C5000, v121, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v123 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v124 = objc_msgSend(v47, "isAudioInterrupted") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v124;
    _os_log_impl(&dword_2067C5000, v123, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v125 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v126 = objc_msgSend(v47, "isCallUpgrade") ? CFSTR("YES") : CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v126;
    _os_log_impl(&dword_2067C5000, v125, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v134, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v127 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v128 = objc_msgSend(v47, "linkQuality");
    v134 = 67109120;
    LODWORD(v135) = v128;
    _os_log_impl(&dword_2067C5000, v127, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v129 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v130 = objc_msgSend(v47, "gksReturnCode");
    v134 = 67109120;
    LODWORD(v135) = v130;
    _os_log_impl(&dword_2067C5000, v129, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v134, 8u);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v131 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend(v47, "onLockScreen"))
      v132 = CFSTR("YES");
    else
      v132 = CFSTR("NO");
    v134 = 138412290;
    v135 = (const char *)v132;
    _os_log_impl(&dword_2067C5000, v131, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v134, 0xCu);
  }
  return v47;
}

void FTAWDLogCallInterruptionBegan(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7)
{
  _QWORD v7[5];
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2067D38A4;
  v7[3] = &unk_24BFDED28;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v7[4] = a6;
  v11 = a7;
  v12 = a2;
  sub_2067C6C34(v7);
}

void sub_2067D38A4(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  int v24;
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136446210;
    v27 = "void FTAWDLogCallInterruptionBegan(NSString *, BOOL, BOOL, BOOL, BOOL, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312516);
  v4 = (unint64_t)sub_2067C72A4(5312532);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_BYTE *)(a1 + 41))
      objc_msgSend(v6, "setIsVideoInterrupted:", 1);
    if (*(_BYTE *)(a1 + 42))
      objc_msgSend(v6, "setIsAudioInterrupted:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v7, "intValue"));
    if (*(_BYTE *)(a1 + 43))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v26 = 138412290;
      v27 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "             GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v26 = 134217984;
      v27 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "        Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "           isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "isVideoInterrupted") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "isVideoInterrupted: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "isAudioInterrupted") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "isAudioInterrupted: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "linkQuality");
      v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "       linkQuality: %d", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v24 = *(unsigned __int8 *)(a1 + 44);
    v25 = sub_2067C821C();
    if (sub_2067CE474(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallInterruptionEnded(uint64_t a1, char a2, char a3, uint64_t a4, char a5, char a6, uint64_t a7, char a8)
{
  _QWORD block[6];
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D3F40;
  block[3] = &unk_24BFDED50;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  block[4] = a4;
  block[5] = a7;
  v12 = a8;
  v13 = a2;
  sub_2067C6C34(block);
}

void sub_2067D3F40(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  const __CFString *v26;
  int v27;
  id v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136446210;
    v30 = "void FTAWDLogCallInterruptionEnded(NSString *, BOOL, BOOL, NSNumber *, BOOL, BOOL, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v29, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312517);
  v4 = (unint64_t)sub_2067C72A4(5312533);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v6, "setIsVideo:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setInterruptionDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(v6, "setIsVideoResumed:", 1);
    if (*(_BYTE *)(a1 + 50))
      objc_msgSend(v6, "setIsAudioResumed:", 1);
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v8, "intValue"));
    if (*(_BYTE *)(a1 + 51))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 134217984;
      v30 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "       Metric Object: %p", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "guid");
      v29 = 138412290;
      v30 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "                GUID: %@", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "timestamp");
      v29 = 134217984;
      v30 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "           Timestamp: %llu", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "                         ", (uint8_t *)&v29, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v29 = 138412290;
      v30 = (const char *)v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "             isVideo: %@", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "interruptionDuration");
      v29 = 67109120;
      LODWORD(v30) = v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "interruptionDuration: %u", (uint8_t *)&v29, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "isVideoResumed") ? CFSTR("YES") : CFSTR("NO");
      v29 = 138412290;
      v30 = (const char *)v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "      isVideoResumed: %@", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "isAudioResumed") ? CFSTR("YES") : CFSTR("NO");
      v29 = 138412290;
      v30 = (const char *)v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "      isAudioResumed: %@", (uint8_t *)&v29, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "linkQuality");
      v29 = 67109120;
      LODWORD(v30) = v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "         linkQuality: %d", (uint8_t *)&v29, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v29 = 138412290;
      v30 = (const char *)v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "        onLockScreen: %@", (uint8_t *)&v29, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v27 = *(unsigned __int8 *)(a1 + 52);
    v28 = sub_2067C821C();
    if (sub_2067CE474(v27, (uint64_t)v28))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallInvitationSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  _QWORD v6[5];
  int v7;
  char v8;
  char v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2067D4670;
  v6[3] = &unk_24BFDED78;
  v8 = a3;
  v7 = a4;
  v6[4] = a5;
  v9 = a6;
  v10 = a2;
  sub_2067C6C34(v6);
}

void sub_2067D4670(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v25 = "void FTAWDLogCallInvitationSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312518);
  v4 = (unint64_t)sub_2067C72A4(5312534);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 45))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "errorCode");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "sendDuration");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v22 = *(unsigned __int8 *)(a1 + 46);
    v23 = sub_2067C821C();
    if (sub_2067CE474(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallInvitationReceived(uint64_t a1, char a2, char a3, char a4)
{
  _QWORD block[4];
  char v5;
  char v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D4C78;
  block[3] = &unk_24BFDED98;
  v5 = a3;
  v6 = a4;
  v7 = a2;
  sub_2067C6C34(block);
}

void sub_2067D4C78(_BYTE *a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  id v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446210;
    v19 = "void FTAWDLogCallInvitationReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312519);
  v4 = (unint64_t)sub_2067C72A4(5312535);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[32])
      objc_msgSend(v6, "setIsVideo:", 1);
    if (a1[33])
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v18 = 138412290;
      v19 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v18 = 134217984;
      v19 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v16 = a1[34];
    v17 = sub_2067C821C();
    if (sub_2067CE474(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallCancelSent(uint64_t a1, char a2, char a3, int a4, int a5, uint64_t a6, char a7)
{
  _QWORD block[5];
  int v8;
  int v9;
  char v10;
  char v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D510C;
  block[3] = &unk_24BFDEDC0;
  v10 = a3;
  v8 = a4;
  v9 = a5;
  block[4] = a6;
  v11 = a7;
  v12 = a2;
  sub_2067C6C34(block);
}

void sub_2067D510C(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  int v24;
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136446210;
    v27 = "void FTAWDLogCallCancelSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, FTAWDConferenceMessageRe"
          "ason, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312520);
  v4 = (unint64_t)sub_2067C72A4(5312536);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    if (*(_DWORD *)(a1 + 44))
      objc_msgSend(v6, "setCancelCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v26 = 138412290;
      v27 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "         GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v26 = 134217984;
      v27 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "    Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "errorCode");
      v26 = 67109120;
      LODWORD(v27) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "cancelCode");
      v26 = 67109120;
      LODWORD(v27) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "    cancelCode: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "sendDuration");
      v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v24 = *(unsigned __int8 *)(a1 + 50);
    v25 = sub_2067C821C();
    if (sub_2067CE474(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallAcceptSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  _QWORD v6[5];
  int v7;
  char v8;
  char v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2067D579C;
  v6[3] = &unk_24BFDED78;
  v8 = a3;
  v7 = a4;
  v6[4] = a5;
  v9 = a6;
  v10 = a2;
  sub_2067C6C34(v6);
}

void sub_2067D579C(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v25 = "void FTAWDLogCallAcceptSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312527);
  v4 = (unint64_t)sub_2067C72A4(5312537);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 45))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "errorCode");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "sendDuration");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v22 = *(unsigned __int8 *)(a1 + 46);
    v23 = sub_2067C821C();
    if (sub_2067CE474(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallAcceptReceived(uint64_t a1, char a2, char a3, char a4)
{
  _QWORD block[4];
  char v5;
  char v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D5DA4;
  block[3] = &unk_24BFDED98;
  v5 = a4;
  v6 = a3;
  v7 = a2;
  sub_2067C6C34(block);
}

void sub_2067D5DA4(_BYTE *a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  id v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446210;
    v19 = "void FTAWDLogCallAcceptReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312521);
  v4 = (unint64_t)sub_2067C72A4(5312538);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[32])
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v18 = 138412290;
      v19 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v18 = 134217984;
      v19 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[33] ? CFSTR("YES") : CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (a1[32])
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v16 = a1[34];
    v17 = sub_2067C821C();
    if (sub_2067CE474(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallDeclineSent(uint64_t a1, char a2, char a3, int a4, int a5, uint64_t a6, char a7)
{
  _QWORD block[5];
  int v8;
  int v9;
  char v10;
  char v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D621C;
  block[3] = &unk_24BFDEDC0;
  v10 = a3;
  v8 = a4;
  v9 = a5;
  block[4] = a6;
  v11 = a7;
  v12 = a2;
  sub_2067C6C34(block);
}

void sub_2067D621C(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  int v24;
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136446210;
    v27 = "void FTAWDLogCallDeclineSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, FTAWDConferenceMessageR"
          "eason, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312522);
  v4 = (unint64_t)sub_2067C72A4(5312539);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    if (*(_DWORD *)(a1 + 44))
      objc_msgSend(v6, "setDeclineCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v26 = 138412290;
      v27 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "         GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v26 = 134217984;
      v27 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "    Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "errorCode");
      v26 = 67109120;
      LODWORD(v27) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "declineCode");
      v26 = 67109120;
      LODWORD(v27) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "   declineCode: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "sendDuration");
      v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v26, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v26 = 138412290;
      v27 = (const char *)v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v24 = *(unsigned __int8 *)(a1 + 50);
    v25 = sub_2067C821C();
    if (sub_2067CE474(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallRelayInitiateSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  _QWORD v6[5];
  int v7;
  char v8;
  char v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2067D68B0;
  v6[3] = &unk_24BFDED78;
  v8 = a3;
  v7 = a4;
  v6[4] = a5;
  v9 = a6;
  v10 = a2;
  sub_2067C6C34(v6);
}

void sub_2067D68B0(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v25 = "void FTAWDLogCallRelayInitiateSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312523);
  v4 = (unint64_t)sub_2067C72A4(5312540);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 45))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "errorCode");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "sendDuration");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v22 = *(unsigned __int8 *)(a1 + 46);
    v23 = sub_2067C821C();
    if (sub_2067CE474(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallRelayInitiateReceived(uint64_t a1, char a2, char a3, char a4)
{
  _QWORD block[4];
  char v5;
  char v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D6EB8;
  block[3] = &unk_24BFDED98;
  v5 = a3;
  v6 = a4;
  v7 = a2;
  sub_2067C6C34(block);
}

void sub_2067D6EB8(_BYTE *a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  id v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446210;
    v19 = "void FTAWDLogCallRelayInitiateReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312524);
  v4 = (unint64_t)sub_2067C72A4(5312541);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[32])
      objc_msgSend(v6, "setIsVideo:", 1);
    if (a1[33])
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v18 = 138412290;
      v19 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v18 = 134217984;
      v19 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v16 = a1[34];
    v17 = sub_2067C821C();
    if (sub_2067CE474(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallRelayUpdateSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  _QWORD v6[5];
  int v7;
  char v8;
  char v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2067D7350;
  v6[3] = &unk_24BFDED78;
  v8 = a3;
  v7 = a4;
  v6[4] = a5;
  v9 = a6;
  v10 = a2;
  sub_2067C6C34(v6);
}

void sub_2067D7350(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  id v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446210;
    v25 = "void FTAWDLogCallRelayUpdateSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v24, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312525);
  v4 = (unint64_t)sub_2067C72A4(5312542);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (*(_BYTE *)(a1 + 44))
      objc_msgSend(v6, "setIsVideo:", 1);
    if (*(_DWORD *)(a1 + 40))
      objc_msgSend(v6, "setErrorCode:");
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    if (*(_BYTE *)(a1 + 45))
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "guid");
      v24 = 138412290;
      v25 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "timestamp");
      v24 = 134217984;
      v25 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v24, 2u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "errorCode");
      v24 = 67109120;
      LODWORD(v25) = v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v24, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "sendDuration");
      v24 = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v24, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v24, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v24 = 138412290;
      v25 = (const char *)v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v24, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v22 = *(unsigned __int8 *)(a1 + 46);
    v23 = sub_2067C821C();
    if (sub_2067CE474(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogCallRelayUpdatedReceived(uint64_t a1, char a2, char a3, char a4)
{
  _QWORD block[4];
  char v5;
  char v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D7948;
  block[3] = &unk_24BFDED98;
  v5 = a3;
  v6 = a4;
  v7 = a2;
  sub_2067C6C34(block);
}

void sub_2067D7948(_BYTE *a1)
{
  NSObject *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  id v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446210;
    v19 = "void FTAWDLogCallRelayUpdatedReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  v3 = (unint64_t)sub_2067C72A4(5312526);
  v4 = (unint64_t)sub_2067C72A4(5312543);
  if (v3 | v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_253E6C578, "getAWDTimestamp"));
    if (a1[32])
      objc_msgSend(v6, "setIsVideo:", 1);
    if (a1[33])
      objc_msgSend(v6, "setOnLockScreen:", 1);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "guid");
      v18 = 138412290;
      v19 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v6, "timestamp");
      v18 = 134217984;
      v19 = (const char *)v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "isVideo") ? CFSTR("YES") : CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "onLockScreen"))
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v18 = 138412290;
      v19 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_2067C7590(v6, (void *)v3);
    v16 = a1[34];
    v17 = sub_2067C821C();
    if (sub_2067CE474(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_2067C7590(v6, v5);
    }

  }
}

void FTAWDLogRegistrationPhoneNumberValidationFinished(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _QWORD block[6];
  int v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D7DD4;
  block[3] = &unk_24BFDEDE8;
  v5 = a2;
  block[4] = a3;
  block[5] = a4;
  sub_2067C6C34(block);
}

void sub_2067D7DD4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136446210;
    v18 = "void FTAWDLogRegistrationPhoneNumberValidationFinished(NSString *, FTAWDIDSRegistrationError, NSNumber *, NSNu"
          "mber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v17, 0xCu);
  }
  v3 = sub_2067C72A4(5316608);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setRegistrationError:", *(unsigned int *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v5, "setValidationDuration:", objc_msgSend(v6, "unsignedIntValue"));
    v7 = *(void **)(a1 + 40);
    if (v7)
      objc_msgSend(v5, "setNumberOfSMSSent:", objc_msgSend(v7, "unsignedIntValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v17, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v5, "guid");
      v17 = 138412290;
      v18 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v17, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v5, "registrationError");
      v17 = 67109120;
      LODWORD(v18) = v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, " registrationError: %d", (uint8_t *)&v17, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v5, "validationDuration");
      v17 = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "validationDuration: %u", (uint8_t *)&v17, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v15 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v5, "numberOfSMSSent");
      v17 = 67109120;
      LODWORD(v18) = v16;
      _os_log_impl(&dword_2067C5000, v15, OS_LOG_TYPE_DEFAULT, "   numberOfSMSSent: %u", (uint8_t *)&v17, 8u);
    }
    sub_2067C7590(v5, v4);

  }
}

void FTAWDLogRegistrationPhoneNumberReceivedSMS(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D81B4;
  block[3] = &unk_24BFDEBC8;
  block[4] = a2;
  sub_2067C6C34(block);
}

void sub_2067D81B4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446210;
    v13 = "void FTAWDLogRegistrationPhoneNumberReceivedSMS(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  v3 = sub_2067C72A4(5316609);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v5, "setSmsRoundTripDuration:", objc_msgSend(v6, "unsignedIntValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, "       Metric Object: %p", (uint8_t *)&v12, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v5, "guid");
      v12 = 138412290;
      v13 = (const char *)v9;
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "                GUID: %@", (uint8_t *)&v12, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v5, "smsRoundTripDuration");
      v12 = 67109120;
      LODWORD(v13) = v11;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "smsRoundTripDuration: %u", (uint8_t *)&v12, 8u);
    }
    sub_2067C7590(v5, v4);

  }
}

void FTAWDLogRegistrationProfileLinkHandles(uint64_t a1, char a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD v9[7];
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2067D84A8;
  v9[3] = &unk_24BFDEE38;
  v14 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v9[4] = a7;
  v9[5] = a8;
  v9[6] = a9;
  sub_2067C6C34(v9);
}

void sub_2067D84A8(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136446210;
    v31 = "void FTAWDLogRegistrationProfileLinkHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessa"
          "geResultCode, FTAWDIDSRegistrationError, FTAWDIDSEmailVettingStatus, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  v3 = sub_2067C72A4(5316612);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    objc_msgSend(v6, "setVettingStatus:", *(unsigned int *)(a1 + 68));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134217984;
      v31 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v30 = 138412290;
      v31 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v30 = 138412290;
      v31 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v30 = 67109120;
      LODWORD(v31) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "vettingStatus");
      v30 = 67109120;
      LODWORD(v31) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "     vettingStatus: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "genericError");
      v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "uRLError");
      v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "pOSIXError");
      v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v30, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogRegistrationProfileUnLinkHandles(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D8B34;
  block[3] = &unk_24BFDEE10;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_2067C6C34(block);
}

void sub_2067D8B34(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogRegistrationProfileUnLinkHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMes"
          "sageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = sub_2067C72A4(5316612);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "genericError");
      v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "uRLError");
      v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "pOSIXError");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogRegistrationProfileValidateHandle(uint64_t a1, char a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD v9[7];
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2067D9148;
  v9[3] = &unk_24BFDEE38;
  v14 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v9[4] = a7;
  v9[5] = a8;
  v9[6] = a9;
  sub_2067C6C34(v9);
}

void sub_2067D9148(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136446210;
    v31 = "void FTAWDLogRegistrationProfileValidateHandle(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMe"
          "ssageResultCode, FTAWDIDSRegistrationError, FTAWDIDSEmailVettingStatus, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  v3 = sub_2067C72A4(5316613);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    objc_msgSend(v6, "setVettingStatus:", *(unsigned int *)(a1 + 68));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134217984;
      v31 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v30 = 138412290;
      v31 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v30 = 138412290;
      v31 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v30, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v30 = 67109120;
      LODWORD(v31) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "vettingStatus");
      v30 = 67109120;
      LODWORD(v31) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "     vettingStatus: %u", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "genericError");
      v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "uRLError");
      v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v30, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "pOSIXError");
      v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v30, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogRegistrationProfileValidateInvitationContext(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D97D4;
  block[3] = &unk_24BFDEE10;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_2067C6C34(block);
}

void sub_2067D97D4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogRegistrationProfileValidateInvitationContext(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDC"
          "onferenceMessageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = sub_2067C72A4(5316614);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "genericError");
      v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "uRLError");
      v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "pOSIXError");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogRegistrationAuthenticate(uint64_t a1, char a2, int a3, int a4, int a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD block[7];
  int v11;
  int v12;
  int v13;
  char v14;
  char v15;
  char v16;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2067D9DF0;
  block[3] = &unk_24BFDEE60;
  v14 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v15 = a6;
  v16 = a7;
  block[4] = a8;
  block[5] = a9;
  block[6] = a10;
  sub_2067C6C34(block);
}

void sub_2067D9DF0(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 136446210;
    v33 = "void FTAWDLogRegistrationAuthenticate(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResu"
          "ltCode, FTAWDIDSRegistrationError, BOOL, BOOL, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v32, 0xCu);
  }
  v3 = sub_2067C72A4(5316615);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    if (*(_BYTE *)(a1 + 69))
      objc_msgSend(v6, "setIsPhoneUser:", 1);
    if (*(_BYTE *)(a1 + 70))
      objc_msgSend(v6, "setIsDSUser:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 134217984;
      v33 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v32 = 138412290;
      v33 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v32 = 138412290;
      v33 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v32, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v32 = 67109120;
      LODWORD(v33) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v32 = 67109120;
      LODWORD(v33) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v32 = 67109120;
      LODWORD(v33) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "isPhoneUser");
      v32 = 67109120;
      LODWORD(v33) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "       isPhoneUser: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "isDSUser");
      v32 = 67109120;
      LODWORD(v33) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          isDSUser: %u", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "genericError");
      v32 = 67109120;
      LODWORD(v33) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v28 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v6, "uRLError");
      v32 = 67109120;
      LODWORD(v33) = v29;
      _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v32, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v30 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v6, "pOSIXError");
      v32 = 67109120;
      LODWORD(v33) = v31;
      _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v32, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void FTAWDLogRegistrationRegister(uint64_t a1, char a2, int a3, int a4, int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD v10[8];
  int v11;
  int v12;
  int v13;
  char v14;
  char v15;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2067DA510;
  v10[3] = &unk_24BFDEE88;
  v14 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v15 = a6;
  v10[4] = a7;
  v10[5] = a8;
  v10[6] = a9;
  v10[7] = a10;
  sub_2067C6C34(v10);
}

void sub_2067DA510(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  int v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136446210;
    v34 = "void FTAWDLogRegistrationRegister(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResultCo"
          "de, FTAWDIDSRegistrationError, BOOL, NSNumber *, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v33, 0xCu);
  }
  v3 = sub_2067C72A4(5316616);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 76))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 64));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 68));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 72));
    if (*(_BYTE *)(a1 + 77))
      objc_msgSend(v6, "setHeartbeatRegister:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setHeartbeatDelay:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v9, "intValue"));
    v10 = *(void **)(a1 + 56);
    if (v10)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v10, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 134217984;
      v34 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "      Metric Object: %p", (uint8_t *)&v33, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v12 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "guid");
      v33 = 138412290;
      v34 = (const char *)v13;
      _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "               GUID: %@", (uint8_t *)&v33, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v14 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v6, "success");
      v16 = CFSTR("YES");
      if (!v15)
        v16 = CFSTR("NO");
      v33 = 138412290;
      v34 = (const char *)v16;
      _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "            success: %@", (uint8_t *)&v33, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v17 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "connectionType");
      v33 = 67109120;
      LODWORD(v34) = v18;
      _os_log_impl(&dword_2067C5000, v17, OS_LOG_TYPE_DEFAULT, "     connectionType: %u", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v19 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v6, "resultCode");
      v33 = 67109120;
      LODWORD(v34) = v20;
      _os_log_impl(&dword_2067C5000, v19, OS_LOG_TYPE_DEFAULT, "         resultCode: %u", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v21 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "registrationError");
      v33 = 67109120;
      LODWORD(v34) = v22;
      _os_log_impl(&dword_2067C5000, v21, OS_LOG_TYPE_DEFAULT, "  registrationError: %u", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v23 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "heartbeatRegister");
      v33 = 67109120;
      LODWORD(v34) = v24;
      _os_log_impl(&dword_2067C5000, v23, OS_LOG_TYPE_DEFAULT, "isHeartbeatRegister: %u", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v25 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v6, "heartbeatDelay");
      v33 = 67109120;
      LODWORD(v34) = v26;
      _os_log_impl(&dword_2067C5000, v25, OS_LOG_TYPE_DEFAULT, "     heartbeatDelay: %u", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v27 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v6, "genericError");
      v33 = 67109120;
      LODWORD(v34) = v28;
      _os_log_impl(&dword_2067C5000, v27, OS_LOG_TYPE_DEFAULT, "       genericError: %d", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v29 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v6, "uRLError");
      v33 = 67109120;
      LODWORD(v34) = v30;
      _os_log_impl(&dword_2067C5000, v29, OS_LOG_TYPE_DEFAULT, "           URLError: %d", (uint8_t *)&v33, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v31 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v6, "pOSIXError");
      v33 = 67109120;
      LODWORD(v34) = v32;
      _os_log_impl(&dword_2067C5000, v31, OS_LOG_TYPE_DEFAULT, "         POSIXError: %d", (uint8_t *)&v33, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void sub_2067DABCC(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136446210;
    v29 = "void FTAWDLogRegistrationGetDependentRegistrations(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferen"
          "ceMessageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  v3 = sub_2067C72A4(5316618);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(_BYTE *)(a1 + 68))
      objc_msgSend(v5, "setSuccess:", 1);
    objc_msgSend(v6, "setConnectionType:", *(unsigned int *)(a1 + 56));
    objc_msgSend(v6, "setResultCode:", *(unsigned int *)(a1 + 60));
    objc_msgSend(v6, "setRegistrationError:", *(unsigned int *)(a1 + 64));
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    v8 = *(void **)(a1 + 40);
    if (v8)
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v10 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "guid");
      v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v13 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "success");
      v15 = CFSTR("YES");
      if (!v14)
        v15 = CFSTR("NO");
      v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_2067C5000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v16 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "connectionType");
      v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v18 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "resultCode");
      v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v20 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v6, "registrationError");
      v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v22 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v6, "genericError");
      v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v24 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v6, "uRLError");
      v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v26 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v6, "pOSIXError");
      v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_2067C7590(v6, v4);

  }
}

void sub_2067DB17C(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446210;
    v14 = "void FTAWDLogRegistrationRenewCredentialsCompleted(NSInteger, NSErrorDomain, NSInteger)_block_invoke";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v13, 0xCu);
  }
  v3 = sub_2067C72A4(5316622);
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setRenewResult:", *(unsigned int *)(a1 + 40));
    objc_msgSend(v5, "setErrorDomain:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setErrorCode:", *(_QWORD *)(a1 + 48));
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v6 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = (const char *)v5;
      _os_log_impl(&dword_2067C5000, v6, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v13, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v7 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "renewResult");
      v13 = 67109120;
      LODWORD(v14) = v8;
      _os_log_impl(&dword_2067C5000, v7, OS_LOG_TYPE_DEFAULT, "       renewResult: %u", (uint8_t *)&v13, 8u);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v9 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v5, "errorDomain");
      v13 = 138412290;
      v14 = (const char *)v10;
      _os_log_impl(&dword_2067C5000, v9, OS_LOG_TYPE_DEFAULT, "       errorDomain: %@", (uint8_t *)&v13, 0xCu);
      if (qword_253E6C568 != -1)
        dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    }
    v11 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v5, "errorCode");
      v13 = 134217984;
      v14 = (const char *)v12;
      _os_log_impl(&dword_2067C5000, v11, OS_LOG_TYPE_DEFAULT, "         errorCode: %lld", (uint8_t *)&v13, 0xCu);
    }
    sub_2067C7590(v5, v4);

  }
}

BOOL sub_2067DB484(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const __CFString *v9;
  const char *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446210;
    v14 = "BOOL __IsMetricEnabled(FTAWDMetricType)";
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v13, 0xCu);
  }
  if (!qword_253E6C578)
    sub_2067C8044();
  v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  v4 = (void *)objc_msgSend((id)qword_253E6C578, "newMetricContainerWithIdentifier:", a1);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v6 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", v3);
      v13 = 134217984;
      v14 = v7;
      _os_log_impl(&dword_2067C5000, v6, OS_LOG_TYPE_DEFAULT, "It took %f seconds to get a metric container", (uint8_t *)&v13, 0xCu);
    }

    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v9 = sub_2067C6890(a1);
      v13 = 138412290;
      v14 = (const char *)v9;
      v10 = "%@ is enabled on this config";
LABEL_20:
      _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {

    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
    v8 = qword_253E6C560;
    if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_2067C6890(a1);
      v13 = 138412290;
      v14 = (const char *)v11;
      v10 = "Configuration doesn't allow for %@ to be submitted to AWD";
      goto LABEL_20;
    }
  }
  return v4 != 0;
}

void sub_2067DB710()
{
  NSObject *v0;
  __CFString *v1;
  NSObject *v2;
  __CFString *v3;
  NSObject *v4;
  __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  __CFString *v31;
  NSObject *v32;
  __CFString *v33;
  NSObject *v34;
  __CFString *v35;
  NSObject *v36;
  __CFString *v37;
  NSObject *v38;
  __CFString *v39;
  NSObject *v40;
  __CFString *v41;
  NSObject *v42;
  __CFString *v43;
  NSObject *v44;
  __CFString *v45;
  NSObject *v46;
  __CFString *v47;
  NSObject *v48;
  __CFString *v49;
  NSObject *v50;
  __CFString *v51;
  NSObject *v52;
  __CFString *v53;
  NSObject *v54;
  __CFString *v55;
  NSObject *v56;
  __CFString *v57;
  NSObject *v58;
  __CFString *v59;
  NSObject *v60;
  __CFString *v61;
  NSObject *v62;
  __CFString *v63;
  NSObject *v64;
  __CFString *v65;
  NSObject *v66;
  __CFString *v67;
  NSObject *v68;
  __CFString *v69;
  NSObject *v70;
  __CFString *v71;
  NSObject *v72;
  __CFString *v73;
  NSObject *v74;
  __CFString *v75;
  NSObject *v76;
  __CFString *v77;
  NSObject *v78;
  __CFString *v79;
  NSObject *v80;
  __CFString *v81;
  NSObject *v82;
  __CFString *v83;
  NSObject *v84;
  __CFString *v85;
  NSObject *v86;
  __CFString *v87;
  NSObject *v88;
  __CFString *v89;
  NSObject *v90;
  __CFString *v91;
  NSObject *v92;
  __CFString *v93;
  NSObject *v94;
  __CFString *v95;
  NSObject *v96;
  __CFString *v97;
  NSObject *v98;
  __CFString *v99;
  NSObject *v100;
  __CFString *v101;
  NSObject *v102;
  const __CFString *v103;
  int v104;
  __CFString *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  if (qword_253E6C568 != -1)
    dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  v0 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v1 = sub_2067DB484(5308433) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v1;
    _os_log_impl(&dword_2067C5000, v0, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v2 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v3 = sub_2067DB484(5308449) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v3;
    _os_log_impl(&dword_2067C5000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v4 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v5 = sub_2067DB484(5308434) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v5;
    _os_log_impl(&dword_2067C5000, v4, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v6 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_2067DB484(5308450) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v7;
    _os_log_impl(&dword_2067C5000, v6, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v8 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_2067DB484(5308435) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v9;
    _os_log_impl(&dword_2067C5000, v8, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v10 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_2067DB484(5308451) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v11;
    _os_log_impl(&dword_2067C5000, v10, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v12 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v13 = sub_2067DB484(5308419) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v13;
    _os_log_impl(&dword_2067C5000, v12, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v14 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v15 = sub_2067DB484(5308452) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v15;
    _os_log_impl(&dword_2067C5000, v14, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v16 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v17 = sub_2067DB484(5308417) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v17;
    _os_log_impl(&dword_2067C5000, v16, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentDownload is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v18 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v19 = sub_2067DB484(5308453) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v19;
    _os_log_impl(&dword_2067C5000, v18, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentDownloadHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v20 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v21 = sub_2067DB484(5308418) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v21;
    _os_log_impl(&dword_2067C5000, v20, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentUpload is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v22 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v23 = sub_2067DB484(5308454) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v23;
    _os_log_impl(&dword_2067C5000, v22, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentUploadHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v24 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v25 = sub_2067DB484(5308420) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v25;
    _os_log_impl(&dword_2067C5000, v24, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDelivered is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v26 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v27 = sub_2067DB484(5308455) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v27;
    _os_log_impl(&dword_2067C5000, v26, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeliveredHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v28 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v29 = sub_2067DB484(5308440) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v29;
    _os_log_impl(&dword_2067C5000, v28, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDowngrade is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v30 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v31 = sub_2067DB484(5308456) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v31;
    _os_log_impl(&dword_2067C5000, v30, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDowngradeHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v32 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v33 = sub_2067DB484(5308441) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v33;
    _os_log_impl(&dword_2067C5000, v32, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageQueryFinished is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v34 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v35 = sub_2067DB484(5308457) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v35;
    _os_log_impl(&dword_2067C5000, v34, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageQueryFinishedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v36 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v37 = sub_2067DB484(5308442) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v37;
    _os_log_impl(&dword_2067C5000, v36, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeduplicated is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v38 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v39 = sub_2067DB484(5308458) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v39;
    _os_log_impl(&dword_2067C5000, v38, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeduplicatedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v40 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v41 = sub_2067DB484(5312513) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v41;
    _os_log_impl(&dword_2067C5000, v40, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallStarted is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v42 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v43 = sub_2067DB484(5312529) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v43;
    _os_log_impl(&dword_2067C5000, v42, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallStartedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v44 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v45 = sub_2067DB484(5312514) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v45;
    _os_log_impl(&dword_2067C5000, v44, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallConnected is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v46 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v47 = sub_2067DB484(5312530) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v47;
    _os_log_impl(&dword_2067C5000, v46, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallConnectedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v48 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v49 = sub_2067DB484(5312515) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v49;
    _os_log_impl(&dword_2067C5000, v48, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallEnded is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v50 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v51 = sub_2067DB484(5312531) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v51;
    _os_log_impl(&dword_2067C5000, v50, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallEndedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v52 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v53 = sub_2067DB484(5312544) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v53;
    _os_log_impl(&dword_2067C5000, v52, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallFailed is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v54 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v55 = sub_2067DB484(5312560) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v55;
    _os_log_impl(&dword_2067C5000, v54, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallFailedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v56 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v57 = sub_2067DB484(5312516) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v57;
    _os_log_impl(&dword_2067C5000, v56, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionBegan is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v58 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v59 = sub_2067DB484(5312532) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v59;
    _os_log_impl(&dword_2067C5000, v58, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionBeganHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v60 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v61 = sub_2067DB484(5312517) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v61;
    _os_log_impl(&dword_2067C5000, v60, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionEnded is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v62 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v63 = sub_2067DB484(5312533) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v63;
    _os_log_impl(&dword_2067C5000, v62, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionEndedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v64 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v65 = sub_2067DB484(5312518) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v65;
    _os_log_impl(&dword_2067C5000, v64, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v66 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v67 = sub_2067DB484(5312534) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v67;
    _os_log_impl(&dword_2067C5000, v66, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v68 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v69 = sub_2067DB484(5312519) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v69;
    _os_log_impl(&dword_2067C5000, v68, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v70 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v71 = sub_2067DB484(5312535) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v71;
    _os_log_impl(&dword_2067C5000, v70, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v72 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v73 = sub_2067DB484(5312520) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v73;
    _os_log_impl(&dword_2067C5000, v72, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallCancelSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v74 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v75 = sub_2067DB484(5312536) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v75;
    _os_log_impl(&dword_2067C5000, v74, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallCancelSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v76 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v77 = sub_2067DB484(5312527) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v77;
    _os_log_impl(&dword_2067C5000, v76, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v78 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v79 = sub_2067DB484(5312537) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v79;
    _os_log_impl(&dword_2067C5000, v78, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v80 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v81 = sub_2067DB484(5312521) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v81;
    _os_log_impl(&dword_2067C5000, v80, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v82 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v83 = sub_2067DB484(5312538) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v83;
    _os_log_impl(&dword_2067C5000, v82, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v84 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v85 = sub_2067DB484(5312522) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v85;
    _os_log_impl(&dword_2067C5000, v84, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallDeclineSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v86 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v87 = sub_2067DB484(5312539) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v87;
    _os_log_impl(&dword_2067C5000, v86, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallDeclineSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v88 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v89 = sub_2067DB484(5312523) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v89;
    _os_log_impl(&dword_2067C5000, v88, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v90 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v91 = sub_2067DB484(5312540) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v91;
    _os_log_impl(&dword_2067C5000, v90, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v92 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v93 = sub_2067DB484(5312524) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v93;
    _os_log_impl(&dword_2067C5000, v92, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v94 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v95 = sub_2067DB484(5312541) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v95;
    _os_log_impl(&dword_2067C5000, v94, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v96 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v97 = sub_2067DB484(5312525) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v97;
    _os_log_impl(&dword_2067C5000, v96, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v98 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v99 = sub_2067DB484(5312542) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v99;
    _os_log_impl(&dword_2067C5000, v98, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v100 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    v101 = sub_2067DB484(5312526) ? CFSTR("enabled") : CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = v101;
    _os_log_impl(&dword_2067C5000, v100, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_253E6C568 != -1)
      dispatch_once(&qword_253E6C568, &unk_24BFDEED0);
  }
  v102 = qword_253E6C560;
  if (os_log_type_enabled((os_log_t)qword_253E6C560, OS_LOG_TYPE_DEFAULT))
  {
    if (sub_2067DB484(5312543))
      v103 = CFSTR("enabled");
    else
      v103 = CFSTR("NOT enabled");
    v104 = 138412290;
    v105 = (__CFString *)v103;
    _os_log_impl(&dword_2067C5000, v102, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
  }
}

os_log_t sub_2067DD008()
{
  os_log_t result;

  result = os_log_create("com.apple.IMFoundation", "AWD");
  qword_253E6C560 = (uint64_t)result;
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t CUTGetMainBundleIdentifier()
{
  return MEMORY[0x24BE18DF0]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x24BE18E00]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

