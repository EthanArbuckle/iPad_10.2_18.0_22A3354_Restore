@implementation MPRouteLabel

- (NSString)text
{
  return self->_text;
}

- (id)_bestStringThatFitsSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  unsigned int (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  _BOOL4 v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  int64_t minimumEndCharacterCount;
  void *v29;
  int64_t v30;
  int64_t v31;
  int v32;
  __CFString *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  unint64_t v41;
  unint64_t v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  MPRouteLabel *v67;
  id v68;
  unsigned int (**v69)(_QWORD, _QWORD, _QWORD);
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  __CFString *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _QWORD v82[8];

  height = a3.height;
  width = a3.width;
  -[NSMutableSet allObjects](self->_routeNames, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _routeNamesSortedAlphanumeric:](self, "_routeNamesSortedAlphanumeric:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v7;
  -[NSMutableSet allObjects](self->_routeNames, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _routeNamesSortedLength:](self, "_routeNamesSortedLength:", v9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[MPRouteLabel _plusSeparatedRouteNames:](self, "_plusSeparatedRouteNames:", v8);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __40__MPRouteLabel__bestStringThatFitsSize___block_invoke;
  v82[3] = &unk_1E3162E60;
  v82[4] = self;
  *(double *)&v82[5] = width;
  *(double *)&v82[6] = height;
  v13 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v82);
  if (((unsigned int (**)(_QWORD, void *, __CFString *))v13)[2](v13, v11, v12))
  {
    v62 = v12;
    -[MPRouteLabel _formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:](self, "_formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:", v11, v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:
    if (-[MPRouteLabel displayAsSiriSuggestion](self, "displayAsSiriSuggestion"))
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("NOW_PLAYING_SIRI_SUGGESTION"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v55 = v8;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedUppercaseString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", v57, v14);
      v52 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v55;
    }
    else
    {
      v14 = v14;
      v52 = v14;
    }
    goto LABEL_49;
  }
  v15 = objc_msgSend(v11, "length") - 2 * self->_minimumEndCharacterCount;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__48769;
  v76 = __Block_byref_object_dispose__48770;
  v77 = &stru_1E3163D10;
  if (v15 >= 1)
  {
    while (1)
    {
      -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v11);

      v18 = v17 ? 1 : 2;
      -[MPRouteLabel _truncateText:by:](self, "_truncateText:by:", v11, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      -[MPRouteLabel _plusSeparatedRouteNames:](self, "_plusSeparatedRouteNames:", v64);
      v20 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v19;
      v21 = (void *)v73[5];
      v73[5] = v20;

      if (v13[2](v13, v19, v73[5]))
        break;
      if (!--v15)
        goto LABEL_11;
    }
    *((_BYTE *)v79 + 24) = 1;
    v22 = (__CFString *)(id)v73[5];

    v12 = v22;
  }
LABEL_11:
  if (*((_BYTE *)v79 + 24))
  {
    v23 = 0;
  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v64);
    v25 = v12;
    v60 = v8;
    objc_msgSend(v24, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");
    v63 = v24;
    minimumEndCharacterCount = self->_minimumEndCharacterCount;

    *((_BYTE *)v79 + 24) = 0;
    v29 = (void *)v73[5];
    v73[5] = (uint64_t)&stru_1E3163D10;

    if (v27 - 2 * minimumEndCharacterCount >= 1)
    {
      v30 = ~(2 * minimumEndCharacterCount) + v27;
      do
      {
        v31 = v30;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_34;
        v65[3] = &unk_1E3162E88;
        v66 = v63;
        v67 = self;
        v70 = &v72;
        v69 = v13;
        v68 = v11;
        v71 = &v78;
        objc_msgSend(v64, "enumerateObjectsUsingBlock:", v65);
        v32 = *((unsigned __int8 *)v79 + 24);
        if (*((_BYTE *)v79 + 24))
        {
          v33 = (__CFString *)(id)v73[5];

          v25 = v33;
        }

        if (v32)
          break;
        v30 = v31 - 1;
      }
      while (v31);
    }
    if (*((_BYTE *)v79 + 24))
    {
      v23 = 0;
      v8 = v60;
      v12 = v25;
    }
    else
    {
      objc_msgSend(v60, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v60, "count") < 2)
      {
        v35 = v34;
      }
      else
      {
        __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(v34, objc_msgSend(v60, "count") - 1);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v35;
      if (((unsigned int (**)(_QWORD, void *, id))v13)[2](v13, v11, v35))
      {
        v37 = v60;
        v12 = v36;
        v38 = v36;
        v23 = 0;
        v39 = v34;
      }
      else
      {
        v59 = v36;
        v37 = v60;
        objc_msgSend(v60, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = &stru_1E3163D10;
        v41 = 1;
        while (1)
        {
          v42 = objc_msgSend(v39, "length");
          v23 = v41 > v42;
          if (v41 > v42)
            break;
          -[MPRouteLabel _truncateText:by:](self, "_truncateText:by:", v39, v41);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v60, "count") < 2)
          {
            v40 = v43;
          }
          else
          {
            __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(v43, objc_msgSend(v60, "count") - 1);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          ++v41;
          if (((unsigned int (**)(_QWORD, void *, __CFString *))v13)[2](v13, v11, v40))
          {
            v44 = v40;
            v40 = v44;
            goto LABEL_34;
          }
        }
        objc_msgSend(v60, "firstObject");
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:
        v12 = v44;

        v25 = v40;
        v38 = v59;
      }

      v8 = v37;
    }

  }
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  v62 = v12;
  -[MPRouteLabel _formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:](self, "_formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:", v11, v12);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v45;
  if (!v23 || !objc_msgSend(v45, "length"))
    goto LABEL_46;
  v61 = v8;
  v46 = 0;
  while (1)
  {
    -[MPRouteLabel _truncateText:by:](self, "_truncateText:by:", v14, v46 + 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPRouteLabel displayAsSiriSuggestion](self, "displayAsSiriSuggestion"))
    {
      v48 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("NOW_PLAYING_SIRI_SUGGESTION"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedUppercaseString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", v51, v47);
      v52 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v52 = v47;
    }
    if (-[MPRouteLabel _labelFitsText:withSize:](self, "_labelFitsText:withSize:", v52, width, height))
      break;

    if (++v46 >= (unint64_t)objc_msgSend(v14, "length"))
    {
      v8 = v61;
      goto LABEL_46;
    }
  }

  v8 = v61;
LABEL_49:

  return v52;
}

uint64_t __40__MPRouteLabel__bestStringThatFitsSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "_formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "displayAsSiriSuggestion") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOW_PLAYING_SIRI_SUGGESTION"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedUppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v8, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "_labelFitsText:withSize:", v9, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v10;
}

- (BOOL)displayAsSiriSuggestion
{
  return self->_displayAsSiriSuggestion;
}

- (BOOL)_labelFitsText:(id)a3 withSize:(CGSize)a4
{
  double width;
  double v5;
  double v7;

  width = a4.width;
  -[MPRouteLabel _labelSizeForText:](self, "_labelSizeForText:", a3, a4.width, a4.height);
  if (v5 < width)
    return 1;
  v7 = v5 - width;
  if (v7 < 0.0)
    v7 = -v7;
  return v7 < 0.00000011920929;
}

- (CGSize)_labelSizeForText:(id)a3
{
  double v4;
  double v5;
  CGSize result;

  -[UILabel setText:](self->_sizingLabel, "setText:", a3);
  -[UILabel intrinsicContentSize](self->_sizingLabel, "intrinsicContentSize");
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_plusSeparatedRouteNames:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MPRouteLabel _routeNamesSortedAlphanumeric:](self, "_routeNamesSortedAlphanumeric:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_PLUS_SEPARATOR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_truncateText:(id)a3 by:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t truncationMode;
  int v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t minimumEndCharacterCount;
  int64_t v20;
  void *v21;

  v6 = a3;
  v7 = v6;
  truncationMode = self->_truncationMode;
  if (truncationMode)
  {
    if (truncationMode != 1)
    {
      v17 = 0;
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "length") - (a4 + 2 * self->_minimumEndCharacterCount) <= 0)
      a4 = objc_msgSend(v7, "length") - 2 * self->_minimumEndCharacterCount;
    v9 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v7, "length") * 0.5);
    v10 = (double)a4 * 0.5;
    v11 = (uint64_t)(v10 + (double)v9);
    objc_msgSend(v7, "substringWithRange:", 0, (uint64_t)((double)v9 - v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", v11, (int)objc_msgSend(v7, "length") - v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@%@"), v12, v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = objc_msgSend(v6, "length");
    minimumEndCharacterCount = self->_minimumEndCharacterCount;
    if (v18 - a4 >= minimumEndCharacterCount)
      v20 = a4;
    else
      v20 = (v18 - minimumEndCharacterCount) & ~((v18 - minimumEndCharacterCount) >> 63);
    objc_msgSend(v7, "substringWithRange:", 0, (v18 - v20) & ~((v18 - v20) >> 63));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@%@"), v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v17;
}

