@implementation _CDMDCSContextualPredicate

+ (id)_predicateForChangeAtKeyPath:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_predicateForChangeAtKeyPath_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4 identifier:(id)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v7 = a5;
  objc_msgSendSuper2(&v10, sel_predicateForKeyPath_equalToValue_, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)_predicateForKeyPath:(id)a3 withPredicate:(id)a4 identifier:(id)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v7 = a5;
  objc_msgSendSuper2(&v10, sel_predicateForKeyPath_withPredicate_, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4 identifier:(id)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v7 = a5;
  objc_msgSendSuper2(&v10, sel_contextualPredicateForKeyPaths_withPredicate_, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)notPredicateWithSubpredicate:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_notPredicateWithSubpredicate_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)andPredicateWithSubpredicates:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_andPredicateWithSubpredicates_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)orPredicateWithSubpredicates:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_orPredicateWithSubpredicates_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)predicateForUserIsLeavingHome
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___CDMDCSContextualPredicate_predicateForUserIsLeavingHome__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForUserIsLeavingHome_initialized != -1)
    dispatch_once(&predicateForUserIsLeavingHome_initialized, v3);
  return (id)predicateForUserIsLeavingHome_contextualPredicate;
}

+ (id)predicateForUserIsArrivingAtHome
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___CDMDCSContextualPredicate_predicateForUserIsArrivingAtHome__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForUserIsArrivingAtHome_initialized != -1)
    dispatch_once(&predicateForUserIsArrivingAtHome_initialized, v3);
  return (id)predicateForUserIsArrivingAtHome_contextualPredicate;
}

+ (id)predicateForPhotosAppBecameForeground
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67___CDMDCSContextualPredicate_predicateForPhotosAppBecameForeground__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForPhotosAppBecameForeground_initialized != -1)
    dispatch_once(&predicateForPhotosAppBecameForeground_initialized, block);
  return (id)predicateForPhotosAppBecameForeground_contextualPredicate;
}

+ (id)predicateForNetworkQualityFair
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___CDMDCSContextualPredicate_predicateForNetworkQualityFair__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForNetworkQualityFair_initialized != -1)
    dispatch_once(&predicateForNetworkQualityFair_initialized, block);
  return (id)predicateForNetworkQualityFair_contextualPredicate;
}

+ (id)predicateForNetworkQualityBad
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___CDMDCSContextualPredicate_predicateForNetworkQualityBad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForNetworkQualityBad_initialized != -1)
    dispatch_once(&predicateForNetworkQualityBad_initialized, block);
  return (id)predicateForNetworkQualityBad_contextualPredicate;
}

+ (id)predicateForIsConnectedToCar
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58___CDMDCSContextualPredicate_predicateForIsConnectedToCar__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForIsConnectedToCar_initialized != -1)
    dispatch_once(&predicateForIsConnectedToCar_initialized, v3);
  return (id)predicateForIsConnectedToCar_contextualPredicate;
}

+ (id)predicateForIsConnectedToAudioBluetoothDevice
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75___CDMDCSContextualPredicate_predicateForIsConnectedToAudioBluetoothDevice__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForIsConnectedToAudioBluetoothDevice_initialized != -1)
    dispatch_once(&predicateForIsConnectedToAudioBluetoothDevice_initialized, v3);
  return (id)predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate;
}

+ (id)predicateForNextAlarm
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51___CDMDCSContextualPredicate_predicateForNextAlarm__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForNextAlarm_initialized != -1)
    dispatch_once(&predicateForNextAlarm_initialized, v3);
  return (id)predicateForNextAlarm_contextualPredicate;
}

