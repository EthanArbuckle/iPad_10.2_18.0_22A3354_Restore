@implementation HKObjectType

- (HKObjectType)initWithCoder:(id)a3
{
  unint64_t v4;
  HKObjectType *v5;

  v4 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("Code"));
  if (v4 >= 0x13D)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid data type code (%ld)"), v4);
  +[HKObjectType dataTypeWithCode:](HKObjectType, "dataTypeWithCode:", v4);
  v5 = (HKObjectType *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dataTypeWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_dataTypeWithCode:expectedClass:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentType, 0);
}

+ (id)activityCacheType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 76);
}

+ (HKWorkoutType)workoutType
{
  return (HKWorkoutType *)+[HKObjectType dataTypeWithCode:](HKWorkoutType, "dataTypeWithCode:", 79);
}

+ (id)calorieGoal
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 67);
}

+ (HKSeriesType)seriesTypeForIdentifier:(NSString *)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSeriesType *)v5;
}

- (void)setParentType:(id)a3
{
  objc_storeStrong((id *)&self->_parentType, a3);
}

- (int64_t)code
{
  return self->_code;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKObjectType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return (NSString *)*(id *)-[HKObjectType _definition](self, "_definition");
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  BOOL v5;

  v4 = (unsigned __int16 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && (unsigned __int16)self->_code == v4[4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKObjectType code](self, "code"), CFSTR("Code"));

}

+ (HKQuantityType)quantityTypeForIdentifier:(HKQuantityTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantityType *)v5;
}

+ (id)briskMinuteDataType
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 75);
}

+ (HKCategoryType)categoryTypeForIdentifier:(HKCategoryTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKCategoryType *)v5;
}

- (Class)dataObjectClass
{
  return NSClassFromString((NSString *)-[HKObjectType _definition](self, "_definition")[16]);
}

+ (id)fitnessFriendActivitySnapshotType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 77);
}

+ (id)fitnessFriendAchievementType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 108);
}

+ (HKCharacteristicType)characteristicTypeForIdentifier:(HKCharacteristicTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKCharacteristicType *)v5;
}

+ (id)fitnessFriendWorkoutType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 109);
}

+ (id)deepBreathingSessionType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 99);
}

+ (id)watchActivationType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 68);
}

