@implementation PHSearchRequest

- (PHSearchRequest)initWithDictionary:(id)a3
{
  PHSearchRequest *v3;
  VMVoicemailManager *v4;
  VMVoicemailManager *voicemailManager;
  CHManager *v6;
  CHManager *recentsManager;
  uint64_t v8;
  NSMutableDictionary *contactsByVoicemailIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHSearchRequest;
  v3 = -[PHSearchRequest initWithDictionary:](&v11, sel_initWithDictionary_, a3);
  if (v3)
  {
    v4 = (VMVoicemailManager *)objc_alloc_init(MEMORY[0x24BEC0C10]);
    voicemailManager = v3->_voicemailManager;
    v3->_voicemailManager = v4;

    v6 = (CHManager *)objc_alloc_init(MEMORY[0x24BE14938]);
    recentsManager = v3->_recentsManager;
    v3->_recentsManager = v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    contactsByVoicemailIdentifier = v3->_contactsByVoicemailIdentifier;
    v3->_contactsByVoicemailIdentifier = (NSMutableDictionary *)v8;

  }
  return v3;
}

- (NSArray)voicemails
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PHSearchRequest voicemailManager](self, "voicemailManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOnline");

  -[PHSearchRequest voicemailManager](self, "voicemailManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = &unk_24EF4A1E8;
  else
    v7 = &unk_24EF4A208;
  objc_msgSend(v5, "voicemailsPassingTest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PHDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_226FFC000, v9, OS_LOG_TYPE_DEFAULT, "Initial search to voicemail database returned %lu voicemails.", (uint8_t *)&v11, 0xCu);
  }

  return (NSArray *)v8;
}

- (NSArray)recentCalls
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD v46[2];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  _QWORD v55[3];

  v55[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAPhoneSearch faceTime](self, "faceTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SAPhoneSearch faceTime](self, "faceTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  -[SAPhoneSearch faceTimeAudio](self, "faceTimeAudio");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SAPhoneSearch faceTimeAudio](self, "faceTimeAudio");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "BOOLValue");

  }
  else
  {
    v9 = 1;
  }

  -[SAPhoneSearch faceTime](self, "faceTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[SAPhoneSearch faceTimeAudio](self, "faceTimeAudio");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v12 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  -[SAPhoneSearch faceTime](self, "faceTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[SAPhoneSearch faceTimeAudio](self, "faceTimeAudio");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "BOOLValue") ^ 1;

  }
  if (!v10)
    goto LABEL_15;
LABEL_16:

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE149A0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    if (!v9)
    {
LABEL_18:
      if (!v12)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if (!v9)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE14998]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v33);

  if (v12)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE149A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE149B0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v16);

  }
LABEL_20:
  v17 = objc_msgSend(v4, "count");
  PHDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      -[SAPhoneSearch outgoing](self, "outgoing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");
      -[SAPhoneSearch missed](self, "missed");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");
      -[SAPhoneSearch start](self, "start");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = (uint64_t)v4;
      v49 = 1024;
      v50 = v21;
      v51 = 1024;
      v52 = v23;
      v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_226FFC000, v18, OS_LOG_TYPE_DEFAULT, "Requested call types: %@ with search parameters: {outgoing: %d, missed: %d, startDate: %@}", buf, 0x22u);

    }
    -[SAPhoneSearch outgoing](self, "outgoing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    -[SAPhoneSearch missed](self, "missed");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    -[SAPhoneSearch start](self, "start");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v31;

    if (v26)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

        goto LABEL_42;
      }
      -[PHSearchRequest recentsManager](self, "recentsManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE14960]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE14978]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "predicateWithFormat:", CFSTR("date > %@ AND callType IN %@ AND callStatus IN %@"), v35, v4, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recentCallsWithPredicate:", v42);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PHSearchRequest recentsManager](self, "recentsManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD1758];
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("date > %@ AND callType IN %@"), v35, v4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "recentCallsWithPredicate:", v38);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE14980]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "predicateWithFormat:", CFSTR("date > %@ AND callType IN %@ AND callStatus == %@"), v35, v4, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recentCallsWithPredicate:", v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_40:
    goto LABEL_41;
  }
  if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226FFC000, v18, OS_LOG_TYPE_DEFAULT, "No call types requested.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:
  PHDefaultLog();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v34, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v44;
    _os_log_impl(&dword_226FFC000, v43, OS_LOG_TYPE_DEFAULT, "Initial search to recents database returned %lu calls.", buf, 0xCu);
  }

  return (NSArray *)v34;
}

