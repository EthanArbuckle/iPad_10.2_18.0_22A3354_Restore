@implementation MKTransitIncidentSymbolImageCell

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[MKTransitIncidentViewModel isEqual:](self->_viewModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MKTransitIncidentSymbolImageCell _updateAppearance](self, "_updateAppearance");
  }

}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  +[MKTransitIncidentStringProvider cellTitleForIncident:](MKTransitIncidentStringProvider, "cellTitleForIncident:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastUpdated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isBlockingIncident");

  -[MKTransitIncidentSymbolImageCell _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v14, v10, v12, v13, v7, v6);
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "lastUpdated");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isBlockingIncident");

  -[MKTransitIncidentSymbolImageCell _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v14, v12, v16, v15, v8, v7);
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "transitIncidents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1)
  {
    objc_msgSend(v10, "transitIncidents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitIncidentSymbolImageCell configureWithIncident:referenceDate:shouldShowImage:inSiri:](self, "configureWithIncident:referenceDate:shouldShowImage:inSiri:", v15, v11, v7, v6);

  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    objc_msgSend(v10, "transitIncidents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __102__MKTransitIncidentSymbolImageCell_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke;
    v18[3] = &unk_1E20DBBC8;
    v18[4] = &v19;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

    objc_msgSend(v10, "routingMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitIncidentSymbolImageCell _configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:](self, "_configureWithMessage:referenceDate:lastUpdated:incidentIsBlocking:shouldShowImage:inSiri:", v17, 0, 0, *((unsigned __int8 *)v20 + 24), v7, v6);

    _Block_object_dispose(&v19, 8);
  }

}

uint64_t __102__MKTransitIncidentSymbolImageCell_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isBlockingIncident");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  __CFString *v11;
  MKTransitIncidentViewModel *v12;
  const __CFString *v13;
  MKTransitIncidentViewModel *v14;

  v8 = a7;
  v9 = a6;
  v11 = (__CFString *)a3;
  v12 = objc_alloc_init(MKTransitIncidentViewModel);
  v14 = v12;
  if (v11)
    v13 = v11;
  else
    v13 = &stru_1E20DFC00;
  -[MKTransitIncidentViewModel setMessage:](v12, "setMessage:", v13);

  -[MKTransitIncidentViewModel setBlocking:](v14, "setBlocking:", v9);
  -[MKTransitIncidentViewModel setShowImage:](v14, "setShowImage:", v8);
  -[MKTransitIncidentSymbolImageCell setViewModel:](self, "setViewModel:", v14);

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MKTransitIncidentItemCellBackgroundView *v20;
  MKTransitIncidentItemCellBackgroundView *backgroundView;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentViewModel message](self->_viewModel, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  LODWORD(v6) = 1058642330;
  objc_msgSend(v5, "setHyphenationFactor:", v6);
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[MKTransitIncidentViewModel message](self->_viewModel, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CEA0D0];
  v24[0] = v5;
  v10 = *MEMORY[0x1E0CEA098];
  v23[0] = v9;
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB590]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v12);
  objc_msgSend(v3, "setAttributedText:", v13);

  if (-[MKTransitIncidentViewModel showImage](self->_viewModel, "showImage"))
  {
    v14 = (void *)MEMORY[0x1E0CEA638];
    -[MKTransitIncidentViewModel symbolName](self->_viewModel, "symbolName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "systemImageNamed:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithRenderingMode:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitIncidentViewModel symbolColor](self->_viewModel, "symbolColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithTintColor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v19);

  }
  -[MKTransitIncidentSymbolImageCell setAccessoryType:](self, "setAccessoryType:", 1);
  -[MKTransitIncidentSymbolImageCell setContentConfiguration:](self, "setContentConfiguration:", v3);
  if (!self->_backgroundView)
  {
    v20 = objc_alloc_init(MKTransitIncidentItemCellBackgroundView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v20;

    -[MKTransitIncidentItemCellBackgroundView setPosition:](self->_backgroundView, "setPosition:", 2);
    -[MKTransitIncidentSymbolImageCell setBackgroundView:](self, "setBackgroundView:", self->_backgroundView);
  }
  -[MKTransitIncidentViewModel backgroundColor](self->_viewModel, "backgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitIncidentItemCellBackgroundView setFillColor:](self->_backgroundView, "setFillColor:", v22);

}

- (BOOL)padBottom
{
  return self->_padBottom;
}

- (void)setPadBottom:(BOOL)a3
{
  self->_padBottom = a3;
}

- (int64_t)cellPosition
{
  return self->_cellPosition;
}

- (void)setCellPosition:(int64_t)a3
{
  self->_cellPosition = a3;
}

- (MKTransitIncidentViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
