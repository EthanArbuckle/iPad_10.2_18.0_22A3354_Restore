@implementation IRCandidateDO

+ (id)candidateDOFromCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  IRNodeDO *v8;
  void *v9;
  void *v10;
  void *v11;
  IRNodeDO *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__IRCandidateDO_Extensions__candidateDOFromCandidate___block_invoke;
  v19[3] = &unk_2510453B8;
  v6 = v4;
  v20 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);

  objc_msgSend(v3, "avOutpuDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v3, "rapportIdentifier"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v3, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_5;
  }
  v8 = [IRNodeDO alloc];
  objc_msgSend(v3, "avOutpuDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rapportIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IRNodeDO initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:](v8, "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v9, v10, v11, 0, 0);
  objc_msgSend(v6, "addObject:", v12);

LABEL_5:
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v6, "copy");
  +[IRCandidateDO candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:](IRCandidateDO, "candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v13, 0, 0, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __54__IRCandidateDO_Extensions__candidateDOFromCandidate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRNodeDO nodeDOFromNode:](IRNodeDO, "nodeDOFromNode:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)candidateFromCandidateDO:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = (objc_class *)MEMORY[0x24BE5B2C0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCandidateIdentifier:", v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__IRCandidateDO_Extensions__candidateFromCandidateDO___block_invoke;
  v13[3] = &unk_2510445A8;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v7, "updateNodes:", v11);

  return v7;
}

void __54__IRCandidateDO_Extensions__candidateFromCandidateDO___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRNodeDO nodeFromNodeDO:](IRNodeDO, "nodeFromNodeDO:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)candidateForIdentifier:(id)a3 within:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__IRCandidateDO_Extensions__candidateForIdentifier_within___block_invoke;
  v9[3] = &unk_251043CB8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "firstWhere:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__IRCandidateDO_Extensions__candidateForIdentifier_within___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)mediaRemoteSpeakerCandidate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[IRAVOutputDeviceDO aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:](IRAVOutputDeviceDO, "aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", CFSTR("Speaker"), 0, CFSTR("Speaker"), 0, 0, 0, 3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRNodeDO nodeDOWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:](IRNodeDO, "nodeDOWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", CFSTR("Speaker"), 0, 0, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateDO candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:](IRCandidateDO, "candidateDOWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v4, 0, v5, CFSTR("Speaker"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)exportAsDictionary
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MMM-dd HH:mm:ss.SSSSSS"));
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[IRCandidateDO lastSeenDate](self, "lastSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lastSeenDate"));

  -[IRCandidateDO candidateIdentifier](self, "candidateIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("candidateIdentifier"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IRCandidateDO nodes](self, "nodes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "exportAsDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("nodes"));
  return v3;
}

