@implementation NSLayoutConstraintParser

- (void)parsePredicateList
{
  NSLayoutConstraintParser *i;
  unint64_t currentCharacter;

  for (i = self; ; self = i)
  {
    -[NSLayoutConstraintParser parsePredicate](self, "parsePredicate");
    currentCharacter = i->_currentCharacter;
    if (currentCharacter >= i->_lineLength || i->_lineChars[currentCharacter] != 44)
      break;
    i->_currentCharacter = currentCharacter + 1;
  }
}

+ (id)constraintsWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  NSLayoutConstraintParser *v6;
  id v7;

  v6 = -[NSLayoutConstraintParser initWithFormat:options:metrics:views:]([NSLayoutConstraintParser alloc], "initWithFormat:options:metrics:views:", a3, a4, a5, a6);
  -[NSLayoutConstraintParser parse](v6, "parse");
  v7 = -[NSLayoutConstraintParser constraints](v6, "constraints");

  return v7;
}

- (void)parse
{
  unint64_t lineLength;
  const char *lineChars;
  int v5;
  const __CFString *v6;
  unint64_t currentCharacter;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t i;
  unint64_t v12;
  int v13;

  if (self->_currentCharacter)
    return;
  lineLength = self->_lineLength;
  if (!lineLength)
    goto LABEL_8;
  lineChars = self->_lineChars;
  v5 = *(unsigned __int8 *)lineChars;
  if (v5 == 72)
  {
    self->_useHorizontalArrangement = 1;
    self->_currentCharacter = 1;
    if (lineLength < 2 || lineChars[1] != 58)
    {
      v6 = CFSTR("Expected ':' after 'H' to specify horizontal arrangement");
      goto LABEL_13;
    }
LABEL_11:
    self->_currentCharacter = 2;
    goto LABEL_14;
  }
  if (v5 != 86)
  {
LABEL_8:
    self->_useHorizontalArrangement = 1;
    goto LABEL_14;
  }
  self->_useHorizontalArrangement = 0;
  self->_currentCharacter = 1;
  if (lineLength >= 2 && lineChars[1] == 58)
    goto LABEL_11;
  v6 = CFSTR("Expected ':' after 'V' to specify vertical arrangement");
LABEL_13:
  -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v6);
LABEL_14:
  currentCharacter = self->_currentCharacter;
  v8 = self->_lineLength;
  if (currentCharacter < v8 && self->_lineChars[currentCharacter] == 124)
  {
    self->_parsedLeftView = 0;
    v9 = currentCharacter + 1;
    self->_currentCharacter = v9;
    if (v9 >= v8)
    {
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a connection after the '|' character"));
    }
    else
    {
      -[NSLayoutConstraintParser parseConnection](self, "parseConnection");
      self->_parsedRightView = (NSLayoutItem *)-[NSLayoutConstraintParser parseView](self, "parseView");
      -[NSLayoutConstraintParser finishConstraint](self, "finishConstraint");
      -[NSLayoutConstraintParser flushWidthConstraints](self, "flushWidthConstraints");
      self->_parsedLeftView = self->_parsedRightView;
      self->_parsedRightView = 0;
    }
  }
  else
  {
    self->_parsedLeftView = (NSLayoutItem *)-[NSLayoutConstraintParser parseView](self, "parseView");
    -[NSLayoutConstraintParser flushWidthConstraints](self, "flushWidthConstraints");
  }
  v10 = self->_currentCharacter;
  for (i = self->_lineLength; v10 < i; i = self->_lineLength)
  {
    -[NSLayoutConstraintParser parseConnection](self, "parseConnection");
    v12 = self->_currentCharacter;
    if (v12 < self->_lineLength)
    {
      v13 = self->_lineChars[v12];
      if (v13 == 91)
      {
        self->_parsedRightView = (NSLayoutItem *)-[NSLayoutConstraintParser parseView](self, "parseView");
        -[NSLayoutConstraintParser finishConstraint](self, "finishConstraint");
        -[NSLayoutConstraintParser flushWidthConstraints](self, "flushWidthConstraints");
        self->_parsedLeftView = self->_parsedRightView;
        self->_parsedRightView = 0;
        goto LABEL_25;
      }
      if (v13 == 124)
      {
        self->_currentCharacter = v12 + 1;
        self->_parsedRightView = 0;
        -[NSLayoutConstraintParser finishConstraint](self, "finishConstraint");
        self->_parsedLeftView = 0;
        self->_parsedRightView = 0;
        v10 = self->_currentCharacter;
        i = self->_lineLength;
        break;
      }
    }
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a view or '|'"));
LABEL_25:
    v10 = self->_currentCharacter;
  }
  if (v10 < i)
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected the end of the format string"));
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", self->_alignmentConstraints);
}

