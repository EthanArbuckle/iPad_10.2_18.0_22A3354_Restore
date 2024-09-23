@implementation MKTransitDeparturesCell

- (id)multipartStringSeparator
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  _MKLocalizedStringFromThisBundle(CFSTR("Departures_Cell_Secondary_Separator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (void)configureLeadingWithTableViewContentMargin:(double)a3 width:(double)a4
{
  __int16 v5;

  v5 = 0;
  -[MKTransitDeparturesCell lineImageViewSize](self, "lineImageViewSize");
  +[MKTransitDeparturesCell useCompressedGutter:compressedLeading:forImageWidth:inWidth:](MKTransitDeparturesCell, "useCompressedGutter:compressedLeading:forImageWidth:inWidth:", (char *)&v5 + 1, &v5);
  -[MKTransitDeparturesCell setUseCompressedLeading:](self, "setUseCompressedLeading:", v5);
  -[MKTransitDeparturesCell setUseCompressedGutter:](self, "setUseCompressedGutter:", HIBYTE(v5));
}

- (id)_startEndDatesForSequence:(id)a3 date:(id)a4 mapItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operatingHoursForDate:inTimeZone:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "startDate", (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

        objc_msgSend(v17, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)_operatingHoursDescriptionForSequence:(id)a3 mapItem:(id)a4 useNewLineDelimeter:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "departureTimeDisplayStyle") == 3
    && (objc_msgSend(v8, "operatingHours"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[MKTransitDeparturesCell departureCutoffDate](self, "departureCutoffDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesCell _startEndDatesForSequence:date:mapItem:](self, "_startEndDatesForSequence:date:mapItem:", v8, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeZone");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForHourRanges:timeZone:delimeter:", v13, v16, CFSTR("\n"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForHourRanges:timeZone:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)configureCellForRowIndex:(int64_t)a3 withMapItem:(id)a4 sectionController:(id)a5 outNextLineIsSame:(BOOL *)a6
{
  id v10;
  id v11;
  MKTransitItemIncidentsController *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
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
  uint64_t v36;
  uint64_t v37;
  char v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
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
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v94 = 1;
  -[MKTransitDeparturesCell setInactive:](self, "setInactive:", 0);
  -[MKTransitDeparturesCell setFrequency:](self, "setFrequency:", 0);
  -[MKTransitDeparturesCell setOperatingHours:](self, "setOperatingHours:", 0);
  v12 = -[MKTransitItemIncidentsController initWithMapItem:]([MKTransitItemIncidentsController alloc], "initWithMapItem:", v10);
  -[MKTransitDeparturesCell departureCutoffDate](self, "departureCutoffDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentsController setReferenceDate:](v12, "setReferenceDate:", v13);

  v14 = -[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled");
  -[MKTransitDeparturesCell setUseMultilineDeparturesLabel:](self, "setUseMultilineDeparturesLabel:", v14);
  if (a3 != -1 || !v14)
  {
    objc_msgSend(v11, "sequenceForRow:outIsNewLine:outNextLineIsSame:", a3, &v94, a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v26, "displayStyle");
    objc_msgSend(v26, "line");
    v87 = objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesCell setDepartureStyle:](self, "setDepartureStyle:", objc_msgSend(v26, "departureTimeDisplayStyle"));
    -[MKTransitDeparturesCell departureCutoffDate](self, "departureCutoffDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "departuresValidForDate:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitDeparturesCell setDepartures:](self, "setDepartures:", v28);
    -[MKTransitItemIncidentsController incidentsForDepartureSequence:](v12, "incidentsForDepartureSequence:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (v83)
      {
        objc_msgSend(v83, "messageForRouteStepping");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          -[MKTransitDeparturesCell setIncidentTitle:](self, "setIncidentTitle:", v30);
        }
        else
        {
          objc_msgSend(v83, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKTransitDeparturesCell setIncidentTitle:](self, "setIncidentTitle:", v31);

        }
      }
      else
      {
        -[MKTransitDeparturesCell setIncidentTitle:](self, "setIncidentTitle:", 0);
      }
    }
    objc_msgSend(v26, "line");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitDeparturesCell _operatingHoursDescriptionForSequence:mapItem:useNewLineDelimeter:](self, "_operatingHoursDescriptionForSequence:mapItem:useNewLineDelimeter:", v26, v10, v14);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v84, "length"))
    {
      v89 = 0;
    }
    else
    {
      objc_msgSend(v11, "serviceGapDescriptionForRow:", a3);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v28;
    v81 = v10;
    v82 = v33;
    if (!objc_msgSend(v11, "departuresAreVehicleSpecific"))
    {
      if (v14)
      {
        objc_msgSend(v26, "displayName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v40);

        v41 = v84;
        if (objc_msgSend(v84, "length"))
LABEL_66:
          -[MKTransitDeparturesCell setOperatingHours:](self, "setOperatingHours:", v41);
LABEL_68:
        if (!objc_msgSend(v89, "length"))
        {
          -[MKTransitDeparturesCell countdownReferenceDate](self, "countdownReferenceDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v26, "hasFrequencyAtDate:", v61);

          if (v62)
          {
            v63 = (void *)MEMORY[0x1E0CB3940];
            -[MKTransitDeparturesCell countdownReferenceDate](self, "countdownReferenceDate");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "frequencyToDescribeAtDate:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "_navigation_formattedDescriptionForFrequency:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v66, "length"))
            {
              if (v14)
              {
                -[MKTransitDeparturesCell setFrequency:](self, "setFrequency:", v66);
              }
              else
              {
                v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v66);
                objc_msgSend(v85, "addObject:", v67);

              }
            }

          }
        }
        if (objc_msgSend(v85, "count"))
        {
          -[MKTransitDeparturesCell multipartStringSeparator](self, "multipartStringSeparator");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v85, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v69 = 0;
        }
        v70 = v26;
        -[MKTransitDeparturesCell setSecondaryText:](self, "setSecondaryText:", v69);
        if (v89)
        {
          v95 = v89;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E20DFC00);
          +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v73 = 0;
        }
        v74 = v11;
        -[MKTransitDeparturesCell setTertiaryText:](self, "setTertiaryText:", v73);
        if (v14)
        {
          -[MKTransitDeparturesCell setLineImage:](self, "setLineImage:", 0);
          -[MKTransitDeparturesCell setShowIncidentIcon:](self, "setShowIncidentIcon:", 0);
          v17 = v70;
          v75 = v83;
        }
        else
        {
          v75 = v83;
          -[MKTransitDeparturesCell delegate](self, "delegate");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "imageForTransitLine:", v87);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          -[MKTransitDeparturesCell setLineImage:](self, "setLineImage:", v77);
          -[MKTransitDeparturesCell setShowIncidentIcon:](self, "setShowIncidentIcon:", v83 != 0);

          v17 = v70;
        }

        v15 = (void *)v87;
        v11 = v74;
        v10 = v81;
        goto LABEL_85;
      }
      v41 = v84;
      if (!objc_msgSend(v33, "length") || v79 != 1)
      {
        objc_msgSend(v26, "headsign");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v58);

        if (v79 != 2 || !objc_msgSend(v33, "length"))
          goto LABEL_64;
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v33);
        objc_msgSend(v85, "addObject:", v34);
        goto LABEL_63;
      }
      -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v33);
      objc_msgSend(v26, "headsign");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");

      if (!v43)
      {
LABEL_64:
        if (!objc_msgSend(v41, "length"))
          goto LABEL_68;
        if (v14)
          goto LABEL_66;
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v41);
        objc_msgSend(v85, "addObject:", v60);

        goto LABEL_68;
      }
      v44 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v26, "headsign");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (__CFString *)objc_msgSend(v44, "initWithString:", v34);
      objc_msgSend(v85, "addObject:", v39);
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    objc_msgSend(v28, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "vehicleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");
    v37 = objc_msgSend(v33, "length");
    v78 = v35;
    if (v36)
    {
      if (v37)
        v38 = v14;
      else
        v38 = 1;
      if ((v38 & 1) != 0)
      {
        v39 = v35;
      }
      else
      {
        v45 = (void *)MEMORY[0x1E0CB3940];
        _MKLocalizedStringFromThisBundle(CFSTR("train number line name format"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "vehicleIdentifier");
        v47 = v26;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", v46, v48, v82, v78);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v26 = v47;
      }
      v41 = v84;
    }
    else
    {
      v41 = v84;
      if (v37)
        v39 = v33;
      else
        v39 = &stru_1E20DFC00;
    }
    if (!objc_msgSend(v41, "length"))
    {
      objc_msgSend(v11, "serviceGapDescriptionForRow:", a3);
      v49 = objc_claimAutoreleasedReturnValue();

      v89 = (void *)v49;
    }
    if (-[__CFString length](v39, "length") && v79 == 1)
    {
      -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v39);
      objc_msgSend(v26, "headsign");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "length");

      if (v51)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v26, "headsign");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v52, "initWithString:", v53);
        objc_msgSend(v85, "addObject:", v54);

LABEL_60:
      }
    }
    else
    {
      if (v14)
      {
        objc_msgSend(v34, "displayName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          v57 = v55;
        }
        else
        {
          objc_msgSend(v26, "displayName");
          v57 = (id)objc_claimAutoreleasedReturnValue();
        }
        v53 = v57;

        -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v53);
        goto LABEL_60;
      }
      objc_msgSend(v26, "headsign");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesCell setPrimaryText:](self, "setPrimaryText:", v59);

      if (-[__CFString length](v39, "length"))
      {
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v39);
        objc_msgSend(v85, "addObject:", v53);
        goto LABEL_60;
      }
    }

    goto LABEL_62;
  }
  objc_msgSend(v11, "sequenceForRow:outIsNewLine:outNextLineIsSame:", 0, &v94, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageForDepartureSequence:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKTransitDeparturesCell setLineImage:](self, "setLineImage:", v17);
  -[MKTransitDeparturesCell setIncidentTitle:](self, "setIncidentTitle:", 0);
  -[MKTransitDeparturesCell setDepartures:](self, "setDepartures:", MEMORY[0x1E0C9AA60]);
  -[MKTransitDeparturesCell setSecondaryText:](self, "setSecondaryText:", 0);
  -[MKTransitDeparturesCell setTertiaryText:](self, "setTertiaryText:", 0);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend(v11, "sequences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
  if (v19)
  {
    v86 = v15;
    v88 = v17;
    v20 = v11;
    v21 = v10;
    v22 = *(_QWORD *)v91;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v91 != v22)
          objc_enumerationMutation(v18);
        -[MKTransitItemIncidentsController incidentsForDepartureSequence:](v12, "incidentsForDepartureSequence:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25)
        {
          v19 = 1;
          goto LABEL_17;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      if (v19)
        continue;
      break;
    }
LABEL_17:
    v10 = v21;
    v11 = v20;
    v15 = v86;
    v17 = v88;
  }

  -[MKTransitDeparturesCell setShowIncidentIcon:](self, "setShowIncidentIcon:", v19);
LABEL_85:

}

