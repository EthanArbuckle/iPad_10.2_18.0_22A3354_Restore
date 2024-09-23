@implementation EDAMTimeZone

+ (id)structName
{
  return CFSTR("TimeZone");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1103;
  if (!structFields_structFields_1103)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("displayName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("rawUTCOffsetMillis"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("dstSavingsAdjustmentMillis"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("nextEnterDaylightSavings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("nextLeaveDaylightSavings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_1103;
    structFields_structFields_1103 = v9;

    v2 = (void *)structFields_structFields_1103;
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

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
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
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