- (id)typedDataForRawAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "_appearsToBePhoneNumber"))
  {
    objc_msgSend(MEMORY[0x24BE814B8], "phone");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PHSearchRequest labelForPhoneNumber:](self, "labelForPhoneNumber:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", v6);

    objc_msgSend(v5, "setNumber:", v4);
  }
  else if (objc_msgSend(v4, "_appearsToBeEmail"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BE81248]);
    -[PHSearchRequest labelForEmailAddress:](self, "labelForEmailAddress:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", v7);

    objc_msgSend(v5, "setEmailAddress:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)labelForPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[PHAssistantServices sharedContactStore](PHAssistantServices, "sharedContactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactForDestinationId:keysToFetch:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v3);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "phoneNumbers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v7);

          if (v14)
          {
            objc_msgSend(v12, "label");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)labelForEmailAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[PHAssistantServices sharedContactStore](PHAssistantServices, "sharedContactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = *MEMORY[0x24BDBA288];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactForDestinationId:keysToFetch:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "emailAddresses", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v3);

          if (v13)
          {
            objc_msgSend(v11, "label");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)personFromRawAddress:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE814A8], "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "_appearsToBeEmail"))
    {
      v5 = objc_alloc_init(MEMORY[0x24BE81248]);
      objc_msgSend(v5, "setEmailAddress:", v3);
      v9[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmails:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE814B8], "phone");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNumber:", v3);
      v8 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPhones:", v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/Applications/MobilePhone.app"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CALLER"), &stru_24EF4A4F8, CFSTR("General"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFullName:", v6);
  }

  return v4;
}

