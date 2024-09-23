@implementation MPModelStoreBrowseSectionBuilder

- (MPModelStoreBrowseSectionBuilder)initWithRequestedPropertySet:(id)a3
{
  id v4;
  MPModelStoreBrowseSectionBuilder *v5;
  uint64_t v6;
  MPPropertySet *requestedPropertySet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseSectionBuilder;
  v5 = -[MPModelStoreBrowseSectionBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedPropertySet = v5->_requestedPropertySet;
    v5->_requestedPropertySet = (MPPropertySet *)v6;

  }
  return v5;
}

- (MPPropertySet)requestedPropertySetExcludingInternalOnlyProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MPPropertySet *v12;
  void *v13;
  void *v14;
  MPPropertySet *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MPModelStoreBrowseSectionBuilder requestedPropertySet](self, "requestedPropertySet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "allSupportedInternalOnlyProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11++), (_QWORD)v17);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v12 = [MPPropertySet alloc];
  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relationships");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPPropertySet initWithProperties:relationships:](v12, "initWithProperties:relationships:", v13, v14);

  return v15;
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 previouslyRetrievedNestedResponse:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:](self, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:", a3, a4, a5, a6, a7, 0, a8, v9, 0, 0);
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:](self, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:", a3, a4, a5, a6, a7, 0, a9, v12, a11, 0);
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11 modelObject:(id)a12
{
  _BOOL4 v12;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  MPModelStoreBrowseSection *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  MPModelStoreBrowseSection *v39;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  int64_t v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;

  v12 = a6;
  v16 = a10;
  v17 = a3;
  v18 = a4;
  v19 = a9;
  v20 = a12;
  if ((*(_WORD *)&self->_requestedBrowseSectionProperties & 1) == 0)
  {
    -[MPModelStoreBrowseSectionBuilder requestedPropertySet](self, "requestedPropertySet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyTitle")))
      v23 = 2;
    else
      v23 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFFD | v23;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyType")))
      v24 = 4;
    else
      v24 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFFB | v24;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL")))v25 = 8;
    else
      v25 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFF7 | v25;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse")))v26 = 16;
    else
      v26 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFEF | v26;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyUniformContentItemType")))v27 = 32;
    else
      v27 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFDF | v27;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyMemberOfChartSet")))
      v28 = 64;
    else
      v28 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFBF | v28;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyBrick")))
      v29 = 256;
    else
      v29 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFEFF | v29;
    if (objc_msgSend(v22, "containsObject:", CFSTR("MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay")))v30 = 129;
    else
      v30 = 1;
    *(_WORD *)&self->_requestedBrowseSectionProperties = v30 | *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFF7E;

    v16 = a10;
  }
  if (a11 > 390)
  {
    switch(a11)
    {
      case 391:
        v31 = 11;
        goto LABEL_58;
      case 488:
        v31 = 13;
        goto LABEL_58;
      case 489:
        v31 = 14;
        goto LABEL_58;
    }
  }
  else
  {
    switch(a11)
    {
      case 332:
        v31 = 9;
        goto LABEL_58;
      case 383:
        v31 = 12;
        goto LABEL_58;
      case 388:
        v31 = 10;
        goto LABEL_58;
    }
  }
  v32 = 0;
  if (v12)
  {
    if (a5 > 9)
    {
      if (a5 == 10)
      {
        v32 = 1;
      }
      else
      {
LABEL_48:
        if (a5 == 16)
          v32 = 11;
      }
    }
    else if (a5 == 1)
    {
      v32 = 2;
    }
    else if (a5 == 6)
    {
      v32 = 3;
    }
  }
  else
  {
    switch(a5)
    {
      case 3:
        v32 = 4;
        break;
      case 4:
        v32 = 5;
        break;
      case 5:
        v32 = 6;
        break;
      case 6:
        break;
      case 7:
        v32 = 7;
        break;
      default:
        goto LABEL_48;
    }
  }
  if (v16)
    v31 = 8;
  else
    v31 = v32;
LABEL_58:
  v33 = [MPModelStoreBrowseSection alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __256__MPModelStoreBrowseSectionBuilder_modelObjectWithTitle_loadAdditionalContentURL_uniformContentItemType_isMemberOfChartSet_isBrick_displaysAsGridCellInCarPlay_previouslyRetrievedNestedResponse_onlyContainsEditorialElements_featuredContentKind_modelObject___block_invoke;
  v43[3] = &unk_1E3153CB8;
  v43[4] = self;
  v44 = v17;
  v50 = a8;
  v45 = v20;
  v46 = v18;
  v48 = v31;
  v49 = a5;
  v51 = v12;
  v52 = a7;
  v47 = v19;
  v35 = v19;
  v36 = v18;
  v37 = v20;
  v38 = v17;
  v39 = -[MPModelObject initWithIdentifiers:block:](v33, "initWithIdentifiers:block:", v34, v43);

  return v39;
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedPropertySet, 0);
}

void __256__MPModelStoreBrowseSectionBuilder_modelObjectWithTitle_loadAdditionalContentURL_uniformContentItemType_isMemberOfChartSet_isBrick_displaysAsGridCellInCarPlay_previouslyRetrievedNestedResponse_onlyContainsEditorialElements_featuredContentKind_modelObject___block_invoke(uint64_t a1, void *a2)
{
  __int16 v3;
  __int16 v4;
  id v5;

  v5 = a2;
  v3 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v5, "setTitle:", *(_QWORD *)(a1 + 40));
    v3 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  if ((v3 & 0x80) != 0)
    objc_msgSend(v5, "setDisplaysAsGridCellInCarPlay:", *(unsigned __int8 *)(a1 + 88));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setRadioStation:", *(_QWORD *)(a1 + 48));
  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 4) != 0)
  {
    objc_msgSend(v5, "setSectionType:", *(_QWORD *)(a1 + 72));
    v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
    if ((v4 & 8) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v5, "setLoadAdditionalContentURL:", *(_QWORD *)(a1 + 56));
  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v5, "setUniformContentItemType:", *(_QWORD *)(a1 + 80));
  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 0x100) == 0)
      goto LABEL_12;
LABEL_19:
    objc_msgSend(v5, "setBrick:", *(unsigned __int8 *)(a1 + 90));
    if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_18:
  objc_msgSend(v5, "setMemberOfChartSet:", *(unsigned __int8 *)(a1 + 89));
  v4 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v4 & 0x100) != 0)
    goto LABEL_19;
LABEL_12:
  if ((v4 & 0x10) != 0)
LABEL_13:
    objc_msgSend(v5, "setPreviouslyRetrievedNestedResponse:", *(_QWORD *)(a1 + 64));
LABEL_14:

}

+ (id)allSupportedPropertiesIncludingInternalOnlyProperties:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MPModelStoreBrowseSectionPropertyTitle");
  v10[1] = CFSTR("MPModelStoreBrowseSectionPropertyType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "allSupportedInternalOnlyProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertySetByCombiningWithPropertySet:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

+ (id)allSupportedInternalOnlyProperties
{
  void *v2;
  void *v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL");
  v5[1] = CFSTR("MPModelStoreBrowseSectionPropertyUniformContentItemType");
  v5[2] = CFSTR("MPModelStoreBrowseSectionPropertyMemberOfChartSet");
  v5[3] = CFSTR("MPModelStoreBrowseSectionPropertyBrick");
  v5[4] = CFSTR("MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse");
  v5[5] = CFSTR("MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