- (MKTransitDeparturesCell)initWithReuseIdentifier:(id)a3
{
  MKTransitDeparturesCell *v3;
  MKTransitDeparturesCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  v3 = -[MKCustomSeparatorCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
    -[MKTransitDeparturesCell _commonInit](v3, "_commonInit");
  return v4;
}

- (MKTransitDeparturesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[MKTransitDeparturesCell initWithReuseIdentifier:](self, "initWithReuseIdentifier:", a4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKTransitDeparturesCell;
  -[MKTransitDeparturesCell dealloc](&v4, sel_dealloc);
}

- (void)setInactive:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_inactive != a3)
  {
    self->_inactive = a3;
    if (a3)
    {
      -[MKMultiPartLabel textColor](self->_secondaryLabel, "textColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setTextColor:](self->_primaryLabel, "setTextColor:", v4);
    }
    else
    {
      -[UIView mk_theme](self, "mk_theme");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel setTextColor:](self->_primaryLabel, "setTextColor:", v5);

    }
    -[MKTransitDeparturesCell _updateConstraintValues](self, "_updateConstraintValues");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitDeparturesCell;
  -[MKTransitDeparturesCell setSelected:animated:](&v8, sel_setSelected_animated_, a3, a4);
  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitDeparturesCell;
  -[MKTransitDeparturesCell setHighlighted:animated:](&v8, sel_setHighlighted_animated_, a3, a4);
  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_commonInit
{
  double v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *lineImageView;
  _BOOL4 v10;
  UIImageView *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *lineImageViewHeightConstraint;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _MKUILabel *v19;
  _MKUILabel *primaryLabel;
  double v21;
  double v22;
  double v23;
  void *v24;
  MKThemeMultiPartLabel *v25;
  MKThemeMultiPartLabel *secondaryLabel;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  MKThemeMultiPartLabel *v34;
  MKThemeMultiPartLabel *tertiaryLabel;
  double v36;
  double v37;
  double v38;
  _MKUILabel *v39;
  _MKUILabel *departureLabel;
  double v41;
  _MKUILabel *v42;
  _MKUILabel *departureDetailLabel;
  double v44;
  double v45;
  double v46;
  id v47;
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
  UIImageView *v58;
  UIImageView *disclosureArrowImageView;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  id v66;
  uint64_t v67;
  UIStackView *v68;
  UIStackView *secondaryTextStackView;
  UIStackView *v70;
  UIStackView *departureStackView;
  void *v72;
  double v73;
  double v74;
  UIButton *v75;
  UIButton *incidentButton;
  void *v77;
  uint64_t v78;
  UIButton *v79;
  void *v80;
  void *v81;
  void *v82;
  UIButton *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  uint64_t v99;
  _QWORD v100[2];

  v100[1] = *MEMORY[0x1E0C80C00];
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  else
  {
    LODWORD(v3) = 1148846080;
    -[UIImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_lineImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v3);
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

  v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
  lineImageView = self->_lineImageView;
  self->_lineImageView = v8;

  -[UIImageView setAccessibilityIdentifier:](self->_lineImageView, "setAccessibilityIdentifier:", CFSTR("LineImageView"));
  v10 = -[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled");
  v11 = self->_lineImageView;
  if (v10)
  {
    -[UIImageView heightAnchor](v11, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 24.0);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    lineImageViewHeightConstraint = self->_lineImageViewHeightConstraint;
    self->_lineImageViewHeightConstraint = v13;

    LODWORD(v15) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_lineImageViewHeightConstraint, "setPriority:", v15);
    -[NSLayoutConstraint setActive:](self->_lineImageViewHeightConstraint, "setActive:", 0);
    v11 = self->_lineImageView;
    v16 = 1;
  }
  else
  {
    v16 = 4;
  }
  -[UIImageView setContentMode:](v11, "setContentMode:", v16);
  -[UIView mk_theme](self, "mk_theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lightTextColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_lineImageView, "setTintColor:", v18);

  v19 = objc_alloc_init(_MKUILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v19;

  -[_MKUILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 4);
  -[_MKUILabel set_mapkit_themeColorProvider:](self->_primaryLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_87);
  LODWORD(v21) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v21);
  LODWORD(v22) = 1132068864;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_primaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v22);
  LODWORD(v23) = 1148846080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_primaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v23);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_primaryLabel);

  v25 = objc_alloc_init(MKThemeMultiPartLabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v25;

  -[MKThemeMultiPartLabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[MKThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMultiPartLabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 4);
  v27 = *MEMORY[0x1E0CEB4B0];
  v28 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v29 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v30 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[MKMultiPartLabel setTextInset:](self->_secondaryLabel, "setTextInset:", *MEMORY[0x1E0CEB4B0], v28, v29, v30);
  -[MKThemeMultiPartLabel set_mapkit_themeColorProvider:](self->_secondaryLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_16);
  LODWORD(v31) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v31);
  LODWORD(v32) = 1132068864;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v32);
  LODWORD(v33) = 1144750080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v33);
  v34 = objc_alloc_init(MKThemeMultiPartLabel);
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v34;

  -[MKThemeMultiPartLabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));
  -[MKThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tertiaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMultiPartLabel setTextAlignment:](self->_tertiaryLabel, "setTextAlignment:", 4);
  -[MKMultiPartLabel setTextInset:](self->_tertiaryLabel, "setTextInset:", v27, v28, v29, v30);
  -[MKThemeMultiPartLabel set_mapkit_themeColorProvider:](self->_tertiaryLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_19_0);
  LODWORD(v36) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v36);
  LODWORD(v37) = 1132068864;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 0, v37);
  LODWORD(v38) = 1144750080;
  -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v38);
  -[MKThemeMultiPartLabel setHidden:](self->_tertiaryLabel, "setHidden:", 1);
  v39 = objc_alloc_init(_MKUILabel);
  departureLabel = self->_departureLabel;
  self->_departureLabel = v39;

  -[_MKUILabel setAccessibilityIdentifier:](self->_departureLabel, "setAccessibilityIdentifier:", CFSTR("DepartureLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_departureLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel set_mapkit_themeColorProvider:](self->_departureLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_22);
  LODWORD(v41) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v41);
  v42 = objc_alloc_init(_MKUILabel);
  departureDetailLabel = self->_departureDetailLabel;
  self->_departureDetailLabel = v42;

  -[_MKUILabel setAccessibilityIdentifier:](self->_departureDetailLabel, "setAccessibilityIdentifier:", CFSTR("DepartureDetailLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_departureDetailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setHidden:](self->_departureDetailLabel, "setHidden:", 1);
  LODWORD(v44) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureDetailLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v44);
  LODWORD(v45) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v45);
  LODWORD(v46) = 1148846080;
  -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureDetailLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v46);
  v47 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v47, "setAccessibilityIdentifier:", CFSTR("LineImageContainer"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_lineImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v47, "addSubview:", self->_lineImageView);
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v47;
  objc_msgSend(v48, "addSubview:", v47);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.forward"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB558]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F8]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "fontDescriptorByAddingAttributes:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "fontWithDescriptor:size:", v54, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "imageWithConfiguration:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v57);
  disclosureArrowImageView = self->_disclosureArrowImageView;
  self->_disclosureArrowImageView = v58;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureArrowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_disclosureArrowImageView, "setTintColor:", v60);

  LODWORD(v61) = 1148846080;
  -[UIImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_disclosureArrowImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v61);
  LODWORD(v62) = 1148846080;
  -[UIImageView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_disclosureArrowImageView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v62);
  LODWORD(v63) = 1148846080;
  -[UIImageView _mapkit_setContentHuggingPriority:forAxis:](self->_disclosureArrowImageView, "_mapkit_setContentHuggingPriority:forAxis:", 1, v63);
  LODWORD(v64) = 1148846080;
  -[UIImageView _mapkit_setContentHuggingPriority:forAxis:](self->_disclosureArrowImageView, "_mapkit_setContentHuggingPriority:forAxis:", 0, v64);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addSubview:", self->_disclosureArrowImageView);

  -[_MKUILabel setAccessibilityElementsHidden:](self->_primaryLabel, "setAccessibilityElementsHidden:", 1);
  -[MKThemeMultiPartLabel setAccessibilityElementsHidden:](self->_secondaryLabel, "setAccessibilityElementsHidden:", 1);
  -[MKThemeMultiPartLabel setAccessibilityElementsHidden:](self->_tertiaryLabel, "setAccessibilityElementsHidden:", 1);
  -[_MKUILabel setAccessibilityElementsHidden:](self->_departureLabel, "setAccessibilityElementsHidden:", 1);
  -[_MKUILabel setAccessibilityElementsHidden:](self->_departureDetailLabel, "setAccessibilityElementsHidden:", 1);
  -[_MKUILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[MKMultiPartLabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  -[MKMultiPartLabel setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", 0);
  v66 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v67 = MEMORY[0x1E0C9AA60];
  v68 = (UIStackView *)objc_msgSend(v66, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  secondaryTextStackView = self->_secondaryTextStackView;
  self->_secondaryTextStackView = v68;

  -[UIStackView setAccessibilityIdentifier:](self->_secondaryTextStackView, "setAccessibilityIdentifier:", CFSTR("SecondaryTextStackView"));
  -[UIStackView setBaselineRelativeArrangement:](self->_secondaryTextStackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setAlignment:](self->_secondaryTextStackView, "setAlignment:", 1);
  v70 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithArrangedSubviews:", v67);
  departureStackView = self->_departureStackView;
  self->_departureStackView = v70;

  -[UIStackView setAccessibilityIdentifier:](self->_departureStackView, "setAccessibilityIdentifier:", CFSTR("DepartureStackView"));
  -[UIStackView setBaselineRelativeArrangement:](self->_departureStackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setAlignment:](self->_departureStackView, "setAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "contentInsets");
  v74 = v73;
  objc_msgSend(v72, "contentInsets");
  objc_msgSend(v72, "setContentInsets:", v74, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v72, 0);
  v75 = (UIButton *)objc_claimAutoreleasedReturnValue();
  incidentButton = self->_incidentButton;
  self->_incidentButton = v75;

  -[MKTransitDeparturesCell traitCollection](self, "traitCollection");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "userInterfaceIdiom");

  if (v78 == 5)
  {
    -[UIButton setPreferredBehavioralStyle:](self->_incidentButton, "setPreferredBehavioralStyle:", 1);
    v79 = self->_incidentButton;
    -[MKTransitDeparturesCell tintColor](self, "tintColor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v79, "setTitleColor:forState:", v80, 0);

  }
  objc_msgSend((id)objc_opt_class(), "defaultSecondaryFont");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_incidentButton, "titleLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setFont:", v81);

  if (MKIsHostedInSiri())
  {
    -[UIButton setEnabled:](self->_incidentButton, "setEnabled:", 0);
    v83 = self->_incidentButton;
    -[UIView mk_theme](self, "mk_theme");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "lightTextColor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v83, "setTitleColor:forState:", v85, 2);

  }
  -[UIButton titleLabel](self->_incidentButton, "titleLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setNumberOfLines:", 2);

  -[UIButton titleLabel](self->_incidentButton, "titleLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setLineBreakMode:", 4);

  -[UIButton titleLabel](self->_incidentButton, "titleLabel");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setTextAlignment:", 4);

  -[UIButton setContentHorizontalAlignment:](self->_incidentButton, "setContentHorizontalAlignment:", 4);
  -[UIButton addTarget:action:forControlEvents:](self->_incidentButton, "addTarget:action:forControlEvents:", self, sel__incidentButtonPressed, 64);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryTextStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView set_mk_axis:](self->_secondaryTextStackView, "set_mk_axis:", 1);
  -[UIStackView setDistribution:](self->_secondaryTextStackView, "setDistribution:", 0);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addSubview:", self->_secondaryTextStackView);

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_departureStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView set_mk_axis:](self->_departureStackView, "set_mk_axis:", 1);
  -[UIStackView setDistribution:](self->_departureStackView, "setDistribution:", 0);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addSubview:", self->_departureStackView);

  LODWORD(v91) = 1148813312;
  -[UIStackView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryTextStackView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v91);
  LODWORD(v92) = 1148829696;
  -[UIStackView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryTextStackView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v92);
  LODWORD(v93) = 1148846080;
  -[UIStackView _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryTextStackView, "_mapkit_setContentHuggingPriority:forAxis:", 1, v93);
  LODWORD(v94) = 1132068864;
  -[UIStackView _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryTextStackView, "_mapkit_setContentHuggingPriority:forAxis:", 0, v94);
  LODWORD(v95) = 1148846080;
  -[UIStackView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureStackView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v95);
  LODWORD(v96) = 1148846080;
  -[UIStackView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureStackView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v96);
  -[UIButton setHidden:](self->_incidentButton, "setHidden:", 1);
  -[UIButton setEnabled:](self->_incidentButton, "setEnabled:", MKIsHostedInSiri() ^ 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitDeparturesCell setSeparatorHidden:](self, "setSeparatorHidden:", 0);
  -[MKTransitDeparturesCell setUseCompressedGutter:](self, "setUseCompressedGutter:", 0);
  -[MKTransitDeparturesCell setUseCompressedLeading:](self, "setUseCompressedLeading:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  -[MKTransitDeparturesCell _updateLabelFonts](self, "_updateLabelFonts");
  -[MKTransitDeparturesCell _setCellStyle:](self, "_setCellStyle:", 0);

}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

- (void)updateConstraints
{
  NSMutableDictionary *constraintsByCellStyle;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSArray *v7;
  id *p_currentCellStyleConstraints;
  NSArray *currentCellStyleConstraints;
  BOOL v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  objc_super v14;

  constraintsByCellStyle = self->_constraintsByCellStyle;
  if (!constraintsByCellStyle)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v5 = self->_constraintsByCellStyle;
    self->_constraintsByCellStyle = v4;

    constraintsByCellStyle = self->_constraintsByCellStyle;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cellStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](constraintsByCellStyle, "objectForKeyedSubscript:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  p_currentCellStyleConstraints = (id *)&self->_currentCellStyleConstraints;
  currentCellStyleConstraints = self->_currentCellStyleConstraints;
  if (v7)
    v10 = v7 == currentCellStyleConstraints;
  else
    v10 = 0;
  if (!v10)
  {
    if (currentCellStyleConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      v11 = *p_currentCellStyleConstraints;
      *p_currentCellStyleConstraints = 0;

    }
    if (!v7)
    {
      -[NSMutableDictionary removeAllObjects](self->_constraintsByCellStyle, "removeAllObjects");
      -[MKTransitDeparturesCell _constraintsForCellStyle:](self, "_constraintsForCellStyle:", self->_cellStyle);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_constraintsByCellStyle;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cellStyle);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v7, v13);

    }
    objc_storeStrong(p_currentCellStyleConstraints, v7);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  }
  -[MKTransitDeparturesCell _updateConstraintValues](self, "_updateConstraintValues");
  v14.receiver = self;
  v14.super_class = (Class)MKTransitDeparturesCell;
  -[MKTransitDeparturesCell updateConstraints](&v14, sel_updateConstraints);

}

