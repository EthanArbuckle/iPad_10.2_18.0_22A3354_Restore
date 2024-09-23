@implementation WFSetVPNAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSetVPNAction;
  -[WFSetVPNAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSetVPNAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVPNOperation"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Set On Demand")))
  {
    -[WFSetVPNAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFOnDemandValue"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = CFSTR("Disable On Demand");
    if (v7)
      v8 = CFSTR("Enable On Demand");
    v9 = v8;

    v5 = v9;
  }
  -[WFSetVPNAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVPN"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v11 = (void *)getNEVPNManagerClass_softClass_48290;
    v24 = getNEVPNManagerClass_softClass_48290;
    v12 = MEMORY[0x24BDAC760];
    if (!getNEVPNManagerClass_softClass_48290)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getNEVPNManagerClass_block_invoke_48291;
      v20[3] = &unk_24F8BB430;
      v20[4] = &v21;
      __getNEVPNManagerClass_block_invoke_48291((uint64_t)v20);
      v11 = (void *)v22[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v21, 8);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __45__WFSetVPNAction_runAsynchronouslyWithInput___block_invoke;
    v17[3] = &unk_24F8BB348;
    v17[4] = self;
    v18 = v10;
    v19 = v5;
    objc_msgSend(v13, "loadAllFromPreferencesWithCompletionHandler:", v17);

  }
  else
  {
    v25 = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Please provide a VPN to the “Set VPN” action."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetVPNAction finishRunningWithError:](self, "finishRunningWithError:", v16);

  }
}

- (void)saveToPreferencesWithVPNManager:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__WFSetVPNAction_saveToPreferencesWithVPNManager___block_invoke;
  v3[3] = &unk_24F8BB370;
  v3[4] = self;
  objc_msgSend(a3, "saveToPreferencesWithCompletionHandler:", v3);
}

- (id)missingVPNError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("VPN not found"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("The VPN you selected is not available on this device."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __50__WFSetVPNAction_saveToPreferencesWithVPNManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFWorkflowExecutionLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFSetVPNAction saveToPreferencesWithVPNManager:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Failed to save VPN configuration with error: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v3);

}

