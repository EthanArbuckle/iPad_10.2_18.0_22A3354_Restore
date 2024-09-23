void sub_22AD04BB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22AD05C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXRUIImageForRemoteAction(void *a1)
{
  id v1;
  uint64_t Type;
  void *v3;

  v1 = a1;
  Type = AXDeviceGetType();
  AXRUIImageForRemoteActionWithDeviceType(v1, Type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXRUIImageForRemoteActionWithDeviceType(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  __CFString **v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF5F0]))
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF5E0]))
    {
      v4 = a2 - 1;
      if ((unint64_t)(a2 - 1) < 5)
      {
        v5 = off_24F4F6D28;
        goto LABEL_8;
      }
LABEL_63:
      v9 = 0;
      goto LABEL_64;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF630]) & 1) != 0)
    {
      v6 = CFSTR("bell.badge.fill");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF5E8]) & 1) != 0)
    {
      v6 = CFSTR("switch.2");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF640]) & 1) != 0)
    {
      v6 = CFSTR("siri");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF680]) & 1) != 0)
    {
      v6 = CFSTR("chevron.backward.circle");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF688]) & 1) != 0)
      goto LABEL_18;
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF648]) & 1) != 0)
    {
      v6 = CFSTR("circle.circle.fill");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF650]) & 1) != 0)
    {
      v6 = CFSTR("square.grid.3x3.square");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF670]) & 1) != 0)
    {
      v6 = CFSTR("play.circle.fill");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF668]) & 1) != 0)
    {
LABEL_18:
      v6 = CFSTR("circle.fill");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF658]) & 1) != 0)
    {
LABEL_27:
      v6 = CFSTR("chevron.forward.2");
      goto LABEL_34;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF660]) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF678]) & 1) != 0)
      {
        v6 = CFSTR("stop.circle.fill");
        goto LABEL_34;
      }
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6E0]) & 1) != 0)
      {
        v6 = CFSTR("hand.tap.fill");
        goto LABEL_34;
      }
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF690]) & 1) != 0)
        goto LABEL_27;
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6A8]) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6A0]) & 1) != 0)
        {
          v6 = CFSTR("arrow.clockwise");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6B8]) & 1) != 0)
        {
          v6 = CFSTR("arrow.counterclockwise");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF698]) & 1) != 0)
        {
          v6 = CFSTR("arrow.turn.right.down");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6B0]) & 1) != 0)
        {
          v6 = CFSTR("arrow.turn.left.up");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6D8]) & 1) != 0)
        {
          v6 = CFSTR("arrow.up.circle.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6C0]) & 1) != 0)
        {
          v6 = CFSTR("arrow.down.circle.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6C8]) & 1) != 0)
        {
          v6 = CFSTR("arrow.left.circle.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF6D0]) & 1) != 0)
        {
          v6 = CFSTR("arrow.right.circle.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF600]) & 1) != 0)
        {
          v6 = CFSTR("playpause.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF5F8]) & 1) != 0)
        {
          v6 = CFSTR("forward.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF608]) & 1) != 0)
        {
          v6 = CFSTR("backward.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF618]) & 1) != 0)
        {
          v6 = CFSTR("speaker.wave.2.fill");
          goto LABEL_34;
        }
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF610]) & 1) != 0)
        {
          v6 = CFSTR("speaker.wave.1.fill");
          goto LABEL_34;
        }
        goto LABEL_63;
      }
    }
    v6 = CFSTR("chevron.backward.2");
    goto LABEL_34;
  }
  v4 = a2 - 1;
  if ((unint64_t)(a2 - 1) >= 7 || ((0x5Fu >> v4) & 1) == 0)
    goto LABEL_63;
  v5 = off_24F4F6CF0;
LABEL_8:
  v6 = v5[v4];
LABEL_34:
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7858]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_systemImageNamed:withConfiguration:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_64:
  return v9;
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x24BDFFF40]();
}

uint64_t AXLocalizedStringForHandGestureEventUsage()
{
  return MEMORY[0x24BE001E0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BE00290]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BE00298]();
}

uint64_t AXRLocalizedStringForKey()
{
  return MEMORY[0x24BDFF708]();
}

uint64_t AXRLocalizedStringForRemoteActionWithDeviceType()
{
  return MEMORY[0x24BDFF710]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

