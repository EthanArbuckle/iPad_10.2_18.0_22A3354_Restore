@implementation MCGizmoUtilities

+ (id)MCFirstPartyCompanionToWatchAppBundleIDs
{
  if (MCFirstPartyCompanionToWatchAppBundleIDs_onceToken != -1)
    dispatch_once(&MCFirstPartyCompanionToWatchAppBundleIDs_onceToken, &__block_literal_global_11);
  return (id)MCFirstPartyCompanionToWatchAppBundleIDs_watchBundleIDs;
}

void __60__MCGizmoUtilities_MCFirstPartyCompanionToWatchAppBundleIDs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  _QWORD v38[2];
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[2];
  _QWORD v44[3];
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  _QWORD v48[23];
  _QWORD v49[25];

  v49[23] = *MEMORY[0x1E0C80C00];
  v48[0] = CFSTR("com.apple.AppStore");
  v47 = CFSTR("com.apple.AppStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v24;
  v48[1] = CFSTR("com.apple.mobilecal");
  v46 = CFSTR("com.apple.NanoCalendar");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v23;
  v48[2] = CFSTR("com.apple.camera");
  v45 = CFSTR("com.apple.NanoCamera");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v22;
  v48[3] = CFSTR("com.apple.mobiletimer");
  v44[0] = CFSTR("com.apple.NanoStopwatch");
  v44[1] = CFSTR("com.apple.private.NanoTimer");
  v44[2] = CFSTR("com.apple.NanoWorldClock");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v21;
  v48[4] = CFSTR("com.apple.Fitness");
  v43[0] = CFSTR("com.apple.ActivityMonitorApp");
  v43[1] = CFSTR("com.apple.SessionTrackerApp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v20;
  v48[5] = CFSTR("com.apple.Home");
  v42 = CFSTR("com.apple.NanoHome");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v19;
  v48[6] = CFSTR("com.apple.iBooks");
  v41 = CFSTR("com.apple.NanoBooks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v18;
  v48[7] = CFSTR("com.apple.mobilemail");
  v40 = CFSTR("com.apple.NanoMail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v17;
  v48[8] = CFSTR("com.apple.Maps");
  v39 = CFSTR("com.apple.NanoMaps");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v16;
  v48[9] = CFSTR("com.apple.Music");
  v38[0] = CFSTR("com.apple.NanoMusic");
  v38[1] = CFSTR("com.apple.NanoRadio");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v15;
  v48[10] = CFSTR("com.apple.news");
  v37 = CFSTR("com.apple.nanonews");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v14;
  v48[11] = CFSTR("com.apple.Passbook");
  v36 = CFSTR("com.apple.NanoPassbook");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v13;
  v48[12] = CFSTR("com.apple.MobileAddressBook");
  v35 = CFSTR("com.apple.NanoPeople");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v12;
  v48[13] = CFSTR("com.apple.mobilephone");
  v34 = CFSTR("com.apple.NanoPhone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v0;
  v48[14] = CFSTR("com.apple.mobileslideshow");
  v33 = CFSTR("com.apple.NanoPhotos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v1;
  v48[15] = CFSTR("com.apple.podcasts");
  v32 = CFSTR("com.apple.podcasts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v2;
  v48[16] = CFSTR("com.apple.Preferences");
  v31 = CFSTR("com.apple.NanoSettings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v3;
  v48[17] = CFSTR("com.apple.reminders");
  v30 = CFSTR("com.apple.NanoReminders");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v4;
  v48[18] = CFSTR("com.apple.Remote");
  v29 = CFSTR("com.apple.NanoRemote");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v5;
  v48[19] = CFSTR("com.apple.stocks");
  v28 = CFSTR("com.apple.stocks.watchapp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[19] = v6;
  v48[20] = CFSTR("com.apple.VoiceMemos");
  v27 = CFSTR("com.apple.VoiceMemos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[20] = v7;
  v48[21] = CFSTR("com.apple.weather");
  v26 = CFSTR("com.apple.weather.watchapp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[21] = v8;
  v48[22] = CFSTR("com.apple.Health");
  v25[0] = CFSTR("com.apple.NanoMenstrualCycles");
  v25[1] = CFSTR("com.apple.NanoHeartRhythm");
  v25[2] = CFSTR("com.apple.NanoOxygenSaturation.watchkitapp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[22] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 23);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MCFirstPartyCompanionToWatchAppBundleIDs_watchBundleIDs;
  MCFirstPartyCompanionToWatchAppBundleIDs_watchBundleIDs = v10;

}

+ (void)watchAppBundleIDsForBundleIDs:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *, _QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = (void (**)(id, void *, _QWORD))a4;
  v6 = (void *)objc_opt_new();
  +[MCGizmoUtilities MCFirstPartyCompanionToWatchAppBundleIDs](MCGizmoUtilities, "MCFirstPartyCompanionToWatchAppBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v14);
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForCompanionIdentifier:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v6, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v17[2](v17, v6, 0);
}

@end
