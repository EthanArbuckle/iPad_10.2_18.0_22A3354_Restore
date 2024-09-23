@implementation ATXDefaultHomeScreenItemTilerPodBuilder

- (ATXDefaultHomeScreenItemTilerPodBuilder)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXDefaultHomeScreenItemTilerPodBuilder *v20;
  ATXDefaultHomeScreenItemTilerPodBuilder *v21;
  uint64_t v22;
  NSMutableArray *defaultWidgetsSmall;
  uint64_t v24;
  NSMutableArray *defaultWidgetsMedium;
  uint64_t v26;
  NSMutableArray *defaultWidgetsLarge;
  uint64_t v28;
  NSMutableArray *defaultWidgetsExtraLarge;
  uint64_t v30;
  ATXDefaultHomeScreenItemTilerHelper *tilerHelper;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v33.receiver = self;
  v33.super_class = (Class)ATXDefaultHomeScreenItemTilerPodBuilder;
  v20 = -[ATXDefaultHomeScreenItemTilerPodBuilder init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_defaultStack, a3);
    v22 = objc_msgSend(v16, "mutableCopy");
    defaultWidgetsSmall = v21->_defaultWidgetsSmall;
    v21->_defaultWidgetsSmall = (NSMutableArray *)v22;

    v24 = objc_msgSend(v17, "mutableCopy");
    defaultWidgetsMedium = v21->_defaultWidgetsMedium;
    v21->_defaultWidgetsMedium = (NSMutableArray *)v24;

    v26 = objc_msgSend(v18, "mutableCopy");
    defaultWidgetsLarge = v21->_defaultWidgetsLarge;
    v21->_defaultWidgetsLarge = (NSMutableArray *)v26;

    v28 = objc_msgSend(v19, "mutableCopy");
    defaultWidgetsExtraLarge = v21->_defaultWidgetsExtraLarge;
    v21->_defaultWidgetsExtraLarge = (NSMutableArray *)v28;

    v21->_widgetFamilyMask = a8;
    v30 = objc_opt_new();
    tilerHelper = v21->_tilerHelper;
    v21->_tilerHelper = (ATXDefaultHomeScreenItemTilerHelper *)v30;

  }
  return v21;
}

- (NSArray)tiledHomeScreenItems
{
  return (NSArray *)(id)objc_opt_new();
}

- (unint64_t)addFirstPod:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if ((self->_widgetFamilyMask & 2) != 0
    && -[ATXDefaultWidgetStack suggestedSize](self->_defaultStack, "suggestedSize") == 1
    && (unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") >= 2)
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self->_defaultStack && v5 && v6)
    {
      objc_msgSend(v4, "addObject:");
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v7);
      v8 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)addPod:(id)a3 podType:(unint64_t)a4 allowAlternatePodTypeAsBackup:(BOOL)a5 podsAdded:(unint64_t)a6
{
  _BOOL4 v7;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v7 = a5;
  v10 = a3;
  v11 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPod:podType:podsAdded:](self, "_addPod:podType:podsAdded:", v10, a4, a6);
  if (!v11 && v7)
  {
    v12 = 0;
    while (1)
    {
      if (a4 != v12)
      {
        v13 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPod:podType:podsAdded:](self, "_addPod:podType:podsAdded:", v10, v12, a6);
        if (v13)
          break;
      }
      if (++v12 == 6)
      {
        v11 = 0;
        goto LABEL_9;
      }
    }
    v11 = v13;
  }
LABEL_9:

  return v11;
}

- (unint64_t)_addPod:(id)a3 podType:(unint64_t)a4 podsAdded:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;

  v8 = a3;
  switch(a4)
  {
    case 0uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeOneMediumAndTwoSmalls:](self, "_addPodTypeOneMediumAndTwoSmalls:", v8);
      goto LABEL_9;
    case 1uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeTwoSmallsAndOneMedium:](self, "_addPodTypeTwoSmallsAndOneMedium:", v8);
      goto LABEL_9;
    case 2uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeTwoMediums:](self, "_addPodTypeTwoMediums:", v8);
      goto LABEL_9;
    case 3uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeOneLarge:](self, "_addPodTypeOneLarge:", v8);
      goto LABEL_9;
    case 4uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeFourSmalls:](self, "_addPodTypeFourSmalls:", v8);
      goto LABEL_9;
    case 5uLL:
      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder _addPodTypeOneExtraLarge:podsAdded:](self, "_addPodTypeOneExtraLarge:podsAdded:", v8, a5);
