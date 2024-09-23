@implementation AMSXDMessage

+ (id)_allowedClassesForDecoding
{
  if (_MergedGlobals_157 != -1)
    dispatch_once(&_MergedGlobals_157, &__block_literal_global_141);
  return (id)qword_1ECEADA08;
}

void __42__AMSXDMessage__allowedClassesForDecoding__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", +[AMSDialogRequest classForKeyedUnarchiver](AMSDialogRequest, "classForKeyedUnarchiver"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEADA08;
  qword_1ECEADA08 = v0;

}

+ (id)_allowedClassNamesForDecoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEADA10 != -1)
    dispatch_once(&qword_1ECEADA10, block);
  return (id)qword_1ECEADA18;
}

void __45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_allowedClassesForDecoding");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_3_1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECEADA18;
  qword_1ECEADA18 = v1;

}

NSString *__45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke_2(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (AMSXDMessage)initWithIdentifier:(id)a3 destination:(id)a4 purpose:(int64_t)a5 object:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSXDMessage *v14;
  AMSXDMessage *v15;
  uint64_t v16;
  NSString *logKey;
  objc_class *v18;
  uint64_t v19;
  NSString *objectClassName;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSXDMessage;
  v14 = -[AMSXDMessage init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_destination, a4);
    v15->_expirationInterval = 2678400.0;
    objc_storeStrong((id *)&v15->_identifier, a3);
    v15->_isReply = 0;
    AMSSetLogKeyIfNeeded();
    v16 = objc_claimAutoreleasedReturnValue();
    logKey = v15->_logKey;
    v15->_logKey = (NSString *)v16;

    objc_storeStrong((id *)&v15->_object, a6);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    objectClassName = v15->_objectClassName;
    v15->_objectClassName = (NSString *)v19;

    v15->_purpose = a5;
  }

  return v15;
}

+ (id)messageFromProtoMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "messageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      objc_msgSend(v3, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode nil protoMessage data", buf, 0x16u);

    }
    v9 = 0;
    goto LABEL_13;
  }
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v3, "messageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  if (v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      objc_msgSend(v3, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode message with error: %{public}@", buf, 0x20u);

    }
LABEL_13:

  }
  return v9;
}

- (AMSXDMessage)initWithJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  AMSXDMessage *v9;
  void *destination;
  id v11;
  AMSXDDevice *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  NSString *messageID;
  void *v20;
  id v21;
  void *v22;
  NSString *v23;
  NSString *objectClassName;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *object;
  void *v38;
  char v39;
  void *origin;
  id v41;
  AMSXDDevice *v42;
  void *v43;
  id v44;
  void *receiptDate;
  id v46;
  NSDate *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  NSString *logKey;
  void *v53;
  id v54;
  objc_super v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  NSString *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyLogKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
LABEL_12:
    v9 = 0;
    goto LABEL_64;
  }
  v8 = v7;

  v9 = 0;
  if (v6 && v8)
  {
    v55.receiver = self;
    v55.super_class = (Class)AMSXDMessage;
    self = -[AMSXDMessage init](&v55, sel_init);
    if (!self)
      goto LABEL_63;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyDestination"));
    destination = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = destination;

      if (!v11)
      {
        v53 = 0;
LABEL_15:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyExpirationInterval"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;

        self->_expirationInterval = (double)objc_msgSend(v14, "integerValue");
        objc_storeStrong((id *)&self->_identifier, v6);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyIsReply"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;

        self->_isReply = objc_msgSend(v16, "BOOLValue");
        objc_storeStrong((id *)&self->_logKey, v7);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyMessageID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;

        messageID = self->_messageID;
        self->_messageID = v18;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyObject"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          v36 = 0;
          goto LABEL_41;
        }
        v21 = v20;

        if (!v21)
        {
          v36 = 0;
          goto LABEL_42;
        }
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v21, 0);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyObjectClassName"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;

        objectClassName = self->_objectClassName;
        self->_objectClassName = v23;

        if (v20)
        {
          v30 = self->_objectClassName;
          if (!v30)
            goto LABEL_39;
          objc_msgSend((id)objc_opt_class(), "_allowedClassNamesForDecoding");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "containsObject:", self->_objectClassName);

          if (v32)
          {
            v33 = (void *)MEMORY[0x1E0CB3710];
            objc_msgSend((id)objc_opt_class(), "_allowedClassesForDecoding");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0;
            objc_msgSend(v33, "unarchivedObjectOfClasses:fromData:error:", v34, v20, &v54);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v54;
            object = self->_object;
            self->_object = v35;

LABEL_41:
LABEL_42:
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyOrigin"));
            origin = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = origin;

              if (!v41)
                goto LABEL_47;
              v42 = -[AMSXDDevice initWithJSONDictionary:]([AMSXDDevice alloc], "initWithJSONDictionary:", v41);
              origin = self->_origin;
              self->_origin = v42;
            }
            else
            {
              v41 = 0;
            }

