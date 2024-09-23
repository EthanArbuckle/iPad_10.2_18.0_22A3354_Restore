@implementation ANHomeContext

- (ANHomeContext)init
{
  ANHomeContext *v2;
  ANHomeContext *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANHomeContext;
  v2 = -[ANHomeContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ANHomeContext setHomeName:](v2, "setHomeName:", &stru_24D370F00);
    v4 = MEMORY[0x24BDBD1A8];
    -[ANHomeContext setZoneNames:](v3, "setZoneNames:", MEMORY[0x24BDBD1A8]);
    -[ANHomeContext setRoomNames:](v3, "setRoomNames:", v4);
  }
  return v3;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[ANHomeContext homeName](self, "homeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    -[ANHomeContext zoneNames](self, "zoneNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[ANHomeContext roomNames](self, "roomNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") == 0;

    }
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANHomeContext homeName](self, "homeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANHomeContext zoneNames](self, "zoneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANHomeContext roomNames](self, "roomNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Home Name: %@, Zone Names: %@, Room Names: %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ANHomeContext homeName](self, "homeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("home"));

  -[ANHomeContext zoneNames](self, "zoneNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("zones"));

  -[ANHomeContext roomNames](self, "roomNames");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rooms"));

}

- (ANHomeContext)initWithCoder:(id)a3
{
  id v4;
  ANHomeContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANHomeContext;
  v5 = -[ANHomeContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANHomeContext setHomeName:](v5, "setHomeName:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("zones"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANHomeContext setZoneNames:](v5, "setZoneNames:", v10);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rooms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANHomeContext setRoomNames:](v5, "setRoomNames:", v11);

  }
  return v5;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_homeName, a3);
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
  objc_storeStrong((id *)&self->_zoneNames, a3);
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (void)setRoomNames:(id)a3
{
  objc_storeStrong((id *)&self->_roomNames, a3);
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
}

@end
