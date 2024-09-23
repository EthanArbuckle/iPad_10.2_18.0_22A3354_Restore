@implementation CKShareParticipant

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

+ (id)oneTimeURLParticipant
{
  CKUserIdentity *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *inited;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v2 = [CKUserIdentity alloc];
  inited = (void *)objc_msgSend_initInternal(v2, v3, v4, v5);
  objc_msgSend_setHasiCloudAccount_(inited, v7, 0, v8);
  v9 = objc_alloc((Class)objc_opt_class());
  v12 = (void *)objc_msgSend_initInternalWithUserIdentity_(v9, v10, (uint64_t)inited, v11);
  objc_msgSend_setUsesOneTimeURL_(v12, v13, 1, v14);
  CKRandomDataWithLength(0x10uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOneTimeURLSharingKeySeed_(v12, v16, (uint64_t)v15, v17);

  return v12;
}

- (id)initInternal
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKShareParticipant;
  v2 = -[CKShareParticipant init](&v6, sel_init);
  if (v2)
  {
    CKCreateGUID();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v3;

    *(_OWORD *)(v2 + 40) = xmmword_18A83D280;
    *(_OWORD *)(v2 + 88) = xmmword_18A83D280;
    *((_QWORD *)v2 + 3) = 2;
    *((_QWORD *)v2 + 13) = 2;
    *((_QWORD *)v2 + 8) = 1;
  }
  return v2;
}