- (void)layoutSubviews
{
  void *v3;
  unint64_t v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  -[MKTransitDeparturesCell layoutSubviews](&v6, sel_layoutSubviews);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSubviews");

  v4 = -[MKTransitDeparturesCell _bestCellStyleForCurrentState](self, "_bestCellStyleForCurrentState");
  if (v4 != self->_cellStyle)
  {
    -[MKTransitDeparturesCell _setCellStyle:](self, "_setCellStyle:", v4);
    -[MKTransitDeparturesCell updateConstraints](self, "updateConstraints");
    v5.receiver = self;
    v5.super_class = (Class)MKTransitDeparturesCell;
    -[MKTransitDeparturesCell layoutSubviews](&v5, sel_layoutSubviews);
  }
}

- (void)setUseMultilineDeparturesLabel:(BOOL)a3
{
  if (self->_useMultilineDeparturesLabel != a3)
  {
    self->_useMultilineDeparturesLabel = a3;
    -[_MKUILabel setNumberOfLines:](self->_departureLabel, "setNumberOfLines:", !a3);
  }
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)qword_1ECE2D778;
  qword_1ECE2D778 = 0;

  v4 = (void *)qword_1ECE2D780;
  qword_1ECE2D780 = 0;

  v5 = (void *)qword_1ECE2D790;
  qword_1ECE2D790 = 0;

  v6 = (void *)qword_1ECE2D798;
  qword_1ECE2D798 = 0;

  v7 = (void *)qword_1ECE2D780;
  qword_1ECE2D780 = 0;

  v8 = (void *)qword_1ECE2D788;
  qword_1ECE2D788 = 0;

  -[MKTransitDeparturesCell _updateLabelFonts](self, "_updateLabelFonts");
  -[MKTransitDeparturesCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  unint64_t cellStyle;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  cellStyle = self->_cellStyle;
  v11 = -[MKTransitDeparturesCell _bestCellStyleForCurrentState](self, "_bestCellStyleForCurrentState");
  if (v11 != cellStyle)
  {
    -[MKTransitDeparturesCell _setCellStyle:](self, "_setCellStyle:", v11);
    -[UIView _mapkit_updateConstraintsIfNeeded](self, "_mapkit_updateConstraintsIfNeeded");
  }
  v16.receiver = self;
  v16.super_class = (Class)MKTransitDeparturesCell;
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[MKTransitDeparturesCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v16, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v12, v13);
  result.height = v15;
  result.width = v14;
  return result;
}

