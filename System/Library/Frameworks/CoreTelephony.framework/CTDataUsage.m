@implementation CTDataUsage

- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4 wifi:(unint64_t)a5
{
  CTDataUsage *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTDataUsage;
  result = -[CTDataUsage init](&v8, sel_init, a3, a4, a5);
  if (result)
  {
    result->_cellularHome = a3;
    result->_cellularRoaming = a4;
    result->_wifi = 0;
  }
  return result;
}

- (CTDataUsage)initWithHome:(unint64_t)a3 roaming:(unint64_t)a4
{
  CTDataUsage *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTDataUsage;
  result = -[CTDataUsage init](&v7, sel_init);
  if (result)
  {
    result->_cellularHome = a3;
    result->_cellularRoaming = a4;
    result->_wifi = 0;
  }
  return result;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellular home = %lu"), -[CTDataUsage cellularHome](self, "cellularHome"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellular roaming = %lu"), -[CTDataUsage cellularRoaming](self, "cellularRoaming"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[CTDataUsage cellularHome](self, "cellularHome");
  if (v5 == objc_msgSend(v4, "cellularHome"))
  {
    v6 = -[CTDataUsage cellularRoaming](self, "cellularRoaming");
    v7 = v6 == objc_msgSend(v4, "cellularRoaming");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CTDataUsage cellularHome](self, "cellularHome");
  return -[CTDataUsage cellularRoaming](self, "cellularRoaming") | v3;
}

- (void)addUsage:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[CTDataUsage setCellularHome:](self, "setCellularHome:", -[CTDataUsage cellularHome](self, "cellularHome") + objc_msgSend(v4, "cellularHome"));
  v5 = objc_msgSend(v4, "cellularRoaming");

  -[CTDataUsage setCellularRoaming:](self, "setCellularRoaming:", -[CTDataUsage cellularRoaming](self, "cellularRoaming") + v5);
}

- (BOOL)isEmpty
{
  return !-[CTDataUsage cellularHome](self, "cellularHome")
      && -[CTDataUsage cellularRoaming](self, "cellularRoaming") == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = -[CTDataUsage cellularHome](self, "cellularHome");
  v4[2] = -[CTDataUsage cellularRoaming](self, "cellularRoaming");
  v4[3] = -[CTDataUsage wifi](self, "wifi");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTDataUsage cellularHome](self, "cellularHome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("cellularHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTDataUsage cellularRoaming](self, "cellularRoaming"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("cellularRoaming"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTDataUsage wifi](self, "wifi"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("wifiKey"));

}

- (CTDataUsage)initWithCoder:(id)a3
{
  id v4;
  CTDataUsage *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTDataUsage;
  v5 = -[CTDataUsage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularHome"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cellularHome = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularRoaming"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cellularRoaming = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wifiKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wifi = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)cellularHome
{
  return self->_cellularHome;
}

- (void)setCellularHome:(unint64_t)a3
{
  self->_cellularHome = a3;
}

- (unint64_t)cellularRoaming
{
  return self->_cellularRoaming;
}

- (void)setCellularRoaming:(unint64_t)a3
{
  self->_cellularRoaming = a3;
}

- (unint64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(unint64_t)a3
{
  self->_wifi = a3;
}

@end
