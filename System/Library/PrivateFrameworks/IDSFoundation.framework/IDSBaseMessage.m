@implementation IDSBaseMessage

- (IDSBaseMessage)init
{
  IDSBaseMessage *v2;
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IDSBaseMessage;
  v2 = -[IDSBaseMessage init](&v14, sel_init);
  if (v2)
  {
    v2->_uniqueID = FastRandomUInt();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v2, v7, (uint64_t)v6, v8);

    objc_msgSend_setTimeout_(v2, v9, v10, 20.0);
    objc_msgSend_setHighPriority_(v2, v11, 1, v12);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  unsigned int v17;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  double v67;
  const char *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  const char *v72;
  double v73;
  const char *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  const char *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  const char *v84;
  double v85;
  const char *v86;
  uint64_t v87;
  double v88;
  void *v89;
  const char *v90;
  double v91;
  const char *v92;
  uint64_t v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  const char *v98;
  uint64_t v99;
  double v100;
  const char *v101;
  uint64_t v102;
  double v103;
  const char *v104;
  uint64_t v105;
  double v106;
  void *v107;
  const char *v108;
  double v109;
  const char *v110;
  uint64_t v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  const char *v116;
  uint64_t v117;
  double v118;
  const char *v119;
  uint64_t v120;
  double v121;
  const char *v122;
  uint64_t v123;
  double v124;
  void *v125;
  const char *v126;
  double v127;
  const char *v128;
  uint64_t v129;
  double v130;
  void *v131;
  const char *v132;
  double v133;
  const char *v134;
  uint64_t v135;
  double v136;
  void *v137;
  const char *v138;
  double v139;
  const char *v140;
  uint64_t v141;
  double v142;
  uint64_t v143;
  const char *v144;
  double v145;
  const char *v146;
  uint64_t v147;
  double v148;
  uint64_t v149;
  const char *v150;
  double v151;
  const char *v152;
  uint64_t v153;
  double v154;
  void *v155;
  const char *v156;
  double v157;
  const char *v158;
  uint64_t v159;
  double v160;
  void *v161;
  const char *v162;
  double v163;
  const char *v164;
  uint64_t v165;
  double v166;
  void *v167;
  const char *v168;
  double v169;
  const char *v170;
  uint64_t v171;
  double v172;
  uint64_t hasAttemptedAPSDelivery;
  const char *v174;
  double v175;
  const char *v176;
  uint64_t v177;
  double v178;
  void *v179;
  const char *v180;
  double v181;
  const char *v182;
  uint64_t v183;
  double v184;
  void *v185;
  const char *v186;
  double v187;
  const char *v188;
  uint64_t v189;
  double v190;
  uint64_t v191;
  const char *v192;
  double v193;
  const char *v194;
  uint64_t v195;
  double v196;
  void *v197;
  const char *v198;
  double v199;
  const char *v200;
  uint64_t v201;
  double v202;
  void *v203;
  const char *v204;
  double v205;
  const char *v206;
  uint64_t v207;
  double v208;
  void *v209;
  const char *v210;
  double v211;
  const char *v212;
  uint64_t v213;
  double v214;
  void *v215;
  const char *v216;
  double v217;
  const char *v218;
  uint64_t v219;
  double v220;
  void *v221;
  const char *v222;
  double v223;
  const char *v224;
  uint64_t v225;
  double v226;
  void *v227;
  const char *v228;
  double v229;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_dsAuthID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDSAuthID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_topic(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTopic_(v4, v15, (uint64_t)v14, v16);

  v17 = FastRandomUInt();
  objc_msgSend_setUniqueID_(v4, v18, v17, v19);
  v23 = objc_msgSend_forceCellular(self, v20, v21, v22);
  objc_msgSend_setForceCellular_(v4, v24, v23, v25);
  v29 = objc_msgSend_timeoutRetries(self, v26, v27, v28);
  objc_msgSend_setTimeoutRetries_(v4, v30, v29, v31);
  v35 = objc_msgSend_highPriority(self, v32, v33, v34);
  objc_msgSend_setHighPriority_(v4, v36, v35, v37);
  objc_msgSend_userInfo(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserInfo_(v4, v42, (uint64_t)v41, v43);

  objc_msgSend_serviceData(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceData_(v4, v48, (uint64_t)v47, v49);

  objc_msgSend_clientInfo(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientInfo_(v4, v54, (uint64_t)v53, v55);

  v59 = objc_msgSend_wantsResponse(self, v56, v57, v58);
  objc_msgSend_setWantsResponse_(v4, v60, v59, v61);
  v65 = objc_msgSend_wantsMultipleResponses(self, v62, v63, v64);
  objc_msgSend_setWantsMultipleResponses_(v4, v66, v65, v67);
  v71 = objc_msgSend_httpDoNotDecodeData(self, v68, v69, v70);
  objc_msgSend_setHttpDoNotDecodeData_(v4, v72, v71, v73);
  v77 = objc_msgSend_wantsBinaryPush(self, v74, v75, v76);
  objc_msgSend_setWantsBinaryPush_(v4, v78, v77, v79);
  v83 = objc_msgSend_wantsIntegerUniqueIDs(self, v80, v81, v82);
  objc_msgSend_setWantsIntegerUniqueIDs_(v4, v84, v83, v85);
  objc_msgSend_creationDate(self, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreationDate_(v4, v90, (uint64_t)v89, v91);

  objc_msgSend_context(self, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContext_(v4, v96, (uint64_t)v95, v97);

  objc_msgSend_timeSent(self, v98, v99, v100);
  objc_msgSend_setTimeSent_(v4, v101, v102, v103);
  objc_msgSend_completionBlock(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCompletionBlock_(v4, v108, (uint64_t)v107, v109);

  objc_msgSend_deliveryAcknowledgementBlock(self, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeliveryAcknowledgementBlock_(v4, v114, (uint64_t)v113, v115);

  objc_msgSend_timeout(self, v116, v117, v118);
  objc_msgSend_setTimeout_(v4, v119, v120, v121);
  objc_msgSend_responseAlertInfo(self, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseAlertInfo_(v4, v126, (uint64_t)v125, v127);

  objc_msgSend_retryCount(self, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRetryCount_(v4, v132, (uint64_t)v131, v133);

  objc_msgSend_originalTimestamp(self, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOriginalTimestamp_(v4, v138, (uint64_t)v137, v139);

  v143 = objc_msgSend_importanceLevel(self, v140, v141, v142);
  objc_msgSend_setImportanceLevel_(v4, v144, v143, v145);
  v149 = objc_msgSend_deliveryMechanism(self, v146, v147, v148);
  objc_msgSend_setDeliveryMechanism_(v4, v150, v149, v151);
  objc_msgSend_service(self, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setService_(v4, v156, (uint64_t)v155, v157);

  objc_msgSend_subService(self, v158, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubService_(v4, v162, (uint64_t)v161, v163);

  objc_msgSend_underlyingService(self, v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUnderlyingService_(v4, v168, (uint64_t)v167, v169);

  hasAttemptedAPSDelivery = objc_msgSend_hasAttemptedAPSDelivery(self, v170, v171, v172);
  objc_msgSend_setHasAttemptedAPSDelivery_(v4, v174, hasAttemptedAPSDelivery, v175);
  objc_msgSend_signingSession(self, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSigningSession_(v4, v180, (uint64_t)v179, v181);

  objc_msgSend_URLOverride(self, v182, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setURLOverride_(v4, v186, (uint64_t)v185, v187);

  v191 = objc_msgSend_ignoreMaxRetryCount(self, v188, v189, v190);
  objc_msgSend_setIgnoreMaxRetryCount_(v4, v192, v191, v193);
  objc_msgSend_pushAckTimestamp(self, v194, v195, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPushAckTimestamp_(v4, v198, (uint64_t)v197, v199);

  objc_msgSend_baaSigningDigest(self, v200, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaaSigningDigest_(v4, v204, (uint64_t)v203, v205);

  objc_msgSend_baaSigningError(self, v206, v207, v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaaSigningError_(v4, v210, (uint64_t)v209, v211);

  objc_msgSend_splunkHint(self, v212, v213, v214);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSplunkHint_(v4, v216, (uint64_t)v215, v217);

  objc_msgSend_requestStart(self, v218, v219, v220);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestStart_(v4, v222, (uint64_t)v221, v223);

  objc_msgSend_requestEnd(self, v224, v225, v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestEnd_(v4, v228, (uint64_t)v227, v229);

  return v4;
}

- (NSString)uniqueIDString
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend_uniqueID(self, a2, v2, v3);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)wantsIDSServer
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)wantsJSONBody
{
  return 0;
}

- (BOOL)wantsHTTPHeaders
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return 0;
}

- (BOOL)wantsBagKey
{
  return 0;
}

- (BOOL)wantsCFNetworkTimeout
{
  return 0;
}

- (int)maxTimeoutRetries
{
  return 0;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 0;
}

- (BOOL)wantsManagedRetries
{
  return 1;
}

- (BOOL)wantsAPSRetries
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return -1.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  return 0;
}

- (BOOL)ignoresNetworkConnectivity
{
  return 0;
}

- (BOOL)wantsSignature
{
  return 0;
}

- (BOOL)isWebTunnelMessage
{
  return 0;
}

- (BOOL)wantsBodySignature
{
  return 0;
}

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)wantsIDSSignatures
{
  return 1;
}

- (BOOL)wantsCustomRetryInterval
{
  return 0;
}

- (double)customRetryInterval
{
  return 0.0;
}

- (NSString)dataUsageBundleIdentifier
{
  return 0;
}

- (id)messageBodyDataOverride
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return 1;
}

- (BOOL)isMMLMessage
{
  return 0;
}

- (BOOL)wantsStatusCodeBasedRetries
{
  return 1;
}

- (BOOL)ultraConstrainedAllowed
{
  return 0;
}

- (BOOL)payloadCanBeLogged
{
  return 1;
}

- (BOOL)isValidMessage
{
  return 1;
}

- (NSDictionary)messageBodyUsingCache
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  NSDictionary *cachedBody;
  NSDictionary *v9;

  objc_msgSend__cacheBody(self, a2, v2, v3);
  cachedBody = self->_cachedBody;
  if (cachedBody)
  {
    v9 = cachedBody;
  }
  else
  {
    objc_msgSend_messageBody(self, v5, v6, v7);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)_cacheBody
{
  uint64_t v2;
  double v3;
  NSDictionary *v5;
  NSDictionary *cachedBody;

  if (!self->_cachedBody)
  {
    objc_msgSend_messageBody(self, a2, v2, v3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cachedBody = self->_cachedBody;
    self->_cachedBody = v5;

  }
}

- (void)_clearCache
{
  NSDictionary *cachedBody;

  cachedBody = self->_cachedBody;
  self->_cachedBody = 0;

}

- (void)setRetryCount:(id)a3
{
  NSNumber *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  NSNumber *v9;

  v5 = (NSNumber *)a3;
  if (self->_retryCount != v5)
  {
    v9 = v5;
    objc_msgSend__clearCache(self, v6, v7, v8);
    objc_storeStrong((id *)&self->_retryCount, a3);
    v5 = v9;
  }

}

- (__SecKey)pushPrivateKey
{
  return 0;
}

- (__SecKey)pushPublicKey
{
  return 0;
}

- (NSData)pushCertificate
{
  return 0;
}

- (NSData)pushToken
{
  return 0;
}

- (BOOL)isMultipleAuthCertCapable
{
  return 0;
}

- (NSMutableArray)certDataArray
{
  return 0;
}

- (NSMutableArray)publicKeyArray
{
  return 0;
}

- (NSMutableArray)privateKeyArray
{
  return 0;
}

- (NSMutableArray)userIDArray
{
  return 0;
}

- (__SecKey)identityPrivateKey
{
  return 0;
}

- (__SecKey)identityPublicKey
{
  return 0;
}

- (NSData)IDCertificate
{
  return 0;
}

- (NSNumber)serverTimestamp
{
  return 0;
}

- (NSNumber)serverTimestampReceivedDate
{
  return 0;
}

- (id)overrideContentType
{
  return 0;
}

- (id)parsedIDSMessageResult
{
  return 0;
}

- (BOOL)wantsGZip
{
  return 1;
}

- (BOOL)wantsClientInfo
{
  return 0;
}

- (BOOL)wantsUDID
{
  return 0;
}

- (BOOL)wantsBodySigningOnly
{
  return 0;
}

- (BOOL)ignorePushSigHeaders
{
  return 0;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  IDSBaseMessage *v20;
  id v21;
  id v22;
  const char *v23;
  double v24;
  id v25;
  BOOL v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  double v36;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  IDSBaseMessage *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_requiresPushTokenKeys(self, a2, (uint64_t)a3, v3)
    && (objc_msgSend_pushToken(self, v5, v6, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend_length(v8, v9, v10, v11),
        v8,
        !v12))
  {
    if (a3)
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v5, (uint64_t)CFSTR("push token"), v7);
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    objc_msgSend_requiredKeys(self, v5, v6, v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v39, v13, v14, v15))
    {
      objc_msgSend_messageBodyUsingCache(self, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self;
      v21 = v39;
      v22 = v19;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v21;
      v25 = 0;
      v26 = 1;
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v41, v24, v49, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v42;
        v30 = 138412546;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(obj);
            v32 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend_objectForKey_(v22, v27, v32, *(double *)&v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
            {
              OSLogHandleForIDSCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v32;
                v47 = 2112;
                v48 = v20;
                _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "Missing message key: %@   (Message: %@)", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                  MarcoLog();
                if (IMShouldLog())
                  IMLogString();
              }
              if (_IMWillLog())
                _IMAlwaysLog();
              if (MarcoShouldLogCheckpoints())
                MarcoNoteCheckpoint();
              _IMWarn();
              if (!v25)
                v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend_addObject_(v25, v35, v32, v36, v32, v20);
              v26 = 0;
            }

          }
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v41, *(double *)&v30, v49, 16);
        }
        while (v28);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v25);

    }
    else
    {
      v26 = 1;
    }

  }
  return v26;
}

- (NSArray)requiredKeys
{
  uint64_t v2;
  double v3;

  return (NSArray *)objc_msgSend_array(MEMORY[0x1E0C99D20], a2, v2, v3);
}

- (BOOL)requiresPushTokenKeys
{
  return 0;
}

- (BOOL)wantsUserAgentInHeaders
{
  return 1;
}

- (NSString)userAgentHeaderString
{
  return (NSString *)CFSTR("User-Agent");
}

- (int64_t)command
{
  return 0;
}

- (int64_t)responseCommand
{
  return 0;
}

- (NSString)bagKey
{
  return (NSString *)&stru_1E3C2E4E8;
}

- (NSString)retryCountKey
{
  return (NSString *)CFSTR("rc");
}

- (NSDictionary)additionalMessageHeaders
{
  return 0;
}

- (NSDictionary)additionalQueryStringParameters
{
  return 0;
}

- (NSDictionary)additionalMessageHeadersForOutgoingPush
{
  return 0;
}

- (NSDictionary)nonStandardMessageHeadersForOutgoingPush
{
  return 0;
}

- (NSDictionary)messageBody
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  double v18;
  const void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_serviceData(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service-data"), v7);

  objc_msgSend_clientInfo(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("client-data"), v11);

  objc_msgSend_retryCount(self, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v19 = (const void *)objc_msgSend_retryCountKey(self, v15, v16, v18);
    CFDictionarySetValue(v3, v19, v17);
  }

  objc_msgSend_originalTimestamp(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("oe"), v23);

  if ((objc_msgSend_wantsResponse(self, v24, v25, v26) & 1) == 0)
    CFDictionarySetValue(v3, CFSTR("nr"), &unk_1E3C86B98);
  return (NSDictionary *)v3;
}

- (void)handleResponseDictionary:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("alert"), v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseAlertInfo_(self, v5, (uint64_t)v7, v6);

}

- (BOOL)_usingOutgoingPush
{
  return self->_usingOutgoingPush;
}

- (void)_setUsingOutgoingPush:(BOOL)a3
{
  self->_usingOutgoingPush = a3;
}

- (NSDictionary)_cachedBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)_setCachedBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeSent
{
  return self->_timeSent;
}

- (void)setTimeSent:(double)a3
{
  self->_timeSent = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (id)deliveryAcknowledgementBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDeliveryAcknowledgementBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)topic
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTopic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)hasReceivedPushAck
{
  return self->_hasReceivedPushAck;
}

- (void)setHasReceivedPushAck:(BOOL)a3
{
  self->_hasReceivedPushAck = a3;
}

- (BOOL)hasAttemptedAPSDelivery
{
  return self->_hasAttemptedAPSDelivery;
}

- (void)setHasAttemptedAPSDelivery:(BOOL)a3
{
  self->_hasAttemptedAPSDelivery = a3;
}

- (NSNumber)pushAckTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPushAckTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (int64_t)importanceLevel
{
  return self->_importanceLevel;
}

- (void)setImportanceLevel:(int64_t)a3
{
  self->_importanceLevel = a3;
}

- (int64_t)deliveryMechanism
{
  return self->_deliveryMechanism;
}

- (void)setDeliveryMechanism:(int64_t)a3
{
  self->_deliveryMechanism = a3;
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSString)subService
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSubService:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSString)underlyingService
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUnderlyingService:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (BOOL)forceCellular
{
  return self->_forceCellular;
}

- (void)setForceCellular:(BOOL)a3
{
  self->_forceCellular = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)wantsBinaryPush
{
  return self->_wantsBinaryPush;
}

- (void)setWantsBinaryPush:(BOOL)a3
{
  self->_wantsBinaryPush = a3;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return self->_wantsIntegerUniqueIDs;
}

- (void)setWantsIntegerUniqueIDs:(BOOL)a3
{
  self->_wantsIntegerUniqueIDs = a3;
}

- (BOOL)wantsResponse
{
  return self->_wantsResponse;
}

- (void)setWantsResponse:(BOOL)a3
{
  self->_wantsResponse = a3;
}

- (BOOL)wantsMultipleResponses
{
  return self->_wantsMultipleResponses;
}

- (void)setWantsMultipleResponses:(BOOL)a3
{
  self->_wantsMultipleResponses = a3;
}

- (BOOL)httpDoNotDecodeData
{
  return self->_httpDoNotDecodeData;
}

- (void)setHttpDoNotDecodeData:(BOOL)a3
{
  self->_httpDoNotDecodeData = a3;
}

- (int)timeoutRetries
{
  return self->_timeoutRetries;
}

- (void)setTimeoutRetries:(int)a3
{
  self->_timeoutRetries = a3;
}

- (NSDictionary)responseAlertInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseAlertInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (BOOL)ignoreMaxRetryCount
{
  return self->_ignoreMaxRetryCount;
}

- (void)setIgnoreMaxRetryCount:(BOOL)a3
{
  self->_ignoreMaxRetryCount = a3;
}

- (BOOL)wantsPushSignatures
{
  return self->_wantsPushSignatures;
}

- (void)setWantsPushSignatures:(BOOL)a3
{
  self->_wantsPushSignatures = a3;
}

- (void)setIsMultipleAuthCertCapable:(BOOL)a3
{
  self->_isMultipleAuthCertCapable = a3;
}

- (IDSBaseMessageSigningSession)signingSession
{
  return self->_signingSession;
}

- (void)setSigningSession:(id)a3
{
  objc_storeStrong((id *)&self->_signingSession, a3);
}

- (NSString)baaSigningDigest
{
  return self->_baaSigningDigest;
}

- (void)setBaaSigningDigest:(id)a3
{
  objc_storeStrong((id *)&self->_baaSigningDigest, a3);
}

- (NSError)baaSigningError
{
  return self->_baaSigningError;
}

- (void)setBaaSigningError:(id)a3
{
  objc_storeStrong((id *)&self->_baaSigningError, a3);
}

- (NSString)splunkHint
{
  return self->_splunkHint;
}

- (void)setSplunkHint:(id)a3
{
  objc_storeStrong((id *)&self->_splunkHint, a3);
}

- (NSString)dsAuthID
{
  return self->_dsAuthID;
}

- (void)setDSAuthID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)serviceData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (NSURL)URLOverride
{
  return (NSURL *)objc_getProperty(self, a2, 200, 1);
}

- (void)setURLOverride:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSNumber)originalTimestamp
{
  return self->_originalTimestamp;
}

- (void)setOriginalTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)context
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unint64_t)sentByteCount
{
  return self->_sentByteCount;
}

- (void)setSentByteCount:(unint64_t)a3
{
  self->_sentByteCount = a3;
}

- (unint64_t)receivedByteCount
{
  return self->_receivedByteCount;
}

- (void)setReceivedByteCount:(unint64_t)a3
{
  self->_receivedByteCount = a3;
}

- (NSDate)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(id)a3
{
  objc_storeStrong((id *)&self->_requestStart, a3);
}

- (NSDate)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(id)a3
{
  objc_storeStrong((id *)&self->_requestEnd, a3);
}

- (NSDate)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(id)a3
{
  objc_storeStrong((id *)&self->_responseReceived, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseReceived, 0);
  objc_storeStrong((id *)&self->_requestEnd, 0);
  objc_storeStrong((id *)&self->_requestStart, 0);
  objc_storeStrong((id *)&self->_originalTimestamp, 0);
  objc_storeStrong((id *)&self->_splunkHint, 0);
  objc_storeStrong((id *)&self->_baaSigningError, 0);
  objc_storeStrong((id *)&self->_baaSigningDigest, 0);
  objc_storeStrong((id *)&self->_responseAlertInfo, 0);
  objc_storeStrong((id *)&self->_pushAckTimestamp, 0);
  objc_storeStrong((id *)&self->_URLOverride, 0);
  objc_storeStrong((id *)&self->_underlyingService, 0);
  objc_storeStrong((id *)&self->_subService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_deliveryAcknowledgementBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_dataUsageBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dsAuthID, 0);
  objc_storeStrong((id *)&self->_responseAlert, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_serviceData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_cachedBody, 0);
}

@end
