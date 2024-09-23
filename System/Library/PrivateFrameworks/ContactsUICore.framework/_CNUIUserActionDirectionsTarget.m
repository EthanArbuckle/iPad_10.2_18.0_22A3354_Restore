@implementation _CNUIUserActionDirectionsTarget

+ (id)mapsUrlFromLabeledValue:(id)a3 contact:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0C973B0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "singleLineStringFromPostalAddress:addCountryName:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", CFSTR("maps:?address=%@&cncontactidentifier=%@&cnaddressidentifier=%@"), v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)queryByTrimmingEmptySpaceInQuery:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)queryBySanitizingQuery:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("%26"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@"), CFSTR("%40"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_CNUIUserActionDirectionsTarget)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0C965D0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionDirectionsTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v4, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("Maps"), v2, 0);
}

- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92___CNUIUserActionDirectionsTarget_actionsForPostalAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA604F48;
  v11[4] = self;
  v12 = v7;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