LABEL_47:
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyObjectPurpose"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v44 = v43;
            else
              v44 = 0;

            self->_purpose = objc_msgSend(v44, "integerValue");
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyReceiptDate"));
            receiptDate = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = receiptDate;

              if (!v46 || !objc_msgSend(v46, "longLongValue"))
                goto LABEL_56;
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v46, "longLongValue"));
              v47 = (NSDate *)objc_claimAutoreleasedReturnValue();
              receiptDate = self->_receiptDate;
              self->_receiptDate = v47;
            }
            else
            {
              v46 = 0;
            }

LABEL_56:
            if (v36)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v48)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v48, "OSLogObject");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v50 = objc_opt_class();
                logKey = self->_logKey;
                *(_DWORD *)buf = 138543874;
                v57 = v50;
                v58 = 2114;
                v59 = logKey;
                v60 = 2114;
                v61 = v36;
                _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode JSON with error: %{public}@", buf, 0x20u);
              }

              goto LABEL_12;
            }

LABEL_63:
            self = self;
            v9 = self;
            goto LABEL_64;
          }
        }
        v30 = self->_objectClassName;
        if (v30)
        {
          objc_msgSend((id)objc_opt_class(), "_allowedClassNamesForDecoding");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "containsObject:", self->_objectClassName);

          v30 = self->_objectClassName;
          if ((v39 & 1) == 0)
          {
            AMSErrorWithFormat(4, CFSTR("AMSXDMessage Error"), CFSTR("Failed to decode JSON dictionary: Unexpected class name: %@"), v25, v26, v27, v28, v29, (uint64_t)self->_objectClassName);
LABEL_40:
            v36 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
        }
LABEL_39:
        AMSErrorWithFormat(4, CFSTR("AMSXDMessage Error"), CFSTR("Failed to decode JSON dictionary: Either object or objectClassName is nil. Class name: %@"), v25, v26, v27, v28, v29, (uint64_t)v30);
        goto LABEL_40;
      }
      v53 = v11;
      v12 = -[AMSXDDevice initWithJSONDictionary:]([AMSXDDevice alloc], "initWithJSONDictionary:", v11);
      destination = self->_destination;
      self->_destination = v12;
    }
    else
    {
      v53 = 0;
    }

    goto LABEL_15;
  }
LABEL_64:

  return v9;
}

