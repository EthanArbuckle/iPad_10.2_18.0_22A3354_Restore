@implementation WFRunSSHScriptAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  WFRunSSHScriptAction *v64;
  id v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  WFRunSSHScriptAction *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  WFRunSSHScriptAction *v74;
  id v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  WFRunSSHScriptAction *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[3];

  v82[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WFRunOpenSSLCpuidSetupIfNeeded_onceToken != -1)
    dispatch_once(&WFRunOpenSSLCpuidSetupIfNeeded_onceToken, &__block_literal_global_8156);
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHHost"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHPort"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHUser"), objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24F8BBA48;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  +[NMSSHSession connectToHost:port:withUsername:](NMSSHSession, "connectToHost:port:withUsername:", v5, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);
  if ((objc_msgSend(v12, "isConnected") & 1) != 0)
  {
    +[WFSSHKeyPair knownHostFileURL](WFSSHKeyPair, "knownHostFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v82[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "knownHostStatusInFiles:", v15);

    if (v16)
    {
      if (v16 == 1)
      {
        v58 = v14;
        -[WFRunSSHScriptAction workflow](self, "workflow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "environment");

        if (v18 == 1)
        {
          v19 = (void *)MEMORY[0x24BDD1540];
          v20 = *MEMORY[0x24BEC4270];
          v80[0] = *MEMORY[0x24BDD0FD8];
          WFLocalizedString(CFSTR("SSH Authentication Failed"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v81[0] = v21;
          v80[1] = *MEMORY[0x24BDD0FC8];
          WFLocalizedString(CFSTR("The SSH server has a fingerprint that is different from the fingerprint that was saved when the SSH action was last run."));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = v22;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "disconnect");
          -[WFRunSSHScriptAction finishRunningWithError:](self, "finishRunningWithError:", v24);

          v14 = v58;
LABEL_17:

          goto LABEL_18;
        }
        objc_msgSend(v12, "fingerprint:", 0);
        v54 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("Remote Host Identification Has Changed"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setTitle:", v28);

        v29 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\n\nThis could indicate a man-in-the-middle attack, or it is possible that the host has changed.\n\nThe host key's fingerprint is %@.\n\nAre you sure you want to continue connecting?"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", v30, v54);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setMessage:", v31);

        v32 = (void *)MEMORY[0x24BE19378];
        v77[0] = MEMORY[0x24BDAC760];
        v77[1] = 3221225472;
        v77[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke;
        v77[3] = &unk_24F8BA480;
        v33 = v12;
        v78 = v33;
        v79 = self;
        objc_msgSend(v32, "cancelButtonWithHandler:", v77);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addButton:", v34);

        v35 = (void *)MEMORY[0x24BE19378];
        WFLocalizedString(CFSTR("Continue Anyway"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = MEMORY[0x24BDAC760];
        v70[1] = 3221225472;
        v70[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_2;
        v70[3] = &unk_24F8B1860;
        v71 = v33;
        v72 = v5;
        v76 = v7;
        v73 = v58;
        v74 = self;
        v75 = v4;
        objc_msgSend(v35, "buttonWithTitle:style:handler:", v36, 2, v70);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addButton:", v37);

        v14 = v58;
        -[WFRunSSHScriptAction userInterface](self, "userInterface");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "presentAlert:", v56);

        v39 = (void *)v54;
LABEL_16:

        goto LABEL_17;
      }
      -[WFRunSSHScriptAction workflow](self, "workflow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "environment");

      if (v27 != 1)
      {
        objc_msgSend(v12, "fingerprint:", 0);
        v57 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("Unknown Host"));
        v59 = v14;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v4;
        v42 = v40;
        objc_msgSend(v40, "setTitle:", v41);

        v43 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The authenticity of host '%@' can't be established because it has not been seen before by this device.\n\nThe host's key fingerprint is %@.\n\nAre you sure you want to continue connecting?"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", v44, v5, v57);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v42;
        objc_msgSend(v42, "setMessage:", v45);

        v47 = (void *)MEMORY[0x24BE19378];
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_3;
        v67[3] = &unk_24F8BA480;
        v48 = v12;
        v68 = v48;
        v69 = self;
        objc_msgSend(v47, "cancelButtonWithHandler:", v67);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addButton:", v49);

        v50 = (void *)MEMORY[0x24BE19378];
        v4 = v55;
        WFLocalizedString(CFSTR("Connect"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_4;
        v60[3] = &unk_24F8B1860;
        v61 = v48;
        v62 = v5;
        v66 = v7;
        v63 = v59;
        v64 = self;
        v65 = v55;
        objc_msgSend(v50, "buttonWithTitle:style:preferred:handler:", v51, 0, 1, v60);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addButton:", v52);

        v14 = v59;
        -[WFRunSSHScriptAction userInterface](self, "userInterface");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "presentAlert:", v46);

        v39 = (void *)v57;
        goto LABEL_16;
      }
      objc_msgSend(v12, "addKnownHostName:port:toFile:withSalt:", v5, v7, v14, 0);
    }
    -[WFRunSSHScriptAction authenticateAndRunAsynchronouslyWithInput:session:](self, "authenticateAndRunAsynchronouslyWithInput:session:", v4, v12);
    goto LABEL_17;
  }
  objc_msgSend(v12, "lastError");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunSSHScriptAction finishRunningSSHScriptWithError:](self, "finishRunningSSHScriptWithError:", v25);

LABEL_18:
}

- (void)authenticateAndRunAsynchronouslyWithInput:(id)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WFRunSSHScriptAction *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  WFRunSSHScriptAction *v45;
  uint64_t v46;
  __CFString *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  __CFString *v51;
  WFRunSSHScriptAction *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v6 = a4;
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHAuthenticationType"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHPassword"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSSHKeyPair sharedKeyPair](WFSSHKeyPair, "sharedKeyPair");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHScript"), objc_opt_class());
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_24F8BBA48;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Password")))
  {
    if ((objc_msgSend(v6, "authenticateByPassword:", v8) & 1) == 0)
    {
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke;
      v53[3] = &unk_24F8B1888;
      v54 = v8;
      objc_msgSend(v6, "authenticateByKeyboardInteractiveUsingBlock:", v53);

    }
    if ((objc_msgSend(v6, "isAuthorized") & 1) == 0)
    {
      objc_msgSend(v6, "lastError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v14, "domain");
      v45 = self;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "code");
      v59[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("SSH Password Authentication Failed"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v42;
      v59[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please check your credentials in the Run SSH Script action and try again."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v18 = v6;
      v19 = v13;
      v20 = v7;
      v21 = v9;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", v15, v16, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v22;
      v9 = v21;
      v7 = v20;
      v13 = v19;
      v6 = v18;

      objc_msgSend(v18, "disconnect");
      v25 = v45;
LABEL_14:
      -[WFRunSSHScriptAction finishRunningSSHScriptWithError:](v25, "finishRunningSSHScriptWithError:", v24, v42);

      goto LABEL_15;
    }
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SSH Key")))
  {
    if (!v9)
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BEC4270];
      v57[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("SSH Key Authentication Failed"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v30;
      v57[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No SSH key was found on this device."));
      v31 = v8;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
      v33 = v13;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", v46, 1, v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v33;
      v8 = v31;

      objc_msgSend(v6, "disconnect");
      -[WFRunSSHScriptAction finishRunningWithError:](self, "finishRunningWithError:", v14);
      goto LABEL_15;
    }
    objc_msgSend(v9, "publicKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "privateKeyPEM");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v6, "authenticateByInMemoryPublicKey:privateKey:andPassword:", v26, v27, 0);

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v6, "lastError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v14, "domain");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v14, "code");
      v55[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("SSH Key Authentication Failed"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v42;
      v55[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Make sure the SSH server has this device's public key in its list of authorized keys."));
      v47 = v13;
      v37 = v8;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
      v39 = v7;
      v40 = v9;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", v35, v36, v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v40;
      v7 = v39;

      v8 = v37;
      v13 = v47;

      objc_msgSend(v6, "disconnect");
      v25 = self;
      goto LABEL_14;
    }
  }
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_2;
  v49[3] = &unk_24F8B18D8;
  v50 = v6;
  v51 = v13;
  v52 = self;
  objc_msgSend(v48, "getFileRepresentation:forType:", v49, 0);

  v14 = v50;
LABEL_15:

}

- (void)finishRunningSSHScriptWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("libssh2")))
  {
    v6 = objc_msgSend(v4, "code");

    if (!v6)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v27[0] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Run Script Over SSH could not connect to the SSH server."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("libssh2"), 0, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("NMSSH"));

  if ((v12 & 1) != 0)
  {
    v27[0] = &unk_24F939AA0;
    WFLocalizedString(CFSTR("Connection timed out"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = &unk_24F939AB8;
    v28[0] = v13;
    WFLocalizedString(CFSTR("Channel allocation error"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v4, "code");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v4, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v4, "code");
      v25 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v24);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v4;
    }

  }
  else
  {
    v10 = v4;
  }
LABEL_11:

  -[WFRunSSHScriptAction finishRunningWithError:](self, "finishRunningWithError:", v10);
}

- (void)session:(id)a3 didDisconnectWithError:(id)a4
{
  -[WFRunSSHScriptAction finishRunningSSHScriptWithError:](self, "finishRunningSSHScriptWithError:", a4);
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void (**)(id, void *, id))a3;
  -[WFRunSSHScriptAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSSHHost"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ssh://%@"), v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    objc_msgSend(MEMORY[0x24BE19658], "locationWithURL:error:", v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    v4[2](v4, v9, v10);

  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in an SSH script on %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to run an SSH script on %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_3;
  block[3] = &unk_24F8B18B0;
  v11 = v3;
  v12 = v4;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v3;
  dispatch_async(v5, block);

}

void __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v3, "executeCommandAsynchronously:", v4);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v7 = objc_msgSend(v5, "writeData:error:timeout:", v6, &v19, &unk_24F939A88);
    v8 = v19;

    if ((v7 & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "sendEOF"))
        objc_msgSend(*(id *)(a1 + 40), "waitEOF");
      v9 = *(void **)(a1 + 40);
      v18 = v8;
      objc_msgSend(v9, "readResponseWithError:timeout:userInfo:", &v18, &unk_24F939A88, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;

      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 64), "disconnect");
        objc_msgSend(*(id *)(a1 + 56), "finishRunningSSHScriptWithError:", v11);
        v8 = v11;
        goto LABEL_15;
      }
      v8 = v11;
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 56), "finishRunningSSHScriptWithError:", v8);
    goto LABEL_15;
  }
  v17 = 0;
  v12 = (id)objc_msgSend(v3, "execute:error:", v4, &v17);
  v8 = v17;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 64), "disconnect");
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "lastResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(*(id *)(a1 + 64), "disconnect");
  v13 = objc_msgSend(v10, "length");
  v14 = *(void **)(a1 + 56);
  if (v13)
  {
    objc_msgSend(v14, "output");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithData:ofType:proposedFilename:", v10, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addFile:", v16);

    v14 = *(void **)(a1 + 56);
  }
  objc_msgSend(v14, "finishRunningSSHScriptWithError:", 0);

LABEL_15:
}

void __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithError:", v3);

}

uint64_t __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addKnownHostName:port:toFile:withSalt:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
  return objc_msgSend(*(id *)(a1 + 56), "authenticateAndRunAsynchronouslyWithInput:session:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
}

void __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithError:", v3);

}

uint64_t __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addKnownHostName:port:toFile:withSalt:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
  return objc_msgSend(*(id *)(a1 + 56), "authenticateAndRunAsynchronouslyWithInput:session:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
}

@end
