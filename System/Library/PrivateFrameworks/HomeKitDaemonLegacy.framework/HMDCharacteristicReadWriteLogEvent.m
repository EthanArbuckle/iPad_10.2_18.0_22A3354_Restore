@implementation HMDCharacteristicReadWriteLogEvent

+ (id)eventWithCharacteristicsToRead:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isLocal:(BOOL)a7 transactionId:(id)a8 isCached:(BOOL)a9 bundleId:(id)a10 userUUID:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDCharacteristicReadWriteLogEvent *v23;
  HMDCharacteristicReadWriteLogEvent *v24;
  uint64_t v26;
  uint64_t v27;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = [HMDCharacteristicReadWriteLogEvent alloc];
  LOBYTE(v27) = a9;
  LOBYTE(v26) = a7;
  v24 = -[HMDCharacteristicReadWriteLogEvent initWithCharacteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:](v23, "initWithCharacteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:", v22, v21, v20, a6, 0, 0, v26, v19, v27, v18, v17, MEMORY[0x1E0C9AA60]);

  return v24;
}

- (HMDCharacteristicReadWriteLogEvent)initWithCharacteristics:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isWriteOperation:(BOOL)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 isCached:(BOOL)a11 bundleId:(id)a12 userUUID:(id)a13 writtenValues:(id)a14
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDCharacteristicReadWriteLogEvent *v25;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v31;
  _BOOL4 v32;

  v31 = a7;
  v32 = a8;
  v17 = (void *)MEMORY[0x1E0D33490];
  v18 = a14;
  v19 = a13;
  v20 = a12;
  v21 = a10;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v17, "currentTime");
  LOBYTE(v28) = a11;
  LOBYTE(v27) = a9;
  v25 = -[HMDCharacteristicReadWriteLogEvent initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:](self, "initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:", v24, v23, v22, a6, v31, v32, v27, v21, v28, v20, v19, v18);

  return v25;
}

- (NSArray)characteristicsInRequest
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setLocalDurationInMilliseconds:(int64_t)a3
{
  self->_localDurationInMilliseconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_topSessionFailureErrorDomain, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_writtenValues, 0);
  objc_storeStrong((id *)&self->_characteristicsInRequest, 0);
  objc_storeStrong((id *)&self->_accessoryZoneNames, 0);
  objc_storeStrong((id *)&self->_accessoryZoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceUUIDToServiceGroupName, 0);
  objc_storeStrong((id *)&self->_serviceUUIDToServiceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteID, 0);
  objc_storeStrong((id *)&self->_accessoryRoomName, 0);
  objc_storeStrong((id *)&self->_accessoryRoomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_residentFirstError, 0);
  objc_storeStrong((id *)&self->_transportProtocolVersion, 0);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_primaryServiceType, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  HMDCharacteristicReadWriteLogEvent *v20;
  NSObject *v21;
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
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id WeakRetained;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  HMDCharacteristicReadWriteLogEvent *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  id *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  unint64_t v86;
  void *v87;
  void *v88;
  HMDCharacteristicReadWriteLogEvent *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  const char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  void *v126;
  HMDCharacteristicReadWriteLogEvent *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  HMDCharacteristicReadWriteLogEvent *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  HMDCharacteristicReadWriteLogEvent *v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  HMDCharacteristicReadWriteLogEvent *v160;
  NSObject *v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  HMDCharacteristicReadWriteLogEvent *v166;
  NSObject *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  id v183;
  id v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  HMDCharacteristicReadWriteLogEvent *v222;
  void *v223;
  id v224;
  id *v225;
  void *v226;
  uint8_t buf[4];
  void *v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  void *v232;
  __int16 v233;
  void *v234;
  __int16 v235;
  id v236;
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v225 = (id *)a3;
  if (!-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
    goto LABEL_13;
  -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[HMDCharacteristicReadWriteLogEvent writtenValues](self, "writtenValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](v20, "characteristicsInRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](v20, "characteristicsInRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicReadWriteLogEvent writtenValues](v20, "writtenValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDCharacteristicReadWriteLogEvent writtenValues](v20, "writtenValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v228 = v22;
      v229 = 2112;
      v230 = v23;
      v231 = 2112;
      v232 = v26;
      v233 = 2112;
      v234 = v27;
      v235 = 2112;
      v236 = v30;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Attempting to get metadata for mismatched number of characteristics (%@) : %@, and values (%@): %@", buf, 0x34u);

LABEL_11:
    }
LABEL_12:

    objc_autoreleasePoolPop(v19);
LABEL_13:
    v31 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_14;
  }
  -[HMDCharacteristicReadWriteLogEvent homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v228 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no home data for event", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (self)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[HMMDatedHomeLogEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMDatedHomeLogEvent endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

    v13 = objc_alloc(MEMORY[0x1E0D02670]);
    -[HMDCharacteristicReadWriteLogEvent homeUniqueIdentifier](self, "homeUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDCharacteristicReadWriteLogEvent isAtHome](self, "isAtHome");
    v17 = -[HMDCharacteristicReadWriteLogEvent triggerSource](self, "triggerSource");
    if (v17 > 9)
      v18 = CFSTR("Unknown");
    else
      v18 = off_1E89ABF20[v17];
    v33 = v18;
    -[HMDCharacteristicReadWriteLogEvent bundleId](self, "bundleId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicReadWriteLogEvent clientMetricIdentifier](self, "clientMetricIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v219 = (void *)objc_msgSend(v13, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v12, v15, v16, v33, v34, v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v13;
      v39 = v12;
      v40 = (void *)v37;
      v219 = (void *)objc_msgSend(v38, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v39, v15, v16, v33, v34, v37);

      v12 = v39;
    }

  }
  else
  {
    v219 = 0;
  }
  v41 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    v45 = 0;
    v182 = *MEMORY[0x1E0CB8AE8];
    v181 = *MEMORY[0x1E0CB8B38];
    v178 = *MEMORY[0x1E0CB8960];
    v222 = self;
    do
    {
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "service");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "type");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v226 = v47;
      objc_msgSend(v47, "type");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (v49)
      {
        if (v50)
        {
          v52 = v49;
          v53 = v51;
          if (v225)
          {
            v223 = v53;
            WeakRetained = objc_loadWeakRetained(v225 + 2);
            if (WeakRetained)
            {
              v55 = WeakRetained;
              v56 = v51;
              objc_msgSend(WeakRetained, "hapMetadataForBiomeLogEventObserver:", v225);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291")) & 1) != 0
                || (objc_msgSend(v57, "shouldFilterServiceOfTypeFromApp:", v52) & 1) == 0)
              {
                v58 = v52;
                v59 = objc_msgSend(v57, "isStandardServiceType:", v52);
              }
              else
              {
                v58 = v52;
                v59 = 0;
              }
              if ((objc_msgSend(v57, "shouldFilterCharacteristicOfTypeFromApp:", v223) & 1) != 0)
                v70 = 0;
              else
                v70 = objc_msgSend(v57, "isStandardCharacteristicType:", v223);
              v76 = v59 & v70;

              v77 = v58;
              v51 = v56;
              if ((v76 & 1) != 0)
              {
                -[HMDCharacteristicReadWriteLogEvent writtenValues](self, "writtenValues");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "objectAtIndexedSubscript:", v45);
                v79 = (void *)objc_claimAutoreleasedReturnValue();

                v221 = v79;
                if (objc_msgSend(v77, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291")))
                {
                  v80 = v223;
                  v81 = v79;
                  v224 = v219;
                  if (!self)
                  {
                    v132 = 0;
                    goto LABEL_111;
                  }
                  -[HMDCharacteristicReadWriteLogEvent accessoryMediaRouteID](self, "accessoryMediaRouteID");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();

                  v218 = v80;
                  if (!v82)
                  {
                    v125 = v81;
                    v126 = (void *)MEMORY[0x1D17BA0A0]();
                    v127 = self;
                    HMFGetOSLogHandle();
                    v128 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v129 = v49;
                      v130 = v48;
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v228 = v131;
                      _os_log_impl(&dword_1CD062000, v128, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, smart speaker event is missing media profile", buf, 0xCu);

                      v48 = v130;
                      v49 = v129;
                      v79 = v221;
                    }

                    objc_autoreleasePoolPop(v126);
                    v132 = 0;
                    v81 = v125;
                    goto LABEL_110;
                  }
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  v214 = v81;
                  if (objc_msgSend(v80, "isEqualToString:", v182))
                  {
                    v83 = v81;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v84 = v83;
                    else
                      v84 = 0;
                    v85 = v84;

                    if (v85)
                    {
                      v86 = objc_msgSend(v85, "integerValue");
                      if (v86 >= 3)
                      {
                        v87 = v48;
                        v88 = (void *)MEMORY[0x1D17BA0A0]();
                        v89 = self;
                        HMFGetOSLogHandle();
                        v90 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                        {
                          HMFGetLogIdentifier();
                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543362;
                          v228 = v91;
                          v92 = v90;
                          v93 = "%{public}@Unable to log event metadata to biome, unknown playback state not eligible for donation";
                          goto LABEL_93;
                        }
                        goto LABEL_94;
                      }
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", qword_1CDB8F910[v86]);
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      v135 = v216;
                      objc_msgSend(v216, "setObject:forKeyedSubscript:", v145, CFSTR("playback-state"));

LABEL_96:
                      v179 = v51;
                      v180 = v49;

LABEL_97:
                      v209 = objc_alloc(MEMORY[0x1E0D02678]);
                      -[HMDCharacteristicReadWriteLogEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
                      v213 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v213, "UUIDString");
                      v203 = (void *)objc_claimAutoreleasedReturnValue();
                      v207 = (void *)objc_msgSend(v135, "copy");
                      -[HMDCharacteristicReadWriteLogEvent accessoryMediaRouteID](self, "accessoryMediaRouteID");
                      v205 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent accessoryZoneUniqueIdentifiers](self, "accessoryZoneUniqueIdentifiers");
                      v201 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent accessoryRoomUniqueIdentifier](self, "accessoryRoomUniqueIdentifier");
                      v211 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v211, "UUIDString");
                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent accessoryName](self, "accessoryName");
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent accessoryRoomName](self, "accessoryRoomName");
                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent accessoryZoneNames](self, "accessoryZoneNames");
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HMDCharacteristicReadWriteLogEvent homeName](self, "homeName");
                      v149 = v48;
                      v150 = (void *)objc_claimAutoreleasedReturnValue();
                      v132 = (void *)objc_msgSend(v209, "initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:", v224, v203, MEMORY[0x1E0C9AA70], v207, MEMORY[0x1E0C9AA70], v205, v201, v199, v146, v147, v148, v150);

                      v48 = v149;
                      v79 = v221;

                      v151 = v216;
                      v51 = v179;
                      v49 = v180;
                      v81 = v214;
LABEL_109:

LABEL_110:
                      v80 = v218;
LABEL_111:

                      objc_msgSend(v220, "na_safeAddObject:", v132);
                      goto LABEL_112;
                    }
                    v87 = v48;
                    v88 = (void *)MEMORY[0x1D17BA0A0]();
                    v144 = self;
                    HMFGetOSLogHandle();
                    v90 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v228 = v91;
                      v92 = v90;
                      v93 = "%{public}@Unable to log event metadata to biome, non number playback state not eligible for donation";
LABEL_93:
                      _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_DEFAULT, v93, buf, 0xCu);

                    }
