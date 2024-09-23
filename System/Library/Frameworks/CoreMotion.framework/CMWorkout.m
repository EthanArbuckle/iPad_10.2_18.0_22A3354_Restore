@implementation CMWorkout

+ (int)CLMotionActivityTypeFromCMWorkoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x40)
    return 0;
  else
    return dword_18F5058C4[a3 - 1];
}

+ (int64_t)CMWorkoutTypeFromCLMotionActivityType:(int)a3
{
  int64_t result;
  int v4;
  uint64_t v5;
  int64_t v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  result = 0;
  if (a3 > 15149)
  {
    if (a3 <= 15669)
    {
      if (a3 > 15459)
      {
        v4 = 15609;
        v38 = 62;
        if (a3 != 15660)
          v38 = 0;
        if (a3 == 15652)
          v39 = 56;
        else
          v39 = v38;
        v40 = 59;
        if (a3 != 15620)
          v40 = 0;
        if (a3 == 15610)
          v41 = 39;
        else
          v41 = v40;
        if (a3 <= 15651)
          v6 = v41;
        else
          v6 = v39;
        v7 = 15460;
        v8 = 45;
        v23 = 15560;
        v24 = 44;
        v25 = a3 == 15592;
        v26 = 46;
      }
      else
      {
        v4 = 15254;
        v19 = 48;
        if (a3 != 15360)
          v19 = 0;
        if (a3 == 15350)
          v20 = 49;
        else
          v20 = v19;
        v21 = 57;
        if (a3 != 15330)
          v21 = 0;
        if (a3 == 15255)
          v22 = 27;
        else
          v22 = v21;
        if (a3 <= 15349)
          v6 = v22;
        else
          v6 = v20;
        v7 = 15150;
        v8 = 61;
        v23 = 15230;
        v24 = 42;
        v25 = a3 == 15250;
        v26 = 43;
      }
    }
    else
    {
      if (a3 > 18239)
      {
        if (a3 > 90602)
        {
          v4 = 515651;
          v45 = 37;
          if (a3 != 519150)
            v45 = 0;
          if (a3 == 515652)
            v6 = 53;
          else
            v6 = v45;
          v7 = 90603;
          v8 = 21;
          v9 = a3 == 515621;
          v10 = 60;
        }
        else
        {
          v4 = 19089;
          v5 = 23;
          if (a3 != 19150)
            v5 = 0;
          if (a3 == 19090)
            v6 = 36;
          else
            v6 = v5;
          v7 = 18240;
          v8 = 19;
          v9 = a3 == 19030;
          v10 = 47;
        }
        if (!v9)
          v10 = 0;
LABEL_126:
        if (a3 == v7)
          v35 = v8;
        else
          v35 = v10;
        goto LABEL_129;
      }
      v4 = 15732;
      v27 = 38;
      if (a3 != 18100)
        v27 = 0;
      if (a3 == 18050)
        v28 = 35;
      else
        v28 = v27;
      v29 = 16;
      if (a3 != 17150)
        v29 = 0;
      if (a3 == 15733)
        v30 = 58;
      else
        v30 = v29;
      if (a3 <= 18049)
        v6 = v30;
      else
        v6 = v28;
      v7 = 15670;
      v8 = 31;
      v23 = 15675;
      v24 = 51;
      v25 = a3 == 15711;
      v26 = 55;
    }
    if (!v25)
      v26 = 0;
    if (a3 == v23)
      v10 = v24;
    else
      v10 = v26;
    goto LABEL_126;
  }
  if (a3 > 2060)
  {
    if (a3 <= 3014)
    {
      v11 = 32;
      v12 = 6;
      if (a3 != 2150)
        v12 = 0;
      if (a3 != 2105)
        v11 = v12;
      v13 = 12;
      v14 = 29;
      if (a3 != 2101)
        v14 = 0;
      if (a3 != 2071)
        v13 = v14;
      if (a3 <= 2104)
        v11 = v13;
      v15 = 8;
      v16 = 11;
      v17 = 63;
      if (a3 != 2068)
        v17 = 0;
      if (a3 != 2065)
        v16 = v17;
      if (a3 != 2061)
        v15 = v16;
      v18 = a3 <= 2070;
      goto LABEL_113;
    }
    v4 = 15029;
    v31 = 34;
    if (a3 != 15110)
      v31 = 0;
    if (a3 == 15100)
      v32 = 64;
    else
      v32 = v31;
    v33 = 50;
    if (a3 != 15055)
      v33 = 0;
    if (a3 == 15030)
      v34 = 52;
    else
      v34 = v33;
    if (a3 <= 15099)
      v6 = v34;
    else
      v6 = v32;
    v35 = 7;
    v36 = 65;
    v37 = 18;
    if (a3 != 12150)
      v37 = 0;
    if (a3 != 3016)
      v36 = v37;
    if (a3 != 3015)
      v35 = v36;
LABEL_129:
    if (a3 <= v4)
      return v35;
    else
      return v6;
  }
  if (a3 > 2009)
  {
    v11 = 28;
    v42 = 30;
    v43 = 9;
    if (a3 != 2048)
      v43 = 0;
    if (a3 != 2024)
      v42 = v43;
    if (a3 != 2022)
      v11 = v42;
    v15 = 5;
    v44 = 22;
    if (a3 != 2020)
      v44 = 0;
    if (a3 != 2010)
      v15 = v44;
    v18 = a3 <= 2021;
LABEL_113:
    if (v18)
      return v15;
    else
      return v11;
  }
  switch(a3)
  {
    case '>':
LABEL_117:
      result = 14;
      break;
    case '?':
      result = 33;
      break;
    case '@':
      result = 40;
      break;
    case 'A':
      result = 41;
      break;
    case 'B':
      result = 54;
      break;
    default:
      switch(a3)
      {
        case 4:
          goto LABEL_133;
        case 5:
          return result;
        case 6:
          return 4;
        case 7:
          goto LABEL_117;
        case 8:
          return 17;
        default:
          if (a3 == 41)
LABEL_133:
            result = 15;
          break;
      }
      break;
  }
  return result;
}

