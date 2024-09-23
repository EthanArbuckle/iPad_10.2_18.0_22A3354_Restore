@implementation DSShutdownLog

- (void)addShutdownLogToArray:(id)a3 usingFormatter:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;

  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v8 = PLQueryRegistered(32, CFSTR("BatteryQueryForShutdownData"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = DiagnosticLogHandleForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BatteryQueryForShutdownData: %@", (uint8_t *)&v21, 0xCu);
    }

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryShutdownData")));
    if (v13)
    {
      v12 = v13;
      if (-[NSObject count](v13, "count"))
      {
        v14 = 0;
        do
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v14));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSShutdownLog processedBatteryShutdownDataEntry:](self, "processedBatteryShutdownDataEntry:", v15));

          if (v16)
          {
            v17 = v7[2](v7, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
            objc_msgSend(v6, "addObject:", v18);

          }
          ++v14;
        }
        while ((unint64_t)-[NSObject count](v12, "count") > v14);
      }
    }
    else
    {
      v19 = DiagnosticLogHandleForCategory(6);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BatteryShutdownData is empty", (uint8_t *)&v21, 2u);
      }

      v12 = 0;
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v21) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForShutdownData returned nil", (uint8_t *)&v21, 2u);
  }

}

- (id)processedBatteryShutdownDataEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
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
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  _QWORD v182[24];
  _QWORD v183[24];
  _QWORD v184[20];
  _QWORD v185[15];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BatteryShutdownTimestamp")));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formatterWithType:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v5));

      if (v8)
      {
        v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_1")));
        v9 = numberOrNull(v178);
        v174 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v185[0] = v174;
        v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_2")));
        v10 = numberOrNull(v171);
        v168 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v185[1] = v168;
        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_3")));
        v11 = numberOrNull(v165);
        v162 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v185[2] = v162;
        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_4")));
        v12 = numberOrNull(v159);
        v156 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v185[3] = v156;
        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_5")));
        v13 = numberOrNull(v153);
        v150 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v185[4] = v150;
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_6")));
        v14 = numberOrNull(v147);
        v144 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v185[5] = v144;
        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_7")));
        v15 = numberOrNull(v141);
        v138 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v185[6] = v138;
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_8")));
        v16 = numberOrNull(v135);
        v132 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v185[7] = v132;
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_9")));
        v17 = numberOrNull(v129);
        v126 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v185[8] = v126;
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_10")));
        v18 = numberOrNull(v123);
        v120 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v185[9] = v120;
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_11")));
        v19 = numberOrNull(v117);
        v181 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v185[10] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_12")));
        v22 = numberOrNull(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v185[11] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_13")));
        v25 = numberOrNull(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v185[12] = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_14")));
        v28 = numberOrNull(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v185[13] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RaTable_15")));
        v31 = numberOrNull(v30);
        v177 = v5;
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v185[14] = v32;
        v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v185, 15));

        v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_0")));
        v33 = numberOrNull(v175);
        v172 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v184[0] = v172;
        v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_1")));
        v34 = numberOrNull(v169);
        v166 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v184[1] = v166;
        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_2")));
        v35 = numberOrNull(v163);
        v160 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v184[2] = v160;
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_3")));
        v36 = numberOrNull(v157);
        v154 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v184[3] = v154;
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_4")));
        v37 = numberOrNull(v151);
        v148 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v184[4] = v148;
        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_5")));
        v38 = numberOrNull(v145);
        v142 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v184[5] = v142;
        v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_6")));
        v39 = numberOrNull(v139);
        v136 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v184[6] = v136;
        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_7")));
        v40 = numberOrNull(v133);
        v130 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v184[7] = v130;
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_8")));
        v41 = numberOrNull(v127);
        v124 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v184[8] = v124;
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_9")));
        v42 = numberOrNull(v121);
        v118 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v184[9] = v118;
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_10")));
        v43 = numberOrNull(v115);
        v113 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v184[10] = v113;
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_11")));
        v44 = numberOrNull(v111);
        v109 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v184[11] = v109;
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_12")));
        v45 = numberOrNull(v107);
        v105 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v184[12] = v105;
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_13")));
        v46 = numberOrNull(v103);
        v101 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v184[13] = v101;
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_14")));
        v47 = numberOrNull(v99);
        v97 = (void *)objc_claimAutoreleasedReturnValue(v47);
        v184[14] = v97;
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_15")));
        v48 = numberOrNull(v95);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v184[15] = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_16")));
        v51 = numberOrNull(v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v184[16] = v52;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_17")));
        v54 = numberOrNull(v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v184[17] = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_18")));
        v57 = numberOrNull(v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v184[18] = v58;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DLOG_19")));
        v60 = numberOrNull(v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
        v184[19] = v61;
        v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v184, 20));

        v183[0] = v181;
        v182[0] = CFSTR("timestamp");
        v182[1] = CFSTR("previousUIPercent");
        v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UISOC")));
        v62 = numberOrNull(v176);
        v173 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v183[1] = v173;
        v182[2] = CFSTR("temperature");
        v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Temperature")));
        v63 = numberOrNull(v170);
        v167 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v183[2] = v167;
        v182[3] = CFSTR("presentDepthOfDischarge");
        v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PresentDOD")));
        v64 = numberOrNull(v164);
        v161 = (void *)objc_claimAutoreleasedReturnValue(v64);
        v183[3] = v161;
        v182[4] = CFSTR("lifeTimeMaxRa08");
        v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaximumRa0-8")));
        v65 = numberOrNull(v158);
        v155 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v183[4] = v155;
        v182[5] = CFSTR("nominalChargeCapacity");
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NominalChargeCapacity")));
        v66 = numberOrNull(v152);
        v149 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v183[5] = v149;
        v182[6] = CFSTR("previousNominalChargeCapacity");
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NominalChargeCapacityPrevious")));
        v67 = numberOrNull(v146);
        v143 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v183[6] = v143;
        v182[7] = CFSTR("fullChargeCapacity");
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FullChargeCapacity")));
        v68 = numberOrNull(v140);
        v137 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v183[7] = v137;
        v182[8] = CFSTR("previousFullChargeCapacity");
        v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FullChargeCapacityPrevious")));
        v69 = numberOrNull(v134);
        v131 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v183[8] = v131;
        v182[9] = CFSTR("remainingCapacity");
        v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RemainingCapacity")));
        v70 = numberOrNull(v128);
        v125 = (void *)objc_claimAutoreleasedReturnValue(v70);
        v183[9] = v125;
        v182[10] = CFSTR("previousRemainingCapacity");
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RemainingCapacityPrevious")));
        v71 = numberOrNull(v122);
        v119 = (void *)objc_claimAutoreleasedReturnValue(v71);
        v183[10] = v119;
        v182[11] = CFSTR("cycleCount");
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CycleCount")));
        v72 = numberOrNull(v116);
        v114 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v183[11] = v114;
        v182[12] = CFSTR("lifetimeMaxDischargeCurrent");
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaximumDischargeCurrent")));
        v73 = numberOrNull(v112);
        v110 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v183[12] = v110;
        v182[13] = CFSTR("lifetimeTimeAbove95Percent");
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeAbove95Perc")));
        v74 = numberOrNull(v108);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v183[13] = v106;
        v182[14] = CFSTR("voltage");
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Voltage")));
        v75 = numberOrNull(v104);
        v102 = (void *)objc_claimAutoreleasedReturnValue(v75);
        v183[14] = v102;
        v182[15] = CFSTR("previousVoltage");
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoltagePrevious")));
        v76 = numberOrNull(v100);
        v98 = (void *)objc_claimAutoreleasedReturnValue(v76);
        v183[15] = v98;
        v182[16] = CFSTR("current");
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AverageCurrent")));
        v77 = numberOrNull(v96);
        v94 = (void *)objc_claimAutoreleasedReturnValue(v77);
        v183[16] = v94;
        v182[17] = CFSTR("previousCurrent");
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AverageCurrentPrevious")));
        v78 = numberOrNull(v93);
        v92 = (void *)objc_claimAutoreleasedReturnValue(v78);
        v183[17] = v92;
        v182[18] = CFSTR("lifetimeCyclesSincePreviousQmax");
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CycleCountLastQmax")));
        v80 = numberOrNull(v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
        v183[18] = v81;
        v182[19] = CFSTR("resistanceScaleValue");
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ResScale")));
        v83 = numberOrNull(v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
        v183[19] = v84;
        v182[20] = CFSTR("steadyStateResistance");
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RSS")));
        v86 = numberOrNull(v85);
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        v183[20] = v87;
        v183[21] = v180;
        v182[21] = CFSTR("rawRaData");
        v182[22] = CFSTR("averageCurrentSamples");
        v183[22] = v179;
        v182[23] = CFSTR("upoReboot");
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpoReboot")));
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[DSShutdownLog nullableBoolNumberWithNumber:](DSShutdownLog, "nullableBoolNumberWithNumber:", v88));
        v183[23] = v89;
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v183, v182, 24));

        v8 = v181;
        v5 = v177;

      }
      else
      {
        v90 = 0;
      }

    }
    else
    {
      v90 = 0;
    }

  }
  else
  {
    v90 = 0;
  }

  return v90;
}

+ (id)nullableBoolNumberWithNumber:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (+[DSShutdownLog isValidNumber:](DSShutdownLog, "isValidNumber:", v3))
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue")));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v5 = (void *)v4;

  return v5;
}

+ (id)nullableIntegerNumberWithNumber:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (+[DSShutdownLog isValidNumber:](DSShutdownLog, "isValidNumber:", v3))
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue")));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v5 = (void *)v4;

  return v5;
}

+ (BOOL)isValidNumber:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    v4 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

@end