LABEL_94:
                    v81 = v214;

                    objc_autoreleasePoolPop(v88);
                    v132 = 0;
                    v48 = v87;
                    v79 = v221;
                  }
                  else
                  {
                    if (objc_msgSend(v80, "isEqualToString:", v181))
                    {
                      v133 = v81;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v134 = v133;
                      else
                        v134 = 0;
                      v85 = v134;

                      if (v85)
                      {
                        v135 = v216;
                        objc_msgSend(v216, "setObject:forKeyedSubscript:", v85, CFSTR("volume"));
                        goto LABEL_96;
                      }
                      v152 = (void *)MEMORY[0x1D17BA0A0]();
                      v153 = self;
                      HMFGetOSLogHandle();
                      v154 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v155 = v49;
                        v156 = v48;
                        v157 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v228 = v157;
                        _os_log_impl(&dword_1CD062000, v154, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, unknown volume state not eligible for donation", buf, 0xCu);

                        v48 = v156;
                        v49 = v155;
                        v79 = v221;
                      }

                      objc_autoreleasePoolPop(v152);
                      v132 = 0;
                    }
                    else
                    {
                      v179 = v51;
                      v180 = v49;
                      v135 = v216;
                      if (!objc_msgSend(v80, "isEqualToString:", v178))
                        goto LABEL_97;
                      v136 = v214;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v137 = v136;
                      else
                        v137 = 0;
                      v85 = v137;

                      if (v85)
                      {
                        v135 = v216;
                        objc_msgSend(v216, "setObject:forKeyedSubscript:", v85, CFSTR("mute"));
                        goto LABEL_96;
                      }
                      v165 = (void *)MEMORY[0x1D17BA0A0]();
                      v166 = self;
                      HMFGetOSLogHandle();
                      v167 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v168 = v48;
                        v169 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v228 = v169;
                        _os_log_impl(&dword_1CD062000, v167, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to log event metadata to biome, unknown mute state not eligible for donation", buf, 0xCu);

                        v48 = v168;
                      }

                      objc_autoreleasePoolPop(v165);
                      v132 = 0;
                      v49 = v180;
                    }
                    v81 = v214;
                  }
                  v151 = v216;
                  goto LABEL_109;
                }
                v99 = v79;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v100 = v99;
                else
                  v100 = 0;
                v101 = v100;

                v102 = v99;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v103 = v102;
                else
                  v103 = 0;
                v104 = v103;

                v105 = v102;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v106 = v105;
                else
                  v106 = 0;
                v107 = v106;

                v204 = v104;
                v202 = v107;
                v208 = v101;
                if (v101)
                {
                  v183 = objc_alloc(MEMORY[0x1E0D02650]);
                  -[HMDCharacteristicReadWriteLogEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v200, "UUIDString");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "spiClientIdentifier");
                  v198 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v198, "UUIDString");
                  v186 = objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupUniqueIdentifier](self, "serviceUUIDToServiceGroupUniqueIdentifier");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "uuid");
                  v196 = (void *)objc_claimAutoreleasedReturnValue();
                  v197 = v108;
                  objc_msgSend(v108, "objectForKeyedSubscript:");
                  v195 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v195, "UUIDString");
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent accessoryZoneUniqueIdentifiers](self, "accessoryZoneUniqueIdentifiers");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent accessoryRoomUniqueIdentifier](self, "accessoryRoomUniqueIdentifier");
                  v194 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v194, "UUIDString");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent accessoryName](self, "accessoryName");
                  v109 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "name");
                  v110 = objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent accessoryRoomName](self, "accessoryRoomName");
                  v111 = objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupName](self, "serviceUUIDToServiceGroupName");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "uuid");
                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                  v193 = v112;
                  objc_msgSend(v112, "objectForKeyedSubscript:");
                  v113 = objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent accessoryZoneNames](self, "accessoryZoneNames");
                  v114 = objc_claimAutoreleasedReturnValue();
                  -[HMDCharacteristicReadWriteLogEvent homeName](self, "homeName");
                  v189 = (void *)objc_claimAutoreleasedReturnValue();
                  v190 = (void *)v114;
                  v191 = (void *)v113;
                  v172 = v111;
                  v173 = v113;
                  v170 = v109;
                  v206 = (void *)v109;
                  v115 = (void *)v110;
                  v116 = (void *)v111;
                  v117 = (void *)v186;
                  v118 = (void *)objc_msgSend(v183, "initWithBase:numberAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v208, v217, v215, v212, v210, v170, v110, v172, v173, v114, v189);
                  v79 = v221;
                }
                else
                {
                  if (v104)
                  {
                    v184 = objc_alloc(MEMORY[0x1E0D02650]);
                    -[HMDCharacteristicReadWriteLogEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
                    v200 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v200, "UUIDString");
                    v217 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "spiClientIdentifier");
                    v198 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v198, "UUIDString");
                    v187 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupUniqueIdentifier](self, "serviceUUIDToServiceGroupUniqueIdentifier");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "uuid");
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    v197 = v119;
                    objc_msgSend(v119, "objectForKeyedSubscript:");
                    v195 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v195, "UUIDString");
                    v215 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryZoneUniqueIdentifiers](self, "accessoryZoneUniqueIdentifiers");
                    v212 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryRoomUniqueIdentifier](self, "accessoryRoomUniqueIdentifier");
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v194, "UUIDString");
                    v210 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryName](self, "accessoryName");
                    v206 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "name");
                    v120 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryRoomName](self, "accessoryRoomName");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupName](self, "serviceUUIDToServiceGroupName");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "uuid");
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                    v193 = v121;
                    objc_msgSend(v121, "objectForKeyedSubscript:");
                    v122 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryZoneNames](self, "accessoryZoneNames");
                    v123 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent homeName](self, "homeName");
                    v189 = (void *)objc_claimAutoreleasedReturnValue();
                    v190 = (void *)v123;
                    v174 = v123;
                    v79 = v221;
                    v191 = (void *)v122;
                    v171 = v120;
                    v115 = (void *)v120;
                    v117 = (void *)v187;
                    v124 = objc_msgSend(v184, "initWithBase:stringAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v204, v217, v215, v212, v210, v206, v171, v116, v122, v174, v189);
                  }
                  else
                  {
                    if (!v107)
                    {
                      v158 = v48;
                      v159 = (void *)MEMORY[0x1D17BA0A0]();
                      v160 = self;
                      HMFGetOSLogHandle();
                      v161 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        v163 = (void *)objc_opt_class();
                        *(_DWORD *)buf = 138544386;
                        v228 = v162;
                        v229 = 2112;
                        v230 = v163;
                        v231 = 2112;
                        v232 = v226;
                        v233 = 2112;
                        v234 = v158;
                        v235 = 2112;
                        v236 = v105;
                        v164 = v163;
                        _os_log_impl(&dword_1CD062000, v161, OS_LOG_TYPE_INFO, "%{public}@Unable to log event metadata to biome, unknown write value type (%@) for characteristic: %@, Service: %@, written value: %@", buf, 0x34u);

                        v79 = v221;
                      }

                      objc_autoreleasePoolPop(v159);
                      v48 = v158;
                      goto LABEL_112;
                    }
                    v185 = objc_alloc(MEMORY[0x1E0D02650]);
                    -[HMDCharacteristicReadWriteLogEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
                    v200 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v200, "UUIDString");
                    v217 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "spiClientIdentifier");
                    v198 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v198, "UUIDString");
                    v188 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupUniqueIdentifier](self, "serviceUUIDToServiceGroupUniqueIdentifier");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "uuid");
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    v197 = v138;
                    objc_msgSend(v138, "objectForKeyedSubscript:");
                    v195 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v195, "UUIDString");
                    v215 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryZoneUniqueIdentifiers](self, "accessoryZoneUniqueIdentifiers");
                    v212 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryRoomUniqueIdentifier](self, "accessoryRoomUniqueIdentifier");
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v194, "UUIDString");
                    v210 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryName](self, "accessoryName");
                    v206 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "name");
                    v177 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryRoomName](self, "accessoryRoomName");
                    v176 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupName](self, "serviceUUIDToServiceGroupName");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "uuid");
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                    v193 = v139;
                    objc_msgSend(v139, "objectForKeyedSubscript:");
                    v140 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent accessoryZoneNames](self, "accessoryZoneNames");
                    v141 = objc_claimAutoreleasedReturnValue();
                    -[HMDCharacteristicReadWriteLogEvent homeName](self, "homeName");
                    v142 = objc_claimAutoreleasedReturnValue();
                    v143 = v107;
                    v116 = (void *)v176;
                    v115 = (void *)v177;
                    v189 = (void *)v142;
                    v190 = (void *)v141;
                    v175 = v141;
                    v79 = v221;
                    v191 = (void *)v140;
                    v117 = (void *)v188;
                    v124 = objc_msgSend(v185, "initWithBase:dataAccessoryState:accessoryUniqueIdentifier:serviceUniqueIdentifier:serviceType:characteristicType:serviceGroupUniqueIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:serviceName:roomName:serviceGroupName:zoneNames:homeName:", v219, v143, v217, v215, v212, v210, v206, v177, v176, v140, v175, v142);
                  }
                  v118 = (void *)v124;
                }
                objc_msgSend(v220, "addObject:", v118);

