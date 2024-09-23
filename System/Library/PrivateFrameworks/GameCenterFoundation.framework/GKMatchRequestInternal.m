@implementation GKMatchRequestInternal

- (GKMatchRequestInternal)init
{
  GKMatchRequestInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMatchRequestInternal;
  result = -[GKMatchRequestInternal init](&v3, sel_init);
  if (result)
  {
    result->_matchType = 0;
    result->_playerGroup = 1;
    result->_playerAttributes = -1;
    result->_minPlayers = 2;
    result->_maxPlayers = 2;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  int v50;
  int v51;
  int v52;
  char v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v5 = v4;
  v6 = -[GKMatchRequestInternal minPlayers](self, "minPlayers");
  if (v6 != objc_msgSend(v5, "minPlayers"))
    goto LABEL_15;
  v7 = -[GKMatchRequestInternal maxPlayers](self, "maxPlayers");
  if (v7 != objc_msgSend(v5, "maxPlayers"))
    goto LABEL_15;
  v8 = -[GKMatchRequestInternal defaultNumberOfPlayers](self, "defaultNumberOfPlayers");
  if (v8 != objc_msgSend(v5, "defaultNumberOfPlayers"))
    goto LABEL_15;
  v9 = -[GKMatchRequestInternal matchType](self, "matchType");
  if (v9 != objc_msgSend(v5, "matchType"))
    goto LABEL_15;
  v10 = -[GKMatchRequestInternal playerGroup](self, "playerGroup");
  if (v10 != objc_msgSend(v5, "playerGroup"))
    goto LABEL_15;
  v11 = -[GKMatchRequestInternal playerAttributes](self, "playerAttributes");
  if (v11 != objc_msgSend(v5, "playerAttributes"))
    goto LABEL_15;
  -[GKMatchRequestInternal localPlayerID](self, "localPlayerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPlayerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
    goto LABEL_11;
  -[GKMatchRequestInternal localPlayerID](self, "localPlayerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPlayerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", v15))
  {

LABEL_15:
    goto LABEL_16;
  }
  v102 = v15;
  v103 = v14;
LABEL_11:
  -[GKMatchRequestInternal recipients](self, "recipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
    goto LABEL_18;
  -[GKMatchRequestInternal recipients](self, "recipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToArray:", v19))
  {
    v100 = v19;
    v101 = v18;
LABEL_18:
    -[GKMatchRequestInternal recipientPlayerIDs](self, "recipientPlayerIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientPlayerIDs");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22 != (void *)v23)
    {
      v25 = v13;
      v26 = v17;
      v27 = v16;
      v28 = (void *)v23;
      v29 = v22;
      -[GKMatchRequestInternal recipientPlayerIDs](self, "recipientPlayerIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientPlayerIDs");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v30;
      if (!objc_msgSend(v30, "isEqualToArray:"))
      {
        v31 = 0;
        v22 = v29;
        v24 = v28;
        v16 = v27;
        v17 = v26;
        v13 = v25;
LABEL_66:

LABEL_67:
        v19 = v100;
        v18 = v101;
        if (v16 == v17)
          goto LABEL_69;
        goto LABEL_68;
      }
      v22 = v29;
      v24 = v28;
      v16 = v27;
      v17 = v26;
      v13 = v25;
    }
    -[GKMatchRequestInternal messagesBasedRecipients](self, "messagesBasedRecipients");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagesBasedRecipients");
    v99 = objc_claimAutoreleasedReturnValue();
    v95 = (void *)v32;
    if (v32 != v99)
    {
      -[GKMatchRequestInternal messagesBasedRecipients](self, "messagesBasedRecipients");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messagesBasedRecipients");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v33;
      if (!objc_msgSend(v33, "isEqualToArray:", v88))
      {
        v96 = 0;
        v34 = (void *)v99;
        v35 = v95;
LABEL_64:

LABEL_65:
        v31 = v96;
        if (v22 == v24)
          goto LABEL_67;
        goto LABEL_66;
      }
    }
    -[GKMatchRequestInternal inviteMessage](self, "inviteMessage");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteMessage");
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v36;
    v92 = v17;
    if (v36 != v90)
    {
      -[GKMatchRequestInternal inviteMessage](self, "inviteMessage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inviteMessage");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v37;
      if (!objc_msgSend(v37, "isEqualToString:"))
      {
        v96 = 0;
        v39 = (void *)v90;
        v38 = v91;
        v35 = v95;
LABEL_62:

LABEL_63:
        v34 = (void *)v99;
        v17 = v92;
        if (v35 == (void *)v99)
          goto LABEL_65;
        goto LABEL_64;
      }
    }
    -[GKMatchRequestInternal localizableInviteMessage](self, "localizableInviteMessage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizableInviteMessage");
    v86 = v22;
    v87 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v87)
    {
      v97 = v16;
    }
    else
    {
      v77 = v24;
      -[GKMatchRequestInternal localizableInviteMessage](self, "localizableInviteMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizableInviteMessage");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v41;
      if (!objc_msgSend(v41, "isEqualToDictionary:"))
      {
        v96 = 0;
        v39 = (void *)v90;
        v38 = v91;
        v48 = (void *)v87;
        v24 = v77;
LABEL_60:

LABEL_61:
        v22 = v86;
        v35 = v95;
        if (v38 == v39)
          goto LABEL_63;
        goto LABEL_62;
      }
      v97 = v16;
      v24 = v77;
    }
    -[GKMatchRequestInternal sessionToken](self, "sessionToken");
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionToken");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v42;
    v81 = v40;
    if (v42 == v82)
    {
      v16 = v97;
    }
    else
    {
      -[GKMatchRequestInternal sessionToken](self, "sessionToken");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionToken");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v43;
      v44 = objc_msgSend(v43, "isEqual:");
      v16 = v97;
      if (!v44)
      {
        v45 = 0;
        v46 = (void *)v82;
        v47 = v83;
LABEL_43:
        v96 = v45;

        goto LABEL_59;
      }
    }
    v49 = -[GKMatchRequestInternal version](self, "version");
    if (v49 != objc_msgSend(v5, "version")
      || (v50 = -[GKMatchRequestInternal isPreloadedMatch](self, "isPreloadedMatch"),
          v50 != objc_msgSend(v5, "isPreloadedMatch"))
      || (v51 = -[GKMatchRequestInternal restrictToAutomatch](self, "restrictToAutomatch"),
          v51 != objc_msgSend(v5, "restrictToAutomatch"))
      || (v52 = -[GKMatchRequestInternal isLateJoin](self, "isLateJoin"),
          v52 != objc_msgSend(v5, "isLateJoin")))
    {
      v45 = 0;
      v53 = 0;
      v46 = (void *)v82;
      v47 = v83;
      if (v83 != (void *)v82)
        goto LABEL_43;
LABEL_58:

      v96 = v53;
LABEL_59:
      v40 = v81;
      v48 = (void *)v87;
      v39 = (void *)v90;
      v38 = v91;
      if (v81 == (void *)v87)
        goto LABEL_61;
      goto LABEL_60;
    }
    v72 = v12;
    v73 = v13;
    v98 = v16;
    v78 = v24;
    -[GKMatchRequestInternal queueName](self, "queueName");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queueName");
    v74 = (void *)v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ((void *)v54 != v55)
    {
      -[GKMatchRequestInternal queueName](self, "queueName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queueName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v56;
      if (!objc_msgSend(v56, "isEqualToString:"))
      {
        v57 = 0;
LABEL_56:

LABEL_57:
        v45 = v57;
        v53 = v57;
        v46 = (void *)v82;
        v47 = v83;
        v24 = v78;
        v16 = v98;
        v12 = v72;
        v13 = v73;
        if (v83 != (void *)v82)
          goto LABEL_43;
        goto LABEL_58;
      }
    }
    -[GKMatchRequestInternal properties](self, "properties");
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "properties");
    v59 = (void *)v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if ((void *)v58 == v60
      || (-[GKMatchRequestInternal properties](self, "properties"),
          v61 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "properties"),
          v68 = (void *)objc_claimAutoreleasedReturnValue(),
          v69 = v61,
          objc_msgSend(v61, "isEqualToDictionary:")))
    {
      -[GKMatchRequestInternal recipientProperties](self, "recipientProperties");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientProperties");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v62;
      if (v62 == (void *)v63)
      {

        v57 = 1;
      }
      else
      {
        v65 = (void *)v63;
        -[GKMatchRequestInternal recipientProperties](self, "recipientProperties");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recipientProperties");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v66, "isEqualToDictionary:", v67);

      }
      if (v59 == v60)
      {
LABEL_55:

        if (v74 == v55)
          goto LABEL_57;
        goto LABEL_56;
      }
    }
    else
    {
      v57 = 0;
    }

    goto LABEL_55;
  }
  v31 = 0;
