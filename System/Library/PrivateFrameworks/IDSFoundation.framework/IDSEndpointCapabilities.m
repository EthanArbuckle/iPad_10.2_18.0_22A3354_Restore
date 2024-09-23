@implementation IDSEndpointCapabilities

+ (id)allowedCapabilities
{
  double v2;
  _QWORD v4[92];

  v4[91] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("supports-key-sharing");
  v4[1] = CFSTR("supports-harmony");
  v4[2] = CFSTR("supports-fmd-v2");
  v4[3] = CFSTR("supports-fm-fence-v1");
  v4[4] = CFSTR("supports-location-sharing");
  v4[5] = CFSTR("supports-screen-time-v2");
  v4[6] = CFSTR("supports-incoming-fmd-v1");
  v4[7] = CFSTR("supports-secure-loc-v1");
  v4[8] = CFSTR("supports-activity-sharing-v1");
  v4[9] = CFSTR("supports-manatee-for-apple-cash");
  v4[10] = CFSTR("supports-region-for-apple-cash");
  v4[11] = CFSTR("supports-hk-resident");
  v4[12] = CFSTR("supports-maps-routing-path-leg");
  v4[13] = CFSTR("supports-beacon-sharing-v2");
  v4[14] = CFSTR("supports-beneficiary-invites");
  v4[15] = CFSTR("supports-st-er");
  v4[16] = CFSTR("supports-maps-waypoint-route-sharing");
  v4[17] = CFSTR("supports-maps-protocol-v5");
  v4[18] = CFSTR("supports-cross-platform-sharing");
  v4[19] = CFSTR("supports-zelkova");
  v4[20] = CFSTR("supports-people-ranging-v1");
  v4[21] = CFSTR("supports-beacon-sharing-v3");
  v4[22] = CFSTR("supports-gft-relay");
  v4[23] = CFSTR("supports-manatee-activity-sharing");
  v4[24] = CFSTR("supports-restricted-guest");
  v4[25] = CFSTR("supports-remote-atv-signin");
  v4[26] = CFSTR("ec-version");
  v4[27] = CFSTR("is-c2k-equipment");
  v4[28] = CFSTR("show-peer-errors");
  v4[29] = CFSTR("nicknames-version");
  v4[30] = CFSTR("optionally-receive-typing-indicators");
  v4[31] = CFSTR("supports-inline-attachments");
  v4[32] = CFSTR("supports-keep-receipts");
  v4[33] = CFSTR("supports-st-v1");
  v4[34] = CFSTR("supports-ca-v1");
  v4[35] = CFSTR("supports-be-v1");
  v4[36] = CFSTR("supports-ack-v1");
  v4[37] = CFSTR("supports-fsm-v1");
  v4[38] = CFSTR("supports-fsm-v2");
  v4[39] = CFSTR("supports-fsm-v3");
  v4[40] = CFSTR("supports-ii-v1");
  v4[41] = CFSTR("supports-impact-v1");
  v4[42] = CFSTR("supports-update-attachments-v1");
  v4[43] = CFSTR("supports-autoloopvideo-v1");
  v4[44] = CFSTR("supports-media-v2");
  v4[45] = CFSTR("supports-photos-extension-v1");
  v4[46] = CFSTR("supports-photos-extension-v2");
  v4[47] = CFSTR("supports-audio-messaging-v2");
  v4[48] = CFSTR("supports-animoji-v2");
  v4[49] = CFSTR("supports-certified-delivery-v1");
  v4[50] = CFSTR("supports-original-timestamp-v1");
  v4[51] = CFSTR("supports-protobuf-payload-data-v2");
  v4[52] = CFSTR("supports-heif");
  v4[53] = CFSTR("supports-hdr");
  v4[54] = CFSTR("prefers-sdr");
  v4[55] = CFSTR("supports-sa-v1");
  v4[56] = CFSTR("supports-uwb");
  v4[57] = CFSTR("supports-dq-nr");
  v4[58] = CFSTR("supports-rem");
  v4[59] = CFSTR("supports-people-request-messages");
  v4[60] = CFSTR("supports-family-invite-message-bubble");
  v4[61] = CFSTR("supports-people-request-messages-v2");
  v4[62] = CFSTR("supports-askto");
  v4[63] = CFSTR("supports-emoji-stickers");
  v4[64] = CFSTR("supports-sticker-editing");
  v4[65] = CFSTR("supports-hybrid-groups-v1");
  v4[66] = CFSTR("supports-findmy-plugin-messages");
  v4[67] = CFSTR("supports-sos-alerting");
  v4[68] = CFSTR("supports-people-request-messages-v3");
  v4[69] = CFSTR("supports-recurring-payment-bubbles");
  v4[70] = CFSTR("supports-group-photo-refresh-version");
  v4[71] = CFSTR("supports-emoji-tapbacks");
  v4[72] = CFSTR("supports-send-later-messages");
  v4[73] = CFSTR("supports-emoji-images");
  v4[74] = CFSTR("supports-stick-moji-backs");
  v4[75] = CFSTR("supports-high-quality-photo-file-sizes");
  v4[76] = CFSTR("supports-stewie");
  v4[77] = CFSTR("sender-key-message-version");
  v4[78] = CFSTR("supports-sender-key-v1");
  v4[79] = CFSTR("supports-modern-gft");
  v4[80] = CFSTR("supports-co");
  v4[81] = CFSTR("is-green-tea");
  v4[82] = CFSTR("supports-gft-errors");
  v4[83] = CFSTR("supports-gft-calls");
  v4[84] = CFSTR("is-web-client");
  v4[85] = CFSTR("supports-avless");
  v4[86] = CFSTR("supports-self-one-to-one-invites");
  v4[87] = CFSTR("supports-hi-res-vid");
  v4[88] = CFSTR("supports-ssrc");
  v4[89] = CFSTR("gs-supports-friending-via-push");
  v4[90] = CFSTR("gs-supports-message-transport-v2");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v4, v2, 91);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (IDSEndpointCapabilities)initWithCapabilitiesMap:(id)a3
{
  id v4;
  IDSEndpointCapabilities *v5;
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  uint64_t i;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  double v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  double v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  const char *v85;
  double v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  double v96;
  const char *v97;
  double v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  double v102;
  const char *v103;
  double v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  double v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  const char *v115;
  double v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  double v120;
  const char *v121;
  double v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  const char *v127;
  double v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  double v132;
  const char *v133;
  double v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  double v138;
  const char *v139;
  double v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  double v144;
  const char *v145;
  double v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  double v150;
  const char *v151;
  double v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  double v156;
  const char *v157;
  double v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  double v162;
  const char *v163;
  double v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  double v168;
  const char *v169;
  double v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  double v174;
  const char *v175;
  double v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  double v180;
  const char *v181;
  double v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  double v186;
  const char *v187;
  double v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  double v192;
  const char *v193;
  double v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  double v198;
  const char *v199;
  double v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  double v204;
  const char *v205;
  double v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  double v210;
  const char *v211;
  double v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  double v216;
  const char *v217;
  double v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  double v222;
  const char *v223;
  double v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  double v228;
  const char *v229;
  double v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  double v234;
  const char *v235;
  double v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  double v240;
  const char *v241;
  double v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  double v246;
  const char *v247;
  double v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  double v252;
  const char *v253;
  double v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  double v258;
  const char *v259;
  double v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  double v264;
  const char *v265;
  double v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  double v270;
  const char *v271;
  double v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  double v276;
  const char *v277;
  double v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  double v282;
  const char *v283;
  double v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  double v288;
  const char *v289;
  double v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  double v294;
  const char *v295;
  double v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  double v300;
  const char *v301;
  double v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  double v306;
  const char *v307;
  double v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  double v312;
  const char *v313;
  double v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  double v318;
  const char *v319;
  double v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  double v324;
  const char *v325;
  double v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  double v330;
  const char *v331;
  double v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  double v336;
  const char *v337;
  double v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  double v342;
  const char *v343;
  double v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  double v348;
  const char *v349;
  double v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  double v354;
  const char *v355;
  double v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  double v360;
  const char *v361;
  double v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  double v366;
  const char *v367;
  double v368;
  void *v369;
  const char *v370;
  uint64_t v371;
  double v372;
  const char *v373;
  double v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  double v378;
  const char *v379;
  double v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  double v384;
  const char *v385;
  double v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  double v390;
  const char *v391;
  double v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  double v396;
  const char *v397;
  double v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  double v402;
  const char *v403;
  double v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  double v408;
  const char *v409;
  double v410;
  void *v411;
  const char *v412;
  uint64_t v413;
  double v414;
  const char *v415;
  double v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  double v420;
  const char *v421;
  double v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  double v426;
  const char *v427;
  double v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  double v432;
  const char *v433;
  double v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  double v438;
  const char *v439;
  double v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  double v444;
  const char *v445;
  double v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  double v450;
  const char *v451;
  double v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  double v456;
  const char *v457;
  double v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  double v462;
  const char *v463;
  double v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  double v468;
  const char *v469;
  double v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  double v474;
  const char *v475;
  double v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  double v480;
  const char *v481;
  double v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  double v486;
  const char *v487;
  double v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  double v492;
  const char *v493;
  double v494;
  void *v495;
  const char *v496;
  uint64_t v497;
  double v498;
  const char *v499;
  double v500;
  void *v501;
  const char *v502;
  uint64_t v503;
  double v504;
  const char *v505;
  double v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  double v510;
  const char *v511;
  double v512;
  void *v513;
  const char *v514;
  uint64_t v515;
  double v516;
  const char *v517;
  double v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  double v522;
  const char *v523;
  double v524;
  void *v525;
  const char *v526;
  uint64_t v527;
  double v528;
  const char *v529;
  double v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  double v534;
  const char *v535;
  double v536;
  void *v537;
  const char *v538;
  uint64_t v539;
  double v540;
  const char *v541;
  double v542;
  void *v543;
  const char *v544;
  uint64_t v545;
  double v546;
  const char *v547;
  double v548;
  void *v549;
  const char *v550;
  uint64_t v551;
  double v552;
  void *v553;
  const char *v554;
  uint64_t v555;
  double v556;
  IDSEndpointCapabilities *v557;
  id v559;
  uint64_t v560;
  uint64_t v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  objc_super v566;
  _BYTE v567[128];
  uint64_t v568;

  v568 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v566.receiver = self;
  v566.super_class = (Class)IDSEndpointCapabilities;
  v5 = -[IDSEndpointCapabilities init](&v566, sel_init);

  if (v5)
  {
    v564 = 0u;
    v565 = 0u;
    v562 = 0u;
    v563 = 0u;
    v559 = v4;
    v6 = v4;
    v561 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v562, v8, v567, 16);
    if (v561)
    {
      v560 = *(_QWORD *)v563;
      do
      {
        for (i = 0; i != v561; ++i)
        {
          if (*(_QWORD *)v563 != v560)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v562 + 1) + 8 * i);
          if (objc_msgSend_isEqualToString_(v12, v9, (uint64_t)CFSTR("supports-key-sharing"), v10))
          {
            objc_msgSend_objectForKey_(v6, v13, (uint64_t)CFSTR("supports-key-sharing"), v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsKeySharing = objc_msgSend_shortValue(v15, v16, v17, v18);

          }
          if (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("supports-harmony"), v14))
          {
            objc_msgSend_objectForKey_(v6, v19, (uint64_t)CFSTR("supports-harmony"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHarmony = objc_msgSend_shortValue(v21, v22, v23, v24);

          }
          if (objc_msgSend_isEqualToString_(v12, v19, (uint64_t)CFSTR("supports-fmd-v2"), v20))
          {
            objc_msgSend_objectForKey_(v6, v25, (uint64_t)CFSTR("supports-fmd-v2"), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFMDV2 = objc_msgSend_shortValue(v27, v28, v29, v30);

          }
          if (objc_msgSend_isEqualToString_(v12, v25, (uint64_t)CFSTR("supports-fm-fence-v1"), v26))
          {
            objc_msgSend_objectForKey_(v6, v31, (uint64_t)CFSTR("supports-fm-fence-v1"), v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFMFenceV1 = objc_msgSend_shortValue(v33, v34, v35, v36);

          }
          if (objc_msgSend_isEqualToString_(v12, v31, (uint64_t)CFSTR("supports-location-sharing"), v32))
          {
            objc_msgSend_objectForKey_(v6, v37, (uint64_t)CFSTR("supports-location-sharing"), v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsLocationSharing = objc_msgSend_shortValue(v39, v40, v41, v42);

          }
          if (objc_msgSend_isEqualToString_(v12, v37, (uint64_t)CFSTR("supports-screen-time-v2"), v38))
          {
            objc_msgSend_objectForKey_(v6, v43, (uint64_t)CFSTR("supports-screen-time-v2"), v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsScreenTimeV2 = objc_msgSend_shortValue(v45, v46, v47, v48);

          }
          if (objc_msgSend_isEqualToString_(v12, v43, (uint64_t)CFSTR("supports-incoming-fmd-v1"), v44))
          {
            objc_msgSend_objectForKey_(v6, v49, (uint64_t)CFSTR("supports-incoming-fmd-v1"), v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsIncomingFindMyV1 = objc_msgSend_shortValue(v51, v52, v53, v54);

          }
          if (objc_msgSend_isEqualToString_(v12, v49, (uint64_t)CFSTR("supports-secure-loc-v1"), v50))
          {
            objc_msgSend_objectForKey_(v6, v55, (uint64_t)CFSTR("supports-secure-loc-v1"), v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSecureLocationsV1 = objc_msgSend_shortValue(v57, v58, v59, v60);

          }
          if (objc_msgSend_isEqualToString_(v12, v55, (uint64_t)CFSTR("supports-activity-sharing-v1"), v56))
          {
            objc_msgSend_objectForKey_(v6, v61, (uint64_t)CFSTR("supports-activity-sharing-v1"), v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsActivitySharing = objc_msgSend_shortValue(v63, v64, v65, v66);

          }
          if (objc_msgSend_isEqualToString_(v12, v61, (uint64_t)CFSTR("supports-manatee-for-apple-cash"), v62))
          {
            objc_msgSend_objectForKey_(v6, v67, (uint64_t)CFSTR("supports-manatee-for-apple-cash"), v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsManateeForAppleCash = objc_msgSend_shortValue(v69, v70, v71, v72);

          }
          if (objc_msgSend_isEqualToString_(v12, v67, (uint64_t)CFSTR("supports-region-for-apple-cash"), v68))
          {
            objc_msgSend_objectForKey_(v6, v73, (uint64_t)CFSTR("supports-region-for-apple-cash"), v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsRegionForAppleCash = objc_msgSend_shortValue(v75, v76, v77, v78);

          }
          if (objc_msgSend_isEqualToString_(v12, v73, (uint64_t)CFSTR("supports-hk-resident"), v74))
          {
            objc_msgSend_objectForKey_(v6, v79, (uint64_t)CFSTR("supports-hk-resident"), v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHomeKitResident = objc_msgSend_shortValue(v81, v82, v83, v84);

          }
          if (objc_msgSend_isEqualToString_(v12, v79, (uint64_t)CFSTR("supports-maps-routing-path-leg"), v80))
          {
            objc_msgSend_objectForKey_(v6, v85, (uint64_t)CFSTR("supports-maps-routing-path-leg"), v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsMapsRoutingPathLeg = objc_msgSend_shortValue(v87, v88, v89, v90);

          }
          if (objc_msgSend_isEqualToString_(v12, v85, (uint64_t)CFSTR("supports-beacon-sharing-v2"), v86))
          {
            objc_msgSend_objectForKey_(v6, v91, (uint64_t)CFSTR("supports-beacon-sharing-v2"), v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsBeaconSharingV2 = objc_msgSend_shortValue(v93, v94, v95, v96);

          }
          if (objc_msgSend_isEqualToString_(v12, v91, (uint64_t)CFSTR("supports-beneficiary-invites"), v92))
          {
            objc_msgSend_objectForKey_(v6, v97, (uint64_t)CFSTR("supports-beneficiary-invites"), v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsBeneficiaryInvites = objc_msgSend_shortValue(v99, v100, v101, v102);

          }
          if (objc_msgSend_isEqualToString_(v12, v97, (uint64_t)CFSTR("supports-st-er"), v98))
          {
            objc_msgSend_objectForKey_(v6, v103, (uint64_t)CFSTR("supports-st-er"), v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsScreenTimeErrors = objc_msgSend_shortValue(v105, v106, v107, v108);

          }
          if (objc_msgSend_isEqualToString_(v12, v103, (uint64_t)CFSTR("supports-maps-waypoint-route-sharing"), v104))
          {
            objc_msgSend_objectForKey_(v6, v109, (uint64_t)CFSTR("supports-maps-waypoint-route-sharing"), v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsMapsWaypointRouteSharing = objc_msgSend_shortValue(v111, v112, v113, v114);

          }
          if (objc_msgSend_isEqualToString_(v12, v109, (uint64_t)CFSTR("supports-maps-protocol-v5"), v110))
          {
            objc_msgSend_objectForKey_(v6, v115, (uint64_t)CFSTR("supports-maps-protocol-v5"), v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsMapsProtocolV5 = objc_msgSend_shortValue(v117, v118, v119, v120);

          }
          if (objc_msgSend_isEqualToString_(v12, v115, (uint64_t)CFSTR("supports-cross-platform-sharing"), v116))
          {
            objc_msgSend_objectForKey_(v6, v121, (uint64_t)CFSTR("supports-cross-platform-sharing"), v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsCrossPlatformSharing = objc_msgSend_shortValue(v123, v124, v125, v126);

          }
          if (objc_msgSend_isEqualToString_(v12, v121, (uint64_t)CFSTR("supports-zelkova"), v122))
          {
            objc_msgSend_objectForKey_(v6, v127, (uint64_t)CFSTR("supports-zelkova"), v128);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsZelkova = objc_msgSend_shortValue(v129, v130, v131, v132);

          }
          if (objc_msgSend_isEqualToString_(v12, v127, (uint64_t)CFSTR("supports-people-ranging-v1"), v128))
          {
            objc_msgSend_objectForKey_(v6, v133, (uint64_t)CFSTR("supports-people-ranging-v1"), v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPeopleRangingV1 = objc_msgSend_shortValue(v135, v136, v137, v138);

          }
          if (objc_msgSend_isEqualToString_(v12, v133, (uint64_t)CFSTR("supports-beacon-sharing-v3"), v134))
          {
            objc_msgSend_objectForKey_(v6, v139, (uint64_t)CFSTR("supports-beacon-sharing-v3"), v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsBeaconSharingV3 = objc_msgSend_shortValue(v141, v142, v143, v144);

          }
          if (objc_msgSend_isEqualToString_(v12, v139, (uint64_t)CFSTR("supports-gft-relay"), v140))
          {
            objc_msgSend_objectForKey_(v6, v145, (uint64_t)CFSTR("supports-gft-relay"), v146);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsGFTRelay = objc_msgSend_shortValue(v147, v148, v149, v150);

          }
          if (objc_msgSend_isEqualToString_(v12, v145, (uint64_t)CFSTR("supports-manatee-activity-sharing"), v146))
          {
            objc_msgSend_objectForKey_(v6, v151, (uint64_t)CFSTR("supports-manatee-activity-sharing"), v152);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsManateeActivitySharing = objc_msgSend_shortValue(v153, v154, v155, v156);

          }
          if (objc_msgSend_isEqualToString_(v12, v151, (uint64_t)CFSTR("supports-restricted-guest"), v152))
          {
            objc_msgSend_objectForKey_(v6, v157, (uint64_t)CFSTR("supports-restricted-guest"), v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsRestrictedGuest = objc_msgSend_shortValue(v159, v160, v161, v162);

          }
          if (objc_msgSend_isEqualToString_(v12, v157, (uint64_t)CFSTR("supports-remote-atv-signin"), v158))
          {
            objc_msgSend_objectForKey_(v6, v163, (uint64_t)CFSTR("supports-remote-atv-signin"), v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsRemoteATVSignIn = objc_msgSend_shortValue(v165, v166, v167, v168);

          }
          if (objc_msgSend_isEqualToString_(v12, v163, (uint64_t)CFSTR("ec-version"), v164))
          {
            objc_msgSend_objectForKey_(v6, v169, (uint64_t)CFSTR("ec-version"), v170);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_ecVersion = objc_msgSend_shortValue(v171, v172, v173, v174);

          }
          if (objc_msgSend_isEqualToString_(v12, v169, (uint64_t)CFSTR("is-c2k-equipment"), v170))
          {
            objc_msgSend_objectForKey_(v6, v175, (uint64_t)CFSTR("is-c2k-equipment"), v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_isC2KEquipment = objc_msgSend_shortValue(v177, v178, v179, v180);

          }
          if (objc_msgSend_isEqualToString_(v12, v175, (uint64_t)CFSTR("show-peer-errors"), v176))
          {
            objc_msgSend_objectForKey_(v6, v181, (uint64_t)CFSTR("show-peer-errors"), v182);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_showPeerErrors = objc_msgSend_shortValue(v183, v184, v185, v186);

          }
          if (objc_msgSend_isEqualToString_(v12, v181, (uint64_t)CFSTR("nicknames-version"), v182))
          {
            objc_msgSend_objectForKey_(v6, v187, (uint64_t)CFSTR("nicknames-version"), v188);
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_nicknamesVersion = objc_msgSend_shortValue(v189, v190, v191, v192);

          }
          if (objc_msgSend_isEqualToString_(v12, v187, (uint64_t)CFSTR("optionally-receive-typing-indicators"), v188))
          {
            objc_msgSend_objectForKey_(v6, v193, (uint64_t)CFSTR("optionally-receive-typing-indicators"), v194);
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_optionallyReceiveTypingIndicator = objc_msgSend_shortValue(v195, v196, v197, v198);

          }
          if (objc_msgSend_isEqualToString_(v12, v193, (uint64_t)CFSTR("supports-inline-attachments"), v194))
          {
            objc_msgSend_objectForKey_(v6, v199, (uint64_t)CFSTR("supports-inline-attachments"), v200);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsInlineAttachments = objc_msgSend_shortValue(v201, v202, v203, v204);

          }
          if (objc_msgSend_isEqualToString_(v12, v199, (uint64_t)CFSTR("supports-keep-receipts"), v200))
          {
            objc_msgSend_objectForKey_(v6, v205, (uint64_t)CFSTR("supports-keep-receipts"), v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsKeepReceipts = objc_msgSend_shortValue(v207, v208, v209, v210);

          }
          if (objc_msgSend_isEqualToString_(v12, v205, (uint64_t)CFSTR("supports-st-v1"), v206))
          {
            objc_msgSend_objectForKey_(v6, v211, (uint64_t)CFSTR("supports-st-v1"), v212);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsStickersV1 = objc_msgSend_shortValue(v213, v214, v215, v216);

          }
          if (objc_msgSend_isEqualToString_(v12, v211, (uint64_t)CFSTR("supports-ca-v1"), v212))
          {
            objc_msgSend_objectForKey_(v6, v217, (uint64_t)CFSTR("supports-ca-v1"), v218);
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsChatAppsV1 = objc_msgSend_shortValue(v219, v220, v221, v222);

          }
          if (objc_msgSend_isEqualToString_(v12, v217, (uint64_t)CFSTR("supports-be-v1"), v218))
          {
            objc_msgSend_objectForKey_(v6, v223, (uint64_t)CFSTR("supports-be-v1"), v224);
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsBubbleEditingV1 = objc_msgSend_shortValue(v225, v226, v227, v228);

          }
          if (objc_msgSend_isEqualToString_(v12, v223, (uint64_t)CFSTR("supports-ack-v1"), v224))
          {
            objc_msgSend_objectForKey_(v6, v229, (uint64_t)CFSTR("supports-ack-v1"), v230);
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAcknowledgementsV1 = objc_msgSend_shortValue(v231, v232, v233, v234);

          }
          if (objc_msgSend_isEqualToString_(v12, v229, (uint64_t)CFSTR("supports-fsm-v1"), v230))
          {
            objc_msgSend_objectForKey_(v6, v235, (uint64_t)CFSTR("supports-fsm-v1"), v236);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFullScreenMomentsV1 = objc_msgSend_shortValue(v237, v238, v239, v240);

          }
          if (objc_msgSend_isEqualToString_(v12, v235, (uint64_t)CFSTR("supports-fsm-v2"), v236))
          {
            objc_msgSend_objectForKey_(v6, v241, (uint64_t)CFSTR("supports-fsm-v2"), v242);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFullScreenMomentsV2 = objc_msgSend_shortValue(v243, v244, v245, v246);

          }
          if (objc_msgSend_isEqualToString_(v12, v241, (uint64_t)CFSTR("supports-fsm-v3"), v242))
          {
            objc_msgSend_objectForKey_(v6, v247, (uint64_t)CFSTR("supports-fsm-v3"), v248);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFullScreenMomentsV3 = objc_msgSend_shortValue(v249, v250, v251, v252);

          }
          if (objc_msgSend_isEqualToString_(v12, v247, (uint64_t)CFSTR("supports-ii-v1"), v248))
          {
            objc_msgSend_objectForKey_(v6, v253, (uint64_t)CFSTR("supports-ii-v1"), v254);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsInvisibleInkV1 = objc_msgSend_shortValue(v255, v256, v257, v258);

          }
          if (objc_msgSend_isEqualToString_(v12, v253, (uint64_t)CFSTR("supports-impact-v1"), v254))
          {
            objc_msgSend_objectForKey_(v6, v259, (uint64_t)CFSTR("supports-impact-v1"), v260);
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsImpactEffectsV1 = objc_msgSend_shortValue(v261, v262, v263, v264);

          }
          if (objc_msgSend_isEqualToString_(v12, v259, (uint64_t)CFSTR("supports-update-attachments-v1"), v260))
          {
            objc_msgSend_objectForKey_(v6, v265, (uint64_t)CFSTR("supports-update-attachments-v1"), v266);
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsUpdateAttachmentsV1 = objc_msgSend_shortValue(v267, v268, v269, v270);

          }
          if (objc_msgSend_isEqualToString_(v12, v265, (uint64_t)CFSTR("supports-autoloopvideo-v1"), v266))
          {
            objc_msgSend_objectForKey_(v6, v271, (uint64_t)CFSTR("supports-autoloopvideo-v1"), v272);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAutoloopVideoV1 = objc_msgSend_shortValue(v273, v274, v275, v276);

          }
          if (objc_msgSend_isEqualToString_(v12, v271, (uint64_t)CFSTR("supports-media-v2"), v272))
          {
            objc_msgSend_objectForKey_(v6, v277, (uint64_t)CFSTR("supports-media-v2"), v278);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsMediaV2 = objc_msgSend_shortValue(v279, v280, v281, v282);

          }
          if (objc_msgSend_isEqualToString_(v12, v277, (uint64_t)CFSTR("supports-photos-extension-v1"), v278))
          {
            objc_msgSend_objectForKey_(v6, v283, (uint64_t)CFSTR("supports-photos-extension-v1"), v284);
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPhotosExtensionV1 = objc_msgSend_shortValue(v285, v286, v287, v288);

          }
          if (objc_msgSend_isEqualToString_(v12, v283, (uint64_t)CFSTR("supports-photos-extension-v2"), v284))
          {
            objc_msgSend_objectForKey_(v6, v289, (uint64_t)CFSTR("supports-photos-extension-v2"), v290);
            v291 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPhotosExtensionV2 = objc_msgSend_shortValue(v291, v292, v293, v294);

          }
          if (objc_msgSend_isEqualToString_(v12, v289, (uint64_t)CFSTR("supports-audio-messaging-v2"), v290))
          {
            objc_msgSend_objectForKey_(v6, v295, (uint64_t)CFSTR("supports-audio-messaging-v2"), v296);
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAudioMessagingV2 = objc_msgSend_shortValue(v297, v298, v299, v300);

          }
          if (objc_msgSend_isEqualToString_(v12, v295, (uint64_t)CFSTR("supports-animoji-v2"), v296))
          {
            objc_msgSend_objectForKey_(v6, v301, (uint64_t)CFSTR("supports-animoji-v2"), v302);
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAnimojiV2 = objc_msgSend_shortValue(v303, v304, v305, v306);

          }
          if (objc_msgSend_isEqualToString_(v12, v301, (uint64_t)CFSTR("supports-certified-delivery-v1"), v302))
          {
            objc_msgSend_objectForKey_(v6, v307, (uint64_t)CFSTR("supports-certified-delivery-v1"), v308);
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsCertifiedDeliveryV1 = objc_msgSend_shortValue(v309, v310, v311, v312);

          }
          if (objc_msgSend_isEqualToString_(v12, v307, (uint64_t)CFSTR("supports-original-timestamp-v1"), v308))
          {
            objc_msgSend_objectForKey_(v6, v313, (uint64_t)CFSTR("supports-original-timestamp-v1"), v314);
            v315 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsOriginalTimestampOrderingV1 = objc_msgSend_shortValue(v315, v316, v317, v318);

          }
          if (objc_msgSend_isEqualToString_(v12, v313, (uint64_t)CFSTR("supports-protobuf-payload-data-v2"), v314))
          {
            objc_msgSend_objectForKey_(v6, v319, (uint64_t)CFSTR("supports-protobuf-payload-data-v2"), v320);
            v321 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsProtobufPayloadDataV2 = objc_msgSend_shortValue(v321, v322, v323, v324);

          }
          if (objc_msgSend_isEqualToString_(v12, v319, (uint64_t)CFSTR("supports-heif"), v320))
          {
            objc_msgSend_objectForKey_(v6, v325, (uint64_t)CFSTR("supports-heif"), v326);
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHEIFEncoding = objc_msgSend_shortValue(v327, v328, v329, v330);

          }
          if (objc_msgSend_isEqualToString_(v12, v325, (uint64_t)CFSTR("supports-hdr"), v326))
          {
            objc_msgSend_objectForKey_(v6, v331, (uint64_t)CFSTR("supports-hdr"), v332);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHDRVideo = objc_msgSend_shortValue(v333, v334, v335, v336);

          }
          if (objc_msgSend_isEqualToString_(v12, v331, (uint64_t)CFSTR("prefers-sdr"), v332))
          {
            objc_msgSend_objectForKey_(v6, v337, (uint64_t)CFSTR("prefers-sdr"), v338);
            v339 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_prefersSDRVideo = objc_msgSend_shortValue(v339, v340, v341, v342);

          }
          if (objc_msgSend_isEqualToString_(v12, v337, (uint64_t)CFSTR("supports-sa-v1"), v338))
          {
            objc_msgSend_objectForKey_(v6, v343, (uint64_t)CFSTR("supports-sa-v1"), v344);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSyndicationActionsV1 = objc_msgSend_shortValue(v345, v346, v347, v348);

          }
          if (objc_msgSend_isEqualToString_(v12, v343, (uint64_t)CFSTR("supports-uwb"), v344))
          {
            objc_msgSend_objectForKey_(v6, v349, (uint64_t)CFSTR("supports-uwb"), v350);
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsUWB = objc_msgSend_shortValue(v351, v352, v353, v354);

          }
          if (objc_msgSend_isEqualToString_(v12, v349, (uint64_t)CFSTR("supports-dq-nr"), v350))
          {
            objc_msgSend_objectForKey_(v6, v355, (uint64_t)CFSTR("supports-dq-nr"), v356);
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsDeliveredQuietlyAndNotifyRecipient = objc_msgSend_shortValue(v357, v358, v359, v360);

          }
          if (objc_msgSend_isEqualToString_(v12, v355, (uint64_t)CFSTR("supports-rem"), v356))
          {
            objc_msgSend_objectForKey_(v6, v361, (uint64_t)CFSTR("supports-rem"), v362);
            v363 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsRetractAndEditMessages = objc_msgSend_shortValue(v363, v364, v365, v366);

          }
          if (objc_msgSend_isEqualToString_(v12, v361, (uint64_t)CFSTR("supports-people-request-messages"), v362))
          {
            objc_msgSend_objectForKey_(v6, v367, (uint64_t)CFSTR("supports-people-request-messages"), v368);
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPeopleRequestMessages = objc_msgSend_shortValue(v369, v370, v371, v372);

          }
          if (objc_msgSend_isEqualToString_(v12, v367, (uint64_t)CFSTR("supports-family-invite-message-bubble"), v368))
          {
            objc_msgSend_objectForKey_(v6, v373, (uint64_t)CFSTR("supports-family-invite-message-bubble"), v374);
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFamilyInviteMessageBubble = objc_msgSend_shortValue(v375, v376, v377, v378);

          }
          if (objc_msgSend_isEqualToString_(v12, v373, (uint64_t)CFSTR("supports-people-request-messages-v2"), v374))
          {
            objc_msgSend_objectForKey_(v6, v379, (uint64_t)CFSTR("supports-people-request-messages-v2"), v380);
            v381 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPeopleRequestMessagesV2 = objc_msgSend_shortValue(v381, v382, v383, v384);

          }
          if (objc_msgSend_isEqualToString_(v12, v379, (uint64_t)CFSTR("supports-askto"), v380))
          {
            objc_msgSend_objectForKey_(v6, v385, (uint64_t)CFSTR("supports-askto"), v386);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAskTo = objc_msgSend_shortValue(v387, v388, v389, v390);

          }
          if (objc_msgSend_isEqualToString_(v12, v385, (uint64_t)CFSTR("supports-emoji-stickers"), v386))
          {
            objc_msgSend_objectForKey_(v6, v391, (uint64_t)CFSTR("supports-emoji-stickers"), v392);
            v393 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsEmojiStickers = objc_msgSend_shortValue(v393, v394, v395, v396);

          }
          if (objc_msgSend_isEqualToString_(v12, v391, (uint64_t)CFSTR("supports-sticker-editing"), v392))
          {
            objc_msgSend_objectForKey_(v6, v397, (uint64_t)CFSTR("supports-sticker-editing"), v398);
            v399 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsStickerEditing = objc_msgSend_shortValue(v399, v400, v401, v402);

          }
          if (objc_msgSend_isEqualToString_(v12, v397, (uint64_t)CFSTR("supports-hybrid-groups-v1"), v398))
          {
            objc_msgSend_objectForKey_(v6, v403, (uint64_t)CFSTR("supports-hybrid-groups-v1"), v404);
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHybridGroupsV1 = objc_msgSend_shortValue(v405, v406, v407, v408);

          }
          if (objc_msgSend_isEqualToString_(v12, v403, (uint64_t)CFSTR("supports-findmy-plugin-messages"), v404))
          {
            objc_msgSend_objectForKey_(v6, v409, (uint64_t)CFSTR("supports-findmy-plugin-messages"), v410);
            v411 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFindMyPluginMessages = objc_msgSend_shortValue(v411, v412, v413, v414);

          }
          if (objc_msgSend_isEqualToString_(v12, v409, (uint64_t)CFSTR("supports-sos-alerting"), v410))
          {
            objc_msgSend_objectForKey_(v6, v415, (uint64_t)CFSTR("supports-sos-alerting"), v416);
            v417 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSOSAlerting = objc_msgSend_shortValue(v417, v418, v419, v420);

          }
          if (objc_msgSend_isEqualToString_(v12, v415, (uint64_t)CFSTR("supports-people-request-messages-v3"), v416))
          {
            objc_msgSend_objectForKey_(v6, v421, (uint64_t)CFSTR("supports-people-request-messages-v3"), v422);
            v423 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsPeopleRequestMessagesV3 = objc_msgSend_shortValue(v423, v424, v425, v426);

          }
          if (objc_msgSend_isEqualToString_(v12, v421, (uint64_t)CFSTR("supports-recurring-payment-bubbles"), v422))
          {
            objc_msgSend_objectForKey_(v6, v427, (uint64_t)CFSTR("supports-recurring-payment-bubbles"), v428);
            v429 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsRecurringPaymentBubbles = objc_msgSend_shortValue(v429, v430, v431, v432);

          }
          if (objc_msgSend_isEqualToString_(v12, v427, (uint64_t)CFSTR("supports-group-photo-refresh-version"), v428))
          {
            objc_msgSend_objectForKey_(v6, v433, (uint64_t)CFSTR("supports-group-photo-refresh-version"), v434);
            v435 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsGroupPhotoRefreshVersion = objc_msgSend_shortValue(v435, v436, v437, v438);

          }
          if (objc_msgSend_isEqualToString_(v12, v433, (uint64_t)CFSTR("supports-emoji-tapbacks"), v434))
          {
            objc_msgSend_objectForKey_(v6, v439, (uint64_t)CFSTR("supports-emoji-tapbacks"), v440);
            v441 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsEmojiTapbacks = objc_msgSend_shortValue(v441, v442, v443, v444);

          }
          if (objc_msgSend_isEqualToString_(v12, v439, (uint64_t)CFSTR("supports-send-later-messages"), v440))
          {
            objc_msgSend_objectForKey_(v6, v445, (uint64_t)CFSTR("supports-send-later-messages"), v446);
            v447 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSendLaterMessages = objc_msgSend_shortValue(v447, v448, v449, v450);

          }
          if (objc_msgSend_isEqualToString_(v12, v445, (uint64_t)CFSTR("supports-emoji-images"), v446))
          {
            objc_msgSend_objectForKey_(v6, v451, (uint64_t)CFSTR("supports-emoji-images"), v452);
            v453 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsEmojiImages = objc_msgSend_shortValue(v453, v454, v455, v456);

          }
          if (objc_msgSend_isEqualToString_(v12, v451, (uint64_t)CFSTR("supports-stick-moji-backs"), v452))
          {
            objc_msgSend_objectForKey_(v6, v457, (uint64_t)CFSTR("supports-stick-moji-backs"), v458);
            v459 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsStickMojiBacks = objc_msgSend_shortValue(v459, v460, v461, v462);

          }
          if (objc_msgSend_isEqualToString_(v12, v457, (uint64_t)CFSTR("supports-high-quality-photo-file-sizes"), v458))
          {
            objc_msgSend_objectForKey_(v6, v463, (uint64_t)CFSTR("supports-high-quality-photo-file-sizes"), v464);
            v465 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHighQualityPhotoFileSizes = objc_msgSend_shortValue(v465, v466, v467, v468);

          }
          if (objc_msgSend_isEqualToString_(v12, v463, (uint64_t)CFSTR("supports-stewie"), v464))
          {
            objc_msgSend_objectForKey_(v6, v469, (uint64_t)CFSTR("supports-stewie"), v470);
            v471 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsStewie = objc_msgSend_shortValue(v471, v472, v473, v474);

          }
          if (objc_msgSend_isEqualToString_(v12, v469, (uint64_t)CFSTR("sender-key-message-version"), v470))
          {
            objc_msgSend_objectForKey_(v6, v475, (uint64_t)CFSTR("sender-key-message-version"), v476);
            v477 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_senderKeyMessageVersion = objc_msgSend_shortValue(v477, v478, v479, v480);

          }
          if (objc_msgSend_isEqualToString_(v12, v475, (uint64_t)CFSTR("supports-sender-key-v1"), v476))
          {
            objc_msgSend_objectForKey_(v6, v481, (uint64_t)CFSTR("supports-sender-key-v1"), v482);
            v483 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSenderKey = objc_msgSend_shortValue(v483, v484, v485, v486);

          }
          if (objc_msgSend_isEqualToString_(v12, v481, (uint64_t)CFSTR("supports-modern-gft"), v482))
          {
            objc_msgSend_objectForKey_(v6, v487, (uint64_t)CFSTR("supports-modern-gft"), v488);
            v489 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsModernGFT = objc_msgSend_shortValue(v489, v490, v491, v492);

          }
          if (objc_msgSend_isEqualToString_(v12, v487, (uint64_t)CFSTR("supports-co"), v488))
          {
            objc_msgSend_objectForKey_(v6, v493, (uint64_t)CFSTR("supports-co"), v494);
            v495 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsCo = objc_msgSend_shortValue(v495, v496, v497, v498);

          }
          if (objc_msgSend_isEqualToString_(v12, v493, (uint64_t)CFSTR("is-green-tea"), v494))
          {
            objc_msgSend_objectForKey_(v6, v499, (uint64_t)CFSTR("is-green-tea"), v500);
            v501 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_isGreenTea = objc_msgSend_shortValue(v501, v502, v503, v504);

          }
          if (objc_msgSend_isEqualToString_(v12, v499, (uint64_t)CFSTR("supports-gft-errors"), v500))
          {
            objc_msgSend_objectForKey_(v6, v505, (uint64_t)CFSTR("supports-gft-errors"), v506);
            v507 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsGondola = objc_msgSend_shortValue(v507, v508, v509, v510);

          }
          if (objc_msgSend_isEqualToString_(v12, v505, (uint64_t)CFSTR("supports-gft-calls"), v506))
          {
            objc_msgSend_objectForKey_(v6, v511, (uint64_t)CFSTR("supports-gft-calls"), v512);
            v513 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_doesNotSupportGFTCalls = objc_msgSend_shortValue(v513, v514, v515, v516);

          }
          if (objc_msgSend_isEqualToString_(v12, v511, (uint64_t)CFSTR("is-web-client"), v512))
          {
            objc_msgSend_objectForKey_(v6, v517, (uint64_t)CFSTR("is-web-client"), v518);
            v519 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_isWebClient = objc_msgSend_shortValue(v519, v520, v521, v522);

          }
          if (objc_msgSend_isEqualToString_(v12, v517, (uint64_t)CFSTR("supports-avless"), v518))
          {
            objc_msgSend_objectForKey_(v6, v523, (uint64_t)CFSTR("supports-avless"), v524);
            v525 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsAVLess = objc_msgSend_shortValue(v525, v526, v527, v528);

          }
          if (objc_msgSend_isEqualToString_(v12, v523, (uint64_t)CFSTR("supports-self-one-to-one-invites"), v524))
          {
            objc_msgSend_objectForKey_(v6, v529, (uint64_t)CFSTR("supports-self-one-to-one-invites"), v530);
            v531 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSelfOneToOneInvites = objc_msgSend_shortValue(v531, v532, v533, v534);

          }
          if (objc_msgSend_isEqualToString_(v12, v529, (uint64_t)CFSTR("supports-hi-res-vid"), v530))
          {
            objc_msgSend_objectForKey_(v6, v535, (uint64_t)CFSTR("supports-hi-res-vid"), v536);
            v537 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsHighResVideoMessaging = objc_msgSend_shortValue(v537, v538, v539, v540);

          }
          if (objc_msgSend_isEqualToString_(v12, v535, (uint64_t)CFSTR("supports-ssrc"), v536))
          {
            objc_msgSend_objectForKey_(v6, v541, (uint64_t)CFSTR("supports-ssrc"), v542);
            v543 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsSSRC = objc_msgSend_shortValue(v543, v544, v545, v546);

          }
          if (objc_msgSend_isEqualToString_(v12, v541, (uint64_t)CFSTR("gs-supports-friending-via-push"), v542))
          {
            objc_msgSend_objectForKey_(v6, v547, (uint64_t)CFSTR("gs-supports-friending-via-push"), v548);
            v549 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsFriendingViaPush = objc_msgSend_shortValue(v549, v550, v551, v552);

          }
          if (objc_msgSend_isEqualToString_(v12, v547, (uint64_t)CFSTR("gs-supports-message-transport-v2"), v548))
          {
            objc_msgSend_objectForKey_(v6, v9, (uint64_t)CFSTR("gs-supports-message-transport-v2"), v10);
            v553 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_supportsMessageTransportV2 = objc_msgSend_shortValue(v553, v554, v555, v556);

          }
        }
        v561 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v562, v10, v567, 16);
      }
      while (v561);
    }

    v4 = v559;
  }
  v557 = v5;

  return v557;
}

- (int64_t)valueForCapability:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  double v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  const char *v99;
  double v100;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  const char *v109;
  double v110;
  const char *v111;
  double v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  const char *v123;
  double v124;
  const char *v125;
  double v126;
  const char *v127;
  double v128;
  const char *v129;
  double v130;
  const char *v131;
  double v132;
  const char *v133;
  double v134;
  const char *v135;
  double v136;
  const char *v137;
  double v138;
  const char *v139;
  double v140;
  const char *v141;
  double v142;
  const char *v143;
  double v144;
  const char *v145;
  double v146;
  const char *v147;
  double v148;
  const char *v149;
  double v150;
  const char *v151;
  double v152;
  const char *v153;
  double v154;
  const char *v155;
  double v156;
  const char *v157;
  double v158;
  const char *v159;
  double v160;
  const char *v161;
  double v162;
  const char *v163;
  double v164;
  const char *v165;
  double v166;
  const char *v167;
  double v168;
  const char *v169;
  double v170;
  const char *v171;
  double v172;
  const char *v173;
  double v174;
  const char *v175;
  double v176;
  const char *v177;
  double v178;
  const char *v179;
  double v180;
  const char *v181;
  double v182;
  const char *v183;
  double v184;
  const char *v185;
  double v186;
  const char *v187;
  double v188;
  int64_t v189;

  v4 = a3;
  v7 = v4;
  if (!v4)
    goto LABEL_185;
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("supports-key-sharing"), v6) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("supports-harmony"), v9) & 1) != 0)
    {
      v10 = 9;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v11, (uint64_t)CFSTR("supports-fmd-v2"), v12) & 1) != 0)
    {
      v10 = 10;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v13, (uint64_t)CFSTR("supports-fm-fence-v1"), v14) & 1) != 0)
    {
      v10 = 11;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v15, (uint64_t)CFSTR("supports-location-sharing"), v16) & 1) != 0)
    {
      v10 = 12;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v17, (uint64_t)CFSTR("supports-screen-time-v2"), v18) & 1) != 0)
    {
      v10 = 13;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v19, (uint64_t)CFSTR("supports-incoming-fmd-v1"), v20) & 1) != 0)
    {
      v10 = 14;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v21, (uint64_t)CFSTR("supports-secure-loc-v1"), v22) & 1) != 0)
    {
      v10 = 15;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v23, (uint64_t)CFSTR("supports-activity-sharing-v1"), v24) & 1) != 0)
    {
      v10 = 16;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v25, (uint64_t)CFSTR("supports-manatee-for-apple-cash"), v26) & 1) != 0)
    {
      v10 = 17;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v27, (uint64_t)CFSTR("supports-region-for-apple-cash"), v28) & 1) != 0)
    {
      v10 = 18;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v29, (uint64_t)CFSTR("supports-hk-resident"), v30) & 1) != 0)
    {
      v10 = 19;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v31, (uint64_t)CFSTR("supports-maps-routing-path-leg"), v32) & 1) != 0)
    {
      v10 = 20;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v33, (uint64_t)CFSTR("supports-beacon-sharing-v2"), v34) & 1) != 0)
    {
      v10 = 21;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v35, (uint64_t)CFSTR("supports-beneficiary-invites"), v36) & 1) != 0)
    {
      v10 = 22;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v37, (uint64_t)CFSTR("supports-st-er"), v38) & 1) != 0)
    {
      v10 = 23;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v39, (uint64_t)CFSTR("supports-maps-waypoint-route-sharing"), v40) & 1) != 0)
    {
      v10 = 24;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v41, (uint64_t)CFSTR("supports-maps-protocol-v5"), v42) & 1) != 0)
    {
      v10 = 25;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v43, (uint64_t)CFSTR("supports-cross-platform-sharing"), v44) & 1) != 0)
    {
      v10 = 26;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v45, (uint64_t)CFSTR("supports-zelkova"), v46) & 1) != 0)
    {
      v10 = 27;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v47, (uint64_t)CFSTR("supports-people-ranging-v1"), v48) & 1) != 0)
    {
      v10 = 28;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v49, (uint64_t)CFSTR("supports-beacon-sharing-v3"), v50) & 1) != 0)
    {
      v10 = 29;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v51, (uint64_t)CFSTR("supports-gft-relay"), v52) & 1) != 0)
    {
      v10 = 30;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v53, (uint64_t)CFSTR("supports-manatee-activity-sharing"), v54) & 1) != 0)
    {
      v10 = 31;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v55, (uint64_t)CFSTR("supports-restricted-guest"), v56) & 1) != 0)
    {
      v10 = 32;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v57, (uint64_t)CFSTR("supports-remote-atv-signin"), v58) & 1) != 0)
    {
      v10 = 33;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v59, (uint64_t)CFSTR("ec-version"), v60) & 1) != 0)
    {
      v10 = 34;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v61, (uint64_t)CFSTR("is-c2k-equipment"), v62) & 1) != 0)
    {
      v10 = 35;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v63, (uint64_t)CFSTR("show-peer-errors"), v64) & 1) != 0)
    {
      v10 = 36;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v65, (uint64_t)CFSTR("nicknames-version"), v66) & 1) != 0)
    {
      v10 = 37;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v67, (uint64_t)CFSTR("optionally-receive-typing-indicators"), v68) & 1) != 0)
    {
      v10 = 38;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v69, (uint64_t)CFSTR("supports-inline-attachments"), v70) & 1) != 0)
    {
      v10 = 39;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v71, (uint64_t)CFSTR("supports-keep-receipts"), v72) & 1) != 0)
    {
      v10 = 40;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v73, (uint64_t)CFSTR("supports-st-v1"), v74) & 1) != 0)
    {
      v10 = 41;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v75, (uint64_t)CFSTR("supports-ca-v1"), v76) & 1) != 0)
    {
      v10 = 42;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v77, (uint64_t)CFSTR("supports-be-v1"), v78) & 1) != 0)
    {
      v10 = 43;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v79, (uint64_t)CFSTR("supports-ack-v1"), v80) & 1) != 0)
    {
      v10 = 44;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v81, (uint64_t)CFSTR("supports-fsm-v1"), v82) & 1) != 0)
    {
      v10 = 45;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v83, (uint64_t)CFSTR("supports-fsm-v2"), v84) & 1) != 0)
    {
      v10 = 46;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v85, (uint64_t)CFSTR("supports-fsm-v3"), v86) & 1) != 0)
    {
      v10 = 47;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v87, (uint64_t)CFSTR("supports-ii-v1"), v88) & 1) != 0)
    {
      v10 = 48;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v89, (uint64_t)CFSTR("supports-impact-v1"), v90) & 1) != 0)
    {
      v10 = 49;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v91, (uint64_t)CFSTR("supports-update-attachments-v1"), v92) & 1) != 0)
    {
      v10 = 50;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v93, (uint64_t)CFSTR("supports-autoloopvideo-v1"), v94) & 1) != 0)
    {
      v10 = 51;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v95, (uint64_t)CFSTR("supports-media-v2"), v96) & 1) != 0)
    {
      v10 = 52;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v97, (uint64_t)CFSTR("supports-photos-extension-v1"), v98) & 1) != 0)
    {
      v10 = 53;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v99, (uint64_t)CFSTR("supports-photos-extension-v2"), v100) & 1) != 0)
    {
      v10 = 54;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v101, (uint64_t)CFSTR("supports-audio-messaging-v2"), v102) & 1) != 0)
    {
      v10 = 55;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v103, (uint64_t)CFSTR("supports-animoji-v2"), v104) & 1) != 0)
    {
      v10 = 56;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v105, (uint64_t)CFSTR("supports-certified-delivery-v1"), v106) & 1) != 0)
    {
      v10 = 57;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v107, (uint64_t)CFSTR("supports-original-timestamp-v1"), v108) & 1) != 0)
    {
      v10 = 58;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v109, (uint64_t)CFSTR("supports-protobuf-payload-data-v2"), v110) & 1) != 0)
    {
      v10 = 59;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v111, (uint64_t)CFSTR("supports-heif"), v112) & 1) != 0)
    {
      v10 = 60;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v113, (uint64_t)CFSTR("supports-hdr"), v114) & 1) != 0)
    {
      v10 = 61;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v115, (uint64_t)CFSTR("prefers-sdr"), v116) & 1) != 0)
    {
      v10 = 62;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v117, (uint64_t)CFSTR("supports-sa-v1"), v118) & 1) != 0)
    {
      v10 = 63;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v119, (uint64_t)CFSTR("supports-uwb"), v120) & 1) != 0)
    {
      v10 = 64;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v121, (uint64_t)CFSTR("supports-dq-nr"), v122) & 1) != 0)
    {
      v10 = 65;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v123, (uint64_t)CFSTR("supports-rem"), v124) & 1) != 0)
    {
      v10 = 66;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v125, (uint64_t)CFSTR("supports-people-request-messages"), v126) & 1) != 0)
    {
      v10 = 67;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v127, (uint64_t)CFSTR("supports-family-invite-message-bubble"), v128) & 1) != 0)
    {
      v10 = 68;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v129, (uint64_t)CFSTR("supports-people-request-messages-v2"), v130) & 1) != 0)
    {
      v10 = 69;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v131, (uint64_t)CFSTR("supports-askto"), v132) & 1) != 0)
    {
      v10 = 70;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v133, (uint64_t)CFSTR("supports-emoji-stickers"), v134) & 1) != 0)
    {
      v10 = 71;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v135, (uint64_t)CFSTR("supports-sticker-editing"), v136) & 1) != 0)
    {
      v10 = 72;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v137, (uint64_t)CFSTR("supports-hybrid-groups-v1"), v138) & 1) != 0)
    {
      v10 = 73;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v139, (uint64_t)CFSTR("supports-findmy-plugin-messages"), v140) & 1) != 0)
    {
      v10 = 74;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v141, (uint64_t)CFSTR("supports-sos-alerting"), v142) & 1) != 0)
    {
      v10 = 75;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v143, (uint64_t)CFSTR("supports-people-request-messages-v3"), v144) & 1) != 0)
    {
      v10 = 76;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v145, (uint64_t)CFSTR("supports-recurring-payment-bubbles"), v146) & 1) != 0)
    {
      v10 = 77;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v147, (uint64_t)CFSTR("supports-group-photo-refresh-version"), v148) & 1) != 0)
    {
      v10 = 78;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v149, (uint64_t)CFSTR("supports-emoji-tapbacks"), v150) & 1) != 0)
    {
      v10 = 79;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v151, (uint64_t)CFSTR("supports-send-later-messages"), v152) & 1) != 0)
    {
      v10 = 80;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v153, (uint64_t)CFSTR("supports-emoji-images"), v154) & 1) != 0)
    {
      v10 = 81;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v155, (uint64_t)CFSTR("supports-stick-moji-backs"), v156) & 1) != 0)
    {
      v10 = 82;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v157, (uint64_t)CFSTR("supports-high-quality-photo-file-sizes"), v158) & 1) != 0)
    {
      v10 = 83;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v159, (uint64_t)CFSTR("supports-stewie"), v160) & 1) != 0)
    {
      v10 = 84;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v161, (uint64_t)CFSTR("sender-key-message-version"), v162) & 1) != 0)
    {
      v10 = 85;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v163, (uint64_t)CFSTR("supports-sender-key-v1"), v164) & 1) != 0)
    {
      v10 = 86;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v165, (uint64_t)CFSTR("supports-modern-gft"), v166) & 1) != 0)
    {
      v10 = 87;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v167, (uint64_t)CFSTR("supports-co"), v168) & 1) != 0)
    {
      v10 = 88;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v169, (uint64_t)CFSTR("is-green-tea"), v170) & 1) != 0)
    {
      v10 = 89;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v171, (uint64_t)CFSTR("supports-gft-errors"), v172) & 1) != 0)
    {
      v10 = 90;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v173, (uint64_t)CFSTR("supports-gft-calls"), v174) & 1) != 0)
    {
      v10 = 91;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v175, (uint64_t)CFSTR("is-web-client"), v176) & 1) != 0)
    {
      v10 = 92;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v177, (uint64_t)CFSTR("supports-avless"), v178) & 1) != 0)
    {
      v10 = 93;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v179, (uint64_t)CFSTR("supports-self-one-to-one-invites"), v180) & 1) != 0)
    {
      v10 = 94;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v181, (uint64_t)CFSTR("supports-hi-res-vid"), v182) & 1) != 0)
    {
      v10 = 95;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v183, (uint64_t)CFSTR("supports-ssrc"), v184) & 1) != 0)
    {
      v10 = 96;
      goto LABEL_184;
    }
    if ((objc_msgSend_isEqualToString_(v7, v185, (uint64_t)CFSTR("gs-supports-friending-via-push"), v186) & 1) != 0)
    {
      v10 = 97;
      goto LABEL_184;
    }
    if (objc_msgSend_isEqualToString_(v7, v187, (uint64_t)CFSTR("gs-supports-message-transport-v2"), v188))
    {
      v10 = 98;
      goto LABEL_184;
    }