LABEL_112:
                goto LABEL_57;
              }
              goto LABEL_54;
            }
            v71 = (void *)MEMORY[0x1D17BA0A0]();
            v72 = v225;
            HMFGetOSLogHandle();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v74 = v51;
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v228 = v75;
              _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_ERROR, "%{public}@HAP event ineligible for donation because data source is nil", buf, 0xCu);

              v51 = v74;
              self = v222;
            }

            objc_autoreleasePoolPop(v71);
            v53 = v223;
          }

LABEL_54:
          v60 = (void *)MEMORY[0x1D17BA0A0]();
          v61 = self;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v94 = v49;
            v95 = v48;
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v228 = v96;
            v229 = 2112;
            v230 = v226;
            v231 = 2112;
            v232 = v95;
            _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Unable to log event metadata to biome, not eligible for donation. Characteristic: %@, Service: %@", buf, 0x20u);

            v48 = v95;
            v49 = v94;
          }
          goto LABEL_56;
        }
        v60 = (void *)MEMORY[0x1D17BA0A0]();
        v61 = self;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v66 = v49;
          v67 = v48;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v228 = v68;
          v229 = 2112;
          v230 = v226;
          v231 = 2112;
          v232 = v69;
          _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no characteristic type for characteristic (%@) at index: %@", buf, 0x20u);

          v48 = v67;
          v49 = v66;
          v51 = 0;
          goto LABEL_33;
        }
      }
      else
      {
        v60 = (void *)MEMORY[0x1D17BA0A0]();
        v61 = self;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = v48;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v228 = v64;
          v229 = 2112;
          v230 = v226;
          v231 = 2112;
          v232 = v65;
          _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to log event metadata to biome, no service type for characteristic (%@) at index: %@", buf, 0x20u);

          v48 = v63;
          v49 = 0;
LABEL_33:
          self = v222;
        }
      }
LABEL_56:

      objc_autoreleasePoolPop(v60);
LABEL_57:

      ++v45;
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "count");

    }
    while (v98 > v45);
  }
  v31 = (void *)objc_msgSend(v220, "copy");

