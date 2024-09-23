@implementation EKEventDetailAttendeesListView

- (EKEventDetailAttendeesListView)initWithFrame:(CGRect)a3
{
  EKEventDetailAttendeesListView *v3;
  uint64_t v4;
  NSMutableArray *inviteeNames;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventDetailAttendeesListView;
  v3 = -[EKEventDetailAttendeesListView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E606F920);
    v4 = objc_claimAutoreleasedReturnValue();
    inviteeNames = v3->_inviteeNames;
    v3->_inviteeNames = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryChanged, *MEMORY[0x1E0DC48E8], 0);

    -[EKEventDetailAttendeesListView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v7, "setNeedsDisplay");

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailAttendeesListView;
  -[EKEventDetailAttendeesListView dealloc](&v4, sel_dealloc);
}

- (void)contentSizeCategoryChanged
{
  NSArray *finalizedNames;

  finalizedNames = self->_finalizedNames;
  self->_finalizedNames = 0;

}

- (void)setInvitees:(id)a3 forStatus:(int64_t)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;

  v6 = a3;
  v7 = -[EKEventDetailAttendeesListView _haveInviteesToDraw](self, "_haveInviteesToDraw");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_inviteeNames, "setObject:atIndexedSubscript:", v6, a4);
  v8 = objc_msgSend(v6, "count");

  if (v8)
  {
    if (!v7)
    {
      self->_actualHeight = 0.0;
      -[EKEventDetailAttendeesListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[EKEventDetailAttendeesListView _setShowingSpinner:](self, "_setShowingSpinner:", 0);
      -[EKEventDetailAttendeesListView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  -[EKEventDetailAttendeesListView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)_haveInviteesToDraw
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_inviteeNames;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "count", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_haveContentToDraw
{
  return -[EKEventDetailAttendeesListView _haveInviteesToDraw](self, "_haveInviteesToDraw") || !self->_showingSpinner;
}

- (void)layoutSubviews
{
  if (self->_spinnerView)
    -[EKEventDetailAttendeesListView _layoutSpinner](self, "_layoutSpinner");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[EKEventDetailAttendeesListView calculatedHeight](self, "calculatedHeight");
  v3 = v2;
  v4 = 260.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (BOOL)_shouldAlwaysDrawSingleColumn
{
  void *v2;
  BOOL v3;

  -[EKEventDetailAttendeesListView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = EKUIPrefersLargerTextThanDefault(v2);

  return v3;
}

- (double)maxHeight
{
  return EKUICurrentWindowHeightWithViewHierarchy(self) * 0.660000026;
}

- (double)_calculateHeightForItemCounts:(int64_t)a3[4]
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t columnBItems;
  int64_t v12;
  void *v13;
  int64_t v14;
  char v15;
  uint64_t v16;
  int64_t columnAItems;
  unint64_t v18;
  BOOL v19;
  int64_t v20;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = a3[v5];
    v6 += v9;
    if (v9)
    {
      v8 = v5;
      ++v7;
    }
    ++v5;
  }
  while (v5 != 4);
  if (v7 <= 1)
    v10 = 1;
  else
    v10 = v7;
  columnBItems = v10 + v6 - 1;
  if (-[EKEventDetailAttendeesListView _shouldAlwaysDrawSingleColumn](self, "_shouldAlwaysDrawSingleColumn"))
  {
    self->_columnAItems = columnBItems;
    self->_columnBItems = 0;
LABEL_14:
    v13 = (void *)MEMORY[0x1E0DC1350];
    goto LABEL_48;
  }
  v12 = llroundf((float)((float)columnBItems + 1.0) * 0.5);
  self->_columnAItems = 0;
  self->_columnBItems = 0;
  if (v7 == 1)
  {
    self->_columnAItems = v12;
    self->_columnBItems = columnBItems - v12;
    self->_firstColumnBType = v8;
    if (self->_columnAItems <= self->_columnBItems)
      columnBItems = self->_columnBItems;
    else
      columnBItems = self->_columnAItems;
    goto LABEL_14;
  }
  v14 = 0;
  v15 = 0;
  self->_firstColumnBType = 4;
  do
  {
    v16 = a3[v14];
    if (!v16)
      goto LABEL_44;
    columnAItems = self->_columnAItems;
    v18 = v12 - columnAItems;
    if (v12 - columnAItems < 1 || (v16 >= 3 ? (v19 = v18 == 1) : (v19 = 0), v19 || self->_firstColumnBType != 4))
    {
      self->_columnBItems += v16 + 1;
      if (self->_firstColumnBType == 4)
        self->_firstColumnBType = v14;
      if ((v15 & 1) != 0)
      {
LABEL_34:
        v15 = 0;
        --self->_columnAItems;
        goto LABEL_44;
      }
    }
    else
    {
      v20 = columnAItems + v16;
      if (columnAItems + v16 <= v12)
      {
        self->_columnAItems = v20;
        if (v20 < v12)
        {
          self->_columnAItems = v20 + 1;
          v15 = 1;
          goto LABEL_44;
        }
      }
      else if (v16 > (uint64_t)v18 && v18 >= 2)
      {
        self->_columnAItems = v12;
        if (v16 == v18 + 1)
        {
          self->_columnAItems = v12 - 1;
          v22 = self->_columnBItems + 1;
        }
        else
        {
          v22 = self->_columnBItems;
        }
        self->_columnBItems = v16 - v18 + v22 + 1;
        if (self->_firstColumnBType == 4)
        {
          v15 = 0;
          self->_firstColumnBType = v14;
          goto LABEL_44;
        }
      }
      else
      {
        if (v20 <= columnBItems - columnAItems)
        {
          v15 = 0;
          self->_columnAItems = v20;
          goto LABEL_44;
        }
        self->_firstColumnBType = v14;
        self->_columnBItems += v16 + 1;
        if ((v15 & 1) != 0)
          goto LABEL_34;
      }
    }
    v15 = 0;
LABEL_44:
    ++v14;
  }
  while (v14 != 4);
  v23 = self->_columnBItems - 1;
  self->_columnBItems = v23;
  v13 = (void *)MEMORY[0x1E0DC1350];
  if (self->_columnAItems <= v23)
    columnBItems = v23;
  else
    columnBItems = self->_columnAItems;
LABEL_48:
  v24 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(v13, "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lineHeight");
  v27 = v26;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_leading");
  CalRoundToScreenScale(v27 + v29);
  v31 = v30 * (double)columnBItems;

  return v31;
}

- (void)recalculateHeight
{
  self->_actualHeight = 0.0;
  -[EKEventDetailAttendeesListView calculatedHeight](self, "calculatedHeight");
}

- (double)calculatedHeight
{
  double actualHeight;
  uint64_t i;
  void *v5;
  int64_t *statusCounts;
  double v7;
  double v8;
  int64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  int64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  int64_t columnAItems;
  int64_t columnBItems;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double result;
  BOOL v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;

  if (-[EKEventDetailAttendeesListView _haveContentToDraw](self, "_haveContentToDraw"))
  {
    actualHeight = self->_actualHeight;
    if (actualHeight <= 0.0)
    {
      for (i = 0; i != 4; ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        statusCounts = self->_statusCounts;
        self->_statusCounts[i] = objc_msgSend(v5, "count");

      }
      -[EKEventDetailAttendeesListView _calculateHeightForItemCounts:](self, "_calculateHeightForItemCounts:", self->_statusCounts);
      actualHeight = v7;
      -[EKEventDetailAttendeesListView maxHeight](self, "maxHeight");
      if (actualHeight > v8)
      {
        v9 = self->_statusCounts;
        v10 = 1;
        v11 = 1;
        do
        {
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v10);
            v12 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend((id)v12, "count"))
            {
              v13 = statusCounts[v10];
              -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v13) = v13 == objc_msgSend(v14, "count");

              if ((v13 & 1) != 0)
                LODWORD(v12) = 0;
              else
                LODWORD(v12) = v11;
              v11 = v12;
            }
            else
            {

              LOBYTE(v12) = v11;
            }
            ++v10;
          }
          while (v10 != 4);
          v15 = 0;
          if ((v12 & 1) != 0)
          {
            v17 = 0;
            do
            {
              v18 = *(int64_t *)((char *)v9 + v15);
              v19 = v18 < 1;
              v20 = v18 - 1;
              if (!v19)
              {
                if (!v17)
                  v17 = v20;
                *(int64_t *)((char *)v9 + v15) = v17;
              }
              v15 += 8;
            }
            while (v15 != 32);
          }
          else
          {
            for (j = 1; j != 4; ++j)
            {
              if (v9[j] >= statusCounts[v15])
                v15 = j;
            }
            --statusCounts[v15];
          }
          -[EKEventDetailAttendeesListView _calculateHeightForItemCounts:](self, "_calculateHeightForItemCounts:", self->_statusCounts);
          actualHeight = v21;
          -[EKEventDetailAttendeesListView maxHeight](self, "maxHeight");
          v10 = 1;
          v11 = 1;
        }
        while (actualHeight > v22);
        if ((v12 & 1) == 0
          && !-[EKEventDetailAttendeesListView _shouldAlwaysDrawSingleColumn](self, "_shouldAlwaysDrawSingleColumn"))
        {
          columnAItems = self->_columnAItems;
          columnBItems = self->_columnBItems;
          v25 = columnAItems - columnBItems;
          if (columnAItems <= columnBItems)
          {
            v32 = columnBItems == columnAItems;
            v19 = columnBItems <= columnAItems;
            v33 = columnBItems - columnAItems;
            if (!v19 && !v32)
            {
              do
              {
                if (self->_firstColumnBType < 1)
                  break;
                v40 = v33;
                v34 = 0;
                v35 = 0;
                v36 = 0;
                do
                {
                  -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v34, v40);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "count") - self->_statusCounts[v34];

                  if (v38 > v36)
                  {
                    v36 = v38;
                    v35 = v34;
                  }
                  ++v34;
                }
                while (self->_firstColumnBType > v34);
                if (v36 <= 0)
                  break;
                ++statusCounts[v35];
                v33 = v40 - 1;
                if (v40 == 1)
                  break;
              }
              while (v36 != 1);
            }
          }
          else
          {
            v39 = 464;
            do
            {
              v26 = *(uint64_t *)((char *)&self->super.super.super.isa + v39);
              if (v26 > 3)
                break;
              v27 = 0;
              v28 = 0;
              do
              {
                -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v26, v39);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "count") - self->_statusCounts[v26];

                if (v30 > v28)
                {
                  v28 = v30;
                  v27 = v26;
                }
                ++v26;
              }
              while (v26 != 4);
              if (v28 > 0)
              {
                ++statusCounts[v27];
                --v25;
              }
            }
            while (v25 && v28);
          }
        }
      }
      self->_actualHeight = actualHeight;
    }
    return actualHeight;
  }
  else
  {
    -[EKEventDetailAttendeesListView _calculateHeightForSpinnerDisplayMode](self, "_calculateHeightForSpinnerDisplayMode");
  }
  return result;
}

