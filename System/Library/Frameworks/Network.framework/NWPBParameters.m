@implementation NWPBParameters

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NWPBParameters;
  -[NWPBParameters dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBParameters;
  -[NWPBParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *account;
  NSString *effectiveBundleID;
  NSString *effectiveProcessUUID;
  NSString *realProcessUUID;
  NSString *url;
  __int16 has;
  void *v11;
  NWPBEndpoint *localEndpoint;
  void *v13;
  NWPBInterface *requiredInterface;
  void *v15;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_prohibitedInterfaceTypes;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  uint64_t v20;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_prohibitedInterfaceSubTypes;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  NSData *metadata;
  id v55;
  void *v57;
  void *v58;
  void *v59;
  uint64_t dataMode;
  __CFString *v61;
  uint64_t requiredInterfaceType;
  __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  account = self->_account;
  if (account)
    objc_msgSend(v3, "setObject:forKey:", account, CFSTR("account"));
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID)
    objc_msgSend(v4, "setObject:forKey:", effectiveBundleID, CFSTR("effectiveBundleID"));
  effectiveProcessUUID = self->_effectiveProcessUUID;
  if (effectiveProcessUUID)
    objc_msgSend(v4, "setObject:forKey:", effectiveProcessUUID, CFSTR("effectiveProcessUUID"));
  realProcessUUID = self->_realProcessUUID;
  if (realProcessUUID)
    objc_msgSend(v4, "setObject:forKey:", realProcessUUID, CFSTR("realProcessUUID"));
  url = self->_url;
  if (url)
    objc_msgSend(v4, "setObject:forKey:", url, CFSTR("url"));
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ipProtocol);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("ipProtocol"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_88;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_addressFamily);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("addressFamily"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trafficClass);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("trafficClass"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_93;
  }
LABEL_89:
  dataMode = self->_dataMode;
  if (dataMode >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataMode);
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = off_1E14A0AF8[dataMode];
  }
  objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("dataMode"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_97;
  }
LABEL_93:
  requiredInterfaceType = self->_requiredInterfaceType;
  if (requiredInterfaceType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requiredInterfaceType);
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = off_1E14A0B10[requiredInterfaceType];
  }
  objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("requiredInterfaceType"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prohibitExpensive);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("prohibitExpensive"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fastOpen);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("fastOpen"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reduceBuffering);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("reduceBuffering"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_20:
    if ((has & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_longOutstandingQueries);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("longOutstandingQueries"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useAWDL);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("useAWDL"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useP2P);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("useP2P"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reuseLocalAddress);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("reuseLocalAddress"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0)
      goto LABEL_25;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_noFallback);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("noFallback"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_multipathService);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("multipathService"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_keepalive);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("keepalive"));

  }
