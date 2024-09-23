id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250349750, CFSTR("Accessibility-Seymour"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _accessibilityStringForBurnBarPosition(unint64_t a1, int a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  if (a1 > 4)
  {
    v3 = 0;
    if (!a2)
      goto LABEL_3;
LABEL_5:
    accessibilityLocalizedString(CFSTR("burn.bar.title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLabelForElements();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  accessibilityLocalizedString(off_2503483F8[a1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    goto LABEL_5;
LABEL_3:
  v4 = v3;
LABEL_6:

  return v4;
}

uint64_t _accessibilityReplaceStylsticBulletsForSpeaking(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" • "), CFSTR(" , "));
}

id _accessibilityStringForHealthKitWorkoutType(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __CFString *v3;

  v1 = 0;
  v2 = a1 - 8;
  v3 = CFSTR("workout.icon.barre");
  switch(v2)
  {
    case 0:
      v3 = CFSTR("workout.icon.boxing");
      goto LABEL_33;
    case 1:
      v3 = CFSTR("workout.icon.climbing");
      goto LABEL_33;
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 21:
    case 22:
    case 23:
    case 26:
    case 28:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 37:
    case 39:
    case 40:
    case 41:
    case 43:
    case 46:
    case 47:
    case 48:
    case 52:
    case 53:
    case 59:
    case 62:
    case 63:
    case 65:
    case 67:
    case 68:
    case 70:
    case 71:
      return v1;
    case 5:
      v3 = CFSTR("workout.icon.cycling");
      goto LABEL_33;
    case 8:
      v3 = CFSTR("workout.icon.elliptical");
      goto LABEL_33;
    case 12:
      v3 = CFSTR("workout.icon.functionalStrengthTraining");
      goto LABEL_33;
    case 16:
      v3 = CFSTR("workout.icon.hiking");
      goto LABEL_33;
    case 20:
      v3 = CFSTR("workout.icon.martialArts");
      goto LABEL_33;
    case 24:
      v3 = CFSTR("workout.icon.play");
      goto LABEL_33;
    case 25:
      v3 = CFSTR("workout.icon.preparationAndRecovery");
      goto LABEL_33;
    case 27:
      v3 = CFSTR("workout.icon.rowing");
      goto LABEL_33;
    case 29:
      v3 = CFSTR("workout.icon.running");
      goto LABEL_33;
    case 36:
      v3 = CFSTR("workout.icon.stairClimbing");
      goto LABEL_33;
    case 38:
      v3 = CFSTR("workout.icon.swimming");
      goto LABEL_33;
    case 42:
      v3 = CFSTR("workout.icon.traditionalStrengthTraining");
      goto LABEL_33;
    case 44:
      v3 = CFSTR("workout.icon.walking");
      goto LABEL_33;
    case 45:
      v3 = CFSTR("workout.icon.waterFitness");
      goto LABEL_33;
    case 49:
      v3 = CFSTR("workout.icon.yoga");
      goto LABEL_33;
    case 50:
      goto LABEL_33;
    case 51:
      v3 = CFSTR("workout.icon.coreTraining");
      goto LABEL_33;
    case 54:
      v3 = CFSTR("workout.icon.flexibility");
      goto LABEL_33;
    case 55:
      v3 = CFSTR("workout.icon.highIntensityIntervalTraining");
      goto LABEL_33;
    case 56:
      v3 = CFSTR("workout.icon.jumpRope");
      goto LABEL_33;
    case 57:
      v3 = CFSTR("workout.icon.kickboxing");
      goto LABEL_33;
    case 58:
      v3 = CFSTR("workout.icon.pilates");
      goto LABEL_33;
    case 60:
      v3 = CFSTR("workout.icon.stairs");
      goto LABEL_33;
    case 61:
      v3 = CFSTR("workout.icon.stepTraining");
      goto LABEL_33;
    case 64:
      v3 = CFSTR("workout.icon.taiChi");
      goto LABEL_33;
    case 66:
      v3 = CFSTR("workout.icon.handCycling");
      goto LABEL_33;
    case 69:
      v3 = CFSTR("workout.icon.dance");
      goto LABEL_33;
    case 72:
      v3 = CFSTR("workout.icon.cooldown");
      goto LABEL_33;
    default:
      if (CFSTR("workout.icon.barre") != (__CFString *)3000)
        return v1;
      v3 = CFSTR("workout.icon.other");
LABEL_33:
      accessibilityLocalizedString(v3);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      return v1;
  }
}

__CFString *_accessibilityDescriptionForMediaTags(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  v1 = a1;
  if (objc_msgSend(v1, "containsObject:", CFSTR("Closed Caption")))
  {
    accessibilityLocalizedString(CFSTR("media.tags.closed.captions.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = &stru_250349750;
  }
  if (objc_msgSend(v1, "containsObject:", CFSTR("Subtitle"), v7, v11))
  {
    accessibilityLocalizedString(CFSTR("media.tags.subtitles.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
  if (objc_msgSend(v1, "containsObject:", CFSTR("Explicit Icon"), v8, v12))
  {
    accessibilityLocalizedString(CFSTR("media.tags.explicit.label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v4;
  }
  if (objc_msgSend(v1, "containsObject:", CFSTR("Audio Hints"), v9, v13))
  {
    accessibilityLocalizedString(CFSTR("media.tags.audio.hints.label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v5;
  }

  return v2;
}

void sub_2329AD724(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2329ADEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2329ADF38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXDurationForDurationString()
{
  return MEMORY[0x24BE00050]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x24BE00058]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x24BDFE8F8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDF7218](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

