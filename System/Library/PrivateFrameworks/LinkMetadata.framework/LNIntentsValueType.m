@implementation LNIntentsValueType

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

+ (LNIntentsValueType)personValueType
{
  if (personValueType_onceToken != -1)
    dispatch_once(&personValueType_onceToken, &__block_literal_global_4_752);
  return (LNIntentsValueType *)(id)personValueType_value;
}

+ (LNIntentsValueType)fileValueType
{
  if (fileValueType_onceToken != -1)
    dispatch_once(&fileValueType_onceToken, &__block_literal_global_13);
  return (LNIntentsValueType *)(id)fileValueType_value;
}

+ (LNIntentsValueType)currencyAmountValueType
{
  if (currencyAmountValueType_onceToken != -1)
    dispatch_once(&currencyAmountValueType_onceToken, &__block_literal_global_2_754);
  return (LNIntentsValueType *)(id)currencyAmountValueType_value;
}

- (BOOL)isEqual:(id)a3
{
  LNIntentsValueType *v4;
  LNIntentsValueType *v5;
  LNIntentsValueType *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNIntentsValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNIntentsValueType typeIdentifier](self, "typeIdentifier");
      v8 = v7 == -[LNIntentsValueType typeIdentifier](v6, "typeIdentifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (LNIntentsValueType)initWithTypeIdentifier:(int64_t)a3
{
  LNIntentsValueType *v4;
  LNIntentsValueType *v5;
  LNIntentsValueType *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNIntentsValueType;
  v4 = -[LNValueType _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)typeIdentifierAsString
{
  int64_t v2;

  v2 = -[LNIntentsValueType typeIdentifier](self, "typeIdentifier");
  if ((unint64_t)(v2 - 1) > 0xD)
    return (NSString *)CFSTR("Application");
  else
    return &off_1E39A0E80[v2 - 1]->isa;
}

- (Class)objectClass
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "supportedClassesByTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNIntentsValueType typeIdentifier](self, "typeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)description
{
  int64_t v2;

  v2 = -[LNIntentsValueType typeIdentifier](self, "typeIdentifier");
  if ((unint64_t)(v2 - 1) > 0xD)
    return CFSTR("Application");
  else
    return off_1E39A0E80[v2 - 1];
}

- (LNIntentsValueType)initWithCoder:(id)a3
{
  return -[LNIntentsValueType initWithTypeIdentifier:](self, "initWithTypeIdentifier:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("typeIdentifier")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNIntentsValueType typeIdentifier](self, "typeIdentifier"), CFSTR("typeIdentifier"));

}

+ (LNIntentsValueType)applicationValueType
{
  if (applicationValueType_onceToken != -1)
    dispatch_once(&applicationValueType_onceToken, &__block_literal_global_756);
  return (LNIntentsValueType *)(id)applicationValueType_value;
}

+ (LNIntentsValueType)calendarEventValueType
{
  if (calendarEventValueType_onceToken != -1)
    dispatch_once(&calendarEventValueType_onceToken, &__block_literal_global_1_755);
  return (LNIntentsValueType *)(id)calendarEventValueType_value;
}

+ (LNIntentsValueType)environmentValueType
{
  if (environmentValueType_onceToken != -1)
    dispatch_once(&environmentValueType_onceToken, &__block_literal_global_3_753);
  return (LNIntentsValueType *)(id)environmentValueType_value;
}

+ (LNIntentsValueType)mediaItemValueType
{
  if (mediaItemValueType_onceToken != -1)
    dispatch_once(&mediaItemValueType_onceToken, &__block_literal_global_5_751);
  return (LNIntentsValueType *)(id)mediaItemValueType_value;
}

+ (LNIntentsValueType)mediaSearchValueType
{
  if (mediaSearchValueType_onceToken != -1)
    dispatch_once(&mediaSearchValueType_onceToken, &__block_literal_global_6_750);
  return (LNIntentsValueType *)(id)mediaSearchValueType_value;
}

+ (LNIntentsValueType)messageConversationValueType
{
  if (messageConversationValueType_onceToken != -1)
    dispatch_once(&messageConversationValueType_onceToken, &__block_literal_global_7_749);
  return (LNIntentsValueType *)(id)messageConversationValueType_value;
}

+ (LNIntentsValueType)noteValueType
{
  if (noteValueType_onceToken != -1)
    dispatch_once(&noteValueType_onceToken, &__block_literal_global_8_748);
  return (LNIntentsValueType *)(id)noteValueType_value;
}

+ (LNIntentsValueType)notificationValueType
{
  if (notificationValueType_onceToken != -1)
    dispatch_once(&notificationValueType_onceToken, &__block_literal_global_9_747);
  return (LNIntentsValueType *)(id)notificationValueType_value;
}

+ (LNIntentsValueType)taskValueType
{
  if (taskValueType_onceToken != -1)
    dispatch_once(&taskValueType_onceToken, &__block_literal_global_10_746);
  return (LNIntentsValueType *)(id)taskValueType_value;
}

+ (LNIntentsValueType)taskListValueType
{
  if (taskListValueType_onceToken != -1)
    dispatch_once(&taskListValueType_onceToken, &__block_literal_global_11_745);
  return (LNIntentsValueType *)(id)taskListValueType_value;
}

+ (LNIntentsValueType)timerValueType
{
  if (timerValueType_onceToken != -1)
    dispatch_once(&timerValueType_onceToken, &__block_literal_global_12_744);
  return (LNIntentsValueType *)(id)timerValueType_value;
}

+ (LNIntentsValueType)paymentMethodValueType
{
  if (paymentMethodValueType_onceToken != -1)
    dispatch_once(&paymentMethodValueType_onceToken, &__block_literal_global_14);
  return (LNIntentsValueType *)(id)paymentMethodValueType_value;
}

+ (id)objectClassesForCoding
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "supportedClassesByTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  _QWORD v3[15];
  _QWORD v4[16];

  v4[15] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E39B4808;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1E39B4820;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1E39B4838;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1E39B4850;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1E39B4868;
  v4[4] = objc_opt_class();
  v3[5] = &unk_1E39B4880;
  v4[5] = objc_opt_class();
  v3[6] = &unk_1E39B4898;
  v4[6] = objc_opt_class();
  v3[7] = &unk_1E39B48B0;
  v4[7] = objc_opt_class();
  v3[8] = &unk_1E39B48C8;
  v4[8] = objc_opt_class();
  v3[9] = &unk_1E39B48E0;
  v4[9] = objc_opt_class();
  v3[10] = &unk_1E39B48F8;
  v4[10] = objc_opt_class();
  v3[11] = &unk_1E39B4910;
  v4[11] = objc_opt_class();
  v3[12] = &unk_1E39B4928;
  v4[12] = objc_opt_class();
  v3[13] = &unk_1E39B4940;
  v4[13] = objc_opt_class();
  v3[14] = &unk_1E39B4958;
  v4[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 15);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __44__LNIntentsValueType_paymentMethodValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 13);
  v1 = (void *)paymentMethodValueType_value;
  paymentMethodValueType_value = (uint64_t)v0;

}