+ (id)medicationDoseEventTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unknownRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)medicationOrderTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allergyRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)accountOwnerTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_localizedName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v2 = 0;
  switch(-[HKObjectType code](self, "code"))
  {
    case 0:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BODY_MASS_INDEX");
      goto LABEL_219;
    case 1:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BODY_FAT_PERCENTAGE");
      goto LABEL_219;
    case 2:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HEIGHT");
      goto LABEL_219;
    case 3:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BODY_MASS");
      goto LABEL_219;
    case 4:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("LEAN_BODY_MASS");
      goto LABEL_219;
    case 5:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HEART_RATE");
      goto LABEL_219;
    case 7:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("STEPS");
      goto LABEL_219;
    case 8:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("DISTANCE");
      goto LABEL_219;
    case 9:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BASAL_ENERGY");
      goto LABEL_219;
    case 10:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ACTIVE_ENERGY");
      goto LABEL_219;
    case 12:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("FLIGHTS_CLIMBED");
      goto LABEL_219;
    case 13:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("NIKE_FUEL");
      goto LABEL_219;
    case 14:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("OXYGEN_SATURATION");
      goto LABEL_219;
    case 15:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_GLUCOSE");
      goto LABEL_219;
    case 16:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_PRESSURE_SYSTOLIC");
      goto LABEL_219;
    case 17:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_PRESSURE_DIASTOLIC");
      goto LABEL_219;
    case 18:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_ALCOHOL_CONTENT");
      goto LABEL_219;
    case 19:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PERFUSION_INDEX");
      goto LABEL_219;
    case 20:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("TOTAL_FAT");
      goto LABEL_219;
    case 21:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("POLYUNSATURATED_FAT");
      goto LABEL_219;
    case 22:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MONOUNSATURATED_FAT");
      goto LABEL_219;
    case 23:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SATURATED_FAT");
      goto LABEL_219;
    case 24:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CHOLESTEROL");
      goto LABEL_219;
    case 25:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SODIUM");
      goto LABEL_219;
    case 26:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CARBOHYDRATES");
      goto LABEL_219;
    case 27:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("FIBER");
      goto LABEL_219;
    case 28:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SUGAR");
      goto LABEL_219;
    case 29:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("DIETARY_ENERGY");
      goto LABEL_219;
    case 30:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PROTEIN");
      goto LABEL_219;
    case 31:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_A");
      goto LABEL_219;
    case 32:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_B6");
      goto LABEL_219;
    case 33:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_B12");
      goto LABEL_219;
    case 34:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_C");
      goto LABEL_219;
    case 35:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_D");
      goto LABEL_219;
    case 36:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_E");
      goto LABEL_219;
    case 37:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("VITAMIN_K");
      goto LABEL_219;
    case 38:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CALCIUM");
      goto LABEL_219;
    case 39:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("IRON");
      goto LABEL_219;
    case 40:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("THIAMIN");
      goto LABEL_219;
    case 41:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RIBOFLAVIN");
      goto LABEL_219;
    case 42:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("NIACIN");
      goto LABEL_219;
    case 43:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("FOLATE");
      goto LABEL_219;
    case 44:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BIOTIN");
      goto LABEL_219;
    case 45:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PANTOTHENIC_ACID");
      goto LABEL_219;
    case 46:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PHOSPHORUS");
      goto LABEL_219;
    case 47:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("IODINE");
      goto LABEL_219;
    case 48:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MAGNESIUM");
      goto LABEL_219;
    case 49:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ZINC");
      goto LABEL_219;
    case 50:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SELENIUM");
      goto LABEL_219;
    case 51:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("COPPER");
      goto LABEL_219;
    case 52:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MANGANESE");
      goto LABEL_219;
    case 53:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CHROMIUM");
      goto LABEL_219;
    case 54:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MOLYBDENUM");
      goto LABEL_219;
    case 55:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CHLORIDE");
      goto LABEL_219;
    case 56:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("POTASSIUM");
      goto LABEL_219;
    case 57:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("NUMBER_OF_TIMES_FALLEN");
      goto LABEL_219;
    case 58:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ELECTRODERMAL_ACTIVITY");
      goto LABEL_219;
    case 60:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("INHALER_USAGE");
      goto LABEL_219;
    case 61:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RESPIRATORY_RATE");
      goto LABEL_219;
    case 62:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BODY_TEMPERATURE");
      goto LABEL_219;
    case 63:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SLEEP_ANALYSIS");
      goto LABEL_219;
    case 64:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BIOLOGICAL_SEX");
      goto LABEL_219;
    case 65:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("DATE_OF_BIRTH");
      goto LABEL_219;
    case 66:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_TYPE");
      goto LABEL_219;
    case 70:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("STAND_HOUR");
      goto LABEL_219;
    case 71:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SPIROMETRY_FVC");
      goto LABEL_219;
    case 72:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SPIROMETRY_FEV1");
      goto LABEL_219;
    case 73:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SPIROMETRY_PEFR");
      goto LABEL_219;
    case 75:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("EXERCISE_MINUTE");
      goto LABEL_219;
    case 78:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CAFFEINE");
      goto LABEL_219;
    case 79:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WORKOUT");
      goto LABEL_219;
    case 80:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLOOD_PRESSURE");
      goto LABEL_219;
    case 83:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CYCLING_DISTANCE");
      goto LABEL_219;
    case 87:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WATER");
      goto LABEL_219;
    case 88:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("FITZPATRICK_SKIN_TYPE");
      goto LABEL_219;
    case 89:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("UV_EXPOSURE");
      goto LABEL_219;
    case 90:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BASAL_BODY_TEMPERATURE");
      goto LABEL_219;
    case 91:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CERVICAL_MUCUS_QUALITY");
      goto LABEL_219;
    case 92:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("OVULATION_TEST_RESULT");
      goto LABEL_219;
    case 95:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MENSTRUATION");
      goto LABEL_219;
    case 96:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("INTERMENSTRUAL_BLEEDING");
      goto LABEL_219;
    case 97:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SEXUAL_ACTIVITY");
      goto LABEL_219;
    case 99:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("MINDFUL_MINUTES");
      goto LABEL_219;
    case 100:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ACTIVITY_SUMMARY");
      goto LABEL_219;
    case 101:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PUSH_COUNT");
      goto LABEL_219;
    case 102:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WORKOUT_ROUTE");
      goto LABEL_219;
    case 103:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WHEELCHAIR_USE");
      goto LABEL_219;
    case 107:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CLINICAL_DOCUMENTS");
      goto LABEL_219;
    case 110:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SWIMMING_DISTANCE");
      goto LABEL_219;
    case 111:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SWIMMING_STROKES");
      goto LABEL_219;
    case 113:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WHEELCHAIR_DISTANCE");
      goto LABEL_219;
    case 114:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WAIST_CIRCUMFERENCE");
      goto LABEL_219;
    case 118:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RESTING_HEART_RATE");
      goto LABEL_219;
    case 119:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("TACHOGRAM");
      goto LABEL_219;
    case 124:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("CARDIO_FITNESS");
      goto LABEL_164;
    case 125:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("INSULIN_DELIVERY");
      goto LABEL_219;
    case 137:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WALKING_HEART_RATE_AVERAGE");
      goto LABEL_219;
    case 138:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("DOWNHILL_SNOW_SPORTS_DISTANCE");
      goto LABEL_219;
    case 139:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HEART_RATE_VARIABILITY");
      goto LABEL_219;
    case 140:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("TACHYCARDIA");
      goto LABEL_219;
    case 144:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELECTROCARDIOGRAM"), &stru_1E37FD4C0, CFSTR("Localizable-Cinnamon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString(v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_220;
    case 145:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("AUDIOGRAM");
      goto LABEL_219;
    case 147:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("BRADYCARDIA");
      v5 = CFSTR("Localizable-Tortuga");
      goto LABEL_219;
    case 156:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("ATRIAL_FIBRILLATION_EVENT");
      v5 = CFSTR("Localizable-Antimony");
      goto LABEL_219;
    case 157:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_ABDOMINAL_CRAMPS");
      goto LABEL_219;
    case 158:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_BREAST_PAIN");
      goto LABEL_219;
    case 159:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_BLOATING");
      goto LABEL_219;
    case 160:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_HEADACHE");
      goto LABEL_219;
    case 161:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_ACNE");
      goto LABEL_219;
    case 162:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_LOWER_BACK_PAIN");
      goto LABEL_219;
    case 163:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_PELVIC_PAIN");
      goto LABEL_219;
    case 164:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_MOOD_CHANGES");
      goto LABEL_219;
    case 165:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_CONSTIPATION");
      goto LABEL_219;
    case 166:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_DIARRHEA");
      goto LABEL_219;
    case 167:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_FATIGUE");
      goto LABEL_219;
    case 168:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_NAUSEA");
      goto LABEL_219;
    case 169:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_SLEEP_CHANGES");
      goto LABEL_219;
    case 170:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_APPETITE_CHANGES");
      goto LABEL_219;
    case 171:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_HOT_FLASHES");
      goto LABEL_219;
    case 172:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ENVIRONMENTAL_AUDIO_EXPOSURE");
      goto LABEL_219;
    case 173:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HEADPHONE_AUDIO_EXPOSURE");
      goto LABEL_219;
    case 177:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ACTIVITY_MOVE_MODE");
      goto LABEL_219;
    case 178:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("AUDIO_EXPOSURE_EVENT");
      goto LABEL_219;
    case 179:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("MOVE_MINUTE");
      v5 = CFSTR("Localizable-tinker");
      goto LABEL_219;
    case 182:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WALKING_DOUBLE_SUPPORT_PERCENTAGE");
      goto LABEL_219;
    case 183:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SIX_MINUTE_WALK_TEST_DISTANCE");
      goto LABEL_219;
    case 186:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("STAND_MINUTE");
      goto LABEL_219;
    case 187:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WALKING_SPEED");
      goto LABEL_219;
    case 188:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WALKING_STEP_LENGTH");
      goto LABEL_219;
    case 189:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("TOOTHBRUSHING_EVENT");
      goto LABEL_219;
    case 191:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PREGNANCY");
      goto LABEL_219;
    case 192:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("LACTATION");
      goto LABEL_219;
    case 193:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CONTRACEPTIVE");
      goto LABEL_219;
    case 194:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WALKING_ASYMMETRY_PERCENTAGE");
      goto LABEL_219;
    case 195:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("STAIR_ASCENT_SPEED");
      goto LABEL_219;
    case 196:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("STAIR_DESCENT_SPEED");
      goto LABEL_219;
    case 197:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SLEEP_DURATION_GOAL");
      goto LABEL_219;
    case 198:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SLEEP_SCHEDULE");
      goto LABEL_219;
    case 199:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HEADPHONE_AUDIO_EXPOSURE_EVENT");
      goto LABEL_219;
    case 201:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT");
      goto LABEL_219;
    case 202:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_SKIPPED_HEARTBEAT");
      goto LABEL_219;
    case 203:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_FEVER");
      goto LABEL_219;
    case 204:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_SHORTNESS_OF_BREATH");
      goto LABEL_219;
    case 205:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_CHEST_TIGHTNESS_OR_PAIN");
      goto LABEL_219;
    case 206:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_FAINTING");
      goto LABEL_219;
    case 207:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_DIZZINESS");
      goto LABEL_219;
    case 218:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CARDIO_FITNESS_MEDICATIONS_USE");
      goto LABEL_219;
    case 220:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_VOMITING");
      goto LABEL_219;
    case 221:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_HEARTBURN");
      goto LABEL_219;
    case 222:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_COUGHING");
      goto LABEL_219;
    case 223:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_WHEEZING");
      goto LABEL_219;
    case 224:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_SORE_THROAT");
      goto LABEL_219;
    case 225:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_CONGESTION");
      goto LABEL_219;
    case 226:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_RUNNY_NOSE");
      goto LABEL_219;
    case 229:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_VAGINAL_DRYNESS");
      goto LABEL_219;
    case 230:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_NIGHT_SWEATS");
      goto LABEL_219;
    case 231:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_CHILLS");
      goto LABEL_219;
    case 232:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_HAIR_LOSS");
      goto LABEL_219;
    case 233:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_DRY_SKIN");
      goto LABEL_219;
    case 234:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_BLADDER_INCONTINENCE");
      goto LABEL_219;
    case 235:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_MEMORY_LAPSE");
      goto LABEL_219;
    case 236:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("CARDIO_FITNESS_EVENT");
LABEL_164:
      v5 = CFSTR("Localizable-CardioFitness");
      goto LABEL_219;
    case 237:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("HANDWASHING_EVENT");
      goto LABEL_219;
    case 240:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_BODY_ACHE");
      goto LABEL_219;
    case 241:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_LOSS_OF_SMELL");
      goto LABEL_219;
    case 242:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SYMPTOM_LOSS_OF_TASTE");
      goto LABEL_219;
    case 243:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PREGNANCY_TEST_RESULT");
      goto LABEL_219;
    case 244:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PROGESTERONE_TEST_RESULT");
      goto LABEL_219;
    case 248:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("ATRIAL_FIBRILLATION_BURDEN");
      v5 = CFSTR("Localizable-AFibBurden");
      goto LABEL_219;
    case 249:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("WALKING_STEADINESS");
      goto LABEL_174;
    case 250:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("WALKING_STEADINESS_EVENT");
LABEL_174:
      v5 = CFSTR("Localizable-WalkingSteadiness");
      goto LABEL_219;
    case 251:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("NUMBER_OF_ALCOHOLIC_BEVERAGES");
      goto LABEL_219;
    case 256:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("SLEEPING_WRIST_TEMPERATURE");
      v5 = CFSTR("Localizable-Kali");
      goto LABEL_219;
    case 257:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("VISION_PRESCRIPTION");
      v5 = CFSTR("Localizable-VRX");
      goto LABEL_219;
    case 258:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RUNNING_STRIDE_LENGTH");
      goto LABEL_219;
    case 259:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RUNNING_VERTICAL_OSCILLATION");
      goto LABEL_219;
    case 260:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RUNNING_GROUND_CONTACT_TIME");
      goto LABEL_219;
    case 262:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_SPOTTING");
      goto LABEL_185;
    case 263:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_PROLONGED");
      goto LABEL_185;
    case 264:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_IRREGULAR");
      goto LABEL_185;
    case 265:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_INFREQUENT");
LABEL_185:
      v5 = CFSTR("Localizable-Selene");
      goto LABEL_219;
    case 266:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("HEART_RATE_RECOVERY");
      v5 = CFSTR("Localizable-Lyon");
      goto LABEL_219;
    case 269:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("UNDERWATER_DEPTH");
      goto LABEL_195;
    case 270:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RUNNING_POWER");
      goto LABEL_219;
    case 272:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ENVIRONMENTAL_SOUND_REDUCTION");
      goto LABEL_219;
    case 274:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("RUNNING_SPEED");
      goto LABEL_219;
    case 275:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("SLEEP_BREATHING_DISTURBANCES");
      goto LABEL_193;
    case 276:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("SLEEP_APNEA_EVENT");
LABEL_193:
      v5 = CFSTR("Localizable-Nebula");
      goto LABEL_219;
    case 277:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("WATER_TEMPERATURE");
LABEL_195:
      v5 = CFSTR("Localizable-Charon");
      goto LABEL_219;
    case 279:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("TIME_IN_DAYLIGHT");
      goto LABEL_219;
    case 280:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CYCLING_POWER");
      goto LABEL_219;
    case 281:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CYCLING_SPEED");
      goto LABEL_219;
    case 282:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CYCLING_CADENCE");
      goto LABEL_219;
    case 283:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CYCLING_FUNCTIONAL_THRESHOLD_POWER");
      goto LABEL_219;
    case 284:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("STATE_OF_MIND");
      goto LABEL_205;
    case 286:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PHYSICAL_EFFORT");
      goto LABEL_219;
    case 287:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("GAD7");
      goto LABEL_205;
    case 288:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("PHQ9");
LABEL_205:
      v5 = CFSTR("Localizable-Chamomile");
      goto LABEL_219;
    case 291:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("USER_TRACKED_MEDICATIONS");
      goto LABEL_219;
    case 294:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PADDLE_SPORTS_DISTANCE");
      goto LABEL_219;
    case 295:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ROWING_DISTANCE");
      goto LABEL_219;
    case 296:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CROSS_COUNTRY_SKIING_DISTANCE");
      goto LABEL_219;
    case 297:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("SKATING_SPORTS_DISTANCE");
      goto LABEL_219;
    case 298:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ESTIMATED_WORKOUT_EFFORT_SCORE");
      goto LABEL_219;
    case 301:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("ROWING_SPEED");
      goto LABEL_219;
    case 302:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("CROSS_COUNTRY_SKIING_SPEED");
      goto LABEL_219;
    case 303:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("PADDLE_SPORTS_SPEED");
      goto LABEL_219;
    case 304:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("WORKOUT_EFFORT_SCORE");
      goto LABEL_219;
    case 305:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v6 = CFSTR("APPLE_BALANCE_METRICS");
      v5 = CFSTR("Localizable-Balance");
      goto LABEL_219;
    case 313:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLEEDING_DURING_PREGNANCY");
      goto LABEL_219;
    case 314:
      HKHealthKitFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localizable-DataTypes");
      v6 = CFSTR("BLEEDING_AFTER_PREGNANCY");
LABEL_219:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v6, &stru_1E37FD4C0, v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_220:

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)hk_localizedNameForAuthSheet
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v6;
  void *v7;

  v2 = 0;
  v3 = CFSTR("SYMPTOM_ABDOMINAL_CRAMPS");
  switch(-[HKObjectType code](self, "code"))
  {
    case 0:
      v3 = CFSTR("BODY_MASS_INDEX");
      goto LABEL_213;
    case 1:
      v3 = CFSTR("BODY_FAT_PERCENTAGE");
      goto LABEL_213;
    case 2:
      v3 = CFSTR("HEIGHT");
      goto LABEL_213;
    case 3:
      v3 = CFSTR("BODY_MASS");
      goto LABEL_213;
    case 4:
      v3 = CFSTR("LEAN_BODY_MASS");
      goto LABEL_213;
    case 5:
      v3 = CFSTR("HEART_RATE");
      goto LABEL_213;
    case 7:
      v3 = CFSTR("STEPS");
      goto LABEL_213;
    case 8:
      v3 = CFSTR("DISTANCE");
      goto LABEL_213;
    case 9:
      v3 = CFSTR("BASAL_ENERGY");
      goto LABEL_213;
    case 10:
      v3 = CFSTR("ACTIVE_ENERGY");
      goto LABEL_213;
    case 12:
      v3 = CFSTR("FLIGHTS_CLIMBED");
      goto LABEL_213;
    case 13:
      v3 = CFSTR("NIKE_FUEL");
      goto LABEL_213;
    case 14:
      v3 = CFSTR("OXYGEN_SATURATION");
      goto LABEL_213;
    case 15:
      v3 = CFSTR("BLOOD_GLUCOSE");
      goto LABEL_213;
    case 16:
      v3 = CFSTR("BLOOD_PRESSURE_SYSTOLIC");
      goto LABEL_213;
    case 17:
      v3 = CFSTR("BLOOD_PRESSURE_DIASTOLIC");
      goto LABEL_213;
    case 18:
      v3 = CFSTR("BLOOD_ALCOHOL_CONTENT");
      goto LABEL_213;
    case 19:
      v3 = CFSTR("PERFUSION_INDEX");
      goto LABEL_213;
    case 20:
      v3 = CFSTR("TOTAL_FAT");
      goto LABEL_213;
    case 21:
      v3 = CFSTR("POLYUNSATURATED_FAT");
      goto LABEL_213;
    case 22:
      v3 = CFSTR("MONOUNSATURATED_FAT");
      goto LABEL_213;
    case 23:
      v3 = CFSTR("SATURATED_FAT");
      goto LABEL_213;
    case 24:
      v3 = CFSTR("CHOLESTEROL");
      goto LABEL_213;
    case 25:
      v3 = CFSTR("SODIUM");
      goto LABEL_213;
    case 26:
      v3 = CFSTR("CARBOHYDRATES");
      goto LABEL_213;
    case 27:
      v3 = CFSTR("FIBER");
      goto LABEL_213;
    case 28:
      v3 = CFSTR("SUGAR");
      goto LABEL_213;
    case 29:
      v3 = CFSTR("DIETARY_ENERGY");
      goto LABEL_213;
    case 30:
      v3 = CFSTR("PROTEIN");
      goto LABEL_213;
    case 31:
      v3 = CFSTR("VITAMIN_A");
      goto LABEL_213;
    case 32:
      v3 = CFSTR("VITAMIN_B6");
      goto LABEL_213;
    case 33:
      v3 = CFSTR("VITAMIN_B12");
      goto LABEL_213;
    case 34:
      v3 = CFSTR("VITAMIN_C");
      goto LABEL_213;
    case 35:
      v3 = CFSTR("VITAMIN_D");
      goto LABEL_213;
    case 36:
      v3 = CFSTR("VITAMIN_E");
      goto LABEL_213;
    case 37:
      v3 = CFSTR("VITAMIN_K");
      goto LABEL_213;
    case 38:
      v3 = CFSTR("CALCIUM");
      goto LABEL_213;
    case 39:
      v3 = CFSTR("IRON");
      goto LABEL_213;
    case 40:
      v3 = CFSTR("THIAMIN");
      goto LABEL_213;
    case 41:
      v3 = CFSTR("RIBOFLAVIN");
      goto LABEL_213;
    case 42:
      v3 = CFSTR("NIACIN");
      goto LABEL_213;
    case 43:
      v3 = CFSTR("FOLATE");
      goto LABEL_213;
    case 44:
      v3 = CFSTR("BIOTIN");
      goto LABEL_213;
    case 45:
      v3 = CFSTR("PANTOTHENIC_ACID");
      goto LABEL_213;
    case 46:
      v3 = CFSTR("PHOSPHORUS");
      goto LABEL_213;
    case 47:
      v3 = CFSTR("IODINE");
      goto LABEL_213;
    case 48:
      v3 = CFSTR("MAGNESIUM");
      goto LABEL_213;
    case 49:
      v3 = CFSTR("ZINC");
      goto LABEL_213;
    case 50:
      v3 = CFSTR("SELENIUM");
      goto LABEL_213;
    case 51:
      v3 = CFSTR("COPPER");
      goto LABEL_213;
    case 52:
      v3 = CFSTR("MANGANESE");
      goto LABEL_213;
    case 53:
      v3 = CFSTR("CHROMIUM");
      goto LABEL_213;
    case 54:
      v3 = CFSTR("MOLYBDENUM");
      goto LABEL_213;
    case 55:
      v3 = CFSTR("CHLORIDE");
      goto LABEL_213;
    case 56:
      v3 = CFSTR("POTASSIUM");
      goto LABEL_213;
    case 57:
      v3 = CFSTR("NUMBER_OF_TIMES_FALLEN");
      goto LABEL_213;
    case 58:
      v3 = CFSTR("ELECTRODERMAL_ACTIVITY");
      goto LABEL_213;
    case 60:
      v3 = CFSTR("INHALER_USAGE");
      goto LABEL_213;
    case 61:
      v3 = CFSTR("RESPIRATORY_RATE");
      goto LABEL_213;
    case 62:
      v3 = CFSTR("BODY_TEMPERATURE");
      goto LABEL_213;
    case 63:
      v3 = CFSTR("SLEEP_ANALYSIS");
      goto LABEL_213;
    case 64:
      v3 = CFSTR("BIOLOGICAL_SEX");
      goto LABEL_213;
    case 65:
      v3 = CFSTR("DATE_OF_BIRTH");
      goto LABEL_213;
    case 66:
      v3 = CFSTR("BLOOD_TYPE");
      goto LABEL_213;
    case 70:
      v3 = CFSTR("STAND_HOUR");
      goto LABEL_213;
    case 71:
      v3 = CFSTR("SPIROMETRY_FVC");
      goto LABEL_213;
    case 72:
      v3 = CFSTR("SPIROMETRY_FEV1");
      goto LABEL_213;
    case 73:
      v3 = CFSTR("SPIROMETRY_PEFR");
      goto LABEL_213;
    case 75:
      v3 = CFSTR("EXERCISE_MINUTE");
      goto LABEL_213;
    case 78:
      v3 = CFSTR("CAFFEINE");
      goto LABEL_213;
    case 79:
      v3 = CFSTR("WORKOUT");
      goto LABEL_213;
    case 80:
      v3 = CFSTR("BLOOD_PRESSURE");
      goto LABEL_213;
    case 83:
      v3 = CFSTR("CYCLING_DISTANCE");
      goto LABEL_213;
    case 87:
      v3 = CFSTR("WATER");
      goto LABEL_213;
    case 88:
      v3 = CFSTR("FITZPATRICK_SKIN_TYPE");
      goto LABEL_213;
    case 89:
      v3 = CFSTR("UV_EXPOSURE");
      goto LABEL_213;
    case 90:
      v3 = CFSTR("BASAL_BODY_TEMPERATURE");
      goto LABEL_213;
    case 91:
      v3 = CFSTR("CERVICAL_MUCUS_QUALITY");
      goto LABEL_213;
    case 92:
      v3 = CFSTR("OVULATION_TEST_RESULT");
      goto LABEL_213;
    case 95:
      v3 = CFSTR("MENSTRUATION");
      goto LABEL_213;
    case 96:
      v3 = CFSTR("INTERMENSTRUAL_BLEEDING");
      goto LABEL_213;
    case 97:
      v3 = CFSTR("SEXUAL_ACTIVITY");
      goto LABEL_213;
    case 99:
      v3 = CFSTR("MINDFUL_MINUTES");
      goto LABEL_213;
    case 100:
      v3 = CFSTR("ACTIVITY_SUMMARY");
      goto LABEL_213;
    case 101:
      v3 = CFSTR("PUSH_COUNT");
      goto LABEL_213;
    case 102:
      v3 = CFSTR("WORKOUT_ROUTE");
      goto LABEL_213;
    case 103:
      v3 = CFSTR("WHEELCHAIR_USE");
      goto LABEL_213;
    case 107:
      v3 = CFSTR("CLINICAL_DOCUMENTS");
      goto LABEL_213;
    case 110:
      v3 = CFSTR("SWIMMING_DISTANCE");
      goto LABEL_213;
    case 111:
      v3 = CFSTR("SWIMMING_STROKES");
      goto LABEL_213;
    case 113:
      v3 = CFSTR("WHEELCHAIR_DISTANCE");
      goto LABEL_213;
    case 114:
      v3 = CFSTR("WAIST_CIRCUMFERENCE");
      goto LABEL_213;
    case 118:
      v3 = CFSTR("RESTING_HEART_RATE");
      goto LABEL_213;
    case 119:
      v3 = CFSTR("TACHOGRAM");
      goto LABEL_213;
    case 124:
      v3 = CFSTR("CARDIO_FITNESS");
      goto LABEL_213;
    case 125:
      v3 = CFSTR("INSULIN_DELIVERY");
      goto LABEL_213;
    case 137:
      v3 = CFSTR("WALKING_HEART_RATE_AVERAGE");
      goto LABEL_213;
    case 138:
      v3 = CFSTR("DOWNHILL_SNOW_SPORTS_DISTANCE");
      goto LABEL_213;
    case 139:
      v3 = CFSTR("HEART_RATE_VARIABILITY");
      goto LABEL_213;
    case 140:
      v3 = CFSTR("TACHYCARDIA");
      goto LABEL_213;
    case 144:
      v3 = CFSTR("ELECTROCARDIOGRAM");
      goto LABEL_213;
    case 145:
      HKHealthKitFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUDIOGRAM"), &stru_1E37FD4C0, CFSTR("Localizable-DataTypes"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v3)
        goto LABEL_213;
      return 0;
    case 147:
      v3 = CFSTR("BRADYCARDIA");
      goto LABEL_213;
    case 156:
      v3 = CFSTR("ATRIAL_FIBRILLATION_EVENT");
      goto LABEL_213;
    case 157:
      goto LABEL_213;
    case 158:
      v3 = CFSTR("SYMPTOM_BREAST_PAIN");
      goto LABEL_213;
    case 159:
      v3 = CFSTR("SYMPTOM_BLOATING");
      goto LABEL_213;
    case 160:
      v3 = CFSTR("SYMPTOM_HEADACHE");
      goto LABEL_213;
    case 161:
      v3 = CFSTR("SYMPTOM_ACNE");
      goto LABEL_213;
    case 162:
      v3 = CFSTR("SYMPTOM_LOWER_BACK_PAIN");
      goto LABEL_213;
    case 163:
      v3 = CFSTR("SYMPTOM_PELVIC_PAIN");
      goto LABEL_213;
    case 164:
      v3 = CFSTR("SYMPTOM_MOOD_CHANGES");
      goto LABEL_213;
    case 165:
      v3 = CFSTR("SYMPTOM_CONSTIPATION");
      goto LABEL_213;
    case 166:
      v3 = CFSTR("SYMPTOM_DIARRHEA");
      goto LABEL_213;
    case 167:
      v3 = CFSTR("SYMPTOM_FATIGUE");
      goto LABEL_213;
    case 168:
      v3 = CFSTR("SYMPTOM_NAUSEA");
      goto LABEL_213;
    case 169:
      v3 = CFSTR("SYMPTOM_SLEEP_CHANGES");
      goto LABEL_213;
    case 170:
      v3 = CFSTR("SYMPTOM_APPETITE_CHANGES");
      goto LABEL_213;
    case 171:
      v3 = CFSTR("SYMPTOM_HOT_FLASHES");
      goto LABEL_213;
    case 172:
      v3 = CFSTR("ENVIRONMENTAL_AUDIO_EXPOSURE");
      goto LABEL_213;
    case 173:
      v3 = CFSTR("HEADPHONE_AUDIO_EXPOSURE");
      goto LABEL_213;
    case 177:
      v3 = CFSTR("ACTIVITY_MOVE_MODE");
      goto LABEL_213;
    case 178:
      v3 = CFSTR("AUDIO_EXPOSURE_EVENT");
      goto LABEL_213;
    case 179:
      v3 = CFSTR("MOVE_MINUTE");
      goto LABEL_213;
    case 182:
      v3 = CFSTR("WALKING_DOUBLE_SUPPORT_PERCENTAGE");
      goto LABEL_213;
    case 183:
      v3 = CFSTR("SIX_MINUTE_WALK_TEST_DISTANCE");
      goto LABEL_213;
    case 186:
      v3 = CFSTR("STAND_MINUTE");
      goto LABEL_213;
    case 187:
      v3 = CFSTR("WALKING_SPEED");
      goto LABEL_213;
    case 188:
      v3 = CFSTR("WALKING_STEP_LENGTH");
      goto LABEL_213;
    case 189:
      v3 = CFSTR("TOOTHBRUSHING_EVENT");
      goto LABEL_213;
    case 191:
      v3 = CFSTR("PREGNANCY");
      goto LABEL_213;
    case 192:
      v3 = CFSTR("LACTATION");
      goto LABEL_213;
    case 193:
      v3 = CFSTR("CONTRACEPTIVE");
      goto LABEL_213;
    case 194:
      v3 = CFSTR("WALKING_ASYMMETRY_PERCENTAGE");
      goto LABEL_213;
    case 195:
      v3 = CFSTR("STAIR_ASCENT_SPEED");
      goto LABEL_213;
    case 196:
      v3 = CFSTR("STAIR_DESCENT_SPEED");
      goto LABEL_213;
    case 197:
      v3 = CFSTR("SLEEP_DURATION_GOAL");
      goto LABEL_213;
    case 198:
      v3 = CFSTR("SLEEP_SCHEDULE");
      goto LABEL_213;
    case 199:
      v3 = CFSTR("HEADPHONE_AUDIO_EXPOSURE_EVENT");
      goto LABEL_213;
    case 201:
      v3 = CFSTR("SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT");
      goto LABEL_213;
    case 202:
      v3 = CFSTR("SYMPTOM_SKIPPED_HEARTBEAT");
      goto LABEL_213;
    case 203:
      v3 = CFSTR("SYMPTOM_FEVER");
      goto LABEL_213;
    case 204:
      v3 = CFSTR("SYMPTOM_SHORTNESS_OF_BREATH");
      goto LABEL_213;
    case 205:
      v3 = CFSTR("SYMPTOM_CHEST_TIGHTNESS_OR_PAIN");
      goto LABEL_213;
    case 206:
      v3 = CFSTR("SYMPTOM_FAINTING");
      goto LABEL_213;
    case 207:
      v3 = CFSTR("SYMPTOM_DIZZINESS");
      goto LABEL_213;
    case 218:
      v3 = CFSTR("CARDIO_FITNESS_MEDICATIONS_USE");
      goto LABEL_213;
    case 220:
      v3 = CFSTR("SYMPTOM_VOMITING");
      goto LABEL_213;
    case 221:
      v3 = CFSTR("SYMPTOM_HEARTBURN");
      goto LABEL_213;
    case 222:
      v3 = CFSTR("SYMPTOM_COUGHING");
      goto LABEL_213;
    case 223:
      v3 = CFSTR("SYMPTOM_WHEEZING");
      goto LABEL_213;
    case 224:
      v3 = CFSTR("SYMPTOM_SORE_THROAT");
      goto LABEL_213;
    case 225:
      v3 = CFSTR("SYMPTOM_CONGESTION");
      goto LABEL_213;
    case 226:
      v3 = CFSTR("SYMPTOM_RUNNY_NOSE");
      goto LABEL_213;
    case 229:
      v3 = CFSTR("SYMPTOM_VAGINAL_DRYNESS");
      goto LABEL_213;
    case 230:
      v3 = CFSTR("SYMPTOM_NIGHT_SWEATS");
      goto LABEL_213;
    case 231:
      v3 = CFSTR("SYMPTOM_CHILLS");
      goto LABEL_213;
    case 232:
      v3 = CFSTR("SYMPTOM_HAIR_LOSS");
      goto LABEL_213;
    case 233:
      v3 = CFSTR("SYMPTOM_DRY_SKIN");
      goto LABEL_213;
    case 234:
      v3 = CFSTR("SYMPTOM_BLADDER_INCONTINENCE");
      goto LABEL_213;
    case 235:
      v3 = CFSTR("SYMPTOM_MEMORY_LAPSE");
      goto LABEL_213;
    case 236:
      v3 = CFSTR("CARDIO_FITNESS_EVENT");
      goto LABEL_213;
    case 237:
      v3 = CFSTR("HANDWASHING_EVENT");
      goto LABEL_213;
    case 240:
      v3 = CFSTR("SYMPTOM_BODY_ACHE");
      goto LABEL_213;
    case 241:
      v3 = CFSTR("SYMPTOM_LOSS_OF_SMELL");
      goto LABEL_213;
    case 242:
      v3 = CFSTR("SYMPTOM_LOSS_OF_TASTE");
      goto LABEL_213;
    case 243:
      v3 = CFSTR("PREGNANCY_TEST_RESULT");
      goto LABEL_213;
    case 244:
      v3 = CFSTR("PROGESTERONE_TEST_RESULT");
      goto LABEL_213;
    case 248:
      v3 = CFSTR("ATRIAL_FIBRILLATION_BURDEN");
      goto LABEL_213;
    case 249:
      v3 = CFSTR("WALKING_STEADINESS");
      goto LABEL_213;
    case 250:
      v3 = CFSTR("WALKING_STEADINESS_EVENT");
      goto LABEL_213;
    case 251:
      v3 = CFSTR("NUMBER_OF_ALCOHOLIC_BEVERAGES");
      goto LABEL_213;
    case 256:
      v3 = CFSTR("SLEEPING_WRIST_TEMPERATURE");
      goto LABEL_213;
    case 257:
      v3 = CFSTR("VISION_PRESCRIPTION");
      goto LABEL_213;
    case 258:
      v3 = CFSTR("RUNNING_STRIDE_LENGTH");
      goto LABEL_213;
    case 259:
      v3 = CFSTR("RUNNING_VERTICAL_OSCILLATION");
      goto LABEL_213;
    case 260:
      v3 = CFSTR("RUNNING_GROUND_CONTACT_TIME");
      goto LABEL_213;
    case 262:
      v3 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_SPOTTING");
      goto LABEL_213;
    case 263:
      v3 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_PROLONGED");
      goto LABEL_213;
    case 264:
      v3 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_IRREGULAR");
      goto LABEL_213;
    case 265:
      v3 = CFSTR("MENSTRUAL_CYCLE_DEVIATION_INFREQUENT");
      goto LABEL_213;
    case 266:
      v3 = CFSTR("HEART_RATE_RECOVERY");
      goto LABEL_213;
    case 269:
      v3 = CFSTR("UNDERWATER_DEPTH");
      goto LABEL_213;
    case 270:
      v3 = CFSTR("RUNNING_POWER");
      goto LABEL_213;
    case 272:
      v3 = CFSTR("ENVIRONMENTAL_SOUND_REDUCTION");
      goto LABEL_213;
    case 274:
      v3 = CFSTR("RUNNING_SPEED");
      goto LABEL_213;
    case 275:
      v3 = CFSTR("SLEEP_BREATHING_DISTURBANCES");
      goto LABEL_213;
    case 276:
      v3 = CFSTR("SLEEP_APNEA_EVENT");
      goto LABEL_213;
    case 277:
      v3 = CFSTR("WATER_TEMPERATURE");
      goto LABEL_213;
    case 279:
      v3 = CFSTR("TIME_IN_DAYLIGHT");
      goto LABEL_213;
    case 280:
      v3 = CFSTR("CYCLING_POWER");
      goto LABEL_213;
    case 281:
      v3 = CFSTR("CYCLING_SPEED");
      goto LABEL_213;
    case 282:
      v3 = CFSTR("CYCLING_CADENCE");
      goto LABEL_213;
    case 283:
      v3 = CFSTR("CYCLING_FUNCTIONAL_THRESHOLD_POWER");
      goto LABEL_213;
    case 284:
      v3 = CFSTR("STATE_OF_MIND");
      goto LABEL_213;
    case 286:
      v3 = CFSTR("PHYSICAL_EFFORT");
      goto LABEL_213;
    case 287:
      v3 = CFSTR("GAD7");
      goto LABEL_213;
    case 288:
      v3 = CFSTR("PHQ9");
      goto LABEL_213;
    case 291:
      v3 = CFSTR("USER_TRACKED_MEDICATIONS");
      goto LABEL_213;
    case 294:
      v3 = CFSTR("PADDLE_SPORTS_DISTANCE");
      goto LABEL_213;
    case 295:
      v3 = CFSTR("ROWING_DISTANCE");
      goto LABEL_213;
    case 296:
      v3 = CFSTR("CROSS_COUNTRY_SKIING_DISTANCE");
      goto LABEL_213;
    case 297:
      v3 = CFSTR("SKATING_SPORTS_DISTANCE");
      goto LABEL_213;
    case 298:
      v3 = CFSTR("ESTIMATED_WORKOUT_EFFORT_SCORE");
      goto LABEL_213;
    case 301:
      v3 = CFSTR("ROWING_SPEED");
      goto LABEL_213;
    case 302:
      v3 = CFSTR("CROSS_COUNTRY_SKIING_SPEED");
      goto LABEL_213;
    case 303:
      v3 = CFSTR("PADDLE_SPORTS_SPEED");
      goto LABEL_213;
    case 304:
      v3 = CFSTR("WORKOUT_EFFORT_SCORE");
      goto LABEL_213;
    case 305:
      v3 = CFSTR("APPLE_BALANCE_METRICS");
      goto LABEL_213;
    case 313:
      v3 = CFSTR("BLEEDING_DURING_PREGNANCY");
      goto LABEL_213;
    case 314:
      v3 = CFSTR("BLEEDING_AFTER_PREGNANCY");
LABEL_213:
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("_EMBEDDED_AUTH"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E37FD4C0, CFSTR("Localizable-DataTypes"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return v2;
    default:
      return v2;
  }
}

+ (id)objectTypeForWorkoutMetric:(unint64_t)a3 fitnessMachineType:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const HKQuantityTypeIdentifier *v7;

  v6 = 0;
  v7 = &HKQuantityTypeIdentifierDistanceWalkingRunning;
  switch(a3)
  {
    case 1uLL:
      v7 = &HKQuantityTypeIdentifierAppleExerciseTime;
      goto LABEL_16;
    case 2uLL:
      v7 = &HKQuantityTypeIdentifierActiveEnergyBurned;
      goto LABEL_16;
    case 3uLL:
      goto LABEL_16;
    case 4uLL:
      v7 = &HKQuantityTypeIdentifierDistanceCycling;
      goto LABEL_16;
    case 6uLL:
      v7 = &HKQuantityTypeIdentifierFlightsClimbed;
      goto LABEL_16;
    case 7uLL:
      v7 = &HKQuantityTypeIdentifierStepCount;
      goto LABEL_16;
    case 9uLL:
      if (a4 != 6)
        goto LABEL_13;
      v7 = &HKQuantityTypeIdentifierCyclingSpeed;
      goto LABEL_16;
    case 0x10uLL:
      if (a4 != 6)
        goto LABEL_13;
      v7 = &HKQuantityTypeIdentifierCyclingPower;
      goto LABEL_16;
    case 0x12uLL:
      if (a4 == 6)
      {
        v7 = &HKQuantityTypeIdentifierCyclingCadence;
LABEL_16:
        +[HKObjectType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", *v7, a4, v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_13:
        v6 = 0;
      }
      return v6;
    case 0x14uLL:
      v7 = &HKQuantityTypeIdentifierHeartRate;
      goto LABEL_16;
    default:
      return v6;
  }
}

+ (id)signedClinicalDataRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)procedureRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)diagnosticTestResultTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)conditionRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)medicationDispenseRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)diagnosticTestReportTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)coverageRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKObjectType)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (void)_enumerateDataTypeCodesWithHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  __CFString **v5;
  uint64_t v6;
  _OWORD v7[3];

  v3 = (void (**)(id, _QWORD))a3;
  v4 = 0;
  v5 = HKDataTypeDefinitions;
  do
  {
    memset(v7, 0, sizeof(v7));
    __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)v7, (uint64_t)v5);
    v6 = *(_QWORD *)&v7[0];
    __destructor_8_s0_s8_s16_s24_s32((id *)v7);
    if (v6)
      v3[2](v3, v4);
    ++v4;
    v5 += 6;
  }
  while (v4 != 317);

}

