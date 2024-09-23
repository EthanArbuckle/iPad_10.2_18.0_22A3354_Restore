@implementation FUDatePicker

- (FUDatePicker)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  FUDatePicker *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FUDatePicker initWithFrame:tintColor:initialWheelType:shouldEnableCrown:minimumDate:maximumDate:](self, "initWithFrame:tintColor:initialWheelType:shouldEnableCrown:minimumDate:maximumDate:", v8, 2, 0, 0, 0, x, y, width, height);

  return v9;
}

- (FUDatePicker)initWithFrame:(CGRect)a3 tintColor:(id)a4 initialWheelType:(int64_t)a5 shouldEnableCrown:(BOOL)a6 minimumDate:(id)a7 maximumDate:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  FUDatePicker *v20;
  FUDatePicker *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDate *date;
  NSDateFormatter *v29;
  NSDateFormatter *dateFormatter;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  NSArray *monthNames;
  uint64_t v37;
  NSArray *dayValues;
  void *v39;
  void *v40;
  int v41;
  NSDateFormatter *v42;
  uint64_t v43;
  NSArray *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *v49;
  uint64_t v50;
  NSMutableArray *yearsWithNames;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSMutableArray *v56;
  void *v57;
  void *v58;
  id v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v64;
  int64_t v65;
  uint64_t v67;
  int64_t v68;
  _BOOL4 v69;
  BOOL v70;
  _BOOL4 v71;
  uint64_t v73;
  int64_t v74;
  int64_t monthOrder;
  uint64_t v76;
  int64_t yearOrder;
  uint64_t v78;
  int64_t dayOrder;
  uint64_t v80;
  void *v81;
  double v82;
  double v83;
  FUScrollWheel *v84;
  FUScrollWheel *monthWheel;
  void *v86;
  double v87;
  void *v88;
  id v89;
  void *v90;
  UILabel *v91;
  UILabel *monthLabel;
  UILabel *v93;
  void *v94;
  void *v95;
  UILabel *v96;
  double v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  UILabel *v102;
  void *v103;
  FUScrollWheel *v104;
  FUScrollWheel *dayWheel;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  UILabel *v110;
  UILabel *dayLabel;
  UILabel *v112;
  void *v113;
  void *v114;
  UILabel *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  UILabel *v120;
  void *v121;
  FUScrollWheel *v122;
  FUScrollWheel *yearWheel;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  UILabel *v128;
  UILabel *yearLabel;
  UILabel *v130;
  void *v131;
  void *v132;
  UILabel *v133;
  void *v134;
  void *v135;
  void *v136;
  UILabel *v137;
  void *v138;
  UILabel *v139;
  void *v141;
  id v142;
  id v143;
  void *v144;
  id v145;
  uint64_t v146[2];
  uint64_t v147[2];
  uint64_t v148[2];
  objc_super v149;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v149.receiver = self;
  v149.super_class = (Class)FUDatePicker;
  v20 = -[FUDatePicker initWithFrame:](&v149, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    v142 = v19;
    v143 = v18;
    v145 = v17;
    objc_storeStrong((id *)&v20->_tintColor, a4);
    v21->_initialWheelType = a5;
    objc_storeStrong((id *)&v21->_minimumDate, a7);
    objc_storeStrong((id *)&v21->_maximumDate, a8);
    v22 = 1;
    v21->_firstResponderShouldChange = 1;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localeIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateByAddingUnit:value:toDate:options:", 4, -30, v26, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    date = v21->_date;
    v21->_date = (NSDate *)v27;

    v21->_monthOffset = 1;
    v21->_dayOffset = 1;
    v21->_numRowsMonth = 12;
    v21->_numRowsDate = 31;
    v21->_numRowsYear = 150;
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v21->_dateFormatter;
    v21->_dateFormatter = v29;

    -[NSDateFormatter setDateFormat:](v21->_dateFormatter, "setDateFormat:", CFSTR("y"));
    v144 = v25;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ja_JP_TRADITIONAL")) & 1) == 0)
      v22 = objc_msgSend(v25, "containsString:", CFSTR("calendar=japanese"));
    v21->_displayEra = v22;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BDBCB20];
    objc_msgSend(v31, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("ja"));

    if (v34)
    {
      -[NSDateFormatter veryShortMonthSymbols](v21->_dateFormatter, "veryShortMonthSymbols");
      v35 = objc_claimAutoreleasedReturnValue();
      monthNames = v21->_monthNames;
      v21->_monthNames = (NSArray *)v35;

      -[FUDatePicker _enumerateDayValues](v21, "_enumerateDayValues");
      v37 = objc_claimAutoreleasedReturnValue();
      dayValues = v21->_dayValues;
      v21->_dayValues = (NSArray *)v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", v32);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("fi"));

      v42 = v21->_dateFormatter;
      if (v41)
        -[NSDateFormatter shortStandaloneMonthSymbols](v42, "shortStandaloneMonthSymbols");
      else
        -[NSDateFormatter shortMonthSymbols](v42, "shortMonthSymbols");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v21->_monthNames;
      v21->_monthNames = (NSArray *)v43;

      dayValues = (NSArray *)objc_alloc_init(MEMORY[0x24BDD1500]);
      v45 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v144);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "dateFormatFromTemplate:options:locale:", CFSTR("d"), 0, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray setDateFormat:](dayValues, "setDateFormat:", v47);

      -[FUDatePicker _enumerateDayValuesFromFormatter:](v21, "_enumerateDayValuesFromFormatter:", dayValues);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v21->_dayValues;
      v21->_dayValues = (NSArray *)v48;

    }
    v50 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v21->_numRowsYear);
    yearsWithNames = v21->_yearsWithNames;
    v21->_yearsWithNames = (NSMutableArray *)v50;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateByAddingUnit:value:toDate:options:", 4, -150, v52, 0);
    v53 = objc_claimAutoreleasedReturnValue();

    v141 = (void *)v53;
    objc_msgSend(v23, "components:fromDate:", 6, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 150;
    do
    {
      objc_msgSend(v54, "setYear:", objc_msgSend(v54, "year") + 1);
      v56 = v21->_yearsWithNames;
      objc_msgSend(v23, "dateFromComponents:", v54);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v56, "addObject:", v57);

      --v55;
    }
    while (v55);
    v148[0] = 0;
    v148[1] = 0;
    v147[0] = 0;
    v147[1] = 0;
    v146[0] = 0;
    v146[1] = 0;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = GetFormatAndDateFieldRangesFor_yMMMMd(v58, v148, v147, v146);

    v60 = v147[0];
    v61 = v148[0];
    v62 = v146[0];
    if (v147[0] < (unint64_t)v146[0] || v147[0] < (unint64_t)v148[0])
      v64 = 1;
    else
      v64 = 2;
    if (v147[0] < (unint64_t)v148[0] && v147[0] < (unint64_t)v146[0])
      v65 = 0;
    else
      v65 = v64;
    v21->_monthOrder = v65;
    if (v61 < v62 || v61 < v60)
      v67 = 1;
    else
      v67 = 2;
    if (v61 < v60 && v61 < v62)
      v68 = 0;
    else
      v68 = v67;
    v21->_yearOrder = v68;
    v69 = v62 < v61;
    v70 = v62 >= v60;
    v71 = v62 < v60;
    if (!v70 || v69)
      v73 = 1;
    else
      v73 = 2;
    if (v69 && v71)
      v74 = 0;
    else
      v74 = v73;
    v21->_dayOrder = v74;
    if (objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[FUDatePicker semanticContentAttribute](v21, "semanticContentAttribute")) == 1)
    {
      monthOrder = v21->_monthOrder;
      if (monthOrder == 1)
        v76 = 1;
      else
        v76 = 2 * (monthOrder == 0);
      v21->_monthOrder = v76;
      yearOrder = v21->_yearOrder;
      if (yearOrder == 1)
        v78 = 1;
      else
        v78 = 2 * (yearOrder == 0);
      v21->_yearOrder = v78;
      dayOrder = v21->_dayOrder;
      if (dayOrder == 1)
        v80 = 1;
      else
        v80 = 2 * (dayOrder == 0);
      v21->_dayOrder = v80;
    }
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "scale");
    v83 = v82;

    v84 = objc_alloc_init(FUScrollWheel);
    monthWheel = v21->_monthWheel;
    v21->_monthWheel = v84;

    -[FUScrollWheel setDataSource:](v21->_monthWheel, "setDataSource:", v21);
    -[FUScrollWheel setDelegate:](v21->_monthWheel, "setDelegate:", v21);
    -[FUScrollWheel setItemTitleAligmnent:](v21->_monthWheel, "setItemTitleAligmnent:", 1);
    -[FUScrollWheel layer](v21->_monthWheel, "layer");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 12.0 / v83;
    objc_msgSend(v86, "setCornerRadius:", 12.0 / v83);

    -[FUScrollWheel layer](v21->_monthWheel, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_retainAutorelease(v17);
    objc_msgSend(v88, "setBorderColor:", objc_msgSend(v89, "CGColor"));

    -[FUScrollWheel layer](v21->_monthWheel, "layer");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setBorderWidth:", 1.0);

    v91 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    monthLabel = v21->_monthLabel;
    v21->_monthLabel = v91;

    v93 = v21->_monthLabel;
    FUBundle();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("MONTH"), &stru_24CF339D8, CFSTR("Localizable"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v93, "setText:", v95);

    -[UILabel setTextAlignment:](v21->_monthLabel, "setTextAlignment:", 1);
    v96 = v21->_monthLabel;
    v97 = *MEMORY[0x24BEBB5E8];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BEBB5E8]);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v96, "setFont:", v98);

    -[UILabel layer](v21->_monthLabel, "layer");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_retainAutorelease(v89);
    objc_msgSend(v99, "setBackgroundColor:", objc_msgSend(v100, "CGColor"));

    -[UILabel layer](v21->_monthLabel, "layer");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setCornerRadius:", 3.0);

    v102 = v21->_monthLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v102, "setTextColor:", v103);

    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_monthLabel);
    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_monthWheel);
    v104 = objc_alloc_init(FUScrollWheel);
    dayWheel = v21->_dayWheel;
    v21->_dayWheel = v104;

    -[FUScrollWheel setDataSource:](v21->_dayWheel, "setDataSource:", v21);
    -[FUScrollWheel setDelegate:](v21->_dayWheel, "setDelegate:", v21);
    -[FUScrollWheel setItemTitleAligmnent:](v21->_dayWheel, "setItemTitleAligmnent:", 1);
    -[FUScrollWheel layer](v21->_dayWheel, "layer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setCornerRadius:", v87);

    -[FUScrollWheel layer](v21->_dayWheel, "layer");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v108 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v107, "setBorderColor:", objc_msgSend(v108, "CGColor"));

    -[FUScrollWheel layer](v21->_dayWheel, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setBorderWidth:", 1.0);

    v110 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    dayLabel = v21->_dayLabel;
    v21->_dayLabel = v110;

    v112 = v21->_dayLabel;
    FUBundle();
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("DAY"), &stru_24CF339D8, CFSTR("Localizable"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v112, "setText:", v114);

    -[UILabel setTextAlignment:](v21->_dayLabel, "setTextAlignment:", 1);
    v115 = v21->_dayLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 10.0, v97);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v115, "setFont:", v116);

    -[UILabel layer](v21->_dayLabel, "layer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_retainAutorelease(v100);
    objc_msgSend(v117, "setBackgroundColor:", objc_msgSend(v118, "CGColor"));

    -[UILabel layer](v21->_dayLabel, "layer");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setCornerRadius:", 3.0);

    v120 = v21->_dayLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v120, "setTextColor:", v121);

    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_dayLabel);
    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_dayWheel);
    v122 = objc_alloc_init(FUScrollWheel);
    yearWheel = v21->_yearWheel;
    v21->_yearWheel = v122;

    -[FUScrollWheel setDataSource:](v21->_yearWheel, "setDataSource:", v21);
    -[FUScrollWheel setDelegate:](v21->_yearWheel, "setDelegate:", v21);
    -[FUScrollWheel setItemTitleAligmnent:](v21->_yearWheel, "setItemTitleAligmnent:", 1);
    -[FUScrollWheel layer](v21->_yearWheel, "layer");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setCornerRadius:", v87);

    -[FUScrollWheel layer](v21->_yearWheel, "layer");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v126 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v125, "setBorderColor:", objc_msgSend(v126, "CGColor"));

    -[FUScrollWheel layer](v21->_yearWheel, "layer");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setBorderWidth:", 1.0);

    v128 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    yearLabel = v21->_yearLabel;
    v21->_yearLabel = v128;

    v130 = v21->_yearLabel;
    FUBundle();
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("YEAR"), &stru_24CF339D8, CFSTR("Localizable"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v130, "setText:", v132);

    -[UILabel setTextAlignment:](v21->_yearLabel, "setTextAlignment:", 1);
    v133 = v21->_yearLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 10.0, v97);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v133, "setFont:", v134);

    -[UILabel layer](v21->_yearLabel, "layer");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v118), "CGColor"));

    -[UILabel layer](v21->_yearLabel, "layer");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setCornerRadius:", 3.0);

    v137 = v21->_yearLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v137;
    v17 = v145;
    -[UILabel setTextColor:](v139, "setTextColor:", v138);

    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_yearLabel);
    -[FUDatePicker addSubview:](v21, "addSubview:", v21->_yearWheel);
    -[FUDatePicker _updateDayRangeReloadingWheel:](v21, "_updateDayRangeReloadingWheel:", 1);
    -[FUDatePicker _updateSpinnersAnimated:](v21, "_updateSpinnersAnimated:", 0);

    v19 = v142;
    v18 = v143;
  }

  return v21;
}

