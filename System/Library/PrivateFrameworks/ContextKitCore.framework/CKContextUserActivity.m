@implementation CKContextUserActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextUserActivity)initWithUserActivity:(id)a3
{
  id v5;
  CKContextUserActivity *v6;
  NSUUID *v7;
  NSUUID *uuid;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextUserActivity;
  v6 = -[CKContextUserActivity init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    uuid = v6->_uuid;
    v6->_uuid = v7;

    objc_storeStrong((id *)&v6->_userActivity, a3);
  }

  return v6;
}

- (void)prepareForDonationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSUserActivity *userActivity;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_userActivityData)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    userActivity = self->_userActivity;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__CKContextUserActivity_prepareForDonationWithCompletionHandler___block_invoke;
    v7[3] = &unk_24C0A5058;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    -[NSUserActivity _createUserActivityDataWithOptions:completionHandler:](userActivity, "_createUserActivityDataWithOptions:completionHandler:", 0, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __65__CKContextUserActivity_prepareForDonationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id *v7;
  void (*v8)(void);
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_storeStrong(WeakRetained + 3, a2);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)setEntryDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_recordedTimeIntervalSince1970 = v4;
}

- (NSDate)entryDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", self->_recordedTimeIntervalSince1970);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *bundleIdentifier;
  __CFString *v6;

  -[NSUserActivity title](self->_userActivity, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  bundleIdentifier = (NSString *)v3;
  if (!v4)
  {
    if (!-[NSString length](self->_bundleIdentifier, "length"))
    {
      v6 = CFSTR("No description available");
      goto LABEL_5;
    }
    bundleIdentifier = self->_bundleIdentifier;
  }
  v6 = bundleIdentifier;
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[NSUserActivity hash](self->_userActivity, "hash");
  -[NSUserActivity activityType](self->_userActivity, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  v6 = -[NSString hash](self->_bundleIdentifier, "hash") - v5 + 32 * v5;
  -[NSUserActivity userInfo](self->_userActivity, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[NSUserActivity webpageURL](self->_userActivity, "webpageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[NSUserActivity referrerURL](self->_userActivity, "referrerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10 + 887503681;

  return v12;
}

- (CKContextUserActivity)initWithCoder:(id)a3
{
  id v4;
  CKContextUserActivity *v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  NSUUID *uuid;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSData *userActivityData;
  uint64_t v20;
  NSUserActivity *userActivity;
  CKContextUserActivity *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKContextUserActivity;
  v5 = -[CKContextUserActivity init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    uuid = v5->_uuid;
    v5->_uuid = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = &stru_24C0A5320;
    objc_storeStrong((id *)&v5->_bundleIdentifier, v13);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("recordedTimeInterval"));
    v5->_recordedTimeIntervalSince1970 = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfOccurrences"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = &unk_24C0A6158;
    objc_storeStrong((id *)&v5->_numberOfOccurrences, v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
    v18 = objc_claimAutoreleasedReturnValue();
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "_initWithUserActivityData:", v5->_userActivityData);
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("recordedTimeInterval"), self->_recordedTimeIntervalSince1970);
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfOccurrences, CFSTR("numberOfOccurrence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userActivityData, CFSTR("userActivityData"));

}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)numberOfOccurrences
{
  return self->_numberOfOccurrences;
}

- (void)setNumberOfOccurrences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfOccurrences, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