+ (void)_enumerateObjectTypesWithHandler:(id)a3
{
  uint64_t i;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  for (i = 0; i != 317; ++i)
  {
    objc_msgSend(a1, "dataTypeWithCode:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6[2](v6, v5);

  }
}

+ (id)_allDataTypeIdentifiers
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HKObjectType__allDataTypeIdentifiers__block_invoke;
  v7[3] = &unk_1E37F11F0;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "_enumerateDataTypeCodesWithHandler:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __39__HKObjectType__allDataTypeIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  _OWORD v4[3];

  memset(v4, 0, sizeof(v4));
  __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)v4, (uint64_t)&HKDataTypeDefinitions[6 * a2]);
  v3 = *(id *)&v4[0];
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  __destructor_8_s0_s8_s16_s24_s32((id *)v4);
}

+ (id)_allTypesOfClass:(Class)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  Class v12;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__HKObjectType__allTypesOfClass___block_invoke;
  v9[3] = &unk_1E37F1218;
  v11 = a1;
  v12 = a3;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a1, "_enumerateDataTypeCodesWithHandler:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __33__HKObjectType__allTypesOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "_dataTypeWithCode:expectedClass:", a2, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

+ (id)_allBinarySampleTypes
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = &unk_1EE3CDCF8;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __37__HKObjectType__allBinarySampleTypes__block_invoke;
  v12 = &unk_1E37F1240;
  v13 = v4;
  v14 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(a1, "_enumerateObjectTypesWithHandler:", &v9);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __37__HKObjectType__allBinarySampleTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend((id)objc_msgSend(v3, "dataObjectClass"), "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

+ (id)_allScoredAssessmentTypes
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = &unk_1EE3B50B8;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __41__HKObjectType__allScoredAssessmentTypes__block_invoke;
  v12 = &unk_1E37F1240;
  v13 = v4;
  v14 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(a1, "_enumerateObjectTypesWithHandler:", &v9);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __41__HKObjectType__allScoredAssessmentTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend((id)objc_msgSend(v3, "dataObjectClass"), "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

+ (id)_typesIncludingParentTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "parentType", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "parentType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_lock_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4
{
  id *v8;
  id v9;
  void *v10;
  Class v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  NSString *aClassName[2];
  __int128 v18;
  __int128 v19;

  v8 = (id *)((char *)&_lock_dataTypeWithCode_expectedClass__uniquedDataTypes + 8 * a3);
  v9 = *v8;
  if (v9)
  {
    v10 = v9;
    if (a4 && (objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", a4) & 1) == 0)
    {

      return 0;
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)aClassName = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)aClassName, (uint64_t)&HKDataTypeDefinitions[6 * a3]);
    if (SWORD4(v19) != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKObjectType.m"), 162, CFSTR("definition for wrong code (%d) at index %d"), SWORD4(v19), a3);

    }
    v12 = NSClassFromString(aClassName[1]);
    v13 = v12;
    if (a4 && !-[objc_class isSubclassOfClass:](v12, "isSubclassOfClass:", a4))
    {
      v10 = 0;
    }
    else
    {
      v14 = [v13 alloc];
      v10 = (void *)objc_msgSend(v14, "_initWithCode:", SWORD4(v19));
      if ((_QWORD)v19)
      {
        objc_msgSend(a1, "_lock_dataTypeWithCode:expectedClass:", objc_msgSend((id)v19, "longLongValue"), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setParentType:", v15);

      }
      objc_storeStrong(v8, v10);
    }
    __destructor_8_s0_s8_s16_s24_s32((id *)aClassName);
  }
  return v10;
}

+ (id)_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4
{
  void *v7;

  if ((unint64_t)a3 >= 0x13D)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid data type code (%ld)"), a3);
  os_unfair_lock_lock((os_unfair_lock_t)&_dataTypeWithCode_expectedClass__lock);
  objc_msgSend(a1, "_lock_dataTypeWithCode:expectedClass:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataTypeWithCode_expectedClass__lock);
  return v7;
}

+ (id)dataTypeWithNumber:(id)a3
{
  return (id)objc_msgSend(a1, "dataTypeWithCode:", objc_msgSend(a3, "integerValue"));
}

+ (HKCorrelationType)correlationTypeForIdentifier:(HKCorrelationTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKCorrelationType *)v5;
}

+ (HKDocumentType)documentTypeForIdentifier:(HKDocumentTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKDocumentType *)v5;
}

+ (id)scoredAssessmentTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userTrackedConceptTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (HKActivitySummaryType)activitySummaryType
{
  return (HKActivitySummaryType *)+[HKObjectType dataTypeWithCode:](HKActivitySummaryType, "dataTypeWithCode:", 100);
}

+ (HKAudiogramSampleType)audiogramSampleType
{
  return (HKAudiogramSampleType *)+[HKObjectType dataTypeWithCode:](HKAudiogramSampleType, "dataTypeWithCode:", 145);
}

+ (HKElectrocardiogramType)electrocardiogramType
{
  return (HKElectrocardiogramType *)+[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 144);
}

+ (id)stateOfMindType
{
  return +[HKObjectType dataTypeWithCode:](HKStateOfMindType, "dataTypeWithCode:", 284);
}

+ (HKPrescriptionType)visionPrescriptionType
{
  return (HKPrescriptionType *)+[HKObjectType dataTypeWithCode:](HKPrescriptionType, "dataTypeWithCode:", 257);
}

+ (id)workoutZonesTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)appleBalanceMetricsType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 305);
}

