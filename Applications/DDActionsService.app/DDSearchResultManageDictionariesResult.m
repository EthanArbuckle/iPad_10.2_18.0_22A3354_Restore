@implementation DDSearchResultManageDictionariesResult

- (DDSearchResultManageDictionariesResult)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  DDSearchResultManageDictionariesResult *v4;
  DDSearchResultManageDictionariesResult *v6;
  SFRichText *v7;
  id v8;
  SFPunchout *v9;
  NSURL *v10;
  id v11;
  id v12;
  NSArray *v13;
  id v15;
  id v16;
  id v17;
  objc_super v18;
  unint64_t v19;
  id location[2];
  DDSearchResultManageDictionariesResult *v21;
  id v22;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)DDSearchResultManageDictionariesResult;
  v21 = -[DDSearchResultSearchWebResult initWithQuery:queryId:](&v18, "initWithQuery:queryId:", location[0], a4);
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    -[DDSearchResultSearchWebResult setMainIdentifier:](v21, "setMainIdentifier:", CFSTR("manage_dictionaries"));
    v17 = (id)objc_opt_new(SFDetailedRowCardSection);
    objc_msgSend(v17, "setShouldUseCompactDisplay:", 1);
    v16 = (id)objc_opt_new(SFAppIconImage);
    objc_msgSend(v16, "setBundleIdentifier:", CFSTR("com.apple.Preferences"));
    objc_msgSend(v17, "setThumbnail:", v16);
    v8 = (id)DDLocalizedString(CFSTR("Manage Dictionaries"), CFSTR("Label for the button used to jump to the dictionary setting in Settings."));
    v7 = +[SFRichText textWithString:](SFRichText, "textWithString:");
    objc_msgSend(v17, "setTitle:");

    v15 = (id)objc_opt_new(SFOpenPunchoutCommand);
    v10 = +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=DICTIONARY"));
    v9 = +[SFPunchout punchoutWithURL:](SFPunchout, "punchoutWithURL:");
    objc_msgSend(v15, "setPunchout:");

    objc_msgSend(v17, "setCommand:", v15);
    v11 = (id)objc_opt_new(SFCard);
    -[DDSearchResultManageDictionariesResult setInlineCard:](v21, "setInlineCard:");

    v22 = v17;
    v13 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1);
    v12 = -[DDSearchResultManageDictionariesResult inlineCard](v21, "inlineCard");
    objc_msgSend(v12, "setCardSections:", v13);

    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  v6 = v21;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v6;
}

@end