- (id)_wheelOfType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *off_24CF308B0[a3]);
  return (id)(id)a2;
}

- (id)_enumerateDayValuesFromFormatter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setDay:", 1);
  objc_msgSend(v6, "setMonth:", 1);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_numRowsDate);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("fi"));

  if (self->_numRowsDate)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v4, "stringFromDate:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11)
      {
        objc_msgSend(v13, "stringByAppendingString:", CFSTR("."));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

      }
      else
      {
        objc_msgSend(v8, "addObject:", v13);
      }

      objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v12;
      v7 = v16;
    }
    while (v12 < self->_numRowsDate);
  }
  else
  {
    v16 = v7;
  }

  return v8;
}

- (id)_enumerateDayValues
{
  void *v3;
  unint64_t v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_numRowsDate);
  if (self->_numRowsDate)
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%d"), ++v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    while (self->_numRowsDate > v4);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UILabel *dayLabel;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  int64_t dayOrder;
  double v13;
  double v14;
  CGFloat v15;
  UILabel *yearLabel;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  int64_t yearOrder;
  double v22;
  double v23;
  CGFloat v24;
  UILabel *monthLabel;
  double v26;
  int64_t monthOrder;
  double v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v34.receiver = self;
  v34.super_class = (Class)FUDatePicker;
  -[FUDatePicker layoutSubviews](&v34, sel_layoutSubviews);
  -[FUDatePicker bounds](self, "bounds");
  v4 = v3;
  v33 = v5;
  v6 = floor((v3 + -10.0) / 3.0);
  -[UILabel sizeToFit](self->_dayLabel, "sizeToFit");
  dayLabel = self->_dayLabel;
  -[UILabel frame](dayLabel, "frame");
  v36 = CGRectInset(v35, -3.0, -1.5);
  -[UILabel setFrame:](dayLabel, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  -[UILabel frame](self->_dayLabel, "frame");
  v10 = v8;
  v11 = v9;
  dayOrder = self->_dayOrder;
  v13 = 0.0;
  v14 = 0.0;
  if (dayOrder)
  {
    if (dayOrder == 1)
    {
      v14 = v4 * 0.5 - v8 * 0.5;
      v13 = v4 * 0.5 - v6 * 0.5;
    }
    else
    {
      v14 = v4 - v8;
      v13 = v4 - v6;
    }
  }
  -[UILabel setFrame:](self->_dayLabel, "setFrame:", v14, 0.0, v8, v9);
  v37.origin.y = 0.0;
  v37.origin.x = v14;
  v37.size.width = v10;
  v37.size.height = v11;
  v15 = CGRectGetMaxY(v37) + 2.0;
  v38.origin.y = 0.0;
  v38.origin.x = v14;
  v38.size.width = v10;
  v38.size.height = v11;
  -[FUScrollWheel setFrame:](self->_dayWheel, "setFrame:", v13, v15, v6, v33 - (CGRectGetMaxY(v38) + 2.0));
  -[UILabel sizeToFit](self->_yearLabel, "sizeToFit");
  yearLabel = self->_yearLabel;
  -[UILabel frame](yearLabel, "frame");
  v40 = CGRectInset(v39, -3.0, -1.5);
  -[UILabel setFrame:](yearLabel, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  -[UILabel frame](self->_yearLabel, "frame");
  v18 = v17;
  v20 = v19;
  yearOrder = self->_yearOrder;
  if (yearOrder)
    v22 = v4 - v17;
  else
    v22 = 0.0;
  if (yearOrder)
    v23 = v4 - v6;
  else
    v23 = 0.0;
  -[UILabel setFrame:](self->_yearLabel, "setFrame:", v22);
  v41.origin.y = 0.0;
  v41.origin.x = v22;
  v41.size.width = v18;
  v41.size.height = v20;
  v32 = v4;
  v24 = CGRectGetMaxY(v41) + 2.0;
  v42.origin.y = 0.0;
  v42.origin.x = v22;
  v42.size.width = v18;
  v42.size.height = v20;
  -[FUScrollWheel setFrame:](self->_yearWheel, "setFrame:", v23, v24, v6, v33 - (CGRectGetMaxY(v42) + 2.0));
  -[UILabel sizeToFit](self->_monthLabel, "sizeToFit");
  monthLabel = self->_monthLabel;
  -[UILabel frame](monthLabel, "frame");
  v44 = CGRectInset(v43, -3.0, -1.5);
  -[UILabel setFrame:](monthLabel, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
  -[UILabel frame](self->_monthLabel, "frame");
  monthOrder = self->_monthOrder;
  if (monthOrder)
  {
    v28 = v4 - v26;
    if (monthOrder == 1)
      v29 = v4 * 0.5 - v6 * 0.5;
    else
      v29 = v4 - v6;
    if (monthOrder == 1)
      v28 = v32 * 0.5 - v26 * 0.5;
  }
  else
  {
    v28 = 0.0;
    v29 = 0.0;
  }
  -[UILabel setFrame:](self->_monthLabel, "setFrame:", v28, 0.0);
  v45.origin.y = 0.0;
  v45.origin.x = v22;
  v45.size.width = v18;
  v45.size.height = v20;
  v30 = CGRectGetMaxY(v45) + 2.0;
  v46.origin.y = 0.0;
  v46.origin.x = v22;
  v46.size.width = v18;
  v46.size.height = v20;
  -[FUScrollWheel setFrame:](self->_monthWheel, "setFrame:", v29, v30, v6, v33 - (CGRectGetMaxY(v46) + 2.0));
  -[FUScrollWheel reloadData](self->_monthWheel, "reloadData");
  -[FUScrollWheel reloadData](self->_dayWheel, "reloadData");
  -[FUScrollWheel reloadData](self->_yearWheel, "reloadData");
  -[FUDatePicker _wheelOfType:](self, "_wheelOfType:", self->_initialWheelType);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActiveScrollWheel");

}

- (void)setDate:(id)a3
{
  -[FUDatePicker setDate:animated:](self, "setDate:animated:", a3, 0);
}

- (void)setDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSDate *v6;
  NSDate *date;

  v4 = a4;
  v6 = (NSDate *)objc_msgSend(a3, "copy");
  date = self->_date;
  self->_date = v6;

  -[FUDatePicker _updateDayRangeReloadingWheel:](self, "_updateDayRangeReloadingWheel:", 0);
  -[FUDatePicker _updateSpinnersAnimated:](self, "_updateSpinnersAnimated:", v4);
}

- (id)dateWheel
{
  return self->_dayWheel;
}

- (void)_updateSpinnersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, self->_date);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[FUScrollWheel setCurrentIndex:animated:](self->_monthWheel, "setCurrentIndex:animated:", objc_msgSend(v9, "month") - self->_monthOffset, v3);
  -[FUScrollWheel setCurrentIndex:animated:](self->_dayWheel, "setCurrentIndex:animated:", objc_msgSend(v9, "day") - self->_dayOffset, v3);
  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setYear:", objc_msgSend(v9, "year"));
  objc_msgSend(v6, "setEra:", objc_msgSend(v9, "era"));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUScrollWheel setCurrentIndex:animated:](self->_yearWheel, "setCurrentIndex:animated:", -[NSMutableArray indexOfObject:](self->_yearsWithNames, "indexOfObject:", v8), v3);
}

