@implementation ATXFaceSuggestionConfiguredWatchFaceSignal

- (ATXFaceSuggestionConfiguredWatchFaceSignal)init
{
  ATXFaceSuggestionConfiguredWatchFaceSignal *v2;
  void *v3;
  uint64_t v4;
  NSArray *watchFaces;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ATXFaceSuggestionConfiguredWatchFaceSignal;
  v2 = -[ATXFaceSuggestionConfiguredWatchFaceSignal init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF9208], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "watchFaces");
    v4 = objc_claimAutoreleasedReturnValue();
    watchFaces = v2->_watchFaces;
    v2->_watchFaces = (NSArray *)v4;

    if (!-[NSArray count](v2->_watchFaces, "count"))
    {
      __atxlog_handle_lock_screen();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[ATXFaceSuggestionConfiguredWatchFaceSignal init]";
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: no stored watchfaces", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (double)valueForDescriptor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  char v19;
  NSObject *v20;
  id v21;
  double v22;
  int v23;
  void *v24;
  const __CFString *v25;
  char v26;
  int v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = self->_watchFaces;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v32;
    v10 = 0.0;
    *(_QWORD *)&v7 = 136315650;
    v30 = v7;
LABEL_3:
    v11 = 0;
    while (2)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(v5);
      v12 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v11);
      v13 = v4;
      objc_msgSend(v13, "extensionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v12, "style");
      switch(v16)
      {
        case 1:
        case 17:
          v17 = v14;
          v18 = CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster");
          goto LABEL_11;
        case 2:
        case 10:
          v17 = v14;
          v18 = CFSTR("com.apple.GradientPoster.GradientPosterExtension");
          goto LABEL_11;
        case 3:
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobileslideshow.PhotosPosterProvider")))
          {

          }
          else
          {
            v27 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));

            if (!v27)
              goto LABEL_22;
          }
LABEL_12:
          __atxlog_handle_lock_screen();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v36 = "-[ATXFaceSuggestionConfiguredWatchFaceSignal valueForDescriptor:]";
            v37 = 2112;
            v38 = v4;
            v39 = 2112;
            v40 = v12;
            _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%s: descriptor (%@) has matching watch face: %@", buf, 0x20u);
          }

          v21 = v12;
          v22 = 0.1;
          if (objc_msgSend(v21, "style") != 1)
          {
            v22 = 0.1;
            if (objc_msgSend(v21, "style") != 17)
            {
              v22 = 0.1;
              if (objc_msgSend(v21, "style") != 10)
              {
                if (objc_msgSend(v21, "style") == 2)
                  v22 = 0.1;
                else
                  v22 = 1.0;
              }
            }
          }

          if (v10 < v22)
            v10 = v22;
LABEL_22:
          if (v8 != ++v11)
            continue;
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          v8 = v28;
          if (!v28)
            goto LABEL_39;
          goto LABEL_3;
        case 4:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
          v17 = v14;
          v18 = CFSTR("com.apple.PridePoster.PridePosterExtension");
          goto LABEL_11;
        case 5:
        case 6:
          v17 = v14;
          v18 = CFSTR("com.apple.UnityPoster.UnityPosterExtension");
LABEL_11:
          v19 = objc_msgSend(v17, "isEqualToString:", v18, v30);

          if ((v19 & 1) != 0)
            goto LABEL_12;
          goto LABEL_22;
        case 7:
          v23 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster"));
          v24 = v15;
          v25 = CFSTR("Earth");
          goto LABEL_30;
        case 8:
          v23 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster"));
          v24 = v15;
          v25 = CFSTR("Moon");
          goto LABEL_30;
        case 9:
          v23 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster"));
          v24 = v15;
          v25 = CFSTR("Orrery");
LABEL_30:
          v26 = objc_msgSend(v24, "containsString:", v25, v30, (_QWORD)v31);

          if (!v23 || (v26 & 1) == 0)
            goto LABEL_22;
          goto LABEL_12;
        default:

          goto LABEL_22;
      }
    }
  }
  v10 = 0.0;
LABEL_39:

  return v10;
}

- (double)weight
{
  return 50.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaces, 0);
}

@end