- (double)_calculateHeightForSpinnerDisplayMode
{
  double v3;
  double v4;
  double v5;

  -[EKEventDetailAttendeesListView _createSpinnerViewIfNeeded](self, "_createSpinnerViewIfNeeded");
  -[UIActivityIndicatorView frame](self->_spinnerView, "frame");
  v4 = v3;
  -[EKEventDetailAttendeesListView bottomSpacingForSpinner](self, "bottomSpacingForSpinner");
  return v5 + v4;
}

- (void)finalizeInviteNames
{
  NSArray *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *finalizedNames;

  v3 = (NSArray *)objc_opt_new();
  for (i = 0; i != 4; ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusGlyphForStatusType:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailAttendeesListView generateAttributedStringsFromDisplayParticipants:glyph:displayCount:](self, "generateAttributedStringsFromDisplayParticipants:glyph:displayCount:", v5, v7, self->_statusCounts[i]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v8);

  }
  finalizedNames = self->_finalizedNames;
  self->_finalizedNames = v3;

}

- (id)generateAttributedStringsFromDisplayParticipants:(id)a3 glyph:(id)a4 displayCount:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __102__EKEventDetailAttendeesListView_generateAttributedStringsFromDisplayParticipants_glyph_displayCount___block_invoke;
  v20 = &unk_1E601A8C8;
  v10 = v7;
  v21 = v10;
  v24 = a5;
  v11 = v8;
  v22 = v11;
  v12 = v9;
  v23 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  if (objc_msgSend(v10, "count", v17, v18, v19, v20))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v12, "addObject:", v13);

  }
  v14 = v23;
  v15 = v12;

  return v15;
}