LABEL_185:
    v189 = 0;
    goto LABEL_186;
  }
  v10 = 8;
LABEL_184:
  v189 = *((char *)&self->super.isa + v10);
LABEL_186:

  return v189;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p>"), v6, v4, self);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  double v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  const char *v88;
  double v89;
  const char *v90;
  double v91;
  const char *v92;
  double v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  double v105;
  const char *v106;
  double v107;
  const char *v108;
  double v109;
  const char *v110;
  double v111;
  const char *v112;
  double v113;
  const char *v114;
  double v115;
  const char *v116;
  double v117;
  const char *v118;
  double v119;
  const char *v120;
  double v121;
  const char *v122;
  double v123;
  const char *v124;
  double v125;
  const char *v126;
  double v127;
  const char *v128;
  double v129;
  const char *v130;
  double v131;
  const char *v132;
  double v133;
  const char *v134;
  double v135;
  const char *v136;
  double v137;
  const char *v138;
  double v139;
  const char *v140;
  double v141;
  const char *v142;
  double v143;
  const char *v144;
  double v145;
  const char *v146;
  double v147;
  const char *v148;
  double v149;
  const char *v150;
  double v151;
  const char *v152;
  double v153;
  const char *v154;
  double v155;
  const char *v156;
  double v157;
  const char *v158;
  double v159;
  const char *v160;
  double v161;
  const char *v162;
  double v163;
  const char *v164;
  double v165;
  const char *v166;
  double v167;
  const char *v168;
  double v169;
  const char *v170;
  double v171;
  const char *v172;
  double v173;
  const char *v174;
  double v175;
  const char *v176;
  double v177;
  const char *v178;
  double v179;
  const char *v180;
  double v181;
  const char *v182;
  double v183;
  const char *v184;
  double v185;
  const char *v186;
  double v187;
  const char *v188;
  double v189;
  const char *v190;
  double v191;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v7 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p"), v6, v4, self);
  objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR(",\n\t%@ = %d"), v9, CFSTR("supports-key-sharing"), self->_supportsKeySharing);
  objc_msgSend_appendFormat_(v7, v10, (uint64_t)CFSTR(",\n\t%@ = %d"), v11, CFSTR("supports-harmony"), self->_supportsHarmony);
  objc_msgSend_appendFormat_(v7, v12, (uint64_t)CFSTR(",\n\t%@ = %d"), v13, CFSTR("supports-fmd-v2"), self->_supportsFMDV2);
  objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR(",\n\t%@ = %d"), v15, CFSTR("supports-fm-fence-v1"), self->_supportsFMFenceV1);
  objc_msgSend_appendFormat_(v7, v16, (uint64_t)CFSTR(",\n\t%@ = %d"), v17, CFSTR("supports-location-sharing"), self->_supportsLocationSharing);
  objc_msgSend_appendFormat_(v7, v18, (uint64_t)CFSTR(",\n\t%@ = %d"), v19, CFSTR("supports-screen-time-v2"), self->_supportsScreenTimeV2);
  objc_msgSend_appendFormat_(v7, v20, (uint64_t)CFSTR(",\n\t%@ = %d"), v21, CFSTR("supports-incoming-fmd-v1"), self->_supportsIncomingFindMyV1);
  objc_msgSend_appendFormat_(v7, v22, (uint64_t)CFSTR(",\n\t%@ = %d"), v23, CFSTR("supports-secure-loc-v1"), self->_supportsSecureLocationsV1);
  objc_msgSend_appendFormat_(v7, v24, (uint64_t)CFSTR(",\n\t%@ = %d"), v25, CFSTR("supports-activity-sharing-v1"), self->_supportsActivitySharing);
  objc_msgSend_appendFormat_(v7, v26, (uint64_t)CFSTR(",\n\t%@ = %d"), v27, CFSTR("supports-manatee-for-apple-cash"), self->_supportsManateeForAppleCash);
  objc_msgSend_appendFormat_(v7, v28, (uint64_t)CFSTR(",\n\t%@ = %d"), v29, CFSTR("supports-region-for-apple-cash"), self->_supportsRegionForAppleCash);
  objc_msgSend_appendFormat_(v7, v30, (uint64_t)CFSTR(",\n\t%@ = %d"), v31, CFSTR("supports-hk-resident"), self->_supportsHomeKitResident);
  objc_msgSend_appendFormat_(v7, v32, (uint64_t)CFSTR(",\n\t%@ = %d"), v33, CFSTR("supports-maps-routing-path-leg"), self->_supportsMapsRoutingPathLeg);
  objc_msgSend_appendFormat_(v7, v34, (uint64_t)CFSTR(",\n\t%@ = %d"), v35, CFSTR("supports-beacon-sharing-v2"), self->_supportsBeaconSharingV2);
  objc_msgSend_appendFormat_(v7, v36, (uint64_t)CFSTR(",\n\t%@ = %d"), v37, CFSTR("supports-beneficiary-invites"), self->_supportsBeneficiaryInvites);
  objc_msgSend_appendFormat_(v7, v38, (uint64_t)CFSTR(",\n\t%@ = %d"), v39, CFSTR("supports-st-er"), self->_supportsScreenTimeErrors);
  objc_msgSend_appendFormat_(v7, v40, (uint64_t)CFSTR(",\n\t%@ = %d"), v41, CFSTR("supports-maps-waypoint-route-sharing"), self->_supportsMapsWaypointRouteSharing);
  objc_msgSend_appendFormat_(v7, v42, (uint64_t)CFSTR(",\n\t%@ = %d"), v43, CFSTR("supports-maps-protocol-v5"), self->_supportsMapsProtocolV5);
  objc_msgSend_appendFormat_(v7, v44, (uint64_t)CFSTR(",\n\t%@ = %d"), v45, CFSTR("supports-cross-platform-sharing"), self->_supportsCrossPlatformSharing);
  objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR(",\n\t%@ = %d"), v47, CFSTR("supports-zelkova"), self->_supportsZelkova);
  objc_msgSend_appendFormat_(v7, v48, (uint64_t)CFSTR(",\n\t%@ = %d"), v49, CFSTR("supports-people-ranging-v1"), self->_supportsPeopleRangingV1);
  objc_msgSend_appendFormat_(v7, v50, (uint64_t)CFSTR(",\n\t%@ = %d"), v51, CFSTR("supports-beacon-sharing-v3"), self->_supportsBeaconSharingV3);
  objc_msgSend_appendFormat_(v7, v52, (uint64_t)CFSTR(",\n\t%@ = %d"), v53, CFSTR("supports-gft-relay"), self->_supportsGFTRelay);
  objc_msgSend_appendFormat_(v7, v54, (uint64_t)CFSTR(",\n\t%@ = %d"), v55, CFSTR("supports-manatee-activity-sharing"), self->_supportsManateeActivitySharing);
  objc_msgSend_appendFormat_(v7, v56, (uint64_t)CFSTR(",\n\t%@ = %d"), v57, CFSTR("supports-restricted-guest"), self->_supportsRestrictedGuest);
  objc_msgSend_appendFormat_(v7, v58, (uint64_t)CFSTR(",\n\t%@ = %d"), v59, CFSTR("supports-remote-atv-signin"), self->_supportsRemoteATVSignIn);
  objc_msgSend_appendFormat_(v7, v60, (uint64_t)CFSTR(",\n\t%@ = %d"), v61, CFSTR("ec-version"), self->_ecVersion);
  objc_msgSend_appendFormat_(v7, v62, (uint64_t)CFSTR(",\n\t%@ = %d"), v63, CFSTR("is-c2k-equipment"), self->_isC2KEquipment);
  objc_msgSend_appendFormat_(v7, v64, (uint64_t)CFSTR(",\n\t%@ = %d"), v65, CFSTR("show-peer-errors"), self->_showPeerErrors);
  objc_msgSend_appendFormat_(v7, v66, (uint64_t)CFSTR(",\n\t%@ = %d"), v67, CFSTR("nicknames-version"), self->_nicknamesVersion);
  objc_msgSend_appendFormat_(v7, v68, (uint64_t)CFSTR(",\n\t%@ = %d"), v69, CFSTR("optionally-receive-typing-indicators"), self->_optionallyReceiveTypingIndicator);
  objc_msgSend_appendFormat_(v7, v70, (uint64_t)CFSTR(",\n\t%@ = %d"), v71, CFSTR("supports-inline-attachments"), self->_supportsInlineAttachments);
  objc_msgSend_appendFormat_(v7, v72, (uint64_t)CFSTR(",\n\t%@ = %d"), v73, CFSTR("supports-keep-receipts"), self->_supportsKeepReceipts);
  objc_msgSend_appendFormat_(v7, v74, (uint64_t)CFSTR(",\n\t%@ = %d"), v75, CFSTR("supports-st-v1"), self->_supportsStickersV1);
  objc_msgSend_appendFormat_(v7, v76, (uint64_t)CFSTR(",\n\t%@ = %d"), v77, CFSTR("supports-ca-v1"), self->_supportsChatAppsV1);
  objc_msgSend_appendFormat_(v7, v78, (uint64_t)CFSTR(",\n\t%@ = %d"), v79, CFSTR("supports-be-v1"), self->_supportsBubbleEditingV1);
  objc_msgSend_appendFormat_(v7, v80, (uint64_t)CFSTR(",\n\t%@ = %d"), v81, CFSTR("supports-ack-v1"), self->_supportsAcknowledgementsV1);
  objc_msgSend_appendFormat_(v7, v82, (uint64_t)CFSTR(",\n\t%@ = %d"), v83, CFSTR("supports-fsm-v1"), self->_supportsFullScreenMomentsV1);
  objc_msgSend_appendFormat_(v7, v84, (uint64_t)CFSTR(",\n\t%@ = %d"), v85, CFSTR("supports-fsm-v2"), self->_supportsFullScreenMomentsV2);
  objc_msgSend_appendFormat_(v7, v86, (uint64_t)CFSTR(",\n\t%@ = %d"), v87, CFSTR("supports-fsm-v3"), self->_supportsFullScreenMomentsV3);
  objc_msgSend_appendFormat_(v7, v88, (uint64_t)CFSTR(",\n\t%@ = %d"), v89, CFSTR("supports-ii-v1"), self->_supportsInvisibleInkV1);
  objc_msgSend_appendFormat_(v7, v90, (uint64_t)CFSTR(",\n\t%@ = %d"), v91, CFSTR("supports-impact-v1"), self->_supportsImpactEffectsV1);
  objc_msgSend_appendFormat_(v7, v92, (uint64_t)CFSTR(",\n\t%@ = %d"), v93, CFSTR("supports-update-attachments-v1"), self->_supportsUpdateAttachmentsV1);
  objc_msgSend_appendFormat_(v7, v94, (uint64_t)CFSTR(",\n\t%@ = %d"), v95, CFSTR("supports-autoloopvideo-v1"), self->_supportsAutoloopVideoV1);
  objc_msgSend_appendFormat_(v7, v96, (uint64_t)CFSTR(",\n\t%@ = %d"), v97, CFSTR("supports-media-v2"), self->_supportsMediaV2);
  objc_msgSend_appendFormat_(v7, v98, (uint64_t)CFSTR(",\n\t%@ = %d"), v99, CFSTR("supports-photos-extension-v1"), self->_supportsPhotosExtensionV1);
  objc_msgSend_appendFormat_(v7, v100, (uint64_t)CFSTR(",\n\t%@ = %d"), v101, CFSTR("supports-photos-extension-v2"), self->_supportsPhotosExtensionV2);
  objc_msgSend_appendFormat_(v7, v102, (uint64_t)CFSTR(",\n\t%@ = %d"), v103, CFSTR("supports-audio-messaging-v2"), self->_supportsAudioMessagingV2);
  objc_msgSend_appendFormat_(v7, v104, (uint64_t)CFSTR(",\n\t%@ = %d"), v105, CFSTR("supports-animoji-v2"), self->_supportsAnimojiV2);
  objc_msgSend_appendFormat_(v7, v106, (uint64_t)CFSTR(",\n\t%@ = %d"), v107, CFSTR("supports-certified-delivery-v1"), self->_supportsCertifiedDeliveryV1);
  objc_msgSend_appendFormat_(v7, v108, (uint64_t)CFSTR(",\n\t%@ = %d"), v109, CFSTR("supports-original-timestamp-v1"), self->_supportsOriginalTimestampOrderingV1);
  objc_msgSend_appendFormat_(v7, v110, (uint64_t)CFSTR(",\n\t%@ = %d"), v111, CFSTR("supports-protobuf-payload-data-v2"), self->_supportsProtobufPayloadDataV2);
  objc_msgSend_appendFormat_(v7, v112, (uint64_t)CFSTR(",\n\t%@ = %d"), v113, CFSTR("supports-heif"), self->_supportsHEIFEncoding);
  objc_msgSend_appendFormat_(v7, v114, (uint64_t)CFSTR(",\n\t%@ = %d"), v115, CFSTR("supports-hdr"), self->_supportsHDRVideo);
  objc_msgSend_appendFormat_(v7, v116, (uint64_t)CFSTR(",\n\t%@ = %d"), v117, CFSTR("prefers-sdr"), self->_prefersSDRVideo);
  objc_msgSend_appendFormat_(v7, v118, (uint64_t)CFSTR(",\n\t%@ = %d"), v119, CFSTR("supports-sa-v1"), self->_supportsSyndicationActionsV1);
  objc_msgSend_appendFormat_(v7, v120, (uint64_t)CFSTR(",\n\t%@ = %d"), v121, CFSTR("supports-uwb"), self->_supportsUWB);
  objc_msgSend_appendFormat_(v7, v122, (uint64_t)CFSTR(",\n\t%@ = %d"), v123, CFSTR("supports-dq-nr"), self->_supportsDeliveredQuietlyAndNotifyRecipient);
  objc_msgSend_appendFormat_(v7, v124, (uint64_t)CFSTR(",\n\t%@ = %d"), v125, CFSTR("supports-rem"), self->_supportsRetractAndEditMessages);
  objc_msgSend_appendFormat_(v7, v126, (uint64_t)CFSTR(",\n\t%@ = %d"), v127, CFSTR("supports-people-request-messages"), self->_supportsPeopleRequestMessages);
  objc_msgSend_appendFormat_(v7, v128, (uint64_t)CFSTR(",\n\t%@ = %d"), v129, CFSTR("supports-family-invite-message-bubble"), self->_supportsFamilyInviteMessageBubble);
  objc_msgSend_appendFormat_(v7, v130, (uint64_t)CFSTR(",\n\t%@ = %d"), v131, CFSTR("supports-people-request-messages-v2"), self->_supportsPeopleRequestMessagesV2);
  objc_msgSend_appendFormat_(v7, v132, (uint64_t)CFSTR(",\n\t%@ = %d"), v133, CFSTR("supports-askto"), self->_supportsAskTo);
  objc_msgSend_appendFormat_(v7, v134, (uint64_t)CFSTR(",\n\t%@ = %d"), v135, CFSTR("supports-emoji-stickers"), self->_supportsEmojiStickers);
  objc_msgSend_appendFormat_(v7, v136, (uint64_t)CFSTR(",\n\t%@ = %d"), v137, CFSTR("supports-sticker-editing"), self->_supportsStickerEditing);
  objc_msgSend_appendFormat_(v7, v138, (uint64_t)CFSTR(",\n\t%@ = %d"), v139, CFSTR("supports-hybrid-groups-v1"), self->_supportsHybridGroupsV1);
  objc_msgSend_appendFormat_(v7, v140, (uint64_t)CFSTR(",\n\t%@ = %d"), v141, CFSTR("supports-findmy-plugin-messages"), self->_supportsFindMyPluginMessages);
  objc_msgSend_appendFormat_(v7, v142, (uint64_t)CFSTR(",\n\t%@ = %d"), v143, CFSTR("supports-sos-alerting"), self->_supportsSOSAlerting);
  objc_msgSend_appendFormat_(v7, v144, (uint64_t)CFSTR(",\n\t%@ = %d"), v145, CFSTR("supports-people-request-messages-v3"), self->_supportsPeopleRequestMessagesV3);
  objc_msgSend_appendFormat_(v7, v146, (uint64_t)CFSTR(",\n\t%@ = %d"), v147, CFSTR("supports-recurring-payment-bubbles"), self->_supportsRecurringPaymentBubbles);
  objc_msgSend_appendFormat_(v7, v148, (uint64_t)CFSTR(",\n\t%@ = %d"), v149, CFSTR("supports-group-photo-refresh-version"), self->_supportsGroupPhotoRefreshVersion);
  objc_msgSend_appendFormat_(v7, v150, (uint64_t)CFSTR(",\n\t%@ = %d"), v151, CFSTR("supports-emoji-tapbacks"), self->_supportsEmojiTapbacks);
  objc_msgSend_appendFormat_(v7, v152, (uint64_t)CFSTR(",\n\t%@ = %d"), v153, CFSTR("supports-send-later-messages"), self->_supportsSendLaterMessages);
  objc_msgSend_appendFormat_(v7, v154, (uint64_t)CFSTR(",\n\t%@ = %d"), v155, CFSTR("supports-emoji-images"), self->_supportsEmojiImages);
  objc_msgSend_appendFormat_(v7, v156, (uint64_t)CFSTR(",\n\t%@ = %d"), v157, CFSTR("supports-stick-moji-backs"), self->_supportsStickMojiBacks);
  objc_msgSend_appendFormat_(v7, v158, (uint64_t)CFSTR(",\n\t%@ = %d"), v159, CFSTR("supports-high-quality-photo-file-sizes"), self->_supportsHighQualityPhotoFileSizes);
  objc_msgSend_appendFormat_(v7, v160, (uint64_t)CFSTR(",\n\t%@ = %d"), v161, CFSTR("supports-stewie"), self->_supportsStewie);
  objc_msgSend_appendFormat_(v7, v162, (uint64_t)CFSTR(",\n\t%@ = %d"), v163, CFSTR("sender-key-message-version"), self->_senderKeyMessageVersion);
  objc_msgSend_appendFormat_(v7, v164, (uint64_t)CFSTR(",\n\t%@ = %d"), v165, CFSTR("supports-sender-key-v1"), self->_supportsSenderKey);
  objc_msgSend_appendFormat_(v7, v166, (uint64_t)CFSTR(",\n\t%@ = %d"), v167, CFSTR("supports-modern-gft"), self->_supportsModernGFT);
  objc_msgSend_appendFormat_(v7, v168, (uint64_t)CFSTR(",\n\t%@ = %d"), v169, CFSTR("supports-co"), self->_supportsCo);
  objc_msgSend_appendFormat_(v7, v170, (uint64_t)CFSTR(",\n\t%@ = %d"), v171, CFSTR("is-green-tea"), self->_isGreenTea);
  objc_msgSend_appendFormat_(v7, v172, (uint64_t)CFSTR(",\n\t%@ = %d"), v173, CFSTR("supports-gft-errors"), self->_supportsGondola);
  objc_msgSend_appendFormat_(v7, v174, (uint64_t)CFSTR(",\n\t%@ = %d"), v175, CFSTR("supports-gft-calls"), self->_doesNotSupportGFTCalls);
  objc_msgSend_appendFormat_(v7, v176, (uint64_t)CFSTR(",\n\t%@ = %d"), v177, CFSTR("is-web-client"), self->_isWebClient);
  objc_msgSend_appendFormat_(v7, v178, (uint64_t)CFSTR(",\n\t%@ = %d"), v179, CFSTR("supports-avless"), self->_supportsAVLess);
  objc_msgSend_appendFormat_(v7, v180, (uint64_t)CFSTR(",\n\t%@ = %d"), v181, CFSTR("supports-self-one-to-one-invites"), self->_supportsSelfOneToOneInvites);
  objc_msgSend_appendFormat_(v7, v182, (uint64_t)CFSTR(",\n\t%@ = %d"), v183, CFSTR("supports-hi-res-vid"), self->_supportsHighResVideoMessaging);
  objc_msgSend_appendFormat_(v7, v184, (uint64_t)CFSTR(",\n\t%@ = %d"), v185, CFSTR("supports-ssrc"), self->_supportsSSRC);
  objc_msgSend_appendFormat_(v7, v186, (uint64_t)CFSTR(",\n\t%@ = %d"), v187, CFSTR("gs-supports-friending-via-push"), self->_supportsFriendingViaPush);
  objc_msgSend_appendFormat_(v7, v188, (uint64_t)CFSTR(",\n\t%@ = %d"), v189, CFSTR("gs-supports-message-transport-v2"), self->_supportsMessageTransportV2);
  objc_msgSend_appendString_(v7, v190, (uint64_t)CFSTR(">"), v191);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToEndpointCapabilites;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    isEqualToEndpointCapabilites = objc_msgSend_isEqualToEndpointCapabilites_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToEndpointCapabilites = 0;

  return isEqualToEndpointCapabilites;
}

