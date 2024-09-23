@implementation NTKFaceComplicationConfiguration

- (id)complicationSlotDescriptors
{
  return 0;
}

- (id)defaultSelectedComplicationSlotForDevice:(id)a3
{
  return 0;
}

- (id)localizedNameForComplicationSlot:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultLocalizedNameForComplicationSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultLocalizedNameForComplicationSlot:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v4 = CFSTR("TOP_LEFT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v4 = CFSTR("TOP_RIGHT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top")) & 1) != 0)
  {
    v4 = CFSTR("TOP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v4 = CFSTR("BOTTOM_LEFT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-right")) & 1) != 0)
  {
    v4 = CFSTR("BOTTOM_RIGHT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-center")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
  {
    v4 = CFSTR("BOTTOM");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("center")) & 1) != 0)
  {
    v4 = CFSTR("CENTER");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("date")) & 1) != 0)
  {
    v4 = CFSTR("DATE");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("monogram")) & 1) != 0)
  {
    v4 = CFSTR("MONOGRAM");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("subdial-left")) & 1) != 0)
  {
    v4 = CFSTR("SUBDIAL_LEFT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("subdial-right")) & 1) != 0)
  {
    v4 = CFSTR("SUBDIAL_RIGHT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("subdial-bottom")) & 1) != 0)
  {
    v4 = CFSTR("SUBDIAL_BOTTOM");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("subdial-top")))
    {
      v6 = 0;
      goto LABEL_15;
    }
    v4 = CFSTR("SUBDIAL_TOP");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SLOT_LABEL_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(v5, CFSTR("slot label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v6;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 0;
}

- (id)orderedComplicationSlots
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