- (unint64_t)_bestCellStyleForCurrentState
{
  void *v3;
  NSString *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v5 = 2;
    goto LABEL_11;
  }
  -[MKMultiPartLabel text](self->_secondaryLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    goto LABEL_6;
  -[MKMultiPartLabel text](self->_tertiaryLabel, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {

LABEL_6:
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v12 = -[UIButton isHidden](self->_incidentButton, "isHidden");

  if (!v12)
    goto LABEL_7;
  -[_MKUILabel bounds](self->_primaryLabel, "bounds");
  v14 = v13;
  -[_MKUILabel textRectForBounds:limitedToNumberOfLines:](self->_primaryLabel, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  v16 = v15;
  -[_MKUILabel textRectForBounds:limitedToNumberOfLines:](self->_primaryLabel, "textRectForBounds:limitedToNumberOfLines:", 1, 0.0, 0.0, v14, 1.79769313e308);
  v8 = v16 == v17;
LABEL_8:
  -[_MKUILabel attributedText](self->_departureDetailLabel, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
    v5 = 0;
  else
    v5 = v8;
LABEL_11:

  return v5;
}

- (void)_setCellStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  UIStackView *v6;
  MKThemeMultiPartLabel *tertiaryLabel;
  void *v8;
  UIStackView *departureStackView;
  _MKUILabel *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIStackView *secondaryTextStackView;
  MKThemeMultiPartLabel *secondaryLabel;
  _MKUILabel *departureLabel;
  _MKUILabel *departureDetailLabel;
  UIButton *incidentButton;
  void *v31;
  _QWORD v32[6];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  self->_cellStyle = a3;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[_MKUILabel removeFromSuperview](self->_primaryLabel, "removeFromSuperview");
      -[_MKUILabel setTextAlignment:](self->_departureLabel, "setTextAlignment:", 4);
      -[_MKUILabel setTextAlignment:](self->_departureDetailLabel, "setTextAlignment:", 4);
      LODWORD(v16) = 1148829696;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v16);
      LODWORD(v17) = 1148829696;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v17);
      LODWORD(v18) = 1148829696;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v18);
      LODWORD(v19) = 1148829696;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v19);
      LODWORD(v20) = 1148829696;
      -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_departureDetailLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v20);
      LODWORD(v21) = 1148829696;
      -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_primaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v21);
      LODWORD(v22) = 1148846080;
      -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v22);
      LODWORD(v23) = 1148846080;
      -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v23);
      LODWORD(v24) = 1148846080;
      -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_departureLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v24);
      LODWORD(v25) = 1148846080;
      -[UIView _mapkit_setContentHuggingPriority:forAxis:](self->_departureDetailLabel, "_mapkit_setContentHuggingPriority:forAxis:", 1, v25);
      secondaryTextStackView = self->_secondaryTextStackView;
      secondaryLabel = self->_secondaryLabel;
      departureLabel = self->_departureLabel;
      departureDetailLabel = self->_departureDetailLabel;
      v32[0] = self->_primaryLabel;
      v32[1] = secondaryLabel;
      v32[2] = departureLabel;
      v32[3] = departureDetailLabel;
      incidentButton = self->_incidentButton;
      v32[4] = self->_tertiaryLabel;
      v32[5] = incidentButton;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView _mapkit_setArrangedSubviews:](secondaryTextStackView, "_mapkit_setArrangedSubviews:", v31);

      -[UIStackView _mapkit_setArrangedSubviews:](self->_departureStackView, "_mapkit_setArrangedSubviews:", MEMORY[0x1E0C9AA60]);
    }
  }
  else
  {
    -[MKTransitDeparturesCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_primaryLabel);

    if (MKApplicationLayoutDirectionIsRightToLeft())
      v5 = 0;
    else
      v5 = 2;
    -[_MKUILabel setTextAlignment:](self->_departureLabel, "setTextAlignment:", v5);
    -[_MKUILabel setTextAlignment:](self->_departureDetailLabel, "setTextAlignment:", -[_MKUILabel textAlignment](self->_departureLabel, "textAlignment"));
    v6 = self->_secondaryTextStackView;
    tertiaryLabel = self->_tertiaryLabel;
    v34[0] = self->_secondaryLabel;
    v34[1] = tertiaryLabel;
    v34[2] = self->_incidentButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView _mapkit_setArrangedSubviews:](v6, "_mapkit_setArrangedSubviews:", v8);

    departureStackView = self->_departureStackView;
    v10 = self->_departureDetailLabel;
    v33[0] = self->_departureLabel;
    v33[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView _mapkit_setArrangedSubviews:](departureStackView, "_mapkit_setArrangedSubviews:", v11);

    LODWORD(v12) = 1132068864;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1132068864;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v13);
    LODWORD(v14) = 1132068864;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_tertiaryLabel, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148829696;
    -[UIStackView _mapkit_setContentCompressionResistancePriority:forAxis:](self->_secondaryTextStackView, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v15);
  }
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (id)_constraintsForCellStyle:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *lineImageViewToBottomConstraint;
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
  NSLayoutConstraint *v21;
  NSLayoutConstraint *lineImageToContainerTrailingConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MKThemeMultiPartLabel *secondaryLabel;
  UIButton *incidentButton;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  BOOL v38;
  double v39;
  uint64_t v40;
  NSLayoutConstraint *v41;
  double v42;
  void *v43;
  void *v44;
  _MKUILabel *primaryLabel;
  MKThemeMultiPartLabel *v46;
  MKThemeMultiPartLabel *tertiaryLabel;
  UIButton *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *labelToDisclosureArrowConstraint;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSLayoutConstraint *departureStackViewToBottomConstraint;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSLayoutConstraint *primaryToTopConstraint;
  void *v80;
  uint64_t v81;
  NSLayoutConstraint *labelLeadingMarginConstraint;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSLayoutConstraint *secondaryStackToPrimaryConstraint;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  NSLayoutConstraint *secondaryStackToBottomConstraint;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  NSLayoutConstraint *primaryToBottomConstraint;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSLayoutConstraint *lineImageToTextGutterConstraint;
  double v112;
  NSMapTable *departureDependentConstraintsByView;
  NSLayoutConstraint *minimumDepartureLabelWidthConstraint;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSLayoutConstraint *v119;
  NSLayoutConstraint *v120;
  void *v121;
  void *v122;
  NSLayoutConstraint *v123;
  uint64_t v124;
  NSLayoutConstraint *v125;
  void *v126;
  void *v127;
  void *v128;
  NSLayoutConstraint *v129;
  NSLayoutConstraint *lineImageViewTopConstraint;
  void *v131;
  void *v132;
  NSLayoutConstraint *v133;
  NSLayoutConstraint *v134;
  void *v135;
  NSLayoutConstraint *v136;
  NSLayoutConstraint *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  NSLayoutConstraint *v142;
  NSLayoutConstraint *v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  MKThemeMultiPartLabel *v150;
  _MKUILabel *departureLabel;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t k;
  _MKUILabel *v157;
  int v158;
  UIImageView *disclosureArrowImageView;
  void *v160;
  void *v161;
  uint64_t v162;
  NSLayoutConstraint *v163;
  void *v164;
  void *v165;
  double v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  NSLayoutConstraint *v175;
  NSLayoutConstraint *departureStackViewTopToPrimaryTopConstraint;
  void *v177;
  UIImageView *lineImageView;
  void *v179;
  NSLayoutConstraint *v180;
  NSLayoutConstraint *lineImageViewCenteringConstraint;
  void *v182;
  NSLayoutConstraint *v183;
  NSLayoutConstraint *lineImageViewCenteringVerticalPaddingConstraint;
  void *v185;
  void *v187;
  unint64_t v188;
  void *v189;
  void *v190;
  MKTransitDeparturesCell *v191;
  void *v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[5];
  _BYTE v207[128];
  _QWORD v208[4];
  _BYTE v209[128];
  _QWORD v210[4];
  _BYTE v211[128];
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_lineImageView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lineImageViewToBottomConstraint = self->_lineImageViewToBottomConstraint;
  self->_lineImageViewToBottomConstraint = v9;

  objc_msgSend(v5, "addObject:", self->_lineImageViewToBottomConstraint);
  v11 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("_lineImageView"), self->_lineImageView, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_lineImageView]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  -[UIImageView leadingAnchor](self->_lineImageView, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView superview](self->_lineImageView, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  -[UIImageView trailingAnchor](self->_lineImageView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView superview](self->_lineImageView, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lineImageToContainerTrailingConstraint = self->_lineImageToContainerTrailingConstraint;
  self->_lineImageToContainerTrailingConstraint = v21;

  v190 = v5;
  objc_msgSend(v5, "addObject:", self->_lineImageToContainerTrailingConstraint);
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKTransitDeparturesCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v192 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = self;
  if (a3 > 1)
  {
    departureDependentConstraintsByView = self->_departureDependentConstraintsByView;
    self->_departureDependentConstraintsByView = 0;

    minimumDepartureLabelWidthConstraint = self->_minimumDepartureLabelWidthConstraint;
    self->_minimumDepartureLabelWidthConstraint = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

    v59 = v5;
  }
  else
  {
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v188 = a3;
    secondaryLabel = self->_secondaryLabel;
    v210[0] = self->_primaryLabel;
    v210[1] = secondaryLabel;
    incidentButton = self->_incidentButton;
    v210[2] = self->_tertiaryLabel;
    v210[3] = incidentButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v202, v211, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v203;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v203 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v202 + 1) + 8 * i), "trailingAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "constraintEqualToAnchor:constant:", v34, 0.0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v36) = 1148829696;
          objc_msgSend(v35, "setPriority:", v36);
          objc_msgSend(v190, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v202, v211, 16);
      }
      while (v31);
    }

    -[_MKUILabel widthAnchor](v191->_departureLabel, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[MKTransitDeparturesCell isInactive](v191, "isInactive");
    v39 = 0.0;
    if (!v38)
      objc_msgSend((id)objc_opt_class(), "_maxExpectedDepartureLabelWidth");
    objc_msgSend(v37, "constraintGreaterThanOrEqualToConstant:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v191->_minimumDepartureLabelWidthConstraint;
    v191->_minimumDepartureLabelWidthConstraint = (NSLayoutConstraint *)v40;

    LODWORD(v42) = 1148829696;
    -[NSLayoutConstraint setPriority:](v191->_minimumDepartureLabelWidthConstraint, "setPriority:", v42);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v191, sel__updateConstraintValues, *MEMORY[0x1E0C99720], 0);

    if (-[MKTransitDeparturesCell _shouldEnforceMinimumDepartureLabelWidth](v191, "_shouldEnforceMinimumDepartureLabelWidth"))
    {
      objc_msgSend(v190, "addObject:", v191->_minimumDepartureLabelWidthConstraint);
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = 0u;
    v199 = 0u;
    primaryLabel = v191->_primaryLabel;
    v200 = 0u;
    v201 = 0u;
    v46 = v191->_secondaryLabel;
    tertiaryLabel = v191->_tertiaryLabel;
    v208[0] = primaryLabel;
    v208[1] = v46;
    v48 = v191->_incidentButton;
    v208[2] = tertiaryLabel;
    v208[3] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v198, v209, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v199;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v199 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * j);
          -[UIStackView leadingAnchor](v191->_departureStackView, "leadingAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "trailingAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 12.0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v57, v54);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v198, v209, 16);
      }
      while (v51);
    }

    objc_storeStrong((id *)&v191->_departureDependentConstraintsByView, v44);
    v197 = 0;
    -[MKTransitDeparturesCell _getDepartureDependentConstraintsToActivate:toDeactivate:](v191, "_getDepartureDependentConstraintsToActivate:toDeactivate:", &v197, 0);
    v58 = v197;
    v59 = v190;
    if (objc_msgSend(v58, "count"))
      objc_msgSend(v190, "addObjectsFromArray:", v58);
    -[UIImageView firstBaselineAnchor](v191->_disclosureArrowImageView, "firstBaselineAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView firstBaselineAnchor](v191->_departureStackView, "firstBaselineAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, -1.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v62);

    -[UIImageView trailingAnchor](v191->_disclosureArrowImageView, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v192);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v64);

    -[UIImageView leadingAnchor](v191->_disclosureArrowImageView, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v191->_departureStackView, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 4.0);
    v67 = objc_claimAutoreleasedReturnValue();
    labelToDisclosureArrowConstraint = v191->_labelToDisclosureArrowConstraint;
    v191->_labelToDisclosureArrowConstraint = (NSLayoutConstraint *)v67;

    if ((-[UIImageView isHidden](v191->_disclosureArrowImageView, "isHidden") & 1) == 0)
      objc_msgSend(v190, "addObject:", v191->_labelToDisclosureArrowConstraint);
    -[UIStackView trailingAnchor](v191->_departureStackView, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "constraintGreaterThanOrEqualToAnchor:constant:", v69, 0.0);
    v187 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v190, "addObject:", v187);
    -[MKTransitDeparturesCell contentView](v191, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v191->_departureStackView, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:", v72);
    v73 = objc_claimAutoreleasedReturnValue();
    departureStackViewToBottomConstraint = v191->_departureStackViewToBottomConstraint;
    v191->_departureStackViewToBottomConstraint = (NSLayoutConstraint *)v73;

    objc_msgSend(v190, "addObject:", v191->_departureStackViewToBottomConstraint);
    -[_MKUILabel topAnchor](v191->_primaryLabel, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesCell contentView](v191, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v77);
    v78 = objc_claimAutoreleasedReturnValue();
    primaryToTopConstraint = v191->_primaryToTopConstraint;
    v191->_primaryToTopConstraint = (NSLayoutConstraint *)v78;

    objc_msgSend(v190, "addObject:", v191->_primaryToTopConstraint);
    -[_MKUILabel leadingAnchor](v191->_primaryLabel, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v189);
    v81 = objc_claimAutoreleasedReturnValue();
    labelLeadingMarginConstraint = v191->_labelLeadingMarginConstraint;
    v191->_labelLeadingMarginConstraint = (NSLayoutConstraint *)v81;

    objc_msgSend(v190, "addObject:", v191->_labelLeadingMarginConstraint);
    -[UIStackView leadingAnchor](v191->_secondaryTextStackView, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel leadingAnchor](v191->_primaryLabel, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v85);

    -[_MKUILabel trailingAnchor](v191->_primaryLabel, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "constraintGreaterThanOrEqualToAnchor:constant:", v86, 12.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v87);

    -[UIStackView topAnchor](v191->_secondaryTextStackView, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel topAnchor](v191->_departureLabel, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintGreaterThanOrEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v90);

    -[UIStackView trailingAnchor](v191->_secondaryTextStackView, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "constraintGreaterThanOrEqualToAnchor:constant:", v91, 0.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "addObject:", v92);

    -[UIStackView firstBaselineAnchor](v191->_secondaryTextStackView, "firstBaselineAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](v191->_primaryLabel, "lastBaselineAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 20.0);
    v95 = objc_claimAutoreleasedReturnValue();
    secondaryStackToPrimaryConstraint = v191->_secondaryStackToPrimaryConstraint;
    v191->_secondaryStackToPrimaryConstraint = (NSLayoutConstraint *)v95;

    objc_msgSend(v190, "addObject:", v191->_secondaryStackToPrimaryConstraint);
    -[MKTransitDeparturesCell contentView](v191, "contentView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "bottomAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView lastBaselineAnchor](v191->_secondaryTextStackView, "lastBaselineAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintGreaterThanOrEqualToAnchor:", v99);
    v100 = objc_claimAutoreleasedReturnValue();
    secondaryStackToBottomConstraint = v191->_secondaryStackToBottomConstraint;
    v191->_secondaryStackToBottomConstraint = (NSLayoutConstraint *)v100;

    objc_msgSend(v190, "addObject:", v191->_secondaryStackToBottomConstraint);
    -[MKTransitDeparturesCell contentView](v191, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bottomAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](v191->_primaryLabel, "lastBaselineAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintGreaterThanOrEqualToAnchor:", v104);
    v105 = objc_claimAutoreleasedReturnValue();
    primaryToBottomConstraint = v191->_primaryToBottomConstraint;
    v191->_primaryToBottomConstraint = (NSLayoutConstraint *)v105;

    objc_msgSend(v190, "addObject:", v191->_primaryToBottomConstraint);
    -[UIImageView superview](v191->_lineImageView, "superview");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel leadingAnchor](v191->_primaryLabel, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, -12.0);
    v110 = objc_claimAutoreleasedReturnValue();
    lineImageToTextGutterConstraint = v191->_lineImageToTextGutterConstraint;
    v191->_lineImageToTextGutterConstraint = (NSLayoutConstraint *)v110;

    LODWORD(v112) = 1148829696;
    -[NSLayoutConstraint setPriority:](v191->_lineImageToTextGutterConstraint, "setPriority:", v112);
    objc_msgSend(v190, "addObject:", v191->_lineImageToTextGutterConstraint);

    self = v191;
    a3 = v188;
  }
  switch(a3)
  {
    case 2uLL:
      -[UIImageView topAnchor](self->_lineImageView, "topAnchor");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesCell contentView](self, "contentView");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "topAnchor");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "constraintEqualToAnchor:", v128);
      v129 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      lineImageViewTopConstraint = self->_lineImageViewTopConstraint;
      self->_lineImageViewTopConstraint = v129;

      objc_msgSend(v190, "addObject:", self->_lineImageViewTopConstraint);
      -[UIStackView topAnchor](self->_secondaryTextStackView, "topAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView topAnchor](self->_lineImageView, "topAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "constraintEqualToAnchor:", v132);
      v133 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v134 = self->_primaryToTopConstraint;
      self->_primaryToTopConstraint = v133;

      objc_msgSend(v190, "addObject:", self->_primaryToTopConstraint);
      -[UIStackView leadingAnchor](self->_secondaryTextStackView, "leadingAnchor");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "constraintEqualToAnchor:", v189);
      v136 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v137 = self->_labelLeadingMarginConstraint;
      self->_labelLeadingMarginConstraint = v136;

      objc_msgSend(v190, "addObject:", self->_labelLeadingMarginConstraint);
      v138 = v190;
      -[UIImageView superview](self->_lineImageView, "superview");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "trailingAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView leadingAnchor](self->_secondaryTextStackView, "leadingAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:constant:", v141, -12.0);
      v142 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v143 = self->_lineImageToTextGutterConstraint;
      self->_lineImageToTextGutterConstraint = v142;

      LODWORD(v144) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_lineImageToTextGutterConstraint, "setPriority:", v144);
      objc_msgSend(v190, "addObject:", self->_lineImageToTextGutterConstraint);
      -[UIImageView firstBaselineAnchor](self->_disclosureArrowImageView, "firstBaselineAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "constraintEqualToAnchor:constant:", v146, -1.0);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "addObject:", v147);

      -[UIImageView trailingAnchor](self->_disclosureArrowImageView, "trailingAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "constraintEqualToAnchor:", v192);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "addObject:", v149);

      v195 = 0u;
      v196 = 0u;
      v193 = 0u;
      v194 = 0u;
      v150 = self->_secondaryLabel;
      v206[0] = self->_primaryLabel;
      v206[1] = v150;
      departureLabel = self->_departureLabel;
      v206[2] = self->_tertiaryLabel;
      v206[3] = departureLabel;
      v206[4] = self->_departureDetailLabel;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v206, 5);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v193, v207, 16);
      if (v153)
      {
        v154 = v153;
        v155 = *(_QWORD *)v194;
        do
        {
          for (k = 0; k != v154; ++k)
          {
            if (*(_QWORD *)v194 != v155)
              objc_enumerationMutation(v152);
            v157 = *(_MKUILabel **)(*((_QWORD *)&v193 + 1) + 8 * k);
            if (v157 == self->_primaryLabel && (disclosureArrowImageView = self->_disclosureArrowImageView) != 0)
            {
              -[UIImageView leadingAnchor](disclosureArrowImageView, "leadingAnchor");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKUILabel trailingAnchor](self->_primaryLabel, "trailingAnchor");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "constraintEqualToAnchor:constant:", v161, 4.0);
              v162 = objc_claimAutoreleasedReturnValue();
              v163 = v191->_labelToDisclosureArrowConstraint;
              v191->_labelToDisclosureArrowConstraint = (NSLayoutConstraint *)v162;

              self = v191;
              v138 = v190;
              objc_msgSend(v190, "addObject:", v191->_labelToDisclosureArrowConstraint);
              v158 = 1148829696;
            }
            else
            {
              v158 = 1148846080;
            }
            -[_MKUILabel trailingAnchor](v157, "trailingAnchor");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "constraintEqualToAnchor:", v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v166) = v158;
            objc_msgSend(v165, "setPriority:", v166);
            objc_msgSend(v138, "addObject:", v165);

          }
          v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v193, v207, 16);
        }
        while (v154);
      }

      -[UIStackView trailingAnchor](self->_secondaryTextStackView, "trailingAnchor");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "constraintEqualToAnchor:", v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addObject:", v168);

      -[MKTransitDeparturesCell contentView](self, "contentView");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "bottomAnchor");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView bottomAnchor](self->_secondaryTextStackView, "bottomAnchor");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "constraintEqualToAnchor:constant:", v171, 8.0);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "addObject:", v172);

      v59 = v190;
      break;
    case 1uLL:
      -[UIStackView topAnchor](self->_departureStackView, "topAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel topAnchor](self->_primaryLabel, "topAnchor");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "constraintEqualToAnchor:", v174);
      v175 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      departureStackViewTopToPrimaryTopConstraint = self->_departureStackViewTopToPrimaryTopConstraint;
      self->_departureStackViewTopToPrimaryTopConstraint = v175;

      objc_msgSend(v190, "addObject:", self->_departureStackViewTopToPrimaryTopConstraint);
      v177 = (void *)MEMORY[0x1E0CB3718];
      lineImageView = self->_lineImageView;
      -[MKTransitDeparturesCell contentView](self, "contentView");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", lineImageView, 20, 0, v179, 20, 1.0, 0.0);
      v180 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      lineImageViewCenteringConstraint = self->_lineImageViewCenteringConstraint;
      self->_lineImageViewCenteringConstraint = v180;

      v59 = v190;
      objc_msgSend(v190, "addObject:", self->_lineImageViewCenteringConstraint);
      -[UIImageView topAnchor](self->_lineImageView, "topAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesCell contentView](self, "contentView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "topAnchor");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "constraintGreaterThanOrEqualToAnchor:", v182);
      v183 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v124 = 1256;
      lineImageViewCenteringVerticalPaddingConstraint = self->_lineImageViewCenteringVerticalPaddingConstraint;
      self->_lineImageViewCenteringVerticalPaddingConstraint = v183;

      goto LABEL_43;
    case 0uLL:
      -[UIImageView topAnchor](self->_lineImageView, "topAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesCell contentView](self, "contentView");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "topAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "constraintEqualToAnchor:", v118);
      v119 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v120 = self->_lineImageViewTopConstraint;
      self->_lineImageViewTopConstraint = v119;

      v59 = v190;
      objc_msgSend(v190, "addObject:", self->_lineImageViewTopConstraint);
      -[UIStackView topAnchor](self->_departureStackView, "topAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel topAnchor](self->_primaryLabel, "topAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "constraintEqualToAnchor:", v122);
      v123 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v124 = 1240;
      v125 = self->_departureStackViewTopToPrimaryTopConstraint;
      self->_departureStackViewTopToPrimaryTopConstraint = v123;

