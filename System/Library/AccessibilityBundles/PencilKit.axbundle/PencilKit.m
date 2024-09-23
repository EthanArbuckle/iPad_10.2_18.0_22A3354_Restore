id accessibilityPencilKitLocalizedString(void *a1)
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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502F6348, CFSTR("AccessibilityPencilKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id accessibilityNameForInkIdentifier(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3438]) & 1) != 0)
  {
    v2 = CFSTR("pen.tool");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3440]) & 1) != 0)
  {
    v2 = CFSTR("pencil.tool");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3428]) & 1) != 0)
  {
    v2 = CFSTR("marker.tool");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3418]) & 1) != 0)
  {
    v2 = CFSTR("eraser.tool");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3430]) & 1) != 0)
  {
    v2 = CFSTR("object.eraser.tool");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3420]) & 1) != 0)
  {
    v2 = CFSTR("lasso.tool");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDE3460]))
    {
      v3 = 0;
      goto LABEL_16;
    }
    v2 = CFSTR("ruler.tool");
  }
  accessibilityPencilKitLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v3;
}

id accessibilityPencilKitNameForWeight(double a1)
{
  __CFString *v1;
  id result;

  if (a1 > 1.0)
    a1 = 1.0;
  switch(llround((fmax(a1, -1.0) + 1.0) * 0.5 * 4.0))
  {
    case 0uLL:
      v1 = CFSTR("tool.weight.verylight");
      goto LABEL_10;
    case 1uLL:
      v1 = CFSTR("tool.weight.light");
      goto LABEL_10;
    case 2uLL:
      v1 = CFSTR("tool.weight.medium");
      goto LABEL_10;
    case 3uLL:
      v1 = CFSTR("tool.weight.heavy");
      goto LABEL_10;
    case 4uLL:
      v1 = CFSTR("tool.weight.veryheavy");
LABEL_10:
      accessibilityPencilKitLocalizedString(v1);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      _AXAssert();
      result = 0;
      break;
  }
  return result;
}

void sub_2328BA5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
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

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

