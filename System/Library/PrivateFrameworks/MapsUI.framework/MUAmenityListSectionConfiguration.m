@implementation MUAmenityListSectionConfiguration

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MUAmenityApplePayConfiguration)applePayConfiguration
{
  return self->_applePayConfiguration;
}

- (void)setApplePayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_applePayConfiguration, a3);
}

- (unint64_t)numberInlineAmenities
{
  return self->_numberInlineAmenities;
}

- (void)setNumberInlineAmenities:(unint64_t)a3
{
  self->_numberInlineAmenities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayConfiguration, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