LABEL_43:
      objc_msgSend(v59, "addObject:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v124));
      break;
  }
  v185 = (void *)objc_msgSend(v59, "copy");

  return v185;
}

- (void)_updateConstraintValues
{
  void *v3;
  _BOOL4 v4;
  double v5;
  unint64_t cellStyle;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[4];
  id v51;
  MKTransitDeparturesCell *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultSecondaryFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_lineHeight");
  -[UIStackView setSpacing:](self->_secondaryTextStackView, "setSpacing:");
  v4 = -[MKTransitDeparturesCell useCompressedGutter](self, "useCompressedGutter");
  v5 = -12.0;
  if (v4)
    v5 = -8.0;
  -[NSLayoutConstraint setConstant:](self->_lineImageToTextGutterConstraint, "setConstant:", v5);
  cellStyle = self->_cellStyle;
  v7 = 23.0;
  if (cellStyle)
  {
    if (cellStyle == 2)
    {
      -[_MKUILabel font](self->_primaryLabel, "font");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_mapkit_lineHeight");
      v36 = v35;
      -[_MKUILabel font](self->_primaryLabel, "font");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "ascender");
      -[NSLayoutConstraint setConstant:](self->_primaryToTopConstraint, "setConstant:", -(v36 - v38));

      -[UIStackView arrangedSubviews](self->_secondaryTextStackView, "arrangedSubviews");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __50__MKTransitDeparturesCell__updateConstraintValues__block_invoke;
      v50[3] = &unk_1E20DCE88;
      v52 = self;
      v53 = v40;
      v51 = v39;
      v41 = v39;
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", v50);

      goto LABEL_31;
    }
    if (cellStyle != 1)
      goto LABEL_31;
    -[MKTransitDeparturesCell _labelToTopScaledConstantForFullCenteredCellStyle](self, "_labelToTopScaledConstantForFullCenteredCellStyle");
    v9 = v8;
    if (self->_cellStyle == 1)
    {
      -[MKTransitDeparturesCell _labelToBottomScaledConstantForFullCenteredCellStyle](self, "_labelToBottomScaledConstantForFullCenteredCellStyle");
      v7 = v10;
    }
  }
  else
  {
    v9 = 35.0;
  }
  objc_msgSend((id)objc_opt_class(), "_primaryFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", v9);
  v13 = v12;
  -[MKTransitDeparturesCell _separatorHeight](self, "_separatorHeight");
  v15 = v13 - v14;
  objc_msgSend((id)objc_opt_class(), "_primaryFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointSize");
  -[NSLayoutConstraint setConstant:](self->_primaryToTopConstraint, "setConstant:", v15 - v17);

  objc_msgSend(v3, "_scaledValueForValue:", 20.0);
  -[NSLayoutConstraint setConstant:](self->_secondaryStackToPrimaryConstraint, "setConstant:");
  objc_msgSend(v3, "_scaledValueForValue:", v7);
  v19 = v18;
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled")
    && -[UIStackView isHidden](self->_secondaryTextStackView, "isHidden"))
  {
    v19 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_secondaryStackToBottomConstraint, "setConstant:", v19);
  objc_msgSend((id)objc_opt_class(), "_primaryFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_scaledValueForValue:", v7);
  -[NSLayoutConstraint setConstant:](self->_primaryToBottomConstraint, "setConstant:");

  objc_msgSend((id)objc_opt_class(), "_maxExpectedDepartureLabelWidth");
  -[NSLayoutConstraint setConstant:](self->_minimumDepartureLabelWidthConstraint, "setConstant:");
  -[NSLayoutConstraint setActive:](self->_minimumDepartureLabelWidthConstraint, "setActive:", -[MKTransitDeparturesCell _shouldEnforceMinimumDepartureLabelWidth](self, "_shouldEnforceMinimumDepartureLabelWidth"));
  if (-[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden"))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = v21;
    if (self->_primaryToBottomConstraint)
      objc_msgSend(v21, "addObject:");
    if (self->_secondaryStackToBottomConstraint)
      objc_msgSend(v22, "addObject:");
    if (self->_departureStackViewToBottomConstraint)
      objc_msgSend(v22, "addObject:");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v28, "constant");
          v30 = v29 + -8.0;
          v31 = 0.0;
          if (v30 >= 0.0)
          {
            objc_msgSend(v28, "constant", 0.0);
            v31 = v32 + -8.0;
          }
          objc_msgSend(v28, "setConstant:", v31);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v25);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_departureDetailLabelFont");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_scaledValueForValue:", 20.0);
  -[UIStackView setSpacing:](self->_departureStackView, "setSpacing:");

  -[NSLayoutConstraint constant](self->_secondaryStackToBottomConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_departureStackViewToBottomConstraint, "setConstant:");
  -[UIStackView setCustomSpacing:afterView:](self->_secondaryTextStackView, "setCustomSpacing:afterView:", self->_primaryLabel, 3.40282347e38);
  -[UIStackView setCustomSpacing:afterView:](self->_secondaryTextStackView, "setCustomSpacing:afterView:", self->_secondaryLabel, 3.40282347e38);
  -[UIStackView setCustomSpacing:afterView:](self->_secondaryTextStackView, "setCustomSpacing:afterView:", self->_tertiaryLabel, 3.40282347e38);
LABEL_31:
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
  {
    -[UIImageView image](self->_lineImageView, "image");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "size");
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");

  }
  else
  {
    -[MKTransitDeparturesCell lineImageViewSize](self, "lineImageViewSize");
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");
  }
  -[NSLayoutConstraint setConstant:](self->_lineImageToContainerTrailingConstraint, "setConstant:", self->_lineImageCenteringValue);
  if (-[NSLayoutConstraint isActive](self->_incidentIconHorizontalConstraint, "isActive"))
  {
    v43 = 10.0;
    if (!-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
    {
      -[UIImageView image](self->_incidentIconImageView, "image");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "size");
      v43 = v45;

    }
    -[UIImageView image](self->_lineImageView, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "size");
    v48 = v47;

    v49 = 2.0;
    if (v43 >= v48)
      UIRoundToViewScale();
    -[NSLayoutConstraint setConstant:](self->_incidentIconHorizontalConstraint, "setConstant:", v49);
  }
  -[NSLayoutConstraint setActive:](self->_secondaryStackToBottomConstraint, "setActive:", -[MKTransitDeparturesCell _shouldPinSecondaryStackViewToBottom](self, "_shouldPinSecondaryStackViewToBottom"));
  -[NSLayoutConstraint setActive:](self->_labelToDisclosureArrowConstraint, "setActive:", -[UIImageView isHidden](self->_disclosureArrowImageView, "isHidden") ^ 1);
  -[MKTransitDeparturesCell _updateDepartureDependentConstraintsForCurrentState](self, "_updateDepartureDependentConstraintsForCurrentState");
  -[MKTransitDeparturesCell _updateLineImageViewConstraintConstants](self, "_updateLineImageViewConstraintConstants");

}

void __50__MKTransitDeparturesCell__updateConstraintValues__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3 + 1;
  if (a3 + 1 != *(_QWORD *)(a1 + 48))
  {
    v9 = v5;
    v7 = 0;
    do
    {
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v7, "isHidden"))
        break;
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_baselineSpacingAboveView:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "setCustomSpacing:afterView:", v9);

    v5 = v9;
  }

}

- (double)_baselineSpacingAboveView:(id)a3
{
  UIButton *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = (UIButton *)a3;
  -[MKTransitDeparturesCell _fontForView:](self, "_fontForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((UIButton *)self->_departureLabel == v4)
    {
      v6 = 3.0;
    }
    else
    {
      v6 = 0.0;
      if (self->_incidentButton == v4)
      {
        -[UIButton configuration](v4, "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contentInsets");
        v6 = v8 + 3.0;

      }
    }
    objc_msgSend(v5, "_scaledValueForValue:", v6);
    v11 = v10;
    objc_msgSend(v5, "_mapkit_lineHeight");
    v9 = v11 + v12;
  }
  else
  {
    v9 = 3.40282347e38;
  }

  return v9;
}