- (id)initInternalWithUserIdentity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *inited;
  uint64_t v12;
  void *v13;

  v4 = a3;
  inited = (_QWORD *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    v13 = (void *)inited[4];
    inited[4] = v12;

  }
  return inited;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t inited;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_userIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  inited = objc_msgSend_initInternalWithUserIdentity_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_participantID(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_copy(v15, v16, v17, v18);
  v20 = *(void **)(inited + 56);
  *(_QWORD *)(inited + 56) = v19;

  *(_BYTE *)(inited + 9) = objc_msgSend_isCurrentUser(self, v21, v22, v23);
  *(_BYTE *)(inited + 10) = objc_msgSend_isOrgAdminUser(self, v24, v25, v26);
  objc_msgSend_inviterID(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v35 = *(void **)(inited + 80);
  *(_QWORD *)(inited + 80) = v34;

  *(_QWORD *)(inited + 40) = objc_msgSend_role(self, v36, v37, v38);
  *(_QWORD *)(inited + 48) = objc_msgSend_acceptanceStatus(self, v39, v40, v41);
  *(_QWORD *)(inited + 24) = objc_msgSend_permission(self, v42, v43, v44);
  *(_QWORD *)(inited + 88) = objc_msgSend_originalParticipantRole(self, v45, v46, v47);
  *(_QWORD *)(inited + 96) = objc_msgSend_originalAcceptanceStatus(self, v48, v49, v50);
  *(_QWORD *)(inited + 104) = objc_msgSend_originalPermission(self, v51, v52, v53);
  objc_msgSend_protectionInfo(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = *(void **)(inited + 112);
  *(_QWORD *)(inited + 112) = v61;

  objc_msgSend_encryptedPersonalInfo(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_copy(v66, v67, v68, v69);
  v71 = *(void **)(inited + 128);
  *(_QWORD *)(inited + 128) = v70;

  objc_msgSend_invitationToken(self, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_copy(v75, v76, v77, v78);
  v80 = *(void **)(inited + 152);
  *(_QWORD *)(inited + 152) = v79;

  objc_msgSend_protectionInfoPublicKey(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_copy(v84, v85, v86, v87);
  v89 = *(void **)(inited + 120);
  *(_QWORD *)(inited + 120) = v88;

  *(_BYTE *)(inited + 8) = objc_msgSend_wantsNewInvitationToken(self, v90, v91, v92);
  *(_QWORD *)(inited + 64) = objc_msgSend_mutableInvitationTokenStatus(self, v93, v94, v95);
  *(_BYTE *)(inited + 13) = objc_msgSend_isAnonymousInvitedParticipant(self, v96, v97, v98);
  *(_BYTE *)(inited + 15) = objc_msgSend_isApprovedRequester(self, v99, v100, v101);
  objc_msgSend_invitationDate(self, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend_copy(v105, v106, v107, v108);
  v110 = *(void **)(inited + 136);
  *(_QWORD *)(inited + 136) = v109;

  objc_msgSend_oneTimeURLSharingKeySeed(self, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend_copy(v114, v115, v116, v117);
  v119 = *(void **)(inited + 144);
  *(_QWORD *)(inited + 144) = v118;

  *(_BYTE *)(inited + 16) = objc_msgSend_usesOneTimeURL(self, v120, v121, v122);
  return (id)inited;
}

- (BOOL)isEqual:(id)a3
{
  CKShareParticipant *v4;
  CKShareParticipant *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isEquivalentToUserIdentityOrPublicKey;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;

  v4 = (CKShareParticipant *)a3;
  if (v4 == self)
  {
    isEquivalentToUserIdentityOrPublicKey = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = objc_msgSend_role(self, v6, v7, v8);
      if (v9 == objc_msgSend_role(v5, v10, v11, v12))
      {
        objc_msgSend_participantID(self, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v5, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CKObjectsAreBothNilOrEqual(v16, v20);

        if ((v21 & 1) != 0)
        {
          isEquivalentToUserIdentityOrPublicKey = 1;
        }
        else
        {
          objc_msgSend_userIdentity(self, v22, v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_userIdentity(v5, v27, v28, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 == v32)
            isEquivalentToUserIdentityOrPublicKey = 1;
          else
            isEquivalentToUserIdentityOrPublicKey = objc_msgSend_isEquivalentToUserIdentityOrPublicKey_(v26, v30, (uint64_t)v32, v31);

        }
      }
      else
      {
        isEquivalentToUserIdentityOrPublicKey = 0;
      }

    }
    else
    {
      isEquivalentToUserIdentityOrPublicKey = 0;
    }
  }

  return isEquivalentToUserIdentityOrPublicKey;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_participantID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    v10 = objc_msgSend_hash(v5, v6, v7, v8);
    v14 = objc_msgSend_role(self, v11, v12, v13) ^ v10;
  }
  else
  {
    objc_msgSend_userIdentity(self, v6, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_hash(v15, v16, v17, v18);
    v14 = objc_msgSend_role(self, v20, v21, v22) ^ v19;

  }
  return v14;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const __CFString *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const __CFString *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  id v73;

  v73 = a3;
  objc_msgSend_participantID(self, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v73, v7, (uint64_t)CFSTR("participantID"), (uint64_t)v10, 0);
  if (objc_msgSend_isCurrentUser(self, v7, v8, v9))
    objc_msgSend_addProperty_value_shouldRedact_(v73, v11, (uint64_t)CFSTR("isCurrentUser"), (uint64_t)CFSTR("true"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v73, v11, (uint64_t)CFSTR("isCurrentUser"), (uint64_t)CFSTR("false"), 0);
  if (objc_msgSend_isOrgAdminUser(self, v12, v13, v14))
    objc_msgSend_addProperty_value_shouldRedact_(v73, v15, (uint64_t)CFSTR("isOrgAdminUser"), (uint64_t)CFSTR("true"), 0);
  v18 = objc_msgSend_role(self, v15, v16, v17);
  if (v18)
  {
    CKStringFromParticipantRole(v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v73, v23, (uint64_t)CFSTR("role"), (uint64_t)v22, 0);

  }
  v24 = objc_msgSend_permission(self, v19, v20, v21);
  v27 = CFSTR("none");
  switch(v24)
  {
    case 0:
      break;
    case 1:
      goto LABEL_15;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v25, (uint64_t)CFSTR("permission"), (uint64_t)CFSTR("readOnly"), 0);
      break;
    case 3:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v25, (uint64_t)CFSTR("permission"), (uint64_t)CFSTR("readWrite"), 0);
      break;
    case 4:
      v27 = CFSTR("derived");
LABEL_15:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v25, (uint64_t)CFSTR("permission"), (uint64_t)v27, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v25, (uint64_t)CFSTR("permission"), (uint64_t)CFSTR("unknown"), 0);
      break;
  }
  v28 = objc_msgSend_acceptanceStatus(self, v25, v26, (uint64_t)v27);
  v31 = CFSTR("Pending");
  switch(v28)
  {
    case 0:
      break;
    case 1:
      goto LABEL_20;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v29, (uint64_t)CFSTR("acceptanceStatus"), (uint64_t)CFSTR("Accepted"), 0);
      break;
    case 4:
      v31 = CFSTR("Unsubscribed");
LABEL_20:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v29, (uint64_t)CFSTR("acceptanceStatus"), (uint64_t)v31, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v29, (uint64_t)CFSTR("acceptanceStatus"), (uint64_t)CFSTR("Removed"), 0);
      break;
  }
  objc_msgSend_userIdentity(self, v29, v30, (uint64_t)v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v73, v32, (uint64_t)CFSTR("identity"), (uint64_t)v35, 0);
  objc_msgSend_protectionInfo(self, v32, v33, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_length(v36, v37, v38, v39);

  if (v40)
    objc_msgSend_addProperty_value_shouldRedact_(v73, v41, (uint64_t)CFSTR("hasProtectionInfo"), (uint64_t)CFSTR("true"), 0);
  objc_msgSend_invitationToken(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    objc_msgSend_addProperty_value_shouldRedact_(v73, v45, (uint64_t)CFSTR("hasInvitationToken"), (uint64_t)CFSTR("true"), 0);
  objc_msgSend_protectionInfoPublicKey(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_length(v48, v49, v50, v51);

  if (v52)
    objc_msgSend_addProperty_value_shouldRedact_(v73, v53, (uint64_t)CFSTR("hasProtectionInfoPublicKey"), (uint64_t)CFSTR("true"), 0);
  if (objc_msgSend_wantsNewInvitationToken(self, v53, v54, v55))
    objc_msgSend_addProperty_value_shouldRedact_(v73, v56, (uint64_t)CFSTR("wantsNewInvitationToken"), (uint64_t)CFSTR("true"), 0);
  v59 = objc_msgSend_invitationTokenStatus(self, v56, v57, v58);
  v62 = CFSTR("Healthy");
  switch(v59)
  {
    case 0:
      break;
    case 1:
      goto LABEL_35;
    case 2:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v60, (uint64_t)CFSTR("invitationTokenStatus"), (uint64_t)CFSTR("Expired"), 0);
      break;
    case 3:
      v62 = CFSTR("NeedsNewToken");
LABEL_35:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v60, (uint64_t)CFSTR("invitationTokenStatus"), (uint64_t)v62, 0);
      break;
    default:
      objc_msgSend_addProperty_value_shouldRedact_(v73, v60, (uint64_t)CFSTR("invitationTokenStatus"), (uint64_t)CFSTR("Unknown"), 0);
      break;
  }
  if (objc_msgSend_isAnonymousInvitedParticipant(self, v60, v61, (uint64_t)v62))
    objc_msgSend_addProperty_value_shouldRedact_(v73, v63, (uint64_t)CFSTR("isAnonymousInvitedParticipant"), (uint64_t)CFSTR("true"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v73, v63, (uint64_t)CFSTR("isAnonymousInvitedParticipant"), (uint64_t)CFSTR("false"), 0);
  if (objc_msgSend_isApprovedRequester(self, v64, v65, v66))
    objc_msgSend_addProperty_value_shouldRedact_(v73, v67, (uint64_t)CFSTR("isApprovedRequester"), (uint64_t)CFSTR("true"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v73, v67, (uint64_t)CFSTR("isApprovedRequester"), (uint64_t)CFSTR("false"), 0);
  objc_msgSend_invitationDate(self, v68, v69, v70);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v73, v71, (uint64_t)CFSTR("invitationDate"), (uint64_t)v72, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShareParticipant *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShareParticipant *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (NSString)debugDescription
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isCurrentUser;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_super v75;

  v72 = (void *)MEMORY[0x1E0CB3940];
  v75.receiver = self;
  v75.super_class = (Class)CKShareParticipant;
  -[CKShareParticipant description](&v75, sel_description);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantID(self, v3, v4, v5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  isCurrentUser = objc_msgSend_isCurrentUser(self, v6, v7, v8);
  objc_msgSend_inviterID(self, v10, v11, v12);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_role(self, v13, v14, v15);
  CKStringFromParticipantRole(v16, v17, v18, v19);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_permission(self, v20, v21, v22);
  if ((unint64_t)(v23 - 1) > 3)
    v27 = CFSTR("unknown");
  else
    v27 = off_1E1F64B18[v23 - 1];
  v69 = v27;
  v28 = objc_msgSend_acceptanceStatus(self, v24, v25, v26);
  if (v28 > 4)
    v32 = CFSTR("Removed");
  else
    v32 = off_1E1F64B38[v28];
  v68 = v32;
  objc_msgSend_userIdentity(self, v29, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_length(v37, v38, v39, v40);
  objc_msgSend_invitationToken(self, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_invitationTokenStatus(self, v46, v47, v48) - 1;
  if (v52 > 2)
    v53 = CFSTR("Unknown");
  else
    v53 = off_1E1F64B60[v52];
  v54 = CFSTR("true");
  if (isCurrentUser)
    v55 = CFSTR("true");
  else
    v55 = CFSTR("false");
  if (objc_msgSend_isAnonymousInvitedParticipant(self, v49, v50, v51))
    v59 = CFSTR("true");
  else
    v59 = CFSTR("false");
  if (!objc_msgSend_isApprovedRequester(self, v56, v57, v58))
    v54 = CFSTR("false");
  objc_msgSend_invitationDate(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v72, v64, (uint64_t)CFSTR("[%@ participantID=\"%@\", isCurrentUser=\"%@\", inviterID=\"%@\", role=\"%@\", permission=\"%@\", acceptanceStatus=\"%@\", identity=\"%@\", protectionInfo=(%lu bytes), invitationToken=\"%@\", invitationTokenStatus=\"%@\", isAnonymousInvitedParticipant=\"%@\", isApprovedRequester=\"%@\", invitationDate=\"%@\"]"), v65, v74, v73, v55, v71, v70, v69, v68, v33, v41, v45, v53, v59, v54, v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v66;
}

- (void)_stripPersonalInfo
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  if (objc_msgSend_createdInProcess(self, a2, v2, v3) && objc_msgSend_role(self, v5, v6, v7) == 1)
  {
    objc_msgSend_userIdentity(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lookupInfo(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__stripPersonalInfo(v12, v13, v14, v15);

  }
  if (objc_msgSend_acceptedInProcess(self, v5, v6, v7))
  {
    v22 = (id)objc_opt_new();
    objc_msgSend_userIdentity(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNameComponents_(v19, v20, (uint64_t)v22, v21);

  }
}

- (CKShareParticipantType)type
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v4 = objc_msgSend_role(self, a2, v2, v3);
  if (v4 > 4)
    return 0;
  else
    return qword_18A83D2A0[v4];
}

- (void)setType:(CKShareParticipantType)type
{
  uint64_t v3;

  if ((unint64_t)(type - 1) > 3)
    objc_msgSend_setRole_(self, a2, 0, v3);
  else
    objc_msgSend_setRole_(self, a2, qword_18A83D2C8[type - 1], v3);
}

- (CKShareParticipantPermission)permission
{
  CKShareParticipant *v2;
  CKShareParticipantPermission permission;

  v2 = self;
  objc_sync_enter(v2);
  permission = v2->_permission;
  objc_sync_exit(v2);

  return permission;
}

- (void)setPermission:(CKShareParticipantPermission)permission
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKShareParticipant *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  CKShareParticipant *obj;

  obj = self;
  objc_sync_enter(obj);
  v7 = obj;
  if (obj->_permission != permission)
  {
    if (permission == CKShareParticipantPermissionUnknown)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v9, (uint64_t)"-[CKShareParticipant setPermission:]", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v8, v12, (uint64_t)v11, (uint64_t)CFSTR("CKShareParticipant.m"), 355, CFSTR("Invalid participant permission CKShareParticipantPermissionUnknown"));

      v7 = obj;
    }
    v7->_permission = permission;
  }
  objc_sync_exit(v7);

}

- (id)unifiedContactsInStore:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  uint64_t v86;
  id v87;
  id v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  char *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  char *v103;
  const char *v104;
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v105 = a3;
  v8 = a4;
  objc_msgSend_userIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lookupInfo(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  objc_msgSend_emailAddress(v16, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v27 = sub_18A77B048(v23, v24, v25, v26);
    objc_msgSend_emailAddress(v16, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateForContactsMatchingEmailAddress_(v27, v32, (uint64_t)v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v37 = objc_msgSend_addObject_(v18, v35, (uint64_t)v34, v36);
      v110 = 0;
      v111 = (uint64_t)&v110;
      v112 = 0x2020000000;
      v41 = (uint64_t *)qword_1ECD96C80;
      v113 = (uint64_t (*)(uint64_t, uint64_t))qword_1ECD96C80;
      if (!qword_1ECD96C80)
      {
        v42 = sub_18A77BB98(v37, v38, v39, v40);
        v41 = (uint64_t *)dlsym(v42, "CNContactEmailAddressesKey");
        *(_QWORD *)(v111 + 24) = v41;
        qword_1ECD96C80 = (uint64_t)v41;
      }
      _Block_object_dispose(&v110, 8);
      if (!v41)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v43, v44, v45);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v94, (uint64_t)"NSString *getCNContactEmailAddressesKey(void)", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = dlerror();
        objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v93, v98, (uint64_t)v96, (uint64_t)CFSTR("CKShareParticipant.m"), 27, CFSTR("%s"), v97);

        goto LABEL_35;
      }
      if (*v41)
        objc_msgSend_addObject_(v17, v43, *v41, v45);
    }

  }
  objc_msgSend_phoneNumber(v16, v24, v25, v26);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
    goto LABEL_21;
  v120 = 0;
  v121 = &v120;
  v122 = 0x2050000000;
  v50 = (void *)qword_1ECD96C88;
  v123 = qword_1ECD96C88;
  if (!qword_1ECD96C88)
  {
    v110 = MEMORY[0x1E0C809B0];
    v111 = 3221225472;
    v112 = (uint64_t)sub_18A77BC9C;
    v113 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E1F5F618;
    v114 = (void (*)(uint64_t))&v120;
    sub_18A77BC9C((uint64_t)&v110, v47, v48, v49);
    v50 = (void *)v121[3];
  }
  v51 = objc_retainAutorelease(v50);
  _Block_object_dispose(&v120, 8);
  objc_msgSend_phoneNumber(v16, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumberWithStringValue_(v51, v56, (uint64_t)v55, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v63 = sub_18A77B048(v59, v60, v61, v62);
    objc_msgSend_predicateForContactsMatchingPhoneNumber_(v63, v64, (uint64_t)v58, v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v68)
    {
LABEL_19:

      goto LABEL_20;
    }
    v69 = objc_msgSend_addObject_(v18, v66, (uint64_t)v68, v67);
    v110 = 0;
    v111 = (uint64_t)&v110;
    v112 = 0x2020000000;
    v73 = (uint64_t *)qword_1ECD96C90;
    v113 = (uint64_t (*)(uint64_t, uint64_t))qword_1ECD96C90;
    if (!qword_1ECD96C90)
    {
      v74 = sub_18A77BB98(v69, v70, v71, v72);
      v73 = (uint64_t *)dlsym(v74, "CNContactPhoneNumbersKey");
      *(_QWORD *)(v111 + 24) = v73;
      qword_1ECD96C90 = (uint64_t)v73;
    }
    _Block_object_dispose(&v110, 8);
    if (v73)
    {
      if (*v73)
        objc_msgSend_addObject_(v17, v75, *v73, v77);
      goto LABEL_19;
    }
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v75, v76, v77);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v100, (uint64_t)"NSString *getCNContactPhoneNumbersKey(void)", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v99, v104, (uint64_t)v102, (uint64_t)CFSTR("CKShareParticipant.m"), 28, CFSTR("%s"), v103);

LABEL_35:
    __break(1u);
  }
LABEL_20:

LABEL_21:
  v78 = (void *)objc_msgSend_mutableCopy(v8, v47, v48, v49);
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v79 = v17;
  v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v116, (uint64_t)v124, 16);
  if (v83)
  {
    v84 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v83; ++i)
      {
        if (*(_QWORD *)v117 != v84)
          objc_enumerationMutation(v79);
        v86 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
        if ((objc_msgSend_containsObject_(v78, v81, v86, v82) & 1) == 0)
          objc_msgSend_addObject_(v78, v81, v86, v82);
      }
      v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v81, (uint64_t)&v116, (uint64_t)v124, 16);
    }
    while (v83);
  }

  v110 = 0;
  v111 = (uint64_t)&v110;
  v112 = 0x3032000000;
  v113 = sub_18A77B100;
  v114 = sub_18A77B110;
  v115 = 0;
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = sub_18A77B118;
  v106[3] = &unk_1E1F64AB8;
  v87 = v105;
  v107 = v87;
  v88 = v78;
  v108 = v88;
  v109 = &v110;
  objc_msgSend_CKFlatMap_(v18, v89, (uint64_t)v106, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(v111 + 40));

  _Block_object_dispose(&v110, 8);
  return v91;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isCurrentUser;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t isOrgAdminUser;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t isAnonymousInvitedParticipant;
  const char *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t isApprovedRequester;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  id v125;

  v125 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_participantID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v9, (uint64_t)v8, (uint64_t)CFSTR("ParticipantID"));

  objc_msgSend_inviterID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v14, (uint64_t)v13, (uint64_t)CFSTR("InviterID"));

  objc_msgSend_userIdentity(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v19, (uint64_t)v18, (uint64_t)CFSTR("UserIdentity"));

  isCurrentUser = objc_msgSend_isCurrentUser(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v125, v24, isCurrentUser, (uint64_t)CFSTR("IsCurrentUser"));
  isOrgAdminUser = objc_msgSend_isOrgAdminUser(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v125, v29, isOrgAdminUser, (uint64_t)CFSTR("IsOrgAdminUser"));
  v33 = objc_msgSend_role(self, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v125, v34, v33, (uint64_t)CFSTR("Type"));
  v38 = objc_msgSend_acceptanceStatus(self, v35, v36, v37);
  objc_msgSend_encodeInt64_forKey_(v125, v39, v38, (uint64_t)CFSTR("AcceptanceStatus"));
  v43 = objc_msgSend_permission(self, v40, v41, v42);
  objc_msgSend_encodeInt64_forKey_(v125, v44, v43, (uint64_t)CFSTR("Permission"));
  v48 = objc_msgSend_originalParticipantRole(self, v45, v46, v47);
  objc_msgSend_encodeInt64_forKey_(v125, v49, v48, (uint64_t)CFSTR("OriginalParticipantType"));
  v53 = objc_msgSend_originalAcceptanceStatus(self, v50, v51, v52);
  objc_msgSend_encodeInt64_forKey_(v125, v54, v53, (uint64_t)CFSTR("OriginalAcceptanceStatus"));
  v58 = objc_msgSend_originalPermission(self, v55, v56, v57);
  objc_msgSend_encodeInt64_forKey_(v125, v59, v58, (uint64_t)CFSTR("OriginalPermission"));
  objc_msgSend_protectionInfo(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v64, (uint64_t)v63, (uint64_t)CFSTR("ProtectionInfo"));

  objc_msgSend_encryptedPersonalInfo(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v69, (uint64_t)v68, (uint64_t)CFSTR("EncryptedPersonalInfo"));

  v73 = objc_msgSend_createdInProcess(self, v70, v71, v72);
  objc_msgSend_encodeBool_forKey_(v125, v74, v73, (uint64_t)CFSTR("CreatedInProcess"));
  v78 = objc_msgSend_acceptedInProcess(self, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v125, v79, v78, (uint64_t)CFSTR("AcceptedInProcess"));
  objc_msgSend_invitationToken(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v84, (uint64_t)v83, (uint64_t)CFSTR("InvitationToken"));

  objc_msgSend_protectionInfoPublicKey(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v89, (uint64_t)v88, (uint64_t)CFSTR("ProtectionInfoPublicKey"));

  v93 = objc_msgSend_wantsNewInvitationToken(self, v90, v91, v92);
  objc_msgSend_encodeBool_forKey_(v125, v94, v93, (uint64_t)CFSTR("wantsNewInvitationToken"));
  v98 = objc_msgSend_mutableInvitationTokenStatus(self, v95, v96, v97);
  objc_msgSend_encodeInt64_forKey_(v125, v99, v98, (uint64_t)CFSTR("mutableInvitationTokenStatus"));
  isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(self, v100, v101, v102);
  objc_msgSend_encodeBool_forKey_(v125, v104, isAnonymousInvitedParticipant, (uint64_t)CFSTR("isAnonymousInvitedParticipant"));
  isApprovedRequester = objc_msgSend_isApprovedRequester(self, v105, v106, v107);
  objc_msgSend_encodeBool_forKey_(v125, v109, isApprovedRequester, (uint64_t)CFSTR("isApprovedRequester"));
  objc_msgSend_invitationDate(self, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v114, (uint64_t)v113, (uint64_t)CFSTR("invitationDate"));

  v118 = objc_msgSend_usesOneTimeURL(self, v115, v116, v117);
  objc_msgSend_encodeBool_forKey_(v125, v119, v118, (uint64_t)CFSTR("usesOneTimeURL"));
  objc_msgSend_oneTimeURLSharingKeySeed(self, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v125, v124, (uint64_t)v123, (uint64_t)CFSTR("oneTimeURLSharingKeySeed"));

  objc_autoreleasePoolPop(v4);
}