LABEL_9:
      v10 = v9;
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (unint64_t)_addPodTypeFourSmalls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  unint64_t v14;

  v4 = a3;
  if ((self->_widgetFamilyMask & 2) == 0
    || (unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") < 4)
  {
    goto LABEL_20;
  }
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = !v5 || v6 == 0;
  v11 = v10 || v7 == 0;
  v12 = v11 || v8 == 0;
  v13 = !v12;
  if (v12)
  {
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v6);
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v9);
  }
  else
  {
    objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v4, "addObject:", v7);
    objc_msgSend(v4, "addObject:", v9);
  }

  if (v13)
    v14 = 1;
  else
LABEL_20:
    v14 = 0;

  return v14;
}

- (unint64_t)_addPodTypeTwoMediums:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if ((self->_widgetFamilyMask & 4) != 0
    && (unint64_t)-[NSMutableArray count](self->_defaultWidgetsMedium, "count") >= 2)
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
    {
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v7);
      v8 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_addPodTypeOneLarge:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if ((self->_widgetFamilyMask & 8) == 0 || !-[NSMutableArray count](self->_defaultWidgetsLarge, "count"))
    goto LABEL_6;
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsLarge);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", 0);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "addObject:", v5);

  v7 = 1;
LABEL_7:

  return v7;
}

- (unint64_t)_addPodTypeOneExtraLarge:(id)a3 podsAdded:(unint64_t)a4
{
  char v4;
  id v6;
  unint64_t v7;

  v4 = a4;
  v6 = a3;
  v7 = 0;
  if ((v4 & 1) == 0 && (self->_widgetFamilyMask & 0x10) != 0)
  {
    if (-[NSMutableArray count](self->_defaultWidgetsExtraLarge, "count"))
    {
      -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsExtraLarge);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "addObject:", v7);

        v7 = 2;
      }
      else
      {
        -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", 0);
      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)_addPodTypeOneMediumAndTwoSmalls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  if ((~LODWORD(self->_widgetFamilyMask) & 6) != 0
    || !-[NSMutableArray count](self->_defaultWidgetsMedium, "count")
    || (unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v4, "addObject:", v8);
      v9 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v6);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v8);
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)_addPodTypeTwoSmallsAndOneMedium:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  if ((~LODWORD(self->_widgetFamilyMask) & 6) != 0
    || !-[NSMutableArray count](self->_defaultWidgetsMedium, "count")
    || (unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v4, "addObject:", v8);
      objc_msgSend(v4, "addObject:", v5);
      v9 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v6);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v8);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      v9 = 0;
    }

  }
  return v9;
}

- (ATXDefaultWidgetStack)defaultStack
{
  return self->_defaultStack;
}

- (void)setDefaultStack:(id)a3
{
  objc_storeStrong((id *)&self->_defaultStack, a3);
}

- (NSMutableArray)defaultWidgetsSmall
{
  return self->_defaultWidgetsSmall;
}

- (void)setDefaultWidgetsSmall:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, a3);
}

- (NSMutableArray)defaultWidgetsMedium
{
  return self->_defaultWidgetsMedium;
}

- (void)setDefaultWidgetsMedium:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, a3);
}

- (NSMutableArray)defaultWidgetsLarge
{
  return self->_defaultWidgetsLarge;
}

- (void)setDefaultWidgetsLarge:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, a3);
}

- (NSMutableArray)defaultWidgetsExtraLarge
{
  return self->_defaultWidgetsExtraLarge;
}

- (void)setDefaultWidgetsExtraLarge:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsExtraLarge, a3);
}

- (unint64_t)widgetFamilyMask
{
  return self->_widgetFamilyMask;
}

- (void)setWidgetFamilyMask:(unint64_t)a3
{
  self->_widgetFamilyMask = a3;
}

- (ATXDefaultHomeScreenItemTilerHelper)tilerHelper
{
  return self->_tilerHelper;
}

- (void)setTilerHelper:(id)a3
{
  objc_storeStrong((id *)&self->_tilerHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsExtraLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);
  objc_storeStrong((id *)&self->_defaultStack, 0);
}

@end