- (void)finishConstraint
{
  uint64_t v3;
  void *v4;
  NSMutableArray **p_unflushedWidthConstraints;
  NSLayoutItem **v6;
  NSLayoutItem **v7;
  NSLayoutItem *v8;
  NSLayoutItem *v9;
  int v10;
  unint64_t opts;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSLayoutItem *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSLayoutItem *containerView;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSLayoutItem *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  int opts_low;
  uint64_t i;
  const __CFString *v42;
  NSLayoutItem **p_parsedLeftView;
  NSLayoutItem **p_parsedRightView;
  NSMutableArray *obj;
  char v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_incompleteConstraints;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v48)
  {
    v46 = 0;
    p_parsedLeftView = &self->_parsedLeftView;
    p_parsedRightView = &self->_parsedRightView;
    v47 = *(_QWORD *)v50;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v50 != v47)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v3);
        if (self->_parsedConstrainedWidthView)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v3), "_setFirstItem:attribute:", p_parsedLeftView, p_parsedRightView);
          p_unflushedWidthConstraints = &self->_unflushedWidthConstraints;
        }
        else
        {
          if (!self->_useHorizontalArrangement
            || (v7 = p_parsedLeftView, v6 = p_parsedRightView, (self->_opts & 0x30000) != 0x20000))
          {
            v6 = p_parsedLeftView;
            v7 = p_parsedRightView;
          }
          v8 = *v7;
          v9 = *v6;
          if (UseMarginAttributesForDefaultSpacingToSuperview_onceToken != -1)
            dispatch_once(&UseMarginAttributesForDefaultSpacingToSuperview_onceToken, &__block_literal_global_657);
          if (UseMarginAttributesForDefaultSpacingToSuperview_wantsMarginAttributeSupport)
            v10 = objc_msgSend((id)objc_msgSend(v4, "symbolicConstant"), "isEqualToString:", CFSTR("NSSpace"));
          else
            v10 = 0;
          opts = self->_opts;
          v12 = opts & 0x30000;
          if ((_CAL_sdk_version_mask & 1) != 0)
          {
            if (self->_useHorizontalArrangement && (opts & 0x80000) != 0)
              -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("BaselineToBaseline format option not valid for horizontal layout"));
            if (v9)
            {
              v17 = 4;
              if ((opts & 0x80000) != 0)
                v17 = 11;
              v18 = 2;
              if (!v12)
                v18 = 6;
              if (self->_useHorizontalArrangement)
                v19 = v18;
              else
                v19 = v17;
              v20 = v4;
              containerView = v9;
            }
            else
            {
              -[NSLayoutConstraintParser findContainerView](self, "findContainerView");
              containerView = self->_containerView;
              if (v10)
                containerView = (NSLayoutItem *)-[NSLayoutItem nsli_layoutMarginsItem](self->_containerView, "nsli_layoutMarginsItem");
              v24 = 5;
              if (v12)
                v24 = 1;
              if (self->_useHorizontalArrangement)
                v19 = v24;
              else
                v19 = 3;
              v20 = v4;
            }
            objc_msgSend(v20, "_setSecondItem:attribute:", containerView, v19, p_parsedLeftView, p_parsedRightView);
            if (v8)
            {
              v25 = 3;
              if ((opts & 0x80000) != 0)
                v25 = 12;
              v26 = 5;
              if (v12)
                v26 = 1;
              if (self->_useHorizontalArrangement)
                v27 = v26;
              else
                v27 = v25;
              objc_msgSend(v4, "_setFirstItem:attribute:", v8, v27);
            }
            else
            {
              -[NSLayoutConstraintParser findContainerView](self, "findContainerView");
              v28 = self->_containerView;
              if (v10)
                v28 = (NSLayoutItem *)-[NSLayoutItem nsli_layoutMarginsItem](self->_containerView, "nsli_layoutMarginsItem");
              v29 = 2;
              if (!v12)
                v29 = 6;
              if (self->_useHorizontalArrangement)
                v30 = v29;
              else
                v30 = 4;
              objc_msgSend(v4, "_setFirstItem:attribute:", v28, v30);
              if (!v9)
                -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("No view was specified for this constraint"));
            }
          }
          else
          {
            if (v9)
            {
              v13 = 2;
              if (!v12)
                v13 = 6;
              if (self->_useHorizontalArrangement)
                v14 = v13;
              else
                v14 = 4;
              v15 = v4;
              v16 = v9;
            }
            else
            {
              -[NSLayoutConstraintParser findContainerView](self, "findContainerView");
              if (self->_useHorizontalArrangement)
              {
                v22 = 5;
                if (v10)
                  v22 = 17;
                v23 = 13;
                if (!v10)
                  v23 = 1;
                if (v12)
                  v14 = v23;
                else
                  v14 = v22;
              }
              else if (v10)
              {
                v14 = 15;
              }
              else
              {
                v14 = 3;
              }
              v16 = self->_containerView;
              v15 = v4;
            }
            objc_msgSend(v15, "_setSecondItem:attribute:", v16, v14, p_parsedLeftView, p_parsedRightView);
            if (v8)
            {
              v31 = 5;
              if (v12)
                v31 = 1;
              if (self->_useHorizontalArrangement)
                v32 = v31;
              else
                v32 = 3;
              objc_msgSend(v4, "_setFirstItem:attribute:", v8, v32);
            }
            else
            {
              -[NSLayoutConstraintParser findContainerView](self, "findContainerView");
              if (self->_useHorizontalArrangement)
              {
                v33 = v10 == 0;
                if (v12)
                {
                  v34 = 2;
                  v35 = 14;
                }
                else
                {
                  v34 = 6;
                  v35 = 18;
                }
              }
              else
              {
                v33 = v10 == 0;
                v34 = 4;
                v35 = 16;
              }
              if (v33)
                v36 = v34;
              else
                v36 = v35;
              objc_msgSend(v4, "_setFirstItem:attribute:", self->_containerView, v36);
              if (!v9)
                -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("No view was specified for this constraint"));
            }
            if (v9)
              v37 = v8 == 0;
            else
              v37 = 1;
            if (v37 && ((v10 ^ 1) & 1) == 0)
            {
              objc_msgSend(v4, "setSymbolicConstant:", 0);
              objc_msgSend(v4, "setConstant:", 0.0);
            }
          }
          opts_low = LOWORD(self->_opts);
          p_unflushedWidthConstraints = &self->_constraints;
          if (!((LOWORD(self->_opts) == 0) | v46 & 1))
          {
            for (i = 1; i != 13; ++i)
            {
              if ((opts_low & (1 << i)) != 0 && v9 != 0 && v8 != 0)
              {
                if (self->_useHorizontalArrangement == ((i > 0xC) | (0x2E6u >> i) & 1))
                {
                  v42 = CFSTR("Options mask required views to be aligned on a horizontal edge, which is not allowed for layout that is also horizontal.");
                  if (i <= 0xC)
                    v42 = off_1E4A493B0[i];
                  -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v42);
                }
                -[NSMutableArray addObject:](self->_alignmentConstraints, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, i, 0, v8, i));
              }
            }
            v46 = 1;
            p_unflushedWidthConstraints = &self->_constraints;
          }
        }
        ConstraintDidPerformInitialSetup((uint64_t)v4);
        -[NSMutableArray addObject:](*p_unflushedWidthConstraints, "addObject:", v4);
        ++v3;
      }
      while (v3 != v48);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v48);
  }
  -[NSMutableArray removeAllObjects](self->_incompleteConstraints, "removeAllObjects");
}

