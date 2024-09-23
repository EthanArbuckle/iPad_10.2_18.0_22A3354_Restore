@implementation ASDLogHandleForCategory

void __ASDLogHandleForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.appstored", "Activity");
  v1 = (void *)ASDLogHandleForCategory_logHandles[0];
  ASDLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.appstored", "AppCapabilities");
  v3 = (void *)qword_1ECFFABE8;
  qword_1ECFFABE8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.appstored", "AppInstall");
  v5 = (void *)qword_1ECFFABF0;
  qword_1ECFFABF0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.appstored", "AppUsage");
  v7 = (void *)qword_1ECFFABF8;
  qword_1ECFFABF8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.appstored", "Arcade");
  v9 = (void *)qword_1ECFFAC00;
  qword_1ECFFAC00 = (uint64_t)v8;

  v10 = os_log_create("com.apple.appstored", "Cleanup");
  v11 = (void *)qword_1ECFFAC08;
  qword_1ECFFAC08 = (uint64_t)v10;

  v12 = os_log_create("com.apple.appstored", "Clips");
  v13 = (void *)qword_1ECFFAC10;
  qword_1ECFFAC10 = (uint64_t)v12;

  v14 = os_log_create("com.apple.appstored", "DAAP");
  v15 = (void *)qword_1ECFFAC18;
  qword_1ECFFAC18 = (uint64_t)v14;

  v16 = os_log_create("com.apple.appstored", "Daemon");
  v17 = (void *)qword_1ECFFAC20;
  qword_1ECFFAC20 = (uint64_t)v16;

  v18 = os_log_create("com.apple.appstored", "Download");
  v19 = (void *)qword_1ECFFAC28;
  qword_1ECFFAC28 = (uint64_t)v18;

  v20 = os_log_create("com.apple.appstored", "EventsExtension");
  v21 = (void *)qword_1ECFFAC30;
  qword_1ECFFAC30 = (uint64_t)v20;

  v22 = os_log_create("com.apple.appstored", "Extension");
  v23 = (void *)qword_1ECFFAC38;
  qword_1ECFFAC38 = (uint64_t)v22;

  v24 = os_log_create("com.apple.appstored", "Framework");
  v25 = (void *)qword_1ECFFAC40;
  qword_1ECFFAC40 = (uint64_t)v24;

  v26 = os_log_create("com.apple.appstored", "General");
  v27 = (void *)qword_1ECFFAC48;
  qword_1ECFFAC48 = (uint64_t)v26;

  v28 = os_log_create("com.apple.appstored", "Library");
  v29 = (void *)qword_1ECFFAC50;
  qword_1ECFFAC50 = (uint64_t)v28;

  v30 = os_log_create("com.apple.appstored", "Metrics");
  v31 = (void *)qword_1ECFFAC58;
  qword_1ECFFAC58 = (uint64_t)v30;

  v32 = os_log_create("com.apple.appstored", "Migrate");
  v33 = (void *)qword_1ECFFAC60;
  qword_1ECFFAC60 = (uint64_t)v32;

  v34 = os_log_create("com.apple.appstored", "StoreKitInXcode");
  v35 = (void *)qword_1ECFFAC68;
  qword_1ECFFAC68 = (uint64_t)v34;

  v36 = os_log_create("com.apple.appstored", "ODR");
  v37 = (void *)qword_1ECFFAC70;
  qword_1ECFFAC70 = (uint64_t)v36;

  v38 = os_log_create("com.apple.appstored", "Offloading");
  v39 = (void *)qword_1ECFFAC78;
  qword_1ECFFAC78 = (uint64_t)v38;

  v40 = os_log_create("com.apple.appstored", "Daemon-Oversize");
  v41 = (void *)qword_1ECFFAC80;
  qword_1ECFFAC80 = (uint64_t)v40;

  v42 = os_log_create("com.apple.appstored", "Performance");
  v43 = (void *)qword_1ECFFAC88;
  qword_1ECFFAC88 = (uint64_t)v42;

  v44 = os_log_create("com.apple.appstored", "PrivilegedTask");
  v45 = (void *)qword_1ECFFAC90;
  qword_1ECFFAC90 = (uint64_t)v44;

  v46 = os_log_create("com.apple.appstored", "Progress");
  v47 = (void *)qword_1ECFFAC98;
  qword_1ECFFAC98 = (uint64_t)v46;

  v48 = os_log_create("com.apple.appstored", "Purchase");
  v49 = (void *)qword_1ECFFACA0;
  qword_1ECFFACA0 = (uint64_t)v48;

  v50 = os_log_create("com.apple.appstored", "Push");
  v51 = (void *)qword_1ECFFACA8;
  qword_1ECFFACA8 = (uint64_t)v50;

  v52 = os_log_create("com.apple.appstored", "QA");
  v53 = (void *)qword_1ECFFACB0;
  qword_1ECFFACB0 = (uint64_t)v52;

  v54 = os_log_create("com.apple.appstored", "Repair");
  v55 = (void *)qword_1ECFFACB8;
  qword_1ECFFACB8 = (uint64_t)v54;

  v56 = os_log_create("com.apple.appstored", "Restore");
  v57 = (void *)qword_1ECFFACC0;
  qword_1ECFFACC0 = (uint64_t)v56;

  v58 = os_log_create("com.apple.appstored", "Scheduler");
  v59 = (void *)qword_1ECFFACC8;
  qword_1ECFFACC8 = (uint64_t)v58;

  v60 = os_log_create("com.apple.appstored", "Signpost");
  v61 = (void *)qword_1ECFFACD0;
  qword_1ECFFACD0 = (uint64_t)v60;

  v62 = os_log_create("com.apple.appstored", "SKAdNetwork");
  v63 = (void *)qword_1ECFFACD8;
  qword_1ECFFACD8 = (uint64_t)v62;

  v64 = os_log_create("com.apple.appstored", "Skanner");
  v65 = (void *)qword_1ECFFACE0;
  qword_1ECFFACE0 = (uint64_t)v64;

  v66 = os_log_create("com.apple.appstored", "SoftwareMap");
  v67 = (void *)qword_1ECFFACE8;
  qword_1ECFFACE8 = (uint64_t)v66;

  v68 = os_log_create("com.apple.appstored", "SQL");
  v69 = (void *)qword_1ECFFACF0;
  qword_1ECFFACF0 = (uint64_t)v68;

  v70 = os_log_create("com.apple.appstored", "StoreKit");
  v71 = (void *)qword_1ECFFACF8;
  qword_1ECFFACF8 = (uint64_t)v70;

  v72 = os_log_create("com.apple.appstored", "Subscription");
  v73 = (void *)qword_1ECFFAD00;
  qword_1ECFFAD00 = (uint64_t)v72;

  v74 = os_log_create("com.apple.appstored", "TestFlightFeedback");
  v75 = (void *)qword_1ECFFAD08;
  qword_1ECFFAD08 = (uint64_t)v74;

  v76 = os_log_create("com.apple.appstored", "TestFlightExtension");
  v77 = (void *)qword_1ECFFAD10;
  qword_1ECFFAD10 = (uint64_t)v76;

  v78 = os_log_create("com.apple.appstored", "Updates");
  v79 = (void *)qword_1ECFFAD18;
  qword_1ECFFAD18 = (uint64_t)v78;

  v80 = os_log_create("com.apple.appstored", "VPP");
  v81 = (void *)qword_1ECFFAD20;
  qword_1ECFFAD20 = (uint64_t)v80;

  v82 = os_log_create("com.apple.appstored", "XDC");
  v83 = (void *)qword_1ECFFAD28;
  qword_1ECFFAD28 = (uint64_t)v82;

}

@end