- (BOOL)isEqualToEndpointCapabilites:(id)a3
{
  IDSEndpointCapabilities *v4;
  BOOL v5;

  v4 = (IDSEndpointCapabilities *)a3;
  v5 = self == v4
    || self->_supportsKeySharing == v4->_supportsKeySharing
    && self->_supportsHarmony == v4->_supportsHarmony
    && self->_supportsFMDV2 == v4->_supportsFMDV2
    && self->_supportsFMFenceV1 == v4->_supportsFMFenceV1
    && self->_supportsLocationSharing == v4->_supportsLocationSharing
    && self->_supportsScreenTimeV2 == v4->_supportsScreenTimeV2
    && self->_supportsIncomingFindMyV1 == v4->_supportsIncomingFindMyV1
    && self->_supportsSecureLocationsV1 == v4->_supportsSecureLocationsV1
    && self->_supportsActivitySharing == v4->_supportsActivitySharing
    && self->_supportsManateeForAppleCash == v4->_supportsManateeForAppleCash
    && self->_supportsRegionForAppleCash == v4->_supportsRegionForAppleCash
    && self->_supportsHomeKitResident == v4->_supportsHomeKitResident
    && self->_supportsMapsRoutingPathLeg == v4->_supportsMapsRoutingPathLeg
    && self->_supportsBeaconSharingV2 == v4->_supportsBeaconSharingV2
    && self->_supportsBeneficiaryInvites == v4->_supportsBeneficiaryInvites
    && self->_supportsScreenTimeErrors == v4->_supportsScreenTimeErrors
    && self->_supportsMapsWaypointRouteSharing == v4->_supportsMapsWaypointRouteSharing
    && self->_supportsMapsProtocolV5 == v4->_supportsMapsProtocolV5
    && self->_supportsCrossPlatformSharing == v4->_supportsCrossPlatformSharing
    && self->_supportsZelkova == v4->_supportsZelkova
    && self->_supportsPeopleRangingV1 == v4->_supportsPeopleRangingV1
    && self->_supportsBeaconSharingV3 == v4->_supportsBeaconSharingV3
    && self->_supportsGFTRelay == v4->_supportsGFTRelay
    && self->_supportsManateeActivitySharing == v4->_supportsManateeActivitySharing
    && self->_supportsRestrictedGuest == v4->_supportsRestrictedGuest
    && self->_supportsRemoteATVSignIn == v4->_supportsRemoteATVSignIn
    && self->_ecVersion == v4->_ecVersion
    && self->_isC2KEquipment == v4->_isC2KEquipment
    && self->_showPeerErrors == v4->_showPeerErrors
    && self->_nicknamesVersion == v4->_nicknamesVersion
    && self->_optionallyReceiveTypingIndicator == v4->_optionallyReceiveTypingIndicator
    && self->_supportsInlineAttachments == v4->_supportsInlineAttachments
    && self->_supportsKeepReceipts == v4->_supportsKeepReceipts
    && self->_supportsStickersV1 == v4->_supportsStickersV1
    && self->_supportsChatAppsV1 == v4->_supportsChatAppsV1
    && self->_supportsBubbleEditingV1 == v4->_supportsBubbleEditingV1
    && self->_supportsAcknowledgementsV1 == v4->_supportsAcknowledgementsV1
    && self->_supportsFullScreenMomentsV1 == v4->_supportsFullScreenMomentsV1
    && self->_supportsFullScreenMomentsV2 == v4->_supportsFullScreenMomentsV2
    && self->_supportsFullScreenMomentsV3 == v4->_supportsFullScreenMomentsV3
    && self->_supportsInvisibleInkV1 == v4->_supportsInvisibleInkV1
    && self->_supportsImpactEffectsV1 == v4->_supportsImpactEffectsV1
    && self->_supportsUpdateAttachmentsV1 == v4->_supportsUpdateAttachmentsV1
    && self->_supportsAutoloopVideoV1 == v4->_supportsAutoloopVideoV1
    && self->_supportsMediaV2 == v4->_supportsMediaV2
    && self->_supportsPhotosExtensionV1 == v4->_supportsPhotosExtensionV1
    && self->_supportsPhotosExtensionV2 == v4->_supportsPhotosExtensionV2
    && self->_supportsAudioMessagingV2 == v4->_supportsAudioMessagingV2
    && self->_supportsAnimojiV2 == v4->_supportsAnimojiV2
    && self->_supportsCertifiedDeliveryV1 == v4->_supportsCertifiedDeliveryV1
    && self->_supportsOriginalTimestampOrderingV1 == v4->_supportsOriginalTimestampOrderingV1
    && self->_supportsProtobufPayloadDataV2 == v4->_supportsProtobufPayloadDataV2
    && self->_supportsHEIFEncoding == v4->_supportsHEIFEncoding
    && self->_supportsHDRVideo == v4->_supportsHDRVideo
    && self->_prefersSDRVideo == v4->_prefersSDRVideo
    && self->_supportsSyndicationActionsV1 == v4->_supportsSyndicationActionsV1
    && self->_supportsUWB == v4->_supportsUWB
    && self->_supportsDeliveredQuietlyAndNotifyRecipient == v4->_supportsDeliveredQuietlyAndNotifyRecipient
    && self->_supportsRetractAndEditMessages == v4->_supportsRetractAndEditMessages
    && self->_supportsPeopleRequestMessages == v4->_supportsPeopleRequestMessages
    && self->_supportsFamilyInviteMessageBubble == v4->_supportsFamilyInviteMessageBubble
    && self->_supportsPeopleRequestMessagesV2 == v4->_supportsPeopleRequestMessagesV2
    && self->_supportsAskTo == v4->_supportsAskTo
    && self->_supportsEmojiStickers == v4->_supportsEmojiStickers
    && self->_supportsStickerEditing == v4->_supportsStickerEditing
    && self->_supportsHybridGroupsV1 == v4->_supportsHybridGroupsV1
    && self->_supportsFindMyPluginMessages == v4->_supportsFindMyPluginMessages
    && self->_supportsSOSAlerting == v4->_supportsSOSAlerting
    && self->_supportsPeopleRequestMessagesV3 == v4->_supportsPeopleRequestMessagesV3
    && self->_supportsRecurringPaymentBubbles == v4->_supportsRecurringPaymentBubbles
    && self->_supportsGroupPhotoRefreshVersion == v4->_supportsGroupPhotoRefreshVersion
    && self->_supportsEmojiTapbacks == v4->_supportsEmojiTapbacks
    && self->_supportsSendLaterMessages == v4->_supportsSendLaterMessages
    && self->_supportsEmojiImages == v4->_supportsEmojiImages
    && self->_supportsStickMojiBacks == v4->_supportsStickMojiBacks
    && self->_supportsHighQualityPhotoFileSizes == v4->_supportsHighQualityPhotoFileSizes
    && self->_supportsStewie == v4->_supportsStewie
    && self->_senderKeyMessageVersion == v4->_senderKeyMessageVersion
    && self->_supportsSenderKey == v4->_supportsSenderKey
    && self->_supportsModernGFT == v4->_supportsModernGFT
    && self->_supportsCo == v4->_supportsCo
    && self->_isGreenTea == v4->_isGreenTea
    && self->_supportsGondola == v4->_supportsGondola
    && self->_doesNotSupportGFTCalls == v4->_doesNotSupportGFTCalls
    && self->_isWebClient == v4->_isWebClient
    && self->_supportsAVLess == v4->_supportsAVLess
    && self->_supportsSelfOneToOneInvites == v4->_supportsSelfOneToOneInvites
    && self->_supportsHighResVideoMessaging == v4->_supportsHighResVideoMessaging
    && self->_supportsSSRC == v4->_supportsSSRC
    && self->_supportsFriendingViaPush == v4->_supportsFriendingViaPush
    && self->_supportsMessageTransportV2 == v4->_supportsMessageTransportV2;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpointCapabilities)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  _BYTE *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  double v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  const char *v88;
  double v89;
  const char *v90;
  double v91;
  const char *v92;
  double v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  double v105;
  const char *v106;
  double v107;
  const char *v108;
  double v109;
  const char *v110;
  double v111;
  const char *v112;
  double v113;
  const char *v114;
  double v115;
  const char *v116;
  double v117;
  const char *v118;
  double v119;
  const char *v120;
  double v121;
  const char *v122;
  double v123;
  const char *v124;
  double v125;
  const char *v126;
  double v127;
  const char *v128;
  double v129;
  const char *v130;
  double v131;
  const char *v132;
  double v133;
  const char *v134;
  double v135;
  const char *v136;
  double v137;
  const char *v138;
  double v139;
  const char *v140;
  double v141;
  const char *v142;
  double v143;
  const char *v144;
  double v145;
  const char *v146;
  double v147;
  const char *v148;
  double v149;
  const char *v150;
  double v151;
  const char *v152;
  double v153;
  const char *v154;
  double v155;
  const char *v156;
  double v157;
  const char *v158;
  double v159;
  const char *v160;
  double v161;
  const char *v162;
  double v163;
  const char *v164;
  double v165;
  const char *v166;
  double v167;
  const char *v168;
  double v169;
  const char *v170;
  double v171;
  const char *v172;
  double v173;
  const char *v174;
  double v175;
  const char *v176;
  double v177;
  const char *v178;
  double v179;
  const char *v180;
  double v181;
  const char *v182;
  double v183;
  const char *v184;
  double v185;
  const char *v186;
  double v187;
  const char *v188;
  double v189;
  const char *v190;
  double v191;
  const char *v192;
  double v193;
  IDSEndpointCapabilities *v194;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kCapabilitiesMapKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11 = (_BYTE *)objc_msgSend_initWithCapabilitiesMap_(self, v8, (uint64_t)v9, v10);
  }
  else
  {
    v11 = (_BYTE *)objc_msgSend_initWithCapabilitiesMap_(self, v8, MEMORY[0x1E0C9AA70], v10);
    if (v11)
    {
      v11[8] = objc_msgSend_decodeIntForKey_(v4, v12, (uint64_t)CFSTR("_supportsKeySharing"), v13);
      v11[9] = objc_msgSend_decodeIntForKey_(v4, v14, (uint64_t)CFSTR("_supportsHarmony"), v15);
      v11[10] = objc_msgSend_decodeIntForKey_(v4, v16, (uint64_t)CFSTR("_supportsFMDV2"), v17);
      v11[11] = objc_msgSend_decodeIntForKey_(v4, v18, (uint64_t)CFSTR("_supportsFMFenceV1"), v19);
      v11[12] = objc_msgSend_decodeIntForKey_(v4, v20, (uint64_t)CFSTR("_supportsLocationSharing"), v21);
      v11[13] = objc_msgSend_decodeIntForKey_(v4, v22, (uint64_t)CFSTR("_supportsScreenTimeV2"), v23);
      v11[14] = objc_msgSend_decodeIntForKey_(v4, v24, (uint64_t)CFSTR("_supportsIncomingFindMyV1"), v25);
      v11[15] = objc_msgSend_decodeIntForKey_(v4, v26, (uint64_t)CFSTR("_supportsSecureLocationsV1"), v27);
      v11[16] = objc_msgSend_decodeIntForKey_(v4, v28, (uint64_t)CFSTR("_supportsActivitySharing"), v29);
      v11[17] = objc_msgSend_decodeIntForKey_(v4, v30, (uint64_t)CFSTR("_supportsManateeForAppleCash"), v31);
      v11[18] = objc_msgSend_decodeIntForKey_(v4, v32, (uint64_t)CFSTR("_supportsRegionForAppleCash"), v33);
      v11[19] = objc_msgSend_decodeIntForKey_(v4, v34, (uint64_t)CFSTR("_supportsHomeKitResident"), v35);
      v11[20] = objc_msgSend_decodeIntForKey_(v4, v36, (uint64_t)CFSTR("_supportsMapsRoutingPathLeg"), v37);
      v11[21] = objc_msgSend_decodeIntForKey_(v4, v38, (uint64_t)CFSTR("_supportsBeaconSharingV2"), v39);
      v11[22] = objc_msgSend_decodeIntForKey_(v4, v40, (uint64_t)CFSTR("_supportsBeneficiaryInvites"), v41);
      v11[23] = objc_msgSend_decodeIntForKey_(v4, v42, (uint64_t)CFSTR("_supportsScreenTimeErrors"), v43);
      v11[24] = objc_msgSend_decodeIntForKey_(v4, v44, (uint64_t)CFSTR("_supportsMapsWaypointRouteSharing"), v45);
      v11[25] = objc_msgSend_decodeIntForKey_(v4, v46, (uint64_t)CFSTR("_supportsMapsProtocolV5"), v47);
      v11[26] = objc_msgSend_decodeIntForKey_(v4, v48, (uint64_t)CFSTR("_supportsCrossPlatformSharing"), v49);
      v11[27] = objc_msgSend_decodeIntForKey_(v4, v50, (uint64_t)CFSTR("_supportsZelkova"), v51);
      v11[28] = objc_msgSend_decodeIntForKey_(v4, v52, (uint64_t)CFSTR("_supportsPeopleRangingV1"), v53);
      v11[29] = objc_msgSend_decodeIntForKey_(v4, v54, (uint64_t)CFSTR("_supportsBeaconSharingV3"), v55);
      v11[30] = objc_msgSend_decodeIntForKey_(v4, v56, (uint64_t)CFSTR("_supportsGFTRelay"), v57);
      v11[31] = objc_msgSend_decodeIntForKey_(v4, v58, (uint64_t)CFSTR("_supportsManateeActivitySharing"), v59);
      v11[32] = objc_msgSend_decodeIntForKey_(v4, v60, (uint64_t)CFSTR("_supportsRestrictedGuest"), v61);
      v11[33] = objc_msgSend_decodeIntForKey_(v4, v62, (uint64_t)CFSTR("_supportsRemoteATVSignIn"), v63);
      v11[34] = objc_msgSend_decodeIntForKey_(v4, v64, (uint64_t)CFSTR("_ecVersion"), v65);
      v11[35] = objc_msgSend_decodeIntForKey_(v4, v66, (uint64_t)CFSTR("_isC2KEquipment"), v67);
      v11[36] = objc_msgSend_decodeIntForKey_(v4, v68, (uint64_t)CFSTR("_showPeerErrors"), v69);
      v11[37] = objc_msgSend_decodeIntForKey_(v4, v70, (uint64_t)CFSTR("_nicknamesVersion"), v71);
      v11[38] = objc_msgSend_decodeIntForKey_(v4, v72, (uint64_t)CFSTR("_optionallyReceiveTypingIndicator"), v73);
      v11[39] = objc_msgSend_decodeIntForKey_(v4, v74, (uint64_t)CFSTR("_supportsInlineAttachments"), v75);
      v11[40] = objc_msgSend_decodeIntForKey_(v4, v76, (uint64_t)CFSTR("_supportsKeepReceipts"), v77);
      v11[41] = objc_msgSend_decodeIntForKey_(v4, v78, (uint64_t)CFSTR("_supportsStickersV1"), v79);
      v11[42] = objc_msgSend_decodeIntForKey_(v4, v80, (uint64_t)CFSTR("_supportsChatAppsV1"), v81);
      v11[43] = objc_msgSend_decodeIntForKey_(v4, v82, (uint64_t)CFSTR("_supportsBubbleEditingV1"), v83);
      v11[44] = objc_msgSend_decodeIntForKey_(v4, v84, (uint64_t)CFSTR("_supportsAcknowledgementsV1"), v85);
      v11[45] = objc_msgSend_decodeIntForKey_(v4, v86, (uint64_t)CFSTR("_supportsFullScreenMomentsV1"), v87);
      v11[46] = objc_msgSend_decodeIntForKey_(v4, v88, (uint64_t)CFSTR("_supportsFullScreenMomentsV2"), v89);
      v11[47] = objc_msgSend_decodeIntForKey_(v4, v90, (uint64_t)CFSTR("_supportsFullScreenMomentsV3"), v91);
      v11[48] = objc_msgSend_decodeIntForKey_(v4, v92, (uint64_t)CFSTR("_supportsInvisibleInkV1"), v93);
      v11[49] = objc_msgSend_decodeIntForKey_(v4, v94, (uint64_t)CFSTR("_supportsImpactEffectsV1"), v95);
      v11[50] = objc_msgSend_decodeIntForKey_(v4, v96, (uint64_t)CFSTR("_supportsUpdateAttachmentsV1"), v97);
      v11[51] = objc_msgSend_decodeIntForKey_(v4, v98, (uint64_t)CFSTR("_supportsAutoloopVideoV1"), v99);
      v11[52] = objc_msgSend_decodeIntForKey_(v4, v100, (uint64_t)CFSTR("_supportsMediaV2"), v101);
      v11[53] = objc_msgSend_decodeIntForKey_(v4, v102, (uint64_t)CFSTR("_supportsPhotosExtensionV1"), v103);
      v11[54] = objc_msgSend_decodeIntForKey_(v4, v104, (uint64_t)CFSTR("_supportsPhotosExtensionV2"), v105);
      v11[55] = objc_msgSend_decodeIntForKey_(v4, v106, (uint64_t)CFSTR("_supportsAudioMessagingV2"), v107);
      v11[56] = objc_msgSend_decodeIntForKey_(v4, v108, (uint64_t)CFSTR("_supportsAnimojiV2"), v109);
      v11[57] = objc_msgSend_decodeIntForKey_(v4, v110, (uint64_t)CFSTR("_supportsCertifiedDeliveryV1"), v111);
      v11[58] = objc_msgSend_decodeIntForKey_(v4, v112, (uint64_t)CFSTR("_supportsOriginalTimestampOrderingV1"), v113);
      v11[59] = objc_msgSend_decodeIntForKey_(v4, v114, (uint64_t)CFSTR("_supportsProtobufPayloadDataV2"), v115);
      v11[60] = objc_msgSend_decodeIntForKey_(v4, v116, (uint64_t)CFSTR("_supportsHEIFEncoding"), v117);
      v11[61] = objc_msgSend_decodeIntForKey_(v4, v118, (uint64_t)CFSTR("_supportsHDRVideo"), v119);
      v11[62] = objc_msgSend_decodeIntForKey_(v4, v120, (uint64_t)CFSTR("_prefersSDRVideo"), v121);
      v11[63] = objc_msgSend_decodeIntForKey_(v4, v122, (uint64_t)CFSTR("_supportsSyndicationActionsV1"), v123);
      v11[64] = objc_msgSend_decodeIntForKey_(v4, v124, (uint64_t)CFSTR("_supportsUWB"), v125);
      v11[65] = objc_msgSend_decodeIntForKey_(v4, v126, (uint64_t)CFSTR("_supportsDeliveredQuietlyAndNotifyRecipient"), v127);
      v11[66] = objc_msgSend_decodeIntForKey_(v4, v128, (uint64_t)CFSTR("_supportsRetractAndEditMessages"), v129);
      v11[67] = objc_msgSend_decodeIntForKey_(v4, v130, (uint64_t)CFSTR("_supportsPeopleRequestMessages"), v131);
      v11[68] = objc_msgSend_decodeIntForKey_(v4, v132, (uint64_t)CFSTR("_supportsFamilyInviteMessageBubble"), v133);
      v11[69] = objc_msgSend_decodeIntForKey_(v4, v134, (uint64_t)CFSTR("_supportsPeopleRequestMessagesV2"), v135);
      v11[70] = objc_msgSend_decodeIntForKey_(v4, v136, (uint64_t)CFSTR("_supportsAskTo"), v137);
      v11[71] = objc_msgSend_decodeIntForKey_(v4, v138, (uint64_t)CFSTR("_supportsEmojiStickers"), v139);
      v11[72] = objc_msgSend_decodeIntForKey_(v4, v140, (uint64_t)CFSTR("_supportsStickerEditing"), v141);
      v11[73] = objc_msgSend_decodeIntForKey_(v4, v142, (uint64_t)CFSTR("_supportsHybridGroupsV1"), v143);
      v11[74] = objc_msgSend_decodeIntForKey_(v4, v144, (uint64_t)CFSTR("_supportsFindMyPluginMessages"), v145);
      v11[75] = objc_msgSend_decodeIntForKey_(v4, v146, (uint64_t)CFSTR("_supportsSOSAlerting"), v147);
      v11[76] = objc_msgSend_decodeIntForKey_(v4, v148, (uint64_t)CFSTR("_supportsPeopleRequestMessagesV3"), v149);
      v11[77] = objc_msgSend_decodeIntForKey_(v4, v150, (uint64_t)CFSTR("_supportsRecurringPaymentBubbles"), v151);
      v11[78] = objc_msgSend_decodeIntForKey_(v4, v152, (uint64_t)CFSTR("_supportsGroupPhotoRefreshVersion"), v153);
      v11[79] = objc_msgSend_decodeIntForKey_(v4, v154, (uint64_t)CFSTR("_supportsEmojiTapbacks"), v155);
      v11[80] = objc_msgSend_decodeIntForKey_(v4, v156, (uint64_t)CFSTR("_supportsSendLaterMessages"), v157);
      v11[81] = objc_msgSend_decodeIntForKey_(v4, v158, (uint64_t)CFSTR("_supportsEmojiImages"), v159);
      v11[82] = objc_msgSend_decodeIntForKey_(v4, v160, (uint64_t)CFSTR("_supportsStickMojiBacks"), v161);
      v11[83] = objc_msgSend_decodeIntForKey_(v4, v162, (uint64_t)CFSTR("_supportsHighQualityPhotoFileSizes"), v163);
      v11[84] = objc_msgSend_decodeIntForKey_(v4, v164, (uint64_t)CFSTR("_supportsStewie"), v165);
      v11[85] = objc_msgSend_decodeIntForKey_(v4, v166, (uint64_t)CFSTR("_senderKeyMessageVersion"), v167);
      v11[86] = objc_msgSend_decodeIntForKey_(v4, v168, (uint64_t)CFSTR("_supportsSenderKey"), v169);
      v11[87] = objc_msgSend_decodeIntForKey_(v4, v170, (uint64_t)CFSTR("_supportsModernGFT"), v171);
      v11[88] = objc_msgSend_decodeIntForKey_(v4, v172, (uint64_t)CFSTR("_supportsCo"), v173);
      v11[89] = objc_msgSend_decodeIntForKey_(v4, v174, (uint64_t)CFSTR("_isGreenTea"), v175);
      v11[90] = objc_msgSend_decodeIntForKey_(v4, v176, (uint64_t)CFSTR("_supportsGondola"), v177);
      v11[91] = objc_msgSend_decodeIntForKey_(v4, v178, (uint64_t)CFSTR("_doesNotSupportGFTCalls"), v179);
      v11[92] = objc_msgSend_decodeIntForKey_(v4, v180, (uint64_t)CFSTR("_isWebClient"), v181);
      v11[93] = objc_msgSend_decodeIntForKey_(v4, v182, (uint64_t)CFSTR("_supportsAVLess"), v183);
      v11[94] = objc_msgSend_decodeIntForKey_(v4, v184, (uint64_t)CFSTR("_supportsSelfOneToOneInvites"), v185);
      v11[95] = objc_msgSend_decodeIntForKey_(v4, v186, (uint64_t)CFSTR("_supportsHighResVideoMessaging"), v187);
      v11[96] = objc_msgSend_decodeIntForKey_(v4, v188, (uint64_t)CFSTR("_supportsSSRC"), v189);
      v11[97] = objc_msgSend_decodeIntForKey_(v4, v190, (uint64_t)CFSTR("_supportsFriendingViaPush"), v191);
      v11[98] = objc_msgSend_decodeIntForKey_(v4, v192, (uint64_t)CFSTR("_supportsMessageTransportV2"), v193);
    }
  }
  v194 = v11;

  return v194;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t supportsKeySharing;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  double v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  const char *v99;
  double v100;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  const char *v109;
  double v110;
  const char *v111;
  double v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  const char *v123;
  double v124;
  const char *v125;
  double v126;
  const char *v127;
  double v128;
  const char *v129;
  double v130;
  const char *v131;
  double v132;
  const char *v133;
  double v134;
  const char *v135;
  double v136;
  const char *v137;
  double v138;
  const char *v139;
  double v140;
  const char *v141;
  double v142;
  const char *v143;
  double v144;
  const char *v145;
  double v146;
  const char *v147;
  double v148;
  const char *v149;
  double v150;
  const char *v151;
  double v152;
  const char *v153;
  double v154;
  const char *v155;
  double v156;
  const char *v157;
  double v158;
  const char *v159;
  double v160;
  const char *v161;
  double v162;
  const char *v163;
  double v164;
  const char *v165;
  double v166;
  const char *v167;
  double v168;
  const char *v169;
  double v170;
  const char *v171;
  double v172;
  const char *v173;
  double v174;
  const char *v175;
  double v176;
  const char *v177;
  double v178;
  const char *v179;
  double v180;
  const char *v181;
  double v182;
  const char *v183;
  double v184;
  const char *v185;
  double v186;
  id v187;

  supportsKeySharing = self->_supportsKeySharing;
  v187 = a3;
  objc_msgSend_encodeInt_forKey_(v187, v5, supportsKeySharing, v6, CFSTR("_supportsKeySharing"));
  objc_msgSend_encodeInt_forKey_(v187, v7, self->_supportsHarmony, v8, CFSTR("_supportsHarmony"));
  objc_msgSend_encodeInt_forKey_(v187, v9, self->_supportsFMDV2, v10, CFSTR("_supportsFMDV2"));
  objc_msgSend_encodeInt_forKey_(v187, v11, self->_supportsFMFenceV1, v12, CFSTR("_supportsFMFenceV1"));
  objc_msgSend_encodeInt_forKey_(v187, v13, self->_supportsLocationSharing, v14, CFSTR("_supportsLocationSharing"));
  objc_msgSend_encodeInt_forKey_(v187, v15, self->_supportsScreenTimeV2, v16, CFSTR("_supportsScreenTimeV2"));
  objc_msgSend_encodeInt_forKey_(v187, v17, self->_supportsIncomingFindMyV1, v18, CFSTR("_supportsIncomingFindMyV1"));
  objc_msgSend_encodeInt_forKey_(v187, v19, self->_supportsSecureLocationsV1, v20, CFSTR("_supportsSecureLocationsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v21, self->_supportsActivitySharing, v22, CFSTR("_supportsActivitySharing"));
  objc_msgSend_encodeInt_forKey_(v187, v23, self->_supportsManateeForAppleCash, v24, CFSTR("_supportsManateeForAppleCash"));
  objc_msgSend_encodeInt_forKey_(v187, v25, self->_supportsRegionForAppleCash, v26, CFSTR("_supportsRegionForAppleCash"));
  objc_msgSend_encodeInt_forKey_(v187, v27, self->_supportsHomeKitResident, v28, CFSTR("_supportsHomeKitResident"));
  objc_msgSend_encodeInt_forKey_(v187, v29, self->_supportsMapsRoutingPathLeg, v30, CFSTR("_supportsMapsRoutingPathLeg"));
  objc_msgSend_encodeInt_forKey_(v187, v31, self->_supportsBeaconSharingV2, v32, CFSTR("_supportsBeaconSharingV2"));
  objc_msgSend_encodeInt_forKey_(v187, v33, self->_supportsBeneficiaryInvites, v34, CFSTR("_supportsBeneficiaryInvites"));
  objc_msgSend_encodeInt_forKey_(v187, v35, self->_supportsScreenTimeErrors, v36, CFSTR("_supportsScreenTimeErrors"));
  objc_msgSend_encodeInt_forKey_(v187, v37, self->_supportsMapsWaypointRouteSharing, v38, CFSTR("_supportsMapsWaypointRouteSharing"));
  objc_msgSend_encodeInt_forKey_(v187, v39, self->_supportsMapsProtocolV5, v40, CFSTR("_supportsMapsProtocolV5"));
  objc_msgSend_encodeInt_forKey_(v187, v41, self->_supportsCrossPlatformSharing, v42, CFSTR("_supportsCrossPlatformSharing"));
  objc_msgSend_encodeInt_forKey_(v187, v43, self->_supportsZelkova, v44, CFSTR("_supportsZelkova"));
  objc_msgSend_encodeInt_forKey_(v187, v45, self->_supportsPeopleRangingV1, v46, CFSTR("_supportsPeopleRangingV1"));
  objc_msgSend_encodeInt_forKey_(v187, v47, self->_supportsBeaconSharingV3, v48, CFSTR("_supportsBeaconSharingV3"));
  objc_msgSend_encodeInt_forKey_(v187, v49, self->_supportsGFTRelay, v50, CFSTR("_supportsGFTRelay"));
  objc_msgSend_encodeInt_forKey_(v187, v51, self->_supportsManateeActivitySharing, v52, CFSTR("_supportsManateeActivitySharing"));
  objc_msgSend_encodeInt_forKey_(v187, v53, self->_supportsRestrictedGuest, v54, CFSTR("_supportsRestrictedGuest"));
  objc_msgSend_encodeInt_forKey_(v187, v55, self->_supportsRemoteATVSignIn, v56, CFSTR("_supportsRemoteATVSignIn"));
  objc_msgSend_encodeInt_forKey_(v187, v57, self->_ecVersion, v58, CFSTR("_ecVersion"));
  objc_msgSend_encodeInt_forKey_(v187, v59, self->_isC2KEquipment, v60, CFSTR("_isC2KEquipment"));
  objc_msgSend_encodeInt_forKey_(v187, v61, self->_showPeerErrors, v62, CFSTR("_showPeerErrors"));
  objc_msgSend_encodeInt_forKey_(v187, v63, self->_nicknamesVersion, v64, CFSTR("_nicknamesVersion"));
  objc_msgSend_encodeInt_forKey_(v187, v65, self->_optionallyReceiveTypingIndicator, v66, CFSTR("_optionallyReceiveTypingIndicator"));
  objc_msgSend_encodeInt_forKey_(v187, v67, self->_supportsInlineAttachments, v68, CFSTR("_supportsInlineAttachments"));
  objc_msgSend_encodeInt_forKey_(v187, v69, self->_supportsKeepReceipts, v70, CFSTR("_supportsKeepReceipts"));
  objc_msgSend_encodeInt_forKey_(v187, v71, self->_supportsStickersV1, v72, CFSTR("_supportsStickersV1"));
  objc_msgSend_encodeInt_forKey_(v187, v73, self->_supportsChatAppsV1, v74, CFSTR("_supportsChatAppsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v75, self->_supportsBubbleEditingV1, v76, CFSTR("_supportsBubbleEditingV1"));
  objc_msgSend_encodeInt_forKey_(v187, v77, self->_supportsAcknowledgementsV1, v78, CFSTR("_supportsAcknowledgementsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v79, self->_supportsFullScreenMomentsV1, v80, CFSTR("_supportsFullScreenMomentsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v81, self->_supportsFullScreenMomentsV2, v82, CFSTR("_supportsFullScreenMomentsV2"));
  objc_msgSend_encodeInt_forKey_(v187, v83, self->_supportsFullScreenMomentsV3, v84, CFSTR("_supportsFullScreenMomentsV3"));
  objc_msgSend_encodeInt_forKey_(v187, v85, self->_supportsInvisibleInkV1, v86, CFSTR("_supportsInvisibleInkV1"));
  objc_msgSend_encodeInt_forKey_(v187, v87, self->_supportsImpactEffectsV1, v88, CFSTR("_supportsImpactEffectsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v89, self->_supportsUpdateAttachmentsV1, v90, CFSTR("_supportsUpdateAttachmentsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v91, self->_supportsAutoloopVideoV1, v92, CFSTR("_supportsAutoloopVideoV1"));
  objc_msgSend_encodeInt_forKey_(v187, v93, self->_supportsMediaV2, v94, CFSTR("_supportsMediaV2"));
  objc_msgSend_encodeInt_forKey_(v187, v95, self->_supportsPhotosExtensionV1, v96, CFSTR("_supportsPhotosExtensionV1"));
  objc_msgSend_encodeInt_forKey_(v187, v97, self->_supportsPhotosExtensionV2, v98, CFSTR("_supportsPhotosExtensionV2"));
  objc_msgSend_encodeInt_forKey_(v187, v99, self->_supportsAudioMessagingV2, v100, CFSTR("_supportsAudioMessagingV2"));
  objc_msgSend_encodeInt_forKey_(v187, v101, self->_supportsAnimojiV2, v102, CFSTR("_supportsAnimojiV2"));
  objc_msgSend_encodeInt_forKey_(v187, v103, self->_supportsCertifiedDeliveryV1, v104, CFSTR("_supportsCertifiedDeliveryV1"));
  objc_msgSend_encodeInt_forKey_(v187, v105, self->_supportsOriginalTimestampOrderingV1, v106, CFSTR("_supportsOriginalTimestampOrderingV1"));
  objc_msgSend_encodeInt_forKey_(v187, v107, self->_supportsProtobufPayloadDataV2, v108, CFSTR("_supportsProtobufPayloadDataV2"));
  objc_msgSend_encodeInt_forKey_(v187, v109, self->_supportsHEIFEncoding, v110, CFSTR("_supportsHEIFEncoding"));
  objc_msgSend_encodeInt_forKey_(v187, v111, self->_supportsHDRVideo, v112, CFSTR("_supportsHDRVideo"));
  objc_msgSend_encodeInt_forKey_(v187, v113, self->_prefersSDRVideo, v114, CFSTR("_prefersSDRVideo"));
  objc_msgSend_encodeInt_forKey_(v187, v115, self->_supportsSyndicationActionsV1, v116, CFSTR("_supportsSyndicationActionsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v117, self->_supportsUWB, v118, CFSTR("_supportsUWB"));
  objc_msgSend_encodeInt_forKey_(v187, v119, self->_supportsDeliveredQuietlyAndNotifyRecipient, v120, CFSTR("_supportsDeliveredQuietlyAndNotifyRecipient"));
  objc_msgSend_encodeInt_forKey_(v187, v121, self->_supportsRetractAndEditMessages, v122, CFSTR("_supportsRetractAndEditMessages"));
  objc_msgSend_encodeInt_forKey_(v187, v123, self->_supportsPeopleRequestMessages, v124, CFSTR("_supportsPeopleRequestMessages"));
  objc_msgSend_encodeInt_forKey_(v187, v125, self->_supportsFamilyInviteMessageBubble, v126, CFSTR("_supportsFamilyInviteMessageBubble"));
  objc_msgSend_encodeInt_forKey_(v187, v127, self->_supportsPeopleRequestMessagesV2, v128, CFSTR("_supportsPeopleRequestMessagesV2"));
  objc_msgSend_encodeInt_forKey_(v187, v129, self->_supportsAskTo, v130, CFSTR("_supportsAskTo"));
  objc_msgSend_encodeInt_forKey_(v187, v131, self->_supportsEmojiStickers, v132, CFSTR("_supportsEmojiStickers"));
  objc_msgSend_encodeInt_forKey_(v187, v133, self->_supportsStickerEditing, v134, CFSTR("_supportsStickerEditing"));
  objc_msgSend_encodeInt_forKey_(v187, v135, self->_supportsHybridGroupsV1, v136, CFSTR("_supportsHybridGroupsV1"));
  objc_msgSend_encodeInt_forKey_(v187, v137, self->_supportsFindMyPluginMessages, v138, CFSTR("_supportsFindMyPluginMessages"));
  objc_msgSend_encodeInt_forKey_(v187, v139, self->_supportsSOSAlerting, v140, CFSTR("_supportsSOSAlerting"));
  objc_msgSend_encodeInt_forKey_(v187, v141, self->_supportsPeopleRequestMessagesV3, v142, CFSTR("_supportsPeopleRequestMessagesV3"));
  objc_msgSend_encodeInt_forKey_(v187, v143, self->_supportsRecurringPaymentBubbles, v144, CFSTR("_supportsRecurringPaymentBubbles"));
  objc_msgSend_encodeInt_forKey_(v187, v145, self->_supportsGroupPhotoRefreshVersion, v146, CFSTR("_supportsGroupPhotoRefreshVersion"));
  objc_msgSend_encodeInt_forKey_(v187, v147, self->_supportsEmojiTapbacks, v148, CFSTR("_supportsEmojiTapbacks"));
  objc_msgSend_encodeInt_forKey_(v187, v149, self->_supportsSendLaterMessages, v150, CFSTR("_supportsSendLaterMessages"));
  objc_msgSend_encodeInt_forKey_(v187, v151, self->_supportsEmojiImages, v152, CFSTR("_supportsEmojiImages"));
  objc_msgSend_encodeInt_forKey_(v187, v153, self->_supportsStickMojiBacks, v154, CFSTR("_supportsStickMojiBacks"));
  objc_msgSend_encodeInt_forKey_(v187, v155, self->_supportsHighQualityPhotoFileSizes, v156, CFSTR("_supportsHighQualityPhotoFileSizes"));
  objc_msgSend_encodeInt_forKey_(v187, v157, self->_supportsStewie, v158, CFSTR("_supportsStewie"));
  objc_msgSend_encodeInt_forKey_(v187, v159, self->_senderKeyMessageVersion, v160, CFSTR("_senderKeyMessageVersion"));
  objc_msgSend_encodeInt_forKey_(v187, v161, self->_supportsSenderKey, v162, CFSTR("_supportsSenderKey"));
  objc_msgSend_encodeInt_forKey_(v187, v163, self->_supportsModernGFT, v164, CFSTR("_supportsModernGFT"));
  objc_msgSend_encodeInt_forKey_(v187, v165, self->_supportsCo, v166, CFSTR("_supportsCo"));
  objc_msgSend_encodeInt_forKey_(v187, v167, self->_isGreenTea, v168, CFSTR("_isGreenTea"));
  objc_msgSend_encodeInt_forKey_(v187, v169, self->_supportsGondola, v170, CFSTR("_supportsGondola"));
  objc_msgSend_encodeInt_forKey_(v187, v171, self->_doesNotSupportGFTCalls, v172, CFSTR("_doesNotSupportGFTCalls"));
  objc_msgSend_encodeInt_forKey_(v187, v173, self->_isWebClient, v174, CFSTR("_isWebClient"));
  objc_msgSend_encodeInt_forKey_(v187, v175, self->_supportsAVLess, v176, CFSTR("_supportsAVLess"));
  objc_msgSend_encodeInt_forKey_(v187, v177, self->_supportsSelfOneToOneInvites, v178, CFSTR("_supportsSelfOneToOneInvites"));
  objc_msgSend_encodeInt_forKey_(v187, v179, self->_supportsHighResVideoMessaging, v180, CFSTR("_supportsHighResVideoMessaging"));
  objc_msgSend_encodeInt_forKey_(v187, v181, self->_supportsSSRC, v182, CFSTR("_supportsSSRC"));
  objc_msgSend_encodeInt_forKey_(v187, v183, self->_supportsFriendingViaPush, v184, CFSTR("_supportsFriendingViaPush"));
  objc_msgSend_encodeInt_forKey_(v187, v185, self->_supportsMessageTransportV2, v186, CFSTR("_supportsMessageTransportV2"));

}

@end
