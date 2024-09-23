@implementation IMDeliveryReceiptProcessingPipelineComponent

- (IMDeliveryReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5;
  IMDeliveryReceiptProcessingPipelineComponent *v6;
  IMDeliveryReceiptProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDeliveryReceiptProcessingPipelineComponent;
  v6 = -[IMDeliveryReceiptProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageStore, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "GUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMDeliveryReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

    }
  }
  v7 = IMGetCachedDomainBoolForKey();
  if ((_DWORD)v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "    Ignoring delivery receipt for message: %@", buf, 0xCu);

      }
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }
  else
  {
    objc_msgSend(v4, "GUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "    Received Fresh Delivery Receipt For Message GUID: %@", buf, 0xCu);
      }

    }
    -[IMDMessageStore messageWithGUID:](self->_messageStore, "messageWithGUID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[IMDMessageStore chatForMessage:](self->_messageStore, "chatForMessage:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "timestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "__im_iMessageDateFromTimeStamp:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "senderRegistrationProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDeliveryReceiptProcessingPipelineComponent _processDeliveryReceiptForMessage:date:isFromOffGridCapableDevice:chat:](self, "_processDeliveryReceiptForMessage:date:isFromOffGridCapableDevice:chat:", v13, v17, objc_msgSend(v18, "containsObject:", *MEMORY[0x1E0D34B78]), v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMessageItems:", v20);

      if (v14)
      {
        objc_msgSend(v4, "setChat:", v14);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
      }
      else
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 8, 0);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v23);

      }
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v19 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v19);
    }

  }
  return v10;
}

- (id)_processDeliveryReceiptForMessage:(id)a3 date:(id)a4 isFromOffGridCapableDevice:(BOOL)a5 chat:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  int v41;
  int v43;
  void *v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "guid");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v10)
  {
    v15 = objc_msgSend(v10, "isDelivered");
    if ((_DWORD)v15)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "    Message was already marked as delivered, ignoring", (uint8_t *)&v43, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isCarrierPigeonEnabled");

      if ((v18 & v7) == 1)
      {
        v19 = objc_msgSend(v10, "expectedOffGridCapableDeliveries");
        if (v19)
        {
          if (IMOSLoggingEnabled(v19))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              LOWORD(v43) = 0;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "    Updating expected off grid capable deliveries", (uint8_t *)&v43, 2u);
            }

          }
          -[IMDeliveryReceiptProcessingPipelineComponent _reduceExpectedSatelliteDeliveriesOnMessage:chat:](self, "_reduceExpectedSatelliteDeliveriesOnMessage:chat:", v10, v12);
          -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:](self->_messageStore, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v10, 0, 0, 1, 0x20000000000);
          v21 = objc_claimAutoreleasedReturnValue();

LABEL_51:
          v10 = (id)v21;
        }
      }
    }
    else
    {
      v23 = objc_msgSend(v10, "errorCode");
      if ((_DWORD)v23 != 43)
      {
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isCarrierPigeonEnabled");

        if (v26)
        {
          v27 = objc_msgSend(v10, "needsRelay");
          if ((_DWORD)v27)
          {
            v27 = IMOSLoggingEnabled(objc_msgSend(v10, "setNeedsRelay:", 0));
            if ((_DWORD)v27)
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                LOWORD(v43) = 0;
                _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "   Message was delivered, no need for relay anymore", (uint8_t *)&v43, 2u);
              }

            }
          }
        }
        if (IMOSLoggingEnabled(v27))
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v43 = 138412290;
            v44 = v14;
            _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "    Received delivery receipt for message: %@", (uint8_t *)&v43, 0xCu);
          }

        }
        objc_msgSend(v10, "setFlags:", objc_msgSend(v10, "flags") | 0x9000);
        if (v11)
        {
          objc_msgSend(v10, "setTimeDelivered:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTimeDelivered:", v30);

        }
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isScheduledMessagesCoreEnabled");

        if (v32)
        {
          objc_msgSend(v10, "setScheduleType:", 0);
          objc_msgSend(v10, "setScheduleState:", 0);
        }
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isCarrierPigeonEnabled");

        if ((v34 & v7) == 1 && objc_msgSend(v10, "expectedOffGridCapableDeliveries"))
          -[IMDeliveryReceiptProcessingPipelineComponent _reduceExpectedSatelliteDeliveriesOnMessage:chat:](self, "_reduceExpectedSatelliteDeliveriesOnMessage:chat:", v10, v12);
        objc_msgSend(v10, "time");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeDelivered");
        v36 = objc_claimAutoreleasedReturnValue();
        -[IMDeliveryReceiptProcessingPipelineComponent _metricMessageGUIDDelivered:sendDate:deliveryDate:](self, "_metricMessageGUIDDelivered:sendDate:deliveryDate:", v14, v35, v36);

        objc_msgSend(v10, "fileTransferGUIDs");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v36) = objc_msgSend(v37, "count") == 0;

        if ((v36 & 1) == 0)
          -[IMDeliveryReceiptProcessingPipelineComponent _metricMessageGUIDSendToDelivered:](self, "_metricMessageGUIDSendToDelivered:", v10);
        v38 = objc_msgSend(v10, "errorCode");
        v39 = v38;
        if ((_DWORD)v38)
        {
          if (IMOSLoggingEnabled(v38))
          {
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = objc_msgSend(v10, "errorCode");
              v43 = 67109120;
              LODWORD(v44) = v41;
              _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "    Message had error: %d", (uint8_t *)&v43, 8u);
            }

          }
          objc_msgSend(v10, "setErrorCode:", 0);
        }
        -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:](self->_messageStore, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v10, 0, v39 != 0, 1, 0x20000009009);
        v21 = objc_claimAutoreleasedReturnValue();

        goto LABEL_51;
      }
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "   Message was already marked as black holed, ignoring", (uint8_t *)&v43, 2u);
        }

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v43) = 0;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "    Unable to find message to mark as delivered.", (uint8_t *)&v43, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (void)_reduceExpectedSatelliteDeliveriesOnMessage:(id)a3 chat:(id)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "setExpectedOffGridCapableDeliveries:", objc_msgSend(v9, "expectedOffGridCapableDeliveries") - 1);
  if (objc_msgSend(v9, "isPendingSatelliteSend"))
    v6 = objc_msgSend(v9, "expectedOffGridCapableDeliveries") != 0;
  else
    v6 = 0;
  objc_msgSend(v9, "setIsPendingSatelliteSend:", v6);
  if (!objc_msgSend(v9, "expectedOffGridCapableDeliveries"))
  {
    +[IMDOffGridAvailabilityTracker sharedTracker](IMDOffGridAvailabilityTracker, "sharedTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTrackingHandle:", v8);

  }
}