- (id)_routeNamesSortedAlphanumeric:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_48793);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_routeNames, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _plusSeparatedRouteNames:](self, "_plusSeparatedRouteNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:](self, "_formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRouteLabel _labelSizeForText:](self, "_labelSizeForText:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setRoute:(id)a3
{
  MPAVRoute *v5;
  MPAVRoute *route;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  char v28;
  int v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = (MPAVRoute *)a3;
  route = self->_route;
  if (route != v5)
  {
    if (route)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MPAVRouteDidChangeNotification"), self->_route);

    }
    objc_storeStrong((id *)&self->_route, a3);
    -[MPRouteLabel subscribeToRouteNotificationIfNeeded](self, "subscribeToRouteNotificationIfNeeded");
  }
  if (-[MPAVRoute isAppleTVRoute](v5, "isAppleTVRoute"))
  {
    -[MPAVRoute designatedGroupLeaderName](v5, "designatedGroupLeaderName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length") != 0;

  }
  else
  {
    v9 = 0;
  }
  if (!-[MPAVRoute isDeviceRoute](v5, "isDeviceRoute") || v9)
  {
    -[MPAVRoute designatedGroupLeaderName](v5, "designatedGroupLeaderName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (__CFString *)MRAVOutputDeviceCopyLocalDeviceLocalizedName();
  }
  v11 = v10;
  if (!-[__CFString length](v10, "length")
    || !-[MPAVRoute isAirPlayingToDevice](v5, "isAirPlayingToDevice")
    || !-[MPAVRoute isProxyGroupPlayer](v5, "isProxyGroupPlayer"))
  {
    if (!-[MPAVRoute isDeviceRoute](v5, "isDeviceRoute")
      || -[MPAVRoute numberOfOutputDevices](v5, "numberOfOutputDevices") > 1)
    {
      v20 = -[MPAVRoute isSplitRoute](v5, "isSplitRoute");

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = &stru_1E3163D10;
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_HEADPHONES_COUNT"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v23, -[MPAVRoute numberOfOutputDevices](v5, "numberOfOutputDevices"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_32;
      }
      -[MPAVRoute routeNames](v5, "routeNames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }

    v16 = v5;
    v11 = v16;
    if (v16
      && self->_usesPredictedOutputDevice
      && (-[__CFString predictedOutputDevice](v16, "predictedOutputDevice"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v17))
    {
      -[__CFString predictedOutputDevice](v11, "predictedOutputDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "routeName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[__CFString routeName](v11, "routeName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_30:
LABEL_31:
    v11 = &stru_1E3163D10;
    goto LABEL_32;
  }
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MPAVRoute routeNames](v5, "routeNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  v15 = objc_msgSend(v14, "indexOfObject:", v11);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "removeObjectAtIndex:", v15);
  if (self->_omitGroupLeaderName)
    goto LABEL_30;
LABEL_32:
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v14);
  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v11 == v26)
  {
    v28 = 0;
  }
  else
  {
    -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[__CFString isEqualToString:](v11, "isEqualToString:", v27) ^ 1;

  }
  v29 = objc_msgSend(v25, "isEqualToSet:", self->_routeNames);
  if ((v28 & 1) != 0 || !v29)
  {
    objc_storeStrong((id *)&self->_designatedGroupLeaderName, v11);
    objc_storeStrong((id *)&self->_routeNames, v25);
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_formattedRouteNameForDesignatedGroupLeaderNameText:(id)a3 routeNamesText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "copy");
  -[MPRouteLabel _marketingNames](self, "_marketingNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v6;
  }
  v13 = v12;
  if (objc_msgSend(v8, "length") && objc_msgSend(v13, "length"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_ARROW_FORMAT"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v13, v8);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = v15;
  }
  else
  {
    if (objc_msgSend(v13, "length"))
    {
      if (v13)
        v18 = v13;
      else
        v18 = v7;
      v19 = v18;
    }
    else
    {
      if (!objc_msgSend(v7, "length"))
        goto LABEL_16;
      v19 = v7;
    }
    v17 = (uint64_t)v19;
  }

  v8 = (void *)v17;
LABEL_16:
  if (self->_forcesUppercaseText)
  {
    v32 = v6;
    objc_msgSend(v8, "localizedUppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[MPRouteLabel _marketingNames](self, "_marketingNames");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v28 = objc_msgSend(v8, "rangeOfString:", v27);
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v21, "replaceCharactersInRange:withString:", v28, v29, v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v24);
    }

    v30 = objc_msgSend(v21, "copy");
    v8 = (void *)v30;
    v6 = v32;
  }

  return v8;
}

- (NSString)designatedGroupLeaderName
{
  if (self->_omitGroupLeaderName)
    return (NSString *)0;
  else
    return self->_designatedGroupLeaderName;
}

- (id)_marketingNames
{
  if (_marketingNames_onceToken != -1)
    dispatch_once(&_marketingNames_onceToken, &__block_literal_global_41_48760);
  return (id)_marketingNames_marketingNames;
}

- (id)_routeNamesSortedLength:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MPRouteLabel__routeNamesSortedLength___block_invoke;
  v4[3] = &unk_1E3162E38;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)subscribeToRouteNotificationIfNeeded
{
  _BOOL4 updatesRouteInternally;
  void *v4;
  id v5;

  if (self->_route)
  {
    updatesRouteInternally = self->_updatesRouteInternally;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (updatesRouteInternally)
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__routeDidChangeNotification_, CFSTR("MPAVRouteDidChangeNotification"), self->_route);
    else
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MPAVRouteDidChangeNotification"), self->_route);

  }
}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_textColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[BSUIEmojiLabelView setTextColor:](self->_contentView, "setTextColor:", v5);
  }

}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[BSUIEmojiLabelView setFont:](self->_contentView, "setFont:", v5);
    -[UILabel setFont:](self->_sizingLabel, "setFont:", v5);
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPRouteLabel;
  -[MPRouteLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[MPRouteLabel bounds](self, "bounds");
  -[BSUIEmojiLabelView setFrame:](self->_contentView, "setFrame:");
  -[MPRouteLabel _updateRouteLabel](self, "_updateRouteLabel");
}