LABEL_27:
  localEndpoint = self->_localEndpoint;
  if (localEndpoint)
  {
    -[NWPBEndpoint dictionaryRepresentation](localEndpoint, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("localEndpoint"));

  }
  requiredInterface = self->_requiredInterface;
  if (requiredInterface)
  {
    -[NWPBInterface dictionaryRepresentation](requiredInterface, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("requiredInterface"));

  }
  p_prohibitedInterfaceTypes = &self->_prohibitedInterfaceTypes;
  if (self->_prohibitedInterfaceTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_prohibitedInterfaceTypes.count)
    {
      v18 = 0;
      do
      {
        v20 = p_prohibitedInterfaceTypes->list[v18];
        if (v20 < 5)
        {
          v19 = off_1E14A0B10[v20];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_prohibitedInterfaceTypes->list[v18]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addObject:", v19);

        ++v18;
      }
      while (v18 < self->_prohibitedInterfaceTypes.count);
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("prohibitedInterfaceTypes"));

  }
  p_prohibitedInterfaceSubTypes = &self->_prohibitedInterfaceSubTypes;
  if (self->_prohibitedInterfaceSubTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_prohibitedInterfaceSubTypes.count)
    {
      v23 = 0;
      do
      {
        v25 = p_prohibitedInterfaceSubTypes->list[v23];
        if (v25 < 3)
        {
          v24 = off_1E14A0B38[v25];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_prohibitedInterfaceSubTypes->list[v23]);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "addObject:", v24);

        ++v23;
      }
      while (v23 < self->_prohibitedInterfaceSubTypes.count);
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("prohibitedInterfaceSubTypes"));

  }
  if (-[NSMutableArray count](self->_prohibitedInterfaces, "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_prohibitedInterfaces, "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v27 = self->_prohibitedInterfaces;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v86 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
      }
      while (v29);
    }

    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("prohibitedInterfaces"));
  }
  if (-[NSMutableArray count](self->_prohibitedAgents, "count"))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_prohibitedAgents, "count"));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v34 = self->_prohibitedAgents;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v82 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v39);

        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
      }
      while (v36);
    }

    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("prohibitedAgents"));
  }
  if (-[NSMutableArray count](self->_requiredAgents, "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_requiredAgents, "count"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v41 = self->_requiredAgents;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v78 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "dictionaryRepresentation");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v46);

        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      }
      while (v43);
    }

    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("requiredAgents"));
  }
  if (-[NSMutableArray count](self->_preferredAgents, "count"))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_preferredAgents, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v48 = self->_preferredAgents;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v74 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * m), "dictionaryRepresentation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v53);

        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
      }
      while (v50);
    }

    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("preferredAgents"));
  }
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  v55 = v4;

  return v55;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBParametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_account)
    PBDataWriterWriteStringField();
  if (self->_effectiveBundleID)
    PBDataWriterWriteStringField();
  if (self->_effectiveProcessUUID)
    PBDataWriterWriteStringField();
  if (self->_realProcessUUID)
    PBDataWriterWriteStringField();
  if (self->_url)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_70;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_20:
    if ((has & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0)
      goto LABEL_25;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_26:
    PBDataWriterWriteBOOLField();
LABEL_27:
  if (self->_localEndpoint)
    PBDataWriterWriteSubmessage();
  if (self->_requiredInterface)
    PBDataWriterWriteSubmessage();
  if (self->_prohibitedInterfaceTypes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_prohibitedInterfaceTypes.count);
  }
  if (self->_prohibitedInterfaceSubTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_prohibitedInterfaceSubTypes.count);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = self->_prohibitedInterfaces;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = self->_prohibitedAgents;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_requiredAgents;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v20);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_preferredAgents;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v25);
  }

  if (self->_metadata)
    PBDataWriterWriteDataField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 has;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  id v35;
  void *v36;
  id v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  id v44;
  void *v45;
  id v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  id v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t n;
  uint64_t v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_account, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_effectiveBundleID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[NSString copyWithZone:](self->_effectiveProcessUUID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_realProcessUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v12;

  v14 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v14;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_ipProtocol;
    *(_WORD *)(v5 + 196) |= 4u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_56;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 64) = self->_addressFamily;
  *(_WORD *)(v5 + 196) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 172) = self->_trafficClass;
  *(_WORD *)(v5 + 196) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 68) = self->_dataMode;
  *(_WORD *)(v5 + 196) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 168) = self->_requiredInterfaceType;
  *(_WORD *)(v5 + 196) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v5 + 188) = self->_prohibitExpensive;
  *(_WORD *)(v5 + 196) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  *(_BYTE *)(v5 + 184) = self->_fastOpen;
  *(_WORD *)(v5 + 196) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  *(_BYTE *)(v5 + 189) = self->_reduceBuffering;
  *(_WORD *)(v5 + 196) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v5 + 186) = self->_longOutstandingQueries;
  *(_WORD *)(v5 + 196) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 191) = self->_useAWDL;
  *(_WORD *)(v5 + 196) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v5 + 192) = self->_useP2P;
  *(_WORD *)(v5 + 196) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 190) = self->_reuseLocalAddress;
  *(_WORD *)(v5 + 196) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  *(_BYTE *)(v5 + 187) = self->_noFallback;
  *(_WORD *)(v5 + 196) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_67:
  *(_DWORD *)(v5 + 112) = self->_multipathService;
  *(_WORD *)(v5 + 196) |= 8u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 185) = self->_keepalive;
    *(_WORD *)(v5 + 196) |= 0x80u;
  }