- (id)_fontForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "titleLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "font");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
LABEL_7:
      v4 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (void)_updateLineImageViewConstraintConstants
{
  unint64_t cellStyle;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  NSLayoutConstraint **p_lineImageViewToBottomConstraint;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  cellStyle = self->_cellStyle;
  if (cellStyle < 2)
  {
    -[UIImageView image](self->_lineImageView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;

    -[MKTransitDeparturesCell _separatorHeight](self, "_separatorHeight");
    v8 = v7;
    if (v6 >= 35.0)
    {
      objc_msgSend((id)objc_opt_class(), "_primaryFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v6 < 40.0)
      {
        objc_msgSend(v9, "_mapkit_scaledValueForValue:", 21.5);
        UIRoundToViewScale();
        goto LABEL_10;
      }
      v11 = 19.0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_primaryFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 23.0;
    }
    objc_msgSend(v9, "_mapkit_scaledValueForValue:", v11);
LABEL_10:
    v15 = v14 - v8;
    -[NSLayoutConstraint setConstant:](self->_lineImageViewCenteringVerticalPaddingConstraint, "setConstant:", v15);
    p_lineImageViewToBottomConstraint = &self->_lineImageViewToBottomConstraint;
    -[NSLayoutConstraint setConstant:](self->_lineImageViewToBottomConstraint, "setConstant:", v15);
    -[NSLayoutConstraint setConstant:](self->_lineImageViewTopConstraint, "setConstant:", v15);

    v13 = 0.0;
    if (-[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden"))
    {
      -[NSLayoutConstraint constant](*p_lineImageViewToBottomConstraint, "constant");
      if (v16 + -8.0 >= 0.0)
      {
        -[NSLayoutConstraint constant](*p_lineImageViewToBottomConstraint, "constant");
        v13 = v17 + -8.0;
      }
    }
    goto LABEL_13;
  }
  if (cellStyle != 2)
    return;
  -[NSLayoutConstraint setConstant:](self->_lineImageViewTopConstraint, "setConstant:", 12.0);
  p_lineImageViewToBottomConstraint = &self->_lineImageViewToBottomConstraint;
  v13 = 8.0;
LABEL_13:
  -[NSLayoutConstraint setConstant:](*p_lineImageViewToBottomConstraint, "setConstant:", v13);
}

- (BOOL)_shouldEnforceDepartureDependentConstraints
{
  return self->_cellStyle != 2
      && -[MKTransitDeparturesCell _isDisplayingDepartureInfo](self, "_isDisplayingDepartureInfo");
}

- (BOOL)_shouldEnforceMinimumDepartureLabelWidth
{
  return self->_enforceMinimumDepartureLabelWidth
      && !-[MKTransitDeparturesCell isInactive](self, "isInactive")
      && self->_cellStyle != 2;
}

- (BOOL)_isDisplayingDepartureInfo
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_MKUILabel attributedText](self->_departureLabel, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[_MKUILabel attributedText](self->_departureDetailLabel, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (BOOL)_shouldPinSecondaryStackViewToBottom
{
  BOOL v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_cellStyle == 2)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIStackView arrangedSubviews](self->_secondaryTextStackView, "arrangedSubviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isHidden") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "attributedText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
            goto LABEL_18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_15;
          objc_msgSend(v9, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;
        v12 = objc_msgSend(v10, "length");

        if (v12)
        {
LABEL_18:
          v2 = 1;
          goto LABEL_19;
        }
      }
LABEL_15:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }
  v2 = 0;
LABEL_19:

  return v2;
}

- (void)_getDepartureDependentConstraintsToActivate:(id *)a3 toDeactivate:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  MKThemeMultiPartLabel *secondaryLabel;
  UIButton *incidentButton;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _BOOL8 v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (!-[NSMapTable count](self->_departureDependentConstraintsByView, "count"))
    return;
  if (!-[MKTransitDeparturesCell _shouldEnforceDepartureDependentConstraints](self, "_shouldEnforceDepartureDependentConstraints"))
  {
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[NSMapTable objectEnumerator](self->_departureDependentConstraintsByView, "objectEnumerator");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deactivateConstraints:", v19);

    return;
  }
  -[_MKUILabel attributedText](self->_departureLabel, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[_MKUILabel attributedText](self->_departureDetailLabel, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = 1;
  if (v8)
    v11 = 2;
  if (v10)
    v12 = v11;
  else
    v12 = v8 != 0;
  secondaryLabel = self->_secondaryLabel;
  v27[0] = self->_primaryLabel;
  v27[1] = secondaryLabel;
  incidentButton = self->_incidentButton;
  v27[2] = self->_tertiaryLabel;
  v27[3] = incidentButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    v16 = 0;
    if (a4)
      goto LABEL_10;
LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  if (!a4)
    goto LABEL_13;
LABEL_10:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
LABEL_14:
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__MKTransitDeparturesCell__getDepartureDependentConstraintsToActivate_toDeactivate___block_invoke;
  v23[3] = &unk_1E20DCEB0;
  v23[4] = self;
  v20 = v16;
  v24 = v20;
  v26 = v12;
  v21 = v17;
  v25 = v21;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
  if (a4)
    *a4 = objc_retainAutorelease(v21);
  if (a3)
    *a3 = objc_retainAutorelease(v20);

}

void __84__MKTransitDeparturesCell__getDepartureDependentConstraintsToActivate_toDeactivate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id *)(a1 + 40);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56)
      || objc_msgSend(v5, "isHidden"))
    {
      v4 = (id *)(a1 + 48);
    }
    objc_msgSend(*v4, "addObject:", v3);
  }

}

- (void)_updateDepartureDependentConstraintsForCurrentState
{
  id v2;
  id v3;
  id v4;
  id v5;

  v4 = 0;
  v5 = 0;
  -[MKTransitDeparturesCell _getDepartureDependentConstraintsToActivate:toDeactivate:](self, "_getDepartureDependentConstraintsToActivate:toDeactivate:", &v5, &v4);
  v2 = v5;
  v3 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3);
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v2);

}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesCell;
  -[UIView infoCardThemeChanged](&v5, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_lineImageView, "setTintColor:", v4);

  -[MKTransitDeparturesCell refreshDeparturesDisplay](self, "refreshDeparturesDisplay");
}

- (void)_updateLabelFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_primaryFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_primaryLabel, "setFont:", v3);

  objc_msgSend((id)objc_opt_class(), "defaultSecondaryFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel setFont:](self->_secondaryLabel, "setFont:", v4);

  objc_msgSend((id)objc_opt_class(), "defaultSecondaryFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMultiPartLabel setFont:](self->_tertiaryLabel, "setFont:", v5);

  objc_msgSend((id)objc_opt_class(), "_departureLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_departureLabel, "setFont:", v6);

  objc_msgSend((id)objc_opt_class(), "_departureDetailLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](self->_departureDetailLabel, "setFont:", v7);

  objc_msgSend((id)objc_opt_class(), "defaultSecondaryFont");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_incidentButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

}

- (double)_separatorHeight
{
  void *v2;
  double v3;
  double v4;

  -[MKTransitDeparturesCell _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = 1.0 / v3;

  return v4;
}

- (void)setLineImage:(id)a3
{
  void *v5;

  -[UIImageView setImage:](self->_lineImageView, "setImage:");
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
  {
    -[UIImageView image](self->_lineImageView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");

    -[NSLayoutConstraint setActive:](self->_lineImageViewHeightConstraint, "setActive:", a3 != 0);
  }
  -[MKTransitDeparturesCell _updateLineImageViewConstraintConstants](self, "_updateLineImageViewConstraintConstants");
}

- (void)setPrimaryText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sPrimaryLabelParagraphStyle;
  if (!sPrimaryLabelParagraphStyle)
  {
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    LODWORD(v8) = 1008981770;
    objc_msgSend(v7, "setHyphenationFactor:", v8);
    v9 = (void *)sPrimaryLabelParagraphStyle;
    sPrimaryLabelParagraphStyle = (uint64_t)v7;

    v5 = sPrimaryLabelParagraphStyle;
  }
  v12 = *MEMORY[0x1E0CEA0D0];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v10);
    -[_MKUILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v11);

  }
  else
  {
    -[_MKUILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", 0);
  }

}

- (void)setSecondaryText:(id)a3
{
  MKThemeMultiPartLabel *secondaryLabel;
  id v5;
  void *v6;

  secondaryLabel = self->_secondaryLabel;
  v5 = a3;
  LODWORD(secondaryLabel) = -[MKThemeMultiPartLabel isHidden](secondaryLabel, "isHidden");
  -[MKMultiPartLabel setMultiPartString:](self->_secondaryLabel, "setMultiPartString:", v5);

  -[MKMultiPartLabel text](self->_secondaryLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKThemeMultiPartLabel setHidden:](self->_secondaryLabel, "setHidden:", objc_msgSend(v6, "length") == 0);

  if ((_DWORD)secondaryLabel != -[MKThemeMultiPartLabel isHidden](self->_secondaryLabel, "isHidden"))
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (void)setTertiaryText:(id)a3
{
  MKThemeMultiPartLabel *tertiaryLabel;
  id v5;
  void *v6;

  tertiaryLabel = self->_tertiaryLabel;
  v5 = a3;
  LODWORD(tertiaryLabel) = -[MKThemeMultiPartLabel isHidden](tertiaryLabel, "isHidden");
  -[MKMultiPartLabel setMultiPartString:](self->_tertiaryLabel, "setMultiPartString:", v5);

  -[MKMultiPartLabel text](self->_tertiaryLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKThemeMultiPartLabel setHidden:](self->_tertiaryLabel, "setHidden:", objc_msgSend(v6, "length") == 0);

  if ((_DWORD)tertiaryLabel != -[MKThemeMultiPartLabel isHidden](self->_tertiaryLabel, "isHidden"))
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (void)setShowDisclosureArrow:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[UIImageView isHidden](self->_disclosureArrowImageView, "isHidden") == a3)
  {
    -[UIImageView setHidden:](self->_disclosureArrowImageView, "setHidden:", !v3);
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  }
}

- (void)refreshDeparturesDisplay
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MKServerFormattedStringParameters *v25;
  MKServerFormattedStringParameters *v26;
  MKServerFormattedString *v27;
  void *v28;
  MKServerFormattedString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MKTransitDeparturesCell _displayableDeparturesCount](self, "_displayableDeparturesCount");
  -[MKTransitDeparturesCell departures](self, "departures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "liveStatus");
  if (self->_departureStyle == 1 && v6 == 3)
    v8 = 2;
  else
    v8 = v6;
  v9 = -[MKTransitDeparturesCell departureStyle](self, "departureStyle");
  if (v9 - 2 > 3)
  {
    v10 = 1;
    if (!v3)
      goto LABEL_15;
  }
  else
  {
    v10 = qword_18B2AF538[v9 - 2];
    if (!v3)
      goto LABEL_15;
  }
  if (v10 == 2)
  {
    self->_enforceMinimumDepartureLabelWidth = 0;
    if ((unint64_t)(v8 - 1) >= 2)
      objc_msgSend(v5, "scheduledDepartureDate");
    else
      objc_msgSend(v5, "liveDepartureDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    -[MKTransitDeparturesCell departureTimeZone](self, "departureTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_stringFromTimestampDate:departureTimeZone:", v3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled");
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "_mapkit_attributedLiveTransitStringFromDepartureString:departure:darkMode:", v18, v5, v19);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v5, "liveStatusString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v15 = 0;
    }
    else
    {
      v21 = (void *)objc_opt_class();
      objc_msgSend(v5, "liveDepartureDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesCell departureTimeZone](self, "departureTimeZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_stringFromTimestampDate:departureTimeZone:", v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  if (v10 != 1)
  {
    v15 = 0;
    v3 = 0;
    goto LABEL_28;
  }
  self->_enforceMinimumDepartureLabelWidth = 1;
  v11 = (void *)objc_opt_class();
  -[MKTransitDeparturesCell _departureDates](self, "_departureDates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell countdownReferenceDate](self, "countdownReferenceDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_attributedStringForCountdownDepartures:referenceDate:isShowingNoConnectionEmDash:", v12, v13, -[MKTransitDeparturesCell isShowingNoConnectionEmDash](self, "isShowingNoConnectionEmDash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_15:
    v15 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "_mapkit_attributedLiveTransitStringFromAttributedDepartureString:liveStatus:darkMode:symbolOverrideColor:", v3, v8, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_27:

  v3 = (void *)v14;
LABEL_28:
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 4)
    goto LABEL_34;
  objc_msgSend(v5, "liveStatusString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(v5, "departureDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      MKTransitLiveDepartureColorForViewWithLiveStatus(self, v8);
      v26 = (MKServerFormattedStringParameters *)objc_claimAutoreleasedReturnValue();
      v41 = *MEMORY[0x1E0CEA0A0];
      v42[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", v8, v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v34, "initWithString:attributes:", v35, v33);

      goto LABEL_33;
    }
LABEL_34:
    v31 = 0;
    goto LABEL_35;
  }
  v39 = 0u;
  v40 = 0u;
  MKFormattedStringOptionsMakeDefault((uint64_t)&v39);
  v25 = [MKServerFormattedStringParameters alloc];
  v38[0] = v39;
  v38[1] = v40;
  v26 = -[MKServerFormattedStringParameters initWithOptions:variableOverrides:](v25, "initWithOptions:variableOverrides:", v38, 0);
  v27 = [MKServerFormattedString alloc];
  objc_msgSend(v5, "liveStatusString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MKServerFormattedString initWithGeoServerString:parameters:](v27, "initWithGeoServerString:parameters:", v28, v26);

  -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v29, "multiPartAttributedStringWithAttributes:", MEMORY[0x1E0C9AA70]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "attributedString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
LABEL_35:
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled")
    && !objc_msgSend(v3, "length")
    && -[NSString length](self->_frequency, "length"))
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_frequency);

    v3 = (void *)v36;
  }
  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled")
    && !objc_msgSend(v3, "length")
    && -[NSString length](self->_operatingHours, "length"))
  {
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_operatingHours);

    v3 = (void *)v37;
  }
  -[_MKUILabel setHidden:](self->_departureDetailLabel, "setHidden:", objc_msgSend(v31, "length") == 0);
  -[_MKUILabel setHidden:](self->_departureLabel, "setHidden:", objc_msgSend(v3, "length") == 0);
  -[_MKUILabel setAttributedText:](self->_departureLabel, "setAttributedText:", v3);
  -[_MKUILabel setAttributedText:](self->_departureDetailLabel, "setAttributedText:", v31);
  -[MKTransitDeparturesCell _updateDepartureDependentConstraintsForCurrentState](self, "_updateDepartureDependentConstraintsForCurrentState");
  -[NSLayoutConstraint setActive:](self->_minimumDepartureLabelWidthConstraint, "setActive:", -[MKTransitDeparturesCell _shouldEnforceMinimumDepartureLabelWidth](self, "_shouldEnforceMinimumDepartureLabelWidth"));

}

