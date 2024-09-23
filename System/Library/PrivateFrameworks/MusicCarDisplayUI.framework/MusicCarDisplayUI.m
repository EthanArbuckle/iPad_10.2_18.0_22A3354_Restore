void sub_22FBADA84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FBAE8B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_22FBAF1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MCDIndexPathIsRootForContainer(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v1 = a1;
  objc_msgSend(v1, "indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v1, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (MRMediaRemoteApplicationSupportsSectionedBrowsing())
    {
      objc_msgSend(v1, "indexPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length") == 1;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void sub_22FBAFE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBB0724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t MCDAlbumPlaceholderImageWithStyle()
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("music.square.stack"));
}

id MCDCarDisplayBundle()
{
  if (MCDCarDisplayBundle_onceToken != -1)
    dispatch_once(&MCDCarDisplayBundle_onceToken, &__block_literal_global_0);
  return (id)MCDCarDisplayBundle_carDisplayBundle;
}

id MCDMusicBundle()
{
  if (MCDMusicBundle_onceToken != -1)
    dispatch_once(&MCDMusicBundle_onceToken, &__block_literal_global_96);
  return (id)MCDMusicBundle_musicBundle;
}

uint64_t MCDCarDisplayScreen()
{
  return objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
}

uint64_t MCDCarDisplayUIMode()
{
  void *v0;
  void *v1;
  unsigned __int8 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_capabilityForKey:", *MEMORY[0x24BEBEB60]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  objc_msgSend(v0, "_capabilityForKey:", *MEMORY[0x24BEBEB68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((objc_msgSend(v0, "supportsFocus") & 1) != 0)
    v5 = 2;
  else
    v5 = v2 & (v4 != 0);

  return v5;
}

id MCDFormattedNumberString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = MCDFormattedNumberString_sOnceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&MCDFormattedNumberString_sOnceToken, &__block_literal_global_101);
  objc_msgSend((id)MCDFormattedNumberString_sNumberFormatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MCDLocalizedExplicitImage()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const __CFString *v3;

  objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ageVerificationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "treatment");

  if (v2 == 1)
    v3 = CFSTR("19.circle.fill");
  else
    v3 = CFSTR("e.square.fill");
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

const __CFString *MCDLocalizedExplicitString()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ageVerificationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "treatment");

  if (v2 == 1)
    return CFSTR("⓳");
  else
    return CFSTR("🅴");
}

id MCDFavoriteIcon()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1E8], 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("star.fill"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setImage:", v2);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTintColor:", v3);

  objc_msgSend(v0, "sizeToFit");
  return v0;
}

id MCDFormattedPlaybackRateString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToNumber:", &unk_24FD81890))
  {
    MCDCarDisplayBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("PLAYBACK_RATE_SPEED_HALF");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24FD818A0))
  {
    MCDCarDisplayBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("PLAYBACK_RATE_SPEED_THREE_QUARTERS");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24FD818B0))
  {
    MCDCarDisplayBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("PLAYBACK_RATE_SPEED_ONE_AND_QUARTER");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToNumber:", &unk_24FD818C0))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      MCDCarDisplayBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_RATE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MCDFormattedNumberString(v1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    MCDCarDisplayBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("PLAYBACK_RATE_SPEED_ONE_AND_HALF");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

id MCDAlbumDetailFormat(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  MCDCarDisplayBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%d Song(s)"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 < 1)
  {
    v15 = v7;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%d Minute(s)"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALBUM_DETAIL_FORMAT_FULL"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v7, v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t MCDTiledArtworkForPlaylist(void *a1, const char *a2)
{
  return objc_msgSend(a1, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2);
}

id MCDMPModelObjectForGenericObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  switch(objc_msgSend(v1, "type"))
  {
    case 1:
      objc_msgSend(v1, "song");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v1, "album");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v1, "artist");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(v1, "playlist");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = v1;
      break;
  }
  v3 = v2;

  return v3;
}

