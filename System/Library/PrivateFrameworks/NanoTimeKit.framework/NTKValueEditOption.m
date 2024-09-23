@implementation NTKValueEditOption

- (id)dailySnapshotKey
{
  void *v3;
  unint64_t value;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  value = self->_value;
  -[NTKEditOption device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_snapshotKeyForValue:forDevice:", value, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedName
{
  void *v3;
  unint64_t value;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v3 = (void *)objc_opt_class();
  value = self->_value;
  -[NTKEditOption device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedNameForValue:forDevice:", value, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_class();
    v8 = self->_value;
    -[NTKEditOption device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedNameForValidValue:forDevice:", v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_nameLocalizationKeyForValue:forDevice:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ must implement either _localizedNameForValue:forDevice: or _nameLocalizationKeyForValue:forDevice:"), objc_opt_class());
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("_COMPANION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKCompanionClockFaceLocalizedString(v5, CFSTR("name for edit option"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NTKClockFaceLocalizedString(v4, CFSTR("name for edit option"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)localizedNameForAction
{
  void *v3;
  unint64_t value;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  value = self->_value;
  -[NTKEditOption device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedNameForActionForValue:forDevice:", value, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isValidOption
{
  void *v3;
  unint64_t value;
  void *v5;

  v3 = (void *)objc_opt_class();
  value = self->_value;
  -[NTKEditOption device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_valueIsValid:forDevice:", value, v5);

  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_value == v4[2];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return self->_value;
}

+ (id)_optionWithValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a1, "_valueIsValid:forDevice:", a3, v6))
  {
    v7 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v6);
    v7[2] = a3;
  }
  else
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = (id)objc_opt_class();
      v13 = 1024;
      v14 = a3;
      v9 = v12;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to instantiate %@ with invalid value '%u'", (uint8_t *)&v11, 0x12u);

    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_value
{
  return self->_value;
}

+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4
{
  return 1;
}

+ (id)optionByValidatingValueOfInvalidOption:(id)a3
{
  return 0;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKValueEditOption;
  v4 = a3;
  -[NTKEditOption encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_value, CFSTR("EnumeratedValue"), v5.receiver, v5.super_class);

}

- (NTKValueEditOption)initWithCoder:(id)a3
{
  id v4;
  NTKValueEditOption *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKValueEditOption;
  v5 = -[NTKEditOption initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_value = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EnumeratedValue"));

  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKValueEditOption _valueToFaceBundleStringDict](self, "_valueToFaceBundleStringDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NTKValueEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6;
  NTKValueEditOption *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[NTKEditOption initWithDevice:](self, "initWithDevice:", a4);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("object must be a string - invalid value: %@"), v6);
    -[NTKValueEditOption _faceBundleStringToValueDict](v7, "_faceBundleStringToValueDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("invalid value: %@"), v6);
    v7->_value = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v7;
}

- (id)_faceBundleStringToValueDict
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  if (_faceBundleStringToValueDict_onceToken != -1)
    dispatch_once(&_faceBundleStringToValueDict_onceToken, &__block_literal_global_128);
  objc_msgSend((id)_faceBundleStringToValueDict_lock, "lock");
  v3 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    -[NTKValueEditOption _valueToFaceBundleStringDict](self, "_valueToFaceBundleStringDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke_2;
    v14[3] = &unk_1E6BCE190;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

    v10 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
    v6 = v9;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v12);

  }
  objc_msgSend((id)_faceBundleStringToValueDict_lock, "unlock");
  return v6;
}

uint64_t __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_faceBundleStringToValueDict_faceBundleStringToValueDictPerClass;
  _faceBundleStringToValueDict_faceBundleStringToValueDictPerClass = v0;

  v2 = objc_opt_new();
  v3 = (void *)_faceBundleStringToValueDict_lock;
  _faceBundleStringToValueDict_lock = v2;

  return objc_msgSend((id)_faceBundleStringToValueDict_lock, "setName:", CFSTR("-[NTKEditOption _faceBundleStringToValueDict]"));
}

uint64_t __50__NTKValueEditOption__faceBundleStringToValueDict__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (id)_valueToFaceBundleStringDict
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

@end
