@implementation CMStrideCalibrationHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalibrationHistory)initWithCoder:(id)a3
{
  CMStrideCalibrationHistory *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMStrideCalibrationHistory;
  v4 = -[CMStrideCalibrationHistory init](&v33, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v10, v7, 0);
    v4->_calibrationTracks = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyCalibrationTracks"), v13);
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
    v4->_rawSpeedToKValueBins = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyRawSpeedToKValueBins"), v22);
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v29 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v25, 0);
    v4->_stepCadenceToStrideLengthBins = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v30, v29, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyStepCadenceToStrideLengthBins"), v31);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_calibrationTracks, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyCalibrationTracks"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_rawSpeedToKValueBins, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyRawSpeedToKValueBins"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_stepCadenceToStrideLengthBins, (uint64_t)CFSTR("kCMStrideCalibrationHistoryCodingKeyStepCadenceToStrideLengthBins"), v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = (id *)objc_msgSend_init(v9, v10, v11, v12, v13);

  v14[1] = (id)objc_msgSend_copyWithZone_(self->_calibrationTracks, v15, (uint64_t)a3, v16, v17);
  v14[2] = (id)objc_msgSend_copyWithZone_(self->_rawSpeedToKValueBins, v18, (uint64_t)a3, v19, v20);

  v14[3] = (id)objc_msgSend_copyWithZone_(self->_stepCadenceToStrideLengthBins, v21, (uint64_t)a3, v22, v23);
  return v14;
}

- (CMStrideCalibrationHistory)initWithCalibrationTracks:(id)a3 rawSpeedToKValueBins:(id)a4 stepCadenceToStrideLengthBins:(id)a5
{
  CMStrideCalibrationHistory *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMStrideCalibrationHistory;
  v8 = -[CMStrideCalibrationHistory init](&v10, sel_init);
  if (v8)
  {
    v8->_calibrationTracks = (NSArray *)a3;
    v8->_rawSpeedToKValueBins = (NSArray *)a4;
    v8->_stepCadenceToStrideLengthBins = (NSArray *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_calibrationTracks = 0;
  self->_rawSpeedToKValueBins = 0;

  self->_stepCadenceToStrideLengthBins = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalibrationHistory;
  -[CMStrideCalibrationHistory dealloc](&v3, sel_dealloc);
}

- (NSArray)calibrationTracks
{
  return self->_calibrationTracks;
}

- (void)setCalibrationTracks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)rawSpeedToKValueBins
{
  return self->_rawSpeedToKValueBins;
}

- (void)setRawSpeedToKValueBins:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)stepCadenceToStrideLengthBins
{
  return self->_stepCadenceToStrideLengthBins;
}

- (void)setStepCadenceToStrideLengthBins:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMStrideCalibrationHistory)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMStrideCalibrationHistory *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v22.receiver = self;
    v22.super_class = (Class)CMStrideCalibrationHistory;
    v8 = -[CMStrideCalibrationHistory init](&v22, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v17 = objc_msgSend_setWithObjects_(v10, v14, v11, v15, v16, v12, v13, 0);
      v19 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v9, v18, v17, (uint64_t)a3, 0);
      if (v19)
      {
        v20 = (void *)v19;

        return (CMStrideCalibrationHistory *)v20;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

@end
