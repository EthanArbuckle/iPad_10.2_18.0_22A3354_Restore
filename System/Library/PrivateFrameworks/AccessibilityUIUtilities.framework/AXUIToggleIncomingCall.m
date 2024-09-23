@implementation AXUIToggleIncomingCall

void __AXUIToggleIncomingCall_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v40;
  os_log_type_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  NSObject *v56;
  os_log_type_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  NSObject *v63;
  os_log_type_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v3);

  objc_msgSend(v1, "incomingVideoCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v4);

  objc_msgSend(v2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v67) = 1;
  _AXLogWithFacility();
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance", v67, CFSTR("Incoming call: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ignoreLogging");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      AXColorizeFormatLog();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v74 = v12;
        _os_log_impl(&dword_1BD892000, v9, v10, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ignoreLogging");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        AXColorizeFormatLog();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v5, "status");
        _AXStringForArgs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138543362;
          v74 = v19;
          _os_log_impl(&dword_1BD892000, v16, v17, "%{public}@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(v5, "status", v68) == 4)
    {
      objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "ignoreLogging");

      if ((v21 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v23, v24))
        {
          AXColorizeFormatLog();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, v24))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v26;
            _os_log_impl(&dword_1BD892000, v23, v24, "%{public}@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v1, "answerCall:", v5);
      objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "ignoreLogging");

      if ((v28 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v30 = objc_claimAutoreleasedReturnValue();

        v31 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v30, v31))
        {
          AXColorizeFormatLog();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "status");
          _AXStringForArgs();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v33;
            _os_log_impl(&dword_1BD892000, v30, v31, "%{public}@", buf, 0xCu);
          }

        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "currentCalls");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "axSafelyAddObjectsFromArray:", v35);

    objc_msgSend(v1, "currentVideoCalls");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "axSafelyAddObjectsFromArray:", v36);

    LOBYTE(v68) = 1;
    _AXLogWithFacility();
    objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance", v68, CFSTR("Existing calls: %@"), v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "ignoreLogging");

    if ((v38 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v40 = objc_claimAutoreleasedReturnValue();

      v41 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v40, v41))
      {
        AXColorizeFormatLog();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v34, "count");
        _AXStringForArgs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, v41))
        {
          *(_DWORD *)buf = 138543362;
          v74 = v43;
          _os_log_impl(&dword_1BD892000, v40, v41, "%{public}@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(v34, "count", v69))
    {
      objc_msgSend(v34, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "status");
      objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "ignoreLogging");

      if ((v47 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v49 = objc_claimAutoreleasedReturnValue();

        v50 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v49, v50))
        {
          v71 = v44;
          AXColorizeFormatLog();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v45;
          _AXStringForArgs();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v52;
            _os_log_impl(&dword_1BD892000, v49, v50, "%{public}@", buf, 0xCu);
          }

          v44 = v71;
        }

      }
      if (v45 <= 3)
      {
        objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "ignoreLogging");

        if ((v54 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v56 = objc_claimAutoreleasedReturnValue();

          v57 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v56, v57))
          {
            AXColorizeFormatLog();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, v57))
            {
              *(_DWORD *)buf = 138543362;
              v74 = v59;
              _os_log_impl(&dword_1BD892000, v56, v57, "%{public}@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v1, "disconnectCall:withReason:", v44, 2, v70);
        objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "ignoreLogging");

        if ((v61 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v63 = objc_claimAutoreleasedReturnValue();

          v64 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v63, v64))
          {
            AXColorizeFormatLog();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "status");
            _AXStringForArgs();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, v64))
            {
              *(_DWORD *)buf = 138543362;
              v74 = v66;
              _os_log_impl(&dword_1BD892000, v63, v64, "%{public}@", buf, 0xCu);
            }

          }
        }
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

    }
  }

}

@end
