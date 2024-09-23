@implementation MUEVChargingHelper

+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4
{
  void *v6;
  void *v7;

  _MULocalizedStringFromThisBundle(CFSTR("[Placecard] Number of chargers available out of total"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4 radiowavesSymbolScale:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedStringForAvailableChargers:outOfTotal:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("dot.radiowaves.up.forward"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textAttachmentWithImage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "), v13);
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)getRealTimeEVChargerInfo:(id)a3 charger:(id)a4
{
  return +[MURealTimeEVChargerUtility getRealTimeChargerInfoWithGarage:charger:](MURealTimeEVChargerUtility, "getRealTimeChargerInfoWithGarage:charger:", a3, a4);
}

+ (id)evPlugIconWithConfiguration:(id)a3
{
  return +[MURealTimeEVChargerUtility evPlugIconWithConfiguration:](MURealTimeEVChargerUtility, "evPlugIconWithConfiguration:", a3);
}

@end
