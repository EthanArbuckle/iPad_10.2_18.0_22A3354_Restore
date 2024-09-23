@implementation SUSUIInstallTonightPasscodeEntryView

- (SUSUIInstallTonightPasscodeEntryView)initWithFrame:(CGRect)a3
{
  SUSUIInstallTonightPasscodeEntryView *v4;
  SUSUIInstallTonightPasscodeEntryView *v5;
  objc_super v6;
  SEL v7;
  SUSUIInstallTonightPasscodeEntryView *v8;
  CGRect v9;

  v9 = a3;
  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIInstallTonightPasscodeEntryView;
  v5 = -[SUSUIPasscodeEntryView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5)
    -[SUSUIInstallTonightPasscodeEntryView updateStatusText](v8, "updateStatusText");
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v4;
}

- (void)setInstallTonightForecast:(id)a3
{
  id location[2];
  SUSUIInstallTonightPasscodeEntryView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*(id *)(&v4->super._dismissing + 1) != location[0])
  {
    objc_storeStrong((id *)(&v4->super._dismissing + 1), location[0]);
    -[SUSUIInstallTonightPasscodeEntryView updateStatusText](v4, "updateStatusText");
  }
  objc_storeStrong(location, 0);
}

- (void)setDescriptor:(id)a3
{
  id location[2];
  SUSUIInstallTonightPasscodeEntryView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*(id *)((char *)&v4->_forecast + 1) != location[0])
  {
    objc_storeStrong((id *)((char *)&v4->_forecast + 1), location[0]);
    -[SUSUIInstallTonightPasscodeEntryView updateStatusText](v4, "updateStatusText");
  }
  objc_storeStrong(location, 0);
}

- (id)createPasscodeView
{
  return +[SBUIPasscodeLockViewFactory installTonightPasscodeLockViewForUsersCurrentStyle](SBUIPasscodeLockViewFactory, "installTonightPasscodeLockViewForUsersCurrentStyle", a2, self);
}

- (void)updateStatusText
{
  NSString *v2;
  NSString *v3;
  id v4;
  id v5;
  id v6;
  SBUIPasscodeLockView *v7;
  char v8;
  NSString *v9;
  char v10;
  NSBundle *v11;
  char v12;
  NSString *v13;
  char v14;
  NSBundle *v15;
  id location;
  char v17;
  NSString *v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  NSString *v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  char v31;
  SEL v32;
  SUSUIInstallTonightPasscodeEntryView *v33;

  v33 = self;
  v32 = a2;
  v31 = 0;
  v31 = objc_msgSend(*(id *)((char *)&self->_forecast + 1), "isSplatOnly") & 1;
  v30 = *(id *)(&v33->super._dismissing + 1);
  v27 = 0;
  v25 = 0;
  v23 = 0;
  v21 = 0;
  v19 = 0;
  v17 = 0;
  if ((v31 & 1) != 0)
  {
    v28 = objc_msgSend(v30, "_susui_cardinalityForRoundedStartTime");
    v27 = 1;
    v26 = objc_msgSend(v30, "_susui_cardinalityForRoundedEndTime");
    v25 = 1;
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RSR_PASSCODE_SUBTITLE_%@_TO_%@"), v28, v26);
    v23 = 1;
    v2 = v24;
  }
  else
  {
    v22 = objc_msgSend(v30, "_susui_cardinalityForRoundedStartTime");
    v21 = 1;
    v20 = objc_msgSend(v30, "_susui_cardinalityForRoundedEndTime");
    v19 = 1;
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SOFTWARE_UPDATE_PASSCODE_SUBTITLE_%@_TO_%@"), v22, v20);
    v17 = 1;
    v2 = v18;
  }
  v29 = v2;
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  v6 = -[SUSUIInstallTonightPasscodeEntryView _bodyTextToModelSpecificLocalizedKey:](v33, "_bodyTextToModelSpecificLocalizedKey:", v29);
  v5 = objc_msgSend(v30, "_susui_formattedRoundedStartTimeString");
  v4 = objc_msgSend(v30, "_susui_formattedRoundedEndTimeString");
  location = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@ %@"), 0, v5, v4);

  v7 = -[SUSUIPasscodeEntryView passcodeLockView](v33, "passcodeLockView");
  v14 = 0;
  v12 = 0;
  v10 = 0;
  v8 = 0;
  if ((v31 & 1) != 0)
  {
    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = 1;
    v13 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("RSR_PASSCODE_TITLE"), &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));
    v12 = 1;
    v3 = v13;
  }
  else
  {
    v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = 1;
    v9 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_PASSCODE_TITLE"), &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));
    v8 = 1;
    v3 = v9;
  }
  -[SBUIPasscodeLockView updateStatusText:subtitle:animated:](v7, "updateStatusText:subtitle:animated:", v3, location, 0);
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
}

- (id)_bodyTextToModelSpecificLocalizedKey:(id)a3
{
  NSString *v4;
  NSBundle *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location[0]);
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:");

  if (!v8)
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", location[0], &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));

  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_forecast + 1), 0);
  objc_storeStrong((id *)(&self->super._dismissing + 1), 0);
}

@end