+ (int64_t)CMWorkoutLocationTypeFromCMSwimWorkoutLocation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v9;
  const char *v10;

  if ((unint64_t)a3 >= 2)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMWorkout.mm"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cmSwimWorkoutLocation == kCMSwimWorkoutLocationPool || cmSwimWorkoutLocation == kCMSwimWorkoutLocationOpenWater"));
  }
  if (a3)
    return 2;
  else
    return 1;
}

+ (int64_t)CMSwimWorkoutLocationFromCMWorkoutLocationType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v9;
  const char *v10;

  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMWorkout.mm"), 430, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cmWorkoutLocationType == kCMWorkoutLocationTypeIndoor || cmWorkoutLocationType == kCMWorkoutLocationTypeOutdoor"));
  }
  return a3 != 1;
}

+ (BOOL)workoutIsTypePedestrian:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL result;

  if ((objc_msgSend_workoutIsTypeWalking_(a1, a2, a3, v3, v4) & 1) != 0)
    return 1;
  result = objc_msgSend_workoutIsTypeRunning_(a1, v7, a3, v8, v9);
  if (a3 == 24)
    return 1;
  return result;
}

+ (BOOL)workoutIsSupportedForLowPower:(int64_t)a3
{
  return ((unint64_t)a3 < 0x19) & (0x1028006u >> a3);
}

+ (BOOL)workoutIsTypeWalking:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x18002u >> a3);
}

