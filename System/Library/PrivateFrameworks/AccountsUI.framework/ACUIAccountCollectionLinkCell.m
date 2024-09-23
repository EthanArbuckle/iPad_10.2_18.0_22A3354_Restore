@implementation ACUIAccountCollectionLinkCell

+ (id)specifierWithTitle:(id)a3 accounts:(id)a4
{
  id v4;
  id obj;
  id v7;
  uint64_t v8;
  id v9;
  id *v10;
  id *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[3];

  obj = a4;
  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = &v16;
  v16 = 0;
  objc_storeStrong(&v16, obj);
  v8 = MEMORY[0x1E0D804E8];
  v7 = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", location[0], 0, 0, 0, objc_opt_class(), 1, 0);
  v10 = &v15;
  v15 = v4;
  v9 = v4;
  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v15, "setProperty:forKey:", v16, CFSTR("ACUIAccountCollectionSpecifiers"));
  objc_msgSend(v15, "setProperty:forKey:", location[0], CFSTR("ACUIAccountCollectionTitle"));
  v14 = v15;
  objc_storeStrong(v10, v13);
  objc_storeStrong(v11, v13);
  objc_storeStrong(v12, v13);
  return v14;
}

- (ACUIAccountCollectionLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  ACUIAccountCollectionLinkCell *v5;
  ACUIAccountCollectionLinkCell *v7;
  id v8;
  ACUIAccountCollectionLinkCell *v9;
  id v10;
  id v11;
  ACUIAccountCollectionLinkCell *v13;
  id v14;
  objc_super v15;
  id v16;
  id location[3];
  ACUIAccountCollectionLinkCell *v18;

  v18 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v5 = v18;
  v18 = 0;
  v15.receiver = v5;
  v15.super_class = (Class)ACUIAccountCollectionLinkCell;
  v13 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v15, sel_initWithStyle_reuseIdentifier_specifier_, 3, location[0], v16);
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);
  if (v13)
  {
    v11 = -[PSTableCell valueLabel](v18, "valueLabel");
    v10 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    objc_msgSend(v11, "setFont:");

  }
  v14 = (id)objc_msgSend(v16, "propertyForKey:", CFSTR("ACUIAccountCollectionSpecifiers"));
  v7 = v18;
  v8 = -[ACUIAccountCollectionLinkCell _detailTextForAccountSpecifiers:](v18, "_detailTextForAccountSpecifiers:", v14);
  -[PSTableCell setValue:](v7, "setValue:");

  v9 = v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v9;
}

- (id)_detailTextForAccountSpecifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id obj;
  uint64_t v14;
  id v15;
  _QWORD __b[8];
  id v17;
  id v18;
  id location[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = (id)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
  if (v14)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v14;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v17 = *(id *)(__b[1] + 8 * v10);
      v15 = (id)objc_msgSend(v17, "name");
      if (v15)
        objc_msgSend(v18, "addObject:", v15);
      objc_storeStrong(&v15, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
        if (!v11)
          break;
      }
    }
  }

  v4 = v18;
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MIDDLE_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
  v6 = (id)objc_msgSend(v4, "componentsJoinedByString:");

  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  __int128 v14;
  __int128 v15;
  id v16;
  objc_super v17;
  SEL v18;
  ACUIAccountCollectionLinkCell *v19;

  v19 = self;
  v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)ACUIAccountCollectionLinkCell;
  -[PSTableCell layoutSubviews](&v17, sel_layoutSubviews);
  v16 = -[PSTableCell titleLabel](v19, "titleLabel");
  objc_msgSend(v16, "frame");
  *(_QWORD *)&v14 = v2;
  *((_QWORD *)&v14 + 1) = v3;
  *(_QWORD *)&v15 = v4;
  *((_QWORD *)&v15 + 1) = v5;
  v13 = -[PSTableCell valueLabel](v19, "valueLabel");
  objc_msgSend(v13, "frame");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  -[ACUIAccountCollectionLinkCell bounds](v19, "bounds");
  *((_QWORD *)&v14 + 1) = CGRound_0((v9 - (*((double *)&v15 + 1) + v12 + 2.0)) / 2.0);
  objc_msgSend(v16, "setFrame:", v14, v15);
  objc_msgSend(v13, "setFrame:", v10, *((double *)&v14 + 1) + *((double *)&v15 + 1) + 2.0, v11, v12);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
}

@end
