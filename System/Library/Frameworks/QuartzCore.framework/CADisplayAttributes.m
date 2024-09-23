@implementation CADisplayAttributes

- (id)_initWithAttributes:(EDIDAttributes *)a3
{
  id result;
  BOOL v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CADisplayAttributes;
  result = -[CADisplayAttributes init](&v6, sel_init);
  if (result)
    v5 = (char *)result + 8 == (char *)a3;
  else
    v5 = 1;
  if (!v5)
  {
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&a3->dolbyVision;
    *((_DWORD *)result + 6) = a3->discreteMediaRefreshRate;
    *((_BYTE *)result + 28) = a3->legacyHDMI;
    *((_OWORD *)result + 2) = *(_OWORD *)&a3->product_id;
    *((_DWORD *)result + 12) = a3->serial_number;
  }
  return result;
}

- (int64_t)dolbyVision
{
  return self->_edid_attributes.dolbyVision;
}

- (int64_t)pqEOTF
{
  return self->_edid_attributes.pqEOTF;
}

- (int64_t)hdrStaticMetadataType1
{
  return self->_edid_attributes.hdrStaticMetadataType1;
}

- (int64_t)bt2020YCC
{
  return self->_edid_attributes.bt2020YCC;
}

- (BOOL)legacyHDMIEDID
{
  return self->_edid_attributes.legacyHDMI;
}

- (unsigned)manufacturerID
{
  return self->_edid_attributes.manufacturer_id;
}

- (unsigned)productID
{
  return self->_edid_attributes.product_id;
}

- (unsigned)weekOfManufacture
{
  return self->_edid_attributes.week_of_manufacture;
}

- (unsigned)yearOfManufacture
{
  return self->_edid_attributes.year_of_manufacture;
}

- (unsigned)serialNumber
{
  return self->_edid_attributes.serial_number;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *(_QWORD *)((char *)self + 21) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end