- (id)name
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = &stru_251046168;
  -[IRCandidateDO nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__IRCandidateDO_Extensions__name__block_invoke;
  v7[3] = &unk_2510453E0;
  v7[4] = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);

  if (objc_msgSend((id)v9[5], "hasSuffix:", CFSTR("|")))
  {
    objc_msgSend((id)v9[5], "substringToIndex:", objc_msgSend((id)v9[5], "length") - 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9[5];
    v9[5] = v3;

  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__IRCandidateDO_Extensions__name__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "computeName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@|"), v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)isSameWiFi
{
  void *v2;
  void *v3;
  BOOL v4;

  -[IRCandidateDO nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstWhere:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __39__IRCandidateDO_Extensions__isSameWiFi__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "avOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasAirplayProperties"))
  {
    objc_msgSend(v2, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasAirplayProperties"))
    {
      objc_msgSend(v2, "avOutputDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "discoveredOverInfra");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isMac
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v14;

  -[IRCandidateDO nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[IRCandidateDO nodes](self, "nodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avOutputDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[IRCandidateDO nodes](self, "nodes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "avOutputDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "deviceType"))
      {
        v10 = 0;
      }
      else
      {
        -[IRCandidateDO nodes](self, "nodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anyObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "avOutputDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "deviceSubType") == 18;

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isBrokeredDevice
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;

  +[IRPreferences shared](IRPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loiSameSpaceOverrideBrokerForCandidateIDArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateDO candidateIdentifier](self, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) != 0)
    return 1;
  -[IRCandidateDO nodes](self, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstWhere:", &__block_literal_global_29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9 != 0;

  return v7;
}

uint64_t __45__IRCandidateDO_Extensions__isBrokeredDevice__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "avOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "discoveredWithBroker");

  return v3;
}

- (BOOL)isSameICloudWithSystemState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IRCandidateDO nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__IRCandidateDO_Extensions__isSameICloudWithSystemState___block_invoke;
  v10[3] = &unk_2510448D8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "firstWhere:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

uint64_t __57__IRCandidateDO_Extensions__isSameICloudWithSystemState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "rapportDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iCloudId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iCloudId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)isFirstPartyDevice
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IRCandidateDO nodes](self, "nodes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "avOutputDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7
          && (objc_msgSend(v7, "deviceSubType") == 13
           || objc_msgSend(v8, "deviceSubType") == 18
           || objc_msgSend(v8, "deviceSubType") == 19
           || objc_msgSend(v8, "deviceSubType") == 12))
        {

          v9 = 1;
          goto LABEL_16;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (BOOL)containsAirplayTarget
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;

  +[IRPreferences shared](IRPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideIsAirplayForCandidateIDArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateDO candidateIdentifier](self, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) != 0)
    return 1;
  -[IRCandidateDO nodes](self, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstWhere:", &__block_literal_global_30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9 != 0;

  return v7;
}

uint64_t __50__IRCandidateDO_Extensions__containsAirplayTarget__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceTypeExistsAirplay");
}

- (BOOL)containsNonAirplayTarget
{
  void *v2;
  void *v3;
  BOOL v4;

  -[IRCandidateDO nodes](self, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstWhere:", &__block_literal_global_31_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __53__IRCandidateDO_Extensions__containsNonAirplayTarget__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceTypeExistsNotAirplay");
}

- (IRCandidateDO)initWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IRCandidateDO *v17;
  IRCandidateDO *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IRCandidateDO;
  v17 = -[IRCandidateDO init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_lastSeenDate, a3);
    objc_storeStrong((id *)&v18->_lastUsedDate, a4);
    objc_storeStrong((id *)&v18->_firstSeenDate, a5);
    objc_storeStrong((id *)&v18->_candidateIdentifier, a6);
    objc_storeStrong((id *)&v18->_nodes, a7);
  }

  return v18;
}

+ (IRCandidateDO)candidateDOWithLastSeenDate:(id)a3 lastUsedDate:(id)a4 firstSeenDate:(id)a5 candidateIdentifier:(id)a6 nodes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v16, v15, v14, v13, v12);

  return (IRCandidateDO *)v17;
}

- (id)copyWithReplacementLastSeenDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v4, self->_lastUsedDate, self->_firstSeenDate, self->_candidateIdentifier, self->_nodes);

  return v5;
}

- (id)copyWithReplacementLastUsedDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", self->_lastSeenDate, v4, self->_firstSeenDate, self->_candidateIdentifier, self->_nodes);

  return v5;
}

- (id)copyWithReplacementFirstSeenDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", self->_lastSeenDate, self->_lastUsedDate, v4, self->_candidateIdentifier, self->_nodes);

  return v5;
}

- (id)copyWithReplacementCandidateIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", self->_lastSeenDate, self->_lastUsedDate, self->_firstSeenDate, v4, self->_nodes);

  return v5;
}

- (id)copyWithReplacementNodes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", self->_lastSeenDate, self->_lastUsedDate, self->_firstSeenDate, self->_candidateIdentifier, v4);

  return v5;
}

