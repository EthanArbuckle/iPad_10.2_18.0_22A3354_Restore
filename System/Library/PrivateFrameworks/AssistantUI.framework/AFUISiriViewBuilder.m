@implementation AFUISiriViewBuilder

+ (id)buildSiriViewForFrame:(CGRect)a3 configuration:(id)a4 dataSource:(id)a5 delegate:(id)a6 siriContentDelegate:(id)a7 edgeLightViewProvider:(id)a8 instrumentationHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AFUISiriCarPlayView *v25;
  int v26;
  AFUISiriCompactView *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  AFUISiriView *v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  if (objc_msgSend(v19, "siriViewMode") == 5)
  {
    v25 = -[AFUISiriCarPlayView initWithFrame:viewDelegate:instrumentationHandler:]([AFUISiriCarPlayView alloc], "initWithFrame:viewDelegate:instrumentationHandler:", v21, v24, x, y, width, height);
  }
  else
  {
    if (!objc_msgSend(v19, "allowResizingBetweenModes"))
    {
      v31 = -[AFUISiriView initWithFrame:configuration:]([AFUISiriView alloc], "initWithFrame:configuration:", v19, x, y, width, height);
      -[AFUISiriView setDelegate:](v31, "setDelegate:", v21);
      -[AFUISiriView setDataSource:](v31, "setDataSource:", v20);
      goto LABEL_13;
    }
    if (objc_msgSend(v19, "siriViewMode") == 4 || objc_msgSend(v19, "siriViewMode") == 8)
    {
      v26 = objc_msgSend(a1, "_carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:", objc_msgSend(v19, "siriViewMode"));
      v27 = [AFUISiriCompactView alloc];
      v28 = objc_msgSend(v19, "showsSensitiveUI");
      if (v26)
      {
        v29 = v23;
        v30 = 1;
      }
      else
      {
        v30 = 0;
        v29 = v23;
      }
      v25 = -[AFUISiriCompactView initWithFrame:eyesFreeMode:edgeLightViewProvider:showsSensitiveUI:](v27, "initWithFrame:eyesFreeMode:edgeLightViewProvider:showsSensitiveUI:", v30, v29, v28, x, y, width, height);
    }
    else
    {
      v25 = -[AFUISiriCompactView initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:]([AFUISiriCompactView alloc], "initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:", v21, v23, objc_msgSend(v19, "showsSensitiveUI"), x, y, width, height);
    }
  }
  v31 = (AFUISiriView *)v25;
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AFUISiriView setSiriContentDelegate:](v31, "setSiriContentDelegate:", v22);

  return v31;
}

+ (BOOL)_carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:", a3 == 8);

  return a3;
}

@end
