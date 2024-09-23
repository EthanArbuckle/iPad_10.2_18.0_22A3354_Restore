@implementation ATXSecureCodedTuple

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSecureCodedTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  void *v9;
  ATXSecureCodedTuple *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  Class v24;
  Class v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("firstCls"), v4, 0, CFSTR("com.apple.proactive.ATXSecureCodedTuple"), -1, v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v8
      && (objc_msgSend((id)objc_opt_class(), "allowedClassNames"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "containsObject:", v8),
          v11,
          v12))
    {
      v13 = NSClassFromString(v8);
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0D81610];
        __atxlog_handle_default();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v13, CFSTR("first"), v4, 1, CFSTR("com.apple.proactive.ATXSecureCodedTuple"), -1, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13
          || (objc_msgSend(v4, "error"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
        {
          v10 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    else
    {
      v13 = 0;
    }
    v17 = (void *)MEMORY[0x1E0D81610];
    v18 = objc_opt_class();
    __atxlog_handle_default();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("secondCls"), v4, 0, CFSTR("com.apple.proactive.ATXSecureCodedTuple"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    if (v20
      && (objc_msgSend((id)objc_opt_class(), "allowedClassNames"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "containsObject:", v20),
          v22,
          v23)
      && (v24 = NSClassFromString((NSString *)v20)) != 0)
    {
      v25 = v24;
      v26 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_default();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("second"), v4, 1, CFSTR("com.apple.proactive.ATXSecureCodedTuple"), -1, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28
        || (objc_msgSend(v4, "error"), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, v29))
      {
        v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v28 = 0;
    }
    self = -[_PASTuple2 initWithFirst:second:](self, "initWithFirst:second:", v13, v28);
    v10 = self;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_23:

  return v10;
}

+ (id)allowedClassNames
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA46674](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("INSendMessageIntent"), CFSTR("ATXProactiveSuggestionUIFeedbackSession"), CFSTR("ATXUIFeedbackSessionContext"), CFSTR("ATXPartialIntentHandlingContext"), CFSTR("ATXUnifiedInferredActivityTransition"), CFSTR("ATXUserNotificationLoggingEvent"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_PASTuple2 first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("first"));

  -[_PASTuple2 first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PASTuple2 first](self, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("firstCls"));
  }
  -[_PASTuple2 second](self, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("second"));

  -[_PASTuple2 second](self, "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_PASTuple2 second](self, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("secondCls"));
  }

}

@end
