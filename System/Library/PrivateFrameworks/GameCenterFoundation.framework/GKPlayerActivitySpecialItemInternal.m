@implementation GKPlayerActivitySpecialItemInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_176 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_176, &__block_literal_global_177);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_175;
}

void __62__GKPlayerActivitySpecialItemInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("activityType");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("message");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("alternateMessage");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("sfSymbol");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("timeStamp");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("instrumentationKey");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_175;
  secureCodedPropertyKeys_sSecureCodedKeys_175 = v0;

}

- (GKPlayerActivitySpecialItemInternal)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivitySpecialItemInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GKPlayerActivitySpecialItemInternal;
  v5 = -[GKPlayerActivitySpecialItemInternal init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkDateFromServerTimestamp:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySpecialItemInternal setTimeStamp:](v5, "setTimeStamp:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySpecialItemInternal setMessage:](v5, "setMessage:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternate-message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySpecialItemInternal setAlternateMessage:](v5, "setAlternateMessage:", v10);

    +[GKPlayerActivitySpecialItemInternal constantToTypeMap](GKPlayerActivitySpecialItemInternal, "constantToTypeMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = objc_msgSend(v13, "integerValue");
    else
      v14 = 0;
    -[GKPlayerActivitySpecialItemInternal setActivityType:](v5, "setActivityType:", v14);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbol"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySpecialItemInternal setSfSymbol:](v5, "setSfSymbol:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySpecialItemInternal setInstrumentationKey:](v5, "setInstrumentationKey:", v16);

  }
  return v5;
}

+ (id)typeToConstantMap
{
  if (typeToConstantMap_onceToken_185 != -1)
    dispatch_once(&typeToConstantMap_onceToken_185, &__block_literal_global_187);
  return (id)typeToConstantMap_typeToConstMap_186;
}

void __56__GKPlayerActivitySpecialItemInternal_typeToConstantMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = &unk_1E75FB0E8;
  v3[0] = CFSTR("ADD_FRIENDS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)typeToConstantMap_typeToConstMap_186;
  typeToConstantMap_typeToConstMap_186 = v0;

}

+ (id)constantToTypeMap
{
  if (constantToTypeMap_onceToken_188 != -1)
    dispatch_once(&constantToTypeMap_onceToken_188, &__block_literal_global_190);
  return (id)constantToTypeMap_constToTypeMap_189;
}

void __56__GKPlayerActivitySpecialItemInternal_constantToTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("ADD_FRIENDS");
  v3[0] = &unk_1E75FB0E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)constantToTypeMap_constToTypeMap_189;
  constantToTypeMap_constToTypeMap_189 = v0;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKPlayerActivitySpecialItemInternal *v13;

  v13 = self;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKPlayerActivitySpecialItemInternal activityType](self, "activityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySpecialItemInternal message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySpecialItemInternal alternateMessage](self, "alternateMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySpecialItemInternal sfSymbol](self, "sfSymbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySpecialItemInternal timeStamp](self, "timeStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySpecialItemInternal instrumentationKey](self, "instrumentationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: {\n            \tactivityType: %@ \n            \tmessage: %@ \n            \talternateMessage: %@ \n            \tsfSymbol: %@ \n            \ttimestamp: %@ \n            \tinstrumentationKey: %@ \n            }"), v4, &v13, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)alternateMessage
{
  return self->_alternateMessage;
}

- (void)setAlternateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_alternateMessage, a3);
}

- (NSString)sfSymbol
{
  return self->_sfSymbol;
}

- (void)setSfSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_sfSymbol, a3);
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_sfSymbol, 0);
  objc_storeStrong((id *)&self->_alternateMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
