@implementation ICASCellularRadioAccessTechnology

- (ICASCellularRadioAccessTechnology)initWithCellularRadioAccessTechnology:(int64_t)a3
{
  ICASCellularRadioAccessTechnology *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCellularRadioAccessTechnology;
  result = -[ICASCellularRadioAccessTechnology init](&v5, sel_init);
  if (result)
    result->_cellularRadioAccessTechnology = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCellularRadioAccessTechnology cellularRadioAccessTechnology](self, "cellularRadioAccessTechnology", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C738[v3 - 1];
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

@end