LABEL_17:
  v17 = -[NWPBEndpoint copyWithZone:](self->_localEndpoint, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v17;

  v19 = -[NWPBInterface copyWithZone:](self->_requiredInterface, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v19;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v21 = self->_prohibitedInterfaces;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v74 != v24)
          objc_enumerationMutation(v21);
        v26 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "copyWithZone:", a3);
        v27 = *(void **)(v5 + 136);
        if (!v27)
        {
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = *(void **)(v5 + 136);
          *(_QWORD *)(v5 + 136) = v28;

          v27 = *(void **)(v5 + 136);
        }
        objc_msgSend(v27, "addObject:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    }
    while (v23);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v30 = self->_prohibitedAgents;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v70 != v33)
          objc_enumerationMutation(v30);
        v35 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "copyWithZone:", a3);
        v36 = *(void **)(v5 + 128);
        if (!v36)
        {
          v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v38 = *(void **)(v5 + 128);
          *(_QWORD *)(v5 + 128) = v37;

          v36 = *(void **)(v5 + 128);
        }
        objc_msgSend(v36, "addObject:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v32);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v39 = self->_requiredAgents;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(v39);
        v44 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * k), "copyWithZone:", a3);
        v45 = *(void **)(v5 + 152);
        if (!v45)
        {
          v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v47 = *(void **)(v5 + 152);
          *(_QWORD *)(v5 + 152) = v46;

          v45 = *(void **)(v5 + 152);
        }
        objc_msgSend(v45, "addObject:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v41);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v48 = self->_preferredAgents;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v62;
    if (v5)
    {
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(v48);
          v53 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v61);
          v54 = *(void **)(v5 + 120);
          if (!v54)
          {
            v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v56 = *(void **)(v5 + 120);
            *(_QWORD *)(v5 + 120) = v55;

            v54 = *(void **)(v5 + 120);
          }
          objc_msgSend(v54, "addObject:", v53);

        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v50);
    }
    else
    {
      do
      {
        for (n = 0; n != v50; ++n)
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(v48);

        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v50);
    }
  }

  v58 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v58;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *account;
  NSString *effectiveBundleID;
  NSString *effectiveProcessUUID;
  NSString *realProcessUUID;
  NSString *url;
  __int16 has;
  __int16 v11;
  NWPBEndpoint *localEndpoint;
  NWPBInterface *requiredInterface;
  NSMutableArray *prohibitedInterfaces;
  NSMutableArray *prohibitedAgents;
  NSMutableArray *requiredAgents;
  NSMutableArray *preferredAgents;
  NSData *metadata;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_130;
  account = self->_account;
  if ((unint64_t)account | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](account, "isEqual:"))
      goto LABEL_130;
  }
  effectiveBundleID = self->_effectiveBundleID;
  if ((unint64_t)effectiveBundleID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](effectiveBundleID, "isEqual:"))
      goto LABEL_130;
  }
  effectiveProcessUUID = self->_effectiveProcessUUID;
  if ((unint64_t)effectiveProcessUUID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](effectiveProcessUUID, "isEqual:"))
      goto LABEL_130;
  }
  realProcessUUID = self->_realProcessUUID;
  if ((unint64_t)realProcessUUID | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](realProcessUUID, "isEqual:"))
      goto LABEL_130;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_130;
  }
  has = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 98);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_ipProtocol != *((_DWORD *)v4 + 22))
      goto LABEL_130;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_addressFamily != *((_DWORD *)v4 + 16))
      goto LABEL_130;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_trafficClass != *((_DWORD *)v4 + 43))
      goto LABEL_130;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_dataMode != *((_DWORD *)v4 + 17))
      goto LABEL_130;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_requiredInterfaceType != *((_DWORD *)v4 + 42))
      goto LABEL_130;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x400) == 0)
      goto LABEL_130;
    if (self->_prohibitExpensive)
    {
      if (!*((_BYTE *)v4 + 188))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 188))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0)
      goto LABEL_130;
    if (self->_fastOpen)
    {
      if (!*((_BYTE *)v4 + 184))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 184))
    {
      goto LABEL_130;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x800) == 0)
      goto LABEL_130;
    if (self->_reduceBuffering)
    {
      if (!*((_BYTE *)v4 + 189))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 189))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x100) == 0)
      goto LABEL_130;
    if (self->_longOutstandingQueries)
    {
      if (!*((_BYTE *)v4 + 186))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 186))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x2000) == 0)
      goto LABEL_130;
    if (self->_useAWDL)
    {
      if (!*((_BYTE *)v4 + 191))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 191))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x4000) == 0)
      goto LABEL_130;
    if (self->_useP2P)
    {
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 192))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x4000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x1000) == 0)
      goto LABEL_130;
    if (self->_reuseLocalAddress)
    {
      if (!*((_BYTE *)v4 + 190))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 190))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x200) == 0)
      goto LABEL_130;
    if (self->_noFallback)
    {
      if (!*((_BYTE *)v4 + 187))
        goto LABEL_130;
    }
    else if (*((_BYTE *)v4 + 187))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_multipathService != *((_DWORD *)v4 + 28))
      goto LABEL_130;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x80) == 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_114;
LABEL_130:
    v19 = 0;
    goto LABEL_131;
  }
  if ((v11 & 0x80) == 0)
    goto LABEL_130;
  if (!self->_keepalive)
  {
    if (!*((_BYTE *)v4 + 185))
      goto LABEL_114;
    goto LABEL_130;
  }
  if (!*((_BYTE *)v4 + 185))
    goto LABEL_130;
