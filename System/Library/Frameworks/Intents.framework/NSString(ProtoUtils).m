@implementation NSString(ProtoUtils)

- (id)_intents_decodeFromProto
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (_INSharedClassPrefixRegularExpression_onceToken != -1)
    dispatch_once(&_INSharedClassPrefixRegularExpression_onceToken, &__block_literal_global_26);
  v2 = (id)_INSharedClassPrefixRegularExpression_regularExpression;
  objc_msgSend(v2, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (v4 = objc_msgSend(v3, "rangeAtIndex:", 1), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(a1, "substringWithRange:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_intents_allowedUnarchiverClassesForProtoAsStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_intents_allowedUnarchiverClassesForProtoAsClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v8)
    {
      if ((objc_msgSend(v8, "containsObject:", v7) & 1) == 0)
      {
        v10 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
          v22 = 2112;
          v23 = v7;
          v24 = 2112;
          v25 = v9;
          _os_log_error_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_ERROR, "%s Proto references class %@ which is not an allowed class (%@)", buf, 0x20u);
        }
      }
      objc_msgSend(v3, "range");
      objc_msgSend(a1, "substringFromIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
      if (v13)
      {
        v19 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v13, &v19);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v19;
        if (v6)
        {
          v15 = v6;
        }
        else
        {
          v17 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
            v22 = 2112;
            v23 = v14;
            _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Failed to decode string for proto: %@", buf, 0x16u);
          }
        }

      }
      else
      {
        v6 = a1;
      }

    }
    else
    {
      v16 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
        _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Failed to find allowed classes for proto", buf, 0xCu);
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = a1;
  }

  return v6;
}

- (id)_intents_encodeForProto
{
  return (id)objc_msgSend(a1, "copy");
}

- (id)_intents_allowedUnarchiverClassesForProtoAsClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = a1;
  if (_intents_allowedUnarchiverClassesForProtoAsClasses_onceToken != -1)
    dispatch_once(&_intents_allowedUnarchiverClassesForProtoAsClasses_onceToken, block);
  return (id)_intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses;
}

- (id)_intents_allowedUnarchiverClassesForProtoAsStrings
{
  if (_intents_allowedUnarchiverClassesForProtoAsStrings_onceToken != -1)
    dispatch_once(&_intents_allowedUnarchiverClassesForProtoAsStrings_onceToken, &__block_literal_global_4_86525);
  return (id)_intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings;
}

@end
