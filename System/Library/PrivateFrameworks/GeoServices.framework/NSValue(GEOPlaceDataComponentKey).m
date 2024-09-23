@implementation NSValue(GEOPlaceDataComponentKey)

+ (id)_geo_valueWithGEOPlaceDataComponentKey:()GEOPlaceDataComponentKey
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v5, "(_GEOPlaceDataComponentKey={?=QSSI}{?=IIII})");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)_geo_GEOPlaceDataComponentKeyValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return v2[0];
}

@end
