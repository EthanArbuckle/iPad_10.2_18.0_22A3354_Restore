@implementation MKPlaceAttributionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MKPlaceAttributionCell *v3;
  MKPlaceAttributionCell *v4;
  MKPlaceAttributionCell *attributionCell;

  if (!self->_attributionCell)
  {
    v3 = [MKPlaceAttributionCell alloc];
    v4 = -[MKPlaceAttributionCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    attributionCell = self->_attributionCell;
    self->_attributionCell = v4;

    -[MKPlaceAttributionCell setCellDelegate:](self->_attributionCell, "setCellDelegate:", self);
    -[MKViewWithHairline setTopHairlineHidden:](self->_attributionCell, "setTopHairlineHidden:", 1);
    -[MKViewWithHairline setBottomHairlineHidden:](self->_attributionCell, "setBottomHairlineHidden:", 0);
    -[MKPlaceAttributionViewController setView:](self, "setView:", self->_attributionCell);
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceAttributionViewController;
  -[MKPlaceAttributionViewController viewDidLoad](&v3, sel_viewDidLoad);
  if (self->_mapItem)
    -[MKPlaceAttributionViewController updateLogo](self, "updateLogo");
}

- (void)updateLogo
{
  void *v3;

  -[MKPlaceAttributionViewController infoAttributionString](self, "infoAttributionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionViewController setAttributionString:](self, "setAttributionString:", v3);

  -[MKPlaceAttributionCell setAttributionString:](self->_attributionCell, "setAttributionString:", self->_attributionString);
}

- (void)infoCardThemeChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceAttributionViewController;
  -[UIViewController infoCardThemeChanged](&v4, sel_infoCardThemeChanged);
  -[MKPlaceAttributionViewController infoAttributionString](self, "infoAttributionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionViewController setAttributionString:](self, "setAttributionString:", v3);

}

- (id)infoAttributionString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIViewController mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDarkTheme");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[MKPlaceAttributionViewController mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionViewController mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_attribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("Find out more on %@ "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _MKLocalizedStringFromThisBundle(CFSTR("Find out more on %@ "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:", v8, v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    objc_storeStrong((id *)&self->_mapItem, a3);
    if (self->_attributionCell)
      -[MKPlaceAttributionViewController updateLogo](self, "updateLogo");
  }

}

- (void)setAttributionString:(id)a3
{
  id v4;
  NSAttributedString *attributionString;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSAttributedString *v15;
  NSAttributedString *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  attributionString = self->_attributionString;
  if (v4)
  {
    if ((-[NSAttributedString isEqual:](attributionString, "isEqual:", v4) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA230], "defaultParagraphStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v7, "setAlignment:", 4);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v4);
      v9 = *MEMORY[0x1E0CEA0D0];
      v18[0] = v7;
      v10 = *MEMORY[0x1E0CEA0A0];
      v17[0] = v9;
      v17[1] = v10;
      -[UIViewController mk_theme](self, "mk_theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v12;
      v17[2] = *MEMORY[0x1E0CEA098];
      +[MKPlaceAttributionCell fontForLabel](MKPlaceAttributionCell, "fontForLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttributes:range:", v14, 0, objc_msgSend(v8, "length"));

      v15 = (NSAttributedString *)objc_msgSend(v8, "copy");
      v16 = self->_attributionString;
      self->_attributionString = v15;

      -[MKPlaceAttributionCell setAttributionString:](self->_attributionCell, "setAttributionString:", self->_attributionString);
    }
  }
  else
  {
    self->_attributionString = 0;

    -[MKPlaceAttributionCell setAttributionString:](self->_attributionCell, "setAttributionString:", self->_attributionString);
  }

}

- (void)openURL
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  -[MKPlaceAttributionViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_attribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionViewController mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_attribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6023, v6, 180, v9);

  +[MKAppLaunchController launchAttributionURLs:withAttribution:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:completionHandler:", self->_urlStrings, self->_attribution, 0);
}

- (NSArray)urlStrings
{
  return self->_urlStrings;
}

- (void)setUrlStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSAttributedString)attributionString
{
  return self->_attributionString;
}

- (MKPlaceAttributionCell)attributionCell
{
  return self->_attributionCell;
}

- (void)setAttributionCell:(id)a3
{
  objc_storeStrong((id *)&self->_attributionCell, a3);
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (_MKMapItemAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (_MKInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_attributionCell, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_urlStrings, 0);
}

@end
