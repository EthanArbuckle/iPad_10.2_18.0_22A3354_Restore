@implementation CalAssistantEventCommit

- (id)eventStore
{
  uint64_t v2;
  EKEventStore *eventStore;
  EKEventStore *v5;
  EKEventStore *v6;

  eventStore = self->_eventStore;
  if (!eventStore)
  {
    objc_msgSend__ca_eventStoreWithError_(MEMORY[0x24BDC74E8], a2, 0, v2);
    v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventStore;
    self->_eventStore = v5;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

- (void)setEventStore:(id)a3
{
  EKEventStore *v5;
  EKEventStore *v6;

  v5 = (EKEventStore *)a3;
  if (self->_eventStore != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_eventStore, a3);
    v5 = v6;
  }

}

- (id)_validateEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend_title(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_startDate(v3, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endDate(v3, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v15;
    if (v11)
    {
      if (v15)
      {
        if (objc_msgSend_compare_(v11, v16, v15, v17) != 1)
        {
          v23 = 0;
          goto LABEL_10;
        }
        v19 = CFSTR("End date cannot be earlier than start date");
      }
      else
      {
        v19 = CFSTR("No end date specified");
      }
    }
    else
    {
      v19 = CFSTR("No start date specified");
    }
    v24 = objc_alloc(MEMORY[0x24BE811A8]);
    v23 = (void *)objc_msgSend_initWithReason_(v24, v25, (uint64_t)v19, v26);
LABEL_10:

    goto LABEL_11;
  }
  v20 = objc_alloc(MEMORY[0x24BE811A8]);
  v23 = (void *)objc_msgSend_initWithReason_(v20, v21, (uint64_t)CFSTR("No title specified"), v22);
LABEL_11:

  return v23;
}

- (id)_commitEvent:(id)a3 serviceHelper:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  id v70;
  const char *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  NSObject *v97;
  NSObject *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  CFAbsoluteTime v123;
  CFAbsoluteTime v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  NSObject *v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  NSObject *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t i;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  NSObject *v226;
  NSObject *v227;
  int v228;
  void *v229;
  void *v230;
  const char *v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  NSObject *v243;
  NSObject *v244;
  id v245;
  id v246;
  id v247;
  id v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  id v253;
  const char *v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t j;
  void *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  void *v271;
  void *v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  NSObject *v292;
  NSObject *v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  void *v306;
  NSObject *v307;
  NSObject *v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  NSObject *v315;
  NSObject *v316;
  id v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t k;
  void *v326;
  id v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  NSObject *v335;
  NSObject *v336;
  const char *v337;
  uint64_t v338;
  const char *v339;
  id v340;
  id v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  char v347;
  id v348;
  NSObject *v349;
  NSObject *v350;
  const void *v351;
  void *v352;
  NSObject *v353;
  void *AceEventFromEKEvent_0;
  NSObject *v355;
  NSObject *v356;
  id v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  NSObject *v363;
  id v364;
  const char *v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  id v370;
  const char *v371;
  uint64_t v372;
  void *v374;
  void *v375;
  id v376;
  const char *v377;
  uint64_t v378;
  id v379;
  id v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  int v385;
  void *v386;
  __CFString *v387;
  void *v388;
  void *v389;
  void *v390;
  void *cf;
  void *v392;
  int v394;
  void *v395;
  void *v396;
  void *v397;
  id obj;
  int isDefaultSchedulingCalendar;
  id v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  _BYTE v413[128];
  _BYTE v414[128];
  _BYTE v415[128];
  CFGregorianUnits units;
  __int16 v417;
  void *v418;
  uint64_t v419;

  v419 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  sub_22665D4E4();
  v7 = (id)qword_25586B420;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_226662904();

  v8 = (id)*MEMORY[0x24BE08FF0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_22666287C();

  objc_msgSend_timeZoneId(v5, v9, v10, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (uint64_t)CFTimeZoneCreateWithName(0, v12, 1u);
  else
    v13 = CalCopyTimeZone();
  v17 = v13;
  if (v13)
  {
    objc_msgSend_eventStore(self, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    cf = (void *)v17;
    objc_msgSend_setTimeZone_(v18, v19, v17, v20);

    objc_msgSend_startDate(v5, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endDate(v5, v25, v26, v27);
    v392 = (void *)objc_claimAutoreleasedReturnValue();
    sub_22665D4E4();
    v28 = (id)qword_25586B420;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v379 = (id)objc_opt_class();
      units.years = 138412802;
      *(_QWORD *)&units.months = v379;
      LOWORD(units.hours) = 2112;
      *(_QWORD *)((char *)&units.hours + 2) = v24;
      *((_WORD *)&units.minutes + 3) = 2112;
      *(_QWORD *)&units.seconds = v392;
      _os_log_debug_impl(&dword_22665B000, v28, OS_LOG_TYPE_DEBUG, "[%@] - Giving event start date %@ and end date %@", (uint8_t *)&units, 0x20u);

    }
    v29 = (id)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v380 = (id)objc_opt_class();
      units.years = 136315906;
      *(_QWORD *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
      LOWORD(units.hours) = 2112;
      *(_QWORD *)((char *)&units.hours + 2) = v380;
      *((_WORD *)&units.minutes + 3) = 2112;
      *(_QWORD *)&units.seconds = v24;
      v417 = 2112;
      v418 = v392;
      _os_log_debug_impl(&dword_22665B000, v29, OS_LOG_TYPE_DEBUG, "%s [%@] - Giving event start date %@ and end date %@", (uint8_t *)&units, 0x2Au);

    }
    objc_msgSend_identifier(v5, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheme(v33, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v41 = (void *)v37;
      objc_msgSend_identifier(v5, v38, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scheme(v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_compare_options_(v46, v47, *MEMORY[0x24BDC7578], 1);

      if (!v48)
      {
        sub_22665D4E4();
        v52 = (id)qword_25586B420;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          sub_2266627E8();

        v53 = (id)*MEMORY[0x24BE08FF0];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          sub_226662750();

        objc_msgSend_eventStore(self, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v5, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__eventWithURI_checkValid_(v57, v62, (uint64_t)v61, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        sub_22665D4E4();
        v64 = (id)qword_25586B420;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          sub_2266626B4();

        v65 = (id)*MEMORY[0x24BE08FF0];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          sub_2266625E8();

        if (v63)
        {
          if ((objc_msgSend_isEditable(v63, v49, v50, v51) & 1) == 0)
          {
            sub_22665D4E4();
            v374 = (void *)qword_25586B420;
            if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_ERROR))
              sub_226662560(v374);
            v375 = (void *)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_ERROR))
              sub_2266624C0(v375);
            CFRelease(cf);
            v376 = objc_alloc(MEMORY[0x24BE811A8]);
            v73 = (id)objc_msgSend_initWithReason_(v376, v377, (uint64_t)CFSTR("Can't modify a read-only event."), v378);
            goto LABEL_169;
          }
          v69 = 1;
LABEL_33:
          objc_msgSend_title(v5, v66, v67, v68);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend_title(v5, v91, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setTitle_(v63, v95, (uint64_t)v94, v96);

            sub_22665D4E4();
            v97 = (id)qword_25586B420;
            if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
              sub_2266622E0();

            v98 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              sub_226662248();

          }
          objc_msgSend_location(v5, v91, v92, v93);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          if (v99)
          {
            objc_msgSend_location(v5, v100, v101, v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setLocation_(v63, v104, (uint64_t)v103, v105);

            sub_22665D4E4();
            v106 = (id)qword_25586B420;
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
              sub_2266621B4();

            v107 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              sub_22666211C();

          }
          objc_msgSend_notes(v5, v100, v101, v102);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (v108)
          {
            objc_msgSend_notes(v5, v109, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setNotes_(v63, v113, (uint64_t)v112, v114);

            sub_22665D4E4();
            v115 = (id)qword_25586B420;
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
              sub_226662088();

            v116 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
              sub_226661FF0();

          }
          objc_msgSend_setStartDate_(v63, v109, (uint64_t)v24, v111);
          v120 = (uint64_t)v392;
          if (!v392)
          {
            objc_msgSend_endDate(v63, v117, v118, v119);
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            if (v121)
            {
              v120 = 0;
            }
            else
            {
              objc_msgSend_timeIntervalSinceReferenceDate(v24, v117, v122, v119);
              *(_QWORD *)&units.years = 0;
              *(_QWORD *)&units.days = 0x100000000;
              *(_QWORD *)&units.minutes = 0;
              units.seconds = 0.0;
              v124 = CFAbsoluteTimeAddGregorianUnits(v123, (CFTimeZoneRef)cf, &units);
              objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x24BDBCE60], v125, v126, v127, v124);
              v120 = objc_claimAutoreleasedReturnValue();
            }
          }
          v392 = (void *)v120;
          objc_msgSend_setEndDate_(v63, v117, v120, v119);
          objc_msgSend_setTimeZone_(v63, v128, (uint64_t)cf, v129);
          v133 = objc_msgSend_allDay(v5, v130, v131, v132);
          objc_msgSend_setAllDay_(v63, v134, v133, v135);
          sub_22665D4E4();
          v136 = (id)qword_25586B420;
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            sub_226661F00((uint64_t)self, v63, v136);

          v137 = (id)*MEMORY[0x24BE08FF0];
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
            sub_226661DFC((uint64_t)self, v63, v137);

          objc_msgSend_attendees(v5, v138, v139, v140);
          v390 = (void *)objc_claimAutoreleasedReturnValue();
          v387 = v12;
          v388 = v6;
          v386 = v24;
          v389 = v5;
          if (objc_msgSend_count(v390, v141, v142, v143))
          {
            sub_22665D4E4();
            v147 = (id)qword_25586B420;
            if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
              sub_226661D70();

            v148 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
              sub_226661CD0();

            objc_msgSend_array(MEMORY[0x24BDBCEB8], v149, v150, v151);
            v395 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_calendar(v63, v152, v153, v154);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_source(v155, v156, v157, v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_constraints(v159, v160, v161, v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v167 = objc_msgSend_supportsOutgoingInvitations(v163, v164, v165, v166);

            if (v167)
            {
              objc_msgSend_constraints(v159, v168, v169, v170);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = objc_msgSend_requiresOutgoingInvitationsInDefaultCalendar(v171, v172, v173, v174);

              if (v175)
                isDefaultSchedulingCalendar = objc_msgSend_isDefaultSchedulingCalendar(v155, v176, v177, v178);
              else
                isDefaultSchedulingCalendar = 1;
            }
            else
            {
              isDefaultSchedulingCalendar = 0;
            }
            sub_22665D4E4();
            v179 = (id)qword_25586B420;
            if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
              sub_226661C38();
            v383 = v155;
            v385 = v69;

            v180 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
              sub_226661B88();
            v381 = v159;
            v396 = v63;

            v411 = 0u;
            v412 = 0u;
            v409 = 0u;
            v410 = 0u;
            obj = v390;
            v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v181, (uint64_t)&v409, (uint64_t)v415, 16);
            if (v182)
            {
              v186 = v182;
              v394 = 0;
              v187 = *(_QWORD *)v410;
              do
              {
                for (i = 0; i != v186; ++i)
                {
                  if (*(_QWORD *)v410 != v187)
                    objc_enumerationMutation(obj);
                  v189 = *(void **)(*((_QWORD *)&v409 + 1) + 8 * i);
                  objc_msgSend_object(v189, v183, v184, v185);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v193)
                  {
                    objc_msgSend_data(v189, v190, v191, v192);
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_displayText(v189, v195, v196, v197);
                    v198 = (void *)objc_claimAutoreleasedReturnValue();
                    v199 = (void *)MEMORY[0x24BE19120];
                    objc_msgSend_identifier(v193, v200, v201, v202);
                    v203 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_externalIdentifierFromAssistantID_(v199, v204, (uint64_t)v203, v205);
                    v206 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_emails(v193, v207, v208, v209);
                    v210 = (void *)objc_claimAutoreleasedReturnValue();
                    v214 = objc_msgSend_count(v210, v211, v212, v213);

                    if (v214)
                    {
                      objc_msgSend_emails(v193, v215, v216, v217);
                      v218 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectAtIndex_(v218, v219, 0, v220);
                      v221 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_emailAddress(v221, v222, v223, v224);
                      v225 = (void *)objc_claimAutoreleasedReturnValue();

                      sub_22665D4E4();
                      v226 = (id)qword_25586B420;
                      if (os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG))
                      {
                        v245 = (id)objc_opt_class();
                        units.years = 138412546;
                        *(_QWORD *)&units.months = v245;
                        LOWORD(units.hours) = 2112;
                        *(_QWORD *)((char *)&units.hours + 2) = v225;
                        _os_log_debug_impl(&dword_22665B000, v226, OS_LOG_TYPE_DEBUG, "[%@] - Attendee has email %@", (uint8_t *)&units, 0x16u);

                      }
                      v227 = (id)*MEMORY[0x24BE08FF0];
                      if (os_log_type_enabled(v227, OS_LOG_TYPE_DEBUG))
                      {
                        v246 = (id)objc_opt_class();
                        units.years = 136315650;
                        *(_QWORD *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
                        LOWORD(units.hours) = 2112;
                        *(_QWORD *)((char *)&units.hours + 2) = v246;
                        *((_WORD *)&units.minutes + 3) = 2112;
                        *(_QWORD *)&units.seconds = v225;
                        _os_log_debug_impl(&dword_22665B000, v227, OS_LOG_TYPE_DEBUG, "%s [%@] - Attendee has email %@", (uint8_t *)&units, 0x20u);

                      }
                    }
                    else
                    {
                      v225 = v194;
                    }
                    v228 = isDefaultSchedulingCalendar;
                    if (!v225)
                      v228 = 0;
                    if (v228 == 1)
                    {
                      v229 = (void *)MEMORY[0x24BDC7478];
                      if (v206)
                      {
                        objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v215, (uint64_t)v206, v217);
                        v230 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_attendeeWithName_emailAddress_phoneNumber_url_(v229, v231, (uint64_t)v198, (uint64_t)v225, 0, v230);
                        v232 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        objc_msgSend_attendeeWithName_emailAddress_phoneNumber_url_(MEMORY[0x24BDC7478], v215, (uint64_t)v198, (uint64_t)v225, 0, 0);
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend_setParticipantType_(v232, v233, 1, v234);
                      objc_msgSend_setParticipantStatus_(v232, v235, 0, v236);
                      objc_msgSend_setParticipantRole_(v232, v237, 1, v238);
                      objc_msgSend_addObject_(v395, v239, (uint64_t)v232, v240);
                      objc_msgSend_addAttendee_(v396, v241, (uint64_t)v232, v242);
                      sub_22665D4E4();
                      v243 = (id)qword_25586B420;
                      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG))
                      {
                        v247 = (id)objc_opt_class();
                        units.years = 138412546;
                        *(_QWORD *)&units.months = v247;
                        LOWORD(units.hours) = 2112;
                        *(_QWORD *)((char *)&units.hours + 2) = v232;
                        _os_log_debug_impl(&dword_22665B000, v243, OS_LOG_TYPE_DEBUG, "[%@] - Added attendee %@", (uint8_t *)&units, 0x16u);

                      }
                      v244 = (id)*MEMORY[0x24BE08FF0];
                      if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
                      {
                        v248 = (id)objc_opt_class();
                        units.years = 136315650;
                        *(_QWORD *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
                        LOWORD(units.hours) = 2112;
                        *(_QWORD *)((char *)&units.hours + 2) = v248;
                        *((_WORD *)&units.minutes + 3) = 2112;
                        *(_QWORD *)&units.seconds = v232;
                        _os_log_debug_impl(&dword_22665B000, v244, OS_LOG_TYPE_DEBUG, "%s [%@] - Added attendee %@", (uint8_t *)&units, 0x20u);

                      }
                      v394 = 1;
                    }

                  }
                }
                v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v183, (uint64_t)&v409, (uint64_t)v415, 16);
              }
              while (v186);
            }
            else
            {
              v394 = 0;
            }

            objc_msgSend_array(MEMORY[0x24BDBCEB8], v249, v250, v251);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            v405 = 0u;
            v406 = 0u;
            v407 = 0u;
            v408 = 0u;
            v253 = obj;
            v255 = objc_msgSend_countByEnumeratingWithState_objects_count_(v253, v254, (uint64_t)&v405, (uint64_t)v414, 16);
            v5 = v389;
            if (v255)
            {
              v259 = v255;
              v260 = *(_QWORD *)v406;
              do
              {
                for (j = 0; j != v259; ++j)
                {
                  if (*(_QWORD *)v406 != v260)
                    objc_enumerationMutation(v253);
                  objc_msgSend_displayText(*(void **)(*((_QWORD *)&v405 + 1) + 8 * j), v256, v257, v258);
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v252, v263, (uint64_t)v262, v264);

                }
                v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(v253, v256, (uint64_t)&v405, (uint64_t)v414, 16);
              }
              while (v259);
            }

            sub_22665DF30(v252);
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bundle(CalAssistantBundle, v266, v267, v268);
            v269 = (void *)objc_claimAutoreleasedReturnValue();
            v271 = v269;
            v272 = (void *)MEMORY[0x24BDD17C8];
            if (v388)
            {
              objc_msgSend_assistantLocalizedStringForKey_table_bundle_(v388, v270, (uint64_t)CFSTR("%1$@ with %2$@"), 0, v269);
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_title(v389, v274, v275, v276);
              v277 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v272, v278, (uint64_t)v273, v279, v277, v265, v381, v383);
            }
            else
            {
              objc_msgSend_localizedStringForKey_value_table_(v269, v270, (uint64_t)CFSTR("%1$@ with %2$@"), (uint64_t)&stru_24EE0A220, 0);
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_title(v389, v280, v281, v282);
              v277 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_localizedStringWithFormat_(v272, v283, (uint64_t)v273, v284, v277, v265, v381, v383);
            }
            v285 = (void *)objc_claimAutoreleasedReturnValue();

            if (((v385 | v394) & 1) != 0)
            {
              objc_msgSend_title(v389, v286, v287, v288);
              v289 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setTitle_(v396, v290, (uint64_t)v289, v291);

            }
            else
            {
              objc_msgSend_setTitle_(v396, v286, (uint64_t)v285, v288);
            }
            sub_22665D4E4();
            v292 = (id)qword_25586B420;
            if (os_log_type_enabled(v292, OS_LOG_TYPE_DEBUG))
              sub_226661AF4();

            v293 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v293, OS_LOG_TYPE_DEBUG))
              sub_226661A5C();

            v63 = v396;
          }
          objc_msgSend_recurrences(v5, v144, v145, v146);
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          v298 = objc_msgSend_count(v294, v295, v296, v297);

          if (v298)
          {
            if (v298 == 1)
            {
              objc_msgSend_recurrences(v5, v299, v300, v301);
              v302 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(v302, v303, 0, v304);
              v305 = (void *)objc_claimAutoreleasedReturnValue();
              sub_22665E258(v305);
              v306 = (void *)objc_claimAutoreleasedReturnValue();

              sub_22665D4E4();
              v307 = (id)qword_25586B420;
              if (os_log_type_enabled(v307, OS_LOG_TYPE_DEBUG))
                sub_2266619D8();

              v308 = (id)*MEMORY[0x24BE08FF0];
              if (os_log_type_enabled(v308, OS_LOG_TYPE_DEBUG))
                sub_226661950();

              objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v309, (uint64_t)v306, v310);
              v311 = (void *)objc_claimAutoreleasedReturnValue();
              v312 = v63;
              objc_msgSend_setRecurrenceRules_(v63, v313, (uint64_t)v311, v314);

              v397 = 0;
            }
            else
            {
              sub_22665D4E4();
              v315 = (id)qword_25586B420;
              if (os_log_type_enabled(v315, OS_LOG_TYPE_ERROR))
                sub_2266618D0((uint64_t)self, v315);

              v316 = (id)*MEMORY[0x24BE08FF0];
              if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR))
                sub_226661848();

              v317 = objc_alloc(MEMORY[0x24BE811A8]);
              v397 = (void *)objc_msgSend_initWithReason_(v317, v318, (uint64_t)CFSTR("Calendar plugin doesn't handle multiple recurrences."), v319);
              v306 = v63;
              v312 = 0;
            }

          }
          else
          {
            v312 = v63;
            v397 = 0;
          }
          v403 = 0u;
          v404 = 0u;
          v401 = 0u;
          v402 = 0u;
          objc_msgSend_alerts(v5, v299, v300, v301);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          v322 = objc_msgSend_countByEnumeratingWithState_objects_count_(v320, v321, (uint64_t)&v401, (uint64_t)v413, 16);
          if (v322)
          {
            v323 = v322;
            v324 = *(_QWORD *)v402;
            do
            {
              for (k = 0; k != v323; ++k)
              {
                if (*(_QWORD *)v402 != v324)
                  objc_enumerationMutation(v320);
                v326 = *(void **)(*((_QWORD *)&v401 + 1) + 8 * k);
                v327 = objc_alloc(MEMORY[0x24BDC7468]);
                objc_msgSend_doubleValue(v326, v328, v329, v330);
                v334 = (void *)objc_msgSend_initWithRelativeOffset_(v327, v331, v332, v333);
                if (v334)
                {
                  sub_22665D4E4();
                  v335 = (id)qword_25586B420;
                  if (os_log_type_enabled(v335, OS_LOG_TYPE_DEBUG))
                  {
                    v340 = (id)objc_opt_class();
                    units.years = 138412546;
                    *(_QWORD *)&units.months = v340;
                    LOWORD(units.hours) = 2112;
                    *(_QWORD *)((char *)&units.hours + 2) = v334;
                    _os_log_debug_impl(&dword_22665B000, v335, OS_LOG_TYPE_DEBUG, "[%@] - Giving event alarm %@", (uint8_t *)&units, 0x16u);

                  }
                  v336 = (id)*MEMORY[0x24BE08FF0];
                  if (os_log_type_enabled(v336, OS_LOG_TYPE_DEBUG))
                  {
                    v341 = (id)objc_opt_class();
                    units.years = 136315650;
                    *(_QWORD *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
                    LOWORD(units.hours) = 2112;
                    *(_QWORD *)((char *)&units.hours + 2) = v341;
                    *((_WORD *)&units.minutes + 3) = 2112;
                    *(_QWORD *)&units.seconds = v334;
                    _os_log_debug_impl(&dword_22665B000, v336, OS_LOG_TYPE_DEBUG, "%s [%@] - Giving event alarm %@", (uint8_t *)&units, 0x20u);

                  }
                  objc_msgSend_addAlarm_(v312, v337, (uint64_t)v334, v338);
                }

              }
              v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v320, v339, (uint64_t)&v401, (uint64_t)v413, 16);
            }
            while (v323);
          }

          v63 = v312;
          if (!v312)
          {
            v6 = v388;
            v5 = v389;
            v24 = v386;
            v12 = v387;
            v351 = cf;
            v357 = v397;
LABEL_168:
            CFRelease(v351);
            v73 = v357;

LABEL_169:
            goto LABEL_170;
          }
          objc_msgSend_eventStore(self, v342, v343, v344);
          v345 = (void *)objc_claimAutoreleasedReturnValue();
          v400 = 0;
          v347 = objc_msgSend_saveEvent_span_commit_error_(v345, v346, (uint64_t)v312, v298 != 0, 1, &v400);
          v348 = v400;

          sub_22665D4E4();
          v349 = (id)qword_25586B420;
          v350 = v349;
          v6 = v388;
          v5 = v389;
          v24 = v386;
          v12 = v387;
          v351 = cf;
          v352 = v397;
          if ((v347 & 1) != 0)
          {
            if (os_log_type_enabled(v349, OS_LOG_TYPE_DEBUG))
              sub_2266616B4();

            v353 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v353, OS_LOG_TYPE_DEBUG))
              sub_22666162C();

            AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(v63, cf);
            if (AceEventFromEKEvent_0)
            {
              sub_22665D4E4();
              v355 = (id)qword_25586B420;
              if (os_log_type_enabled(v355, OS_LOG_TYPE_DEBUG))
                sub_2266615B4();

              v356 = (id)*MEMORY[0x24BE08FF0];
              if (os_log_type_enabled(v356, OS_LOG_TYPE_DEBUG))
                sub_22666152C();

              v357 = objc_alloc_init(MEMORY[0x24BE81220]);
              objc_msgSend_identifier(AceEventFromEKEvent_0, v358, v359, v360);
              v352 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setIdentifier_(v357, v361, (uint64_t)v352, v362);
              goto LABEL_167;
            }
            v370 = objc_alloc(MEMORY[0x24BE811A8]);
            v369 = objc_msgSend_initWithReason_(v370, v371, (uint64_t)CFSTR("Unable to create ace event from calendar event"), v372);
          }
          else
          {
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
              sub_2266617C4();

            v363 = (id)*MEMORY[0x24BE08FF0];
            if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR))
              sub_22666172C();

            v364 = objc_alloc(MEMORY[0x24BE811A8]);
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v365, (uint64_t)CFSTR("Unable to save event: %@"), v366, v348);
            AceEventFromEKEvent_0 = (void *)objc_claimAutoreleasedReturnValue();
            v369 = objc_msgSend_initWithReason_(v364, v367, (uint64_t)AceEventFromEKEvent_0, v368);
          }
          v357 = (id)v369;
