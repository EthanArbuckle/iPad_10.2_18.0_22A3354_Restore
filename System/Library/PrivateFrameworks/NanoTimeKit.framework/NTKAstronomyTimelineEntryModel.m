@implementation NTKAstronomyTimelineEntryModel

- (NTKAstronomyTimelineEntryModel)initWithVista:(unint64_t)a3 entryDate:(id)a4 currentDate:(id)a5 currentLocation:(id)a6 anyLocation:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NTKAstronomyTimelineEntryModel *v16;
  NTKAstronomyTimelineEntryModel *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NTKAstronomyTimelineEntryModel;
  v16 = -[NTKAstronomyTimelineEntryModel init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_vista = a3;
    objc_storeStrong((id *)&v16->_currentLocation, a6);
    objc_storeStrong((id *)&v17->_anyLocation, a7);
    objc_storeStrong((id *)&v17->_currentDate, a5);
    -[NTKTimelineEntryModel setEntryDate:](v17, "setEntryDate:", v12);
  }

  return v17;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  int v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CLLocation *currentLocation;
  CLLocation *anyLocation;
  void *v13;
  int64_t v14;
  void *v15;
  int v16;
  CLLocation *v17;
  __int16 v18;
  CLLocation *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = _os_feature_enabled_impl();
  if (a3 == 11 && v5)
  {
    -[NTKAstronomyTimelineEntryModel _graphicRectangular](self, "_graphicRectangular");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_vista));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("vista"));

    -[NTKTimelineEntryModel entryDate](self, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("entry date"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_currentDate, CFSTR("current date"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_currentLocation, CFSTR("current location"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_anyLocation, CFSTR("any location"));
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      currentLocation = self->_currentLocation;
      anyLocation = self->_anyLocation;
      -[NTKTimelineEntryModel entryDate](self, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138478339;
      v17 = currentLocation;
      v18 = 2113;
      v19 = anyLocation;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "NTKAstronomyTimeLineEntryModel templateForComplicationFamily with currentLocation?:%{private}@, anyLocation?:%{private}@, with date:%@", (uint8_t *)&v16, 0x20u);

    }
    v14 = a3 - 8;
    if ((unint64_t)(a3 - 8) <= 4 && ((0x17u >> v14) & 1) != 0)
    {
      objc_msgSend(**((id **)&unk_1E6BD3680 + v14), "templateWithMetadata:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

    return v15;
  }
}

- (id)_graphicRectangular
{
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[NTKAstronomyTimelineEntryModel currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NUNILocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.811764706, 0.937254902, 0.584313725, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  v8 = (void *)MEMORY[0x1E0C99E08];
  -[NTKAstronomyTimelineEntryModel anyLocation](self, "anyLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v3, CFSTR("CurrentEventDate"), v5, CFSTR("MoonViewOffsetDate"), v9, CFSTR("AnyLocation"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKAstronomyTimelineEntryModel currentLocation](self, "currentLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NTKAstronomyTimelineEntryModel currentLocation](self, "currentLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("CurrentLocation"));

  }
  objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v13, "setMetadata:", v14);

  objc_msgSend(MEMORY[0x1E0C943A8], "templateWithTextProvider:imageProvider:", v6, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C94110];
  v19[0] = &unk_1E6C9EBA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetadata:", v16);

  return v15;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (CLLocation)anyLocation
{
  return self->_anyLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end