- (void)parseConnection
{
  unint64_t currentCharacter;
  unint64_t lineLength;
  const char *lineChars;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  const __CFString *v10;
  NSLayoutConstraint *v11;

  currentCharacter = self->_currentCharacter;
  lineLength = self->_lineLength;
  if (currentCharacter >= lineLength || (lineChars = self->_lineChars, lineChars[currentCharacter] != 45))
  {
    v11 = objc_alloc_init(NSLayoutConstraint);
    *(_DWORD *)((char *)&v11->_layoutConstraintFlags + 2) |= 0x40u;
    -[NSLayoutConstraint _setRelation:](v11, "_setRelation:", 0);
    goto LABEL_8;
  }
  v6 = currentCharacter + 1;
  self->_currentCharacter = v6;
  if (v6 < lineLength)
  {
    v7 = lineChars[v6];
    if (v7 == 124 || v7 == 91)
    {
      v11 = objc_alloc_init(NSLayoutConstraint);
      *(_DWORD *)((char *)&v11->_layoutConstraintFlags + 2) |= 0x40u;
      -[NSLayoutConstraint _setRelation:](v11, "_setRelation:", 0);
      -[NSLayoutConstraint setSymbolicConstant:](v11, "setSymbolicConstant:", CFSTR("NSSpace"));
LABEL_8:
      -[NSMutableArray addObject:](self->_incompleteConstraints, "addObject:", v11);

      return;
    }
  }
  -[NSLayoutConstraintParser parsePredicateWithParentheses](self, "parsePredicateWithParentheses");
  v8 = self->_currentCharacter;
  if (v8 < self->_lineLength)
  {
    v9 = self->_lineChars[v8];
    if (v9 == 44)
    {
      v10 = CFSTR("Expected a '-' here. To specify a list of constraints, you must use parentheses around the list of constraints");
      goto LABEL_15;
    }
    if (v9 == 45)
    {
      self->_currentCharacter = v8 + 1;
      return;
    }
  }
  v10 = CFSTR("Expected a '-' here");
LABEL_15:
  -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v10);
}