- (id)phoneVoiceMailFromVMVoicemail:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE814E8]);
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCallTime:", v6);

  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "duration");
  objc_msgSend(v7, "numberWithUnsignedInteger:", (unint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLength:", v9);

  objc_msgSend(MEMORY[0x24BE814B0], "personAttribute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchRequest contactsByVoicemailIdentifier](self, "contactsByVoicemailIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE19118], "createSAPersonFromCNContact:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:", v14);
  }
  else
  {
    objc_msgSend(v4, "senderDestinationID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchRequest personFromRawAddress:](self, "personFromRawAddress:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:", v15);

  }
  objc_msgSend(v4, "senderDestinationID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setData:", v16);

  objc_msgSend(v10, "object");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fullName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayText:", v18);

  objc_msgSend(v4, "senderDestinationID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchRequest typedDataForRawAddress:](self, "typedDataForRawAddress:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTypedData:", v20);

  objc_msgSend(v5, "setContact:", v10);
  objc_msgSend(v4, "dataURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v21);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isUnread"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsNew:", v22);

  return v5;
}

- (id)phoneCallHistoryFromRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE814C0], "callHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCallTime:", v6);

  v7 = objc_msgSend(v4, "callStatus");
  v8 = *MEMORY[0x24BE14988] & v7;
  objc_msgSend(v4, "duration");
  v10 = v9;
  objc_msgSend(MEMORY[0x24BE814B0], "personAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callerId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_3;
  +[PHAssistantServices sharedContactStore](PHAssistantServices, "sharedContactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v15 = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19118], "descriptorsForRequiredKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contactForIdentifier:keysToFetch:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  objc_msgSend(MEMORY[0x24BE19118], "createSAPersonFromCNContact:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_3:
    -[PHSearchRequest personFromRawAddress:](self, "personFromRawAddress:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setObject:", v19);
  objc_msgSend(v19, "fullName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayText:", v20);

  objc_msgSend(v11, "setData:", v12);
  -[PHSearchRequest typedDataForRawAddress:](self, "typedDataForRawAddress:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTypedData:", v21);

  objc_msgSend(v5, "setContact:", v11);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8 != 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOutgoing:", v22);

  v23 = v10 == 0.0 && v8 == 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMissed:", v24);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "callerIdIsBlocked"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlocked:", v25);

  v26 = objc_msgSend(v4, "callType");
  if (v26)
  {
    v27 = v26;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v26 == *MEMORY[0x24BE149A0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFaceTime:", v28);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27 == *MEMORY[0x24BE14998]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFaceTimeAudio:", v29);

  }
  return v5;
}

- (BOOL)didSpecifyContacts
{
  void *v2;
  BOOL v3;

  -[SAPhoneSearch contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSSet)specifiedContactIdentifiers
{
  NSSet *specifiedContactIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  NSSet *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  specifiedContactIdentifiers = self->_specifiedContactIdentifiers;
  if (!specifiedContactIdentifiers)
  {
    v4 = (void *)MEMORY[0x24BDBCEF0];
    -[SAPhoneSearch contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SAPhoneSearch contacts](self, "contacts", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = (void *)MEMORY[0x24BE19120];
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "contactIDFromAssistantID:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v17 = (NSSet *)objc_msgSend(v6, "copy");
    v18 = self->_specifiedContactIdentifiers;
    self->_specifiedContactIdentifiers = v17;

    specifiedContactIdentifiers = self->_specifiedContactIdentifiers;
  }
  return specifiedContactIdentifiers;
}

- (void)cacheContactsForVoicemails:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19118], "descriptorsForRequiredKeys", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PHSearchRequest voicemails](self, "voicemails");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[PHAssistantServices sharedContactStore](PHAssistantServices, "sharedContactStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactUsingContactStore:withKeysToFetch:", v10, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHSearchRequest contactsByVoicemailIdentifier](self, "contactsByVoicemailIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)voicemailFilterPredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_227001D38;
  v3[3] = &unk_24EF4A230;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recentCallsFilterPredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_227001F68;
  v3[3] = &unk_24EF4A258;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAPhoneSearch voiceMail](self, "voiceMail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    -[PHSearchRequest voicemailFilterPredicate](self, "voicemailFilterPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchRequest voicemails](self, "voicemails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchRequest cacheContactsForVoicemails:](self, "cacheContactsForVoicemails:", v9);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v8, "evaluateWithObject:", v15))
          {
            -[PHSearchRequest phoneVoiceMailFromVMVoicemail:](self, "phoneVoiceMailFromVMVoicemail:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v16);

            -[SAPhoneSearch last](self, "last");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "BOOLValue") && objc_msgSend(v5, "count"))
            {

              goto LABEL_27;
            }
            v18 = objc_msgSend(v5, "count");

            if (v18 > 0x19)
              goto LABEL_27;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_27:
    v19 = v10;
LABEL_28:

  }
  else
  {
    -[PHSearchRequest recentCallsFilterPredicate](self, "recentCallsFilterPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[PHSearchRequest recentCalls](self, "recentCalls", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          if (objc_msgSend(v8, "evaluateWithObject:", v24))
          {
            -[PHSearchRequest phoneCallHistoryFromRecentCall:](self, "phoneCallHistoryFromRecentCall:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v25);

            -[SAPhoneSearch last](self, "last");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "BOOLValue") && objc_msgSend(v5, "count"))
              goto LABEL_28;
            v26 = objc_msgSend(v5, "count");

            if (v26 > 0x19)
              goto LABEL_29;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v21);
    }
  }
LABEL_29:

  PHDefaultLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v41 = v28;
    _os_log_impl(&dword_226FFC000, v27, OS_LOG_TYPE_DEFAULT, "After filtering, results contains %lu objects.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE814E0], "searchCompleted");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPhoneSearchResults:", v5);
  objc_msgSend(v29, "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");
  v4[2](v4, v31);

}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailManager, a3);
}

- (CHManager)recentsManager
{
  return self->_recentsManager;
}

- (void)setRecentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_recentsManager, a3);
}

- (NSMutableDictionary)contactsByVoicemailIdentifier
{
  return self->_contactsByVoicemailIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsByVoicemailIdentifier, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_specifiedContactIdentifiers, 0);
}

@end
