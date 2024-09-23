@implementation NSStringFromCoverSheetCapability

void __NSStringFromCoverSheetCapability_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  id v5;

  if (a2 < 0x2000)
  {
    if (a2 <= 127)
    {
      if (a2 <= 7)
      {
        if (a2 == 2)
        {
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("Siri");
          goto LABEL_54;
        }
        if (a2 == 4)
        {
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("Camera");
          goto LABEL_54;
        }
      }
      else
      {
        switch(a2)
        {
          case 8:
            v2 = *(void **)(a1 + 32);
            v3 = CFSTR("TouchID");
            goto LABEL_54;
          case 16:
            v2 = *(void **)(a1 + 32);
            v3 = CFSTR("PreArm");
            goto LABEL_54;
          case 64:
            v2 = *(void **)(a1 + 32);
            v3 = CFSTR("TodayCenter");
            goto LABEL_54;
        }
      }
    }
    else if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("Continuity");
          goto LABEL_54;
        case 2048:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("Logout");
          goto LABEL_54;
        case 4096:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("DismissCoverSheet");
          goto LABEL_54;
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("ControlCenter");
          goto LABEL_54;
        case 256:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("LivePhotos");
          goto LABEL_54;
        case 512:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("MediaControls");
          goto LABEL_54;
      }
    }
  }
  else if (a2 >= 0x100000)
  {
    if (a2 >= 0x800000)
    {
      switch(a2)
      {
        case 0x800000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("PosterSwitcher");
          goto LABEL_54;
        case 0x1000000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("LaunchFromWidget");
          goto LABEL_54;
        case 0x4000000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("Inherit");
          goto LABEL_54;
      }
    }
    else
    {
      switch(a2)
      {
        case 0x100000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("AccessoryPresentation");
          goto LABEL_54;
        case 0x200000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("CoverSheetSpotlight");
          goto LABEL_54;
        case 0x400000:
          v2 = *(void **)(a1 + 32);
          v3 = CFSTR("FocusActivityButton");
          goto LABEL_54;
      }
    }
  }
  else if (a2 >= 0x10000)
  {
    switch(a2)
    {
      case 0x10000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("NotificationReveal");
        goto LABEL_54;
      case 0x20000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("NotificationInteract");
        goto LABEL_54;
      case 0x80000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("HostedRemoteContent");
        goto LABEL_54;
    }
  }
  else
  {
    switch(a2)
    {
      case 0x2000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("QuickNote");
        goto LABEL_54;
      case 0x4000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("Screenshot");
        goto LABEL_54;
      case 0x8000:
        v2 = *(void **)(a1 + 32);
        v3 = CFSTR("ProudLockUpdates");
LABEL_54:
        objc_msgSend(v2, "addObject:", v3);
        return;
    }
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Other Capability: %lu"), a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

@end