- (void)_updateRouteLabel
{
  -[MPRouteLabel _updateTitleIfNeeded](self, "_updateTitleIfNeeded");
  -[BSUIEmojiLabelView setText:](self->_contentView, "setText:", self->_text);
}

- (void)_updateTitleIfNeeded
{
  NSString *previousDesignatedGroupLeaderName;
  NSString *v4;
  NSString *v5;
  void *v6;
  int v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v12;
  int previousForcesUppercaseText;
  int forcesUppercaseText;
  BOOL v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  UIFont *v20;
  UIFont *previousFont;
  void *v22;
  NSString *v23;
  NSString *v24;
  NSMutableSet *v25;
  NSMutableSet *previousRouteNames;
  double v27;
  double v28;
  NSString *v29;
  NSString *text;
  int v31;
  CGRect v32;

  previousDesignatedGroupLeaderName = self->_previousDesignatedGroupLeaderName;
  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (previousDesignatedGroupLeaderName == v4)
  {
    v31 = 0;
  }
  else
  {
    v5 = self->_previousDesignatedGroupLeaderName;
    -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[NSString isEqual:](v5, "isEqual:", v6) ^ 1;

  }
  v7 = -[NSMutableSet isEqualToSet:](self->_previousRouteNames, "isEqualToSet:", self->_routeNames);
  -[MPRouteLabel bounds](self, "bounds");
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = v10;
  v32.size.height = v11;
  v12 = CGRectEqualToRect(self->_previousBounds, v32);
  previousForcesUppercaseText = self->_previousForcesUppercaseText;
  forcesUppercaseText = self->_forcesUppercaseText;
  v15 = (-[UIFont isEqual:](self->_previousFont, "isEqual:", self->_font) & 1) == 0
     && self->_previousFont != self->_font;
  if (((v31 | v7 ^ 1) & 1) != 0
    || !v12
    || previousForcesUppercaseText != forcesUppercaseText
    || v15
    || self->_previousTruncationMode != self->_truncationMode
    || self->_previousDisplayAsSiriSuggestion != self->_displayAsSiriSuggestion)
  {
    -[MPRouteLabel bounds](self, "bounds");
    self->_previousBounds.origin.x = v16;
    self->_previousBounds.origin.y = v17;
    self->_previousBounds.size.width = v18;
    self->_previousBounds.size.height = v19;
    v20 = (UIFont *)-[UIFont copy](self->_font, "copy");
    previousFont = self->_previousFont;
    self->_previousFont = v20;

    -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSString *)objc_msgSend(v22, "copy");
    v24 = self->_previousDesignatedGroupLeaderName;
    self->_previousDesignatedGroupLeaderName = v23;

    v25 = (NSMutableSet *)-[NSMutableSet copy](self->_routeNames, "copy");
    previousRouteNames = self->_previousRouteNames;
    self->_previousRouteNames = v25;

    self->_previousForcesUppercaseText = self->_forcesUppercaseText;
    self->_previousDisplayAsSiriSuggestion = self->_displayAsSiriSuggestion;
    self->_previousTruncationMode = self->_truncationMode;
    -[MPRouteLabel bounds](self, "bounds");
    -[MPRouteLabel _bestStringThatFitsSize:](self, "_bestStringThatFitsSize:", v27, v28);
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v29;

    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (MPRouteLabel)initWithFrame:(CGRect)a3
{
  MPRouteLabel *v3;
  NSString *v4;
  NSString *designatedGroupLeaderName;
  NSMutableSet *v6;
  NSMutableSet *previousRouteNames;
  NSMutableSet *v8;
  NSMutableSet *routeNames;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UILabel *sizingLabel;
  uint64_t v17;
  BSUIEmojiLabelView *contentView;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MPRouteLabel;
  v3 = -[MPRouteLabel initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
    designatedGroupLeaderName = v3->_designatedGroupLeaderName;
    v3->_designatedGroupLeaderName = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    previousRouteNames = v3->_previousRouteNames;
    v3->_previousRouteNames = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    routeNames = v3->_routeNames;
    v3->_routeNames = v8;

    v10 = objc_alloc(MEMORY[0x1E0DC3990]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    sizingLabel = v3->_sizingLabel;
    v3->_sizingLabel = (UILabel *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01920]), "initWithFrame:", v11, v12, v13, v14);
    contentView = v3->_contentView;
    v3->_contentView = (BSUIEmojiLabelView *)v17;

    v3->_minimumEndCharacterCount = 2;
    v3->_omitGroupLeaderName = 0;
    v3->_updatesRouteInternally = 1;
    v3->_usesPredictedOutputDevice = 0;
    -[MPRouteLabel addSubview:](v3, "addSubview:", v3->_contentView);
    -[MPRouteLabel addSubview:](v3, "addSubview:", v3->_sizingLabel);
    -[UILabel setHidden:](v3->_sizingLabel, "setHidden:", 1);
  }
  return v3;
}

