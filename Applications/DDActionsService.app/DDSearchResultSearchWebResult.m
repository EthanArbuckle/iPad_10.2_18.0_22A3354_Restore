@implementation DDSearchResultSearchWebResult

- (void)setMainIdentifier:(id)a3
{
  NSString *v3;
  id location[2];
  DDSearchResultSearchWebResult *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[DDSearchResultSearchWebResult setIdentifier:](v5, "setIdentifier:", location[0]);
  -[DDSearchResultSearchWebResult setSectionBundleIdentifier:](v5, "setSectionBundleIdentifier:", CFSTR("com.apple.lookup.search-through"));
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.other:%@"), location[0]);
  -[DDSearchResultSearchWebResult setResultBundleId:](v5, "setResultBundleId:");

  objc_storeStrong(location, 0);
}

- (DDSearchResultSearchWebResult)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  DDSearchResultSearchWebResult *v4;
  DDSearchResultSearchWebResult *v6;
  SFRichText *v7;
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  unint64_t v17;
  id location[2];
  DDSearchResultSearchWebResult *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)DDSearchResultSearchWebResult;
  v19 = -[DDSearchResultSearchWebResult init](&v16, "init");
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    -[DDSearchResultSearchWebResult setType:](v19, "setType:", 2);
    -[DDSearchResultSearchWebResult setMainIdentifier:](v19, "setMainIdentifier:", CFSTR("search_web"));
    -[DDSearchResultSearchWebResult setQueryId:](v19, "setQueryId:", v17);
    v15 = (id)objc_opt_new(SFDetailedRowCardSection);
    objc_msgSend(v15, "setShouldUseCompactDisplay:", 1);
    v14 = (id)objc_opt_new(SFAppIconImage);
    objc_msgSend(v14, "setIconType:", 1);
    objc_msgSend(v15, "setThumbnail:", v14);
    v8 = (id)DDLocalizedString(CFSTR("Search Web"), CFSTR("Label for the button used to trigger a web search with the LookUp query."));
    v7 = +[SFRichText textWithString:](SFRichText, "textWithString:");
    objc_msgSend(v15, "setTitle:");

    v13 = (id)objc_opt_new(SFSearchWebCommand);
    objc_msgSend(v13, "setSearchString:", location[0]);
    objc_msgSend(v15, "setCommand:", v13);
    v9 = (id)objc_opt_new(SFCard);
    -[DDSearchResultSearchWebResult setInlineCard:](v19, "setInlineCard:");

    v20 = v15;
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1);
    v10 = -[DDSearchResultSearchWebResult inlineCard](v19, "inlineCard");
    objc_msgSend(v10, "setCardSections:", v11);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  v6 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v6;
}

@end
