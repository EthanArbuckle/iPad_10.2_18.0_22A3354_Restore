@implementation AMSSubscriptionEntitlement

- (id)exportObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  uint64_t v74;
  void *v75;
  const __CFString *v76;
  void *v77;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSSubscriptionEntitlement autoRenewEnabled](self, "autoRenewEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("autoRenewEnabled"));

  -[AMSSubscriptionEntitlement chargeStoreFrontID](self, "chargeStoreFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("chargeStoreFrontID"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSSubscriptionEntitlement expiration](self, "expiration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expiration"));

  -[AMSSubscriptionEntitlement entitlementOriginType](self, "entitlementOriginType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entitlementOriginType"));

  -[AMSSubscriptionEntitlement entitlementSourceAdamId](self, "entitlementSourceAdamId");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("entitlementSourceAdamId"));

  -[AMSSubscriptionEntitlement externalSubscriptionID](self, "externalSubscriptionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("externalSubscriptionID"));

  -[AMSSubscriptionEntitlement familyRank](self, "familyRank");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("familyRank"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSSubscriptionEntitlement familySubscription](self, "familySubscription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("familySubscription"));

  -[AMSSubscriptionEntitlement featureAccessTypeId](self, "featureAccessTypeId");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("featureAccessTypeId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSSubscriptionEntitlement freeTrialEligible](self, "freeTrialEligible"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("freeTrialEligible"));

  -[AMSSubscriptionEntitlement freeTrialPeriodId](self, "freeTrialPeriodId");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("freeTrialPeriodId"));

  -[AMSSubscriptionEntitlement inAppAdamId](self, "inAppAdamId");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("inAppAdamId"));

  -[AMSSubscriptionEntitlement inAppVersion](self, "inAppVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (void *)v26;
  else
    v28 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("inAppVersion"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSSubscriptionEntitlement initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("initialPurchaseTimestamp"));

  -[AMSSubscriptionEntitlement offerId](self, "offerId");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = (const __CFString *)v31;
  else
    v33 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("offerId"));

  -[AMSSubscriptionEntitlement poolType](self, "poolType");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (const __CFString *)v34;
  else
    v36 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("poolType"));

  -[AMSSubscriptionEntitlement promoScenarioId](self, "promoScenarioId");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("promoScenarioId"));

  v40 = -[AMSSubscriptionEntitlement period](self, "period");
  v41 = MEMORY[0x1E0C9AAB0];
  v42 = MEMORY[0x1E0C9AAA0];
  if ((v40 & 1) != 0)
    v43 = MEMORY[0x1E0C9AAB0];
  else
    v43 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("inTrialPeriod"));
  if ((-[AMSSubscriptionEntitlement period](self, "period") & 2) != 0)
    v44 = v41;
  else
    v44 = v42;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("inOfferPeriod"));
  if ((-[AMSSubscriptionEntitlement period](self, "period") & 4) != 0)
    v45 = v41;
  else
    v45 = v42;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("inGracePeriod"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSSubscriptionEntitlement purchaser](self, "purchaser"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("purchaser"));

  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSSubscriptionEntitlement renewDate](self, "renewDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "timeIntervalSince1970");
  objc_msgSend(v47, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("renewDate"));

  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSSubscriptionEntitlement serviceBeginsTimestamp](self, "serviceBeginsTimestamp");
  objc_msgSend(v50, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("serviceBeginsTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement source](self, "source"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("source"));

  -[AMSSubscriptionEntitlement startDate](self, "startDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("startDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement status](self, "status"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("status"));

  v55 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSSubscriptionEntitlement studentExpirationDate](self, "studentExpirationDate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "timeIntervalSince1970");
  objc_msgSend(v55, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("studentExpirationDate"));

  -[AMSSubscriptionEntitlement subscriptionBundleId](self, "subscriptionBundleId");
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v58;
  if (v58)
    v60 = (void *)v58;
  else
    v60 = &unk_1E25AF9F8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("subscriptionBundleId"));

  -[AMSSubscriptionEntitlement vendorAdHocOfferId](self, "vendorAdHocOfferId");
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v61;
  if (v61)
    v63 = (const __CFString *)v61;
  else
    v63 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("vendorAdHocOfferId"));

  -[AMSSubscriptionEntitlement vendorId](self, "vendorId");
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v64;
  if (v64)
    v66 = (const __CFString *)v64;
  else
    v66 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("vendorId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSSubscriptionEntitlement carrierErrorCode](self, "carrierErrorCode"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("carrierErrorCode"));

  -[AMSSubscriptionEntitlement carrierOperatorName](self, "carrierOperatorName");
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v68;
  if (v68)
    v70 = (const __CFString *)v68;
  else
    v70 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("carrierOperatorName"));

  -[AMSSubscriptionEntitlement carrierPhoneNumber](self, "carrierPhoneNumber");
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v71;
  if (v71)
    v73 = (const __CFString *)v71;
  else
    v73 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("carrierPhoneNumber"));

  -[AMSSubscriptionEntitlement carrierSessionId](self, "carrierSessionId");
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v74;
  if (v74)
    v76 = (const __CFString *)v74;
  else
    v76 = &stru_1E2548760;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("carrierSessionId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement carrierStatus](self, "carrierStatus"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("carrierStatus"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AMSSubscriptionEntitlement *v5;
  AMSSubscriptionEntitlement *v6;
  AMSSubscriptionEntitlement *v7;
  AMSSubscriptionEntitlement *v8;
  char v9;
  AMSSubscriptionEntitlement *v10;
  _BOOL4 v11;
  int64_t v12;
  unsigned int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  _BOOL4 v164;
  int v165;
  _BOOL4 v166;
  int v167;
  int v168;
  _BOOL4 v169;
  int v170;
  int v171;
  _BOOL4 v172;
  int v173;
  _BOOL4 v174;
  int v175;
  _BOOL4 v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  int v180;
  _BOOL4 v181;
  int v182;
  _BOOL4 v183;
  _BOOL4 v184;
  int v185;
  _BOOL4 v186;
  _BYTE v187[20];
  uint64_t v188;
  uint64_t v189;
  int v190;
  int v191;
  int v192;

  v5 = (AMSSubscriptionEntitlement *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v10 = v8;

    if (!v10)
    {
      v9 = 0;
LABEL_138:

      goto LABEL_139;
    }
    v11 = -[AMSSubscriptionEntitlement autoRenewEnabled](self, "autoRenewEnabled");
    if (v11 != -[AMSSubscriptionEntitlement autoRenewEnabled](v10, "autoRenewEnabled"))
      goto LABEL_22;
    v12 = -[AMSSubscriptionEntitlement carrierErrorCode](self, "carrierErrorCode");
    if (v12 != -[AMSSubscriptionEntitlement carrierErrorCode](v10, "carrierErrorCode"))
      goto LABEL_22;
    v13 = -[AMSSubscriptionEntitlement carrierStatus](self, "carrierStatus");
    if (v13 != -[AMSSubscriptionEntitlement carrierStatus](v10, "carrierStatus"))
      goto LABEL_22;
    v14 = -[AMSSubscriptionEntitlement familySubscription](self, "familySubscription");
    if (v14 != -[AMSSubscriptionEntitlement familySubscription](v10, "familySubscription"))
      goto LABEL_22;
    v15 = -[AMSSubscriptionEntitlement freeTrialEligible](self, "freeTrialEligible");
    if (v15 != -[AMSSubscriptionEntitlement freeTrialEligible](v10, "freeTrialEligible"))
      goto LABEL_22;
    -[AMSSubscriptionEntitlement initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
    v17 = v16;
    -[AMSSubscriptionEntitlement initialPurchaseTimestamp](v10, "initialPurchaseTimestamp");
    if (v17 != v18)
      goto LABEL_22;
    v19 = -[AMSSubscriptionEntitlement period](self, "period");
    if (v19 == -[AMSSubscriptionEntitlement period](v10, "period")
      && (v20 = -[AMSSubscriptionEntitlement purchaser](self, "purchaser"),
          v20 == -[AMSSubscriptionEntitlement purchaser](v10, "purchaser"))
      && (-[AMSSubscriptionEntitlement serviceBeginsTimestamp](self, "serviceBeginsTimestamp"),
          v22 = v21,
          -[AMSSubscriptionEntitlement serviceBeginsTimestamp](v10, "serviceBeginsTimestamp"),
          v22 == v23)
      && (v24 = -[AMSSubscriptionEntitlement source](self, "source"),
          v24 == -[AMSSubscriptionEntitlement source](v10, "source"))
      && (v25 = -[AMSSubscriptionEntitlement status](self, "status"),
          v25 == -[AMSSubscriptionEntitlement status](v10, "status")))
    {
      -[AMSSubscriptionEntitlement carrierOperatorName](self, "carrierOperatorName");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v188) = v151 == 0;
      if (v151
        || (-[AMSSubscriptionEntitlement carrierOperatorName](v10, "carrierOperatorName"),
            (v147 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement carrierOperatorName](self, "carrierOperatorName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement carrierOperatorName](v10, "carrierOperatorName");
        v150 = v3;
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v192 = 1;
          v171 = 0;
          LODWORD(v188) = 0;
          *(_OWORD *)v187 = 0uLL;
          v168 = 0;
          v165 = 0;
          v185 = 0;
          v163 = 0;
          v186 = 0;
          v191 = 0;
          v161 = 0;
          v184 = 0;
          v182 = 0;
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          *(_DWORD *)&v187[16] = 1;
          goto LABEL_23;
        }
        *(_DWORD *)&v187[16] = 1;
      }
      else
      {
        v147 = 0;
        *(_DWORD *)&v187[16] = 0;
      }
      -[AMSSubscriptionEntitlement carrierPhoneNumber](self, "carrierPhoneNumber");
      v40 = objc_claimAutoreleasedReturnValue();
      LODWORD(v188) = v40 == 0;
      v148 = (void *)v40;
      if (v40
        || (-[AMSSubscriptionEntitlement carrierPhoneNumber](v10, "carrierPhoneNumber"),
            (v143 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement carrierPhoneNumber](self, "carrierPhoneNumber");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement carrierPhoneNumber](v10, "carrierPhoneNumber");
        v146 = v41;
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = 1;
        if (!objc_msgSend(v41, "isEqual:"))
        {
          v168 = 0;
          *(_DWORD *)&v187[12] = 0;
          *(_QWORD *)v187 = 0;
          v165 = 0;
          v185 = 0;
          v163 = 0;
          v186 = 0;
          v191 = 0;
          v161 = 0;
          v184 = 0;
          v182 = 0;
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          *(_DWORD *)&v187[8] = 1;
          goto LABEL_23;
        }
        *(_DWORD *)&v187[8] = 1;
      }
      else
      {
        v143 = 0;
        *(_DWORD *)&v187[8] = 0;
      }
      -[AMSSubscriptionEntitlement carrierSessionId](self, "carrierSessionId");
      v42 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v187[12] = v42 == 0;
      v144 = (void *)v42;
      if (v42
        || (-[AMSSubscriptionEntitlement carrierSessionId](v10, "carrierSessionId"),
            (v139 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement carrierSessionId](self, "carrierSessionId");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement carrierSessionId](v10, "carrierSessionId");
        v142 = v43;
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = 1;
        if (!objc_msgSend(v43, "isEqual:"))
        {
          v165 = 0;
          *(_DWORD *)&v187[4] = 0;
          v185 = 0;
          v163 = 0;
          v186 = 0;
          v191 = 0;
          v161 = 0;
          v184 = 0;
          v182 = 0;
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          *(_DWORD *)v187 = 1;
          goto LABEL_23;
        }
        *(_DWORD *)v187 = 1;
      }
      else
      {
        v139 = 0;
        *(_DWORD *)v187 = 0;
      }
      -[AMSSubscriptionEntitlement chargeStoreFrontID](self, "chargeStoreFrontID");
      v44 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v187[4] = v44 == 0;
      v140 = (void *)v44;
      if (v44
        || (-[AMSSubscriptionEntitlement chargeStoreFrontID](v10, "chargeStoreFrontID"),
            (v135 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement chargeStoreFrontID](self, "chargeStoreFrontID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement chargeStoreFrontID](v10, "chargeStoreFrontID");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v45;
        v192 = 1;
        if (!objc_msgSend(v45, "isEqual:", v137))
        {
          v163 = 0;
          v186 = 0;
          v191 = 0;
          v161 = 0;
          v184 = 0;
          v182 = 0;
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v185 = 1;
          goto LABEL_23;
        }
        v185 = 1;
      }
      else
      {
        v135 = 0;
        v185 = 0;
      }
      -[AMSSubscriptionEntitlement expiration](self, "expiration");
      v46 = objc_claimAutoreleasedReturnValue();
      v186 = v46 == 0;
      v136 = (void *)v46;
      if (v46
        || (-[AMSSubscriptionEntitlement expiration](v10, "expiration"),
            (v131 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement expiration](self, "expiration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement expiration](v10, "expiration");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = v47;
        v192 = 1;
        if (!objc_msgSend(v47, "isEqual:", v133))
        {
          v161 = 0;
          v184 = 0;
          v182 = 0;
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v191 = 1;
          goto LABEL_23;
        }
        v191 = 1;
      }
      else
      {
        v131 = 0;
        v191 = 0;
      }
      -[AMSSubscriptionEntitlement entitlementOriginType](self, "entitlementOriginType");
      v48 = objc_claimAutoreleasedReturnValue();
      v184 = v48 == 0;
      v132 = (void *)v48;
      if (v48
        || (-[AMSSubscriptionEntitlement entitlementOriginType](v10, "entitlementOriginType"),
            (v127 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement entitlementOriginType](self, "entitlementOriginType");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement entitlementOriginType](v10, "entitlementOriginType");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = v49;
        v192 = 1;
        if (!objc_msgSend(v49, "isEqual:", v129))
        {
          v160 = 0;
          v183 = 0;
          v180 = 0;
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v182 = 1;
          goto LABEL_23;
        }
        v182 = 1;
      }
      else
      {
        v127 = 0;
        v182 = 0;
      }
      -[AMSSubscriptionEntitlement entitlementSourceAdamId](self, "entitlementSourceAdamId");
      v50 = objc_claimAutoreleasedReturnValue();
      v183 = v50 == 0;
      v128 = (void *)v50;
      if (v50
        || (-[AMSSubscriptionEntitlement entitlementSourceAdamId](v10, "entitlementSourceAdamId"),
            (v123 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement entitlementSourceAdamId](self, "entitlementSourceAdamId");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement entitlementSourceAdamId](v10, "entitlementSourceAdamId");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v51;
        v192 = 1;
        if (!objc_msgSend(v51, "isEqual:", v125))
        {
          v158 = 0;
          v181 = 0;
          v179 = 0;
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v180 = 1;
          goto LABEL_23;
        }
        v180 = 1;
      }
      else
      {
        v123 = 0;
        v180 = 0;
      }
      -[AMSSubscriptionEntitlement featureAccessTypeId](self, "featureAccessTypeId");
      v52 = objc_claimAutoreleasedReturnValue();
      v181 = v52 == 0;
      v124 = (void *)v52;
      if (v52
        || (-[AMSSubscriptionEntitlement featureAccessTypeId](v10, "featureAccessTypeId"),
            (v119 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement featureAccessTypeId](self, "featureAccessTypeId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement featureAccessTypeId](v10, "featureAccessTypeId");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v53;
        v192 = 1;
        if (!objc_msgSend(v53, "isEqual:", v121))
        {
          v26 = 0;
          v178 = 0;
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v179 = 1;
          goto LABEL_23;
        }
        LODWORD(v179) = 1;
      }
      else
      {
        v119 = 0;
        LODWORD(v179) = 0;
      }
      -[AMSSubscriptionEntitlement freeTrialPeriodId](self, "freeTrialPeriodId");
      v54 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v179) = v54 == 0;
      v120 = (void *)v54;
      if (v54
        || (-[AMSSubscriptionEntitlement freeTrialPeriodId](v10, "freeTrialPeriodId"),
            (v115 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement freeTrialPeriodId](self, "freeTrialPeriodId");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement freeTrialPeriodId](v10, "freeTrialPeriodId");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v55;
        v192 = 1;
        if (!objc_msgSend(v55, "isEqual:", v117))
        {
          v27 = 0;
          v177 = 0;
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v178 = 1;
          goto LABEL_23;
        }
        LODWORD(v178) = 1;
      }
      else
      {
        v115 = 0;
        LODWORD(v178) = 0;
      }
      -[AMSSubscriptionEntitlement inAppAdamId](self, "inAppAdamId");
      v56 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v178) = v56 == 0;
      v116 = (void *)v56;
      if (v56
        || (-[AMSSubscriptionEntitlement inAppAdamId](v10, "inAppAdamId"),
            (v111 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement inAppAdamId](self, "inAppAdamId");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement inAppAdamId](v10, "inAppAdamId");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v57;
        v192 = 1;
        if (!objc_msgSend(v57, "isEqual:", v113))
        {
          v28 = 0;
          v175 = 0;
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v177 = 1;
          goto LABEL_23;
        }
        LODWORD(v177) = 1;
      }
      else
      {
        v111 = 0;
        LODWORD(v177) = 0;
      }
      -[AMSSubscriptionEntitlement inAppVersion](self, "inAppVersion");
      v58 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v177) = v58 == 0;
      v112 = (void *)v58;
      if (v58
        || (-[AMSSubscriptionEntitlement inAppVersion](v10, "inAppVersion"),
            (v107 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement inAppVersion](self, "inAppVersion");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement inAppVersion](v10, "inAppVersion");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v59;
        v192 = 1;
        if (!objc_msgSend(v59, "isEqual:", v109))
        {
          v157 = 0;
          v176 = 0;
          v173 = 0;
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v175 = 1;
          goto LABEL_23;
        }
        v175 = 1;
      }
      else
      {
        v107 = 0;
        v175 = 0;
      }
      -[AMSSubscriptionEntitlement offerId](self, "offerId");
      v60 = objc_claimAutoreleasedReturnValue();
      v176 = v60 == 0;
      v108 = (void *)v60;
      if (v60
        || (-[AMSSubscriptionEntitlement offerId](v10, "offerId"),
            (v103 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement offerId](self, "offerId");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement offerId](v10, "offerId");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v61;
        v192 = 1;
        if (!objc_msgSend(v61, "isEqual:", v105))
        {
          v155 = 0;
          v174 = 0;
          v170 = 0;
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v173 = 1;
          goto LABEL_23;
        }
        v173 = 1;
      }
      else
      {
        v103 = 0;
        v173 = 0;
      }
      -[AMSSubscriptionEntitlement poolType](self, "poolType");
      v62 = objc_claimAutoreleasedReturnValue();
      v174 = v62 == 0;
      v104 = (void *)v62;
      if (v62
        || (-[AMSSubscriptionEntitlement poolType](v10, "poolType"),
            (v99 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement poolType](self, "poolType");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement poolType](v10, "poolType");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v63;
        v192 = 1;
        if (!objc_msgSend(v63, "isEqual:", v101))
        {
          v153 = 0;
          v172 = 0;
          v167 = 0;
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v170 = 1;
          goto LABEL_23;
        }
        v170 = 1;
      }
      else
      {
        v99 = 0;
        v170 = 0;
      }
      -[AMSSubscriptionEntitlement promoScenarioId](self, "promoScenarioId");
      v64 = objc_claimAutoreleasedReturnValue();
      v172 = v64 == 0;
      v100 = (void *)v64;
      if (v64
        || (-[AMSSubscriptionEntitlement promoScenarioId](v10, "promoScenarioId"),
            (v95 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement promoScenarioId](self, "promoScenarioId");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement promoScenarioId](v10, "promoScenarioId");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v65;
        v192 = 1;
        if (!objc_msgSend(v65, "isEqual:", v97))
        {
          v152 = 0;
          v169 = 0;
          v190 = 0;
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v167 = 1;
          goto LABEL_23;
        }
        v167 = 1;
      }
      else
      {
        v95 = 0;
        v167 = 0;
      }
      -[AMSSubscriptionEntitlement renewDate](self, "renewDate");
      v66 = objc_claimAutoreleasedReturnValue();
      v169 = v66 == 0;
      v96 = (void *)v66;
      if (v66
        || (-[AMSSubscriptionEntitlement renewDate](v10, "renewDate"),
            (v92 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement renewDate](self, "renewDate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement renewDate](v10, "renewDate");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v67;
        v192 = 1;
        if (!objc_msgSend(v67, "isEqual:", v93))
        {
          v154 = 0;
          v166 = 0;
          v162 = 0;
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v152 = 1;
          v190 = 1;
          goto LABEL_23;
        }
        v190 = 1;
      }
      else
      {
        v92 = 0;
        v190 = 0;
      }
      -[AMSSubscriptionEntitlement startDate](self, "startDate");
      v68 = objc_claimAutoreleasedReturnValue();
      v166 = v68 == 0;
      v91 = (void *)v68;
      if (v68
        || (-[AMSSubscriptionEntitlement startDate](v10, "startDate"),
            (v88 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement startDate](self, "startDate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement startDate](v10, "startDate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v69;
        v192 = 1;
        if (!objc_msgSend(v69, "isEqual:", v89))
        {
          v156 = 0;
          v164 = 0;
          v189 = 0;
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v152 = 1;
          v154 = 1;
          v162 = 1;
          goto LABEL_23;
        }
        v162 = 1;
      }
      else
      {
        v88 = 0;
        v162 = 0;
      }
      -[AMSSubscriptionEntitlement subscriptionBundleId](self, "subscriptionBundleId");
      v70 = objc_claimAutoreleasedReturnValue();
      v164 = v70 == 0;
      v87 = (void *)v70;
      if (v70
        || (-[AMSSubscriptionEntitlement subscriptionBundleId](v10, "subscriptionBundleId"),
            (v84 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AMSSubscriptionEntitlement subscriptionBundleId](self, "subscriptionBundleId");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSSubscriptionEntitlement subscriptionBundleId](v10, "subscriptionBundleId");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v71;
        v192 = 1;
        if (!objc_msgSend(v71, "isEqual:", v85))
        {
          v29 = 0;
          v159 = 0;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v9 = 0;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v152 = 1;
          v154 = 1;
          v156 = 1;
          v189 = 1;
          goto LABEL_23;
        }
        LODWORD(v189) = 1;
      }
      else
      {
        v84 = 0;
        LODWORD(v189) = 0;
      }
      -[AMSSubscriptionEntitlement vendorAdHocOfferId](self, "vendorAdHocOfferId");
      v72 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v189) = v72 == 0;
      v83 = (void *)v72;
      if (!v72)
      {
        -[AMSSubscriptionEntitlement vendorAdHocOfferId](v10, "vendorAdHocOfferId");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v82)
        {
          v82 = 0;
          v159 = 0;
          goto LABEL_244;
        }
      }
      -[AMSSubscriptionEntitlement vendorAdHocOfferId](self, "vendorAdHocOfferId");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSubscriptionEntitlement vendorAdHocOfferId](v10, "vendorAdHocOfferId");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v73;
      v192 = 1;
      if (objc_msgSend(v73, "isEqual:", v80))
      {
        v159 = 1;
LABEL_244:
        -[AMSSubscriptionEntitlement vendorId](self, "vendorId");
        v74 = objc_claimAutoreleasedReturnValue();
        v76 = v74 == 0;
        v79 = (void *)v74;
        if (v74
          || (-[AMSSubscriptionEntitlement vendorId](v10, "vendorId"),
              (v77 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[AMSSubscriptionEntitlement vendorId](self, "vendorId");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSSubscriptionEntitlement vendorId](v10, "vendorId");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v75;
          v9 = objc_msgSend(v75, "isEqual:", v3);
          v32 = 1;
          v192 = 1;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v152 = 1;
          v154 = 1;
          v156 = 1;
          v29 = 1;
          v30 = 1;
          v31 = v76;
        }
        else
        {
          v79 = 0;
          v77 = 0;
          v32 = 0;
          v192 = 1;
          v171 = 1;
          v168 = 1;
          v165 = 1;
          v163 = 1;
          v161 = 1;
          v160 = 1;
          v158 = 1;
          v26 = 1;
          v27 = 1;
          v28 = 1;
          v157 = 1;
          v155 = 1;
          v153 = 1;
          v152 = 1;
          v154 = 1;
          v156 = 1;
          v29 = 1;
          v30 = 1;
          v31 = 1;
          v9 = 1;
        }
        goto LABEL_23;
      }
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v9 = 0;
      v171 = 1;
      v168 = 1;
      v165 = 1;
      v163 = 1;
      v161 = 1;
      v160 = 1;
      v158 = 1;
      v26 = 1;
      v27 = 1;
      v28 = 1;
      v157 = 1;
      v155 = 1;
      v153 = 1;
      v152 = 1;
      v154 = 1;
      v156 = 1;
      v29 = 1;
      v159 = 1;
    }
    else
    {
LABEL_22:
      v192 = 0;
      v188 = 0;
      v171 = 0;
      v168 = 0;
      memset(v187, 0, sizeof(v187));
      v165 = 0;
      v185 = 0;
      v163 = 0;
      v186 = 0;
      v191 = 0;
      v161 = 0;
      v184 = 0;
      v182 = 0;
      v160 = 0;
      v183 = 0;
      v180 = 0;
      v158 = 0;
      v181 = 0;
      v179 = 0;
      v26 = 0;
      v178 = 0;
      v27 = 0;
      v177 = 0;
      v28 = 0;
      v175 = 0;
      v157 = 0;
      v176 = 0;
      v173 = 0;
      v155 = 0;
      v174 = 0;
      v170 = 0;
      v153 = 0;
      v172 = 0;
      v167 = 0;
      v152 = 0;
      v169 = 0;
      v190 = 0;
      v154 = 0;
      v166 = 0;
      v162 = 0;
      v156 = 0;
      v164 = 0;
      v189 = 0;
      v29 = 0;
      v159 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v9 = 0;
    }
LABEL_23:
    if (v32)
    {
      v33 = v29;
      v34 = v28;
      v35 = v30;
      v36 = v27;
      v37 = v26;
      v38 = v31;

      v31 = v38;
      v26 = v37;
      v27 = v36;
      v30 = v35;
      v28 = v34;
      v29 = v33;
    }
    if (v31)

    if (v30)
    if (v159)
    {

    }
    if (HIDWORD(v189))

    if (v29)
    if ((_DWORD)v189)
    {

    }
    if (v164)

    if (v156)
    if (v162)
    {

    }
    if (v166)

    if (v154)
    if (v190)
    {

    }
    if (v169)

    if (v152)
    if (v167)
    {

    }
    if (v172)

    if (v153)
    if (v170)
    {

    }
    if (v174)

    if (v155)
    if (v173)
    {

    }
    if (v176)

    if (v157)
    if (v175)
    {

    }
    if (HIDWORD(v177))

    if (v28)
    if ((_DWORD)v177)
    {

    }
    if (HIDWORD(v178))

    if (v27)
    if ((_DWORD)v178)
    {

    }
    if (HIDWORD(v179))

    if (v26)
    if ((_DWORD)v179)
    {

    }
    if (v181)

    if (v158)
    if (v180)
    {

    }
    if (v183)

    if (v160)
    if (v182)
    {

    }
    if (v184)

    if (v161)
    if (v191)
    {

    }
    if (v186)

    if (v163)
    if (v185)
    {

    }
    if (*(_DWORD *)&v187[4])

    if (v165)
    if (*(_DWORD *)v187)
    {

    }
    if (*(_DWORD *)&v187[12])

    if (v168)
    if (*(_DWORD *)&v187[8])
    {

    }
    if ((_DWORD)v188)

    if (v171)
    if (*(_DWORD *)&v187[16])
    {

    }
    if (HIDWORD(v188))

    if (v192)
    goto LABEL_138;
  }
  v9 = 1;
LABEL_139:

  return v9;
}

- (BOOL)autoRenewEnabled
{
  return self->_autoRenewEnabled;
}

- (void)setAutoRenewEnabled:(BOOL)a3
{
  self->_autoRenewEnabled = a3;
}

- (NSNumber)chargeStoreFrontID
{
  return self->_chargeStoreFrontID;
}

- (void)setChargeStoreFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_chargeStoreFrontID, a3);
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (NSString)entitlementOriginType
{
  return self->_entitlementOriginType;
}

- (void)setEntitlementOriginType:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementOriginType, a3);
}

- (NSNumber)entitlementSourceAdamId
{
  return self->_entitlementSourceAdamId;
}

- (void)setEntitlementSourceAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementSourceAdamId, a3);
}

- (NSString)externalSubscriptionID
{
  return self->_externalSubscriptionID;
}

- (void)setExternalSubscriptionID:(id)a3
{
  objc_storeStrong((id *)&self->_externalSubscriptionID, a3);
}

- (NSNumber)familyRank
{
  return self->_familyRank;
}

- (void)setFamilyRank:(id)a3
{
  objc_storeStrong((id *)&self->_familyRank, a3);
}

- (BOOL)familySubscription
{
  return self->_familySubscription;
}

- (void)setFamilySubscription:(BOOL)a3
{
  self->_familySubscription = a3;
}

- (NSNumber)featureAccessTypeId
{
  return self->_featureAccessTypeId;
}

- (void)setFeatureAccessTypeId:(id)a3
{
  objc_storeStrong((id *)&self->_featureAccessTypeId, a3);
}

- (BOOL)freeTrialEligible
{
  return self->_freeTrialEligible;
}

- (void)setFreeTrialEligible:(BOOL)a3
{
  self->_freeTrialEligible = a3;
}

- (NSNumber)freeTrialPeriodId
{
  return self->_freeTrialPeriodId;
}

- (void)setFreeTrialPeriodId:(id)a3
{
  objc_storeStrong((id *)&self->_freeTrialPeriodId, a3);
}

- (NSNumber)inAppAdamId
{
  return self->_inAppAdamId;
}

- (void)setInAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_inAppAdamId, a3);
}