LABEL_14:
  return v31;
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  const __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  __CFString *v58;
  void *v59;

  v4 = a3;
  if (-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
  {
    -[HMDCharacteristicReadWriteLogEvent firstDonatableCharacteristicForLogEventObserver:](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA70];
    if (v5 && v6 && v7)
    {
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v5);

      -[HMDCharacteristicReadWriteLogEvent writtenValues](self, "writtenValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v59 = v8;
      if (v11 <= v13)
      {
        -[HMDCharacteristicReadWriteLogEvent writtenValues](self, "writtenValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        v19 = (__CFString *)v16;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        if (v18)
        {
          objc_msgSend(v18, "stringValue");
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else if (v21)
        {
          v22 = v21;
          v58 = v19;
        }
        else
        {
          v58 = CFSTR("unknown");
        }

      }
      else
      {
        v58 = CFSTR("unknown");
      }
      objc_msgSend(v6, "spiClientIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "type");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicReadWriteLogEvent serviceUUIDToServiceGroupUniqueIdentifier](self, "serviceUUIDToServiceGroupUniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      v31 = &stru_1E89C3E38;
      if (v29)
        v31 = (__CFString *)v29;
      v51 = v31;

      if (-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291")))
      {

        v32 = &stru_1E89C3E38;
        v24 = CFSTR("media");
        v25 = CFSTR("media");
        v33 = CFSTR("media");
        v34 = v59;
      }
      else
      {
        v34 = v59;
        v32 = v51;
        v33 = v53;
      }
      v52 = (void *)MEMORY[0x1E0D4DE98];
      objc_msgSend(v34, "spiClientIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = -[HMDCharacteristicReadWriteLogEvent triggerSource](self, "triggerSource");
      v56 = v6;
      v57 = v4;
      v54 = v35;
      v55 = v5;
      v38 = v24;
      v39 = (void *)v36;
      v40 = v25;
      v41 = v38;
      if (v37 > 9)
        v42 = CFSTR("Unknown");
      else
        v42 = off_1E89ABF20[v37];
      v43 = v42;
      v8 = v59;
      objc_msgSend(v59, "room");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "spiClientIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "UUIDString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v41;
      v50 = v41;
      v48 = (__CFString *)v32;
      objc_msgSend(v52, "metadataForHomekitAccessoryControlEventWithUUID:stateString:serviceUUID:serviceType:characteristicType:serviceGroupUUID:source:roomUUID:", v39, v58, v47, v40, v33, v32, v43, v46);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v56;
      v4 = v57;
      v5 = v55;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;
  HMDCharacteristicReadWriteLogEvent *v10;

  v4 = a3;
  if (-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
  {
    -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __122__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationLocalizationScanForLogEventObserver___block_invoke;
    v8[3] = &unk_1E89A6C10;
    v9 = v4;
    v10 = self;
    v6 = objc_msgSend(v5, "na_any:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;
  HMDCharacteristicReadWriteLogEvent *v10;

  v4 = a3;
  if (-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
  {
    -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __119__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationRecordingScanForLogEventObserver___block_invoke;
    v8[3] = &unk_1E89A6C10;
    v9 = v4;
    v10 = self;
    v6 = objc_msgSend(v5, "na_any:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDCharacteristicReadWriteLogEvent firstDonatableCharacteristicForLogEventObserver:](self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291"));

  return v6;
}

- (id)firstDonatableCharacteristicForLogEventObserver:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "characteristicsInRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __108__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__firstDonatableCharacteristicForLogEventObserver___block_invoke;
    v6[3] = &unk_1E89A6C10;
    v7 = v3;
    v8 = a1;
    objc_msgSend(v4, "na_firstObjectPassingTest:", v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

uint64_t __108__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__firstDonatableCharacteristicForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if ((_DWORD)v6)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "numAccessoriesInHome");
    v10 = objc_msgSend(*(id *)(a1 + 40), "numNonEmptyScenesInHome");
    v11 = objc_msgSend(*(id *)(a1 + 40), "triggerSource");
    if (v10 + (unint64_t)v9 > 3)
      v12 = (v11 < 7) & (0x67u >> v11);
    else
      v12 = 0;
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

uint64_t __119__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationRecordingScanForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if ((_DWORD)v6)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "numAccessoriesInHome");
    v10 = objc_msgSend(*(id *)(a1 + 40), "numNonEmptyScenesInHome");
    v11 = objc_msgSend(*(id *)(a1 + 40), "triggerSource");
    if (v10 + (unint64_t)v9 > 3)
      v12 = (v11 < 7) & (0x67u >> v11);
    else
      v12 = 0;
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

uint64_t __122__HMDCharacteristicReadWriteLogEvent_MicroLocationLogging__shouldTriggerMicroLocationLocalizationScanForLogEventObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[HMDMicroLocationLogEventObserver isEligibleForDonationWithHAPServiceType:HAPCharacteristicType:](v6, v7, v8);

  if ((_DWORD)v6)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "numAccessoriesInHome");
    v10 = objc_msgSend(*(id *)(a1 + 40), "numNonEmptyScenesInHome");
    v11 = objc_msgSend(*(id *)(a1 + 40), "triggerSource");
    if (v10 + (unint64_t)v9 > 3)
      v12 = (v11 < 7) & (0x67u >> v11);
    else
      v12 = 0;
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (HMDCharacteristicReadWriteLogEvent)initWithStartTime:(double)a3 characteristics:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isWriteOperation:(BOOL)a8 isTimedWrite:(BOOL)a9 isLocal:(BOOL)a10 transactionId:(id)a11 isCached:(BOOL)a12 bundleId:(id)a13 userUUID:(id)a14 writtenValues:(id)a15
{
  _BOOL4 v16;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HMDCharacteristicReadWriteLogEvent *v32;
  uint64_t v33;
  NSString *clientMetricIdentifier;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSString *expectedTransport;
  uint64_t v45;
  NSUUID *accessoryUUID;
  uint64_t v47;
  NSString *accessoryIdentifier;
  uint64_t v49;
  NSUUID *accessoryUniqueIdentifier;
  uint64_t v51;
  NSString *accessoryName;
  void *v53;
  uint64_t v54;
  NSString *accessoryCategory;
  uint64_t v56;
  NSString *accessoryManufacturer;
  void *v58;
  uint64_t v59;
  NSUUID *accessoryRoomUniqueIdentifier;
  void *v61;
  uint64_t v62;
  NSString *accessoryRoomName;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSString *topSessionFailureErrorDomain;
  void *v71;
  uint64_t v72;
  NSString *transactionIdentifier;
  void *v74;
  uint64_t v75;
  NSString *transportProtocolVersion;
  uint64_t v77;
  NSString *primaryServiceType;
  uint64_t v79;
  void *userUUID;
  void *v81;
  uint64_t v82;
  NSString *v83;
  void *v84;
  uint64_t v85;
  NSUUID *homeUniqueIdentifier;
  void *v87;
  uint64_t v88;
  NSString *homeName;
  BOOL v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  char v99;
  id v100;
  void *v101;
  const __CFString *v102;
  NSString *bundleId;
  id v104;
  id v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  NSDictionary *serviceUUIDToServiceGroupName;
  uint64_t v125;
  NSDictionary *serviceUUIDToServiceGroupUniqueIdentifier;
  void *v127;
  id v128;
  void *v129;
  id v130;
  uint64_t v131;
  NSArray *accessoryZoneUniqueIdentifiers;
  uint64_t v133;
  NSArray *accessoryZoneNames;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  NSString *accessoryMediaRouteID;
  uint64_t v143;
  NSArray *writtenValues;
  void *v145;
  void *v146;
  void *v148;
  void *v149;
  id v150;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  HMDCharacteristicReadWriteLogEvent *v162;
  objc_super v163;
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE buf[24];
  void *v171;
  id v172;
  uint64_t v173;

  v16 = a8;
  v173 = *MEMORY[0x1E0C80C00];
  v156 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a11;
  v25 = a13;
  v26 = v23;
  v159 = a14;
  v27 = a15;
  v28 = v22;
  v29 = v27;
  v160 = v28;
  objc_msgSend(v28, "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v163.receiver = self;
  v163.super_class = (Class)HMDCharacteristicReadWriteLogEvent;
  v32 = -[HMMDatedHomeLogEvent initWithStartTime:homeUUID:](&v163, sel_initWithStartTime_homeUUID_, v31, a3);

  v162 = v32;
  if (v32)
  {
    v155 = v29;
    v153 = v25;
    objc_msgSend(MEMORY[0x1E0D28540], "currentClientMetricIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    clientMetricIdentifier = v32->_clientMetricIdentifier;
    v32->_clientMetricIdentifier = (NSString *)v33;

    v35 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v39 = CFSTR("Reading");
      if (v16)
        v39 = CFSTR("Writing");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@[HMDCharacteristicReadWriteLogEvent] %@...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v40 = v160;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;
    v42 = v41;
    v158 = v40;

    objc_msgSend(v26, "server");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v162->_accessoryCertificationStatus = objc_msgSend(v42, "certificationStatus");
      v162->_communicationProtocol = objc_msgSend(v42, "communicationProtocol");
      objc_msgSend(v42, "expectedTransport");
      v43 = objc_claimAutoreleasedReturnValue();
      expectedTransport = v162->_expectedTransport;
      v162->_expectedTransport = (NSString *)v43;

    }
    objc_msgSend(v40, "uuid");
    v45 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v162->_accessoryUUID;
    v162->_accessoryUUID = (NSUUID *)v45;

    objc_msgSend(v40, "identifier");
    v47 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifier = v162->_accessoryIdentifier;
    v162->_accessoryIdentifier = (NSString *)v47;

    objc_msgSend(v40, "spiClientIdentifier");
    v49 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIdentifier = v162->_accessoryUniqueIdentifier;
    v162->_accessoryUniqueIdentifier = (NSUUID *)v49;

    objc_msgSend(v40, "name");
    v51 = objc_claimAutoreleasedReturnValue();
    accessoryName = v162->_accessoryName;
    v162->_accessoryName = (NSString *)v51;

    objc_msgSend(v40, "category");
    v161 = v42;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "categoryType");
    v54 = objc_claimAutoreleasedReturnValue();
    accessoryCategory = v162->_accessoryCategory;
    v162->_accessoryCategory = (NSString *)v54;

    objc_msgSend(v40, "manufacturer");
    v56 = objc_claimAutoreleasedReturnValue();
    accessoryManufacturer = v162->_accessoryManufacturer;
    v162->_accessoryManufacturer = (NSString *)v56;

    objc_msgSend(v40, "room");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "spiClientIdentifier");
    v59 = objc_claimAutoreleasedReturnValue();
    accessoryRoomUniqueIdentifier = v162->_accessoryRoomUniqueIdentifier;
    v162->_accessoryRoomUniqueIdentifier = (NSUUID *)v59;

    v157 = v58;
    objc_msgSend(v58, "name");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "copy");
    accessoryRoomName = v162->_accessoryRoomName;
    v162->_accessoryRoomName = (NSString *)v62;

    objc_msgSend(v161, "accessoryMetric");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "sessionMetric");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v162->_hasSession = objc_msgSend(v40, "hasActiveSession");
    v162->_reachable = objc_msgSend(v40, "isReachable");
    v66 = objc_msgSend(v65, "successfulSessionRetries");
    v162->_recentSessionRetries = objc_msgSend(v65, "sessionFailures") + v66;
    objc_msgSend(v65, "topError");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_topSessionFailureErrorCode = objc_msgSend(v67, "code");

    v149 = v65;
    objc_msgSend(v65, "topError");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "domain");
    v69 = objc_claimAutoreleasedReturnValue();
    topSessionFailureErrorDomain = v162->_topSessionFailureErrorDomain;
    v162->_topSessionFailureErrorDomain = (NSString *)v69;

    objc_msgSend(v30, "threadNetworkID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_homeThreadCapable = v71 != 0;

    v162->_lastKnownLinkQuality = 5;
    objc_storeStrong((id *)&v162->_characteristicsInRequest, a4);
    v162->_triggerSource = a7;
    v162->_isWriteOperation = v16;
    v162->_isTimedWrite = a9;
    v162->_isLocal = a10;
    objc_msgSend(v24, "UUIDString");
    v72 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v162->_transactionIdentifier;
    v162->_transactionIdentifier = (NSString *)v72;

    v162->_isCached = a12;
    v162->_linkType = objc_msgSend(v26, "linkType");
    v162->_linkLayerType = objc_msgSend(v26, "linkLayerType");
    objc_msgSend(v154, "version");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "versionString");
    v75 = objc_claimAutoreleasedReturnValue();
    transportProtocolVersion = v162->_transportProtocolVersion;
    v162->_transportProtocolVersion = (NSString *)v75;

    +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:](HMDMetricsUtilities, "primaryServiceTypeForHAPAccessory:", v161);
    v77 = objc_claimAutoreleasedReturnValue();
    primaryServiceType = v162->_primaryServiceType;
    v162->_primaryServiceType = (NSString *)v77;

    if (v159)
    {
      objc_msgSend(v159, "UUIDString");
      v79 = objc_claimAutoreleasedReturnValue();
      userUUID = v162->_userUUID;
      v162->_userUUID = (NSString *)v79;
    }
    else
    {
      objc_msgSend(v30, "currentUser");
      userUUID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(userUUID, "uuid");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "UUIDString");
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v162->_userUUID;
      v162->_userUUID = (NSString *)v82;

    }
    objc_msgSend(v30, "spiClientIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "copy");
    homeUniqueIdentifier = v162->_homeUniqueIdentifier;
    v162->_homeUniqueIdentifier = (NSUUID *)v85;

    objc_msgSend(v30, "name");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "copy");
    homeName = v162->_homeName;
    v162->_homeName = (NSString *)v88;

    v90 = objc_msgSend(v30, "atHomeLevel") == 2 || objc_msgSend(v30, "atHomeLevel") == 3;
    v162->_isAtHome = v90;
    objc_msgSend(v30, "residentDeviceManager");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isResidentAvailable = objc_msgSend(v91, "isResidentAvailable");

    objc_msgSend(v30, "residentDeviceManager");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isCurrentDeviceAvailableResident = objc_msgSend(v92, "isCurrentDeviceAvailableResident");

    objc_msgSend(v30, "residentDeviceManager");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isCurrentDevicePrimaryResident = objc_msgSend(v93, "isCurrentDevicePrimaryResident");

    objc_msgSend(v30, "residentDeviceManager");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isCurrentDeviceConfirmedPrimaryResident = objc_msgSend(v94, "isCurrentDeviceConfirmedPrimaryResident");

    objc_msgSend(v30, "residentDeviceManager");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "primaryResidentDevice");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isPrimaryResidentReachable = objc_msgSend(v96, "isReachable");

    objc_msgSend(v30, "currentUser");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_isRemoteAccessAllowed = objc_msgSend(v97, "isRemoteAccessAllowed");

    v162->_isRemotelyReachable = objc_msgSend(v40, "isRemotelyReachable");
    v162->_isResidentFirstEnabled = objc_msgSend(v30, "isResidentFirstAccessoryCommunicationEnabled");
    v162->_isDeviceAtHome = objc_msgSend(v30, "homeLocation") == 1;
    v98 = v25;
    v99 = isInternalBuild();
    v100 = v98;
    v101 = v100;
    if (v100)
    {
      if ((HMDShouldRedactBundleIdForBuildType(v100, v99) & 1) != 0)
        v102 = CFSTR("External");
      else
        v102 = (const __CFString *)objc_msgSend(v101, "copy");
    }
    else
    {
      v102 = CFSTR("Unknown");
    }
    v150 = v24;

    bundleId = v162->_bundleId;
    v162->_bundleId = &v102->isa;

    v152 = v30;
    if (v30)
    {
      v148 = v26;
      -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](v162, "characteristicsInRequest");
      v104 = (id)objc_claimAutoreleasedReturnValue();
      v105 = v30;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v107 = v104;
      v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
      if (v108)
      {
        v109 = v108;
        v110 = *(_QWORD *)v167;
        do
        {
          for (i = 0; i != v109; ++i)
          {
            if (*(_QWORD *)v167 != v110)
              objc_enumerationMutation(v107);
            objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * i), "service");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v112;
            if (v112)
            {
              objc_msgSend(v112, "uuid");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "objectForKeyedSubscript:", v114);
              v115 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v115)
              {
                objc_msgSend(v105, "serviceGroups");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v164[0] = MEMORY[0x1E0C809B0];
                v164[1] = 3221225472;
                v164[2] = __90__HMDCharacteristicReadWriteLogEvent_serviceUUIDToServiceGroupsForCharacteristics_inHome___block_invoke;
                v164[3] = &unk_1E89B77D8;
                v117 = v113;
                v165 = v117;
                objc_msgSend(v116, "na_firstObjectPassingTest:", v164);
                v118 = (void *)objc_claimAutoreleasedReturnValue();

                if (v118)
                {
                  objc_msgSend(v117, "uuid");
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v106, "setObject:forKeyedSubscript:", v118, v119);

                }
              }
            }

          }
          v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v166, buf, 16);
        }
        while (v109);
      }

      v120 = (void *)objc_msgSend(v106, "copy");
      v26 = v148;
      v30 = v152;
      v25 = v153;
    }
    else
    {
      v120 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(v120, "na_dictionaryByMappingValues:", &__block_literal_global_137_136241);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "na_dictionaryByMappingValues:", &__block_literal_global_139_136242);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "copy");
    serviceUUIDToServiceGroupName = v162->_serviceUUIDToServiceGroupName;
    v162->_serviceUUIDToServiceGroupName = (NSDictionary *)v123;

    v125 = objc_msgSend(v121, "copy");
    serviceUUIDToServiceGroupUniqueIdentifier = v162->_serviceUUIDToServiceGroupUniqueIdentifier;
    v162->_serviceUUIDToServiceGroupUniqueIdentifier = (NSDictionary *)v125;

    v127 = (void *)MEMORY[0x1E0C9AA60];
    if (v30 && v157)
    {
      objc_msgSend(v157, "uuid");
      v128 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "zones");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __62__HMDCharacteristicReadWriteLogEvent_zonesForRoomUUID_inHome___block_invoke;
      v171 = &unk_1E89B77B0;
      v130 = v128;
      v172 = v130;
      objc_msgSend(v129, "na_filter:", buf);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v127, "na_map:", &__block_literal_global_141);
    v131 = objc_claimAutoreleasedReturnValue();
    accessoryZoneUniqueIdentifiers = v162->_accessoryZoneUniqueIdentifiers;
    v162->_accessoryZoneUniqueIdentifiers = (NSArray *)v131;

    objc_msgSend(v127, "na_map:", &__block_literal_global_142_136243);
    v133 = objc_claimAutoreleasedReturnValue();
    accessoryZoneNames = v162->_accessoryZoneNames;
    v162->_accessoryZoneNames = (NSArray *)v133;

    objc_msgSend(v30, "accessories");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_numAccessoriesInHome = objc_msgSend(v135, "count");

    objc_msgSend(v30, "actionSets");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = (void *)objc_msgSend(v136, "copy");

    objc_msgSend(v137, "na_filter:", &__block_literal_global_144);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v162->_numNonEmptyScenesInHome = objc_msgSend(v138, "count");

    objc_msgSend(v158, "accessoryProfiles");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "na_firstObjectPassingTest:", &__block_literal_global_146);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v140, "mediaRouteID");
    v141 = objc_claimAutoreleasedReturnValue();
    accessoryMediaRouteID = v162->_accessoryMediaRouteID;
    v162->_accessoryMediaRouteID = (NSString *)v141;

    v143 = objc_msgSend(v155, "copy");
    writtenValues = v162->_writtenValues;
    v162->_writtenValues = (NSArray *)v143;

    objc_msgSend(v161, "findServiceWithServiceType:", CFSTR("00000701-0000-1000-8000-0026BB765291"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    if (v145)
      v162->_threadAccessory = 1;
    objc_msgSend(v26, "server");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v146)
      v162->_isSentOverThread = 1;

    v24 = v150;
    v30 = v152;
    v29 = v155;
  }

  return v162;
}

