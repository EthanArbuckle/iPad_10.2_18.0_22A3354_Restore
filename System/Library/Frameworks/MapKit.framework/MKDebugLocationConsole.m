@implementation MKDebugLocationConsole

- (MKDebugLocationConsole)initWithMapView:(id)a3
{
  id v5;
  MKDebugLocationConsole *v6;
  MKDebugLocationConsole *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSTimer *updateTimer;
  MKDebugLocationConsole *v14;
  objc_super v16;

  v5 = a3;
  -[MKDebugLocationConsole _debugViewFrameWithMapView:](self, "_debugViewFrameWithMapView:", v5);
  v16.receiver = self;
  v16.super_class = (Class)MKDebugLocationConsole;
  v6 = -[MKDebugLocationConsole initWithFrame:](&v16, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentMapView, a3);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDebugLocationConsole setBackgroundColor:](v7, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDebugLocationConsole setTextColor:](v7, "setTextColor:", v9);

    -[MKDebugLocationConsole setAlpha:](v7, "setAlpha:", 0.800000012);
    -[MKDebugLocationConsole setTextAlignment:](v7, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDebugLocationConsole setFont:](v7, "setFont:", v10);

    -[MKDebugLocationConsole setNumberOfLines:](v7, "setNumberOfLines:", 2);
    -[MKDebugLocationConsole setLineBreakMode:](v7, "setLineBreakMode:", 0);
    -[MKDebugLocationConsole setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 1);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v7, sel__consoleTapped_);
    objc_msgSend(v11, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v11, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v11, "setCancelsTouchesInView:", 0);
    objc_msgSend(v11, "setDelaysTouchesBegan:", 0);
    -[MKDebugLocationConsole addGestureRecognizer:](v7, "addGestureRecognizer:", v11);
    -[MKDebugLocationConsole update](v7, "update");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v7, sel_update, 0, 1, 1.0);
    v12 = objc_claimAutoreleasedReturnValue();
    updateTimer = v7->_updateTimer;
    v7->_updateTimer = (NSTimer *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)updateFrameWithEdgeInsets:(UIEdgeInsets)a3
{
  -[MKDebugLocationConsole _debugViewFrameWithMapView:](self, "_debugViewFrameWithMapView:", self->_parentMapView, a3.top, a3.left, a3.bottom, a3.right);
  -[MKDebugLocationConsole setFrame:](self, "setFrame:");
}

- (void)update
{
  unint64_t pageIndex;

  pageIndex = self->_pageIndex;
  switch(pageIndex)
  {
    case 2uLL:
      -[MKDebugLocationConsole _updateCustomText](self, "_updateCustomText");
      break;
    case 1uLL:
      -[MKDebugLocationConsole _updateVehicleInfo](self, "_updateVehicleInfo");
      break;
    case 0uLL:
      -[MKDebugLocationConsole _updateGPSInfo](self, "_updateGPSInfo");
      break;
  }
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (void)updateCustomText:(id)a3 textColor:(id)a4
{
  NSString *v6;
  UIColor *v7;
  NSString *customText;
  NSString *v9;
  UIColor *customTextColor;

  v6 = (NSString *)a3;
  v7 = (UIColor *)a4;
  customText = self->_customText;
  self->_customText = v6;
  v9 = v6;

  customTextColor = self->_customTextColor;
  self->_customTextColor = v7;

  -[MKDebugLocationConsole update](self, "update");
}

- (void)_updateGPSInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(void);
  void *v18;
  uint64_t v19;
  id v20;

  -[MKMapView _locationManager](self->_parentMapView, "_locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLocation");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (-[MKMapView ignoreLocationUpdates](self->_parentMapView, "ignoreLocationUpdates")
      || -[MKMapView _isHandlingUserEvent](self->_parentMapView, "_isHandlingUserEvent"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v20, "referenceFrame") == 2)
        objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C9E3B8], "_navigation_stringWithType:", objc_msgSend(v20, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "altitude");
    v10 = v9;
    objc_msgSend(v20, "verticalAccuracy");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@ Alt:%.0fm ±%.0fm"), v7, v8, v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "floor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" Floor: %d"), objc_msgSend(v13, "level"));
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v15;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("No Location");
  }
  -[MKMapView _debugConsoleAdditionalInfoProvider](self->_parentMapView, "_debugConsoleAdditionalInfoProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MKMapView _debugConsoleAdditionalInfoProvider](self->_parentMapView, "_debugConsoleAdditionalInfoProvider");
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v12, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v19;
    }

  }
  -[MKDebugLocationConsole setText:](self, "setText:", v12);
  -[MKDebugLocationConsole setTextColor:](self, "setTextColor:", v5);

}

