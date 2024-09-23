@implementation GCHIDElementSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHIDElementSnapshot)initWithHIDElement:(id)a3
{
  id v3;
  GCHIDElementSnapshot *v4;
  uint64_t v5;
  NSString *name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCHIDElementSnapshot;
  v3 = a3;
  v4 = -[GCHIDElementSnapshot init](&v8, sel_init);
  v4->_usageType = objc_msgSend(v3, "usageType", v8.receiver, v8.super_class);
  v4->_usageTypeIndex = objc_msgSend(v3, "usageTypeIndex");
  v4->_elementCookie = objc_msgSend(v3, "elementCookie");
  v4->_type = objc_msgSend(v3, "type");
  v4->_collectionType = objc_msgSend(v3, "collectionType");
  v4->_usage = objc_msgSend(v3, "usage");
  v4->_usagePage = objc_msgSend(v3, "usagePage");
  v4->_min = objc_msgSend(v3, "min");
  v4->_max = objc_msgSend(v3, "max");
  v4->_scaledMin = objc_msgSend(v3, "scaledMin");
  v4->_scaledMax = objc_msgSend(v3, "scaledMax");
  v4->_size = objc_msgSend(v3, "size");
  v4->_reportSize = objc_msgSend(v3, "reportSize");
  v4->_reportCount = objc_msgSend(v3, "reportCount");
  v4->_reportID = objc_msgSend(v3, "reportID");
  v4->_isArray = objc_msgSend(v3, "isArray");
  v4->_isRelative = objc_msgSend(v3, "isRelative");
  v4->_isWrapping = objc_msgSend(v3, "isWrapping");
  v4->_isNonLinear = objc_msgSend(v3, "isNonLinear");
  v4->_hasPreferredState = objc_msgSend(v3, "hasPreferredState");
  v4->_hasNullState = objc_msgSend(v3, "hasNullState");
  v4->_flags = objc_msgSend(v3, "flags");
  v4->_unit = objc_msgSend(v3, "unit");
  v4->_unitExponent = objc_msgSend(v3, "unitExponent");
  objc_msgSend(v3, "name");
  v5 = objc_claimAutoreleasedReturnValue();

  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (GCHIDElementSnapshot)initWithDictionary:(id)a3
{
  id v4;
  GCHIDElementSnapshot *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSString *name;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;

  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)GCHIDElementSnapshot;
  v5 = -[GCHIDElementSnapshot init](&v82, sel_init);
  objc_msgSend(v4, "objectForKey:", CFSTR("UsageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;
  v5->_usageType = v7;
  objc_msgSend(v4, "objectForKey:", CFSTR("UsageTypeIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = objc_msgSend(v8, "integerValue");
  else
    v9 = -1;
  v5->_usageTypeIndex = v9;
  objc_msgSend(v4, "objectForKey:", CFSTR("ElementCookie"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = 0;
  v5->_elementCookie = v11;
  objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v12, "intValue");
  else
    v13 = 0;
  v5->_type = v13;
  objc_msgSend(v4, "objectForKey:", CFSTR("CollectionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = objc_msgSend(v14, "intValue");
  else
    v15 = 0;
  v5->_collectionType = v15;
  objc_msgSend(v4, "objectForKey:", CFSTR("Usage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = objc_msgSend(v16, "integerValue");
  else
    v17 = 0;
  v5->_usage = v17;
  objc_msgSend(v4, "objectForKey:", CFSTR("UsagePage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v81 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = objc_msgSend(v18, "integerValue");
  else
    v19 = 0;
  v5->_usagePage = v19;
  objc_msgSend(v4, "objectForKey:", CFSTR("Min"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v75 = v20;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = objc_msgSend(v20, "integerValue");
  else
    v21 = 0;
  v79 = v10;
  v5->_min = v21;
  objc_msgSend(v4, "objectForKey:", CFSTR("Max"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v80 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = objc_msgSend(v22, "integerValue");
  else
    v23 = 0;
  v69 = v18;
  v5->_max = v23;
  objc_msgSend(v4, "objectForKey:", CFSTR("ScaledMin"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v73 = v24;
  v25 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = objc_msgSend(v24, "integerValue");
  else
    v26 = 0;
  v27 = v14;
  v5->_scaledMin = v26;
  objc_msgSend(v4, "objectForKey:", CFSTR("ScaledMax"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v29 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = objc_msgSend(v28, "integerValue");
  else
    v30 = 0;
  v5->_scaledMax = v30;
  objc_msgSend(v4, "objectForKey:", CFSTR("Size"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v71 = v31;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = objc_msgSend(v31, "integerValue");
  else
    v32 = 0;
  v5->_size = v32;
  objc_msgSend(v4, "objectForKey:", CFSTR("ReportSize"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v34 = v29;
  v70 = v33;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = objc_msgSend(v33, "integerValue");
  else
    v35 = 0;
  v36 = v27;
  v5->_reportSize = v35;
  objc_msgSend(v4, "objectForKey:", CFSTR("ReportCount"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v76 = v25;
  v74 = v22;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v38 = objc_msgSend(v37, "unsignedIntValue");
  else
    v38 = 0;
  v5->_reportCount = v38;
  objc_msgSend(v4, "objectForKey:", CFSTR("ReportID"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = objc_msgSend(v39, "integerValue");
  else
    v40 = 0;
  v5->_reportID = v40;
  objc_msgSend(v4, "objectForKey:", CFSTR("IsArray"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v66 = v41;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v42 = objc_msgSend(v41, "BOOLValue");
  else
    v42 = 0;
  v5->_isArray = v42;
  objc_msgSend(v4, "objectForKey:", CFSTR("IsRelative"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = objc_msgSend(v43, "BOOLValue");
  else
    v44 = 0;
  v5->_isRelative = v44;
  objc_msgSend(v4, "objectForKey:", CFSTR("IsWrapping"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v72 = v28;
  v64 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = objc_msgSend(v45, "BOOLValue", v45, v66);
  else
    v46 = 0;
  v5->_isWrapping = v46;
  objc_msgSend(v4, "objectForKey:", CFSTR("IsNonLinear"), v64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v67 = v39;
  v68 = v37;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v48 = objc_msgSend(v47, "BOOLValue");
  else
    v48 = 0;
  v5->_isNonLinear = v48;
  objc_msgSend(v4, "objectForKey:", CFSTR("HasPreferredState"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v78 = v34;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v50 = objc_msgSend(v49, "BOOLValue");
  else
    v50 = 0;
  v5->_hasPreferredState = v50;
  objc_msgSend(v4, "objectForKey:", CFSTR("HasNullState"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v77 = v36;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v52 = objc_msgSend(v51, "BOOLValue");
  else
    v52 = 0;
  v5->_hasNullState = v52;
  objc_msgSend(v4, "objectForKey:", CFSTR("Flags"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v54 = objc_msgSend(v53, "unsignedIntValue");
  else
    v54 = 0;
  v5->_flags = v54;
  objc_msgSend(v4, "objectForKey:", CFSTR("Unit"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v56 = v43;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = objc_msgSend(v55, "integerValue");
  else
    v57 = 0;
  v5->_unit = v57;
  objc_msgSend(v4, "objectForKey:", CFSTR("UnitExponent"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v59 = objc_msgSend(v58, "integerValue");
  else
    v59 = 0;
  v5->_unitExponent = v59;
  objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = objc_msgSend(v60, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v61;
  }
  else
  {
    name = v5->_name;
    v5->_name = 0;
  }

  return v5;
}

- (GCHIDElementSnapshot)initWithCoder:(id)a3
{
  id v3;
  GCHIDElementSnapshot *v4;
  uint64_t v5;
  NSString *name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCHIDElementSnapshot;
  v3 = a3;
  v4 = -[GCHIDElementSnapshot init](&v8, sel_init);
  v4->_usageType = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UsageType"), v8.receiver, v8.super_class);
  v4->_usageTypeIndex = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UsageTypeIndex"));
  v4->_elementCookie = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("ElementCookie"));
  v4->_type = objc_msgSend(v3, "decodeIntForKey:", CFSTR("Type"));
  v4->_collectionType = objc_msgSend(v3, "decodeIntForKey:", CFSTR("CollectionType"));
  v4->_usage = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Usage"));
  v4->_usagePage = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UsagePage"));
  v4->_min = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Min"));
  v4->_max = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Max"));
  v4->_scaledMin = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ScaledMin"));
  v4->_scaledMax = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ScaledMax"));
  v4->_size = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Size"));
  v4->_reportSize = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ReportSize"));
  v4->_reportCount = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("ReportCount"));
  v4->_reportID = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ReportID"));
  v4->_isArray = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsArray"));
  v4->_isRelative = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsRelative"));
  v4->_isWrapping = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsWrapping"));
  v4->_isNonLinear = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsNonLinear"));
  v4->_hasNullState = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HasNullState"));
  v4->_flags = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("Flags"));
  v4->_unit = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Unit"));
  v4->_unitExponent = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UnitExponent"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v5 = objc_claimAutoreleasedReturnValue();

  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t usageType;
  id v5;

  usageType = self->_usageType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", usageType, CFSTR("UsageType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usageTypeIndex, CFSTR("UsageTypeIndex"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_elementCookie, CFSTR("ElementCookie"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_collectionType, CFSTR("CollectionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usage, CFSTR("Usage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usagePage, CFSTR("UsagePage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_min, CFSTR("Min"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_max, CFSTR("Max"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scaledMin, CFSTR("ScaledMin"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scaledMax, CFSTR("ScaledMax"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_size, CFSTR("Size"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reportSize, CFSTR("ReportSize"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_reportCount, CFSTR("ReportCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reportID, CFSTR("ReportID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isArray != 0, CFSTR("IsArray"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRelative != 0, CFSTR("IsRelative"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWrapping != 0, CFSTR("IsWrapping"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNonLinear != 0, CFSTR("IsNonLinear"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNullState != 0, CFSTR("HasNullState"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("Flags"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unit, CFSTR("Unit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unitExponent, CFSTR("UnitExponent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("Name"));

}

- (GCHIDElementSnapshot)init
{
  -[GCHIDElementSnapshot doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)valueForElementKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  GCHIDElementAttributeKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCHIDElementSnapshot valueForKey:](self, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  GCHIDElementAttributeKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "substringToIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
  }
  v12.receiver = self;
  v12.super_class = (Class)GCHIDElementSnapshot;
  -[GCHIDElementSnapshot valueForKey:](&v12, sel_valueForKey_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCHIDElementSnapshot;
  -[GCHIDElementSnapshot debugDescription](&v9, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCHIDElementSnapshot elementCookie](self, "elementCookie");
  v5 = -[GCHIDElementSnapshot type](self, "type");
  -[GCHIDElementSnapshot name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ {\n\t elementCookie = %u\n\t type = %i\n\t name = %@\n\t usageType = %zd\n\t usageTypeIndex = %zd\n\t usage = %zd\n\t usagePage = %zd\n}"), v3, v4, v5, v6, -[GCHIDElementSnapshot usageType](self, "usageType"), -[GCHIDElementSnapshot usageTypeIndex](self, "usageTypeIndex"), -[GCHIDElementSnapshot usage](self, "usage"), -[GCHIDElementSnapshot usagePage](self, "usagePage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (int64_t)usageTypeIndex
{
  return self->_usageTypeIndex;
}

- (unsigned)elementCookie
{
  return self->_elementCookie;
}

- (int)type
{
  return self->_type;
}

- (int)collectionType
{
  return self->_collectionType;
}

- (int64_t)usage
{
  return self->_usage;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (int64_t)min
{
  return self->_min;
}

- (int64_t)max
{
  return self->_max;
}

- (int64_t)scaledMin
{
  return self->_scaledMin;
}

- (int64_t)scaledMax
{
  return self->_scaledMax;
}

- (int64_t)size
{
  return self->_size;
}

- (int64_t)reportSize
{
  return self->_reportSize;
}

- (unsigned)reportCount
{
  return self->_reportCount;
}

- (int64_t)reportID
{
  return self->_reportID;
}

- (unsigned)isArray
{
  return self->_isArray;
}

- (unsigned)isRelative
{
  return self->_isRelative;
}

- (unsigned)isWrapping
{
  return self->_isWrapping;
}

- (unsigned)isNonLinear
{
  return self->_isNonLinear;
}

- (unsigned)hasPreferredState
{
  return self->_hasPreferredState;
}

- (unsigned)hasNullState
{
  return self->_hasNullState;
}

- (unsigned)flags
{
  return self->_flags;
}

- (int64_t)unit
{
  return self->_unit;
}

- (int64_t)unitExponent
{
  return self->_unitExponent;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