LABEL_167:

          goto LABEL_168;
        }
      }
    }
    else
    {

    }
    v74 = (void *)MEMORY[0x24BDC74E0];
    objc_msgSend_eventStore(self, v49, v50, v51);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_eventWithEventStore_(v74, v76, (uint64_t)v75, v77);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_eventStore(self, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_acquireDefaultCalendarForNewEvents(v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCalendar_(v63, v86, (uint64_t)v85, v87);

    sub_22665D4E4();
    v88 = (id)qword_25586B420;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      sub_22666241C();

    v89 = (id)*MEMORY[0x24BE08FF0];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
      sub_226662374();

    v69 = 0;
    goto LABEL_33;
  }
  v70 = objc_alloc(MEMORY[0x24BE811A8]);
  v73 = (id)objc_msgSend_initWithReason_(v70, v71, (uint64_t)CFSTR("Invalid timezone"), v72);
LABEL_170:

  return v73;
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a4;
  v6 = (void (**)(id, void *))a3;
  sub_22665D4E4();
  objc_msgSend_identifier(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = objc_alloc(MEMORY[0x24BE811A8]);
    v17 = objc_msgSend_initWithReason_(v18, v19, (uint64_t)CFSTR("I could not find the event to commit."), v20);
    goto LABEL_5;
  }
  objc_msgSend__validateEvent_(self, v11, (uint64_t)v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend__commitEvent_serviceHelper_(self, v13, (uint64_t)v10, (uint64_t)v22);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (void *)v17;
  }
  objc_msgSend_dictionary(v16, v13, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v21);

}

- (void)performWithCompletion:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_performWithCompletion_serviceHelper_, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
