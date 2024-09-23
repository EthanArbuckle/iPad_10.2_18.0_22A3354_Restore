@implementation CMStrideCalibrationEntryArray

- (CMStrideCalibrationEntryArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v18;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v15 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v14, v11, 0);
    v18 = (id)objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v8, v16, v15, (uint64_t)a3, 0);

    return (CMStrideCalibrationEntryArray *)v18;
  }
  else
  {

    return 0;
  }
}

@end
