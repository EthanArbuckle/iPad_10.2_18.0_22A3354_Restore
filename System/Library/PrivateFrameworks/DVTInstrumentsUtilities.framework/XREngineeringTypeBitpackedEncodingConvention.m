@implementation XREngineeringTypeBitpackedEncodingConvention

- (XREngineeringTypeBitpackedEncodingConvention)init
{
  XREngineeringTypeBitpackedEncodingConvention *v2;
  uint64_t v3;
  NSMutableArray *entries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XREngineeringTypeBitpackedEncodingConvention;
  v2 = -[XREngineeringTypeEncodingConvention init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSArray)entries
{
  return (NSArray *)self->_entries;
}

- (void)addEntry:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_addObject_(self->_entries, a2, (uint64_t)a3, v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