void __45__WFSetVPNAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v8, CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      || (objc_msgSend(a1[5], "title"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v10, CFSTR("localizedDescription")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("Connect")))
      {
        getWFActionsLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "connection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          v42 = 2112;
          v43 = v12;
          _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_DEBUG, "%s Starting VPN: %@", buf, 0x16u);

        }
        if ((objc_msgSend(v9, "isEnabled") & 1) == 0)
        {
          getWFActionsLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
            v42 = 2112;
            v43 = v9;
            _os_log_impl(&dword_22D353000, v13, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it.", buf, 0x16u);
          }

          objc_msgSend(v9, "setEnabled:", 1);
          objc_msgSend(a1[4], "saveToPreferencesWithVPNManager:", v9);
        }
        getWFActionsLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_DEBUG, "%s About to start VPN %@", buf, 0x16u);
        }

        objc_msgSend(v9, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v15, "startVPNTunnelAndReturnError:", &v39);
        v16 = v39;

        getWFActionsLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_39;
        goto LABEL_17;
      }
      if (!objc_msgSend(a1[6], "isEqualToString:", CFSTR("Disconnect")))
      {
        if (!objc_msgSend(a1[6], "isEqualToString:", CFSTR("Toggle")))
        {
          if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("Enable On Demand")))
          {
            if ((objc_msgSend(v9, "isEnabled") & 1) == 0)
            {
              getWFActionsLogObject();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                v42 = 2112;
                v43 = v9;
                _os_log_impl(&dword_22D353000, v28, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it before enabling on-demand.", buf, 0x16u);
              }

              objc_msgSend(v9, "setEnabled:", 1);
              objc_msgSend(a1[4], "saveToPreferencesWithVPNManager:", v9);
            }
            v29 = v9;
            v30 = 1;
          }
          else if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("Disable On Demand")))
          {
            v29 = v9;
            v30 = 0;
          }
          else
          {
            if (!objc_msgSend(a1[6], "isEqualToString:", CFSTR("Toggle On Demand")))
              goto LABEL_40;
            if ((objc_msgSend(v9, "isEnabled") & 1) == 0)
            {
              getWFActionsLogObject();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                v42 = 2112;
                v43 = v9;
                _os_log_impl(&dword_22D353000, v37, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it before toggling on-demand.", buf, 0x16u);
              }

              objc_msgSend(v9, "setEnabled:", 1);
              objc_msgSend(a1[4], "saveToPreferencesWithVPNManager:", v9);
            }
            v30 = objc_msgSend(v9, "isOnDemandEnabled") ^ 1;
            v29 = v9;
          }
          objc_msgSend(v29, "setOnDemandEnabled:", v30);
          objc_msgSend(a1[4], "saveToPreferencesWithVPNManager:", v9);
          goto LABEL_40;
        }
        getWFActionsLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "connection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          v42 = 2112;
          v43 = v24;
          _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_DEBUG, "%s Toggling VPN state: %@", buf, 0x16u);

        }
        objc_msgSend(v9, "connection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "status") == 3)
        {

        }
        else
        {
          objc_msgSend(v9, "connection");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "status");

          if (v32 != 2)
          {
            if ((objc_msgSend(v9, "isEnabled") & 1) == 0)
            {
              getWFActionsLogObject();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                v42 = 2112;
                v43 = v9;
                _os_log_impl(&dword_22D353000, v33, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it.", buf, 0x16u);
              }

              objc_msgSend(v9, "setEnabled:", 1);
              objc_msgSend(a1[4], "saveToPreferencesWithVPNManager:", v9);
              getWFActionsLogObject();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                v42 = 2112;
                v43 = v9;
                _os_log_impl(&dword_22D353000, v34, OS_LOG_TYPE_DEBUG, "%s After enabling VPN, its status is %@", buf, 0x16u);
              }

            }
            getWFActionsLogObject();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
              v42 = 2112;
              v43 = v9;
              _os_log_impl(&dword_22D353000, v35, OS_LOG_TYPE_DEBUG, "%s About to start VPN %@", buf, 0x16u);
            }

            objc_msgSend(v9, "connection");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0;
            objc_msgSend(v36, "startVPNTunnelAndReturnError:", &v38);
            v16 = v38;

            getWFActionsLogObject();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
LABEL_17:
            *(_DWORD *)buf = 136315394;
            v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
            v42 = 2112;
            v43 = v9;
            _os_log_impl(&dword_22D353000, v17, OS_LOG_TYPE_DEBUG, "%s Started VPN %@", buf, 0x16u);
LABEL_39:

            objc_msgSend(a1[4], "finishRunningWithError:", v16);
            goto LABEL_40;
          }
        }
        objc_msgSend(v9, "connection");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject stopVPNTunnel](v17, "stopVPNTunnel");
        v16 = 0;
        goto LABEL_39;
      }
      getWFActionsLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
        v42 = 2112;
        v43 = v19;
        _os_log_impl(&dword_22D353000, v18, OS_LOG_TYPE_DEBUG, "%s Stopping VPN: %@", buf, 0x16u);

      }
      objc_msgSend(v9, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stopVPNTunnel");

      v21 = a1[4];
      v22 = 0;
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
        _os_log_impl(&dword_22D353000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't find a NEVPNManager matching the configuration identifier.", buf, 0xCu);
      }

      v27 = a1[4];
      objc_msgSend(v27, "missingVPNError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v27;
      v22 = v9;
    }
    objc_msgSend(v21, "finishRunningWithError:", v22);
LABEL_40:

    goto LABEL_41;
  }
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Error loading available VPNs: %@", buf, 0x16u);
  }

  objc_msgSend(a1[4], "finishRunningWithError:", v6);
LABEL_41:

}

@end
