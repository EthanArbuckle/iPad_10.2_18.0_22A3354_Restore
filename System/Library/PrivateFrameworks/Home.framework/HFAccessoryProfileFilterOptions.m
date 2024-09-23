@implementation HFAccessoryProfileFilterOptions

- (NSSet)byAccessories
{
  return self->_byAccessories;
}

- (void)setByAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)byCategoryTypes
{
  return self->_byCategoryTypes;
}

- (void)setByCategoryTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)byClasses
{
  return self->_byClasses;
}

- (void)setByClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)byFavorites
{
  return self->_byFavorites;
}

- (void)setByFavorites:(BOOL)a3
{
  self->_byFavorites = a3;
}

- (NSSet)byManufacturers
{
  return self->_byManufacturers;
}

- (void)setByManufacturers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)byModels
{
  return self->_byModels;
}

- (void)setByModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)byRooms
{
  return self->_byRooms;
}

- (void)setByRooms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)byFilter
{
  return self->_byFilter;
}

- (void)setByFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_byFilter, 0);
  objc_storeStrong((id *)&self->_byRooms, 0);
  objc_storeStrong((id *)&self->_byModels, 0);
  objc_storeStrong((id *)&self->_byManufacturers, 0);
  objc_storeStrong((id *)&self->_byClasses, 0);
  objc_storeStrong((id *)&self->_byCategoryTypes, 0);
  objc_storeStrong((id *)&self->_byAccessories, 0);
}

@end