- (BOOL)isEqualToCandidateDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *candidateIdentifier;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSSet *nodes;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_candidateIdentifier != 0;
  objc_msgSend(v4, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    objc_msgSend(v5, "candidateIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](candidateIdentifier, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_nodes != 0;
  objc_msgSend(v5, "nodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    nodes = self->_nodes;
    if (nodes)
    {
      objc_msgSend(v5, "nodes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSSet isEqual:](nodes, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  IRCandidateDO *v4;
  IRCandidateDO *v5;
  BOOL v6;

  v4 = (IRCandidateDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRCandidateDO isEqualToCandidateDO:](self, "isEqualToCandidateDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_candidateIdentifier, "hash");
  return -[NSSet hash](self->_nodes, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRCandidateDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRCandidateDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSeenDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRCandidateDO key \"lastSeenDate\" (expected %@, decoded %@)"), v7, v9, 0);
      v43 = *MEMORY[0x24BDD0FC8];
      v44[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRCandidateDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_15:

LABEL_16:
      v14 = 0;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsedDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRCandidateDO key \"lastUsedDate\" (expected %@, decoded %@)"), v9, v10, 0);
        v41 = *MEMORY[0x24BDD0FC8];
        v42 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRCandidateDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstSeenDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRCandidateDO key \"firstSeenDate\" (expected %@, decoded %@)"), v10, v11, 0);
        v39 = *MEMORY[0x24BDD0FC8];
        v40 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRCandidateDOOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v14 = 0;
        goto LABEL_18;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRCandidateDO key \"candidateIdentifier\" (expected %@, decoded %@)"), v36, v26, 0);
        v37 = *MEMORY[0x24BDD0FC8];
        v38 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRCandidateDOOCNTErrorDomain"), 3, v28);
        objc_msgSend(v4, "failWithError:", v29);

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_16;
    }
    v31 = objc_alloc(MEMORY[0x24BDBCF20]);
    v32 = objc_opt_class();
    v33 = (void *)objc_msgSend(v31, "initWithObjects:", v32, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("nodes"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 || (objc_msgSend(v4, "error"), v35 = (void *)objc_claimAutoreleasedReturnValue(), v35, !v35))
    {
      self = -[IRCandidateDO initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:](self, "initWithLastSeenDate:lastUsedDate:firstSeenDate:candidateIdentifier:nodes:", v5, v7, v9, v10, v34);
      v14 = self;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_17;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *lastSeenDate;
  NSDate *lastUsedDate;
  NSDate *firstSeenDate;
  NSString *candidateIdentifier;
  NSSet *nodes;
  id v10;

  v4 = a3;
  lastSeenDate = self->_lastSeenDate;
  v10 = v4;
  if (lastSeenDate)
  {
    objc_msgSend(v4, "encodeObject:forKey:", lastSeenDate, CFSTR("lastSeenDate"));
    v4 = v10;
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
  {
    objc_msgSend(v10, "encodeObject:forKey:", lastUsedDate, CFSTR("lastUsedDate"));
    v4 = v10;
  }
  firstSeenDate = self->_firstSeenDate;
  if (firstSeenDate)
  {
    objc_msgSend(v10, "encodeObject:forKey:", firstSeenDate, CFSTR("firstSeenDate"));
    v4 = v10;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", candidateIdentifier, CFSTR("candidateIdentifier"));
    v4 = v10;
  }
  nodes = self->_nodes;
  if (nodes)
  {
    objc_msgSend(v10, "encodeObject:forKey:", nodes, CFSTR("nodes"));
    v4 = v10;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRCandidateDO | lastSeenDate:%@ lastUsedDate:%@ firstSeenDate:%@ candidateIdentifier:%@ nodes:%@>"), self->_lastSeenDate, self->_lastUsedDate, self->_firstSeenDate, self->_candidateIdentifier, self->_nodes);
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (NSDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
}

@end