+ (id)GAD7AssessmentType
{
  return -[HKScoredAssessmentType initWithIdentifier:]([HKScoredAssessmentType alloc], "initWithIdentifier:", CFSTR("HKScoredAssessmentTypeIdentifierGAD7"));
}

+ (id)PHQ9AssessmentType
{
  return -[HKScoredAssessmentType initWithIdentifier:]([HKScoredAssessmentType alloc], "initWithIdentifier:", CFSTR("HKScoredAssessmentTypeIdentifierPHQ9"));
}

+ (id)_typeWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", a3, 0);
}

+ (int64_t)_typeCodeForIdentifier:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HKDataTypeCodeFromTypeIdentifier((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(&unk_1E389D6C0, "objectForKeyedSubscript:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");

  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "Failed to resolve data type code for identifier %@", (uint8_t *)&v8, 0xCu);
    }
    v5 = -1;
  }

  return v5;
}

+ (id)_typeWithIdentifier:(id)a3 expectedClass:(Class)a4
{
  unint64_t v6;
  void *v7;

  v6 = objc_msgSend(a1, "_typeCodeForIdentifier:", a3);
  if (v6 > 0x13C)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "_dataTypeWithCode:expectedClass:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)_objectTypesFromIdentifierArray:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = a4;
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v14 = v13;
        +[HKObjectType _typeWithIdentifier:](HKObjectType, "_typeWithIdentifier:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v23, 3, CFSTR("Invalid type identifier \"%@\"), v14);

          goto LABEL_15;
        }
        v16 = (void *)v15;
        objc_msgSend(v7, "addObject:", v15);

        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = objc_opt_class();
      objc_msgSend(v20, "hk_assignError:code:format:", v23, 3, CFSTR("Type identifier %@ has invalid class (expected %@, found %@)"), v13, v21, objc_opt_class());
LABEL_15:

      v17 = 0;
      goto LABEL_16;
    }