void __102__EKEventDetailAttendeesListView_generateAttributedStringsFromDisplayParticipants_glyph_displayCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(*(id *)(a1 + 32), "count");
  v11 = *(_QWORD *)(a1 + 56);
  if (v10 > v11 && v11 - 1 == a3)
  {
    v20 = objc_msgSend(*(id *)(a1 + 32), "count") - *(_DWORD *)(a1 + 56);
    v21 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR(" %d more…"), &stru_1E601DFA8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v23, (v20 + 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    v31[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v26;
    v31[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithString:attributes:", v24, v28);

    objc_msgSend(v9, "appendAttributedString:", v29);
    objc_msgSend(v8, "setXMore:", 1);
    *a4 = 1;

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    if (CalInterfaceIsLeftToRight())
      v14 = &unk_1E606F938;
    else
      v14 = &unk_1E606F950;
    v15 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v7, "displayString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithAttributedString:", v16);

    v18 = objc_msgSend(v7, "isOptionalParticipant");
    v19 = *MEMORY[0x1E0DC1140];
    if (v18)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v19, v30, 0, objc_msgSend(v17, "length"));

    objc_msgSend(v9, "appendAttributedString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "appendAttributedString:", v13);
    objc_msgSend(v9, "appendAttributedString:", v17);
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1258], v14, 0, objc_msgSend(v9, "length"));

  }
  objc_msgSend(v8, "setString:", v9);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

}

