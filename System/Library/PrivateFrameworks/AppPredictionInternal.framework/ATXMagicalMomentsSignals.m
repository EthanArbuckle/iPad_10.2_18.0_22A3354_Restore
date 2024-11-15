@implementation ATXMagicalMomentsSignals

- (ATXMagicalMomentsSignals)initWithPredictionSource:(unint64_t)a3 pmmReason:(int64_t)a4 reasonMetadata:(id)a5 confidence:(double)a6 anchorType:(int64_t)a7 index:(unint64_t)a8
{
  id v15;
  ATXMagicalMomentsSignals *v16;
  ATXMagicalMomentsSignals *v17;
  objc_super v19;

  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXMagicalMomentsSignals;
  v16 = -[ATXMagicalMomentsSignals init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_predictionSource = a3;
    v16->_pmmReason = a4;
    objc_storeStrong((id *)&v16->_reasonMetadata, a5);
    v17->_confidence = a6;
    v17->_anchorType = a7;
    v17->_predictionIndex = a8;
  }

  return v17;
}

- (unint64_t)atxReason
{
  return objc_msgSend((id)objc_opt_class(), "pmmReasonToATXSuggestionReason:", self->_pmmReason);
}

+ (unint64_t)pmmReasonToATXSuggestionReason:(int64_t)a3
{
  uint64x2_t v3;
  int8x16_t v4;
  int8x16_t v5;
  uint64_t v6;
  int8x16_t v7;

  v3 = (uint64x2_t)vdupq_n_s64(a3);
  v4 = (int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C9E80790);
  v5 = (int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_1C9E807A0);
  v6 = v5.i16[0] & 0x1000;
  v7 = vorrq_s8(vandq_s8(v4, (int8x16_t)xmmword_1C9E807C0), vandq_s8(v5, (int8x16_t)xmmword_1C9E807B0));
  return *(_QWORD *)&vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) | ((unint64_t)a3 >> 1) & 0x40 | v6 & 0xFFFFFFFFFFFCFFFFLL | ((((unint64_t)a3 >> 8) & 3) << 16);
}

- (unint64_t)predictionSource
{
  return self->_predictionSource;
}

- (int64_t)pmmReason
{
  return self->_pmmReason;
}

- (NSDictionary)reasonMetadata
{
  return self->_reasonMetadata;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)anchorType
{
  return self->_anchorType;
}

- (unint64_t)predictionIndex
{
  return self->_predictionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonMetadata, 0);
}

@end