LABEL_11:

    v17 = (void *)objc_msgSend(v7, "copy");
LABEL_16:

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = objc_opt_class();
    objc_msgSend(v18, "hk_assignError:code:format:", a4, 3, CFSTR("Invalid type identifier array (expected %@, found %@)"), v19, objc_opt_class());
    v17 = 0;
  }

  return v17;
}

+ (id)_clinicalTypesFromTypes:(id)a3
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_76);
}

uint64_t __40__HKObjectType__clinicalTypesFromTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isClinicalType");
}

+ (id)_nonClinicalTypesFromTypes:(id)a3
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_123);
}

uint64_t __43__HKObjectType__nonClinicalTypesFromTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isClinicalType") ^ 1;
}

+ (id)moveMinuteGoal
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 180);
}

+ (id)exerciseGoal
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 105);
}

+ (id)standGoal
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 104);
}

+ (id)activityGoalScheduleType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 299);
}

+ (id)pauseRingsScheduleType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 300);
}

+ (id)coachingEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 98);
}

+ (id)heartRateType
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 5);
}

+ (id)tachycardiaType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 140);
}

+ (id)bradycardiaType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 147);
}

+ (id)heartStudyEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 141);
}

+ (id)atrialFibrillationEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 156);
}

+ (id)environmentalAudioExposureEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 178);
}

