@implementation IRServicePackageAdapterClassification

- (IRServicePackageAdapterClassification)init
{
  IRServicePackageAdapterClassification *v2;
  IRServicePackageAdapterClassification *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IRServicePackageAdapterClassification;
  v2 = -[IRServicePackageAdapterClassification init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IRServicePackageAdapterClassification setIsValid:](v2, "setIsValid:", 0);
    -[IRServicePackageAdapterClassification setDetailedDesc:](v3, "setDetailedDesc:", &stru_251046168);
  }
  return v3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSString)detailedDesc
{
  return self->_detailedDesc;
}

- (void)setDetailedDesc:(id)a3
{
  objc_storeStrong((id *)&self->_detailedDesc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedDesc, 0);
}

@end