- (NSDictionary)JSONDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  AMSXDMessage *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSXDMessage object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_4;
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[AMSXDMessage object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;

  if (v7)
  {
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kJSONKeyObject"));
    -[AMSXDMessage objectClassName](self, "objectClassName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("kJSONKeyObjectClassName"));

LABEL_4:
    -[AMSXDMessage destination](self, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "JSONDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kJSONKeyDestination"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[AMSXDMessage expirationInterval](self, "expirationInterval");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("kJSONKeyExpirationInterval"));

    -[AMSXDMessage identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("kJSONKeyIdentifier"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSXDMessage isReply](self, "isReply"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("kJSONKeyIsReply"));

    -[AMSXDMessage logKey](self, "logKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("kJSONKeyLogKey"));

    -[AMSXDMessage messageID](self, "messageID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("kJSONKeyMessageID"));

    -[AMSXDMessage origin](self, "origin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "JSONDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("kJSONKeyOrigin"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSXDMessage purpose](self, "purpose"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("kJSONKeyObjectPurpose"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[AMSXDMessage receiptDate](self, "receiptDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    objc_msgSend(v22, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("kJSONKeyReceiptDate"));

    v25 = (void *)objc_msgSend(v3, "copy");
    goto LABEL_10;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = objc_opt_class();
    -[AMSXDMessage logKey](self, "logKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v28;
    v34 = 2114;
    v35 = v29;
    v36 = 2114;
    v37 = self;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode message: %{public}@", buf, 0x20u);

  }
  v25 = 0;
LABEL_10:

  return (NSDictionary *)v25;
}

- (id)createProtoMessage
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  AMSXDProtoMessage *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  AMSXDMessage *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v4 || !objc_msgSend(v3, "length"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      -[AMSXDMessage logKey](self, "logKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = self;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode proto message: %{public}@ error: %{public}@", buf, 0x2Au);

    }
    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(AMSXDProtoMessage);
    -[AMSXDMessage logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSXDProtoMessage setLogKey:](v9, "setLogKey:", v10);

    -[AMSXDProtoMessage setMessageData:](v9, "setMessageData:", v3);
  }

  return v9;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AMSXDMessage purpose](self, "purpose");
  -[AMSXDMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSXDMessage logKey](self, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSXDMessage isReply](self, "isReply");
  -[AMSXDMessage messageID](self, "messageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSXDMessage expirationInterval](self, "expirationInterval");
  v10 = v9;
  -[AMSXDMessage receiptDate](self, "receiptDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[AMSXDMessage purpose:%ld; id:%@; logKey:%@; reply:%d; msgID:%@; expInt: %lf; received:%@]"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isExpired
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;

  -[AMSXDMessage receiptDate](self, "receiptDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[AMSXDMessage expirationInterval](self, "expirationInterval");
  v6 = v5;

  if (v6 == -1.0)
    return 0;
  -[AMSXDMessage receiptDate](self, "receiptDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSXDMessage expirationInterval](self, "expirationInterval");
  objc_msgSend(v8, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeIntervalSinceNow");
  v7 = v10 <= 0.0;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  AMSXDMessage *v5;

  -[AMSXDMessage JSONDictionary](self, "JSONDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[AMSXDMessage initWithJSONDictionary:](+[AMSXDMessage allocWithZone:](AMSXDMessage, "allocWithZone:", a3), "initWithJSONDictionary:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSXDMessage JSONDictionary](self, "JSONDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v10))
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kCodingKeyData"));

    if (!v12)
      goto LABEL_11;
  }
  else
  {
    AMSErrorWithFormat(3, CFSTR("AMSXDMessage Error"), CFSTR("Invalid JSON for message: %@"), v5, v6, v7, v8, v9, (uint64_t)self);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_11;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = objc_opt_class();
    -[AMSXDMessage logKey](self, "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode message. Error: %{public}@", buf, 0x20u);

  }
LABEL_11:

}

- (AMSXDMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AMSXDMessage *v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      self = -[AMSXDMessage initWithJSONDictionary:](self, "initWithJSONDictionary:", v6);
      v8 = self;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode JSON. Error: %{public}@", buf, 0x16u);
  }

  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)objectClassName
{
  return self->_objectClassName;
}

- (void)setObjectClassName:(id)a3
{
  objc_storeStrong((id *)&self->_objectClassName, a3);
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (NSDate)receiptDate
{
  return self->_receiptDate;
}

- (void)setReceiptDate:(id)a3
{
  objc_storeStrong((id *)&self->_receiptDate, a3);
}

- (AMSXDDevice)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (AMSXDDevice)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_receiptDate, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_objectClassName, 0);
}

@end
