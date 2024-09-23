@implementation MUAmenityApplePayConfiguration

+ (id)configurationFromAmenityItem:(id)a3
{
  id v3;
  MUAmenityApplePayConfiguration *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "isApplePayAmenity"))
  {
    v4 = objc_alloc_init(MUAmenityApplePayConfiguration);
    -[MUAmenityApplePayConfiguration setShowApplePayIcons:](v4, "setShowApplePayIcons:", objc_msgSend(v3, "isAmenityPresent"));
    objc_msgSend(v3, "amenityTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
      -[MUAmenityApplePayConfiguration setApplePayRowAmenity:](v4, "setApplePayRowAmenity:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MUAmenityItemViewModel)applePayRowAmenity
{
  return self->_applePayRowAmenity;
}

- (void)setApplePayRowAmenity:(id)a3
{
  objc_storeStrong((id *)&self->_applePayRowAmenity, a3);
}

- (BOOL)showApplePayIcons
{
  return self->_showApplePayIcons;
}

- (void)setShowApplePayIcons:(BOOL)a3
{
  self->_showApplePayIcons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayRowAmenity, 0);
}

@end
