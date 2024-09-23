@implementation AAFamilyDetailsResponse

- (AAFamilyDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAFamilyDetailsResponse *v4;
  AAFamilyDetailsResponse *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  AAFamilyMember *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  NSArray *members;
  void *v36;
  void *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  AAFamilyInvite *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSArray *invites;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  AAFamilyInvite *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSArray *v67;
  NSArray *v68;
  NSArray *v69;
  void *v70;
  void *v71;
  NSArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  AAFamilyMember *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSArray *pendingMembers;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSString *addMemberInstructions;
  uint64_t v90;
  NSString *childAccountPrompt;
  uint64_t v92;
  NSString *childAccountButtonTitle;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id obj;
  id obja;
  id objb;
  id objc;
  AAFamilyDetailsResponse *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  objc_super v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v120.receiver = self;
  v120.super_class = (Class)AAFamilyDetailsResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v120, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4 && -[NSHTTPURLResponse statusCode](v4->super._httpResponse, "statusCode") == 200)
  {
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("family-members"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v98 = v7;
    v103 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      obj = v7;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v117;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v117 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
            v14 = objc_alloc_init(AAFamilyMember);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-first-name"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setFirstName:](v14, "setFirstName:", v15);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-last-name"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setLastName:](v14, "setLastName:", v16);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-apple-id"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setAppleID:](v14, "setAppleID:", v17);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-dsid"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setPersonID:](v14, "setPersonID:", v18);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-dsid-hash"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setPersonIDHash:](v14, "setPersonIDHash:", v19);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-altDSID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setAltDSID:](v14, "setAltDSID:", v20);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-is-child-account"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setIsChild:](v14, "setIsChild:", objc_msgSend(v21, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("is-me"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setIsMe:](v14, "setIsMe:", objc_msgSend(v22, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-display-label"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setTitle:](v14, "setTitle:", v23);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("is-itunes-linked"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setIsSharingPurchases:](v14, "setIsSharingPurchases:", objc_msgSend(v24, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-is-organizer"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setIsOrganizer:](v14, "setIsOrganizer:", objc_msgSend(v25, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("itunes-not-linked-message"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setITunesNotLinkedMessage:](v14, "setITunesNotLinkedMessage:", v26);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("linked-itunes-account-appleid"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setLinkediTunesAppleID:](v14, "setLinkediTunesAppleID:", v27);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("linked-itunes-account-dsid"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setLinkediTunesDSID:](v14, "setLinkediTunesDSID:", v28);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("is-ask-to-buy-enabled"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setIsAskToBuyEnabled:](v14, "setIsAskToBuyEnabled:", objc_msgSend(v29, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("is-parental-controls-enabled"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setAreParentalControlsEnabled:](v14, "setAreParentalControlsEnabled:", objc_msgSend(v30, "BOOLValue"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-join-date-epoch"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            v33 = v32 / 1000.0;

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setJoinDate:](v14, "setJoinDate:", v34);
            -[NSArray addObject:](v8, "addObject:", v14);
            v5 = v103;
            if (-[AAFamilyMember isOrganizer](v14, "isOrganizer"))
              objc_storeStrong((id *)&v103->_organizer, v14);
            if (-[AAFamilyMember isMe](v14, "isMe"))
              objc_storeStrong((id *)&v103->_me, v14);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
        }
        while (v10);
      }

      -[NSArray sortUsingComparator:](v8, "sortUsingComparator:", &__block_literal_global_7);
      members = v5->_members;
      v5->_members = v8;

    }
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", CFSTR("family-invitations"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v97 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      obja = v37;
      v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v113 != v41)
              objc_enumerationMutation(obja);
            v43 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
            v44 = objc_alloc_init(AAFamilyInvite);
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("invitee-last-name"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerLastName:](v44, "setOrganizerLastName:", v45);

            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("invitee-first-name"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerFirstName:](v44, "setOrganizerFirstName:", v46);

            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("inviter-email"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerEmail:](v44, "setOrganizerEmail:", v47);

            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("invite-code"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setCode:](v44, "setCode:", v48);

            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("invitee-dsid"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerDSID:](v44, "setOrganizerDSID:", v49);

            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("dsid"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setRecepientDSID:](v44, "setRecepientDSID:", v50);

            -[NSArray addObject:](v38, "addObject:", v44);
          }
          v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
        }
        while (v40);
      }

      v5 = v103;
      invites = v103->_invites;
      v103->_invites = v38;

    }
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKey:", CFSTR("transfer-requests"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v96 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      objb = v53;
      v55 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v109;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v109 != v57)
              objc_enumerationMutation(objb);
            v59 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
            v60 = objc_alloc_init(AAFamilyInvite);
            -[AAFamilyInvite setIsChildTransferInvite:](v60, "setIsChildTransferInvite:", 1);
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("request-code"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setCode:](v60, "setCode:", v61);

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("requestor-first-name"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerFirstName:](v60, "setOrganizerFirstName:", v62);

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("requestor-last-name"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerLastName:](v60, "setOrganizerLastName:", v63);

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("child-first-name"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setChildFirstName:](v60, "setChildFirstName:", v64);

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("child-last-name"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setChildLastName:](v60, "setChildLastName:", v65);

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("requestor-dsid"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyInvite setOrganizerDSID:](v60, "setOrganizerDSID:", v66);

            objc_msgSend(v54, "addObject:", v60);
          }
          v56 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        }
        while (v56);
      }

      v5 = v103;
      v67 = v103->_invites;
      if (v67)
      {
        -[NSArray arrayByAddingObjectsFromArray:](v67, "arrayByAddingObjectsFromArray:", v54);
        v68 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = (NSArray *)v54;
      }
      v53 = v96;
      v69 = v103->_invites;
      v103->_invites = v68;

    }
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectForKey:", CFSTR("pending-members"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v95 = v71;
      objc = v71;
      v73 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v105;
        do
        {
          for (m = 0; m != v74; ++m)
          {
            if (*(_QWORD *)v105 != v75)
              objc_enumerationMutation(objc);
            v77 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * m);
            v78 = objc_alloc_init(AAFamilyMember);
            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("member-invite-email"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setAppleID:](v78, "setAppleID:", v79);

            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("member-display-label"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setTitle:](v78, "setTitle:", v80);

            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("member-first-name"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setFirstName:](v78, "setFirstName:", v81);

            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("member-last-name"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[AAFamilyMember setLastName:](v78, "setLastName:", v82);

            -[NSArray addObject:](v72, "addObject:", v78);
          }
          v74 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
        }
        while (v74);
      }

      v5 = v103;
      pendingMembers = v103->_pendingMembers;
      v103->_pendingMembers = v72;

      v71 = v95;
      v53 = v96;
    }
    -[AAResponse responseDictionary](v5, "responseDictionary", v95);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKey:", CFSTR("family-meta-info"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("add-child-enabled"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_canAddChildMembers = objc_msgSend(v86, "BOOLValue");

        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("add-member-enabled"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_canAddMembers = objc_msgSend(v87, "BOOLValue");

        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("add-family-member-label"));
        v88 = objc_claimAutoreleasedReturnValue();
        addMemberInstructions = v5->_addMemberInstructions;
        v5->_addMemberInstructions = (NSString *)v88;

        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("add-child-sub-label"));
        v90 = objc_claimAutoreleasedReturnValue();
        childAccountPrompt = v5->_childAccountPrompt;
        v5->_childAccountPrompt = (NSString *)v90;

        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("add-child-link-title"));
        v92 = objc_claimAutoreleasedReturnValue();
        childAccountButtonTitle = v5->_childAccountButtonTitle;
        v5->_childAccountButtonTitle = (NSString *)v92;

      }
    }

  }
  return v5;
}

