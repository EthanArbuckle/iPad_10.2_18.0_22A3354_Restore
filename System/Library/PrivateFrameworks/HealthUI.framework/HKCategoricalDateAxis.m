@implementation HKCategoricalDateAxis

- (HKCategoricalDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4 categoryTitles:(id)a5
{
  id v9;
  HKCategoricalDateAxis *v10;
  HKCategoricalDateAxis *v11;
  double v12;
  NSDateComponents *v13;
  NSDateComponents *minorAxisIntervalComponents;
  NSDateComponents *v15;
  NSDateComponents *majorAxisIntervalComponents;
  objc_super v18;

  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKCategoricalDateAxis;
  v10 = -[HKDateAxis initWithCurrentCalendar:axisStyle:](&v18, sel_initWithCurrentCalendar_axisStyle_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryTitles, a5);
    +[HKCategoricalDateAxis _categoryStartLocationMinutesForCategoryCount:](HKCategoricalDateAxis, "_categoryStartLocationMinutesForCategoryCount:", objc_msgSend(v9, "count"));
    v11->_categoriesStartMinutePosition = (uint64_t)v12;
    v13 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    minorAxisIntervalComponents = v11->_minorAxisIntervalComponents;
    v11->_minorAxisIntervalComponents = v13;

    -[NSDateComponents setMinute:](v11->_minorAxisIntervalComponents, "setMinute:", v11->_categoriesStartMinutePosition);
    v15 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    majorAxisIntervalComponents = v11->_majorAxisIntervalComponents;
    v11->_majorAxisIntervalComponents = v15;

    -[NSDateComponents setMinute:](v11->_majorAxisIntervalComponents, "setMinute:", (uint64_t)((double)v11->_categoriesStartMinutePosition + (double)v11->_categoriesStartMinutePosition));
  }

  return v11;
}

- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  return (id)objc_msgSend(a5, "hk_startOfDateByAddingDays:toDate:", 0, a3);
}

- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v29;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v10, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", 126, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hour");
  v15 = objc_msgSend(v13, "minute") + 60 * v14;
  if (v15 % objc_msgSend(v10, "minute"))
  {
    objc_msgSend(v11, "startOfDayForDate:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_dateByAddingDays:toDate:", 1, v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceDate:", v16);
    v18 = v17;
    v19 = objc_msgSend(v10, "minute");
    -[HKCategoricalDateAxis minorAxisIntervalComponents](self, "minorAxisIntervalComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "minute");

    if (v19 == v21)
    {
      -[HKCategoricalDateAxis categoryTitles](self, "categoryTitles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v18 / (double)(unint64_t)objc_msgSend(v22, "count") * 0.5;
    }
    else
    {
      v25 = objc_msgSend(v10, "minute");
      -[HKCategoricalDateAxis majorAxisIntervalComponents](self, "majorAxisIntervalComponents");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "minute");

      v23 = 0.0;
      if (v25 != v27)
      {
LABEL_8:
        objc_msgSend(v9, "dateByAddingTimeInterval:", v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      -[HKCategoricalDateAxis categoryTitles](self, "categoryTitles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v18 / (double)(unint64_t)objc_msgSend(v22, "count");
    }

    goto LABEL_8;
  }
  v24 = v12;
LABEL_9:

  return v24;
}

- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3
{
  return a3 == 2;
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = -[HKCategoricalDateAxis canAddLabelForAxisLabelType:](self, "canAddLabelForAxisLabelType:", a5);
  v10 = 0;
  if (a4 == 6 && v9)
  {
    -[HKCategoricalDateAxis categoryTitles](self, "categoryTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    -[HKDateAxis currentCalendar](self, "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startOfDayForDate:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 < 1)
    {
LABEL_7:
      v10 = 0;
    }
    else
    {
      v15 = 0;
      while (1)
      {
        -[HKDateAxis currentCalendar](self, "currentCalendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKCategoricalDateAxis datePositionForCategoryIndex:categoryCount:startDate:calendar:](HKCategoricalDateAxis, "datePositionForCategoryIndex:categoryCount:startDate:calendar:", v15, v12, v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "isEqual:", v17))
          break;

        if (v12 == ++v15)
          goto LABEL_7;
      }
      -[HKCategoricalDateAxis categoryTitles](self, "categoryTitles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

+ (id)datePositionForCategoryIndex:(int64_t)a3 categoryCount:(int64_t)a4 startDate:(id)a5 calendar:(id)a6
{
  id v9;
  void *v10;
  double v11;
  void *v12;

  v9 = a5;
  objc_msgSend(a6, "hk_dateByAddingDays:toDate:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v9);
  objc_msgSend(v9, "dateByAddingTimeInterval:", v11 / (double)a4 * 0.5 + (double)a3 * (v11 / (double)a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (double)_categoryLocationMinutesForCategoryCount:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;

  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalSize");
  v6 = v5;

  return v6 / (double)a3 / 60.0;
}

+ (double)_categoryStartLocationMinutesForCategoryCount:(int64_t)a3
{
  double v3;

  +[HKCategoricalDateAxis _categoryLocationMinutesForCategoryCount:](HKCategoricalDateAxis, "_categoryLocationMinutesForCategoryCount:", a3);
  return v3 * 0.5;
}

- (NSArray)categoryTitles
{
  return self->_categoryTitles;
}

- (void)setCategoryTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)categoriesStartMinutePosition
{
  return self->_categoriesStartMinutePosition;
}

- (void)setCategoriesStartMinutePosition:(int64_t)a3
{
  self->_categoriesStartMinutePosition = a3;
}

- (NSDateComponents)minorAxisIntervalComponents
{
  return self->_minorAxisIntervalComponents;
}

- (void)setMinorAxisIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDateComponents)majorAxisIntervalComponents
{
  return self->_majorAxisIntervalComponents;
}

- (void)setMajorAxisIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_majorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_minorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_categoryTitles, 0);
}

@end