- (void)setResidentFirstEndTime:(double)a3
{
  double v5;

  -[HMMLogEvent startTime](self, "startTime");
  -[HMDCharacteristicReadWriteLogEvent setResidentFirstDurationInMilliseconds:](self, "setResidentFirstDurationInMilliseconds:", (uint64_t)((a3 - v5) * 1000.0));
}

- (void)prepareForObservation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  void *v19;
  int64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  int64_t v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  int64_t v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)HMDCharacteristicReadWriteLogEvent;
  -[HMMLogEvent prepareForObservation](&v36, sel_prepareForObservation);
  +[HMDCharacteristicReadWriteLogEventManager sharedInstance](HMDCharacteristicReadWriteLogEventManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEvent error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");
  -[HMDCharacteristicReadWriteLogEvent accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleSubmittedErrorCode:forAccessoryUUID:", v5, v6);

  +[HMDCharacteristicReadWriteLogEventManager sharedInstance](HMDCharacteristicReadWriteLogEventManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicReadWriteLogEvent accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicReadWriteLogEvent setConsecutiveFailureCount:](self, "setConsecutiveFailureCount:", objc_msgSend(v7, "consecutiveFailureCountForAccessoryUUID:", v8));

  +[HMDCharacteristicReadWriteLogEventManager sharedInstance](HMDCharacteristicReadWriteLogEventManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicReadWriteLogEvent accessoryUUID](self, "accessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceFirstFailureForAccessoryUUID:", v10);
  -[HMDCharacteristicReadWriteLogEvent setTimeIntervalSinceFirstFailure:](self, "setTimeIntervalSinceFirstFailure:");

  if (-[HMDCharacteristicReadWriteLogEvent isCached](self, "isCached")
    || (v11 = -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal"), (v11 & 1) == 0))
  {
    v11 = -[HMDCharacteristicReadWriteLogEvent setIsSentOverThread:](self, "setIsSentOverThread:", 0);
  }
  v12 = (void *)MEMORY[0x1D17BA0A0](v11);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
      v14 = CFSTR("Writing");
    else
      v14 = CFSTR("Reading");
    -[HMDCharacteristicReadWriteLogEvent characteristicsInRequest](self, "characteristicsInRequest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v34, "count");
    -[HMDCharacteristicReadWriteLogEvent accessoryUUID](self, "accessoryUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicReadWriteLogEvent accessoryManufacturer](self, "accessoryManufacturer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMLogEvent error](self, "error");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds");
    v28 = -[HMDCharacteristicReadWriteLogEvent localDurationInMilliseconds](self, "localDurationInMilliseconds");
    v27 = -[HMDCharacteristicReadWriteLogEvent residentFirstDurationInMilliseconds](self, "residentFirstDurationInMilliseconds");
    if (-[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal"))
    {
      -[HMDCharacteristicReadWriteLogEvent linkType](self, "linkType");
      HAPLinkTypeDescription();
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = -[HMDCharacteristicReadWriteLogEvent transportType](self, "transportType");
      if (v17 > 6)
        v18 = 0;
      else
        v18 = off_1E89C1C90[v17];
      v16 = v18;
    }
    v26 = v16;
    +[HMDMetricsUtilities stringForSource:](HMDMetricsUtilities, "stringForSource:", -[HMDCharacteristicReadWriteLogEvent triggerSource](self, "triggerSource"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicReadWriteLogEvent isReachable](self, "isReachable");
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicReadWriteLogEvent hasSession](self, "hasSession");
    HMFBooleanToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDCharacteristicReadWriteLogEvent recentSessionRetries](self, "recentSessionRetries");
    -[HMDCharacteristicReadWriteLogEvent topSessionFailureErrorDomain](self, "topSessionFailureErrorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDCharacteristicReadWriteLogEvent topSessionFailureErrorCode](self, "topSessionFailureErrorCode");
    -[HMDCharacteristicReadWriteLogEvent isHomeThreadCapable](self, "isHomeThreadCapable");
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138547714;
    v38 = v35;
    v39 = 2114;
    v40 = v14;
    v41 = 2050;
    v42 = v15;
    v43 = 2114;
    v44 = v33;
    v45 = 2112;
    v46 = v32;
    v47 = 2114;
    v48 = v31;
    v49 = 2114;
    v50 = v30;
    v51 = 2048;
    v52 = v29;
    v53 = 2048;
    v54 = v28;
    v55 = 2048;
    v56 = v27;
    v57 = 2114;
    v58 = v26;
    v59 = 2114;
    v60 = v25;
    v61 = 2114;
    v62 = v24;
    v63 = 2114;
    v64 = v23;
    v65 = 2048;
    v66 = v22;
    v67 = 2112;
    v68 = v19;
    v69 = 2048;
    v70 = v20;
    v71 = 2114;
    v72 = v21;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[CA] HMDCharacteristicReadWriteLogEvent -- %{public}@ %{public}tu characteristic(s) on accessory %{public}@ (%@) completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@, Request source: %{public}@, isReachable:%{public}@, hasSession: %{public}@, recentSessionRetries: %lu, topSessionFailureErrorDomain: %@, topSessionFailureErrorCode: %ld, homeThreadCapable: %{public}@", buf, 0xB6u);

  }
  objc_autoreleasePoolPop(v12);
}

- (void)_setBtLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCharacteristicReadWriteLogEvent *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[HMDWirelessLoadManager sharedInstance](HMDWirelessLoadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBtLoadData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtLoadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btLoad = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtAudioTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btAudioTask = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtNonAudioTask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btNonAudioTask = objc_msgSend(v7, "intValue");

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v11;
    v14 = 1024;
    v15 = -[HMDCharacteristicReadWriteLogEvent btLoad](v9, "btLoad");
    v16 = 1024;
    v17 = -[HMDCharacteristicReadWriteLogEvent btAudioTask](v9, "btAudioTask");
    v18 = 1024;
    v19 = -[HMDCharacteristicReadWriteLogEvent btNonAudioTask](v9, "btNonAudioTask");
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@RW BT Load: %d AudioTsk: %d NonAudioTsk: %d", (uint8_t *)&v12, 0x1Eu);

  }
  objc_autoreleasePoolPop(v8);

}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.AccessoryReadWriteEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  __CFString *v32;
  unsigned int v33;
  __CFString *v34;
  __CFString *v35;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicReadWriteLogEvent accessoryCertificationStatus](self, "accessoryCertificationStatus");
  HMAccessoryCertificationStatusToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessoryCertificationStatus"));

  if ((isInternalBuild() & 1) != 0)
  {
    -[HMDCharacteristicReadWriteLogEvent accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessoryUUID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("accessoryUUID"));
  }
  -[HMDCharacteristicReadWriteLogEvent primaryServiceType](self, "primaryServiceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryPrimaryServiceType"));

  -[HMDCharacteristicReadWriteLogEvent bundleId](self, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (HMDShouldRedactBundleId(v8))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Third-party app"), CFSTR("appIdentifier"));
  }
  else
  {
    -[HMDCharacteristicReadWriteLogEvent bundleId](self, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appIdentifier"));

  }
  if ((isInternalBuild() & 1) != 0)
  {
    -[HMDCharacteristicReadWriteLogEvent clientMetricIdentifier](self, "clientMetricIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("clientMetricIdentifier"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("clientMetricIdentifier"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent communicationProtocol](self, "communicationProtocol"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("communicationProtocol"));

  -[HMDCharacteristicReadWriteLogEvent expectedTransport](self, "expectedTransport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("expectedTransport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent consecutiveFailureCount](self, "consecutiveFailureCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("consecutiveFailureCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCached](self, "isCached"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isCached"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isCurrentDeviceConfirmedPrimaryResident"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isCurrentDevicePrimaryResident"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isCurrentDeviceAvailableResident](self, "isCurrentDeviceAvailableResident"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isCurrentDeviceAvailableResident"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isPrimaryResidentReachable](self, "isPrimaryResidentReachable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isPrimaryResidentReachable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal") ^ 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isRemote"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isRemotelyReachable](self, "isRemotelyReachable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isRemotelyReachable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isRemoteAccessAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isResidentAvailable](self, "isResidentAvailable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isResidentAvailable"));

  if (-[HMDCharacteristicReadWriteLogEvent linkLayerType](self, "linkLayerType") == 4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isSentOverThread"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isSentOverThread](self, "isSentOverThread"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isSentOverThread"));

  }
  if (-[HMDCharacteristicReadWriteLogEvent linkLayerType](self, "linkLayerType") == 4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isThreadAccessory"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isThreadAccessory](self, "isThreadAccessory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isThreadAccessory"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isWrite"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isTimedWrite](self, "isTimedWrite"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isTimedWrite"));

  +[HMDMetricsUtilities stringForSource:](HMDMetricsUtilities, "stringForSource:", -[HMDCharacteristicReadWriteLogEvent triggerSource](self, "triggerSource"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("source"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCharacteristicReadWriteLogEvent timeIntervalSinceFirstFailure](self, "timeIntervalSinceFirstFailure");
  objc_msgSend(v28, "numberWithUnsignedLong:", (unint64_t)v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("timeElapsedSinceFirstFailure"));

  -[HMDCharacteristicReadWriteLogEvent transportProtocolVersion](self, "transportProtocolVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("transportProtocolVersion"));

  if (-[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal"))
  {
    -[HMDCharacteristicReadWriteLogEvent linkType](self, "linkType");
    HAPLinkTypeDescription();
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = -[HMDCharacteristicReadWriteLogEvent transportType](self, "transportType");
    if (v33 > 6)
      v34 = 0;
    else
      v34 = off_1E89C1C90[v33];
    v32 = v34;
  }
  v35 = v32;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("transportType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent linkLayerType](self, "linkLayerType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("linkLayerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isModernTransport](self, "isModernTransport"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isModernTransport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isSlowRapport](self, "isSlowRapport"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isSlowRapport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isDeviceAtHome](self, "isDeviceAtHome"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isDeviceAtHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent localDurationInMilliseconds](self, "localDurationInMilliseconds"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("localDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent residentFirstDurationInMilliseconds](self, "residentFirstDurationInMilliseconds"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("residentFirstDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btLoad](self, "btLoad"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("btLoad"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btAudioTask](self, "btAudioTask"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("btAudioTask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDCharacteristicReadWriteLogEvent btNonAudioTask](self, "btNonAudioTask"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("btNonAudioTask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent hasSession](self, "hasSession"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("hasActiveSession"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isReachable](self, "isReachable"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("isReachable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent recentSessionRetries](self, "recentSessionRetries"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("recentSessionRetries"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCharacteristicReadWriteLogEvent topSessionFailureErrorCode](self, "topSessionFailureErrorCode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("topSessionFailureErrorCode"));

  -[HMDCharacteristicReadWriteLogEvent topSessionFailureErrorDomain](self, "topSessionFailureErrorDomain");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("topSessionFailureErrorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCharacteristicReadWriteLogEvent isHomeThreadCapable](self, "isHomeThreadCapable"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("isHomeThreadCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCharacteristicReadWriteLogEvent lastKnownLinkQuality](self, "lastKnownLinkQuality"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("lastKnownLinkQuality"));

  v53 = (void *)MEMORY[0x1E0CB37E8];
  -[HMMLogEvent error](self, "error");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v54, "code"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("errorCode"));

  -[HMMLogEvent error](self, "error");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "domain");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("errorDomain"));

  -[HMMLogEvent error](self, "error");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "userInfo");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v61 = v60;
  else
    v61 = 0;
  v62 = v61;

  if (v62)
  {
    objc_msgSend(v62, "domain");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("underlyingErrorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v62, "code"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("underlyingErrorCode"));

  }
  -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "domain");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("residentFirstErrorDomain"));

    v68 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "code"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("residentFirstErrorCode"));

  }
  v71 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v71;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (BOOL)enabledForSiriSELFLogging
{
  return -[HMDCharacteristicReadWriteLogEvent triggerSource](self, "triggerSource") == 1;
}

- (SISchemaTopLevelUnionType)siriInstrumentationMessage
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  int64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = objc_alloc_init(MEMORY[0x1E0D996B8]);
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMDCharacteristicReadWriteLogEvent clientMetricIdentifier](self, "clientMetricIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v6);
  objc_msgSend(v3, "setSharedMetricsId:", v7);

  -[HMDCharacteristicReadWriteLogEvent accessoryCategory](self, "accessoryCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryCategory:", v8);

  v9 = -[HMDCharacteristicReadWriteLogEvent communicationProtocol](self, "communicationProtocol");
  if (v9 == 1)
    v10 = 1;
  else
    v10 = 2 * (v9 == 2);
  objc_msgSend(v3, "setCommunicationProtocol:", v10);
  v11 = -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal");
  v12 = -[HMDCharacteristicReadWriteLogEvent linkType](self, "linkType");
  v13 = -[HMDCharacteristicReadWriteLogEvent isSentOverThread](self, "isSentOverThread");
  -[HMDCharacteristicReadWriteLogEvent transportType](self, "transportType");
  v14 = 2 * (v12 == 2);
  if (v12 == 1)
    v14 = 1;
  if (v13)
    v14 = 3;
  if (v11)
    v15 = v14;
  else
    v15 = 4;
  objc_msgSend(v3, "setTransportType:", v15);
  if (-[HMDCharacteristicReadWriteLogEvent isWriteOperation](self, "isWriteOperation"))
    v16 = 2;
  else
    v16 = 1;
  objc_msgSend(v3, "setOperationType:", v16);
  objc_msgSend(v3, "setWasLocal:", -[HMDCharacteristicReadWriteLogEvent isLocal](self, "isLocal"));
  objc_msgSend(v3, "setWasCached:", -[HMDCharacteristicReadWriteLogEvent isCached](self, "isCached"));
  objc_msgSend(v3, "setWasRemoteAccessAllowed:", -[HMDCharacteristicReadWriteLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  objc_msgSend(v3, "setWasResidentFirstEnabled:", -[HMDCharacteristicReadWriteLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  objc_msgSend(v3, "setWasRapportSlow:", -[HMDCharacteristicReadWriteLogEvent isSlowRapport](self, "isSlowRapport"));
  objc_msgSend(v3, "setResidentFirstDuration:", -[HMDCharacteristicReadWriteLogEvent residentFirstDurationInMilliseconds](self, "residentFirstDurationInMilliseconds"));
  -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResidentFirstErrorDomain:", v18);

  -[HMDCharacteristicReadWriteLogEvent residentFirstError](self, "residentFirstError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResidentFirstErrorCode:", objc_msgSend(v19, "code"));

  objc_msgSend(v3, "setTotalDuration:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  -[HMMLogEvent error](self, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFinalErrorDomain:", v21);

  -[HMMLogEvent error](self, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFinalErrorCode:", objc_msgSend(v22, "code"));

  objc_msgSend(v3, "setConsecutiveFailureCount:", -[HMDCharacteristicReadWriteLogEvent consecutiveFailureCount](self, "consecutiveFailureCount"));
  v23 = objc_alloc_init(MEMORY[0x1E0D996C0]);
  objc_msgSend(v23, "setHomeKitAccessoryOperationReported:", v3);

  return (SISchemaTopLevelUnionType *)v23;
}

- (unint64_t)triggerSource
{
  return self->_triggerSource;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)accessoryCertificationStatus
{
  return self->_accessoryCertificationStatus;
}

- (NSString)accessoryCategory
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BOOL)isWriteOperation
{
  return self->_isWriteOperation;
}

- (BOOL)isTimedWrite
{
  return self->_isTimedWrite;
}

- (void)setIsTimedWrite:(BOOL)a3
{
  self->_isTimedWrite = a3;
}

- (NSString)primaryServiceType
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (void)setLinkLayerType:(int64_t)a3
{
  self->_linkLayerType = a3;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (NSString)expectedTransport
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)transportProtocolVersion
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)isSentOverThread
{
  return self->_isSentOverThread;
}

- (void)setIsSentOverThread:(BOOL)a3
{
  self->_isSentOverThread = a3;
}

- (int64_t)localDurationInMilliseconds
{
  return self->_localDurationInMilliseconds;
}

- (int64_t)residentFirstDurationInMilliseconds
{
  return self->_residentFirstDurationInMilliseconds;
}

- (void)setResidentFirstDurationInMilliseconds:(int64_t)a3
{
  self->_residentFirstDurationInMilliseconds = a3;
}

- (BOOL)isResidentFirstEnabled
{
  return self->_isResidentFirstEnabled;
}

- (void)setIsResidentFirstEnabled:(BOOL)a3
{
  self->_isResidentFirstEnabled = a3;
}

- (NSError)residentFirstError
{
  return (NSError *)objc_getProperty(self, a2, 224, 1);
}

- (void)setResidentFirstError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (BOOL)isModernTransport
{
  return self->_isModernTransport;
}

- (void)setIsModernTransport:(BOOL)a3
{
  self->_isModernTransport = a3;
}

- (BOOL)isSlowRapport
{
  return self->_isSlowRapport;
}

- (void)setIsSlowRapport:(BOOL)a3
{
  self->_isSlowRapport = a3;
}

- (BOOL)isDeviceAtHome
{
  return self->_isDeviceAtHome;
}

- (void)setIsDeviceAtHome:(BOOL)a3
{
  self->_isDeviceAtHome = a3;
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (BOOL)isPrimaryResidentReachable
{
  return self->_isPrimaryResidentReachable;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  return self->_isCurrentDeviceAvailableResident;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  return self->_isCurrentDeviceConfirmedPrimaryResident;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_isRemoteAccessAllowed;
}

- (BOOL)isRemotelyReachable
{
  return self->_isRemotelyReachable;
}

- (unint64_t)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (void)setConsecutiveFailureCount:(unint64_t)a3
{
  self->_consecutiveFailureCount = a3;
}

- (double)timeIntervalSinceFirstFailure
{
  return self->_timeIntervalSinceFirstFailure;
}

- (void)setTimeIntervalSinceFirstFailure:(double)a3
{
  self->_timeIntervalSinceFirstFailure = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_threadAccessory;
}

- (void)setThreadAccessory:(BOOL)a3
{
  self->_threadAccessory = a3;
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)isAtHome
{
  return self->_isAtHome;
}

- (NSString)userUUID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (unsigned)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (unsigned)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (NSString)accessoryName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 288, 1);
}

- (NSUUID)accessoryUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 296, 1);
}

- (NSUUID)accessoryRoomUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 304, 1);
}

- (NSString)accessoryRoomName
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)accessoryMediaRouteID
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (NSDictionary)serviceUUIDToServiceGroupUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (NSDictionary)serviceUUIDToServiceGroupName
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (NSArray)accessoryZoneUniqueIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (NSArray)accessoryZoneNames
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (NSArray)writtenValues
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (NSString)transactionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (NSString)clientMetricIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (BOOL)hasSession
{
  return self->_hasSession;
}

- (unint64_t)recentSessionRetries
{
  return self->_recentSessionRetries;
}

- (int64_t)topSessionFailureErrorCode
{
  return self->_topSessionFailureErrorCode;
}

- (NSString)topSessionFailureErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (BOOL)isHomeThreadCapable
{
  return self->_homeThreadCapable;
}

- (unint64_t)lastKnownLinkQuality
{
  return self->_lastKnownLinkQuality;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

BOOL __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "spiClientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__HMDCharacteristicReadWriteLogEvent_zonesForRoomUUID_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "roomUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "name");
}