- (void)_metricMessageGUIDDelivered:(id)a3 sendDate:(id)a4 deliveryDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    v10 = objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v12 = v11;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v23 = v12;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Delivery receipt time was: %f", buf, 0xCu);
      }

    }
    if (v12 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trackEvent:withStatistic:", *MEMORY[0x1E0D38AC0], v15);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0D38468];
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trackEvent:withDictionary:", *MEMORY[0x1E0D385D0], v17);

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v16, CFSTR("DeliveryDuration"), v7, CFSTR("MessageGUID"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED936018 != -1)
        dispatch_once(&qword_1ED936018, &unk_1E922CA90);
      if (off_1ED936010)
        off_1ED936010(7, CFSTR("iMessageDelivered Late Ack"), v19, 0);

    }
  }

}

- (void)_metricMessageGUIDSendToDelivered:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  int v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  int v29;
  __CFString *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  unsigned int v57;
  id v58;
  unsigned int v59;
  id v60;
  const __CFString *v61;
  unsigned int v62;
  const __CFString *inConformsToUTI;
  unsigned int v64;
  uint64_t v65;
  _OWORD v66[4];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  double v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  double v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "fileTransferGUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "timeDelivered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "createdDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v58, "fileTransferGUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (v11)
  {
    v65 = 0;
    v64 = 0;
    v59 = 0;
    v62 = 0;
    v57 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v68;
    inConformsToUTI = (const __CFString *)*MEMORY[0x1E0CA5B68];
    v61 = (const __CFString *)*MEMORY[0x1E0CA5C50];
    v56 = (const __CFString *)*MEMORY[0x1E0D39C58];
    v14 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "transferForGUID:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "totalBytes");
        objc_msgSend(v18, "type");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v21 = UTTypeConformsTo(v20, CFSTR("public.heic"));

        if (v21)
        {
          v12 = (v12 + 1);
        }
        else
        {
          objc_msgSend(v18, "type");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v23 = UTTypeConformsTo(v22, CFSTR("public.png"));

          if (v23)
          {
            ++HIDWORD(v65);
          }
          else
          {
            objc_msgSend(v18, "type");
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v25 = UTTypeConformsTo(v24, CFSTR("public.jpeg"));

            if (v25)
            {
              LODWORD(v65) = v65 + 1;
            }
            else
            {
              objc_msgSend(v18, "type");
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v27 = UTTypeConformsTo(v26, inConformsToUTI);

              if (v27)
              {
                ++v64;
              }
              else
              {
                objc_msgSend(v18, "type");
                v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v29 = UTTypeConformsTo(v28, v61);

                if (v29)
                {
                  ++v62;
                }
                else
                {
                  objc_msgSend(v18, "type");
                  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v31 = UTTypeConformsTo(v30, v56);

                  if (v31)
                    ++v59;
                  else
                    ++v57;
                }
              }
            }
          }
        }

        v14 = v14 + (float)v19;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    }
    while (v11);
  }
  else
  {
    v65 = 0;
    v64 = 0;
    v59 = 0;
    v62 = 0;
    v57 = 0;
    v12 = 0;
    v14 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v32, *MEMORY[0x1E0D385B8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v65));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v33, *MEMORY[0x1E0D38718]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v65);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v34, *MEMORY[0x1E0D38608]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v35, *MEMORY[0x1E0D385B0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v36, *MEMORY[0x1E0D38940]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v62);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v37, *MEMORY[0x1E0D387D0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v57);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v38, *MEMORY[0x1E0D38710]);

  *(float *)&v39 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v40, *MEMORY[0x1E0D38A50]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setObject:forKey:", v41, *MEMORY[0x1E0D38A48]);

  memset(v66, 0, sizeof(v66));
  objc_msgSend(v58, "fileTransferGUIDs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v66, v81, 16))
  {
    v43 = **((_QWORD **)&v66[0] + 1);
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "transferForGUID:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:](IMDAttachmentUtilities, "shouldEnablePreviewTranscodingQualityForTransfer:isSending:", v45, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setObject:forKey:", v47, *MEMORY[0x1E0D38A20]);

  }
  if (IMOSLoggingEnabled(v48))
  {
    OSLogHandleForIMFoundationCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v58, "guid");
      v50 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "createdDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeDelivered");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v72 = v50;
      v73 = 2048;
      v74 = v9;
      v75 = 2112;
      v76 = v51;
      v77 = 2112;
      v78 = v52;
      v79 = 2048;
      v80 = v14;
      _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "For message: %@ timeDuration: %f file create date: %@ delivered time: %@ total file Size: %f", buf, 0x34u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v60, "copy");
  objc_msgSend(v53, "trackEvent:withDictionary:", *MEMORY[0x1E0D385E0], v54);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end
