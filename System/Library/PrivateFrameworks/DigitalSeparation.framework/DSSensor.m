@implementation DSSensor

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)tccPermission
{
  return self->_tccPermission;
}

- (void)setTccPermission:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccPermission, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