- (void)findContainerView
{
  NSLayoutItem *parsedLeftView;
  NSLayoutItem *v4;

  parsedLeftView = self->_parsedLeftView;
  if (!parsedLeftView)
    parsedLeftView = self->_parsedRightView;
  v4 = (NSLayoutItem *)-[NSLayoutItem nsli_superitem](parsedLeftView, "nsli_superitem");
  self->_containerView = v4;
  if (!v4)
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Unable to interpret '|' character, because the related view doesn't have a superview"));
}

- (void)parsePredicate
{
  void *v3;
  unint64_t currentCharacter;
  double v5;
  uint64_t v6;

  -[NSLayoutConstraintParser parseOp](self, "parseOp");
  v3 = (void *)-[NSMutableArray lastObject](self->_incompleteConstraints, "lastObject");
  -[NSLayoutConstraintParser parseConstant](self, "parseConstant");
  objc_msgSend(v3, "setConstant:");
  currentCharacter = self->_currentCharacter;
  if (currentCharacter < self->_lineLength && self->_lineChars[currentCharacter] == 64)
  {
    self->_currentCharacter = currentCharacter + 1;
    -[NSLayoutConstraintParser parseConstant](self, "parseConstant");
    if (v5 <= 0.0)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid priority specified: %g. Priority must be greater than 0"), *(_QWORD *)&v5);
      goto LABEL_8;
    }
    if (v5 > 1000.0)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid priority specified: %g. Priority cannot be higher than NSLayoutPriorityRequired, which is 1000."), *(_QWORD *)&v5);
LABEL_8:
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v6);
      return;
    }
    *(float *)&v5 = v5;
    objc_msgSend(v3, "setPriority:", v5);
  }
}