+ (id)headphoneAudioExposureEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 199);
}

+ (id)activityMoveModeChangeType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 190);
}

+ (id)menstrualFlowType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 95);
}

+ (id)contraceptiveType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 193);
}

+ (id)lactationType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 192);
}

+ (id)pregnancyType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 191);
}

+ (id)bloodPressureType
{
  return +[HKObjectType dataTypeWithCode:](HKCorrelationType, "dataTypeWithCode:", 80);
}

+ (id)sleepDurationGoalType
{
  return +[HKObjectType dataTypeWithCode:](HKQuantityType, "dataTypeWithCode:", 197);
}

+ (id)sleepScheduleType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 198);
}

+ (id)lowCardioFitnessEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 236);
}

+ (id)handwashingEventType
{
  return +[HKObjectType dataTypeWithCode:](HKCategoryType, "dataTypeWithCode:", 237);
}

- (BOOL)isHealthRecordsType
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)attachmentSchemaIdentifier
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[HKObjectType isHealthRecordsType](self, "isHealthRecordsType");
  v3 = &HKAttachmentClinicalRecordSchemaIdentifier;
  if (!v2)
    v3 = HKAttachmentObjectSchemaIdentifier;
  return *v3;
}

- (id)_initWithCode:(int64_t)a3
{
  __int16 v3;
  id result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKObjectType;
  result = -[HKObjectType init](&v5, sel_init);
  if (result)
    *((_WORD *)result + 4) = v3;
  return result;
}

