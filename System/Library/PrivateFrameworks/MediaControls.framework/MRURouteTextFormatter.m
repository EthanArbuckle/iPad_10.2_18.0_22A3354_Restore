@implementation MRURouteTextFormatter

- (MRURouteTextFormatter)initWithConfiguration:(id)a3
{
  id v5;
  MRURouteTextFormatter *v6;
  MRURouteTextFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRURouteTextFormatter;
  v6 = -[MRURouteTextFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (MRURouteTextFormatter)init
{
  MRURouteTextFormatterConfiguration *v3;
  MRURouteTextFormatter *v4;

  v3 = objc_alloc_init(MRURouteTextFormatterConfiguration);
  v4 = -[MRURouteTextFormatter initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (id)textForRoute:(id)a3 textBoundingWidth:(double)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  __CFString *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isAppleTVRoute"))
  {
    objc_msgSend(v6, "designatedGroupLeaderName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v6, "isDeviceRoute") || v8)
  {
    objc_msgSend(v6, "designatedGroupLeaderName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C4E8], "localDeviceLocalizedName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (!-[__CFString length](v9, "length")
    || !objc_msgSend(v6, "isAirPlayingToDevice")
    || !objc_msgSend(v6, "isProxyGroupPlayer"))
  {
    if (objc_msgSend(v6, "isDeviceRoute") && objc_msgSend(v6, "numberOfOutputDevices") <= 1)
    {

      v10 = (__CFString *)v6;
      v15 = -[MRURouteTextFormatterConfiguration usesPredictedOutputDevice](self->_configuration, "usesPredictedOutputDevice");
      if (v10
        && v15
        && (-[__CFString predictedOutputDevice](v10, "predictedOutputDevice"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            v16))
      {
        -[__CFString predictedOutputDevice](v10, "predictedOutputDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "routeName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[__CFString routeName](v10, "routeName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v19 = objc_msgSend(v6, "isSplitRoute");

      if (!v19)
      {
        objc_msgSend(v6, "routeNames");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v10 = &stru_1E581FBA8;
        goto LABEL_28;
      }
      +[MRUStringsProvider routeNameHeadphonesCount:](MRUStringsProvider, "routeNameHeadphonesCount:", objc_msgSend(v6, "numberOfOutputDevices"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_26:

    goto LABEL_27;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "routeNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  v14 = objc_msgSend(v13, "indexOfObject:", v10);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "removeObjectAtIndex:", v14);
  if (-[MRURouteTextFormatterConfiguration omitGroupLeaderName](self->_configuration, "omitGroupLeaderName"))
    goto LABEL_26;
LABEL_28:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
  -[MRURouteTextFormatter bestStringForRouteNames:designatedGroupLeaderName:thatFitsWidth:](self, "bestStringForRouteNames:designatedGroupLeaderName:thatFitsWidth:", v20, v10, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)textForRoute:(id)a3
{
  MRURouteTextFormatterConfiguration *configuration;
  id v5;
  void *v6;

  configuration = self->_configuration;
  v5 = a3;
  -[MRURouteTextFormatterConfiguration textBoundingWidth](configuration, "textBoundingWidth");
  -[MRURouteTextFormatter textForRoute:textBoundingWidth:](self, "textForRoute:textBoundingWidth:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)textForRouteNames:(id)a3 textBoundingWidth:(double)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteTextFormatter bestStringForRouteNames:designatedGroupLeaderName:thatFitsWidth:](self, "bestStringForRouteNames:designatedGroupLeaderName:thatFitsWidth:", v6, &stru_1E581FBA8, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)textForRouteNames:(id)a3
{
  MRURouteTextFormatterConfiguration *configuration;
  id v5;
  void *v6;

  configuration = self->_configuration;
  v5 = a3;
  -[MRURouteTextFormatterConfiguration textBoundingWidth](configuration, "textBoundingWidth");
  -[MRURouteTextFormatter textForRouteNames:textBoundingWidth:](self, "textForRouteNames:textBoundingWidth:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestStringForRouteNames:(id)a3 designatedGroupLeaderName:(id)a4 thatFitsWidth:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  unsigned int (**v16)(void *, void *, id);
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  int64_t v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  int v34;
  __CFString *v35;
  _BOOL4 v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  __CFString *v49;
  unint64_t v50;
  unint64_t v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  MRURouteTextFormatter *v60;
  id v61;
  unsigned int (**v62)(void *, void *, id);
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  __CFString *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  _QWORD aBlock[5];
  id v76;
  double v77;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteTextFormatter routeNamesSortedAlphanumeric:](self, "routeNamesSortedAlphanumeric:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v8;
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteTextFormatter routeNamesSortedLength:](self, "routeNamesSortedLength:", v12);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v9, "copy");
  -[MRURouteTextFormatter plusSeparatedRouteNames:](self, "plusSeparatedRouteNames:", v11);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke;
  aBlock[3] = &unk_1E5818FC0;
  aBlock[4] = self;
  v15 = v9;
  v76 = v15;
  v77 = a5;
  v16 = (unsigned int (**)(void *, void *, id))_Block_copy(aBlock);
  v56 = v11;
  if (v16[2](v16, v13, v14))
  {
    v17 = v14;
    -[MRURouteTextFormatter formattedRouteNameForDesignatedGroupLeaderName:truncatedDesignatedGroupLeaderName:routeNamesText:](self, "formattedRouteNameForDesignatedGroupLeaderName:truncatedDesignatedGroupLeaderName:routeNamesText:", v15, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
    -[MRURouteTextFormatter configuration](self, "configuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURouteTextFormatter text:displayAsSiriSuggestion:](self, "text:displayAsSiriSuggestion:", v18, objc_msgSend(v39, "displayAsSiriSuggestion"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v19 = objc_msgSend(v13, "length");
  v20 = v19
      - 2
      * -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount");
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy_;
  v69 = __Block_byref_object_dispose_;
  v70 = &stru_1E581FBA8;
  if (v20 >= 1)
  {
    v21 = v14;
    while (1)
    {
      v22 = objc_msgSend(v15, "isEqualToString:", v13) ? 1 : 2;
      -[MRURouteTextFormatter truncateText:by:](self, "truncateText:by:", v13, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      -[MRURouteTextFormatter plusSeparatedRouteNames:](self, "plusSeparatedRouteNames:", v57);
      v24 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v23;
      v25 = (void *)v66[5];
      v66[5] = v24;

      if (v16[2](v16, (void *)v23, (id)v66[5]))
        break;
      if (!--v20)
        goto LABEL_12;
    }
    *((_BYTE *)v72 + 24) = 1;
    v14 = (__CFString *)(id)v66[5];

  }
LABEL_12:
  if (*((_BYTE *)v72 + 24))
    goto LABEL_22;
  if (-[MRURouteTextFormatterConfiguration allowsMultitruncation](self->_configuration, "allowsMultitruncation"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v57);
    v27 = v14;
    objc_msgSend(v26, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");
    v30 = -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount");

    *((_BYTE *)v72 + 24) = 0;
    v31 = (void *)v66[5];
    v66[5] = (uint64_t)&stru_1E581FBA8;

    if (v29 - 2 * v30 >= 1)
    {
      v32 = ~(2 * v30) + v29;
      do
      {
        v33 = v32;
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke_7;
        v58[3] = &unk_1E5818FE8;
        v59 = v26;
        v60 = self;
        v63 = &v65;
        v62 = v16;
        v61 = v13;
        v64 = &v71;
        objc_msgSend(v57, "enumerateObjectsUsingBlock:", v58);
        v34 = *((unsigned __int8 *)v72 + 24);
        if (*((_BYTE *)v72 + 24))
        {
          v35 = (__CFString *)(id)v66[5];

          v27 = v35;
        }

        if (v34)
          break;
        v32 = v33 - 1;
      }
      while (v33);
    }

    v11 = v56;
    v14 = v27;
  }
  if (*((_BYTE *)v72 + 24))
  {
LABEL_22:
    v17 = v14;
    v36 = 0;
  }
  else
  {
    objc_msgSend(v11, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
      v44 = v43;
    }
    else
    {
      +[MRUStringsProvider routeName:plusCount:](MRUStringsProvider, "routeName:plusCount:", v43, objc_msgSend(v11, "count") - 1);
      v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    v45 = v44;
    if (((unsigned int (*)(unsigned int (**)(void *, void *, id), void *))v16[2])(v16, v13))
    {
      v46 = v45;
      v47 = v14;
      v36 = 0;
      v48 = v43;
    }
    else
    {
      v54 = v14;
      objc_msgSend(v11, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = &stru_1E581FBA8;
      v50 = 1;
      while (1)
      {
        v51 = objc_msgSend(v48, "length");
        v36 = v50 > v51;
        if (v50 > v51)
          break;
        -[MRURouteTextFormatter truncateText:by:](self, "truncateText:by:", v48, v50);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v56, "count") < 2)
        {
          v49 = v52;
        }
        else
        {
          +[MRUStringsProvider routeName:plusCount:](MRUStringsProvider, "routeName:plusCount:", v52, objc_msgSend(v56, "count") - 1);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        ++v50;
        if (v16[2](v16, v13, v49))
        {
          v53 = v49;
          v49 = v53;
          goto LABEL_43;
        }
      }
      objc_msgSend(v56, "firstObject");
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_43:
      v46 = v53;

      v47 = v49;
    }

    v17 = v46;
  }
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  -[MRURouteTextFormatter formattedRouteNameForDesignatedGroupLeaderName:truncatedDesignatedGroupLeaderName:routeNamesText:](self, "formattedRouteNameForDesignatedGroupLeaderName:truncatedDesignatedGroupLeaderName:routeNamesText:", v15, v13, v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v37;
  if (!v36 || !objc_msgSend(v37, "length"))
    goto LABEL_28;
  v38 = 0;
  while (1)
  {
    -[MRURouteTextFormatter truncateText:by:](self, "truncateText:by:", v18, ++v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURouteTextFormatter configuration](self, "configuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURouteTextFormatter text:displayAsSiriSuggestion:](self, "text:displayAsSiriSuggestion:", v39, objc_msgSend(v40, "displayAsSiriSuggestion"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MRURouteTextFormatter text:fitsInWidth:](self, "text:fitsInWidth:", v41, a5))
      break;

    if (v38 >= objc_msgSend(v18, "length"))
      goto LABEL_28;
  }
LABEL_29:

  return v41;
}

uint64_t __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "formattedRouteNameForDesignatedGroupLeaderName:truncatedDesignatedGroupLeaderName:routeNamesText:", *(_QWORD *)(a1 + 40), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text:displayAsSiriSuggestion:", v4, objc_msgSend(v6, "displayAsSiriSuggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "text:fitsInWidth:", v7, *(double *)(a1 + 48));
  return v8;
}

void __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
    objc_msgSend(*(id *)(a1 + 40), "truncateText:by:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v13, a3);

    objc_msgSend(*(id *)(a1 + 40), "plusSeparatedRouteNames:", *(_QWORD *)(a1 + 32));
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

- (id)text:(id)a3 displayAsSiriSuggestion:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    +[MRUStringsProvider nowPlayingSiriSuggestion:](MRUStringsProvider, "nowPlayingSiriSuggestion:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (int64_t)compareLength:(id)a3 with:(id)a4
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

- (id)routeNamesSortedAlphanumeric:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_11);
}

uint64_t __54__MRURouteTextFormatter_routeNamesSortedAlphanumeric___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (id)routeNamesSortedLength:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MRURouteTextFormatter_routeNamesSortedLength___block_invoke;
  v4[3] = &unk_1E5819050;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__MRURouteTextFormatter_routeNamesSortedLength___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareLength:with:", a2, a3);
}

- (id)plusSeparatedRouteNames:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MRURouteTextFormatter routeNamesSortedAlphanumeric:](self, "routeNamesSortedAlphanumeric:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider routeNamePlusSeparator](MRUStringsProvider, "routeNamePlusSeparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedRouteNameForDesignatedGroupLeaderName:(id)a3 truncatedDesignatedGroupLeaderName:(id)a4 routeNamesText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "copy");
  -[MRURouteTextFormatter marketingNames](self, "marketingNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v8);

  if (v13)
    v14 = v8;
  else
    v14 = v9;
  v15 = v14;
  if (objc_msgSend(v11, "length") && objc_msgSend(v15, "length"))
  {
    +[MRUStringsProvider routeNameArrowFormat:rightSideText:](MRUStringsProvider, "routeNameArrowFormat:rightSideText:", v15, v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v15, "length"))
  {
    if (v15)
      v17 = v15;
    else
      v17 = v10;
    v16 = v17;
  }
  else
  {
    if (!objc_msgSend(v10, "length"))
      goto LABEL_15;
    v16 = v10;
  }
  v18 = v16;

  v11 = v18;
LABEL_15:
  if (-[MRURouteTextFormatterConfiguration forcesUppercaseText](self->_configuration, "forcesUppercaseText"))
  {
    v31 = v10;
    objc_msgSend(v11, "localizedUppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[MRURouteTextFormatter marketingNames](self, "marketingNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v27 = objc_msgSend(v11, "rangeOfString:", v26);
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v20, "replaceCharactersInRange:withString:", v27, v28, v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    v29 = objc_msgSend(v20, "copy");
    v11 = (void *)v29;
    v10 = v31;
  }

  return v11;
}

- (CGSize)sizeForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3;
  -[MRURouteTextFormatterConfiguration font](self->_configuration, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MRURouteTextFormatterConfiguration font](self->_configuration, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mru_textSizeForFont:boundingSize:", v6, 1.79769313e308, 1.79769313e308);
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)text:(id)a3 fitsInWidth:(double)a4
{
  double v5;
  double v7;

  -[MRURouteTextFormatter sizeForText:](self, "sizeForText:", a3);
  if (v5 < a4)
    return 1;
  v7 = v5 - a4;
  if (v7 < 0.0)
    v7 = -v7;
  return v7 < 0.00000011920929;
}

- (id)marketingNames
{
  if (marketingNames_onceToken != -1)
    dispatch_once(&marketingNames_onceToken, &__block_literal_global_14);
  return (id)marketingNames_marketingNames;
}

void __39__MRURouteTextFormatter_marketingNames__block_invoke()
{
  void *v0;

  v0 = (void *)marketingNames_marketingNames;
  marketingNames_marketingNames = (uint64_t)&unk_1E5878498;

}

- (id)truncateText:(id)a3 by:(int64_t)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;

  v6 = a3;
  v7 = -[MRURouteTextFormatterConfiguration truncationMode](self->_configuration, "truncationMode");
  if (v7)
  {
    if (v7 != 1)
    {
      v17 = 0;
      goto LABEL_13;
    }
    v8 = objc_msgSend(v6, "length");
    if (v8
       - (a4
        + 2
        * -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount")) <= 0)
    {
      v9 = objc_msgSend(v6, "length");
      a4 = v9
         - 2
         * -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount");
    }
    v10 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v6, "length") * 0.5);
    v11 = (double)a4 * 0.5;
    v12 = (uint64_t)(v11 + (double)v10);
    objc_msgSend(v6, "substringWithRange:", 0, (uint64_t)((double)v10 - v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringWithRange:", v12, (int)objc_msgSend(v6, "length") - v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    +[MRUStringsProvider routeNameEllipsisString](MRUStringsProvider, "routeNameEllipsisString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@%@"), v13, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = objc_msgSend(v6, "length");
    v19 = v18 - a4;
    if (v19 < -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount"))
    {
      v20 = -[MRURouteTextFormatterConfiguration minimumEndCharacterCount](self->_configuration, "minimumEndCharacterCount");
      if (v18 >= v20)
        v19 = v20;
      else
        v19 = v18;
    }
    objc_msgSend(v6, "substringWithRange:", 0, v19 & ~(v19 >> 63));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    +[MRUStringsProvider routeNameEllipsisString](MRUStringsProvider, "routeNameEllipsisString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@%@"), v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v17;
}

- (MRURouteTextFormatterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