+ (BOOL)workoutIsTypeRunning:(int64_t)a3
{
  return a3 == 17 || (a3 & 0xFFFFFFFFFFFFFFEFLL) == 2;
}

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  sub_18F1F77DC();
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4
{
  uint64_t v4;
  CMWorkout *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  objc_super v19;

  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionId"));
  }
  if (a4 >= 66)
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type < kCMWorkoutTypeMax"));
  }
  v19.receiver = self;
  v19.super_class = (Class)CMWorkout;
  v9 = -[CMWorkout init](&v19, sel_init);
  if (v9)
  {
    v9->fSessionId = (NSUUID *)a3;
    v9->fType = a4;
    v13 = objc_msgSend_workoutLocationTypeFromCMWorkoutType_(CMWorkout, v10, a4, v11, v12);
    v9->fIsUserInitiated = 1;
    v9->fStartDate = 0;
    v9->fEndDate = 0;
    v9->fLocationType = v13;
    v9->fMode = 0;
    v9->fAppId = 0;
  }
  return v9;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5
{
  CMWorkout *result;
  void *v11;
  const char *v12;

  if (a5 >= 4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 489, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationType < kCMWorkoutLocationTypeMax"));
  }
  result = (CMWorkout *)objc_msgSend_initWithSessionId_type_(self, a2, (uint64_t)a3, a4, a5);
  if (result)
    result->fLocationType = a5;
  return result;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6
{
  CMWorkout *result;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;

  if (a6 == 1 && (objc_msgSend_workoutIsSupportedForLowPower_(CMWorkout, a2, a4, a4, a5) & 1) == 0)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mode != CMWorkoutModeExtended || [CMWorkout workoutIsSupportedForLowPower:type]"));
  }
  if (a5 >= 4)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationType < kCMWorkoutLocationTypeMax"));
  }
  result = (CMWorkout *)objc_msgSend_initWithSessionId_type_locationType_(self, a2, (uint64_t)a3, a4, a5);
  if (result)
    result->fMode = a6;
  return result;
}

- (id)_initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  uint64_t v10;

  v10 = objc_msgSend_initWithSessionId_type_locationType_mode_(self, a2, (uint64_t)a3, a4, a5, a6);
  if (v10)
  {
    *(_QWORD *)(v10 + 32) = a7;
    *(_QWORD *)(v10 + 40) = a8;
    *(_BYTE *)(v10 + 48) = 0;
  }
  return (id)v10;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;

  if (!a7)
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));
    if (a8)
      return (CMWorkout *)objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
LABEL_5:
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));
    return (CMWorkout *)objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  }
  if (!a8)
    goto LABEL_5;
  return (CMWorkout *)objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
}

- (void)setLocationType:(int64_t)a3
{
  self->fLocationType = a3;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->fIsUserInitiated = a3;
}

- (void)setWorkoutType:(int64_t)a3
{
  self->fType = a3;
}

- (void)setWorkoutMode:(unint64_t)a3
{
  self->fMode = a3;
}