- (NSString)inAppVersion
{
  return self->_inAppVersion;
}

- (void)setInAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_inAppVersion, a3);
}

- (double)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (void)setInitialPurchaseTimestamp:(double)a3
{
  self->_initialPurchaseTimestamp = a3;
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_offerId, a3);
}

- (unint64_t)period
{
  return self->_period;
}

- (void)setPeriod:(unint64_t)a3
{
  self->_period = a3;
}

- (NSString)poolType
{
  return self->_poolType;
}

- (void)setPoolType:(id)a3
{
  objc_storeStrong((id *)&self->_poolType, a3);
}

- (NSNumber)promoScenarioId
{
  return self->_promoScenarioId;
}

- (void)setPromoScenarioId:(id)a3
{
  objc_storeStrong((id *)&self->_promoScenarioId, a3);
}

- (BOOL)purchaser
{
  return self->_purchaser;
}

- (void)setPurchaser:(BOOL)a3
{
  self->_purchaser = a3;
}

- (NSDate)renewDate
{
  return self->_renewDate;
}

- (void)setRenewDate:(id)a3
{
  objc_storeStrong((id *)&self->_renewDate, a3);
}

- (double)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (void)setServiceBeginsTimestamp:(double)a3
{
  self->_serviceBeginsTimestamp = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned int)a3
{
  self->_source = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (NSDate)studentExpirationDate
{
  return self->_studentExpirationDate;
}

- (void)setStudentExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_studentExpirationDate, a3);
}