- (void)parseOp
{
  unint64_t currentCharacter;
  int v4;
  NSLayoutConstraint *v5;
  uint64_t v6;
  unint64_t v7;
  NSLayoutConstraint *v8;

  currentCharacter = self->_currentCharacter;
  if (currentCharacter >= self->_lineLength)
  {
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected more input"));
    return;
  }
  v4 = self->_lineChars[currentCharacter];
  if ((v4 - 60) <= 2)
  {
    switch(v4)
    {
      case '<':
        v5 = objc_alloc_init(NSLayoutConstraint);
        v8 = v5;
        v6 = -1;
        break;
      case '>':
        v5 = objc_alloc_init(NSLayoutConstraint);
        v8 = v5;
        v6 = 1;
        break;
      case '=':
        v5 = objc_alloc_init(NSLayoutConstraint);
        v8 = v5;
        v6 = 0;
        break;
      default:
        v8 = 0;
        goto LABEL_13;
    }
    -[NSLayoutConstraint _setRelation:](v5, "_setRelation:", v6);
LABEL_13:
    v7 = self->_currentCharacter;
    self->_currentCharacter = v7 + 1;
    if (v7 + 1 < self->_lineLength && self->_lineChars[v7 + 1] == 61)
      self->_currentCharacter = v7 + 2;
    else
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Unknown relation. Must be ==, >=, or <="));
    goto LABEL_17;
  }
  v8 = objc_alloc_init(NSLayoutConstraint);
  -[NSLayoutConstraint _setRelation:](v8, "_setRelation:", 0);
LABEL_17:
  if (v8)
  {
    *(_DWORD *)((char *)&v8->_layoutConstraintFlags + 2) |= 0x40u;
    -[NSMutableArray addObject:](self->_incompleteConstraints, "addObject:", v8);

  }
}

- (double)parseConstant
{
  unint64_t currentCharacter;
  const char *v4;
  int v5;
  double v7;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  currentCharacter = self->_currentCharacter;
  if (currentCharacter >= self->_lineLength)
    goto LABEL_15;
  v4 = &self->_lineChars[currentCharacter];
  v5 = *(unsigned __int8 *)v4;
  if (v5 != 45 && (v5 - 48) > 9)
  {
    if (v5 == 95 || (v5 & 0xFFFFFFDF) - 65 <= 0x19)
    {
      v12 = -[NSLayoutConstraintParser rangeOfName](self, "rangeOfName");
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &self->_lineChars[v12], v13, 1);
      v15 = -[NSDictionary objectForKey:](self->_metrics, "objectForKey:", v14);
      if (v15)
      {
        objc_msgSend(v15, "doubleValue");
        v7 = v16;
LABEL_27:

        return v7;
      }
      v18 = -[NSDictionary objectForKey:](self->_views, "objectForKey:", v14);
      if (v18)
      {
        if (self->_parsedConstrainedWidthView)
        {
          v19 = v18;
          v20 = (void *)-[NSMutableArray lastObject](self->_incompleteConstraints, "lastObject");
          if (self->_useHorizontalArrangement)
            v21 = 7;
          else
            v21 = 8;
          objc_msgSend(v20, "_setSecondItem:attribute:", v19, v21);
          goto LABEL_26;
        }
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("It's not possible to set a space equal to the width or height of a view.  Perhaps you want to use a view as a spacer? [view1][spacer(==view1)][view2]"), v23);
      }
      else
      {
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encountered metric with name \"%@\", but value was not specified in metrics or views dictionaries"), v14);
      }
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v22);
LABEL_26:
      v7 = 0.0;
      goto LABEL_27;
    }
LABEL_15:
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a number or key from the metrics dictionary, but encountered something else"));
    return 0.0;
  }
  v24 = 0;
  v7 = strtod_l(v4, &v24, 0);
  v8 = self->_currentCharacter;
  v9 = (char *)&self->_lineChars[v8];
  v10 = (char *)(v24 - v9);
  if (v24 == v9)
  {
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a number or a key from the metrics dictionary, but encountered something else"));
    v8 = self->_currentCharacter;
  }
  self->_currentCharacter = (unint64_t)&v10[v8];
  return v7;
}