void MCDSetChargeOnDescendantsOfView(void *a1, uint64_t a2, double a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        MCDSetChargeOnDescendantsOfView(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), a2, a3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = a3;
          *(float *)&v12 = v10;
          objc_msgSend(v5, "setCharge:", v12);
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void MCDClearTableViewSelection(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "indexPathsForSelectedRows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "deselectRowAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a2);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

__CFString *_MCDStringFromIndexPath(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_msgSend(v1, "length");
    v10[0] = v10;
    MEMORY[0x24BDAC7A8](v2, v3);
    v5 = (char *)v10 - v4;
    objc_msgSend(v1, "getIndexes:", (char *)v10 - v4);
    v6 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (v2 >= 1)
    {
      for (i = 0; i != v2; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)&v5[8 * i]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("%@"), v8);

        if (v2 - 1 > i)
          -[__CFString appendString:](v6, "appendString:", CFSTR("."));
      }
    }
  }
  else
  {
    v6 = CFSTR("ROOT");
  }

  return v6;
}

id MCDGetNowPlayingButton(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE15398];
  v6 = a2;
  v7 = a1;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", v6, a3, 64);
  return v8;
}

id MCDBarButtonItemForNegativeSpacer(double a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v2, "setWidth:", -a1);
  return v2;
}

void MCDSetupTableHeaderView(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = (void *)MEMORY[0x24BEBD4B8];
  v2 = a1;
  objc_msgSend(v1, "tableBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "_carSystemPrimaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v2, "textLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTextAlignment:", 1);
}

id MCDFormatArtistAlbumString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ — %@"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v4, "length"))
    {
      v9 = v4;
    }
    else
    {
      if (!objc_msgSend(v3, "length"))
      {
        v8 = 0;
        goto LABEL_9;
      }
      v9 = v3;
    }
    v8 = v9;
  }
LABEL_9:

  return v8;
}

uint64_t MCDTimeDurationForSeconds(float a1)
{
  if (MCDTimeDurationForSeconds_sOnceToken != -1)
    dispatch_once(&MCDTimeDurationForSeconds_sOnceToken, &__block_literal_global_154);
  return objc_msgSend((id)MCDTimeDurationForSeconds_sTimeFormatter, "stringFromSeconds:", a1);
}

id MCDFilteredStringForString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "newlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_24FD78C58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL MCDNetworkConnectionAvailable(uint64_t a1)
{
  return a1 != 0;
}

uint64_t MCDNetworkRestrictedCellularData()
{
  void *v0;
  uint64_t v1;

  if (!ICEnvironmentNetworkTypeIsCellular())
    return 0;
  objc_msgSend(MEMORY[0x24BDDCA98], "sharedNetworkObserver");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isMusicCellularStreamingAllowed") ^ 1;

  return v1;
}

void MCDSetAllowsCellularData(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDDCA98], "sharedNetworkObserver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMusicCellularStreamingAllowed:", a1);

}

void MCDPerformColorUpdateWithCurrentTraitCollection(void *a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  id v5;
  id v6;

  if (a1)
  {
    if (a2)
    {
      v3 = (void *)MEMORY[0x24BEBDAB0];
      v4 = a2;
      v5 = a1;
      objc_msgSend(v3, "_currentTraitCollection");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBDAB0], "_setCurrentTraitCollection:", v5);

      v4[2](v4);
      objc_msgSend(MEMORY[0x24BEBDAB0], "_setCurrentTraitCollection:", v6);

    }
  }
}

