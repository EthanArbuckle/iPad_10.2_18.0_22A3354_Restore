@implementation PHCarPlayNumberPad

- (PHCarPlayNumberPad)initWithUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  id v6;
  PHCarPlayNumberPad *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPDialerNumberPad dialerNumberPadFullCharacters](TPDialerNumberPad, "dialerNumberPadFullCharacters"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009A5C0;
  v10[3] = &unk_100286ED0;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v12 = a3;
  v6 = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v9.receiver = self;
  v9.super_class = (Class)PHCarPlayNumberPad;
  v7 = -[PHCarPlayNumberPad initWithButtons:](&v9, "initWithButtons:", v6);

  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayNumberPad;
  -[PHCarPlayNumberPad didUpdateFocusInContext:withAnimationCoordinator:](&v21, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));
  v9 = objc_opt_class(PHCarPlayNumberPadButton, v8);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonColor"));
    objc_msgSend(v11, "setColor:", v12);

    -[PHCarPlayNumberPad setCurrentlyFocusedButton:](self, "setCurrentlyFocusedButton:", 13);
  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
    v17 = objc_opt_class(PHCarPlayNumberPadButton, v16);
    v18 = objc_opt_isKindOfClass(v15, v17);

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "buttonColor"));
      objc_msgSend(v19, "setColor:", v20);

      -[PHCarPlayNumberPad setCurrentlyFocusedButton:](self, "setCurrentlyFocusedButton:", objc_msgSend(v19, "character"));
    }
  }

}

- (void)performTapActionDownForHighlightedKey
{
  id v3;

  if ((id)-[PHCarPlayNumberPad currentlyFocusedButton](self, "currentlyFocusedButton") != (id)13)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayNumberPad delegate](self, "delegate"));
    objc_msgSend(v3, "phonePad:appendString:", self, off_100286E68[-[PHCarPlayNumberPad currentlyFocusedButton](self, "currentlyFocusedButton")]);

  }
}

- (id)_linearFocusMovementSequences
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNumberPad buttons](self, "buttons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_UIFocusLinearMovementSequence sequenceWithItems:loops:](_UIFocusLinearMovementSequence, "sequenceWithItems:loops:", v2, 0));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (int64_t)currentlyFocusedButton
{
  return self->_currentlyFocusedButton;
}

- (void)setCurrentlyFocusedButton:(int64_t)a3
{
  self->_currentlyFocusedButton = a3;
}

@end