void __31__MPRouteLabel__marketingNames__block_invoke()
{
  void *v0;

  v0 = (void *)_marketingNames_marketingNames;
  _marketingNames_marketingNames = (uint64_t)&unk_1E31E65C8;

}

- (UILabel)titleLabel
{
  return (UILabel *)-[BSUIEmojiLabelView contentLabel](self->_contentView, "contentLabel");
}

- (double)_baselineOffsetFromBottom
{
  double result;

  -[BSUIEmojiLabelView _baselineOffsetFromBottom](self->_contentView, "_baselineOffsetFromBottom");
  return result;
}

- (BOOL)_textColorFollowsTintColor
{
  void *v2;
  char v3;

  -[MPRouteLabel titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_textColorFollowsTintColor");

  return v3;
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  if (self->_forcesUppercaseText != a3)
  {
    self->_forcesUppercaseText = a3;
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumEndCharacterCount:(int64_t)a3
{
  void *v6;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRouteLabel.m"), 111, CFSTR("MPRouteLabel's minimumEndCharacter property must be greater than or equal to 0."));

  }
  if (self->_minimumEndCharacterCount != a3)
  {
    self->_minimumEndCharacterCount = a3;
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[BSUIEmojiLabelView setTextAlignment:](self->_contentView, "setTextAlignment:");
  }
}

- (void)setTruncationMode:(int64_t)a3
{
  if (self->_truncationMode != a3)
  {
    self->_truncationMode = a3;
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDisplayAsSiriSuggestion:(BOOL)a3
{
  if (self->_displayAsSiriSuggestion != a3)
  {
    self->_displayAsSiriSuggestion = a3;
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOmitGroupLeaderName:(BOOL)a3
{
  if (self->_omitGroupLeaderName != a3)
  {
    self->_omitGroupLeaderName = a3;
    -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUpdatesRouteInternally:(BOOL)a3
{
  if (self->_updatesRouteInternally != a3)
  {
    self->_updatesRouteInternally = a3;
    -[MPRouteLabel subscribeToRouteNotificationIfNeeded](self, "subscribeToRouteNotificationIfNeeded");
  }
}

- (void)_setTextColorFollowsTintColor:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MPRouteLabel titleLabel](self, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTextColorFollowsTintColor:", v3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MPRouteLabel _bestStringThatFitsSize:](self, "_bestStringThatFitsSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _labelSizeForText:](self, "_labelSizeForText:", v6);
  if (v7 < width)
    width = v7;
  if (v8 < height)
    height = v8;

  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)addRouteName:(id)a3
{
  -[NSMutableSet addObject:](self->_routeNames, "addObject:", a3);
  -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)addRouteNamesFromArray:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_routeNames, "addObjectsFromArray:", a3);
  -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)removeRouteName:(id)a3
{
  -[NSMutableSet removeObject:](self->_routeNames, "removeObject:", a3);
  -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)removeRouteNamesFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableSet removeObject:](self->_routeNames, "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[MPRouteLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteLabel setNeedsLayout](self, "setNeedsLayout");

}

- (id)_formattedRouteName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MPRouteLabel designatedGroupLeaderName](self, "designatedGroupLeaderName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_routeNames, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel _plusSeparatedRouteNames:](self, "_plusSeparatedRouteNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRouteLabel _formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:](self, "_formattedRouteNameForDesignatedGroupLeaderNameText:routeNamesText:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_routeDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPRouteLabel__routeDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (int64_t)_compareLength:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 <= objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(v5, "length");
    v8 = v9 < objc_msgSend(v6, "length");
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (int64_t)minimumEndCharacterCount
{
  return self->_minimumEndCharacterCount;
}

- (int64_t)truncationMode
{
  return self->_truncationMode;
}

- (BOOL)forcesUppercaseText
{
  return self->_forcesUppercaseText;
}

- (BOOL)omitGroupLeaderName
{
  return self->_omitGroupLeaderName;
}

- (BOOL)updatesRouteInternally
{
  return self->_updatesRouteInternally;
}

- (BOOL)usesPredictedOutputDevice
{
  return self->_usesPredictedOutputDevice;
}

- (void)setUsesPredictedOutputDevice:(BOOL)a3
{
  self->_usesPredictedOutputDevice = a3;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (BSUIEmojiLabelView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setDesignatedGroupLeaderName:(id)a3
{
  objc_storeStrong((id *)&self->_designatedGroupLeaderName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedGroupLeaderName, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_routeNames, 0);
  objc_storeStrong((id *)&self->_previousRouteNames, 0);
  objc_storeStrong((id *)&self->_previousFont, 0);
  objc_storeStrong((id *)&self->_previousDesignatedGroupLeaderName, 0);
}

uint64_t __44__MPRouteLabel__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));
}

void __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_34(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "length");
  if (v9 <= objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v17, "isEqualToString:", v10);

    if (v11)
      v12 = 1;
    else
      v12 = 2;
    objc_msgSend(*(id *)(a1 + 40), "_truncateText:by:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v13, a3);

    objc_msgSend(*(id *)(a1 + 40), "_plusSeparatedRouteNames:", *(_QWORD *)(a1 + 32));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

id __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a1;
  objc_msgSend(v4, "mediaPlayerBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ROUTE_NAME_PLUS_COUNT"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __40__MPRouteLabel__routeNamesSortedLength___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareLength:with:", a2, a3);
}

uint64_t __46__MPRouteLabel__routeNamesSortedAlphanumeric___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

@end