- (CKShareParticipant)initWithCoder:(id)a3
{
  id v4;
  CKShareParticipant *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSString *participantID;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSString *inviterID;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  CKUserIdentity *userIdentity;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  NSData *protectionInfo;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSData *encryptedPersonalInfo;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  NSData *protectionInfoPublicKey;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSDate *invitationDate;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  NSData *oneTimeURLSharingKeySeed;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  objc_super v82;

  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)CKShareParticipant;
  v5 = -[CKShareParticipant init](&v82, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("ParticipantID"));
    v14 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("InviterID"));
    v18 = objc_claimAutoreleasedReturnValue();
    inviterID = v5->_inviterID;
    v5->_inviterID = (NSString *)v18;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("UserIdentity"));
    v22 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (CKUserIdentity *)v22;

    v5->_isCurrentUser = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("IsCurrentUser"), v25);
    v5->_isOrgAdminUser = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("IsOrgAdminUser"), v27);
    v5->_role = objc_msgSend_decodeInt64ForKey_(v4, v28, (uint64_t)CFSTR("Type"), v29);
    v5->_acceptanceStatus = objc_msgSend_decodeInt64ForKey_(v4, v30, (uint64_t)CFSTR("AcceptanceStatus"), v31);
    v5->_permission = objc_msgSend_decodeInt64ForKey_(v4, v32, (uint64_t)CFSTR("Permission"), v33);
    v5->_originalParticipantRole = objc_msgSend_decodeInt64ForKey_(v4, v34, (uint64_t)CFSTR("OriginalParticipantType"), v35);
    v5->_originalAcceptanceStatus = objc_msgSend_decodeInt64ForKey_(v4, v36, (uint64_t)CFSTR("OriginalAcceptanceStatus"), v37);
    v5->_originalPermission = objc_msgSend_decodeInt64ForKey_(v4, v38, (uint64_t)CFSTR("OriginalPermission"), v39);
    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, (uint64_t)CFSTR("ProtectionInfo"));
    v42 = objc_claimAutoreleasedReturnValue();
    protectionInfo = v5->_protectionInfo;
    v5->_protectionInfo = (NSData *)v42;

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("EncryptedPersonalInfo"));
    v46 = objc_claimAutoreleasedReturnValue();
    encryptedPersonalInfo = v5->_encryptedPersonalInfo;
    v5->_encryptedPersonalInfo = (NSData *)v46;

    v5->_createdInProcess = objc_msgSend_decodeBoolForKey_(v4, v48, (uint64_t)CFSTR("CreatedInProcess"), v49);
    v5->_acceptedInProcess = objc_msgSend_decodeBoolForKey_(v4, v50, (uint64_t)CFSTR("AcceptedInProcess"), v51);
    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)CFSTR("InvitationToken"));
    v54 = objc_claimAutoreleasedReturnValue();
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v54;

    v56 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, (uint64_t)CFSTR("ProtectionInfoPublicKey"));
    v58 = objc_claimAutoreleasedReturnValue();
    protectionInfoPublicKey = v5->_protectionInfoPublicKey;
    v5->_protectionInfoPublicKey = (NSData *)v58;

    v5->_wantsNewInvitationToken = objc_msgSend_decodeBoolForKey_(v4, v60, (uint64_t)CFSTR("wantsNewInvitationToken"), v61);
    v5->_isAnonymousInvitedParticipant = objc_msgSend_decodeBoolForKey_(v4, v62, (uint64_t)CFSTR("isAnonymousInvitedParticipant"), v63);
    v5->_isApprovedRequester = objc_msgSend_decodeBoolForKey_(v4, v64, (uint64_t)CFSTR("isApprovedRequester"), v65);
    v66 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("invitationDate"));
    v68 = objc_claimAutoreleasedReturnValue();
    invitationDate = v5->_invitationDate;
    v5->_invitationDate = (NSDate *)v68;

    v5->_usesOneTimeURL = objc_msgSend_decodeBoolForKey_(v4, v70, (uint64_t)CFSTR("usesOneTimeURL"), v71);
    v72 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, (uint64_t)CFSTR("oneTimeURLSharingKeySeed"));
    v74 = objc_claimAutoreleasedReturnValue();
    oneTimeURLSharingKeySeed = v5->_oneTimeURLSharingKeySeed;
    v5->_oneTimeURLSharingKeySeed = (NSData *)v74;

    if (objc_msgSend_containsValueForKey_(v4, v76, (uint64_t)CFSTR("mutableInvitationTokenStatus"), v77))
      v80 = objc_msgSend_decodeInt64ForKey_(v4, v78, (uint64_t)CFSTR("mutableInvitationTokenStatus"), v79);
    else
      v80 = 1;
    v5->_mutableInvitationTokenStatus = v80;
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)setUserIdentity_modelMutation:(id)a3
{
  uint64_t v3;
  CKUserIdentity *v5;
  CKUserIdentity *userIdentity;

  v5 = (CKUserIdentity *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  userIdentity = self->_userIdentity;
  self->_userIdentity = v5;

}

- (CKUserIdentity)userIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (CKShareParticipantRole)role
{
  return self->_role;
}

- (void)setRole:(CKShareParticipantRole)role
{
  self->_role = role;
}

- (CKShareParticipantAcceptanceStatus)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  self->_acceptanceStatus = a3;
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)wantsNewInvitationToken
{
  return self->_wantsNewInvitationToken;
}

