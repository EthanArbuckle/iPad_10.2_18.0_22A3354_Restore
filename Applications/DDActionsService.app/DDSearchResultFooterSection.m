@implementation DDSearchResultFooterSection

- (DDSearchResultFooterSection)initWithQuery:(id)a3 queryId:(unint64_t)a4
{
  DDSearchResultFooterSection *v4;
  DDSearchResultSearchWebResult *v5;
  DDSearchResultManageDictionariesResult *v6;
  DDSearchResultFooterSection *v8;
  id v9;
  DDSearchResultManageDictionariesResult *v10;
  DDSearchResultSearchWebResult *v11;
  id v12;
  BOOL v13;
  id v15;
  objc_super v16;
  unint64_t v17;
  id location[2];
  DDSearchResultFooterSection *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)DDSearchResultFooterSection;
  v19 = -[DDSearchResultFooterSection init](&v16, "init");
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    -[DDSearchResultFooterSection setTitle:](v19, "setTitle:", CFSTR(" "));
    -[DDSearchResultFooterSection setBundleIdentifier:](v19, "setBundleIdentifier:", CFSTR("com.apple.lookup.search-through"));
    v15 = +[NSMutableArray array](NSMutableArray, "array");
    v12 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v13 = objc_msgSend(v12, "effectiveBoolValueForSetting:", MCFeatureSafariAllowed) == 2;

    if (!v13)
    {
      v5 = [DDSearchResultSearchWebResult alloc];
      v11 = -[DDSearchResultSearchWebResult initWithQuery:queryId:](v5, "initWithQuery:queryId:", location[0], v17);
      objc_msgSend(v15, "addObject:");

    }
    v9 = v15;
    v6 = [DDSearchResultManageDictionariesResult alloc];
    v10 = -[DDSearchResultManageDictionariesResult initWithQuery:queryId:](v6, "initWithQuery:queryId:", location[0], v17);
    objc_msgSend(v9, "addObject:");

    objc_storeStrong((id *)&v19->_results, v15);
    objc_storeStrong(&v15, 0);
  }
  v8 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v8;
}

- (id)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
