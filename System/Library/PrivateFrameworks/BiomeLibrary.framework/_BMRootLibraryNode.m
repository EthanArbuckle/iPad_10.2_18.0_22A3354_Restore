@implementation _BMRootLibraryNode

+ (id)sublibraries
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
  id v14;
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
  _QWORD v88[89];

  v88[87] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "Accessibility");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v87;
  objc_msgSend(a1, "Activity");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v86;
  objc_msgSend(a1, "ActivityScheduler");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v85;
  objc_msgSend(a1, "AdPlatforms");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v84;
  objc_msgSend(a1, "AeroML");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v83;
  objc_msgSend(a1, "AirPlay");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v82;
  objc_msgSend(a1, "App");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v81;
  objc_msgSend(a1, "AppleID");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v80;
  objc_msgSend(a1, "AppleIntelligence");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v79;
  objc_msgSend(a1, "Audio");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v78;
  objc_msgSend(a1, "Autonaming");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v77;
  objc_msgSend(a1, "Calendar");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v76;
  objc_msgSend(a1, "CameraCapture");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v75;
  objc_msgSend(a1, "Carousel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v88[13] = v74;
  objc_msgSend(a1, "CarPlay");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v88[14] = v73;
  objc_msgSend(a1, "Clock");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v88[15] = v72;
  objc_msgSend(a1, "CommCenter");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v88[16] = v71;
  objc_msgSend(a1, "ContextSync");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v88[17] = v70;
  objc_msgSend(a1, "ContextualUnderstanding");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v88[18] = v69;
  objc_msgSend(a1, "Device");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v88[19] = v68;
  objc_msgSend(a1, "Dictation");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[20] = v67;
  objc_msgSend(a1, "Discoverability");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[21] = v66;
  objc_msgSend(a1, "Emoji");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[22] = v65;
  objc_msgSend(a1, "Family");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v88[23] = v64;
  objc_msgSend(a1, "Feedback");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v88[24] = v63;
  objc_msgSend(a1, "FindMy");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[25] = v62;
  objc_msgSend(a1, "FrontBoard");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v88[26] = v61;
  objc_msgSend(a1, "GameCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[27] = v60;
  objc_msgSend(a1, "GameController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88[28] = v59;
  objc_msgSend(a1, "GenerativeExperiences");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v88[29] = v58;
  objc_msgSend(a1, "Health");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v88[30] = v57;
  objc_msgSend(a1, "HomeKit");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v88[31] = v56;
  objc_msgSend(a1, "HumanUnderstanding");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v88[32] = v55;
  objc_msgSend(a1, "iCloud");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88[33] = v54;
  objc_msgSend(a1, "IntelligenceEngine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v88[34] = v53;
  objc_msgSend(a1, "IntelligenceFlow");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88[35] = v52;
  objc_msgSend(a1, "IntelligencePlatform");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88[36] = v51;
  objc_msgSend(a1, "Keyboard");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v88[37] = v50;
  objc_msgSend(a1, "LifeEvent");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v88[38] = v49;
  objc_msgSend(a1, "Lighthouse");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v88[39] = v48;
  objc_msgSend(a1, "Location");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[40] = v47;
  objc_msgSend(a1, "Mail");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v88[41] = v46;
  objc_msgSend(a1, "Maps");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v88[42] = v45;
  objc_msgSend(a1, "MapsShare");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v88[43] = v44;
  objc_msgSend(a1, "Media");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[44] = v43;
  objc_msgSend(a1, "MediaAnalysis");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v88[45] = v42;
  objc_msgSend(a1, "MediaRemote");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[46] = v41;
  objc_msgSend(a1, "Messages");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v88[47] = v40;
  objc_msgSend(a1, "Mindfulness");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[48] = v39;
  objc_msgSend(a1, "MLSE");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v88[49] = v38;
  objc_msgSend(a1, "Moments");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[50] = v37;
  objc_msgSend(a1, "Motion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v88[51] = v36;
  objc_msgSend(a1, "NanoSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[52] = v35;
  objc_msgSend(a1, "Notification");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v88[53] = v34;
  objc_msgSend(a1, "OSAnalytics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[54] = v33;
  objc_msgSend(a1, "PeopleSuggester");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[55] = v32;
  objc_msgSend(a1, "PersonalizedSensing");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88[56] = v31;
  objc_msgSend(a1, "Photos");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v88[57] = v30;
  objc_msgSend(a1, "Portrait");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[58] = v29;
  objc_msgSend(a1, "PrivateCloudCompute");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v88[59] = v28;
  objc_msgSend(a1, "ProactiveHarvesting");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88[60] = v27;
  objc_msgSend(a1, "Reminders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88[61] = v26;
  objc_msgSend(a1, "Safari");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88[62] = v25;
  objc_msgSend(a1, "Sage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v88[63] = v24;
  objc_msgSend(a1, "SchoolTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88[64] = v23;
  objc_msgSend(a1, "Screen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v88[65] = v22;
  objc_msgSend(a1, "ScreenTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88[66] = v21;
  objc_msgSend(a1, "SensitiveContentAnalysis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v88[67] = v20;
  objc_msgSend(a1, "SharePlay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88[68] = v19;
  objc_msgSend(a1, "ShareSheet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v88[69] = v18;
  objc_msgSend(a1, "Siri");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v88[70] = v17;
  objc_msgSend(a1, "Sleep");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v88[71] = v16;
  objc_msgSend(a1, "SoundAnalysis");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v88[72] = v15;
  objc_msgSend(a1, "SpringBoard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v88[73] = v3;
  objc_msgSend(a1, "SystemSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88[74] = v4;
  objc_msgSend(a1, "Text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88[75] = v5;
  objc_msgSend(a1, "TextUnderstanding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88[76] = v6;
  objc_msgSend(a1, "UniversalRecents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88[77] = v7;
  objc_msgSend(a1, "UserFocus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88[78] = v8;
  objc_msgSend(a1, "Wallet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v88[79] = v9;
  objc_msgSend(a1, "WalletPaymentsCommerce");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88[80] = v10;
  objc_msgSend(a1, "Watch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[81] = v11;
  objc_msgSend(a1, "Widgets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v88[82] = v12;
  v88[83] = objc_opt_class();
  v88[84] = objc_opt_class();
  v88[85] = objc_opt_class();
  v88[86] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 87);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)Accessibility
{
  return (id)objc_opt_class();
}

+ (id)Location
{
  return (id)objc_opt_class();
}

+ (id)App
{
  return (id)objc_opt_class();
}

+ (id)Reminders
{
  return (id)objc_opt_class();
}

+ (id)UniversalRecents
{
  return (id)objc_opt_class();
}

+ (id)Messages
{
  return (id)objc_opt_class();
}

+ (id)iCloud
{
  return (id)objc_opt_class();
}

+ (id)Widgets
{
  return (id)objc_opt_class();
}

+ (id)Watch
{
  return (id)objc_opt_class();
}

+ (id)Wallet
{
  return (id)objc_opt_class();
}

+ (id)WalletPaymentsCommerce
{
  return (id)objc_opt_class();
}

+ (id)UserFocus
{
  return (id)objc_opt_class();
}

+ (id)Text
{
  return (id)objc_opt_class();
}

+ (id)TextUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)SystemSettings
{
  return (id)objc_opt_class();
}

+ (id)SpringBoard
{
  return (id)objc_opt_class();
}

+ (id)Siri
{
  return (id)objc_opt_class();
}

+ (id)ShareSheet
{
  return (id)objc_opt_class();
}

+ (id)SharePlay
{
  return (id)objc_opt_class();
}

+ (id)SensitiveContentAnalysis
{
  return (id)objc_opt_class();
}

+ (id)Screen
{
  return (id)objc_opt_class();
}

+ (id)ScreenTime
{
  return (id)objc_opt_class();
}

+ (id)SchoolTime
{
  return (id)objc_opt_class();
}

+ (id)Safari
{
  return (id)objc_opt_class();
}

+ (id)ProactiveHarvesting
{
  return (id)objc_opt_class();
}

+ (id)Portrait
{
  return (id)objc_opt_class();
}

+ (id)Photos
{
  return (id)objc_opt_class();
}

+ (id)PeopleSuggester
{
  return (id)objc_opt_class();
}

+ (id)OSAnalytics
{
  return (id)objc_opt_class();
}

+ (id)Notification
{
  return (id)objc_opt_class();
}

+ (id)Motion
{
  return (id)objc_opt_class();
}

+ (id)Moments
{
  return (id)objc_opt_class();
}

+ (id)Mindfulness
{
  return (id)objc_opt_class();
}

+ (id)Media
{
  return (id)objc_opt_class();
}

+ (id)MediaRemote
{
  return (id)objc_opt_class();
}

+ (id)MediaAnalysis
{
  return (id)objc_opt_class();
}

+ (id)Maps
{
  return (id)objc_opt_class();
}

+ (id)MLSE
{
  return (id)objc_opt_class();
}

+ (id)Lighthouse
{
  return (id)objc_opt_class();
}

+ (id)LifeEvent
{
  return (id)objc_opt_class();
}

+ (id)Keyboard
{
  return (id)objc_opt_class();
}

+ (id)IntelligencePlatform
{
  return (id)objc_opt_class();
}

+ (id)HumanUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)HomeKit
{
  return (id)objc_opt_class();
}

+ (id)Health
{
  return (id)objc_opt_class();
}

+ (id)GameController
{
  return (id)objc_opt_class();
}

+ (id)GameCenter
{
  return (id)objc_opt_class();
}

+ (id)FrontBoard
{
  return (id)objc_opt_class();
}

+ (id)FindMy
{
  return (id)objc_opt_class();
}

+ (id)Family
{
  return (id)objc_opt_class();
}

+ (id)Emoji
{
  return (id)objc_opt_class();
}

+ (id)Discoverability
{
  return (id)objc_opt_class();
}

+ (id)Dictation
{
  return (id)objc_opt_class();
}

+ (id)Device
{
  return (id)objc_opt_class();
}

+ (id)ContextualUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)ContextSync
{
  return (id)objc_opt_class();
}

+ (id)Clock
{
  return (id)objc_opt_class();
}

+ (id)CarPlay
{
  return (id)objc_opt_class();
}

+ (id)Calendar
{
  return (id)objc_opt_class();
}

+ (id)Audio
{
  return (id)objc_opt_class();
}

+ (id)AppleID
{
  return (id)objc_opt_class();
}

+ (id)AirPlay
{
  return (id)objc_opt_class();
}

+ (id)AeroML
{
  return (id)objc_opt_class();
}

+ (id)AdPlatforms
{
  return (id)objc_opt_class();
}

+ (id)Activity
{
  return (id)objc_opt_class();
}

+ (id)ActivityScheduler
{
  return (id)objc_opt_class();
}

+ (id)AppleIntelligence
{
  return (id)objc_opt_class();
}

+ (id)Autonaming
{
  return (id)objc_opt_class();
}

+ (id)CameraCapture
{
  return (id)objc_opt_class();
}

+ (id)Carousel
{
  return (id)objc_opt_class();
}

+ (id)CommCenter
{
  return (id)objc_opt_class();
}

+ (id)Feedback
{
  return (id)objc_opt_class();
}

+ (id)GenerativeExperiences
{
  return (id)objc_opt_class();
}

+ (id)IntelligenceEngine
{
  return (id)objc_opt_class();
}

+ (id)IntelligenceFlow
{
  return (id)objc_opt_class();
}

+ (id)Mail
{
  return (id)objc_opt_class();
}

+ (id)MapsShare
{
  return (id)objc_opt_class();
}

+ (id)NanoSettings
{
  return (id)objc_opt_class();
}

+ (id)PersonalizedSensing
{
  return (id)objc_opt_class();
}

+ (id)PrivateCloudCompute
{
  return (id)objc_opt_class();
}

+ (id)Sage
{
  return (id)objc_opt_class();
}

+ (id)Sleep
{
  return (id)objc_opt_class();
}

+ (id)SoundAnalysis
{
  return (id)objc_opt_class();
}

+ (id)identifier
{
  return CFSTR("BMLibrary");
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

@end