- (id)parseView
{
  unint64_t currentCharacter;
  unint64_t lineLength;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSLayoutItem *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  NSMutableArray *incompleteConstraints;
  unint64_t v16;
  unint64_t v17;
  const char *lineChars;
  const __CFString *v20;

  currentCharacter = self->_currentCharacter;
  lineLength = self->_lineLength;
  if (currentCharacter < lineLength && self->_lineChars[currentCharacter] == 91)
  {
    v5 = currentCharacter + 1;
    self->_currentCharacter = v5;
    if (v5 >= lineLength)
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a view"));
    v6 = -[NSLayoutConstraintParser rangeOfName](self, "rangeOfName");
    v8 = v7;
    if (!v7)
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a view. View names must start with a letter or an underscore, then contain letters, numbers, and underscores."));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &self->_lineChars[v6], v8, 1);
    v10 = -[NSDictionary objectForKey:](self->_views, "objectForKey:", v9);
    if (!v10)
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a key in the views dictionary."), v9));

    self->_parsedConstrainedWidthView = v10;
    v11 = self->_currentCharacter;
    v12 = self->_lineLength;
    if (v11 < v12)
    {
      v13 = self->_lineChars[v11];
      if (v13 == 93)
      {
        self->_currentCharacter = v11 + 1;
        goto LABEL_21;
      }
      if (v13 == 40)
      {
        v14 = v11 + 1;
        self->_currentCharacter = v14;
        if (v14 >= v12)
          -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Unexpectedly ran out of character fodder in the middle of parsing a view"));
        incompleteConstraints = self->_incompleteConstraints;
        self->_incompleteConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSLayoutConstraintParser parsePredicateList](self, "parsePredicateList");
        v16 = self->_currentCharacter;
        v17 = self->_lineLength;
        if (v16 < v17 && (lineChars = self->_lineChars, lineChars[v16] == 41))
        {
          self->_currentCharacter = v16 + 1;
          if (v16 + 1 < v17 && lineChars[v16 + 1] == 93)
          {
            self->_currentCharacter = v16 + 2;
            -[NSLayoutConstraintParser finishConstraint](self, "finishConstraint");
LABEL_26:

            self->_incompleteConstraints = incompleteConstraints;
            goto LABEL_21;
          }
          v20 = CFSTR("Expected ']' after specifying thickness.");
        }
        else
        {
          v20 = CFSTR("A predicate on a view's thickness must end with ')' and the view must end with ']'");
        }
        -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v20);
        goto LABEL_26;
      }
    }
    -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a ']' here. That is how you give the end of a view."));
LABEL_21:
    self->_parsedConstrainedWidthView = 0;
    return v10;
  }
  -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", CFSTR("Expected a view"));
  return 0;
}

- (_NSRange)rangeOfName
{
  NSUInteger currentCharacter;
  unint64_t lineLength;
  NSUInteger v5;
  const char *lineChars;
  int v7;
  BOOL v8;
  unint64_t v9;
  int v10;
  NSUInteger v12;
  _NSRange result;

  currentCharacter = self->_currentCharacter;
  lineLength = self->_lineLength;
  v5 = currentCharacter;
  if (currentCharacter < lineLength)
  {
    lineChars = self->_lineChars;
    v7 = lineChars[currentCharacter];
    v8 = v7 != 95 && (v7 & 0xFFFFFFDF) - 65 > 0x19;
    v5 = currentCharacter;
    if (!v8)
    {
      v9 = currentCharacter + 1;
      do
      {
        v5 = v9;
        self->_currentCharacter = v9;
        if (v9 >= lineLength)
          break;
        v10 = lineChars[v9++];
      }
      while ((v10 - 48) < 0xA || v10 == 95 || (v10 & 0xFFFFFFDF) - 65 < 0x1A);
    }
  }
  v12 = v5 - currentCharacter;
  result.length = v12;
  result.location = currentCharacter;
  return result;
}