- (void)_updateDayRangeReloadingWheel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, self->_date);
  v7 = v6;

  self->_numRowsDate = v7;
  if (v3)
  {
    self->_firstResponderShouldChange = 0;
    -[FUScrollWheel reloadData](self->_dayWheel, "reloadData");
    self->_firstResponderShouldChange = 1;
  }
}

- (id)scrollWheel:(id)a3 titleForItemAtIndex:(unint64_t)a4
{
  FUScrollWheel *v6;
  FUScrollWheel *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = (FUScrollWheel *)a3;
  v7 = v6;
  if (self->_monthWheel == v6)
  {
    -[NSArray objectAtIndexedSubscript:](self->_monthNames, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedUppercaseString");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (self->_dayWheel == v6)
  {
    -[NSArray objectAtIndexedSubscript:](self->_dayValues, "objectAtIndexedSubscript:", a4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (self->_yearWheel == v6)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_yearsWithNames, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_displayEra)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 2, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eraSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v13, "era"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringToIndex:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", v18);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = (__CFString *)v10;
LABEL_7:

    goto LABEL_9;
  }
  v8 = &stru_24CF339D8;
LABEL_9:

  return v8;
}

- (unint64_t)numberOfRowsInScrollWheel:(id)a3
{
  int *v3;

  if (self->_dayWheel == a3)
  {
    v3 = &OBJC_IVAR___FUDatePicker__numRowsDate;
  }
  else if (self->_monthWheel == a3)
  {
    v3 = &OBJC_IVAR___FUDatePicker__numRowsMonth;
  }
  else
  {
    v3 = &OBJC_IVAR___FUDatePicker__numRowsYear;
  }
  return *(unint64_t *)((char *)&self->super.super.super.isa + *v3);
}

- (void)tappedScrollWheel:(id)a3
{
  void *v4;
  double v5;
  double v6;
  FUScrollWheel *monthWheel;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  FUScrollWheel *dayWheel;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  FUScrollWheel *yearWheel;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FUScrollWheel *v25;

  v25 = (FUScrollWheel *)a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  monthWheel = self->_monthWheel;
  if (monthWheel != v25)
  {
    -[FUScrollWheel layer](self->_monthWheel, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 6.0);

    -[FUScrollWheel layer](self->_monthWheel, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    -[FUScrollWheel layer](self->_monthWheel, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 2.0 / v6);

  }
  -[UILabel setHidden:](self->_monthLabel, "setHidden:", monthWheel != v25);
  dayWheel = self->_dayWheel;
  if (dayWheel != v25)
  {
    -[FUScrollWheel layer](self->_dayWheel, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 6.0);

    -[FUScrollWheel layer](self->_dayWheel, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    -[FUScrollWheel layer](self->_dayWheel, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderWidth:", 2.0 / v6);

  }
  -[UILabel setHidden:](self->_dayLabel, "setHidden:", dayWheel != v25);
  yearWheel = self->_yearWheel;
  if (yearWheel != v25)
  {
    -[FUScrollWheel layer](self->_yearWheel, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 6.0);

    -[FUScrollWheel layer](self->_yearWheel, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    -[FUScrollWheel layer](self->_yearWheel, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 2.0 / v6);

  }
  -[UILabel setHidden:](self->_yearLabel, "setHidden:", yearWheel != v25);
  -[FUScrollWheel layer](v25, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 6.0);

  -[FUScrollWheel layer](v25, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBorderColor:", -[UIColor CGColor](self->_tintColor, "CGColor"));

  -[FUScrollWheel layer](v25, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBorderWidth:", 3.0 / v6);

}

- (void)scrollWheel:(id)a3 didChangeCurrentIndexTo:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSDate *v18;
  NSDate **p_date;
  NSDate *date;
  uint64_t v21;
  NSDate *minimumDate;
  NSDate *maximumDate;
  id WeakRetained;
  FUScrollWheel *v25;

  v25 = (FUScrollWheel *)a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  objc_msgSend(v5, "setMonth:", self->_monthOffset + -[FUScrollWheel currentIndex](self->_monthWheel, "currentIndex"));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndex:](self->_yearsWithNames, "objectAtIndex:", -[FUScrollWheel currentIndex](self->_yearWheel, "currentIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setYear:", objc_msgSend(v9, "year"));
  objc_msgSend(v5, "setEra:", objc_msgSend(v9, "era"));
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rangeOfUnit:inUnit:forDate:", 16, 8, v11);
  v14 = v13;

  v15 = -[FUScrollWheel currentIndex](self->_dayWheel, "currentIndex");
  if (v14 >= self->_dayOffset + v15)
    v16 = self->_dayOffset + v15;
  else
    v16 = v14;
  objc_msgSend(v5, "setDay:", v16);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateFromComponents:", v5);
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  p_date = &self->_date;
  date = self->_date;
  self->_date = v18;

  v21 = 552;
  minimumDate = self->_minimumDate;
  if (minimumDate && -[NSDate compare:](minimumDate, "compare:", *p_date) == NSOrderedDescending
    || (v21 = 560, (maximumDate = self->_maximumDate) != 0)
    && -[NSDate compare:](maximumDate, "compare:", *p_date) == NSOrderedAscending)
  {
    objc_storeStrong((id *)&self->_date, *(id *)((char *)&self->super.super.super.isa + v21));
    -[FUDatePicker _updateDayRangeReloadingWheel:](self, "_updateDayRangeReloadingWheel:", 1);
    -[FUDatePicker _updateSpinnersAnimated:](self, "_updateSpinnersAnimated:", 1);
  }
  else if (self->_monthWheel == v25 || self->_yearWheel == v25)
  {
    -[FUDatePicker _updateDayRangeReloadingWheel:](self, "_updateDayRangeReloadingWheel:", 1);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "datePicker:didSelectDate:", self, *p_date);

}

- (BOOL)scrollWheelShouldBecomeFirstResponder:(id)a3
{
  return self->_firstResponderShouldChange;
}

- (FUDatePickerDelegate)delegate
{
  return (FUDatePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (FUScrollWheel)monthWheel
{
  return self->_monthWheel;
}

- (void)setMonthWheel:(id)a3
{
  objc_storeStrong((id *)&self->_monthWheel, a3);
}

- (FUScrollWheel)dayWheel
{
  return self->_dayWheel;
}

- (void)setDayWheel:(id)a3
{
  objc_storeStrong((id *)&self->_dayWheel, a3);
}

- (FUScrollWheel)yearWheel
{
  return self->_yearWheel;
}

- (void)setYearWheel:(id)a3
{
  objc_storeStrong((id *)&self->_yearWheel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearWheel, 0);
  objc_storeStrong((id *)&self->_dayWheel, 0);
  objc_storeStrong((id *)&self->_monthWheel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_yearLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_yearsWithNames, 0);
  objc_storeStrong((id *)&self->_dayValues, 0);
  objc_storeStrong((id *)&self->_monthNames, 0);
}

@end
