@implementation MOSuggestionSheetOptions

- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9 contentOptions:(int64_t)a10
{
  id v18;
  MOSuggestionSheetOptions *v19;
  MOSuggestionSheetOptions *v20;
  objc_super v22;

  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MOSuggestionSheetOptions;
  v19 = -[MOSuggestionSheetOptions init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_showCancelButton = a3;
    v19->_showBlankEntryButton = a4;
    v19->_peekDetentRatio = a5;
    v19->_presentFullScreen = a6;
    v19->_presentationIsAnimated = a7;
    v19->_selectedTabIsRecommended = a8;
    objc_storeStrong((id *)&v19->_selectedSuggestionId, a9);
    v20->_contentOptions = a10;
  }

  return v20;
}

- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9
{
  return -[MOSuggestionSheetOptions initWithShowCancelButton:showBlankEntryButton:peekDetentRatio:presentFullScreen:presentationIsAnimated:selectedTabIsRecommended:selectedSuggestionId:contentOptions:](self, "initWithShowCancelButton:showBlankEntryButton:peekDetentRatio:presentFullScreen:presentationIsAnimated:selectedTabIsRecommended:selectedSuggestionId:contentOptions:", a3, a4, a6, a7, a8, a9, a5, 0);
}

- (MOSuggestionSheetOptions)initWithCoder:(id)a3
{
  id v3;
  MOSuggestionSheetOptions *v4;
  double v5;
  uint64_t v6;
  NSUUID *selectedSuggestionId;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOSuggestionSheetOptions;
  v3 = a3;
  v4 = -[MOSuggestionSheetOptions init](&v10, sel_init);
  v4->_showCancelButton = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showCancelButton"), v10.receiver, v10.super_class);
  v4->_showBlankEntryButton = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showBlankEntryButton"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("peekDetentRatio"));
  v4->_peekDetentRatio = v5;
  v4->_presentFullScreen = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("presentFullScreen"));
  v4->_presentationIsAnimated = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("presentationIsAnimated"));
  v4->_selectedTabIsRecommended = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("selectedTabIsRecommended"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedSuggestionId"));
  v6 = objc_claimAutoreleasedReturnValue();
  selectedSuggestionId = v4->_selectedSuggestionId;
  v4->_selectedSuggestionId = (NSUUID *)v6;

  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("contentOptions"));
  v4->_contentOptions = v8;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 showCancelButton;
  id v5;

  showCancelButton = self->_showCancelButton;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", showCancelButton, CFSTR("showCancelButton"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showBlankEntryButton, CFSTR("showBlankEntryButton"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("peekDetentRatio"), self->_peekDetentRatio);
  objc_msgSend(v5, "encodeBool:forKey:", self->_presentFullScreen, CFSTR("presentFullScreen"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_presentationIsAnimated, CFSTR("presentationIsAnimated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_selectedTabIsRecommended, CFSTR("selectedTabIsRecommended"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedSuggestionId, CFSTR("selectedSuggestionId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contentOptions, CFSTR("contentOptions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggestionSheetOptions, _showCancelButton=%d, _showBlankEntryButton=%d, _peekDetentRatio=%f, _presentFullScreen=%d, _presentationIsAnimated=%d, _selectedTabIsRecommended=%d, _selectedSuggestionId=%@, contentOptions=%ld"), self->_showCancelButton, self->_showBlankEntryButton, *(_QWORD *)&self->_peekDetentRatio, self->_presentFullScreen, self->_presentationIsAnimated, self->_selectedTabIsRecommended, self->_selectedSuggestionId, self->_contentOptions);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;
  int64_t v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!v5)
      goto LABEL_12;
    v6 = -[MOSuggestionSheetOptions showBlankEntryButton](self, "showBlankEntryButton");
    if (v6 != objc_msgSend(v5, "showBlankEntryButton"))
      goto LABEL_12;
    v7 = -[MOSuggestionSheetOptions showCancelButton](self, "showCancelButton");
    if (v7 == objc_msgSend(v5, "showCancelButton")
      && (v8 = -[MOSuggestionSheetOptions presentFullScreen](self, "presentFullScreen"),
          v8 == objc_msgSend(v5, "presentFullScreen"))
      && (v9 = -[MOSuggestionSheetOptions presentationIsAnimated](self, "presentationIsAnimated"),
          v9 == objc_msgSend(v5, "presentationIsAnimated"))
      && (v10 = -[MOSuggestionSheetOptions selectedTabIsRecommended](self, "selectedTabIsRecommended"),
          v10 == objc_msgSend(v5, "selectedTabIsRecommended"))
      && (-[MOSuggestionSheetOptions peekDetentRatio](self, "peekDetentRatio"),
          v12 = v11,
          objc_msgSend(v5, "peekDetentRatio"),
          v12 == v13))
    {
      -[MOSuggestionSheetOptions selectedSuggestionId](self, "selectedSuggestionId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "selectedSuggestionId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v18 = -[MOSuggestionSheetOptions contentOptions](self, "contentOptions");
        v16 = v18 == objc_msgSend(v5, "contentOptions");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
LABEL_12:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showBlankEntryButton
{
  return self->_showBlankEntryButton;
}

- (double)peekDetentRatio
{
  return self->_peekDetentRatio;
}

- (BOOL)presentFullScreen
{
  return self->_presentFullScreen;
}

- (BOOL)presentationIsAnimated
{
  return self->_presentationIsAnimated;
}

- (BOOL)selectedTabIsRecommended
{
  return self->_selectedTabIsRecommended;
}

- (NSUUID)selectedSuggestionId
{
  return self->_selectedSuggestionId;
}

- (int64_t)contentOptions
{
  return self->_contentOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSuggestionId, 0);
}

@end