- ($E8A27014057A1F053A0599C3679047E8)_definition
{
  return ($E8A27014057A1F053A0599C3679047E8 *)&HKDataTypeDefinitions[6 * self->_code];
}

- (BOOL)isClinicalType
{
  return 0;
}

- (BOOL)supportsExport
{
  return (_BYTE)-[HKObjectType _definition](self, "_definition")[43] & 1;
}

- (BOOL)enabled
{
  return HKTypeIsEnabled(self->_code);
}

- (BOOL)requiresPerObjectAuthorization
{
  return HKDataTypeRequiresPerObjectAuthorization(self->_code);
}

- (id)_predicateForSDKVersionToken:(unint64_t)a3
{
  return 0;
}

- (HKObjectType)parentType
{
  return self->_parentType;
}

+ (id)medicalTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)sharingAuthorizationAllowed
{
  return (BYTE3(HKDataTypeDefinitions[6 * -[HKObjectType code](self, "code") + 5]) >> 2) & 1;
}

- (BOOL)readingAuthorizationAllowed
{
  return (BYTE3(HKDataTypeDefinitions[6 * -[HKObjectType code](self, "code") + 5]) >> 1) & 1;
}

+ (BOOL)_allowAuthorizationForSharingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5
{
  return objc_msgSend(a1, "_allowAuthorizationForSharing:types:entitlements:disallowedTypes:", 1, a3, a4, a5);
}

