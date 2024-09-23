@implementation SwappableViewControllerImplementationFactory

+ (BOOL)shouldUseOutOfProcessUI
{
  return objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp") ^ 1;
}

+ (id)eventViewControllerImpl
{
  return (id)objc_msgSend(a1, "eventViewControllerImplWithRemoteUI:", objc_msgSend(a1, "shouldUseOutOfProcessUI"));
}

+ (id)eventViewControllerImplWithRemoteUI:(BOOL)a3
{
  __objc2_class **v3;
  int v4;

  if (a3)
  {
    v3 = off_1E6015B50;
  }
  else
  {
    v4 = objc_msgSend(a1, "showModernViewControllers");
    v3 = off_1E6015B40;
    if (v4)
      v3 = off_1E6015B48;
  }
  return objc_alloc_init(*v3);
}

+ (id)eventEditViewControllerImpl
{
  return (id)objc_msgSend(a1, "eventEditViewControllerImplWithRemoteUI:", objc_msgSend(a1, "shouldUseOutOfProcessUI"));
}

+ (id)eventEditViewControllerImplWithRemoteUI:(BOOL)a3
{
  __objc2_class **v3;
  int v4;

  if (a3)
  {
    v3 = off_1E6015A98;
  }
  else
  {
    v4 = objc_msgSend(a1, "showModernViewControllers");
    v3 = off_1E6015A88;
    if (v4)
      v3 = off_1E6015A90;
  }
  return objc_alloc_init(*v3);
}

+ (id)calendarChooserImplWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v17 = a8;
  v18 = a7;
  v19 = a6;
  BYTE2(v22) = a11;
  LOWORD(v22) = __PAIR16__(a10, a9);
  objc_msgSend(a1, "calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", objc_msgSend(a1, "shouldUseOutOfProcessUI"), a3, a4, a5, v19, v18, v17, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)calendarChooserImplWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12
{
  __objc2_class **v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;

  v17 = off_1E6015868;
  if (!a3)
    v17 = off_1E6015860;
  v18 = (objc_class *)*v17;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  BYTE2(v24) = a12;
  LOWORD(v24) = __PAIR16__(a11, a10);
  v22 = (void *)objc_msgSend([v18 alloc], "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a4, a5, a6, v21, v20, v19, v24);

  return v22;
}

+ (id)proposedTimeEventViewControllerImpl
{
  int v2;
  __objc2_class **v3;

  v2 = objc_msgSend(a1, "showModernViewControllers");
  v3 = off_1E6016048;
  if (!v2)
    v3 = off_1E6016040;
  return objc_alloc_init(*v3);
}

+ (BOOL)showModernViewControllers
{
  int v2;
  id v3;
  void *v4;
  char v5;

  if ((_os_feature_enabled_impl() & 1) != 0 || (v2 = _os_feature_enabled_impl()) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = (void *)objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    v5 = objc_msgSend(v4, "getBooleanPreference:defaultValue:", *MEMORY[0x1E0D0C4F0], 0);

    LOBYTE(v2) = v5;
  }
  return v2;
}

@end