- (void)setWantsNewInvitationToken:(BOOL)a3
{
  self->_wantsNewInvitationToken = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (BOOL)isOrgAdminUser
{
  return self->_isOrgAdminUser;
}

- (void)setIsOrgAdminUser:(BOOL)a3
{
  self->_isOrgAdminUser = a3;
}

- (int64_t)mutableInvitationTokenStatus
{
  return self->_mutableInvitationTokenStatus;
}

- (void)setMutableInvitationTokenStatus:(int64_t)a3
{
  self->_mutableInvitationTokenStatus = a3;
}

- (CKRecordID)shareRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setShareRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)inviterID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInviterID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (int64_t)originalParticipantRole
{
  return self->_originalParticipantRole;
}

- (int64_t)originalAcceptanceStatus
{
  return self->_originalAcceptanceStatus;
}

- (int64_t)originalPermission
{
  return self->_originalPermission;
}

- (BOOL)createdInProcess
{
  return self->_createdInProcess;
}

- (void)setCreatedInProcess:(BOOL)a3
{
  self->_createdInProcess = a3;
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  self->_acceptedInProcess = a3;
}

- (NSData)protectionInfo
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProtectionInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)protectionInfoPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setProtectionInfoPublicKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (BOOL)isAnonymousInvitedParticipant
{
  return self->_isAnonymousInvitedParticipant;
}

