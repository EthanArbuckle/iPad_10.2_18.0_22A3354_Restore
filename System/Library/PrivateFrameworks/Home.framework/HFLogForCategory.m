@implementation HFLogForCategory

void __HFLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  os_log_t v40;
  void *v41;
  os_log_t v42;
  void *v43;
  os_log_t v44;
  void *v45;
  os_log_t v46;
  void *v47;
  os_log_t v48;
  void *v49;
  os_log_t v50;
  void *v51;
  os_log_t v52;
  void *v53;
  os_log_t v54;
  void *v55;
  os_log_t v56;
  void *v57;
  os_log_t v58;
  void *v59;
  os_log_t v60;
  void *v61;
  os_log_t v62;
  void *v63;
  os_log_t v64;
  void *v65;
  os_log_t v66;
  void *v67;
  os_log_t v68;
  void *v69;
  os_log_t v70;
  void *v71;
  os_log_t v72;
  void *v73;
  os_log_t v74;
  void *v75;
  os_log_t v76;
  void *v77;
  os_log_t v78;
  void *v79;
  os_log_t v80;
  void *v81;
  os_log_t v82;
  void *v83;
  os_log_t v84;
  void *v85;
  os_log_t v86;
  void *v87;
  os_log_t v88;
  void *v89;
  os_log_t v90;
  void *v91;
  os_log_t v92;
  void *v93;
  os_log_t v94;
  void *v95;
  os_log_t v96;
  void *v97;
  os_log_t v98;
  void *v99;
  os_log_t v100;
  void *v101;
  os_log_t v102;
  void *v103;
  os_log_t v104;
  void *v105;
  os_log_t v106;
  void *v107;
  os_log_t v108;
  void *v109;
  os_log_t v110;
  void *v111;
  os_log_t v112;
  void *v113;
  os_log_t v114;
  void *v115;
  os_log_t v116;
  void *v117;
  os_log_t v118;
  void *v119;
  os_log_t v120;
  void *v121;
  os_log_t v122;
  void *v123;
  os_log_t v124;
  void *v125;
  os_log_t v126;
  void *v127;
  os_log_t v128;
  void *v129;
  os_log_t v130;
  void *v131;
  os_log_t v132;
  void *v133;
  os_log_t v134;
  void *v135;
  os_log_t v136;
  void *v137;
  os_log_t v138;
  void *v139;
  os_log_t v140;
  void *v141;
  os_log_t v142;
  void *v143;

  v0 = os_log_create("com.apple.Home.framework", "HF_Default");
  v1 = (void *)qword_1ED3795F0;
  qword_1ED3795F0 = (uint64_t)v0;

  v2 = os_log_create("com.apple.Home.framework", "HF_AccessoryDiagnostics");
  v3 = (void *)qword_1ED3795F8;
  qword_1ED3795F8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.Home.framework", "HF_Camera_Activity_Zones");
  v5 = (void *)qword_1ED379600;
  qword_1ED379600 = (uint64_t)v4;

  v6 = os_log_create("com.apple.Home.framework", "HF_ActivityEvents");
  v7 = (void *)qword_1ED379608;
  qword_1ED379608 = (uint64_t)v6;

  v8 = os_log_create("com.apple.Home.framework", "HF_Alarms_and_Timers");
  v9 = (void *)qword_1ED379610;
  qword_1ED379610 = (uint64_t)v8;

  v10 = os_log_create("com.apple.Home.framework", "HF_AMS_Accounts");
  v11 = (void *)qword_1ED379618;
  qword_1ED379618 = (uint64_t)v10;

  v12 = os_log_create("com.apple.Home.framework", "HF_Analytics");
  v13 = (void *)qword_1ED379620;
  qword_1ED379620 = (uint64_t)v12;

  v14 = os_log_create("com.apple.Home.framework", "HF_Announce");
  v15 = (void *)qword_1ED379628;
  qword_1ED379628 = (uint64_t)v14;

  v16 = os_log_create("com.apple.Home.framework", "HF_AppEvent");
  v17 = (void *)qword_1ED379630;
  qword_1ED379630 = (uint64_t)v16;

  v18 = os_log_create("com.apple.Home.framework", "HF_AppOnboarding");
  v19 = (void *)qword_1ED379638;
  qword_1ED379638 = (uint64_t)v18;

  v20 = os_log_create("com.apple.Home.framework", "HF_AudioPlayer");
  v21 = (void *)qword_1ED379640;
  qword_1ED379640 = (uint64_t)v20;

  v22 = os_log_create("com.apple.Home.framework", "HF_AudioRecorder");
  v23 = (void *)qword_1ED379648;
  qword_1ED379648 = (uint64_t)v22;

  v24 = os_log_create("com.apple.Home.framework", "HF_Bolt");
  v25 = (void *)qword_1ED379650;
  qword_1ED379650 = (uint64_t)v24;

  v26 = os_log_create("com.apple.Home.framework", "HF_Cache");
  v27 = (void *)qword_1ED379658;
  qword_1ED379658 = (uint64_t)v26;

  v28 = os_log_create("com.apple.Home.framework", "HF_Camera");
  v29 = (void *)qword_1ED379660;
  qword_1ED379660 = (uint64_t)v28;

  v30 = os_log_create("com.apple.Home.framework", "HF_Camera_Calendar");
  v31 = (void *)qword_1ED379668;
  qword_1ED379668 = (uint64_t)v30;

  v32 = os_log_create("com.apple.Home.framework", "HF_Camera_Clips");
  v33 = (void *)qword_1ED379670;
  qword_1ED379670 = (uint64_t)v32;

  v34 = os_log_create("com.apple.Home.framework", "HF_Camera_Clip_Scrubber");
  v35 = (void *)qword_1ED379678;
  qword_1ED379678 = (uint64_t)v34;

  v36 = os_log_create("com.apple.Home.framework", "HF_Camera_Export");
  v37 = (void *)qword_1ED379680;
  qword_1ED379680 = (uint64_t)v36;

  v38 = os_log_create("com.apple.Home.framework", "HF_CameraFaceRecognition");
  v39 = (void *)qword_1ED379688;
  qword_1ED379688 = (uint64_t)v38;

  v40 = os_log_create("com.apple.Home.framework", "HF_Camera_Feedback");
  v41 = (void *)qword_1ED379690;
  qword_1ED379690 = (uint64_t)v40;

  v42 = os_log_create("com.apple.Home.framework", "HF_Camera_Images");
  v43 = (void *)qword_1ED379698;
  qword_1ED379698 = (uint64_t)v42;

  v44 = os_log_create("com.apple.Home.framework", "HF_Camera_Notification");
  v45 = (void *)qword_1ED3796A0;
  qword_1ED3796A0 = (uint64_t)v44;

  v46 = os_log_create("com.apple.Home.framework", "HF_Camera_Playback_Engine");
  v47 = (void *)qword_1ED3796A8;
  qword_1ED3796A8 = (uint64_t)v46;

  v48 = os_log_create("com.apple.Home.framework", "HF_Camera_Playback_Engine_UI");
  v49 = (void *)qword_1ED3796B0;
  qword_1ED3796B0 = (uint64_t)v48;

  v50 = os_log_create("com.apple.Home.framework", "HF_Camera_Poster_Frames");
  v51 = (void *)qword_1ED3796B8;
  qword_1ED3796B8 = (uint64_t)v50;

  v52 = os_log_create("com.apple.Home.framework", "HF_Camera_Settings");
  v53 = (void *)qword_1ED3796C0;
  qword_1ED3796C0 = (uint64_t)v52;

  v54 = os_log_create("com.apple.Home.framework", "HF_Camera_Snapshot");
  v55 = (void *)qword_1ED3796C8;
  qword_1ED3796C8 = (uint64_t)v54;

  v56 = os_log_create("com.apple.Home.framework", "HF_Camera_Stream");
  v57 = (void *)qword_1ED3796D0;
  qword_1ED3796D0 = (uint64_t)v56;

  v58 = os_log_create("com.apple.Home.framework", "HF_Camera_Timelapse");
  v59 = (void *)qword_1ED3796D8;
  qword_1ED3796D8 = (uint64_t)v58;

  v60 = os_log_create("com.apple.Home.framework", "HF_ControlCenter");
  v61 = (void *)qword_1ED3796E0;
  qword_1ED3796E0 = (uint64_t)v60;

  v62 = os_log_create("com.apple.Home.framework", "HF_DashboardReorder");
  v63 = (void *)qword_1ED3796E8;
  qword_1ED3796E8 = (uint64_t)v62;

  v64 = os_log_create("com.apple.Home.framework", "HF_Demo_Mode");
  v65 = (void *)qword_1ED3796F0;
  qword_1ED3796F0 = (uint64_t)v64;

  v66 = os_log_create("com.apple.Home.framework", "HF_FeatureOnboarding");
  v67 = (void *)qword_1ED3796F8;
  qword_1ED3796F8 = (uint64_t)v66;

  v68 = os_log_create("com.apple.Home.framework", "HF_HomeControlService");
  v69 = (void *)qword_1ED379700;
  qword_1ED379700 = (uint64_t)v68;

  v70 = os_log_create("com.apple.Home.framework", "HF_HomeEnergy");
  v71 = (void *)qword_1ED379708;
  qword_1ED379708 = (uint64_t)v70;

  v72 = os_log_create("com.apple.Home.framework", "HF_HomeKitDelegate");
  v73 = (void *)qword_1ED379710;
  qword_1ED379710 = (uint64_t)v72;

  v74 = os_log_create("com.apple.Home.framework", "HF_HomeKitSettings");
  v75 = (void *)qword_1ED379718;
  qword_1ED379718 = (uint64_t)v74;

  v76 = os_log_create("com.apple.Home.framework", "HF_HomeTheater");
  v77 = (void *)qword_1ED379720;
  qword_1ED379720 = (uint64_t)v76;

  v78 = os_log_create("com.apple.Home.framework", "HF_Invitations");
  v79 = (void *)qword_1ED379728;
  qword_1ED379728 = (uint64_t)v78;

  v80 = os_log_create("com.apple.Home.framework", "HF_ItemBuilder");
  v81 = (void *)qword_1ED379730;
  qword_1ED379730 = (uint64_t)v80;

  v82 = os_log_create("com.apple.Home.framework", "HF_ItemUpdate");
  v83 = (void *)qword_1ED379738;
  qword_1ED379738 = (uint64_t)v82;

  v84 = os_log_create("com.apple.Home.framework", "HF_Location");
  v85 = (void *)qword_1ED379740;
  qword_1ED379740 = (uint64_t)v84;

  v86 = os_log_create("com.apple.Home.framework", "HF_ManagedConfigurationProfiles");
  v87 = (void *)qword_1ED379748;
  qword_1ED379748 = (uint64_t)v86;

  v88 = os_log_create("com.apple.Home.framework", "HF_Media");
  v89 = (void *)qword_1ED379750;
  qword_1ED379750 = (uint64_t)v88;

  v90 = os_log_create("com.apple.Home.framework", "HF_MultiServices");
  v91 = (void *)qword_1ED379758;
  qword_1ED379758 = (uint64_t)v90;

  v92 = os_log_create("com.apple.Home.framework", "HF_NaturalLanguage");
  v93 = (void *)qword_1ED379760;
  qword_1ED379760 = (uint64_t)v92;

  v94 = os_log_create("com.apple.Home.framework", "HF_Nearby_Accessories");
  v95 = (void *)qword_1ED379768;
  qword_1ED379768 = (uint64_t)v94;

  v96 = os_log_create("com.apple.Home.framework", "HF_Notification");
  v97 = (void *)qword_1ED379770;
  qword_1ED379770 = (uint64_t)v96;

  v98 = os_log_create("com.apple.Home.framework", "HF_Performance");
  v99 = (void *)qword_1ED379778;
  qword_1ED379778 = (uint64_t)v98;

  v100 = os_log_create("com.apple.Home.framework", "HF_PinCode");
  v101 = (void *)qword_1ED379780;
  qword_1ED379780 = (uint64_t)v100;

  v102 = os_log_create("com.apple.Home.framework", "HF_Predictions");
  v103 = (void *)qword_1ED379788;
  qword_1ED379788 = (uint64_t)v102;

  v104 = os_log_create("com.apple.Home.framework", "HF_PrimaryUser");
  v105 = (void *)qword_1ED379790;
  qword_1ED379790 = (uint64_t)v104;

  v106 = os_log_create("com.apple.Home.framework", "HF_PrototypeSettings");
  v107 = (void *)qword_1ED379798;
  qword_1ED379798 = (uint64_t)v106;

  v108 = os_log_create("com.apple.Home.framework", "HF_QuickControlView");
  v109 = (void *)qword_1ED3797A0;
  qword_1ED3797A0 = (uint64_t)v108;

  v110 = os_log_create("com.apple.Home.framework", "HF_Rapport");
  v111 = (void *)qword_1ED3797A8;
  qword_1ED3797A8 = (uint64_t)v110;

  v112 = os_log_create("com.apple.Home.framework", "HF_ReadWrite");
  v113 = (void *)qword_1ED3797B0;
  qword_1ED3797B0 = (uint64_t)v112;

  v114 = os_log_create("com.apple.Home.framework", "HF_SettingUpdate");
  v115 = (void *)qword_1ED3797B8;
  qword_1ED3797B8 = (uint64_t)v114;

  v116 = os_log_create("com.apple.Home.framework", "HF_Setup");
  v117 = (void *)qword_1ED3797C0;
  qword_1ED3797C0 = (uint64_t)v116;

  v118 = os_log_create("com.apple.Home.framework", "HF_Sidebar");
  v119 = (void *)qword_1ED3797C8;
  qword_1ED3797C8 = (uint64_t)v118;

  v120 = os_log_create("com.apple.Home.framework", "HF_SiriEndpoints");
  v121 = (void *)qword_1ED3797D0;
  qword_1ED3797D0 = (uint64_t)v120;

  v122 = os_log_create("com.apple.Home.framework", "HF_SiriSupport");
  v123 = (void *)qword_1ED3797D8;
  qword_1ED3797D8 = (uint64_t)v122;

  v124 = os_log_create("com.apple.Home.framework", "HF_SmartConfiguration");
  v125 = (void *)qword_1ED3797E0;
  qword_1ED3797E0 = (uint64_t)v124;

  v126 = os_log_create("com.apple.Home.framework", "HF_SoftwareUpdate");
  v127 = (void *)qword_1ED3797E8;
  qword_1ED3797E8 = (uint64_t)v126;

  v128 = os_log_create("com.apple.Home.framework", "HF_StateDump");
  v129 = (void *)qword_1ED3797F0;
  qword_1ED3797F0 = (uint64_t)v128;

  v130 = os_log_create("com.apple.Home.framework", "HF_Store");
  v131 = (void *)qword_1ED3797F8;
  qword_1ED3797F8 = (uint64_t)v130;

  v132 = os_log_create("com.apple.Home.framework", "HF_Triggers");
  v133 = (void *)qword_1ED379808;
  qword_1ED379808 = (uint64_t)v132;

  v134 = os_log_create("com.apple.Home.framework", "HF_UserInteraction");
  v135 = (void *)qword_1ED379810;
  qword_1ED379810 = (uint64_t)v134;

  v136 = os_log_create("com.apple.Home.framework", "HF_Users");
  v137 = (void *)qword_1ED379818;
  qword_1ED379818 = (uint64_t)v136;

  v138 = os_log_create("com.apple.Home.framework", "HF_ViewVisibility");
  v139 = (void *)qword_1ED379820;
  qword_1ED379820 = (uint64_t)v138;

  v140 = os_log_create("com.apple.Home.framework", "HF_WalletKey");
  v141 = (void *)qword_1ED379800;
  qword_1ED379800 = (uint64_t)v140;

  v142 = os_log_create("com.apple.Home.framework", "HF_Wallpaper");
  v143 = (void *)qword_1ED379828;
  qword_1ED379828 = (uint64_t)v142;

}

@end