LABEL_68:

LABEL_69:
  if (v12 != v13)
  {

  }
  if ((v31 & 1) != 0)
  {
    v20 = 1;
    goto LABEL_17;
  }
LABEL_16:
  v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[GKMatchRequestInternal minPlayers](self, "minPlayers");
  v4 = (-[GKMatchRequestInternal maxPlayers](self, "maxPlayers") << 20) | (v3 << 26);
  v5 = -[GKMatchRequestInternal matchType](self, "matchType");
  return -[GKMatchRequestInternal version](self, "version") | (v5 << 16) | v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_24 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_24, &__block_literal_global_65);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_24;
}

void __49__GKMatchRequestInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[22];
  _QWORD v25[24];

  v25[22] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("minPlayers");
  v25[0] = objc_opt_class();
  v24[1] = CFSTR("maxPlayers");
  v25[1] = objc_opt_class();
  v24[2] = CFSTR("defaultNumberOfPlayers");
  v25[2] = objc_opt_class();
  v24[3] = CFSTR("playerGroup");
  v25[3] = objc_opt_class();
  v24[4] = CFSTR("playerAttributes");
  v25[4] = objc_opt_class();
  v24[5] = CFSTR("localPlayerID");
  v25[5] = objc_opt_class();
  v24[6] = CFSTR("recipients");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v3;
  v24[7] = CFSTR("recipientPlayerIDs");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("messagesBasedRecipients");
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v11;
  v24[9] = CFSTR("inviteMessage");
  v25[9] = objc_opt_class();
  v24[10] = CFSTR("localizableInviteMessage");
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v15;
  v24[11] = CFSTR("matchType");
  v25[11] = objc_opt_class();
  v24[12] = CFSTR("sessionToken");
  v25[12] = objc_opt_class();
  v24[13] = CFSTR("rid");
  v25[13] = objc_opt_class();
  v24[14] = CFSTR("version");
  v25[14] = objc_opt_class();
  v24[15] = CFSTR("preloadedMatch");
  v25[15] = objc_opt_class();
  v24[16] = CFSTR("restrictToAutomatch");
  v25[16] = objc_opt_class();
  v24[17] = CFSTR("archivedSharePlayInviteeTokensFromProgrammaticInvite");
  v25[17] = objc_opt_class();
  v24[18] = CFSTR("isLateJoin");
  v25[18] = objc_opt_class();
  v24[19] = CFSTR("queueName");
  v25[19] = objc_opt_class();
  v24[20] = CFSTR("properties");
  v16 = (void *)MEMORY[0x1E0C99E60];
  +[GKInternalRepresentation secureCodedJsonTypes](GKInternalRepresentation, "secureCodedJsonTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[20] = v18;
  v24[21] = CFSTR("recipientProperties");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKInternalRepresentation secureCodedJsonTypes](GKInternalRepresentation, "secureCodedJsonTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[21] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 22);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_24;
  secureCodedPropertyKeys_sSecureCodedKeys_24 = v22;

}