- (void)setIsAnonymousInvitedParticipant:(BOOL)a3
{
  self->_isAnonymousInvitedParticipant = a3;
}

- (BOOL)forceSendPublicKeyForAnonymousParticipants
{
  return self->_forceSendPublicKeyForAnonymousParticipants;
}

- (void)setForceSendPublicKeyForAnonymousParticipants:(BOOL)a3
{
  self->_forceSendPublicKeyForAnonymousParticipants = a3;
}

- (BOOL)isApprovedRequester
{
  return self->_isApprovedRequester;
}

- (void)setIsApprovedRequester:(BOOL)a3
{
  self->_isApprovedRequester = a3;
}

- (NSDate)invitationDate
{
  return self->_invitationDate;
}

- (void)setInvitationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)usesOneTimeURL
{
  return self->_usesOneTimeURL;
}

- (void)setUsesOneTimeURL:(BOOL)a3
{
  self->_usesOneTimeURL = a3;
}

- (NSData)oneTimeURLSharingKeySeed
{
  return self->_oneTimeURLSharingKeySeed;
}

- (void)setOneTimeURLSharingKeySeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInvitationToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_oneTimeURLSharingKeySeed, 0);
  objc_storeStrong((id *)&self->_invitationDate, 0);
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_protectionInfoPublicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_inviterID, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