void sub_22FBB36E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 224), 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22FBB40F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22FBB50B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_22FBB6310(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FBB6A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBB7718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

_QWORD *_MCDCreateMediaRemoteIndexPath(void *a1)
{
  id v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  v4 = v3;
  v3[1] = v2;
  if (v2)
  {
    v5 = 0;
    *v3 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    do
    {
      *(_QWORD *)(*v4 + 8 * v5) = objc_msgSend(v1, "indexAtPosition:", v5);
      ++v5;
    }
    while (v2 != v5);
  }
  else
  {
    *v3 = 0;
  }

  return v4;
}

void sub_22FBB8C4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FBB8DE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FBB9644(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FBB9EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_22FBBA3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_22FBBBB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FBBBD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MCDNSIndexPathFromMRMediaRemoteIndexPath(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)MEMORY[0x24BDAC7A8](a1, a2);
  if (v3)
  {
    v5 = (_QWORD *)((char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v6 = v3;
    do
    {
      v7 = *v2++;
      *v5++ = v7;
      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndexes:length:");
  return (id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_22FBBC1E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id MCDGeneralLogging()
{
  if (MCDGeneralLogging_onceToken != -1)
    dispatch_once(&MCDGeneralLogging_onceToken, &__block_literal_global_2);
  return (id)MCDGeneralLogging_facility;
}

id MCDMusicGeneralLogging()
{
  if (MCDMusicGeneralLogging_onceToken != -1)
    dispatch_once(&MCDMusicGeneralLogging_onceToken, &__block_literal_global_2);
  return (id)MCDMusicGeneralLogging_facility;
}

void sub_22FBBD814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBBF2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBBF5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _MCDNoContentFontWithTextStyle(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a1, 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_22FBC2430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBC2CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FBC3568(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id NowPlayingBackdropView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

char *NowPlayingBackdropView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  objc_class *v26;
  char *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  objc_super v44;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E410F0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E410F8);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_22FBC54E8();
  v18 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v44 - v24;
  *(_QWORD *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = 0;
  v26 = (objc_class *)type metadata accessor for NowPlayingBackdropView();
  v44.receiver = v4;
  v44.super_class = v26;
  v27 = (char *)objc_msgSendSuper2(&v44, sel_initWithFrame_, a1, a2, a3, a4);
  sub_22FBC54DC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {

    sub_22FBC4E3C((uint64_t)v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v16, v17);
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDDB50]), sel_initWithFrame_device_, sub_22FBC54D0(), 0.0, 0.0, a3, a4);
    swift_unknownObjectRelease();
    objc_msgSend(v28, sel_setAutoresizingMask_, 18);
    v29 = objc_msgSend(v28, sel_layer);
    objc_msgSend(v29, sel_setAllowsDisplayCompositing_, 0);

    objc_msgSend(v28, sel_setEnableSetNeedsDisplay_, 0);
    objc_msgSend(v28, sel_setPreferredFramesPerSecond_, 30);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v25, v17);
    v30 = sub_22FBC5530();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v12, 1, 1, v30);
    v31 = objc_allocWithZone((Class)sub_22FBC5524());
    v32 = (void *)sub_22FBC550C();
    v33 = (void *)objc_opt_self();
    v34 = objc_msgSend(v33, sel_systemGrayColor);
    sub_22FBC54F4();

    objc_msgSend(v28, sel_colorPixelFormat);
    sub_22FBC5500();
    objc_msgSend(v28, sel_setDelegate_, v32);
    v35 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_metalView];
    *(_QWORD *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = v28;
    v36 = v28;

    v37 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_renderer];
    *(_QWORD *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = v32;
    v38 = v32;

    objc_msgSend(v27, sel_addSubview_, v36);
    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, a3, a4);
    v40 = objc_msgSend(v33, sel_blackColor);
    objc_msgSend(v39, sel_setBackgroundColor_, v40);

    objc_msgSend(v39, sel_setAutoresizingMask_, 18);
    objc_msgSend(v39, sel_setAlpha_, 0.15);
    v41 = *(void **)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView];
    *(_QWORD *)&v27[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = v39;
    v42 = v39;

    objc_msgSend(v27, sel_addSubview_, v42);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v17);
  }
  return v27;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AB4A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for NowPlayingBackdropView()
{
  return objc_opt_self();
}

uint64_t sub_22FBC4E3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E410F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t variable initialization expression of NowPlayingBackdropView.metalView()
{
  return 0;
}

uint64_t variable initialization expression of NowPlayingBackdropView.renderer()
{
  return 0;
}

uint64_t variable initialization expression of NowPlayingBackdropView.overlayView()
{
  return 0;
}

id NowPlayingBackdropView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NowPlayingBackdropView.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_metalView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_renderer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MCDNowPlayingBackdropView_overlayView] = 0;

  sub_22FBC553C();
  __break(1u);
}

