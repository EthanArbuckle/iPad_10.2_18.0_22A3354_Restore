@implementation MKTransitInactiveLinesSectionController

- (MKTransitInactiveLinesSectionController)init
{
  MKTransitInactiveLinesSectionController *result;

  result = (MKTransitInactiveLinesSectionController *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MKTransitInactiveLinesSectionController)initWithMapItem:(id)a3 system:(id)a4 line:(id)a5
{
  id v9;
  MKTransitInactiveLinesSectionController *v10;
  MKTransitInactiveLinesSectionController *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitInactiveLinesSectionController;
  v10 = -[MKTransitSectionController initWithMapItem:system:](&v13, sel_initWithMapItem_system_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_line, a5);

  return v11;
}

- (NSArray)inactiveLines
{
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitInactiveLinesSectionController _buildRows](self, "_buildRows");
  return self->_inactiveLines;
}

- (id)_pagingFilter
{
  MKTransitSectionPagingFilter *pagingFilter;
  MKTransitSectionPagingFilter *v4;
  MKTransitSectionPagingFilter *v5;

  pagingFilter = self->super.__pagingFilter;
  if (!pagingFilter)
  {
    +[MKTransitSectionPagingFilter defaultFilterForInactiveLines](MKTransitSectionPagingFilter, "defaultFilterForInactiveLines");
    v4 = (MKTransitSectionPagingFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->super.__pagingFilter;
    self->super.__pagingFilter = v4;

    pagingFilter = self->super.__pagingFilter;
  }
  return pagingFilter;
}

- (void)_setNeedsBuildRows
{
  NSArray *inactiveLines;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKTransitInactiveLinesSectionController;
  -[MKTransitSectionController _setNeedsBuildRows](&v4, sel__setNeedsBuildRows);
  inactiveLines = self->_inactiveLines;
  self->_inactiveLines = 0;

}

- (void)_buildRows
{
  MKTransitInactiveLinesSectionController *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _MKTransitInactiveLine *v18;
  void *v19;
  void *v20;
  void *v21;
  _MKTransitInactiveLine *v22;
  _MKTransitInactiveLine *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *inactiveLines;
  uint64_t v27;
  NSSet *linesToShow;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD);
  MKTransitInactiveLinesSectionController *v33;
  _BOOL4 v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  objc_super v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v2 = self;
  v46[1] = *MEMORY[0x1E0C80C00];
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
  {
    v44.receiver = v2;
    v44.super_class = (Class)MKTransitInactiveLinesSectionController;
    -[MKTransitSectionController _buildRows](&v44, sel__buildRows);
    -[MKTransitInactiveLinesSectionController _pagingFilter](v2, "_pagingFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __53__MKTransitInactiveLinesSectionController__buildRows__block_invoke;
    v43[3] = &unk_1E20D9F38;
    v43[4] = v2;
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v43);
    if (v2->_line)
    {
      v46[0] = v2->_line;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "limitNumLines"))
    {
      v6 = objc_msgSend(v5, "count");
      v34 = v6 >= objc_msgSend(v3, "numLinesFallbackThreshold");
    }
    else
    {
      v34 = 0;
    }
    v30 = objc_msgSend(v3, "numLinesFallbackValue");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v5;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    v29 = v3;
    v7 = 0;
    if (v38)
    {
      v8 = *(_QWORD *)v40;
      v32 = v4;
      v33 = v2;
      v31 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v4[2](v4, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKMapItem _transitInfo](v2->super._mapItem, "_transitInfo", v29);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKTransitSectionController incidentEntitiesToExclude](v2, "incidentEntitiesToExclude");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serviceResumesResultForLine:excludingIncidentEntities:afterDate:usingContainers:", v10, v13, v11, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "blocked");
          objc_msgSend(v14, "earliestNextDepartureDate");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if ((v15 & 1) != 0 || v16)
          {
            if (!v34 || objc_msgSend(v36, "count") != v30)
            {
              v18 = [_MKTransitInactiveLine alloc];
              v37 = v7;
              if ((_DWORD)v15)
                v19 = 0;
              else
                v19 = v17;
              -[MKMapItem timeZone](v2->super._mapItem, "timeZone");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "departureSequence");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v18;
              v8 = v31;
              v23 = -[_MKTransitInactiveLine initWithTransitLine:blocked:serviceResumesDate:timeZone:referenceDate:departuresSequence:](v22, "initWithTransitLine:blocked:serviceResumesDate:timeZone:referenceDate:departuresSequence:", v10, v15, v19, v20, v11, v21);
              objc_msgSend(v36, "addObject:", v23);

              v7 = v37;
              v4 = v32;

              v2 = v33;
            }
          }
          else
          {
            ++v7;
          }

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v38);
    }

    v24 = objc_msgSend(obj, "count");
    v2->super._numberOfFilteredLines = v24 - v7 - objc_msgSend(v36, "count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v36);
    v25 = objc_claimAutoreleasedReturnValue();
    inactiveLines = v2->_inactiveLines;
    v2->_inactiveLines = (NSArray *)v25;

    v2->super._numberOfRows = -[NSArray count](v2->_inactiveLines, "count");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obj);
    v27 = objc_claimAutoreleasedReturnValue();
    linesToShow = v2->super._linesToShow;
    v2->super._linesToShow = (NSSet *)v27;

  }
}

id __53__MKTransitInactiveLinesSectionController__buildRows__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !objc_msgSend(v3, "departuresAreVehicleSpecific"))
  {
    objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "departureCutoffDate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveLines, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
