@implementation ATXAppDirectoryCategory

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4
{
  return -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:localizedName:](self, "initWithCategoryID:appBundleIDs:localizedName:", a3, a4, 0);
}

- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4 localizedName:(id)a5
{
  id v9;
  id v10;
  ATXAppDirectoryCategory *v11;
  ATXAppDirectoryCategory *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppDirectoryCategory;
  v11 = -[ATXAppDirectoryCategory init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_categoryID = a3;
    objc_storeStrong((id *)&v11->_appBundleIDs, a4);
    objc_storeStrong((id *)&v12->_localizedName, a5);
  }

  return v12;
}

- (id)description
{
  const __CFString *localizedName;

  localizedName = (const __CFString *)self->_localizedName;
  if (!localizedName)
    localizedName = &stru_1E4D5DB30;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %@: %@"), self->_categoryID, localizedName, self->_appBundleIDs);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXAppDirectoryCategory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ATXAppDirectoryCategory *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("categoryID"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("appBundleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("ATXAppDirectoryCategory archive contains a nil or missing list of apps");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = 1;
LABEL_7:
    v18 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.duet.appDirectory"), v16, v14);

    objc_msgSend(v4, "failWithError:", v18);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("ATXAppDirectoryCategory archive contains unexpected class contents");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v16 = 2;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:localizedName:](self, "initWithCategoryID:appBundleIDs:localizedName:", v5, v9, v10);

  v11 = self;
LABEL_9:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t categoryID;
  id v5;

  categoryID = self->_categoryID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", categoryID, CFSTR("categoryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleIDs, CFSTR("appBundleIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));

}

+ (BOOL)isCategoryiTunesGenre:(unint64_t)a3
{
  return a3 - 6000 < 0x1C;
}

+ (BOOL)isCategoryScreenTime:(unint64_t)a3
{
  return a3 - 1000 < 0xD;
}

+ (BOOL)isCategorySpecial:(unint64_t)a3
{
  return a3 < 8;
}

+ (BOOL)isCategoryiTunesGamesSubgenre:(unint64_t)a3
{
  return a3 - 7001 < 0x10;
}

+ (id)categoryIdentifierForScreenTimeCategoryID:(unint64_t)a3
{
  id *v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 - 1000 >= 0xD)
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[ATXAppDirectoryCategory categoryIdentifierForScreenTimeCategoryID:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

    v3 = (id *)MEMORY[0x1E0D0D480];
  }
  else
  {
    v3 = (id *)qword_1E4D57320[a3 - 1000];
  }
  return *v3;
}

+ (unint64_t)screenTimeCategoryIDForCategoryIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D470]) & 1) != 0)
  {
    v4 = 1000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4A8]) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D468]) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D458]) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D490]) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D460]) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D498]) & 1) != 0)
  {
    v4 = 1006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D478]) & 1) != 0)
  {
    v4 = 1007;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D480]) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4B8]) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4C8]) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4D8]) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4F0]) & 1) != 0)
      {
        v4 = 1010;
        goto LABEL_22;
      }
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4A0]) & 1) != 0)
      {
        v4 = 1011;
        goto LABEL_22;
      }
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D4E8]) & 1) != 0)
      {
        v4 = 1012;
        goto LABEL_22;
      }
      __atxlog_handle_app_library();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        +[ATXAppDirectoryCategory screenTimeCategoryIDForCategoryIdentifier:].cold.1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    }
    v4 = 1008;
  }
LABEL_22:

  return v4;
}