LABEL_114:
  localEndpoint = self->_localEndpoint;
  if ((unint64_t)localEndpoint | *((_QWORD *)v4 + 12) && !-[NWPBEndpoint isEqual:](localEndpoint, "isEqual:"))
    goto LABEL_130;
  requiredInterface = self->_requiredInterface;
  if ((unint64_t)requiredInterface | *((_QWORD *)v4 + 20))
  {
    if (!-[NWPBInterface isEqual:](requiredInterface, "isEqual:"))
      goto LABEL_130;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_130;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_130;
  prohibitedInterfaces = self->_prohibitedInterfaces;
  if ((unint64_t)prohibitedInterfaces | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](prohibitedInterfaces, "isEqual:"))
      goto LABEL_130;
  }
  prohibitedAgents = self->_prohibitedAgents;
  if ((unint64_t)prohibitedAgents | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](prohibitedAgents, "isEqual:"))
      goto LABEL_130;
  }
  requiredAgents = self->_requiredAgents;
  if ((unint64_t)requiredAgents | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](requiredAgents, "isEqual:"))
      goto LABEL_130;
  }
  preferredAgents = self->_preferredAgents;
  if ((unint64_t)preferredAgents | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](preferredAgents, "isEqual:"))
      goto LABEL_130;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 13))
    v19 = -[NSData isEqual:](metadata, "isEqual:");
  else
    v19 = 1;
LABEL_131:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  __int16 has;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = -[NSString hash](self->_account, "hash");
  v4 = -[NSString hash](self->_effectiveBundleID, "hash");
  v5 = -[NSString hash](self->_effectiveProcessUUID, "hash");
  v6 = -[NSString hash](self->_realProcessUUID, "hash");
  v7 = -[NSString hash](self->_url, "hash");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v9 = 2654435761 * self->_ipProtocol;
    if ((has & 1) != 0)
    {
LABEL_3:
      v10 = 2654435761 * self->_addressFamily;
      if ((has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else
  {
    v9 = 0;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v11 = 2654435761 * self->_trafficClass;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v12 = 2654435761 * self->_dataMode;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v13 = 2654435761 * self->_requiredInterfaceType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v14 = 2654435761 * self->_prohibitExpensive;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v15 = 2654435761 * self->_fastOpen;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v16 = 2654435761 * self->_reduceBuffering;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v17 = 2654435761 * self->_longOutstandingQueries;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_11:
    v18 = 2654435761 * self->_useAWDL;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    v19 = 2654435761 * self->_useP2P;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    v20 = 2654435761 * self->_reuseLocalAddress;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    v21 = 2654435761 * self->_noFallback;
    if ((has & 8) != 0)
      goto LABEL_15;
LABEL_30:
    v22 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_16;
LABEL_31:
    v23 = 0;
    goto LABEL_32;
  }
LABEL_29:
  v21 = 0;
  if ((has & 8) == 0)
    goto LABEL_30;
LABEL_15:
  v22 = 2654435761 * self->_multipathService;
  if ((has & 0x80) == 0)
    goto LABEL_31;
LABEL_16:
  v23 = 2654435761 * self->_keepalive;
LABEL_32:
  v24 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10;
  v25 = v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ -[NWPBEndpoint hash](self->_localEndpoint, "hash");
  v26 = v24 ^ v25 ^ -[NWPBInterface hash](self->_requiredInterface, "hash");
  v27 = PBRepeatedInt32Hash();
  v28 = v27 ^ PBRepeatedInt32Hash();
  v29 = v28 ^ -[NSMutableArray hash](self->_prohibitedInterfaces, "hash");
  v30 = v29 ^ -[NSMutableArray hash](self->_prohibitedAgents, "hash");
  v31 = v30 ^ -[NSMutableArray hash](self->_requiredAgents, "hash");
  v32 = v26 ^ v31 ^ -[NSMutableArray hash](self->_preferredAgents, "hash");
  return v32 ^ -[NSData hash](self->_metadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_requiredInterface, 0);
  objc_storeStrong((id *)&self->_requiredAgents, 0);
  objc_storeStrong((id *)&self->_realProcessUUID, 0);
  objc_storeStrong((id *)&self->_prohibitedInterfaces, 0);
  objc_storeStrong((id *)&self->_prohibitedAgents, 0);
  objc_storeStrong((id *)&self->_preferredAgents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_effectiveProcessUUID, 0);
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
