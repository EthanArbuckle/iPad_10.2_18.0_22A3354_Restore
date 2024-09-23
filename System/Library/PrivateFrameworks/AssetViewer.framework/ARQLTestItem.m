@implementation ARQLTestItem

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalParameters, 0);
}

@end