- (NSNumber)subscriptionBundleId
{
  return self->_subscriptionBundleId;
}

- (void)setSubscriptionBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionBundleId, a3);
}

- (NSString)vendorAdHocOfferId
{
  return self->_vendorAdHocOfferId;
}

- (void)setVendorAdHocOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferId, a3);
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
  objc_storeStrong((id *)&self->_vendorId, a3);
}

- (int64_t)carrierErrorCode
{
  return self->_carrierErrorCode;
}

- (void)setCarrierErrorCode:(int64_t)a3
{
  self->_carrierErrorCode = a3;
}

- (NSString)carrierOperatorName
{
  return self->_carrierOperatorName;
}

- (void)setCarrierOperatorName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierOperatorName, a3);
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (void)setCarrierPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_carrierPhoneNumber, a3);
}

- (NSString)carrierSessionId
{
  return self->_carrierSessionId;
}

- (void)setCarrierSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSessionId, a3);
}

- (unsigned)carrierStatus
{
  return self->_carrierStatus;
}

- (void)setCarrierStatus:(unsigned int)a3
{
  self->_carrierStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSessionId, 0);
  objc_storeStrong((id *)&self->_carrierPhoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierOperatorName, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_vendorAdHocOfferId, 0);
  objc_storeStrong((id *)&self->_subscriptionBundleId, 0);
  objc_storeStrong((id *)&self->_studentExpirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_renewDate, 0);
  objc_storeStrong((id *)&self->_promoScenarioId, 0);
  objc_storeStrong((id *)&self->_poolType, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_inAppVersion, 0);
  objc_storeStrong((id *)&self->_inAppAdamId, 0);
  objc_storeStrong((id *)&self->_freeTrialPeriodId, 0);
  objc_storeStrong((id *)&self->_featureAccessTypeId, 0);
  objc_storeStrong((id *)&self->_familyRank, 0);
  objc_storeStrong((id *)&self->_externalSubscriptionID, 0);
  objc_storeStrong((id *)&self->_entitlementSourceAdamId, 0);
  objc_storeStrong((id *)&self->_entitlementOriginType, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_chargeStoreFrontID, 0);
}

@end