+ (unint64_t)appDirectoryCategoryStringToAppDirectoryCategoryID:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesBusiness")) & 1) != 0)
  {
    v4 = 6000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesWeather")) & 1) != 0)
  {
    v4 = 6001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesUtilities")) & 1) != 0)
  {
    v4 = 6002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesTravel")) & 1) != 0)
  {
    v4 = 6003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesSports")) & 1) != 0)
  {
    v4 = 6004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesSocialNetworking")) & 1) != 0)
  {
    v4 = 6005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesReference")) & 1) != 0)
  {
    v4 = 6006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesProductivity")) & 1) != 0)
  {
    v4 = 6007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesPhotoVideo")) & 1) != 0)
  {
    v4 = 6008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesNews")) & 1) != 0)
  {
    v4 = 6009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesNavigation")) & 1) != 0)
  {
    v4 = 6010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesMusic")) & 1) != 0)
  {
    v4 = 6011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesLifestyle")) & 1) != 0)
  {
    v4 = 6012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesHealthFitness")) & 1) != 0)
  {
    v4 = 6013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesGames")) & 1) != 0)
  {
    v4 = 6014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesFinance")) & 1) != 0)
  {
    v4 = 6015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesEntertainment")) & 1) != 0)
  {
    v4 = 6016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesEducation")) & 1) != 0)
  {
    v4 = 6017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesBooks")) & 1) != 0)
  {
    v4 = 6018;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesMedical")) & 1) != 0)
  {
    v4 = 6020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesNewsstand")) & 1) != 0)
  {
    v4 = 6021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesCatalogs")) & 1) != 0)
  {
    v4 = 6022;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesFoodDrinks")) & 1) != 0)
  {
    v4 = 6023;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesShopping")) & 1) != 0)
  {
    v4 = 6024;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesStickers")) & 1) != 0)
  {
    v4 = 6025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesDeveloperTools")) & 1) != 0)
  {
    v4 = 6026;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXAppDirectoryCategoryIDiTunesGraphicsDesign")))
  {
    v4 = 6027;
  }
  else
  {
    v4 = 6028;
  }

  return v4;
}

+ (BOOL)_instanceSpecificLocalizedStringExistsForCategory:(unint64_t)a3
{
  return a3 == 1 || a3 == 6;
}

- (id)localizedStringForCategoryID:(unint64_t)a3
{
  NSObject *v5;
  NSString *localizedName;
  uint8_t v8[16];

  if (self->_categoryID != a3)
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryCategory: localizedStringForCategoryID: CategoryID provided does not match categoryID of object", v8, 2u);
    }

  }
  if (objc_msgSend((id)objc_opt_class(), "_instanceSpecificLocalizedStringExistsForCategory:", a3))
  {
    localizedName = self->_localizedName;
    if (localizedName)
      return localizedName;
  }
  objc_msgSend((id)objc_opt_class(), "localizedStringForCategoryID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedStringForCategoryID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "isCategoryScreenTime:"))
  {
    v5 = (void *)MEMORY[0x1E0D0D518];
    objc_msgSend(a1, "categoryIdentifierForScreenTimeCategoryID:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedNameForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "localizedStringForNonScreenTimeCategoryID:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)localizedStringForNonScreenTimeCategoryID:(unint64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a3)
  {
    case 0x1770uLL:
      v7 = CFSTR("Business");
      goto LABEL_41;
    case 0x1771uLL:
      v7 = CFSTR("Weather");
      goto LABEL_41;
    case 0x1772uLL:
      v7 = CFSTR("Utilities");
      goto LABEL_41;
    case 0x1773uLL:
      v7 = CFSTR("Travel");
      goto LABEL_41;
    case 0x1774uLL:
      v7 = CFSTR("Sports");
      goto LABEL_41;
    case 0x1775uLL:
      objc_msgSend(a1, "localizedStringForCategoryID:", 1001);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 0x1776uLL:
      v7 = CFSTR("Reference");
      goto LABEL_41;
    case 0x1777uLL:
      v7 = CFSTR("Productivity");
      goto LABEL_41;
    case 0x1778uLL:
      v7 = CFSTR("Photo & Video");
      goto LABEL_41;
    case 0x1779uLL:
      v7 = CFSTR("News");
      goto LABEL_41;
    case 0x177AuLL:
      v7 = CFSTR("Navigation");
      goto LABEL_41;
    case 0x177BuLL:
      v7 = CFSTR("Music");
      goto LABEL_41;
    case 0x177CuLL:
      v7 = CFSTR("Lifestyle");
      goto LABEL_41;
    case 0x177DuLL:
      v7 = CFSTR("Health & Fitness");
      goto LABEL_41;
    case 0x177EuLL:
      v7 = CFSTR("Games");
      goto LABEL_41;
    case 0x177FuLL:
      v7 = CFSTR("Finance");
      goto LABEL_41;
    case 0x1780uLL:
      v7 = CFSTR("Entertainment");
      goto LABEL_41;
    case 0x1781uLL:
      v7 = CFSTR("Education");
      goto LABEL_41;
    case 0x1782uLL:
      v7 = CFSTR("Books");
      goto LABEL_41;
    case 0x1783uLL:
LABEL_5:
      __atxlog_handle_app_library();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[ATXAppDirectoryCategory localizedStringForNonScreenTimeCategoryID:].cold.1(v8);

      v9 = 0;
      goto LABEL_43;
    case 0x1784uLL:
      v7 = CFSTR("Medical");
      goto LABEL_41;
    case 0x1785uLL:
      v7 = CFSTR("Newsstand");
      goto LABEL_41;
    case 0x1786uLL:
      v7 = CFSTR("Catalogs");
      goto LABEL_41;
    case 0x1787uLL:
      v7 = CFSTR("Food & Drinks");
      goto LABEL_41;
    case 0x1788uLL:
      v7 = CFSTR("Shopping");
      goto LABEL_41;
    case 0x1789uLL:
      v7 = CFSTR("Stickers");
      goto LABEL_41;
    case 0x178AuLL:
      v7 = CFSTR("Developer Tools");
      goto LABEL_41;
    case 0x178BuLL:
      v7 = CFSTR("Graphics & Design");
LABEL_41:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E4D5DB30, 0);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v9 = (void *)v10;
LABEL_43:

      return v9;
    default:
      switch(a3)
      {
        case 0uLL:
          v7 = CFSTR(" System");
          goto LABEL_41;
        case 1uLL:
          v7 = CFSTR("Enterprise Apps");
          goto LABEL_41;
        case 2uLL:
          v7 = CFSTR("Arcade");
          goto LABEL_41;
        case 3uLL:
          v7 = CFSTR("Suggestions");
          goto LABEL_41;
        case 4uLL:
          v7 = CFSTR("Recently Added");
          goto LABEL_41;
        case 5uLL:
          v7 = CFSTR("Bookmarks");
          goto LABEL_41;
        case 6uLL:
          v7 = CFSTR("Managed Apps");
          goto LABEL_41;
        case 7uLL:
          v7 = CFSTR("Hidden");
          goto LABEL_41;
        default:
          goto LABEL_5;
      }
  }
}

- (unint64_t)categoryID
{
  return self->_categoryID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
}

- (void)updateCategoryLocalizedNameWithName:(id)a3
{
  NSString *v4;
  NSString *localizedName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedName = self->_localizedName;
  self->_localizedName = v4;

}

- (void)updateAppBundleIDs:(id)a3
{
  NSArray *v4;
  NSArray *appBundleIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  appBundleIDs = self->_appBundleIDs;
  self->_appBundleIDs = v4;

}

+ (unint64_t)_parentCategoryForiTunesGenreID:(unint64_t)a3
{
  unint64_t v6;
  void *v7;

  v6 = a3 - 6000;
  if (a3 - 6000 < 0x1C && ((0xFF7FFFFu >> v6) & 1) != 0)
    return qword_1A4B66C20[v6];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAppDirectoryCategory+Dynamic.m"), 74, CFSTR("%s: categoryID %lu is not an iTunes genreID"), "+[ATXAppDirectoryCategory(Dynamic) _parentCategoryForiTunesGenreID:]", a3);

  return 1008;
}

+ (BOOL)shouldCategoryAlwaysMergeWithParent:(unint64_t)a3
{
  return (a3 - 6002 < 0x10) & (0xD82Bu >> (a3 - 114));
}

+ (BOOL)shouldCategoryNeverMergeWithParent:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;

  result = 1;
  if (a3 - 1000 <= 0xA)
  {
    if (((1 << (a3 + 24)) & 0x41A) != 0)
      return result;
    if (a3 == 1000)
      return (objc_msgSend(MEMORY[0x1E0D81588], "isiPad", v3, v4) & 1) != 0;
  }
  if (a3 > 6 || ((1 << a3) & 0x46) == 0)
    return 0;
  return result;
}

+ (unint64_t)parentCategoryForCategory:(unint64_t)a3
{
  if ((objc_msgSend(a1, "isCategoryiTunesGamesSubgenre:") & 1) != 0)
    return 6014;
  if (objc_msgSend(a1, "isCategoryiTunesGenre:", a3))
    return objc_msgSend(a1, "_parentCategoryForiTunesGenreID:", a3);
  return 1008;
}

+ (BOOL)isCategory:(unint64_t)a3 descendantOfCategory:(unint64_t)a4
{
  BOOL result;
  uint64_t v7;

  result = a3 != 1008;
  if (a3 != a4 && a3 != 1008)
  {
    do
    {
      v7 = objc_msgSend(a1, "parentCategoryForCategory:");
      result = v7 != 1008;
    }
    while (v7 != a4 && v7 != 1008);
  }
  return result;
}

+ (void)categoryIdentifierForScreenTimeCategoryID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A49EF000, a2, a3, "%s: categoryID %lu is not a screentime categoryID", a5, a6, a7, a8, 2u);
}

+ (void)screenTimeCategoryIDForCategoryIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A49EF000, a2, a3, "%s: category identifier %@ is not a category identifier corresponding to a screentime categoryID", a5, a6, a7, a8, 2u);
}

+ (void)localizedStringForNonScreenTimeCategoryID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "localizedStringForCategoryID: no localizedString exists for specified categoryID", v1, 2u);
}

@end
