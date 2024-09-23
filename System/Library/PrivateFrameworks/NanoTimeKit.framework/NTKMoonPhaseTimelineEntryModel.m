@implementation NTKMoonPhaseTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  switch(a3)
  {
    case 0:
      objc_msgSend((id)objc_opt_class(), "smallModular:", self);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend((id)objc_opt_class(), "largeModular:", self);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend((id)objc_opt_class(), "smallUtility:", self);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend((id)objc_opt_class(), "largeUtility:", self);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend((id)objc_opt_class(), "circular:isMedium:", self, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 7:
      objc_msgSend((id)objc_opt_class(), "extraLarge:", self);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = (void *)v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    objc_msgSend((id)objc_opt_class(), "circular:isMedium:", self, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)largeModular:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "phaseName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerWithText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "eventDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = (void *)v7, v9 = objc_msgSend(v4, "event"), v8, v9 == -1))
  {
    +[NTKNoContentTemplateProvider largeModularEmptyTextProvider](NTKNoContentTemplateProvider, "largeModularEmptyTextProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C94560];
    objc_msgSend(v4, "eventDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProviderWithDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "textForMoonPhaseEvent:", objc_msgSend(v4, "event"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "providerWithText:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "currentEvent") & 1) != 0)
    {
      v16 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("COUNTDOWN_NOW"), CFSTR("Now"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textProviderWithText:", v17);
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C94508];
      objc_msgSend(v4, "eventDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textProviderWithDate:style:units:", v17, 0, 96);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:body2TextProvider:", v6, v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.807843137, 0.941176471, 0.564705882, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTintColor:", v21);

  return v20;
}

+ (id)smallModular:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "phaseNumber");
  objc_msgSend(v4, "hemisphere");

  NUNIMoonImageForPhaseNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageProviderWithOnePieceImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94438], "templateWithImageProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  return v7;
}

+ (id)smallUtility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "phaseNumber");
  objc_msgSend(v4, "hemisphere");

  NUNIMoonImageForPhaseNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageProviderWithOnePieceImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94488], "templateWithImageProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)circular:(id)a3 isMedium:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "phaseNumber");
  objc_msgSend(v6, "hemisphere");

  if (v4)
    v7 = (id *)0x1E0C94170;
  else
    v7 = (id *)0x1E0C941A0;
  NUNIMoonImageForPhaseNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageProviderWithOnePieceImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v7, "templateWithImageProvider:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)largeUtility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "phaseName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerWithText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)extraLarge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "phaseNumber");
  objc_msgSend(v4, "hemisphere");

  NUNIMoonImageForPhaseNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageProviderWithOnePieceImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94218], "templateWithImageProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  return v7;
}

+ (id)imageProviderWithOnePieceImage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", a3);
}

+ (id)providerWithText:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C94530], "finalizedTextProviderWithText:", a3);
}

+ (id)textForMoonPhaseEvent:(int64_t)a3
{
  return (id)objc_msgSend(a1, "textForMoonPhaseEvent:useShort:", a3, 0);
}

+ (id)textForMoonPhaseEvent:(int64_t)a3 useShort:(BOOL)a4
{
  __CFString *v4;
  void *v5;

  if ((unint64_t)(a3 + 1) <= 3)
  {
    v4 = off_1E6BD8680[a3 + 1];
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = 0;
  if (a4)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("_SHORT"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  NUNILocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)phaseName
{
  return self->_phaseName;
}

- (void)setPhaseName:(id)a3
{
  objc_storeStrong((id *)&self->_phaseName, a3);
}

- (unint64_t)phaseNumber
{
  return self->_phaseNumber;
}

- (void)setPhaseNumber:(unint64_t)a3
{
  self->_phaseNumber = a3;
}

- (int64_t)hemisphere
{
  return self->_hemisphere;
}

- (void)setHemisphere:(int64_t)a3
{
  self->_hemisphere = a3;
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventDate, a3);
}

- (BOOL)currentEvent
{
  return self->_currentEvent;
}

- (void)setCurrentEvent:(BOOL)a3
{
  self->_currentEvent = a3;
}

- (NSString)animationGroup
{
  return self->_animationGroup;
}

- (void)setAnimationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_animationGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationGroup, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_phaseName, 0);
}

@end