Swift::Void __swiftcall NowPlayingBackdropView.update(image:animated:)(UIImage_optional image, Swift::Bool animated)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(v2 + OBJC_IVAR___MCDNowPlayingBackdropView_renderer);
  if (v3)
  {
    v4 = v3;
    sub_22FBC5518();

  }
}

id NowPlayingBackdropView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NowPlayingBackdropView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22FBC54D0()
{
  return MEMORY[0x24BE64398]();
}

uint64_t sub_22FBC54DC()
{
  return MEMORY[0x24BE643A0]();
}

uint64_t sub_22FBC54E8()
{
  return MEMORY[0x24BE643A8]();
}

uint64_t sub_22FBC54F4()
{
  return MEMORY[0x24BE646D0]();
}

uint64_t sub_22FBC5500()
{
  return MEMORY[0x24BE646D8]();
}

uint64_t sub_22FBC550C()
{
  return MEMORY[0x24BE646E0]();
}

uint64_t sub_22FBC5518()
{
  return MEMORY[0x24BE646E8]();
}

uint64_t sub_22FBC5524()
{
  return MEMORY[0x24BE646F0]();
}

uint64_t sub_22FBC5530()
{
  return MEMORY[0x24BE64700]();
}

uint64_t sub_22FBC553C()
{
  return MEMORY[0x24BEE2F48]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x24BEC8558]();
}

uint64_t MRContentItemGetArtworkData()
{
  return MEMORY[0x24BE64F58]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x24BE64F68]();
}

uint64_t MRContentItemGetIsContainer()
{
  return MEMORY[0x24BE64F70]();
}

uint64_t MRContentItemGetIsExplicitItem()
{
  return MEMORY[0x24BE64F78]();
}

uint64_t MRContentItemGetIsPlayable()
{
  return MEMORY[0x24BE64F80]();
}

uint64_t MRContentItemGetIsStreamingContent()
{
  return MEMORY[0x24BE64F88]();
}

uint64_t MRContentItemGetPlaybackProgress()
{
  return MEMORY[0x24BE64F90]();
}

uint64_t MRContentItemGetSubtitle()
{
  return MEMORY[0x24BE64F98]();
}

uint64_t MRContentItemGetTitle()
{
  return MEMORY[0x24BE64FA0]();
}

uint64_t MRMediaRemoteApplicationSupportsBrowsableContent()
{
  return MEMORY[0x24BE65048]();
}

uint64_t MRMediaRemoteApplicationSupportsImmediatePlayback()
{
  return MEMORY[0x24BE65050]();
}

uint64_t MRMediaRemoteApplicationSupportsSectionedBrowsing()
{
  return MEMORY[0x24BE65058]();
}

uint64_t MRMediaRemoteBeginLoadingBrowsableContent()
{
  return MEMORY[0x24BE65060]();
}

uint64_t MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers()
{
  return MEMORY[0x24BE65068]();
}

uint64_t MRMediaRemoteBrowsableContentSupportsPlaybackProgress()
{
  return MEMORY[0x24BE65070]();
}

uint64_t MRMediaRemoteGetBrowsableContentChildItems()
{
  return MEMORY[0x24BE65118]();
}

uint64_t MRMediaRemoteGetCountOfBrowsableContentChildItems()
{
  return MEMORY[0x24BE65128]();
}

uint64_t MRMediaRemoteGetSupportedBrowsableContentAPIs()
{
  return MEMORY[0x24BE651A8]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x24BE651F8]();
}

uint64_t MRMediaRemoteRequestPlaybackInitialization()
{
  return MEMORY[0x24BE65218]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x24BE65230]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x24BE65280]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x24BE65B08]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x24BE65CD8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