+ (id)predicateForFirstPartyWorkoutMatchingTypes:(id)a3 states:(id)a4
{
  void *v4;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v4 = 0;
  v24[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v8 = a4;
    v9 = a3;
    +[_CDContextQueries keyPathForWorkoutDataDictionary](_CDContextQueries, "keyPathForWorkoutDataDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3880];
    +[_CDContextQueries sessionState](_CDContextQueries, "sessionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDContextQueries workoutActivityType](_CDContextQueries, "workoutActivityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDContextQueries isFirstPartyWorkout](_CDContextQueries, "isFirstPartyWorkout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("SELF.%@.value.%K in %@ AND SELF.%@.value.%K in %@ AND SELF.%@.value.%K = %@"), v10, v12, v8, v10, v13, v9, v10, v14, MEMORY[0x1E0C9AAB0]);
    v15 = objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v15;
    objc_msgSend(a1, "_predicateForKeyPath:withPredicate:identifier:", v10, v15, v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDContextQueries sessionState](_CDContextQueries, "sessionState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v24[0] = v8;
    +[_CDContextQueries workoutActivityType](_CDContextQueries, "workoutActivityType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v19;
    objc_msgSend(v9, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v24[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setParameters:", v21);
  }
  return v4;
}

+ (id)predicateForBacklightOnStatus
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___CDMDCSContextualPredicate_predicateForBacklightOnStatus__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForBacklightOnStatus_initialized != -1)
    dispatch_once(&predicateForBacklightOnStatus_initialized, v3);
  return (id)predicateForBacklightOnStatus_contextualPredicate;
}

+ (id)predicateForForegroundApp
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___CDMDCSContextualPredicate_predicateForForegroundApp__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  if (predicateForForegroundApp_initialized != -1)
    dispatch_once(&predicateForForegroundApp_initialized, v3);
  return (id)predicateForForegroundApp_contextualPredicate;
}

+ (id)predicateWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___CDMDCSContextualPredicate_predicateWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateWithIdentifier__initialized != -1)
  {
    dispatch_once(&predicateWithIdentifier__initialized, block);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)predicateWithIdentifier__mapping, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

+ (id)predicates
{
  if (predicates_initialized != -1)
    dispatch_once(&predicates_initialized, &__block_literal_global_11);
  return (id)predicates_predicates;
}

- (_CDMDCSContextualPredicate)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _CDMDCSContextualPredicate *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count") == 2)
  {
    NSStringFromSelector(sel_predicateForFirstPartyWorkoutMatchingTypes_states_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (v9)
    {
      +[_CDContextQueries sessionState](_CDContextQueries, "sessionState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      +[_CDContextQueries workoutActivityType](_CDContextQueries, "workoutActivityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v16 = (void *)v14;
          if (v11 && v14)
          {
            +[_CDMDCSContextualPredicate predicateForFirstPartyWorkoutMatchingTypes:states:](_CDMDCSContextualPredicate, "predicateForFirstPartyWorkoutMatchingTypes:states:", v14, v11);
            v15 = (_CDMDCSContextualPredicate *)objc_claimAutoreleasedReturnValue();
LABEL_24:

            goto LABEL_25;
          }
LABEL_21:
          objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            -[_CDMDCSContextualPredicate initWithIdentifier:parameters:].cold.1();

          v15 = 0;
          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v13, "copy");
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[_CDMDCSContextualPredicate initWithIdentifier:parameters:].cold.2((uint64_t)v13, v17);

      }
      v16 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    goto LABEL_11;
  }
  +[_CDMDCSContextualPredicate predicateWithIdentifier:](_CDMDCSContextualPredicate, "predicateWithIdentifier:", v6);
  v15 = (_CDMDCSContextualPredicate *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
LABEL_10:
      -[_CDMDCSContextualPredicate initWithIdentifier:parameters:].cold.3();
LABEL_11:
    v15 = 0;
LABEL_25:

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (_CDMDCSContextualPredicate)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _CDMDCSContextualPredicate *v8;

  v4 = initWithCoder__initialized;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__initialized, &__block_literal_global_177);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__allowedParameterClasses, CFSTR("parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_CDMDCSContextualPredicate initWithIdentifier:parameters:](self, "initWithIdentifier:parameters:", v6, v7);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CDMDCSContextualPredicate;
  v4 = -[_CDContextualPredicate copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = (void *)-[NSString copy](self->_identifier, "copy");
  objc_msgSend(v4, "setIdentifier:", v5);

  v6 = (void *)-[NSDictionary copy](self->_parameters, "copy");
  objc_msgSend(v4, "setParameters:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *identifier;
  void *v7;
  NSDictionary *parameters;
  uint64_t v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDMDCSContextualPredicate;
  if (-[_CDContextualPredicate isEqual:](&v13, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    identifier = self->_identifier;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(identifier) = -[NSString isEqual:](identifier, "isEqual:", v7);

    if ((_DWORD)identifier)
    {
      parameters = self->_parameters;
      objc_msgSend(v5, "parameters");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (parameters)
        v11 = -[NSDictionary isEqualToDictionary:](parameters, "isEqualToDictionary:", v9);
      else
        v11 = v9 == 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CDMDCSContextualPredicate;
  v3 = -[_CDContextualPredicate hash](&v5, sel_hash);
  return -[NSString hash](self->_identifier, "hash") - v3 + 32 * v3;
}

- (id)plistDictionary
{
  uint64_t v3;
  void *v4;
  NSDictionary *parameters;

  if (self->_parameters)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  parameters = self->_parameters;
  if (parameters)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", parameters, CFSTR("parameters"));
  return v4;
}

- (_CDMDCSContextualPredicate)initWithPlistDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CDMDCSContextualPredicate *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_CDMDCSContextualPredicate initWithIdentifier:parameters:](self, "initWithIdentifier:parameters:", v5, v6);
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:parameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, v0, v1, "Invalid predicate parameters: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithIdentifier:(uint64_t)a1 parameters:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, a2, v5, "Unexpected class for workout types (%@), expected NSSet or NSArray.", v6);

  OUTLINED_FUNCTION_3();
}

- (void)initWithIdentifier:parameters:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18DD73000, v0, v1, "Unknown predicate identifier: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