- (BOOL)isSameWorkout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int isEqual;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  const char *v28;

  if (!a3)
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkout.mm"), 560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workout"));
  }
  v7 = (void *)objc_msgSend_sessionId(self, a2, (uint64_t)a3, v3, v4);
  v12 = objc_msgSend_sessionId(a3, v8, v9, v10, v11);
  isEqual = objc_msgSend_isEqual_(v7, v13, v12, v14, v15);
  if (isEqual)
  {
    v21 = objc_msgSend_type(self, v17, v18, v19, v20);
    LOBYTE(isEqual) = v21 == objc_msgSend_type(a3, v22, v23, v24, v25);
  }
  return isEqual;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWorkout;
  -[CMWorkout dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkout)initWithCoder:(id)a3
{
  CMWorkout *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSDate *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  NSDate *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  NSString *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CMWorkout;
  v4 = -[CMWorkout init](&v41, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMWorkoutDataCodingKeySessionId"), v7);
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyType"), v9, v10);
    if (objc_msgSend_containsValueForKey_(a3, v11, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyLocationType"), v12, v13))v17 = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyLocationType"), v15, v16);
    else
      v17 = 0;
    v4->fLocationType = v17;
    if (objc_msgSend_containsValueForKey_(a3, v14, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyMode"), v15, v16))v21 = objc_msgSend_decodeIntegerForKey_(a3, v18, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyMode"), v19, v20);
    else
      v21 = 0;
    v4->fMode = v21;
    if (objc_msgSend_containsValueForKey_(a3, v18, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyStartDate"), v19, v20))
    {
      v25 = objc_opt_class();
      v28 = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyStartDate"), v27);
    }
    else
    {
      v28 = 0;
    }
    v4->fStartDate = v28;
    if (objc_msgSend_containsValueForKey_(a3, v22, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyEndDate"), v23, v24))
    {
      v32 = objc_opt_class();
      v35 = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyEndDate"), v34);
    }
    else
    {
      v35 = 0;
    }
    v4->fEndDate = v35;
    if (objc_msgSend_containsValueForKey_(a3, v29, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyAppId"), v30, v31))
    {
      v36 = objc_opt_class();
      v39 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyAppId"), v38);
    }
    else
    {
      v39 = 0;
    }
    v4->fAppId = v39;
  }
  return v4;
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t started;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_sessionId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_type(self, v15, v16, v17, v18);
  v24 = objc_msgSend_locationType(self, v20, v21, v22, v23);
  v29 = objc_msgSend_mode(self, v25, v26, v27, v28);
  started = objc_msgSend_startDate(self, v30, v31, v32, v33);
  v39 = objc_msgSend_endDate(self, v35, v36, v37, v38);
  v41 = (void *)objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(v9, v40, v14, v19, v24, v29, started, v39);
  v46 = objc_msgSend_appId(self, v42, v43, v44, v45);
  objc_msgSend_setAppId_(v41, v47, v46, v48, v49);
  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMWorkoutDataCodingKeySessionId"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fType, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyType"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fLocationType, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyLocationType"), v9);
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->fMode, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyMode"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyStartDate"), v13);
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyEndDate"), v15);
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->fAppId, (uint64_t)CFSTR("kCMWorkoutDataCodingKeyAppId"), v17);
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (int64_t)type
{
  return self->fType;
}

- (int64_t)locationType
{
  return self->fLocationType;
}

- (unint64_t)mode
{
  return self->fMode;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)workoutName:(int64_t)a3
{
  if ((unint64_t)a3 > 0x42)
    return 0;
  else
    return off_1E2956100[a3];
}

+ (id)workoutLocationName:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unhandled workout location type");
  else
    return off_1E2956318[a3];
}

+ (id)workoutModeName:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unhandled workout mode");
  if (a3 == 1)
    v3 = CFSTR("Extended");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Normal");
}

+ (int64_t)workoutLocationTypeFromCMWorkoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 0x2D)
    return 0;
  else
    return qword_18F5059C8[a3 - 4];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t started;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_sessionId(self, v6, v7, v8, v9);
  v15 = objc_msgSend_type(self, v11, v12, v13, v14);
  v19 = objc_msgSend_workoutName_(CMWorkout, v16, v15, v17, v18);
  v24 = objc_msgSend_locationType(self, v20, v21, v22, v23);
  v28 = objc_msgSend_workoutLocationName_(CMWorkout, v25, v24, v26, v27);
  v33 = objc_msgSend_mode(self, v29, v30, v31, v32);
  v37 = objc_msgSend_workoutModeName_(CMWorkout, v34, v33, v35, v36);
  started = objc_msgSend_startDate(self, v38, v39, v40, v41);
  v47 = objc_msgSend_endDate(self, v43, v44, v45, v46);
  v52 = objc_msgSend_appId(self, v48, v49, v50, v51);
  return (id)objc_msgSend_stringWithFormat_(v3, v53, (uint64_t)CFSTR("%@, <sessionId %@, type, %@, locationType, %@, mode, %@, startDate, %@, endDate, %@, id, %@>"), v54, v55, v5, v10, v19, v28, v37, started, v47, v52);
}

- (NSString)appId
{
  return self->fAppId;
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

@end
