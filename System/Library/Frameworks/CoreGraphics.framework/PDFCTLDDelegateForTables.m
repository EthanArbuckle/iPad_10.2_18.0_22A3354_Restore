@implementation PDFCTLDDelegateForTables

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") == 6)
    v7 = objc_msgSend(v5, "groupID");
  else
    v7 = -1;
  if (objc_msgSend(v6, "type") == 6)
    v8 = objc_msgSend(v6, "groupID");
  else
    v8 = -1;
  v9 = 1;
  if (v7 == v8)
    v9 = 2;
  if ((v7 & v8) == 0xFFFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

@end