void __35__LNIntentsValueType_fileValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 12);
  v1 = (void *)fileValueType_value;
  fileValueType_value = (uint64_t)v0;

}

void __36__LNIntentsValueType_timerValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 6);
  v1 = (void *)timerValueType_value;
  timerValueType_value = (uint64_t)v0;

}

void __39__LNIntentsValueType_taskListValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 8);
  v1 = (void *)taskListValueType_value;
  taskListValueType_value = (uint64_t)v0;

}

void __35__LNIntentsValueType_taskValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 7);
  v1 = (void *)taskValueType_value;
  taskValueType_value = (uint64_t)v0;

}

void __43__LNIntentsValueType_notificationValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 5);
  v1 = (void *)notificationValueType_value;
  notificationValueType_value = (uint64_t)v0;

}

void __35__LNIntentsValueType_noteValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 4);
  v1 = (void *)noteValueType_value;
  noteValueType_value = (uint64_t)v0;

}

void __50__LNIntentsValueType_messageConversationValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 11);
  v1 = (void *)messageConversationValueType_value;
  messageConversationValueType_value = (uint64_t)v0;

}

void __42__LNIntentsValueType_mediaSearchValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 10);
  v1 = (void *)mediaSearchValueType_value;
  mediaSearchValueType_value = (uint64_t)v0;

}

void __40__LNIntentsValueType_mediaItemValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 9);
  v1 = (void *)mediaItemValueType_value;
  mediaItemValueType_value = (uint64_t)v0;

}

void __37__LNIntentsValueType_personValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 3);
  v1 = (void *)personValueType_value;
  personValueType_value = (uint64_t)v0;

}

void __42__LNIntentsValueType_environmentValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 2);
  v1 = (void *)environmentValueType_value;
  environmentValueType_value = (uint64_t)v0;

}

void __45__LNIntentsValueType_currencyAmountValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 14);
  v1 = (void *)currencyAmountValueType_value;
  currencyAmountValueType_value = (uint64_t)v0;

}

void __44__LNIntentsValueType_calendarEventValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 1);
  v1 = (void *)calendarEventValueType_value;
  calendarEventValueType_value = (uint64_t)v0;

}

void __42__LNIntentsValueType_applicationValueType__block_invoke()
{
  LNIntentsValueType *v0;
  void *v1;

  v0 = -[LNIntentsValueType initWithTypeIdentifier:]([LNIntentsValueType alloc], "initWithTypeIdentifier:", 0);
  v1 = (void *)applicationValueType_value;
  applicationValueType_value = (uint64_t)v0;

}

@end
