@implementation BLTSectionInfoOverrideApplier

- (id)applyOverrides:(id)a3 toSectionInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  unsigned int v49;
  void *v51;
  id v52;
  id obj;
  int v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4)
  {
    v6 = (void *)objc_msgSend(a4, "copy");
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v6, "enableAlertsForGizmo:", BLTBBSectionInfoEnabled(v6));
      objc_msgSend(v6, "setNotificationCenterLimit:", 20);
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v6, "subsections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v70 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v20, "enableAlertsForGizmo:", BLTBBSectionInfoEnabled(v20));
            objc_msgSend(v20, "setNotificationCenterLimit:", 20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        }
        while (v17);
      }
LABEL_49:

      goto LABEL_50;
    }
    v9 = *MEMORY[0x24BE0FD30];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      v13 = objc_msgSend(v6, "pushSettings");
      if (!v12)
      {
        v14 = v13 & 0xFFFFFFFFFFFFFFEFLL;
        goto LABEL_17;
      }
    }
    else
    {
      v13 = objc_msgSend(v6, "pushSettings");
    }
    v14 = v13 | 0x10;
LABEL_17:
    objc_msgSend(v6, "setPushSettings:", v14);
    v21 = *MEMORY[0x24BE0FD00];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD00]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (v24)
        v25 = 2;
      else
        v25 = 1;
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v6, "setCriticalAlertSetting:", v25);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FCF8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;
    if (v26)
    {
      v27 = objc_msgSend(v26, "unsignedIntegerValue");
      if (v27)
        v28 = v27 == 2;
      else
        v28 = 2;
      objc_msgSend(v6, "setBulletinGroupingSetting:", v28);
    }
    v55 = *MEMORY[0x24BE0FD18];
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    v56 = v30;
    if ((v30 & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD10]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v32, "BOOLValue");

    }
    objc_msgSend(v6, "updateAlertingStatusForGizmoWithAlertsEnabled:NCEnabled:", v30, v31);
    objc_msgSend(v6, "setNotificationCenterLimit:", 20);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD28]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowsMessagePreview:", objc_msgSend(v33, "BOOLValue"));

    v34 = *MEMORY[0x24BE0FD40];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD40]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v51 = v15;
      v52 = v5;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v59)
      {
        v57 = *(_QWORD *)v66;
        v36 = *MEMORY[0x24BE0FD38];
        v54 = v56 | v31;
        v58 = v6;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v66 != v57)
              objc_enumerationMutation(obj);
            v60 = v37;
            v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v37);
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v6, "subsections");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v62;
              while (2)
              {
                for (j = 0; j != v41; ++j)
                {
                  if (*(_QWORD *)v62 != v42)
                    objc_enumerationMutation(v39);
                  v44 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
                  objc_msgSend(v38, "objectForKeyedSubscript:", v36);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "subsectionID");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v45, "isEqualToString:", v46);

                  if (v47)
                  {
                    objc_msgSend(v38, "objectForKeyedSubscript:", v55);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v48, "BOOLValue");

                    objc_msgSend(v44, "updateAlertingStatusForGizmoWithAlertsEnabled:NCEnabled:", v56 & v49, v54 & v49);
                    objc_msgSend(v44, "setNotificationCenterLimit:", 20);
                    goto LABEL_46;
                  }
                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
                if (v41)
                  continue;
                break;
              }
            }
LABEL_46:

            v37 = v60 + 1;
            v6 = v58;
          }
          while (v60 + 1 != v59);
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v59);
      }

      v15 = v51;
      v5 = v52;
    }
    goto LABEL_49;
  }
  v6 = 0;
LABEL_50:

  return v6;
}

@end
