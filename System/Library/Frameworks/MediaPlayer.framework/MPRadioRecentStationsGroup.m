@implementation MPRadioRecentStationsGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedTitle;
  id v5;

  localizedTitle = self->_localizedTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, CFSTR("MPRadioRecentStationsGroupLocalizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stations, CFSTR("MPRadioRecentStationsGroupStations"));

}

- (MPRadioRecentStationsGroup)initWithCoder:(id)a3
{
  id v4;
  MPRadioRecentStationsGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *stations;
  uint64_t v11;
  NSString *localizedTitle;

  v4 = a3;
  v5 = -[MPRadioRecentStationsGroup init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPRadioRecentStationsGroupStations"));
    v9 = objc_claimAutoreleasedReturnValue();
    stations = v5->_stations;
    v5->_stations = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPRadioRecentStationsGroupLocalizedTitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;

  }
  return v5;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)stations
{
  return self->_stations;
}

- (void)setStations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
