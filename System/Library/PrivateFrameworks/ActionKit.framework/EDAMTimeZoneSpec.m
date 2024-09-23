@implementation EDAMTimeZoneSpec

+ (id)structName
{
  return CFSTR("TimeZoneSpec");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1150;
  if (!structFields_structFields_1150)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("rawUTCOffsetMillis"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("dstSavingsAdjustmentMillis"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("nextEnterDaylightSavings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("nextLeaveDaylightSavings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1150;
    structFields_structFields_1150 = v8;

    v2 = (void *)structFields_structFields_1150;
  }
  return v2;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSNumber)rawUTCOffsetMillis
{
  return self->_rawUTCOffsetMillis;
}

- (void)setRawUTCOffsetMillis:(id)a3
{
  objc_storeStrong((id *)&self->_rawUTCOffsetMillis, a3);
}

- (NSNumber)dstSavingsAdjustmentMillis
{
  return self->_dstSavingsAdjustmentMillis;
}

- (void)setDstSavingsAdjustmentMillis:(id)a3
{
  objc_storeStrong((id *)&self->_dstSavingsAdjustmentMillis, a3);
}

- (NSNumber)nextEnterDaylightSavings
{
  return self->_nextEnterDaylightSavings;
}

- (void)setNextEnterDaylightSavings:(id)a3
{
  objc_storeStrong((id *)&self->_nextEnterDaylightSavings, a3);
}

- (NSNumber)nextLeaveDaylightSavings
{
  return self->_nextLeaveDaylightSavings;
}

- (void)setNextLeaveDaylightSavings:(id)a3
{
  objc_storeStrong((id *)&self->_nextLeaveDaylightSavings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLeaveDaylightSavings, 0);
  objc_storeStrong((id *)&self->_nextEnterDaylightSavings, 0);
  objc_storeStrong((id *)&self->_dstSavingsAdjustmentMillis, 0);
  objc_storeStrong((id *)&self->_rawUTCOffsetMillis, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
