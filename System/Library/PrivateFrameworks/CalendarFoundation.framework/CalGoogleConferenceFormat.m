@implementation CalGoogleConferenceFormat

- (id)deserializeConferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  CalVirtualConference *v26;
  CalConferenceDeserializationResult *v27;
  uint64_t v28;
  uint64_t v29;
  CalConferenceDeserializationResult *v30;
  CalGoogleConferenceFormat *v32;
  id v33;
  uint64_t v34;
  id obj;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v32 = self;
    objc_msgSend((id)objc_opt_class(), "_delimiterRegex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
      do
      {
        v10 = 0;
        v34 = v8;
        do
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
          if (objc_msgSend(v11, "numberOfRanges", v32) == 2)
          {
            v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
            objc_msgSend(v4, "substringWithRange:", v12, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[CalConferenceURLDetector googleMeetURLsAndPhoneNumbersFromSource:](CalConferenceURLDetector, "googleMeetURLsAndPhoneNumbersFromSource:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "CalMap:", &__block_literal_global_13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "count"))
            {
              v17 = v9;
              v18 = v4;
              objc_msgSend(v15, "lastObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "range");
              v22 = v21;

              objc_msgSend(v14, "substringFromIndex:", v20 + v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
              v25 = objc_claimAutoreleasedReturnValue();

              if (!-[NSObject length](v25, "length"))
              {

                v25 = 0;
              }
              v26 = -[CalVirtualConference initWithTitle:joinMethods:conferenceDetails:source:isWritable:]([CalVirtualConference alloc], "initWithTitle:joinMethods:conferenceDetails:source:isWritable:", 0, v16, v25, 1, 0);
              v27 = [CalConferenceDeserializationResult alloc];
              v28 = objc_msgSend(v11, "range");
              v30 = -[CalConferenceDeserializationResult initWithConference:range:blockTitle:](v27, "initWithConference:range:blockTitle:", v26, v28, v29, &stru_1E2A86598);
              objc_msgSend(v33, "addObject:", v30);

              v4 = v18;
              v9 = v17;
              v8 = v34;
            }
            else
            {
              objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC12000, v25, OS_LOG_TYPE_DEFAULT, "Found Google delimiters but can't add a conference because there are no valid URLs inside", buf, 2u);
              }
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v8);
    }

  }
  return v33;
}

CalVirtualConferenceJoinMethod *__52__CalGoogleConferenceFormat_deserializeConferences___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  CalVirtualConferenceJoinMethod *v5;

  v2 = a2;
  if (objc_msgSend(v2, "resultType") == 2048)
  {
    objc_msgSend(v2, "phoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "phoneURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v3;
  }
  else
  {
    objc_msgSend(v2, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v5 = -[CalVirtualConferenceJoinMethod initWithTitle:URL:isBroadcast:]([CalVirtualConferenceJoinMethod alloc], "initWithTitle:URL:isBroadcast:", 0, v4, 0);
  return v5;
}

- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  return 0;
}

- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3
{
  return 0;
}

+ (id)_delimiterRegex
{
  if (_delimiterRegex_onceToken != -1)
    dispatch_once(&_delimiterRegex_onceToken, &__block_literal_global_8);
  return (id)_delimiterRegex_delimiterRegex;
}

void __44__CalGoogleConferenceFormat__delimiterRegex__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(.*?)%@\n?"), CFSTR("-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"), CFSTR("-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v2, 8, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_delimiterRegex_delimiterRegex;
  _delimiterRegex_delimiterRegex = v0;

}

+ (id)calConferenceSerializationHandle
{
  if (calConferenceSerializationHandle_onceToken_0 != -1)
    dispatch_once(&calConferenceSerializationHandle_onceToken_0, &__block_literal_global_15_0);
  return (id)calConferenceSerializationHandle_logHandle_0;
}

void __61__CalGoogleConferenceFormat_calConferenceSerializationHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.calendarFoundation", "googleConferenceSerialization");
  v1 = (void *)calConferenceSerializationHandle_logHandle_0;
  calConferenceSerializationHandle_logHandle_0 = (uint64_t)v0;

}

@end