- (BOOL)hasGuestPlayers
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[GKMatchRequestInternal recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__GKMatchRequestInternal_hasGuestPlayers__block_invoke;
  v4[3] = &unk_1E75B7F78;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __41__GKMatchRequestInternal_hasGuestPlayers__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isGuestPlayer");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unsigned)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(unsigned __int8)a3
{
  self->_minPlayers = a3;
}

- (unsigned)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(unsigned __int8)a3
{
  self->_maxPlayers = a3;
}

- (unsigned)defaultNumberOfPlayers
{
  return self->_defaultNumberOfPlayers;
}

- (void)setDefaultNumberOfPlayers:(unsigned __int8)a3
{
  self->_defaultNumberOfPlayers = a3;
}

- (unint64_t)playerGroup
{
  return self->_playerGroup;
}

- (void)setPlayerGroup:(unint64_t)a3
{
  self->_playerGroup = a3;
}

- (unsigned)playerAttributes
{
  return self->_playerAttributes;
}

- (void)setPlayerAttributes:(unsigned int)a3
{
  self->_playerAttributes = a3;
}

- (NSString)localPlayerID
{
  return self->_localPlayerID;
}

- (void)setLocalPlayerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSArray)recipientPlayerIDs
{
  return self->_recipientPlayerIDs;
}

- (void)setRecipientPlayerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recipientPlayerIDs, a3);
}

- (NSArray)messagesBasedRecipients
{
  return self->_messagesBasedRecipients;
}

- (void)setMessagesBasedRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_messagesBasedRecipients, a3);
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setInviteMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)localizableInviteMessage
{
  return self->_localizableInviteMessage;
}

- (void)setLocalizableInviteMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableInviteMessage, a3);
}

- (BOOL)restrictToAutomatch
{
  return self->_restrictToAutomatch;
}

- (void)setRestrictToAutomatch:(BOOL)a3
{
  self->_restrictToAutomatch = a3;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(unint64_t)a3
{
  self->_matchType = a3;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSString)rid
{
  return self->_rid;
}

- (void)setRid:(id)a3
{
  objc_storeStrong((id *)&self->_rid, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)isPreloadedMatch
{
  return self->_preloadedMatch;
}

- (void)setPreloadedMatch:(BOOL)a3
{
  self->_preloadedMatch = a3;
}

- (NSData)archivedSharePlayInviteeTokensFromProgrammaticInvite
{
  return self->_archivedSharePlayInviteeTokensFromProgrammaticInvite;
}

- (void)setArchivedSharePlayInviteeTokensFromProgrammaticInvite:(id)a3
{
  objc_storeStrong((id *)&self->_archivedSharePlayInviteeTokensFromProgrammaticInvite, a3);
}

- (BOOL)isLateJoin
{
  return self->_isLateJoin;
}

- (void)setIsLateJoin:(BOOL)a3
{
  self->_isLateJoin = a3;
}

- (NSString)queueName
{
  return self->_queueName;
}

- (void)setQueueName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)recipientProperties
{
  return self->_recipientProperties;
}

- (void)setRecipientProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_queueName, 0);
  objc_storeStrong((id *)&self->_archivedSharePlayInviteeTokensFromProgrammaticInvite, 0);
  objc_storeStrong((id *)&self->_rid, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_localizableInviteMessage, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_messagesBasedRecipients, 0);
  objc_storeStrong((id *)&self->_recipientPlayerIDs, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_localPlayerID, 0);
}

@end
