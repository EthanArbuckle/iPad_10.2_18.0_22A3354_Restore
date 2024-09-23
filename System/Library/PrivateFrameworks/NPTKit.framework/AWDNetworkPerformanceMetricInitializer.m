@implementation AWDNetworkPerformanceMetricInitializer

+ (id)createPerformanceMetricFromDictionary:(id)a3
{
  id v3;
  AWDNetworkPerformanceMetric *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
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
  void *v62;
  void *v63;
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
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(AWDNetworkPerformanceMetric);
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v166, v170, 16);
  if (v6)
  {
    v7 = v6;
    v8 = CFSTR("awdl_master_channel");
    v9 = CFSTR("awdl_op_mode");
    v10 = *(_QWORD *)v167;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v167 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isEqual:", CFSTR("acceptable_performance_result")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAcceptablePerformanceResult:](v4, "setAcceptablePerformanceResult:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_election_parameters")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlElectionParameters:](v4, "setAwdlElectionParameters:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", v8))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlMasterChannel:](v4, "setAwdlMasterChannel:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", v9))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlOpMode:](v4, "setAwdlOpMode:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_power_state")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlPowerState:](v4, "setAwdlPowerState:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_schedule")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlSchedule:](v4, "setAwdlSchedule:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_secondary_master_channel")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlSecondaryMasterChannel:](v4, "setAwdlSecondaryMasterChannel:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_sync_channel_sequence")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlSyncChannelSequence:](v4, "setAwdlSyncChannelSequence:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("awdl_sync_state")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setAwdlSyncState:](v4, "setAwdlSyncState:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("bt_connected_devices_count")))
        {
          v14 = v8;
          v15 = v9;
          v16 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setBtConnectedDevicesCount:](v4, "setBtConnectedDevicesCount:", v17);

          v9 = v15;
          v8 = v14;
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("bt_is_connectable")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setBtIsConnectable:](v4, "setBtIsConnectable:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("bt_is_discoverable")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setBtIsDiscoverable:](v4, "setBtIsDiscoverable:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("bt_is_power_on")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setBtIsPowerOn:](v4, "setBtIsPowerOn:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("bt_is_scanning")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setBtIsScanning:](v4, "setBtIsScanning:", v13 != 0);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("calling_client")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCallingClient:](v4, "setCallingClient:", v13);
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_active_contexts")))
        {
          v18 = v9;
          v19 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularActiveContexts:](v4, "setCellularActiveContexts:", v20);
          goto LABEL_38;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_allows_voip")))
        {
          v21 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@"), v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularAllowsVoip:](v4, "setCellularAllowsVoip:", v22 != 0);

          v9 = CFSTR("awdl_op_mode");
          goto LABEL_41;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_attached")))
        {
          v18 = v9;
          v23 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@"), v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularAttached:](v4, "setCellularAttached:", v20);
LABEL_38:

          v9 = v18;
LABEL_41:
          v8 = CFSTR("awdl_master_channel");
          goto LABEL_42;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_bandinfo")))
        {
          v18 = v9;
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@"), v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularBandinfo:](v4, "setCellularBandinfo:", v20);
          goto LABEL_38;
        }
        v8 = CFSTR("awdl_master_channel");
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_bandwidth")))
        {
          v25 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularBandwidth:](v4, "setCellularBandwidth:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_carrier_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularCarrierName:](v4, "setCellularCarrierName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_data_bearer_so_mask")))
        {
          v27 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularDataBearerSoMask:](v4, "setCellularDataBearerSoMask:", v26);
LABEL_51:

          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_data_bearer_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularDataBearerTechnology:](v4, "setCellularDataBearerTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_data_plan_signaling_reduction_override")))
        {
          v28 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularDataPlanSignalingReductionOverride:](v4, "setCellularDataPlanSignalingReductionOverride:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_data_possible")))
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularDataPossible:](v4, "setCellularDataPossible:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_in_home_country")))
        {
          v30 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularInHomeCountry:](v4, "setCellularInHomeCountry:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_indicator")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularIndicator:](v4, "setCellularIndicator:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_indicator_override")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularIndicatorOverride:](v4, "setCellularIndicatorOverride:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_iso_country_code")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularIsoCountryCode:](v4, "setCellularIsoCountryCode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_lqm")))
        {
          v31 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularLqm:](v4, "setCellularLqm:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_lte_max_scheduled_layers")))
        {
          v32 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularLteMaxScheduledLayers:](v4, "setCellularLteMaxScheduledLayers:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_mobile_country_code")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMobileCountryCode:](v4, "setCellularMobileCountryCode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_mobile_network_code")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMobileNetworkCode:](v4, "setCellularMobileNetworkCode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_coverage")))
        {
          v33 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioCoverage:](v4, "setCellularNewRadioCoverage:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_data_bearer")))
        {
          v34 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioDataBearer:](v4, "setCellularNewRadioDataBearer:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_mmwave_data_bearer")))
        {
          v35 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioMmwaveDataBearer:](v4, "setCellularNewRadioMmwaveDataBearer:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_nsa_coverage")))
        {
          v36 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioNsaCoverage:](v4, "setCellularNewRadioNsaCoverage:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_nsa_data_bearer")))
        {
          v37 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioNsaDataBearer:](v4, "setCellularNewRadioNsaDataBearer:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_sa_coverage")))
        {
          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioSaCoverage:](v4, "setCellularNewRadioSaCoverage:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_sa_data_bearer")))
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioSaDataBearer:](v4, "setCellularNewRadioSaDataBearer:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_new_radio_sub6_data_bearer")))
        {
          v40 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNewRadioSub6DataBearer:](v4, "setCellularNewRadioSub6DataBearer:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_configured_bw")))
        {
          v41 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrConfiguredBw:](v4, "setCellularNrConfiguredBw:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_layers")))
        {
          v42 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrLayers:](v4, "setCellularNrLayers:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_modulation")))
        {
          v43 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrModulation:](v4, "setCellularNrModulation:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_rsrp")))
        {
          v44 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrRsrp:](v4, "setCellularNrRsrp:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_rsrq")))
        {
          v45 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrRsrq:](v4, "setCellularNrRsrq:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_snr")))
        {
          v46 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrSnr:](v4, "setCellularNrSnr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_pid")))
        {
          v47 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularPid:](v4, "setCellularPid:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_radio_access_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnology:](v4, "setCellularRadioAccessTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_radio_access_technology_ct_data_status")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnologyCtDataStatus:](v4, "setCellularRadioAccessTechnologyCtDataStatus:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_roam_allowed")))
        {
          v48 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRoamAllowed:](v4, "setCellularRoamAllowed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_rsrp")))
        {
          v49 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRsrp:](v4, "setCellularRsrp:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_snr")))
        {
          v50 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularSnr:](v4, "setCellularSnr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_tac")))
        {
          v51 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTac:](v4, "setCellularTac:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_active_contexts")))
        {
          v52 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalActiveContexts:](v4, "setCellularTotalActiveContexts:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_bw")))
        {
          v53 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalBw:](v4, "setCellularTotalBw:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_ccs")))
        {
          v54 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalCcs:](v4, "setCellularTotalCcs:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_layers")))
        {
          v55 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalLayers:](v4, "setCellularTotalLayers:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_uarfcn")))
        {
          v56 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularUarfcn:](v4, "setCellularUarfcn:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_cdn_pop")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadCdnPop:](v4, "setDownloadCdnPop:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_cdn_uuid")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadCdnUuid:](v4, "setDownloadCdnUuid:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_connection_time")))
        {
          v57 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadConnectionTime:](v4, "setDownloadConnectionTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_domain_lookup_time")))
        {
          v58 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadDomainLookupTime:](v4, "setDownloadDomainLookupTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_end_data_bearer_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadEndDataBearerTechnology:](v4, "setDownloadEndDataBearerTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_end_primary_ipv4_interface")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadEndPrimaryIpv4Interface:](v4, "setDownloadEndPrimaryIpv4Interface:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_end_rat")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadEndRat:](v4, "setDownloadEndRat:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_file_size")))
        {
          v59 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadFileSize:](v4, "setDownloadFileSize:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_interface_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadInterfaceName:](v4, "setDownloadInterfaceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_interface_service_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadInterfaceServiceName:](v4, "setDownloadInterfaceServiceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_cellular")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsCellular:](v4, "setDownloadIsCellular:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_constrained")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsConstrained:](v4, "setDownloadIsConstrained:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_expensive")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsExpensive:](v4, "setDownloadIsExpensive:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_multipath")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsMultipath:](v4, "setDownloadIsMultipath:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_proxy_connection")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsProxyConnection:](v4, "setDownloadIsProxyConnection:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_is_reused_connection")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadIsReusedConnection:](v4, "setDownloadIsReusedConnection:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_max_speed_observed")))
        {
          v60 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadMaxSpeedObserved:](v4, "setDownloadMaxSpeedObserved:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_number_of_streams")))
        {
          v61 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadNumberOfStreams:](v4, "setDownloadNumberOfStreams:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_protocol_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadProtocolName:](v4, "setDownloadProtocolName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_remote_address")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadRemoteAddress:](v4, "setDownloadRemoteAddress:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_remote_port")))
        {
          v62 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadRemotePort:](v4, "setDownloadRemotePort:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_request_time")))
        {
          v63 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadRequestTime:](v4, "setDownloadRequestTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_request_to_response_time")))
        {
          v64 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadRequestToResponseTime:](v4, "setDownloadRequestToResponseTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_response_time")))
        {
          v65 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadResponseTime:](v4, "setDownloadResponseTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_secure_connection_time")))
        {
          v66 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadSecureConnectionTime:](v4, "setDownloadSecureConnectionTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_server")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadServer:](v4, "setDownloadServer:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_speed")))
        {
          v67 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadSpeed:](v4, "setDownloadSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_stable_speed")))
        {
          v68 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStableSpeed:](v4, "setDownloadStableSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_start_data_bearer_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStartDataBearerTechnology:](v4, "setDownloadStartDataBearerTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_start_primary_ipv4_interface")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStartPrimaryIpv4Interface:](v4, "setDownloadStartPrimaryIpv4Interface:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_start_rat")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStartRat:](v4, "setDownloadStartRat:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_is_apple_reachable")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkIsAppleReachable:](v4, "setNetworkIsAppleReachable:", v13 != 0);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_primary_ipv4_interface_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4InterfaceName:](v4, "setNetworkPrimaryIpv4InterfaceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_primary_ipv4_service_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4ServiceName:](v4, "setNetworkPrimaryIpv4ServiceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("nptkit_framework_version")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNptkitFrameworkVersion:](v4, "setNptkitFrameworkVersion:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("performance_test_start_time")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPerformanceTestStartTime:](v4, "setPerformanceTestStartTime:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_address")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingAddress:](v4, "setPingAddress:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_loss_percent")))
        {
          v69 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingLossPercent:](v4, "setPingLossPercent:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_max_latency")))
        {
          v70 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingMaxLatency:](v4, "setPingMaxLatency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_mean_latency")))
        {
          v71 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingMeanLatency:](v4, "setPingMeanLatency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_min_latency")))
        {
          v72 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingMinLatency:](v4, "setPingMinLatency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_standard_deviation")))
        {
          v73 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingStandardDeviation:](v4, "setPingStandardDeviation:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("power_battery_warning_level")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPowerBatteryWarningLevel:](v4, "setPowerBatteryWarningLevel:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("power_source_type")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPowerSourceType:](v4, "setPowerSourceType:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("power_state_caps")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPowerStateCaps:](v4, "setPowerStateCaps:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_active_processor_count")))
        {
          v74 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemActiveProcessorCount:](v4, "setSystemActiveProcessorCount:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_battery_level")))
        {
          v75 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemBatteryLevel:](v4, "setSystemBatteryLevel:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_battery_state")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemBatteryState:](v4, "setSystemBatteryState:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_device_class")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemDeviceClass:](v4, "setSystemDeviceClass:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_device_model")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemDeviceModel:](v4, "setSystemDeviceModel:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_low_power_mode_enabled")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemLowPowerModeEnabled:](v4, "setSystemLowPowerModeEnabled:", v13 != 0);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemName:](v4, "setSystemName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_os_variant")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemOsVariant:](v4, "setSystemOsVariant:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_physical_memory")))
        {
          v76 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemPhysicalMemory:](v4, "setSystemPhysicalMemory:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_powersource_connected")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemPowersourceConnected:](v4, "setSystemPowersourceConnected:", v13 != 0);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_processor_count")))
        {
          v77 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemProcessorCount:](v4, "setSystemProcessorCount:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("system_version")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setSystemVersion:](v4, "setSystemVersion:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_cdn_pop")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadCdnPop:](v4, "setUploadCdnPop:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_cdn_uuid")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadCdnUuid:](v4, "setUploadCdnUuid:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_connection_time")))
        {
          v78 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadConnectionTime:](v4, "setUploadConnectionTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_domain_lookup_time")))
        {
          v79 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadDomainLookupTime:](v4, "setUploadDomainLookupTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_end_data_bearer_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadEndDataBearerTechnology:](v4, "setUploadEndDataBearerTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_end_primary_ipv4_interface")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadEndPrimaryIpv4Interface:](v4, "setUploadEndPrimaryIpv4Interface:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_end_rat")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadEndRat:](v4, "setUploadEndRat:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_file_size")))
        {
          v80 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadFileSize:](v4, "setUploadFileSize:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_interface_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadInterfaceName:](v4, "setUploadInterfaceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_interface_service_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadInterfaceServiceName:](v4, "setUploadInterfaceServiceName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_cellular")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsCellular:](v4, "setUploadIsCellular:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_constrained")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsConstrained:](v4, "setUploadIsConstrained:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_expensive")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsExpensive:](v4, "setUploadIsExpensive:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_multipath")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsMultipath:](v4, "setUploadIsMultipath:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_proxy_connection")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsProxyConnection:](v4, "setUploadIsProxyConnection:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_is_reused_connection")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadIsReusedConnection:](v4, "setUploadIsReusedConnection:", objc_msgSend(v13, "BOOLValue"));
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_max_speed_observed")))
        {
          v81 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadMaxSpeedObserved:](v4, "setUploadMaxSpeedObserved:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_number_of_streams")))
        {
          v82 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadNumberOfStreams:](v4, "setUploadNumberOfStreams:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_protocol_name")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadProtocolName:](v4, "setUploadProtocolName:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_remote_address")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadRemoteAddress:](v4, "setUploadRemoteAddress:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_remote_port")))
        {
          v83 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadRemotePort:](v4, "setUploadRemotePort:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_request_time")))
        {
          v84 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadRequestTime:](v4, "setUploadRequestTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_request_to_response_time")))
        {
          v85 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadRequestToResponseTime:](v4, "setUploadRequestToResponseTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_response_time")))
        {
          v86 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadResponseTime:](v4, "setUploadResponseTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_secure_connection_time")))
        {
          v87 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadSecureConnectionTime:](v4, "setUploadSecureConnectionTime:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_server")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadServer:](v4, "setUploadServer:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_speed")))
        {
          v88 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadSpeed:](v4, "setUploadSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_stable_speed")))
        {
          v89 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStableSpeed:](v4, "setUploadStableSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_start_data_bearer_technology")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStartDataBearerTechnology:](v4, "setUploadStartDataBearerTechnology:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_start_primary_ipv4_interface")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStartPrimaryIpv4Interface:](v4, "setUploadStartPrimaryIpv4Interface:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_start_rat")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStartRat:](v4, "setUploadStartRat:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("use_wifi_was_specified")))
        {
          v90 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUseWifiWasSpecified:](v4, "setUseWifiWasSpecified:", v26 != 0);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_average_phy_rate_rx")))
        {
          v91 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiAveragePhyRateRx:](v4, "setWifiAveragePhyRateRx:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_average_rssi")))
        {
          v92 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiAverageRssi:](v4, "setWifiAverageRssi:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_average_snr")))
        {
          v93 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiAverageSnr:](v4, "setWifiAverageSnr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_average_tcp_rtt")))
        {
          v94 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiAverageTcpRtt:](v4, "setWifiAverageTcpRtt:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_btc_mode")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiBtcMode:](v4, "setWifiBtcMode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_cca")))
        {
          v95 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiCca:](v4, "setWifiCca:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_channel")))
        {
          v96 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiChannel:](v4, "setWifiChannel:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_cwf_cca")))
        {
          v97 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiCwfCca:](v4, "setWifiCwfCca:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_eapol_control_mode")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiEapolControlMode:](v4, "setWifiEapolControlMode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_eapol_supplicant_state")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiEapolSupplicantState:](v4, "setWifiEapolSupplicantState:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_guard_interval")))
        {
          v98 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiGuardInterval:](v4, "setWifiGuardInterval:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_hidden_state")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiHiddenState:](v4, "setWifiHiddenState:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_is_captive")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiIsCaptive:](v4, "setWifiIsCaptive:", v13 != 0);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_mcs_index")))
        {
          v99 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiMcsIndex:](v4, "setWifiMcsIndex:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_noise")))
        {
          v100 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiNoise:](v4, "setWifiNoise:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_number_of_spatial_streams")))
        {
          v101 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiNumberOfSpatialStreams:](v4, "setWifiNumberOfSpatialStreams:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_op_mode")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiOpMode:](v4, "setWifiOpMode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_phy_mode")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiPhyMode:](v4, "setWifiPhyMode:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_rssi")))
        {
          v102 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiRssi:](v4, "setWifiRssi:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_security")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiSecurity:](v4, "setWifiSecurity:", v13);
          goto LABEL_54;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_tx_rate")))
        {
          v103 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiTxRate:](v4, "setWifiTxRate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wrm_channel_type")))
        {
          v104 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWrmChannelType:](v4, "setWrmChannelType:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_cellid")))
        {
          v105 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularCellid:](v4, "setCellularCellid:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_responsiveness")))
        {
          v106 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityResponsiveness:](v4, "setNetworkQualityResponsiveness:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_aggregated_DL_BW")))
        {
          v107 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularAggregatedDLBW:](v4, "setCellularAggregatedDLBW:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_aggregated_UL_BW")))
        {
          v108 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularAggregatedULBW:](v4, "setCellularAggregatedULBW:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_issa")))
        {
          v109 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularIssa:](v4, "setCellularIssa:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_lac")))
        {
          v110 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularLac:](v4, "setCellularLac:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_lte_nr_configured_bw")))
        {
          v111 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularLteNrConfiguredBw:](v4, "setCellularLteNrConfiguredBw:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_max_dl_mod")))
        {
          v112 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMaxDlMod:](v4, "setCellularMaxDlMod:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_max_nw_mimo_lyr")))
        {
          v113 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMaxNwMimoLyr:](v4, "setCellularMaxNwMimoLyr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_max_schd_mimo_lyr")))
        {
          v114 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMaxSchdMimoLyr:](v4, "setCellularMaxSchdMimoLyr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_max_ue_rank")))
        {
          v115 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMaxUeRank:](v4, "setCellularMaxUeRank:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_max_ul_mod")))
        {
          v116 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularMaxUlMod:](v4, "setCellularMaxUlMod:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nr_sinr")))
        {
          v117 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrSinr:](v4, "setCellularNrSinr:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_nrarfcn")))
        {
          v118 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularNrarfcn:](v4, "setCellularNrarfcn:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_radio_frequency")))
        {
          v119 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRadioFrequency:](v4, "setCellularRadioFrequency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_dl_mimo_layers")))
        {
          v120 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalDlMimoLayers:](v4, "setCellularTotalDlMimoLayers:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_total_num_ccs")))
        {
          v121 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularTotalNumCcs:](v4, "setCellularTotalNumCcs:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_start_radio_frequency")))
        {
          v122 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStartRadioFrequency:](v4, "setDownloadStartRadioFrequency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_end_radio_frequency")))
        {
          v123 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadEndRadioFrequency:](v4, "setDownloadEndRadioFrequency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_primary_ipv6_interface_name")))
        {
          v124 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6InterfaceName:](v4, "setNetworkPrimaryIpv6InterfaceName:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_primary_ipv6_service_name")))
        {
          v125 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6ServiceName:](v4, "setNetworkPrimaryIpv6ServiceName:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_start_radio_frequency")))
        {
          v126 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStartRadioFrequency:](v4, "setUploadStartRadioFrequency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_end_radio_frequency")))
        {
          v127 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadEndRadioFrequency:](v4, "setUploadEndRadioFrequency:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_error")))
        {
          v128 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadError:](v4, "setDownloadError:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_error")))
        {
          v129 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityError:](v4, "setNetworkQualityError:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_download_speed")))
        {
          v130 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityDownloadSpeed:](v4, "setNetworkQualityDownloadSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_upload_speed")))
        {
          v131 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityUploadSpeed:](v4, "setNetworkQualityUploadSpeed:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_rating")))
        {
          v132 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityRating:](v4, "setNetworkQualityRating:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("vpn_status")))
        {
          v133 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setVpnConnectionState:](v4, "setVpnConnectionState:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_error")))
        {
          v134 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadError:](v4, "setUploadError:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_error_domain")))
        {
          v135 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadErrorDomain:](v4, "setUploadErrorDomain:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_error_code")))
        {
          v136 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadErrorCode:](v4, "setUploadErrorCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_error_domain")))
        {
          v137 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadErrorDomain:](v4, "setDownloadErrorDomain:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_error_code")))
        {
          v138 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadErrorCode:](v4, "setDownloadErrorCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_error")))
        {
          v139 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingError:](v4, "setPingError:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_error_domain")))
        {
          v140 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingErrorDomain:](v4, "setPingErrorDomain:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("ping_error_code")))
        {
          v141 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setPingErrorCode:](v4, "setPingErrorCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_error_domain")))
        {
          v142 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityErrorDomain:](v4, "setNetworkQualityErrorDomain:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("network_quality_error_code")))
        {
          v143 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setNetworkQualityErrorCode:](v4, "setNetworkQualityErrorCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_rn_mobile_country_code")))
        {
          v144 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRnMobileCountryCode:](v4, "setCellularRnMobileCountryCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_rn_mobile_network_code")))
        {
          v145 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularRnMobileNetworkCode:](v4, "setCellularRnMobileNetworkCode:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("cellular_data_is_enabled")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setCellularDataIsEnabled:](v4, "setCellularDataIsEnabled:", objc_msgSend(v13, "BOOLValue"));
LABEL_54:
          v9 = CFSTR("awdl_op_mode");
LABEL_42:

          goto LABEL_43;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_start_cellular_estimate")))
        {
          v146 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadStartCellularEstimate:](v4, "setDownloadStartCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_end_cellular_estimate")))
        {
          v147 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadEndCellularEstimate:](v4, "setDownloadEndCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_max_cellular_estimate")))
        {
          v148 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadMaxCellularEstimate:](v4, "setDownloadMaxCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_start_cellular_estimate")))
        {
          v149 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadStartCellularEstimate:](v4, "setUploadStartCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_end_cellular_estimate")))
        {
          v150 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadEndCellularEstimate:](v4, "setUploadEndCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_max_cellular_estimate")))
        {
          v151 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadMaxCellularEstimate:](v4, "setUploadMaxCellularEstimate:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_responsiveness")))
        {
          v152 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadResponsiveness:](v4, "setDownloadResponsiveness:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_responsiveness_confidence")))
        {
          v153 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadResponsivenessConfidence:](v4, "setDownloadResponsivenessConfidence:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_responsiveness_rating")))
        {
          v154 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadResponsivenessRating:](v4, "setDownloadResponsivenessRating:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_speed_confidence")))
        {
          v155 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadSpeedConfidence:](v4, "setDownloadSpeedConfidence:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("download_speed_rating")))
        {
          v156 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setDownloadSpeedRating:](v4, "setDownloadSpeedRating:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_responsiveness")))
        {
          v157 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadResponsiveness:](v4, "setUploadResponsiveness:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_responsiveness_confidence")))
        {
          v158 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadResponsivenessConfidence:](v4, "setUploadResponsivenessConfidence:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_responsiveness_rating")))
        {
          v159 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadResponsivenessRating:](v4, "setUploadResponsivenessRating:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_speed_confidence")))
        {
          v160 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadSpeedConfidence:](v4, "setUploadSpeedConfidence:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("upload_speed_rating")))
        {
          v161 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setUploadSpeedRating:](v4, "setUploadSpeedRating:", v26);
          goto LABEL_51;
        }
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_channel_band")))
        {
          v162 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiChannelBand:](v4, "setWifiChannelBand:", v26);
          goto LABEL_51;
        }
        v9 = CFSTR("awdl_op_mode");
        if (objc_msgSend(v12, "isEqual:", CFSTR("wifi_channel_width")))
        {
          v163 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "stringWithFormat:", CFSTR("%@"), v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AWDNetworkPerformanceMetric setWifiChannelWidth:](v4, "setWifiChannelWidth:", v26);
          goto LABEL_51;
        }
LABEL_43:
        ++v11;
      }
      while (v7 != v11);
      v164 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v166, v170, 16);
      v7 = v164;
    }
    while (v164);
  }

  return v4;
}

@end
