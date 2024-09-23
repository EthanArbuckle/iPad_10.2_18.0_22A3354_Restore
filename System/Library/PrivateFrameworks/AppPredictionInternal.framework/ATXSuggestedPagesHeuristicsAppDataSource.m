@implementation ATXSuggestedPagesHeuristicsAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[11];
  _QWORD v35[12];
  void *v36;
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[6];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = 0;
  switch(a3)
  {
    case 4:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Home"), CFSTR("Heuristic"));
      v39[0] = v7;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.weather"), CFSTR("Heuristic"));
      v39[1] = v8;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobiletimer"), CFSTR("Heuristic"));
      v39[2] = v9;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.iBooks"), CFSTR("Heuristic"));
      v39[3] = v10;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilenotes"), CFSTR("Heuristic"));
      v39[4] = v11;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Preferences"), CFSTR("Heuristic"));
      v39[5] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    case 5:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Maps"), CFSTR("Heuristic"));
      v36 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Fitness"), CFSTR("Heuristic"));
      v37[0] = v7;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Health"), CFSTR("Heuristic"));
      v37[1] = v8;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Music"), CFSTR("Heuristic"));
      v37[2] = v9;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.podcasts"), CFSTR("Heuristic"));
      v37[3] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      goto LABEL_7;
    case 7:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilecal"), CFSTR("Heuristic"));
      v34[0] = v7;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilenotes"), CFSTR("Heuristic"));
      v34[1] = v33;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.reminders"), CFSTR("Heuristic"));
      v34[2] = v32;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.shortcuts"), CFSTR("Heuristic"));
      v34[3] = v31;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.MobileAddressBook"), CFSTR("Heuristic"));
      v34[4] = v13;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.stocks"), CFSTR("Heuristic"));
      v34[5] = v14;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.DocumentsApp"), CFSTR("Heuristic"));
      v34[6] = v15;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilemail"), CFSTR("Heuristic"));
      v34[7] = v16;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Numbers"), CFSTR("Heuristic"));
      v34[8] = v17;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Pages"), CFSTR("Heuristic"));
      v34[9] = v18;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Keynote"), CFSTR("Heuristic"));
      v34[10] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 8:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.weather"), CFSTR("Heuristic"));
      v35[0] = v7;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.iBooks"), CFSTR("Heuristic"));
      v35[1] = v33;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.tv"), CFSTR("Heuristic"));
      v35[2] = v32;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Music"), CFSTR("Heuristic"));
      v35[3] = v31;
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.podcasts"), CFSTR("Heuristic"));
      v35[4] = v30;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.news"), CFSTR("Heuristic"));
      v35[5] = v20;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.facetime"), CFSTR("Heuristic"));
      v35[6] = v21;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobileslideshow"), CFSTR("Heuristic"));
      v35[7] = v22;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.camera"), CFSTR("Heuristic"));
      v35[8] = v23;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilegarageband"), CFSTR("Heuristic"));
      v35[9] = v24;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.iMovie"), CFSTR("Heuristic"));
      v35[10] = v25;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.clips"), CFSTR("Heuristic"));
      v35[11] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      goto LABEL_12;
    case 9:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.iBooks"), CFSTR("Heuristic"));
      v38[0] = v7;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.news"), CFSTR("Heuristic"));
      v38[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_12;
    case 11:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.Music"), CFSTR("Heuristic"));
      v40[0] = v7;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.podcasts"), CFSTR("Heuristic"));
      v40[1] = v27;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", CFSTR("com.apple.mobilenotes"), CFSTR("Heuristic"));
      v40[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      break;
    default:
      break;
  }

  return v6;
}

@end