- (void)setAccessibilityOrder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[7];

  v39[5] = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[_MKUILabel text](self->_primaryLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v39[0] = v6;
  -[MKMultiPartLabel text](self->_secondaryLabel, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v39[1] = v10;
  -[_MKUILabel text](self->_departureLabel, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v39[2] = v14;
  -[_MKUILabel text](self->_departureDetailLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  v39[3] = v18;
  -[MKMultiPartLabel text](self->_tertiaryLabel, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  v39[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if ((v31 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,"), v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "appendString:", v32);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v26);
  }

  -[MKTransitDeparturesCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v33);
}

+ (id)_stringFromTimestampDate:(id)a3 departureTimeZone:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v5 = a4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0C99D48];
    v7 = a3;
    objc_msgSend(v6, "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v5)
      v10 = v5;
    else
      v10 = v9;
    v11 = qword_1ECE2D7A8;
    v12 = v10;
    if (v11 != -1)
      dispatch_once(&qword_1ECE2D7A8, &__block_literal_global_81);
    objc_msgSend((id)qword_1ECE2D7A0, "setTimeZone:", v12);

    objc_msgSend((id)qword_1ECE2D7A0, "stringFromDate:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __70__MKTransitDeparturesCell__stringFromTimestampDate_departureTimeZone___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECE2D7A0;
  qword_1ECE2D7A0 = (uint64_t)v0;

  v2 = (void *)qword_1ECE2D7A0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)qword_1ECE2D7A0, "setDateStyle:", 0);
  return objc_msgSend((id)qword_1ECE2D7A0, "setTimeStyle:", 1);
}

+ (id)_stringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char IsRightToLeft;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 2;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v10 = (void *)objc_msgSend(v9, "initWithCapacity:", v34[3]);
  v11 = (void *)objc_opt_class();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__MKTransitDeparturesCell__stringForCountdownDepartures_referenceDate_isShowingNoConnectionEmDash___block_invoke;
  v25[3] = &unk_1E20DCEF8;
  v27 = &v29;
  v28 = &v33;
  v12 = v10;
  v26 = v12;
  objc_msgSend(v11, "_enumerateMinutesUntilDepartureDates:withReferenceDate:block:", v7, v8, v25);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "_mapkit_componentsJoinedInCommaDelimitedList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _MKLocalizedStringFromThisBundle(CFSTR("%@ min [PlaceCard, Transit, Departures, Countdown]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MKLocalizedStringFromThisBundle(CFSTR("min [PlaceCard, Transit, Departures, Countdown, Unit]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v16, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v18);

  }
  if (*((_BYTE *)v30 + 24))
  {
    +[MKTransitDeparturesCell _nowString](MKTransitDeparturesCell, "_nowString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertObject:atIndex:", v19, 0);

  }
  v20 = objc_msgSend(v12, "count");
  if (v5 && v20 + (unint64_t)*((unsigned __int8 *)v30 + 24) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("—"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((IsRightToLeft & 1) != 0)
      v22 = 0;
    else
      v22 = objc_msgSend(v13, "count");
    objc_msgSend(v13, "insertObject:atIndex:", v21, v22);

  }
  objc_msgSend(v13, "_mapkit_componentsJoinedInCommaDelimitedList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __99__MKTransitDeparturesCell__stringForCountdownDepartures_referenceDate_isShowingNoConnectionEmDash___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

+ (id)_attributedStringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0CEA098];
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_departureLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_stringForCountdownDepartures:referenceDate:isShowingNoConnectionEmDash:", v9, v8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v11);
  objc_msgSend(a1, "_addEmDashAttributes:", v13);
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (void)setLineImageViewSize:(double)a3
{
  if (self->_lineImageViewSize != a3)
  {
    self->_lineImageViewSize = a3;
    if (!-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
    {
      -[MKTransitDeparturesCell lineImageViewSize](self, "lineImageViewSize");
      -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
      -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");
    }
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  }
}

- (void)setShowNoConnectionEnDash:(BOOL)a3
{
  if (self->_showNoConnectionEmDash != a3)
    self->_showNoConnectionEmDash = a3;
}

- (void)setCountdownReferenceDate:(id)a3
{
  NSDate **p_countdownReferenceDate;
  id v5;

  p_countdownReferenceDate = &self->_countdownReferenceDate;
  v5 = a3;
  if (!-[NSDate isEqualToDate:](*p_countdownReferenceDate, "isEqualToDate:"))
    objc_storeStrong((id *)p_countdownReferenceDate, a3);

}

- (void)setDepartures:(id)a3
{
  NSArray **p_departures;
  id v5;

  p_departures = &self->_departures;
  v5 = a3;
  if ((-[NSArray isEqual:](*p_departures, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_departures, a3);

}

- (void)setOperatingHours:(id)a3
{
  NSString **p_operatingHours;
  id v5;

  p_operatingHours = &self->_operatingHours;
  v5 = a3;
  if ((-[NSString isEqual:](*p_operatingHours, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_operatingHours, a3);

}

- (void)setFrequency:(id)a3
{
  NSString **p_frequency;
  id v5;

  p_frequency = &self->_frequency;
  v5 = a3;
  if ((-[NSString isEqual:](*p_frequency, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_frequency, a3);

}

+ (id)displayableCountdowDepartureDatesFromDates:(id)a3 withReferenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  char v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__MKTransitDeparturesCell_displayableCountdowDepartureDatesFromDates_withReferenceDate___block_invoke;
  v11[3] = &unk_1E20DCF20;
  v13 = v15;
  v9 = v8;
  v12 = v9;
  v14 = 2;
  objc_msgSend(a1, "_enumerateMinutesUntilDepartureDates:withReferenceDate:block:", v6, v7, v11);

  _Block_object_dispose(v15, 8);
  return v9;
}

void __88__MKTransitDeparturesCell_displayableCountdowDepartureDatesFromDates_withReferenceDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v7 = a2;
  v9 = v7;
  if (a3)
    goto LABEL_2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(a1 + 48))
    *a4 = 1;

}

+ (id)_nowString
{
  return _MKLocalizedStringFromThisBundle(CFSTR("TransitDeparture_Now"));
}

+ (void)_enumerateMinutesUntilDepartureDates:(id)a3 withReferenceDate:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, uint64_t, _BYTE *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, uint64_t, _BYTE *))a5;
  if (v9)
  {
    v23 = 0;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        objc_msgSend(v15, "timeIntervalSinceDate:", v8, (_QWORD)v19);
        v17 = v16;
        if ((GEOTransitDepartureIsImminentDepartureTimeInterval() & 1) != 0 || (uint64_t)v17 < -59)
          v18 = 0;
        else
          v18 = (uint64_t)v17 / 60;
        v9[2](v9, v15, v18, &v23);
        if (v23)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v12)
            goto LABEL_6;
          break;
        }
      }
    }

  }
}

- (id)_departureDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MKTransitDeparturesCell departures](self, "departures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MKTransitDeparturesCell departures](self, "departures", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "departureDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isCanceled") & 1) == 0 && v12)
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (unint64_t)_displayableDeparturesCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  char v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = (void *)objc_opt_class();
  -[MKTransitDeparturesCell _departureDates](self, "_departureDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesCell countdownReferenceDate](self, "countdownReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MKTransitDeparturesCell__displayableDeparturesCount__block_invoke;
  v9[3] = &unk_1E20DCF48;
  v9[4] = v14;
  v9[5] = &v10;
  objc_msgSend(v3, "_enumerateMinutesUntilDepartureDates:withReferenceDate:block:", v4, v5, v9);

  v6 = -[MKTransitDeparturesCell departureStyle](self, "departureStyle");
  if (v6 > 5 || ((1 << v6) & 0x34) == 0)
  {
    if (-[MKTransitDeparturesCell isShowingNoConnectionEmDash](self, "isShowingNoConnectionEmDash"))
      ++v11[3];
  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v7;
}

uint64_t __54__MKTransitDeparturesCell__displayableDeparturesCount__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a3)
    goto LABEL_2;
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
LABEL_2:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  }
  return result;
}

+ (void)_addEmDashAttributes:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("—"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = v5;
    v8 = *MEMORY[0x1E0CEA0A0];
    +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lightTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAttribute:value:range:", v8, v10, v6, v7);

  }
}

- (id)_incidentIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MKTransitDeparturesCell window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scale");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");

  }
  return MKTransitIncidentIcon();
}

