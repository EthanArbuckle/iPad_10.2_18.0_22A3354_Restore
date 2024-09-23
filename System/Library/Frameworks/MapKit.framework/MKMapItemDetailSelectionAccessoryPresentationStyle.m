@implementation MKMapItemDetailSelectionAccessoryPresentationStyle

- (MKMapItemDetailSelectionAccessoryPresentationStyle)initWithStyle:(int64_t)a3 calloutStyle:(int64_t)a4 presentationViewController:(id)a5
{
  id v8;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v9;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MKMapItemDetailSelectionAccessoryPresentationStyle;
  v9 = -[MKMapItemDetailSelectionAccessoryPresentationStyle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    v9->_calloutStyle = a4;
    objc_storeWeak((id *)&v9->_presentationViewController, v8);
  }

  return v10;
}

+ (id)automaticWithPresentationViewController:(id)a3
{
  id v3;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v4;

  v3 = a3;
  v4 = -[MKMapItemDetailSelectionAccessoryPresentationStyle initWithStyle:calloutStyle:presentationViewController:]([MKMapItemDetailSelectionAccessoryPresentationStyle alloc], "initWithStyle:calloutStyle:presentationViewController:", 0, 0, v3);

  return v4;
}

+ (MKMapItemDetailSelectionAccessoryPresentationStyle)callout
{
  return -[MKMapItemDetailSelectionAccessoryPresentationStyle initWithStyle:calloutStyle:presentationViewController:]([MKMapItemDetailSelectionAccessoryPresentationStyle alloc], "initWithStyle:calloutStyle:presentationViewController:", 1, 0, 0);
}

+ (id)calloutWithCalloutStyle:(int64_t)a3
{
  return -[MKMapItemDetailSelectionAccessoryPresentationStyle initWithStyle:calloutStyle:presentationViewController:]([MKMapItemDetailSelectionAccessoryPresentationStyle alloc], "initWithStyle:calloutStyle:presentationViewController:", 1, a3, 0);
}

+ (id)sheetPresentedFromViewController:(id)a3
{
  id v3;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v4;

  v3 = a3;
  v4 = -[MKMapItemDetailSelectionAccessoryPresentationStyle initWithStyle:calloutStyle:presentationViewController:]([MKMapItemDetailSelectionAccessoryPresentationStyle alloc], "initWithStyle:calloutStyle:presentationViewController:", 2, 0, v3);

  return v4;
}

+ (MKMapItemDetailSelectionAccessoryPresentationStyle)openInMaps
{
  return -[MKMapItemDetailSelectionAccessoryPresentationStyle initWithStyle:calloutStyle:presentationViewController:]([MKMapItemDetailSelectionAccessoryPresentationStyle alloc], "initWithStyle:calloutStyle:presentationViewController:", 3, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  MKMapItemDetailSelectionAccessoryPresentationStyle *v4;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v5;
  BOOL v6;

  v4 = (MKMapItemDetailSelectionAccessoryPresentationStyle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MKMapItemDetailSelectionAccessoryPresentationStyle isEqualToMapItemDetailSelectionAccessoryPresentationStyle:](self, "isEqualToMapItemDetailSelectionAccessoryPresentationStyle:", v5);

  return v6;
}

- (BOOL)isEqualToMapItemDetailSelectionAccessoryPresentationStyle:(id)a3
{
  MKMapItemDetailSelectionAccessoryPresentationStyle *v4;
  MKMapItemDetailSelectionAccessoryPresentationStyle *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = (MKMapItemDetailSelectionAccessoryPresentationStyle *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_11;
  }
  v6 = -[MKMapItemDetailSelectionAccessoryPresentationStyle _style](self, "_style");
  if (v6 == -[MKMapItemDetailSelectionAccessoryPresentationStyle _style](v5, "_style")
    && (v7 = -[MKMapItemDetailSelectionAccessoryPresentationStyle _calloutStyle](self, "_calloutStyle"),
        v7 == -[MKMapItemDetailSelectionAccessoryPresentationStyle _calloutStyle](v5, "_calloutStyle")))
  {
    -[MKMapItemDetailSelectionAccessoryPresentationStyle _presentationViewController](self, "_presentationViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    -[MKMapItemDetailSelectionAccessoryPresentationStyle _presentationViewController](v5, "_presentationViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 | v9)
      v10 = objc_msgSend((id)v8, "isEqual:", v9);
    else
      v10 = 1;

  }
  else
  {
LABEL_7:
    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (int64_t)_style
{
  return self->_style;
}

- (int64_t)_calloutStyle
{
  return self->_calloutStyle;
}

- (UIViewController)_presentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentationViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end