uint64_t __53__AAFamilyDetailsResponse_initWithHTTPResponse_data___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "joinDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "joinDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (int64_t)memberCount
{
  return -[NSArray count](self->_members, "count");
}

- (int64_t)pendingMemberCount
{
  return -[NSArray count](self->_pendingMembers, "count");
}

- (int64_t)pendingInviteCount
{
  return -[NSArray count](self->_invites, "count");
}

- (NSArray)firstNames
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_members, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_members;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isMe", (_QWORD)v12) & 1) == 0)
          {
            objc_msgSend(v9, "firstName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              objc_msgSend(v3, "addObject:", v10);

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (NSArray)members
{
  return self->_members;
}

- (AAFamilyMember)organizer
{
  return self->_organizer;
}

- (AAFamilyMember)me
{
  return self->_me;
}

- (NSArray)invites
{
  return self->_invites;
}

- (NSArray)pendingMembers
{
  return self->_pendingMembers;
}

- (BOOL)canAddMembers
{
  return self->_canAddMembers;
}

- (BOOL)canAddChildMembers
{
  return self->_canAddChildMembers;
}

- (NSString)addMemberInstructions
{
  return self->_addMemberInstructions;
}

- (NSString)childAccountPrompt
{
  return self->_childAccountPrompt;
}

- (NSString)childAccountButtonTitle
{
  return self->_childAccountButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAccountButtonTitle, 0);
  objc_storeStrong((id *)&self->_childAccountPrompt, 0);
  objc_storeStrong((id *)&self->_addMemberInstructions, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_invites, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_organizer, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

@end