- (void)_addIncidentIcon
{
  UIImageView *v3;
  UIImageView *incidentIconImageView;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *incidentIconHorizontalConstraint;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!self->_incidentIconImageView)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    incidentIconImageView = self->_incidentIconImageView;
    self->_incidentIconImageView = v3;

    -[UIImageView setAccessibilityIdentifier:](self->_incidentIconImageView, "setAccessibilityIdentifier:", CFSTR("IncidentIconImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
      v5 = 1;
    else
      v5 = 4;
    -[UIImageView setContentMode:](self->_incidentIconImageView, "setContentMode:", v5);
    -[MKTransitDeparturesCell _incidentIcon](self, "_incidentIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_incidentIconImageView, "setImage:", v6);

  }
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_incidentIconImageView);

  if (-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
  {
    -[UIImageView heightAnchor](self->_incidentIconImageView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 10.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setActive:", 1);
    -[UIImageView widthAnchor](self->_incidentIconImageView, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_incidentIconImageView, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

  }
  incidentIconHorizontalConstraint = self->_incidentIconHorizontalConstraint;
  if (!incidentIconHorizontalConstraint)
  {
    -[UIImageView trailingAnchor](self->_incidentIconImageView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](self->_lineImageView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v17 = self->_incidentIconHorizontalConstraint;
    self->_incidentIconHorizontalConstraint = v16;

    incidentIconHorizontalConstraint = self->_incidentIconHorizontalConstraint;
  }
  v18 = (void *)MEMORY[0x1E0CB3718];
  v23[0] = incidentIconHorizontalConstraint;
  -[UIImageView bottomAnchor](self->_incidentIconImageView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_lineImageView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 4.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v22);

  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
}

- (void)_removeIncidentIcon
{
  -[UIImageView removeFromSuperview](self->_incidentIconImageView, "removeFromSuperview");
}

- (void)setShowIncidentIcon:(BOOL)a3
{
  if (self->_showIncidentIcon != a3)
  {
    self->_showIncidentIcon = a3;
    if (a3)
      -[MKTransitDeparturesCell _addIncidentIcon](self, "_addIncidentIcon");
    else
      -[MKTransitDeparturesCell _removeIncidentIcon](self, "_removeIncidentIcon");
  }
}

- (void)setIncidentTitle:(id)a3
{
  NSString *v4;
  NSString *incidentTitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  incidentTitle = self->_incidentTitle;
  if (incidentTitle != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](incidentTitle, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_incidentTitle;
      self->_incidentTitle = v7;

      -[MKTransitDeparturesCell setIncidentButtonHidden:](self, "setIncidentButtonHidden:", -[NSString length](self->_incidentTitle, "length") == 0);
      v4 = v9;
    }
  }

}

- (void)_incidentButtonPressed
{
  id v3;

  -[MKTransitDeparturesCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incidentButtonSelectedInDeparturesCell:", self);

}

- (void)setIncidentButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  UIButton *incidentButton;
  id v6;

  v3 = a3;
  if (-[UIButton isHidden](self->_incidentButton, "isHidden") != a3)
  {
    -[UIButton setHidden:](self->_incidentButton, "setHidden:", v3);
    if (!v3)
    {
      incidentButton = self->_incidentButton;
      -[MKTransitDeparturesCell incidentTitle](self, "incidentTitle");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](incidentButton, "setTitle:forState:", v6, 0);

    }
  }
}

+ (double)maxLineImageWidthforWidth:(double)a3
{
  double result;

  result = a3 * 0.150000006;
  if (result < 22.0)
    return 22.0;
  return result;
}

- (double)_labelMarginWithLineImageViewWidth:(double)a3
{
  void *v5;
  double result;

  if (!-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
    return a3 + 12.0;
  -[UIImageView image](self->_lineImageView, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  result = a3 + 12.0;
  if (!v5)
    return 0.0;
  return result;
}

+ (BOOL)_needsUpdateMaxLabelWidths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v2 = (void *)_MergedGlobals_3_6;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {
    v4 = (void *)qword_1ECE2D770;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

+ (void)_calculateMaxLabelWidths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *MEMORY[0x1E0D27928]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_attributedStringForCountdownDepartures:referenceDate:isShowingNoConnectionEmDash:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v7;
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CEA098];
  v38 = *MEMORY[0x1E0CEA098];
  objc_msgSend(a1, "_departureLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  v11 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithAttributes:", v12);
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stringFromTimestampDate:departureTimeZone:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0.0;
  while (1)
  {

    if (v17 > 5 || ((1 << v17) & 0x35) == 0)
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", v17, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v36 = v9;
      objc_msgSend(a1, "_departureDetailLabelFont");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v19;
      objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sizeWithAttributes:", v20);
      if (v18 <= v21)
      {
        v34 = v9;
        objc_msgSend(a1, "_departureDetailLabelFont");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v22;
        objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v23 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sizeWithAttributes:", v24);
        v18 = v25;

        v11 = v23;
      }

    }
    ++v17;
  }
  if (v14 <= v18)
    *(double *)&v26 = v18;
  else
    *(double *)&v26 = v14;
  qword_1ECE2D7B0 = v26;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)_MergedGlobals_3_6;
  _MergedGlobals_3_6 = v27;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "preferredContentSizeCategory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copy");
  v32 = (void *)qword_1ECE2D770;
  qword_1ECE2D770 = v31;

}

+ (double)_maxExpectedDepartureLabelWidth
{
  if (objc_msgSend(a1, "_needsUpdateMaxLabelWidths"))
    objc_msgSend(a1, "_calculateMaxLabelWidths");
  return *(double *)&qword_1ECE2D7B0;
}

+ (double)_minTextWidth
{
  return 200.0;
}

+ (void)useCompressedGutter:(BOOL *)a3 compressedLeading:(BOOL *)a4 forImageWidth:(double)a5 inWidth:(double)a6
{
  BOOL *v8;
  double v10;
  double v11;

  v8 = a4;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  objc_msgSend((id)objc_opt_class(), "_minTextWidth");
  v11 = a6 - v10 - a5;
  if (v11 + -12.0 < 0.0)
  {
    if (v11 + -8.0 >= 0.0)
    {
      v8 = a3;
      if (!a3)
        return;
    }
    else
    {
      if (a3)
        *a3 = 1;
      if (!v8)
        return;
    }
    *v8 = 1;
  }
}

- (void)setUseCompressedGutter:(BOOL)a3
{
  NSLayoutConstraint *lineImageToTextGutterConstraint;
  double v4;

  if (self->_useCompressedGutter != a3)
  {
    self->_useCompressedGutter = a3;
    lineImageToTextGutterConstraint = self->_lineImageToTextGutterConstraint;
    v4 = -12.0;
    if (a3)
      v4 = -8.0;
    -[NSLayoutConstraint setConstant:](lineImageToTextGutterConstraint, "setConstant:", v4);
  }
}

- (void)setUseCompressedLeading:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int *v7;
  id *p_lineImageCompressedLeadingConstraint;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  if (self->_useCompressedLeading == a3)
  {
    if (self->_useCompressedLeading)
      v4 = 1312;
    else
      v4 = 1304;
    if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + v4))
      return;
  }
  else
  {
    self->_useCompressedLeading = a3;
  }
  -[MKTransitDeparturesCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_useCompressedLeading)
  {
    v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageLeadingConstraint;
    p_lineImageCompressedLeadingConstraint = (id *)&self->_lineImageCompressedLeadingConstraint;
    if (!self->_lineImageCompressedLeadingConstraint)
    {
      v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageLeadingConstraint;
      -[UIImageView leadingAnchor](self->_lineImageView, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 12.0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *p_lineImageCompressedLeadingConstraint;
      *p_lineImageCompressedLeadingConstraint = (id)v10;

      LODWORD(v12) = 1148813312;
      objc_msgSend(*p_lineImageCompressedLeadingConstraint, "setPriority:", v12);
    }
  }
  else
  {
    v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageCompressedLeadingConstraint;
    p_lineImageCompressedLeadingConstraint = (id *)&self->_lineImageLeadingConstraint;
    if (!self->_lineImageLeadingConstraint)
    {
      v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageCompressedLeadingConstraint;
      -[UIImageView leadingAnchor](self->_lineImageView, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v16);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_lineImageCompressedLeadingConstraint;
      *p_lineImageCompressedLeadingConstraint = (id)v14;

    }
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7), "setActive:", 0);
  objc_msgSend(*p_lineImageCompressedLeadingConstraint, "setActive:", 1);

}

- (double)labelMargin
{
  double result;

  -[MKTransitDeparturesCell lineImageViewSize](self, "lineImageViewSize");
  -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
  return result;
}

+ (id)strongSecondaryFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1ECE2D790;
  if (!qword_1ECE2D790)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 32770);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECE2D790;
    qword_1ECE2D790 = v3;

    v2 = (void *)qword_1ECE2D790;
  }
  return v2;
}

+ (id)defaultSecondaryFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1ECE2D798;
  if (!qword_1ECE2D798)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 0x8000);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECE2D798;
    qword_1ECE2D798 = v3;

    v2 = (void *)qword_1ECE2D798;
  }
  return v2;
}

+ (id)_departureLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1ECE2D780;
  if (!qword_1ECE2D780)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB538], 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECE2D780;
    qword_1ECE2D780 = v3;

    v2 = (void *)qword_1ECE2D780;
  }
  return v2;
}

+ (id)_departureDetailLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1ECE2D788;
  if (!qword_1ECE2D788)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E0CEB590], 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECE2D788;
    qword_1ECE2D788 = v3;

    v2 = (void *)qword_1ECE2D788;
  }
  return v2;
}

+ (id)_primaryFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1ECE2D778;
  if (!qword_1ECE2D778)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB538]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECE2D778;
    qword_1ECE2D778 = v3;

    v2 = (void *)qword_1ECE2D778;
  }
  return v2;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden");
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  -[MKCustomSeparatorCell setSeparatorHidden:](&v6, sel_setSeparatorHidden_, v3);
  if (v5 != -[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden"))
    -[MKTransitDeparturesCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (BOOL)_newStationCardUIEnabled
{
  return 1;
}

- (double)_labelToTopScaledConstantForFullCenteredCellStyle
{
  void *v3;
  double result;

  if (!-[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled"))
    return 45.0;
  -[UIImageView image](self->_lineImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  result = 37.0;
  if (!v3)
    return 29.0;
  return result;
}

- (double)_labelToBottomScaledConstantForFullCenteredCellStyle
{
  _BOOL4 v2;
  double result;

  v2 = -[MKTransitDeparturesCell _newStationCardUIEnabled](self, "_newStationCardUIEnabled");
  result = 33.0;
  if (v2)
    return 17.0;
  return result;
}

- (double)lineImageViewSize
{
  return self->_lineImageViewSize;
}

- (NSArray)departures
{
  return self->_departures;
}

- (unint64_t)departureStyle
{
  return self->_departureStyle;
}

- (void)setDepartureStyle:(unint64_t)a3
{
  self->_departureStyle = a3;
}

- (NSDate)countdownReferenceDate
{
  return self->_countdownReferenceDate;
}

- (NSTimeZone)departureTimeZone
{
  return self->_departureTimeZone;
}

- (void)setDepartureTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_departureTimeZone, a3);
}

- (BOOL)isShowingNoConnectionEmDash
{
  return self->_showNoConnectionEmDash;
}

- (void)setShowNoConnectionEmDash:(BOOL)a3
{
  self->_showNoConnectionEmDash = a3;
}

- (BOOL)isShowingIncidentIcon
{
  return self->_showIncidentIcon;
}

- (NSString)incidentTitle
{
  return self->_incidentTitle;
}

- (MKTransitDeparturesCellDelegate)delegate
{
  return (MKTransitDeparturesCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (NSString)operatingHours
{
  return self->_operatingHours;
}

- (NSString)frequency
{
  return self->_frequency;
}

- (BOOL)useCompressedGutter
{
  return self->_useCompressedGutter;
}

- (BOOL)useCompressedLeading
{
  return self->_useCompressedLeading;
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (void)setDepartureCutoffDate:(id)a3
{
  objc_storeStrong((id *)&self->_departureCutoffDate, a3);
}

- (BOOL)useMultilineDeparturesLabel
{
  return self->_useMultilineDeparturesLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_operatingHours, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentTitle, 0);
  objc_storeStrong((id *)&self->_departureTimeZone, 0);
  objc_storeStrong((id *)&self->_countdownReferenceDate, 0);
  objc_storeStrong((id *)&self->_departures, 0);
  objc_storeStrong((id *)&self->_lineImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelToDisclosureArrowConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureArrowImageView, 0);
  objc_storeStrong((id *)&self->_lineImageCompressedLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageToTextGutterConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStackToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStackToPrimaryConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_incidentIconHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewCenteringVerticalPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewCenteringConstraint, 0);
  objc_storeStrong((id *)&self->_departureStackViewTopToPrimaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_departureStackViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageToContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_departureDependentConstraintsByView, 0);
  objc_storeStrong((id *)&self->_minimumDepartureLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTextStackView, 0);
  objc_storeStrong((id *)&self->_departureStackView, 0);
  objc_storeStrong((id *)&self->_departureDetailLabel, 0);
  objc_storeStrong((id *)&self->_departureLabel, 0);
  objc_storeStrong((id *)&self->_incidentButton, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_incidentIconImageView, 0);
  objc_storeStrong((id *)&self->_lineImageView, 0);
  objc_storeStrong((id *)&self->_currentCellStyleConstraints, 0);
  objc_storeStrong((id *)&self->_constraintsByCellStyle, 0);
}

@end