uint64_t __198__HMDCharacteristicReadWriteLogEvent_initWithStartTime_characteristics_hmdAccessory_hapAccessory_source_isWriteOperation_isTimedWrite_isLocal_transactionId_isCached_bundleId_userUUID_writtenValues___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "spiClientIdentifier");
}

uint64_t __90__HMDCharacteristicReadWriteLogEvent_serviceUUIDToServiceGroupsForCharacteristics_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "serviceUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  return v6;
}

+ (id)eventWithCharacteristicsToWrite:(id)a3 hmdAccessory:(id)a4 hapAccessory:(id)a5 source:(unint64_t)a6 isTimedWrite:(BOOL)a7 isLocal:(BOOL)a8 transactionId:(id)a9 bundleId:(id)a10 userUUID:(id)a11 writtenValues:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDCharacteristicReadWriteLogEvent *v24;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;

  v28 = a7;
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LOBYTE(v27) = 0;
  LOBYTE(v26) = a8;
  v24 = -[HMDCharacteristicReadWriteLogEvent initWithCharacteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:]([HMDCharacteristicReadWriteLogEvent alloc], "initWithCharacteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:", v23, v22, v21, a6, 1, v28, v26, v20, v27, v19, v18, v17);

  return v24;
}

+ (id)eventWithStartTime:(double)a3 characteristicsToWrite:(id)a4 hmdAccessory:(id)a5 hapAccessory:(id)a6 source:(unint64_t)a7 isTimedWrite:(BOOL)a8 isLocal:(BOOL)a9 transactionId:(id)a10 bundleId:(id)a11 userUUID:(id)a12 writtenValues:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HMDCharacteristicReadWriteLogEvent *v26;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;

  v30 = a8;
  v19 = a13;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  LOBYTE(v29) = 0;
  LOBYTE(v28) = a9;
  v26 = -[HMDCharacteristicReadWriteLogEvent initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:]([HMDCharacteristicReadWriteLogEvent alloc], "initWithStartTime:characteristics:hmdAccessory:hapAccessory:source:isWriteOperation:isTimedWrite:isLocal:transactionId:isCached:bundleId:userUUID:writtenValues:", v25, v24, v23, a7, 1, v30, a3, v28, v22, v29, v21, v20, v19);

  return v26;
}

@end
