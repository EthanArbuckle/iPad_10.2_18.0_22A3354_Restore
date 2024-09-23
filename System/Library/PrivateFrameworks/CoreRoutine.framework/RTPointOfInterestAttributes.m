@implementation RTPointOfInterestAttributes

- (RTPointOfInterestAttributes)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithApplePaySupport_category_muid_nearbyPoiCount_);
}

- (RTPointOfInterestAttributes)initWithApplePaySupport:(BOOL)a3 category:(id)a4 muid:(unint64_t)a5 nearbyPoiCount:(unint64_t)a6
{
  id v11;
  RTPointOfInterestAttributes *v12;
  RTPointOfInterestAttributes *v13;
  RTPointOfInterestAttributes *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[16];

  v11 = a4;
  if (a5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTPointOfInterestAttributes;
    v12 = -[RTPointOfInterestAttributes init](&v17, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_applePaySupport = a3;
      objc_storeStrong((id *)&v12->_category, a4);
      v13->_muid = a5;
      v13->_nearbyPoiCount = a6;
    }
    self = v13;
    v14 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: muid > 0", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("YES");
  if (!self->_applePaySupport)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("muid, %lu, applePaySupport, %@, category, %@, nearbyPOICount, %lu"), self->_muid, v2, self->_category, self->_nearbyPoiCount);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 applePaySupport;
  id v5;

  applePaySupport = self->_applePaySupport;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", applePaySupport, CFSTR("applePaySupport"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_muid, CFSTR("muid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_nearbyPoiCount, CFSTR("nearbyPoiCount"));

}

- (RTPointOfInterestAttributes)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  RTPointOfInterestAttributes *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applePaySupport"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("muid"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nearbyPoiCount"));

  v9 = -[RTPointOfInterestAttributes initWithApplePaySupport:category:muid:nearbyPoiCount:](self, "initWithApplePaySupport:category:muid:nearbyPoiCount:", v5, v6, v7, v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithApplePaySupport:category:muid:nearbyPoiCount:", self->_applePaySupport, self->_category, self->_muid, self->_nearbyPoiCount);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)nearbyPoiCount
{
  return self->_nearbyPoiCount;
}

- (BOOL)applePaySupport
{
  return self->_applePaySupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
