@implementation CTMobileEquipmentInfoList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTMobileEquipmentInfoList meInfoList](self, "meInfoList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" meInfoList=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSArray *meInfoList;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    meInfoList = self->_meInfoList;
    objc_msgSend(v4, "meInfoList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSArray isEqualToArray:](meInfoList, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTMobileEquipmentInfoList meInfoList](self, "meInfoList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMeInfoList:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_meInfoList, CFSTR("meInfoList"));
}

- (CTMobileEquipmentInfoList)initWithCoder:(id)a3
{
  id v4;
  CTMobileEquipmentInfoList *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *meInfoList;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTMobileEquipmentInfoList;
  v5 = -[CTMobileEquipmentInfoList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("meInfoList"));
    v9 = objc_claimAutoreleasedReturnValue();
    meInfoList = v5->_meInfoList;
    v5->_meInfoList = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)meInfoList
{
  return self->_meInfoList;
}

- (void)setMeInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_meInfoList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meInfoList, 0);
}

@end
