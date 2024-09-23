@implementation ATXNotificationDigestFeedbackInspector

- (void)showHistogramForBundleId:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  v9 = (id)objc_opt_new();
  -[ATXNotificationDigestFeedbackInspector _formatFeedbackDataForBundleId:feedback:](self, "_formatFeedbackDataForBundleId:feedback:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v8, 0);
}

- (void)addToHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("alltimeAppearance")))
  {
    objc_msgSend(v14, "alltimeMarqueeAppearanceHistogram");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addLaunchWithBundleId:date:category:", v10, v16, CFSTR("marquee_alltimeAppearance"));

    v13[2](v13, 0);
  }
  else
  {
    -[ATXNotificationDigestFeedbackInspector _histogramKeyForLocation:feedback:](self, "_histogramKeyForLocation:feedback:", v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v14, "digestFeedbackHistogram");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addLaunchWithBundleId:date:category:", v10, v19, v17);

      v13[2](v13, 0);
    }
    else
    {
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("Invalid argument for location or feedback");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXNotificationDigestFeedbackInspector"), -1, v20);
      ((void (**)(id, void *))v13)[2](v13, v21);

    }
  }

}

- (void)setHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(id, _QWORD);
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  id v53;
  uint64_t v54;
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  v17 = (void *)objc_opt_new();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("alltimeAppearance")))
  {
    objc_msgSend(v17, "alltimeMarqueeAppearanceHistogram");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    v56[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeBundleIds:", v21);

    objc_msgSend(v17, "alltimeMarqueeAppearanceHistogram");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v22, "addLaunchWithBundleId:date:category:weight:", v12, v23, CFSTR("marquee_alltimeAppearance"));

    v16[2](v16, 0);
  }
  else
  {
    -[ATXNotificationDigestFeedbackInspector _histogramKeyForLocation:feedback:](self, "_histogramKeyForLocation:feedback:", v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v42 = v16;
      v43 = v15;
      v44 = v14;
      v45 = v13;
      objc_msgSend(v17, "feedbackDictionaryForBundleId:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v17;
      objc_msgSend(v17, "digestFeedbackHistogram");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E60];
      v47 = v12;
      v53 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeBundleIds:", v29);

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v30 = v25;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v49 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v35, "isEqualToString:", v24) & 1) == 0
              && (objc_msgSend(v35, "isEqualToString:", CFSTR("marquee_alltimeAppearance")) & 1) == 0)
            {
              objc_msgSend(v46, "digestFeedbackHistogram");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "floatValue");
              objc_msgSend(v36, "addLaunchWithBundleId:date:category:weight:", v47, v37, v35);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v32);
      }

      v17 = v46;
      objc_msgSend(v46, "digestFeedbackHistogram");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v43;
      objc_msgSend(v43, "floatValue");
      v12 = v47;
      objc_msgSend(v39, "addLaunchWithBundleId:date:category:weight:", v47, v40, v24);

      v16 = v42;
      v42[2](v42, 0);
      v14 = v44;
      v13 = v45;
    }
    else
    {
      v54 = *MEMORY[0x1E0CB2D50];
      v55 = CFSTR("Invalid argument for location or feedback");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXNotificationDigestFeedbackInspector"), -1, v30);
      ((void (**)(id, void *))v16)[2](v16, v41);

    }
  }

}

- (void)clearHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, _QWORD))a4;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "digestFeedbackHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetData");

  objc_msgSend(v7, "alltimeMarqueeAppearanceHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetData");

  v4[2](v4, 0);
}

- (id)_formatFeedbackDataForBundleId:(id)a3 feedback:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a4, "feedbackDictionaryForBundleId:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  return v7;
}

- (id)_histogramKeyForLocation:(id)a3 feedback:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("notification")) & 1) != 0)
  {
    v7 = CFSTR("basic_notifications_sent");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tsnotification")) & 1) != 0)
  {
    v7 = CFSTR("urgent_notifications_sent");
  }
  else if (objc_msgSend(&unk_1E83CF8C0, "containsObject:", v5)
         && objc_msgSend(&unk_1E83CF8D8, "containsObject:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