- (void)flushWidthConstraints
{
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", self->_unflushedWidthConstraints);
  -[NSMutableArray removeAllObjects](self->_unflushedWidthConstraints, "removeAllObjects");
}

- (NSLayoutConstraintParser)initWithFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  NSLayoutConstraintParser *v10;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSLayoutConstraintParser;
  v10 = -[NSLayoutConstraintParser init](&v15, sel_init);
  if (v10)
  {
    _CALSDKVersionInit();
    v10->_line = (NSString *)a3;
    v10->_lineChars = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 1);
    v10->_lineLength = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 1);
    v10->_opts = a4;
    v10->_currentCharacter = 0;
    v10->_constraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_incompleteConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_unflushedWidthConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (LOWORD(v10->_opts))
      v10->_alignmentConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_metrics = (NSDictionary *)a5;
    v10->_views = (NSDictionary *)a6;
    if (v10->_lineLength)
    {
      if (v10->_lineChars)
        return v10;
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = CFSTR("Unable to parse constraint format: It contains non-ASCII characters.");
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = CFSTR("Unable to parse constraint format: It's an empty string.");
    }
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0));
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraintParser;
  -[NSLayoutConstraintParser dealloc](&v3, sel_dealloc);
}

- (id)constraints
{
  return self->_constraints;
}

- (void)parsePredicateWithParentheses
{
  unint64_t currentCharacter;
  int v4;
  unint64_t v5;
  const __CFString *v6;

  currentCharacter = self->_currentCharacter;
  if (currentCharacter >= self->_lineLength)
    goto LABEL_7;
  v4 = self->_lineChars[currentCharacter];
  if (v4 != 45)
  {
    if (v4 == 40)
    {
      self->_currentCharacter = currentCharacter + 1;
      -[NSLayoutConstraintParser parsePredicateList](self, "parsePredicateList");
      v5 = self->_currentCharacter;
      if (v5 < self->_lineLength && self->_lineChars[v5] == 41)
      {
        self->_currentCharacter = v5 + 1;
        return;
      }
      v6 = CFSTR("Expected a ')' at the end of a constraint modifier, or a ',' before another constraint modifier");
      goto LABEL_10;
    }
LABEL_7:
    -[NSLayoutConstraintParser parsePredicate](self, "parsePredicate");
    return;
  }
  v6 = CFSTR("Cannot tell if this - is a minus sign or an accidental extra bar in the connection. Use parentheses around negative numbers.");
LABEL_10:
  -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", v6);
}

- (uint64_t)descriptionLineWithCurrentCharacterPointer
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  const __CFString *v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = 0;
    v4 = *(_QWORD *)(v1 + 96);
    do
    {
      if (v3 == v4)
        v5 = CFSTR("^");
      else
        v5 = CFSTR(" ");
      objc_msgSend(v2, "appendFormat:", v5);
      ++v3;
      v4 = *(_QWORD *)(v1 + 96);
    }
    while (v3 <= v4);
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n%@"), *(_QWORD *)(v1 + 8), v2);
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \n%@>"), v4, self, -[NSLayoutConstraintParser descriptionLineWithCurrentCharacterPointer]((uint64_t)self));
}

- (void)failWithDescription:(id)a3
{
  void *v5;
  unint64_t v6;
  unint64_t currentCharacter;
  const __CFString *v8;
  void *v9;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = 0;
  currentCharacter = self->_currentCharacter;
  while (1)
  {
    if (v6 == currentCharacter)
      v8 = CFSTR("^");
    else
      v8 = CFSTR(" ");
    objc_msgSend(v5, "appendFormat:", v8);
    ++v6;
    currentCharacter = self->_currentCharacter;
    if (v6 > currentCharacter)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse constraint format: \n%@ \n%@"), a3, -[NSLayoutConstraintParser descriptionLineWithCurrentCharacterPointer]((uint64_t)self)), 0);
      objc_exception_throw(v9);
    }
  }
}

- (uint64_t)metricForKey:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "objectForKey:", a2);
  return result;
}

- (uint64_t)layoutItemForKey:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "objectForKey:", a2);
  return result;
}

@end