- (void)drawRect:(CGRect)a3
{
  if (-[EKEventDetailAttendeesListView _haveContentToDraw](self, "_haveContentToDraw", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    if (!-[NSArray count](self->_finalizedNames, "count"))
      -[EKEventDetailAttendeesListView finalizeInviteNames](self, "finalizeInviteNames");
    -[EKEventDetailAttendeesListView drawNames:](self, "drawNames:", self->_finalizedNames);
  }
}

- (void)drawNames:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;

  v4 = a3;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x3010000000;
  v19 = "";
  v20 = *MEMORY[0x1E0C9D538];
  -[EKEventDetailAttendeesListView frame](self, "frame");
  v6 = v5;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
    v17[4] = v6 + v17[4];
  if (-[EKEventDetailAttendeesListView _shouldAlwaysDrawSingleColumn](self, "_shouldAlwaysDrawSingleColumn"))
    v7 = v6 + -20.0;
  else
    v7 = (v6 + -20.0) * 0.5;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = (id)objc_opt_new();
  if (CalInterfaceIsLeftToRight())
    v8 = 0;
  else
    v8 = 2;
  objc_msgSend((id)v11[5], "setAlignment:", v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EKEventDetailAttendeesListView_drawNames___block_invoke;
  v9[3] = &unk_1E601A8F0;
  v9[4] = self;
  v9[5] = &v16;
  *(double *)&v9[7] = v7;
  v9[6] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __44__EKEventDetailAttendeesListView_drawNames___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  BOOL v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  int IsLeftToRight;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  v5 = a2;
  v40 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) == a3)
  {
    v6 = CalInterfaceIsLeftToRight() == 0;
    v5 = v40;
    v7 = -1.0;
    if (!v6)
      v7 = 1.0;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 32)
                                                                + v7 * (*(double *)(a1 + 56) + 20.0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v40, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    if (objc_msgSend(v40, "xMore"))
    {
      if (CalInterfaceIsLeftToRight())
        v12 = 1.0;
      else
        v12 = -1.0;
      +[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "statusGlyphForStatusType:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v11 = v11 + v12 * v15;

    }
    IsLeftToRight = CalInterfaceIsLeftToRight();
    v17 = *(double *)(a1 + 56);
    v18 = 0.0;
    if (!IsLeftToRight)
      v18 = *(double *)(a1 + 56);
    v19 = v11 - v18;
    v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v21 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lineHeight");
    v24 = v23;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_leading");
    CalRoundToScreenScale(v24 + v26);
    v28 = v27 + 3.0;

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, objc_msgSend(v9, "length"));
    objc_msgSend(v9, "drawWithRect:options:context:", 33, v10, v19, v20, v17, v28);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_leading");
    CalRoundToScreenScale(v31 + v33);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v34
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);

    goto LABEL_16;
  }
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) > 0.0)
  {
    v35 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    v37 = v36;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_leading");
    CalRoundToScreenScale(v37 + v38);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v39
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
LABEL_16:

  }
}