- (void)_updateVehicleInfo
{
  double v3;
  double v4;
  double v5;
  double v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v12;
  void *v13;
  id v14;

  -[MKMapView _locationManager](self->_parentMapView, "_locationManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentVehicleHeading");
  v4 = v3;
  objc_msgSend(v14, "currentVehicleSpeed");
  v6 = v5;
  if (v4 == -1.0)
  {
    v7 = CFSTR("No vehicle heading");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Vehicle heading: %0.1f"), *(_QWORD *)&v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6 == -1.0)
  {
    v8 = CFSTR("No vehicle speed");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Vehicle speed: %0.1f"), *(_QWORD *)&v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ | %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == -1.0 || v6 == -1.0)
  {
    if (v4 == -1.0 && v6 == -1.0)
      objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  -[MKDebugLocationConsole setText:](self, "setText:", v9);
  -[MKDebugLocationConsole setTextColor:](self, "setTextColor:", v13);

}

- (void)_updateCustomText
{
  id v3;

  if (self->_customTextEnabled)
  {
    -[MKDebugLocationConsole setText:](self, "setText:", self->_customText);
    -[MKDebugLocationConsole setTextColor:](self, "setTextColor:", self->_customTextColor);
  }
  else
  {
    -[MKDebugLocationConsole setText:](self, "setText:", CFSTR("No custom text set"));
    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MKDebugLocationConsole setTextColor:](self, "setTextColor:", v3);

  }
}

- (CGRect)_debugViewFrameWithMapView:(id)a3
{
  id v3;
  void *v4;
  int v5;
  double v6;
  double x;
  double y;
  double width;
  double height;
  CGRect v11;
  CGRect slice;
  CGRect v13;
  CGRect result;

  v3 = a3;
  if (*(double *)&_debugViewFrameWithMapView__height == 0.0)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance", *(double *)&_debugViewFrameWithMapView__height);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");
    v6 = 18.0;
    if (!v5)
      v6 = 30.0;
    _debugViewFrameWithMapView__height = *(_QWORD *)&v6;

  }
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v3, "bounds", 0, 0, 0, 0);
  CGRectDivide(v13, &slice, &v11, *(CGFloat *)&_debugViewFrameWithMapView__height, CGRectMaxYEdge);

  x = slice.origin.x;
  y = slice.origin.y;
  width = slice.size.width;
  height = slice.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_showNextPage
{
  unint64_t v2;

  v2 = (self->_pageIndex + 1) % 3;
  self->_pageIndex = v2;
  if (v2 == 2 && !self->_customTextEnabled)
    -[MKDebugLocationConsole _showNextPage](self, "_showNextPage");
  else
    -[MKDebugLocationConsole update](self, "update");
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[MKDebugLocationConsole timeStampFormatter](self, "timeStampFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)MKDebugLocationConsole;
  -[MKDebugLocationConsole setText:](&v9, sel_setText_, v8);

}

- (id)timeStampFormatter
{
  NSDateFormatter *timeStampFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  timeStampFormatter = self->_timeStampFormatter;
  if (!timeStampFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_timeStampFormatter;
    self->_timeStampFormatter = v4;

    -[NSDateFormatter setDateFormat:](self->_timeStampFormatter, "setDateFormat:", CFSTR("HH:mm:ss"));
    timeStampFormatter = self->_timeStampFormatter;
  }
  return timeStampFormatter;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (BOOL)customTextEnabled
{
  return self->_customTextEnabled;
}

- (void)setCustomTextEnabled:(BOOL)a3
{
  self->_customTextEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStampFormatter, 0);
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_customText, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_parentMapView, 0);
}

@end