+ (BOOL)_allowAuthorizationForReadingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5
{
  return objc_msgSend(a1, "_allowAuthorizationForSharing:types:entitlements:disallowedTypes:", 0, a3, a4, a5);
}

+ (BOOL)_allowAuthorizationForSharing:(BOOL)a3 types:(id)a4 entitlements:(id)a5 disallowedTypes:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v8 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = 1;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v8)
        {
          if (objc_msgSend(v17, "sharingAuthorizationAllowed")
            && (HKAllowShareAuthorizationForTypeWithEntitlements(objc_msgSend(v17, "code"), v10) & 1) != 0)
          {
            goto LABEL_12;
          }
        }
        else if (objc_msgSend(v17, "readingAuthorizationAllowed")
               && (HKAllowReadAuthorizationForTypeWithEntitlements(objc_msgSend(v17, "code"), v10) & 1) != 0)
        {
LABEL_12:
          v18 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v11, "addObject:", v17);
        v18 = 0;
LABEL_14:
        v15 &= v18;
      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v13)
        goto LABEL_18;
    }
  }
  v15 = 1;
LABEL_18:

  return v15;
}

+ (HKClinicalType)clinicalTypeForIdentifier:(HKClinicalTypeIdentifier)identifier
{
  NSString *v4;
  void *v5;

  v4 = identifier;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKClinicalType *)v5;
}

+ (id)vaccinationRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)verifiableClinicalRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)medicationRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)clinicalNoteRecordTypeForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_typeWithIdentifier:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