- (void)showSpinner
{
  -[EKEventDetailAttendeesListView _setShowingSpinner:](self, "_setShowingSpinner:", 1);
}

- (void)_createSpinnerViewIfNeeded
{
  id v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *spinnerView;

  if (!self->_spinnerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3438]);
    v4 = (UIActivityIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    spinnerView = self->_spinnerView;
    self->_spinnerView = v4;

    -[UIActivityIndicatorView sizeToFit](self->_spinnerView, "sizeToFit");
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_spinnerView, "setActivityIndicatorViewStyle:", 100);
    -[UIActivityIndicatorView setAutoresizingMask:](self->_spinnerView, "setAutoresizingMask:", 45);
  }
}

- (void)_layoutSpinner
{
  double v3;
  double v4;
  double v5;

  -[UIActivityIndicatorView frame](self->_spinnerView, "frame");
  v4 = v3;
  -[EKEventDetailAttendeesListView frame](self, "frame");
  CalRoundToScreenScale((v5 - v4) * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:");
}

- (void)_setShowingSpinner:(BOOL)a3
{
  void *v5;

  if (a3)
  {
    -[EKEventDetailAttendeesListView _createSpinnerViewIfNeeded](self, "_createSpinnerViewIfNeeded");
    -[UIActivityIndicatorView superview](self->_spinnerView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[EKEventDetailAttendeesListView addSubview:](self, "addSubview:", self->_spinnerView);
      -[EKEventDetailAttendeesListView _layoutSpinner](self, "_layoutSpinner");
    }
    -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 0);
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  }
  else
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
    -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 1);
    -[UIActivityIndicatorView removeFromSuperview](self->_spinnerView, "removeFromSuperview");
  }
  self->_showingSpinner = a3;
}

- (NSArray)ungrouped
{
  return self->_ungrouped;
}

- (void)setUngrouped:(id)a3
{
  objc_storeStrong((id *)&self->_ungrouped, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)groupsNames
{
  return self->_groupsNames;
}

- (void)setGroupsNames:(BOOL)a3
{
  self->_groupsNames = a3;
}

- (double)bottomSpacingForSpinner
{
  return self->_bottomSpacingForSpinner;
}

- (void)setBottomSpacingForSpinner:(double)a3
{
  self->_bottomSpacingForSpinner = a3;
}

- (int64_t)columnAItems
{
  return self->_columnAItems;
}

- (int64_t)columnBItems
{
  return self->_columnBItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_ungrouped, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_finalizedNames, 0);
  objc_storeStrong((id *)&self->_inviteeNames, 0);
}

@end
