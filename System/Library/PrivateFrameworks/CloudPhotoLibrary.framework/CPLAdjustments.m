@implementation CPLAdjustments

- (id)adjustmentSimpleDescription
{
  unint64_t adjustmentSourceType;
  const __CFString *v3;
  const __CFString *v4;
  unint64_t adjustmentRenderTypes;
  const __CFString *v6;
  const __CFString *v7;

  adjustmentSourceType = self->_adjustmentSourceType;
  v3 = CFSTR("autoloop");
  v4 = CFSTR("cinematic");
  adjustmentRenderTypes = self->_adjustmentRenderTypes;
  v6 = CFSTR("undef");
  if (adjustmentRenderTypes == 2)
    v6 = CFSTR("portait");
  if (adjustmentRenderTypes != 128)
    v4 = v6;
  if (adjustmentRenderTypes != 1)
    v3 = v4;
  v7 = CFSTR("orig.");
  if (adjustmentSourceType)
    v7 = CFSTR("unkn.");
  if (adjustmentSourceType == 1)
    v7 = CFSTR("base");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ on %@ (%@)"), self->_adjustmentType, v7, v3);
}

- (NSString)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAdjustmentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)adjustmentCompoundVersion
{
  return self->_adjustmentCompoundVersion;
}

- (void)setAdjustmentCompoundVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)adjustmentCreatorCode
{
  return self->_adjustmentCreatorCode;
}

- (void)setAdjustmentCreatorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (void)setAdjustmentTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)adjustmentSourceType
{
  return self->_adjustmentSourceType;
}

- (void)setAdjustmentSourceType:(unint64_t)a3
{
  self->_adjustmentSourceType = a3;
}

- (NSData)simpleAdjustmentData
{
  return self->_simpleAdjustmentData;
}

- (void)setSimpleAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_simpleAdjustmentData, a3);
}

- (NSString)similarToOriginalAdjustmentsFingerprint
{
  return self->_similarToOriginalAdjustmentsFingerprint;
}

- (void)setSimilarToOriginalAdjustmentsFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)otherAdjustmentsFingerprint
{
  return self->_otherAdjustmentsFingerprint;
}

- (void)setOtherAdjustmentsFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)adjustmentRenderTypes
{
  return self->_adjustmentRenderTypes;
}

- (void)setAdjustmentRenderTypes:(unint64_t)a3
{
  self->_adjustmentRenderTypes = a3;
}

- (CPLResource)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentData, a3);
}

- (NSString)creatorCode
{
  return self->_creatorCode;
}

- (void)setCreatorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_otherAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_similarToOriginalAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_simpleAdjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_adjustmentCreatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentCompoundVersion, 0);
  objc_storeStrong((id *)&self->_adjustmentType, 0);
}

- (CPLAdjustments)initWithCoder:(id)a3
{
  id v4;
  CPLAdjustments *v5;
  CPLAdjustments *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLAdjustments;
  v5 = -[CPLAdjustments init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
